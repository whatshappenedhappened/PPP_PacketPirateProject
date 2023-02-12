#include <stdio.h>
#include <pcap.h>
#include <arpa/inet.h>  // arpa/inet.h is included in pcap.h
#include <string.h>
#include <mariadb/mysql.h>
#include <stdlib.h>
// #include <mariadb/mysql.h>
/* Ethernet addresses are 6 bytes */
#define ETHER_ADDR_LEN	6
#define SIZE_ETHERNET   14

// Going to add got_packet and structures to use
typedef struct dev_ip{
    unsigned char oct_first;
    unsigned char oct_second;
    unsigned char oct_third;
    unsigned char oct_fourth;
} DEV_IP;

DEV_IP devnet(unsigned char *);
int devmask(bpf_u_int32);


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





void got_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *packet);

int main() {

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

    if (pcap_findalldevs(&dev, errbuf) == PCAP_ERROR) {
        printf("pcap_findalldevs() failed : %s\n", errbuf);
        return 1;
    } else {
        devc = dev->name;
        printf("pcap_findalldevs() OK.\t[Device: %s]\n", devc);
        }

    if (pcap_lookupnet(devc, &net, &mask, errbuf) == PCAP_ERROR) {
        printf("pcap_lookupnet() failed : %s\n", errbuf);
        return 2;
    } else {
        struct in_addr ip;
        struct in_addr subnet;
        ip.s_addr = net;
        subnet.s_addr = mask;
        printf("pcap_lookupnet() OK.\t[IP: %s / Subnet: %s]\n", inet_ntoa(ip), inet_ntoa(subnet));
    }

    handle = pcap_open_live(devc, BUFSIZ, 1, 1000, errbuf);
    if (handle == NULL) {
        printf("pcap_open_live() failed : %s", errbuf);
        return 3;
    } else { printf("pcap_open_live() OK.\t[Handler: %p]\n", handle);}

    if (pcap_compile(handle, &fp, filter, 0, net) == PCAP_ERROR) {
        printf("pcap_compile() failed : %s2\n",pcap_geterr(handle));
        return 4;
    } else { printf("pcap_compile() OK.\t[Filter: %s]\n", filter);}
    
    if (pcap_setfilter(handle, &fp) == PCAP_ERROR) {
        printf("pcap_setfilter() failed : %s\n", pcap_geterr(handle));
        return 5;
    } else { printf("pcap_setfilter() OK.\n"); }


    printf("\n\n");

    // packet = pcap_next(handle, &header);
    // printf("Packet just got jacked : [%d]bytes\n", header.len);

    pcap_loop(handle, 5, got_packet, NULL);

    if(handle != NULL) {
        pcap_close(handle);
        handle = NULL;
    } else { printf("\nHandle was closed\n"); }

    return 0;
}

void got_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
    layer2 *ethernet = (layer2 *)(packet);
    layer3 *ip = (layer3 *)(packet + SIZE_ETHERNET);
    u_int ip_size = 4 * IP_HL(ip);
    layer4 *th = (layer4 *)(packet + SIZE_ETHERNET + ip_size);
    u_int tcp_size = 4 * TH_OFF(th);
    const char* payload = (char *)(packet + SIZE_ETHERNET + ip_size + tcp_size);
    //MySQL
    MYSQL *connection = NULL, conn;
    MYSQL_RES *sql_result;
    MYSQL_ROW sql_row;
    char *query_string = malloc(10485760);
    memset(query_string, 0x00, 10485760);

    // every data from packet will be stored as big-endian way except the type of char(1 byte)
    /* ethernet output */
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

    /* ip output */
    char srcip[16], dstip[16];
    char *srcbf = inet_ntoa(ip->ip_src);
    strcpy(srcip, srcbf);
    char *dstbf = inet_ntoa(ip->ip_dst);
    strcpy(dstip, dstbf);

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


    /* payload output */
    printf("[PAYLOAD]\n");
    printf("%s\n", payload);
    printf("==================================\n\n");
    //Query
    mysql_init(&conn);
    connection = mysql_real_connect(&conn, "localhost", "root", "root", "blocker", 3306, NULL, 0);
    sprintf(query_string, "SELECT ipv4, domain_name FROM domains WHERE ipv4 = '%s'", dstip);
    mysql_query(connection, query_string);
    sql_result = mysql_store_result(connection);
    printf("[SQL RESULT]\n");
    if ((sql_row = mysql_fetch_row(sql_result)) != NULL) {
        printf("Found IP : %s\t%s\n\n", sql_row[0], sql_row[1]);
    } else printf("-- No IP Found --\n\n");
    //Close
    mysql_close(&conn);
    mysql_free_result(sql_result);
    sql_result = NULL;
    printf("==================================\n\n");

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