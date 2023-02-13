#include <stdio.h>
#include <pcap.h>
#include <arpa/inet.h>  // arpa/inet.h is included in pcap.h
#include <string.h>
#include <mariadb/mysql.h>
#include <stdlib.h>

// FOR OUTPUT OPTION //
#define OUTPUT_MODE o_mode      // how the hell can i make this work
#define OUTPUT_MODE_EX tmi

/* STATIC VARIABLES FOR MYSQL */
//MySQL
static MYSQL *connection, conn;
static MYSQL_RES *sql_result;
static MYSQL_ROW sql_row;       // must be freed before the program closed


/* Ethernet addresses are 6 bytes */
#define ETHER_ADDR_LEN	6
#define SIZE_ETHERNET   14

/* STRUCTURE DEFINITION PART */
// Going to add got_packet and structures to use
typedef struct dev_ip{
    unsigned char oct_first;
    unsigned char oct_second;
    unsigned char oct_third;
    unsigned char oct_fourth;
} DEV_IP;

/* Ethernet header */
typedef struct sniff_ethernet {
	u_char ether_dhost[ETHER_ADDR_LEN]; /* Destination host address */
	u_char ether_shost[ETHER_ADDR_LEN]; /* Source host address */
	u_short ether_type; /* IP? ARP? RARP? etc */
} layer2;

/* IP header */
typedef struct sniff_ip {
	u_char ip_vhl;		/* version << 4 | header length >> 2 */
	u_char ip_tos;		/* type of service */
	u_short ip_len;		/* total length */
	u_short ip_id;		/* identification */
	u_short ip_off;		/* fragment offset field */
#define IP_RF 0x8000		/* reserved fragment flag */
#define IP_DF 0x4000		/* don't fragment flag */
#define IP_MF 0x2000		/* more fragments flag */
#define IP_OFFMASK 0x1fff	/* mask for fragmenting bits */
	u_char ip_ttl;		/* time to live */
	u_char ip_p;		/* protocol */
	u_short ip_sum;		/* checksum */
	struct in_addr ip_src,ip_dst; /* source and dest address */
} layer3;
#define IP_HL(ip)		(((ip)->ip_vhl) & 0x0f) // & opt for left nibble, cuz ip header's maximum size is 20~60bytes
#define IP_V(ip)		(((ip)->ip_vhl) >> 4)   // bit opt 4 times to left for right nibble

/* TCP header */
typedef u_int tcp_seq;

typedef struct sniff_tcp {
	u_short th_sport;	/* source port */
	u_short th_dport;	/* destination port */
	tcp_seq th_seq;		/* sequence number */
	tcp_seq th_ack;		/* acknowledgement number */
	u_char th_offx2;	/* data offset, rsvd */
#define TH_OFF(th)	(((th)->th_offx2) >> 4) // there was a typo in original code. original : #define TH_OFF(th)	(((th)->th_offx2) > 4)
	u_char th_flags;
#define TH_FIN 0x01
#define TH_SYN 0x02
#define TH_RST 0x04
#define TH_PUSH 0x08
#define TH_ACK 0x10
#define TH_URG 0x20
#define TH_ECE 0x40
#define TH_CWR 0x80
#define TH_FLAGS (TH_FIN|TH_SYN|TH_RST|TH_ACK|TH_URG|TH_ECE|TH_CWR)
	u_short th_win;		/* window */
	u_short th_sum;		/* checksum */
	u_short th_urp;		/* urgent pointer */
}layer4;
///////////////////////////////

/* FUNCTION DECLARATION PART */
DEV_IP devnet(unsigned char *);
int devmask(bpf_u_int32);

void got_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *packet);

int sendraw(const u_char *packet, const struct pcap_pkthdr *header);

int sql_get_domain(char *, int);       // returns 1 on matched url found, 0 on no url found
// void init_pcap();
// void init_mysql();
///////////////////////////////

int main(int argc, char *argv[]) {

    pcap_if_t *dev;
    char errbuf[PCAP_ERRBUF_SIZE];
    char *devc;
    //----
    bpf_u_int32 net, mask;
    //----
    pcap_t *handle;
    //----
    struct bpf_program fp;
    char *filter = "tcp port 80";
    //----
    const char *packet;
    struct pcap_pkthdr header;
    unsigned int p_loop_cnt = 5;

    // DEV_IP //
    u_char preFix;
    // MYSQL //
    connection = NULL;
    // OUTPUT MODE //
    unsigned char o_mode = 1;
    unsigned char tmi = 0;
    char * o_output = "Default";
    int temp;
    printf("\n");
    /* OUTPUT MODE */
    if (argc > 1 && argv[1]) {      // 실행시 입력값에 따라 상수 매크로의 값을 조절, -a는 모두 출력, 기본은 1
        if(strstr(argv[1], "-a") != NULL) {
            o_mode = 1;
            tmi = 1;
            o_output = "A Friendly Neighbor";
            printf("%d\n", OUTPUT_MODE);
        } else if (strstr(argv[1], "-h") != NULL) {
            o_mode = 0;
            o_output = "Hitman";
            printf("%d\n", OUTPUT_MODE);
        }
    }
    printf("Callsign = \" %s \"\n", o_output);


    if (pcap_findalldevs(&dev, errbuf) == PCAP_ERROR) {
        printf("pcap_findalldevs() failed : %s\n", errbuf);
        return 1;
    } else {
        devc = dev->name;
        printf("pcap_findalldevs() OK.\t\t\t[ Device ]\t%s\n", devc);
    }
    
    if (pcap_lookupnet(devc, &net, &mask, errbuf) == PCAP_ERROR) {
        printf("pcap_lookupnet() failed : %s\n", errbuf);
        return 2;
    } else {
        struct in_addr ip;
        struct in_addr subnet;
        ip.s_addr = net;
        // subnet.s_addr = mask;
        preFix = devmask(mask);
        printf("pcap_lookupnet() OK.\t\t\t[ IP ]\t\t%s/%d\n", inet_ntoa(ip), preFix);
    }

    handle = pcap_open_live(devc, BUFSIZ, 1, 1000, errbuf);
    if (handle == NULL) {
        printf("pcap_open_live() failed : %s", errbuf);
        return 3;
    } else { printf("pcap_open_live() OK.\t\t\t[ Handler ]\t%p\n", handle);}

    if (pcap_compile(handle, &fp, filter, 0, net) == PCAP_ERROR) {
        printf("pcap_compile() failed : %s2\n",pcap_geterr(handle));
        return 4;
    } else { printf("pcap_compile() OK.\t\t\t[ Filter ]\t%s\n", filter);}
    
    if (pcap_setfilter(handle, &fp) == PCAP_ERROR) {
        printf("pcap_setfilter() failed : %s\n", pcap_geterr(handle));
        return 5;
    } else { printf("pcap_setfilter() OK.\n"); }

    printf("\n");

    // MYSQL CONNECTION
    if(mysql_init(&conn) == NULL) {
        fprintf(stderr, "mysql_init() failed.\n");
        return 6;
    } else { printf("mysql_init() OK.\n"); }
    connection = mysql_real_connect(&conn, "localhost", "root", "root", "blocker", 3306, NULL, 0);
    if (connection == NULL) {
        fprintf(stderr, "mysql_real_connect() failed : %s\n", mysql_error(&conn));
        return 7;
    } else { printf("mysql_real_connect() OK.\n"); }


    printf("\n\n");

    // packet = pcap_next(handle, &header);
    // printf("Packet just got jacked : [%d]bytes\n", header.len);

    // PCAP CLOSE
    pcap_loop(handle, p_loop_cnt, got_packet, NULL);

    if (handle != NULL) {
        pcap_close(handle);
        handle = NULL;
    } else { puts("\nhandle is already closed\n"); }

    // MYSQL CLOSE
    if (&conn != NULL) {
        mysql_close(&conn);
    } else { puts("\nconn is already closed\n"); }
    if (sql_result != NULL) {
        mysql_free_result(sql_result);
        sql_result = NULL;
    } else { puts("\nsql_result is already closed\n"); }
    sql_result = NULL;

    return 0;
}

void got_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
    layer2 *ethernet = (layer2 *)(packet);
    layer3 *ip = (layer3 *)(packet + SIZE_ETHERNET);
    u_int ip_size = 4 * IP_HL(ip);
    layer4 *th = (layer4 *)(packet + SIZE_ETHERNET + ip_size);
    u_int tcp_size = 4 * TH_OFF(th);
    const char* payload = (char *)(packet + SIZE_ETHERNET + ip_size + tcp_size);
    char* find_host = NULL;
    int url_size = 0;
    char url_name[512];
    char *url_from_db = NULL;
    int sql_get_flag = 0;

    /* ip output variables */
    char srcip[16], dstip[16];
    char *srcbf = inet_ntoa(ip->ip_src);
    strcpy(srcip, srcbf);
    char *dstbf = inet_ntoa(ip->ip_dst);
    strcpy(dstip, dstbf);

    // MYSQL
    char *query_string = malloc(10485760);      // must be freed before the function closed
    memset(query_string, 0x00, 10485760);

    // FINDING HOST
    memset(url_name, 0x00, sizeof(url_name));
    find_host = strstr(payload, "Host:");
    if (find_host != NULL) {
        find_host += 6;
        url_size = strstr(find_host, "\x0d\x0a") - find_host;
        memcpy(url_name, find_host, url_size);
        printf("URL : %s\n", url_name);
        sql_get_flag = sql_get_domain(url_name, url_size);
        printf("sql_get_flag = %d\n", sql_get_flag);
    }
    if (sql_get_flag == 1) {
        sendraw(packet, header);
    }
    // sendraw(packet, header);

    // Query
    // sprintf(query_string, "SELECT ipv4, domain_name FROM tb_domains WHERE ipv4 = '%s'", dstip);
    // mysql_query(connection, query_string);
    // sql_result = mysql_store_result(connection);
    // sql_row = mysql_fetch_row(sql_result);

    // every data from packet will be stored as big-endian way except the type of char(1 byte)
    /* ethernet output */
    #if OUTPUT_MODE
    printf("[Ethernet]\n");
    printf("dstMac= %02x:%02x:%02x:%02x:%02x:%02x\n", ethernet->ether_dhost[0],
                        (*ethernet).ether_dhost[1],
                        ethernet->ether_dhost[2],
                        ethernet->ether_dhost[3],
                        ethernet->ether_dhost[4],
                        ethernet->ether_dhost[5]
                        );
    printf("srcMac= %02x:%02x:%02x:%02x:%02x:%02x\n", ethernet->ether_shost[0],
                        (*ethernet).ether_shost[1],
                        ethernet->ether_shost[2],
                        ethernet->ether_shost[3],
                        ethernet->ether_shost[4],
                        ethernet->ether_shost[5]
                        );
    printf("ethType= %x\n", ethernet->ether_type);
    printf("\n");

    printf("[IP]\n");
    printf("srcIp= %s\n", srcip);
    printf("dstIp= %s\n", dstip);
    // printf("sType= %d\n", ip->ip_tos);
    printf("totalLen= %hd bytes\n", ntohs(ip->ip_len));
    printf("headerLen= %hd bytes\n", IP_HL(ip) * 4);
    printf("TTL= %d\n", ip->ip_ttl);

    printf("\n");


    /* tcp output */
    printf("[TCP]\n");
    printf("srcPort= %d\n", ntohs(th->th_sport));
    printf("dstPort= %d\n", ntohs(th->th_dport));
    printf("seq= %u\n", ntohl(th->th_seq));
    printf("ack= %u\n", ntohl(th->th_ack));
    printf("headerLen= %d\n", TH_OFF(th) * 4);
    // printf("%x\n");
    printf("\n");
    #endif

    /* payload output */
    #if OUTPUT_MODE
    printf("[PAYLOAD]\n");
    printf("%s\n", payload);
    printf("==================================\n\n");
    printf("[SQL RESULT]\n");
    if (sql_row != NULL) {
        printf("Found IP : %s\t%s\n\n", sql_row[0], sql_row[1]);
    } else printf("-- No IP Found --\n\n");
    printf("==================================\n\n");
    #endif

    free(query_string);
}

int sendraw(const u_char *packet, const struct pcap_pkthdr *header) {
    printf("YOU'RE IN sendraw()!!\n");
    return 0;
}

int sql_get_domain(char * url_name, int url_size) {
    char *query_string = (char *)malloc(768);      // must be freed before the function closed
    memset(query_string, 0x00, 768);

    sprintf(query_string, "SELECT domain_name FROM tb_domains WHERE domain_name = '%s' LIMIT 1;", url_name);

    sql_row = NULL;

    if (mysql_query(connection, query_string) == 0) {
        #if OUTPUT_MODE_EX
        puts("OK : SQL sent to DB server.");
        #endif
    } else {
        free(query_string);
        return 0;
    }

    if ((sql_result = mysql_store_result(connection)) != NULL) {
       #if OUTPUT_MODE_EX
       puts("OK : SQL result stored.");
       #endif
    } else {
        free(query_string);
        return 0;
    }

    if ((sql_row = mysql_fetch_row(sql_result)) != NULL) {      // 기존 함수와 달리 결과가 없으면 NULL을 반환하는 mysql_fetch_row()의 성질을 이용하여 url이 db에 있는지 없는지를 비교
        #if OUTPUT_MODE
        puts("\n[Found a matched url from DB server]\n");
        #endif
        free(query_string);
        return 1;
    } else {
        #if OUTPUT_MODE
        puts("[No matched url from DB server]\n");
        #endif
        free(query_string);
        return 0;
    }

    free(query_string);
    return 0;
}



//////////////////// CUSTOMIZED IP CONVERT FUNCTION ////////////////////
DEV_IP devnet(unsigned char *net) {
    // unsigned char *oct = (unsigned char *)net;
    DEV_IP dip;
    dip.oct_first = *net;
    dip.oct_second = *(net + 1);
    dip.oct_third = net[2];
    dip.oct_fourth = net[3];

    return dip;
}

int devmask(bpf_u_int32 mask) {
    int cnt = 0;

    while (mask != 0) {
        cnt++;
        mask /= 2;
    }
    return cnt;
}
////////////////////////////////////////////////////////////////////////