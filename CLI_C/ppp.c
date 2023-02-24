#include <stdio.h>
#include <pcap.h>
#include <arpa/inet.h>  // arpa/inet.h is included in pcap.h
#include <string.h>
#include <mariadb/mysql.h>
#include <stdlib.h>
#include <sys/socket.h> // guess this is already included at some header
#include <unistd.h> // for no warning of close()

// FOR OUTPUT OPTION //
// #define OUTPUT_MODE o_mode      // how the hell can i make this work
// #define OUTPUT_MODE_EX tmi
static int output_flag = 1;
static int output_select = 1;

/* STATIC VARIABLES FOR MYSQL */
//MySQL
static MYSQL *connection, conn;
static MYSQL_RES *sql_result;
static MYSQL_ROW sql_row;       // must be freed before the program closed

/* For print_packet_enum() */
#define SENDRAW_TYPE 1;
#define PACKET_TYPE 0;


/* Ethernet addresses are 6 bytes */
#define ETHER_ADDR_LEN	6       // ethernet address will always be 6B (0x00:0x00:0x00:0x00:0x00:0x00)
#define SIZE_ETHERNET   14      // ethernet header size, 6B of dst_MAC / 6B of src_MAC / 2B of Ether_type

/* STRUCTURE DEFINITION PART */
// Going to add got_packet and structures to use
typedef struct __dev_ip {
    unsigned char oct_first;
    unsigned char oct_second;
    unsigned char oct_third;
    unsigned char oct_fourth;
} DEV_IP;

typedef struct __http_payload {
    char http[306];             // http string
    char html[1024];             // html string
    unsigned int http_size;     // byte size of http string
    unsigned int html_size;     // byte size of html string
    unsigned int data_size;     // http_size + html size
} http_payload;

typedef struct __pseudo_header {
    u_int32_t s_ip;     // source ip address
    u_int32_t d_ip;     // destination ip address
    u_int8_t rsvd;      // 8 bits reserved, always 0
    u_int8_t prtc;      // protocol from ip header, tcp checksum will be 6
    u_int16_t tcp_len;  // length of tcp header + data
} pseudo_header;

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

///// pcap_breakloop() test
// pcap_t *handle;
///

/* FUNCTION DECLARATION PART */
DEV_IP devnet(unsigned char *);
int devmask(bpf_u_int32);
void payloader(http_payload *);
void bongloader(http_payload *);

unsigned int get_checksum(unsigned short *cksum_packet, unsigned int cksum_len);

int sql_get_domain(char *url_name);       // returns 1 on matched url found, 0 on no url found

int sql_get_domain(char *url_name);       // returns 1 on matched url found, 0 on no url found

int sql_logger(char *srcip, char *dstip, u_short srcport, u_short dstport, char *url_name, int result, bpf_u_int32 packet_len);

void got_packet(u_char *handle, const struct pcap_pkthdr *header, const u_char *packet);

int sendraw(const u_char *packet, const struct pcap_pkthdr *header);

// Print function
void print_packet_enum(const u_char *packet, const struct pcap_pkthdr *header, int is_sendraw);
void print_packet_hex(const u_char *packet, bpf_u_int32 packet_len);
///////////////////

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
    // unsigned char o_mode = 1;
    // unsigned char tmi = 0;
    char * o_output = "Default";
    int temp;
    char func_str[1024];
    int func_str_len = 0;
    printf("\n");
    /* OUTPUT MODE */
    if (argc > 1 && argv[1]) {      // 실행시 입력값에 따라 상수 매크로의 값을 조절, -a는 모두 출력, 기본은 1
        if (argc < 3 && (strstr(argv[1], "--help") != NULL || strstr(argv[1], "-h") != NULL || strstr(argv[1], "-m") != NULL)) {
                puts("--------------------------------------------------------------\n");
                puts("[ Packet Pirate Project Helper ]\n");
                puts("./ppp -h | ./ppp --help | ./ppp -m\t show PPP help");
                puts("");
                puts("./ppp\t\t Default output, run PPP as Default mode (Plain text for all packets)");
                puts("./ppp -m h\t Minimum output, run PPP as Hitman mode (Minimal informations for blocked pages)");
                puts("./ppp -m a\t Maximum output, run PPP as A friendly neighbor mode (Plain text & HexCode for all packets)");
                puts("");
                puts("CAUTION!");
                puts("PPP is due to the nature of the program that requires ");
                puts("fast processing of packets, all output takes place af");
                puts("ter the packet is processed.");
                puts("\n--------------------------------------------------------------");
                puts("");

                exit(0);
        } else if (argc < 4 && strstr(argv[1], "-m") != NULL) {
            if(strstr(argv[2], "a") != NULL) {
                output_select = 2;
                output_flag = output_select;
                o_output = "A Friendly Neighbor";
            } else if (strstr(argv[2], "h") != NULL) {
                output_select = 0;
                output_flag = output_select;
                o_output = "Hitman";
            }
        }
    }
    printf("Callsign = \" %s \"\n", o_output);


    if (pcap_findalldevs(&dev, errbuf) == PCAP_ERROR) {
        printf("pcap_findalldevs() failed : %s\n", errbuf);
        return 1;
    } else {
        devc = dev->name;
        func_str_len = sprintf(func_str, "pcap_findalldevs() OK.\t\t\t[ Device ]\t%s\n", devc);
    }
    devc = "lo";
    
    if (pcap_lookupnet(devc, &net, &mask, errbuf) == PCAP_ERROR) {
        printf("pcap_lookupnet() failed : %s\n", errbuf);
        return 2;
    } else {
        struct in_addr ip;
        struct in_addr subnet;
        ip.s_addr = net;
        // subnet.s_addr = mask;
        preFix = devmask(mask);
        func_str_len += sprintf(func_str + func_str_len, "pcap_lookupnet() OK.\t\t\t[ IP ]\t\t%s/%d\n", inet_ntoa(ip), preFix);
    }

    handle = pcap_open_live(devc, BUFSIZ, 1, 1000, errbuf);
    if (handle == NULL) {
        printf("pcap_open_live() failed : %s", errbuf);
        return 3;
    } else { func_str_len += sprintf(func_str + func_str_len, "pcap_open_live() OK.\t\t\t[ Handler ]\t%p\n", handle);}

    if (pcap_compile(handle, &fp, filter, 0, net) == PCAP_ERROR) {
        printf("pcap_compile() failed : %s2\n",pcap_geterr(handle));
        return 4;
    } else { func_str_len += sprintf(func_str + func_str_len, "pcap_compile() OK.\t\t\t[ Filter ]\t%s\n", filter);}
    
    if (pcap_setfilter(handle, &fp) == PCAP_ERROR) {
        printf("pcap_setfilter() failed : %s\n", pcap_geterr(handle));
        return 5;
    } else { func_str_len += sprintf(func_str + func_str_len, "pcap_setfilter() OK.\n"); }

    printf("\n");

    // MYSQL CONNECTION
    if(mysql_init(&conn) == NULL) {
        fprintf(stderr, "mysql_init() failed.\n");
        return 6;
    } else { func_str_len += sprintf(func_str + func_str_len, "mysql_init() OK.\n"); }
    connection = mysql_real_connect(&conn, "localhost", "root", "root", "blocker", 3306, NULL, 0);
    if (connection == NULL) {
        fprintf(stderr, "mysql_real_connect() failed : %s\n", mysql_error(&conn));
        return 7;
    } else { func_str_len += sprintf(func_str + func_str_len, "mysql_real_connect() OK.\n"); }

    if (output_flag > 0)
        printf("%s", func_str);


    printf("\n\n");

    // packet = pcap_next(handle, &header);
    // printf("Packet just got jacked : [%d]bytes\n", header.len);
    // PCAP LOOP //
    pcap_loop(handle, 0, got_packet, (u_char *)handle);
    // --------- //


    // PCAP CLOSE
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
    puts("\n\n\n THANK YOU FOR USING PPP");
    puts("\n\n\n The program ended successfully \n\n\n");
    return 0;
}

void got_packet(u_char *handle_addr, const struct pcap_pkthdr *header, const u_char *packet) {
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
    u_short srcport;
    u_short dstport;

    /* ip output variables */
    char srcip[16], dstip[16];
    char *srcbf = inet_ntoa(ip->ip_src);
    strcpy(srcip, srcbf);
    char *dstbf = inet_ntoa(ip->ip_dst);
    strcpy(dstip, dstbf);

    srcport = ntohs(th->th_sport);
    dstport = ntohs(th->th_dport);

    int sendraw_result = 0;     //

                                        // 23-02-16 Appended //
    // print_packet_hex(packet, header);

    // MYSQL
    // char *query_string = malloc(1048);      // must be freed before the function closed
    // memset(query_string, 0x00, 1048);
    // FINDING HOST
    memset(url_name, 0x00, sizeof(url_name));
    find_host = strstr(payload, "Host:");
    if (find_host != NULL) {
        find_host += 6;
        url_size = strstr(find_host, "\x0d\x0a") - find_host;
        memcpy(url_name, find_host, url_size);
        printf("URL : %s\n", url_name);
        if (strcmp(url_name, "ppp.exit.com") == 0) {
            puts("\n\nALERT : pcap_loop() closed\n\n");
            pcap_breakloop((pcap_t *)handle_addr);
        }
        sql_get_flag = sql_get_domain(url_name);
        // printf("URL : %s\n", url_name);
        // printf("sql_get_flag = %d\n\n\n", sql_get_flag);
    }

    if (sql_get_flag == 1) {
        sendraw_result = sendraw(packet, header);
        printf("\tALERT : \"%s\" to \"%s\" blocked.\n", srcip, url_name);
        printf("\n\t---------------------------------------------------------\n\n");
        if (sql_logger(srcip, dstip, srcport, dstport, url_name, sendraw_result, header->len) == 0) {
                fprintf(stderr, "ERROR : sql_logger() failed.\n");
        }
    }
    
    if (output_flag == 2) {
        print_packet_enum(packet, header, 0);
        print_packet_hex(packet, header->len);
        printf("\n\t---------------------------------------------------------\n\n");
        output_flag = 0;
    } else if (output_flag == 1) {
        print_packet_enum(packet, header, 0);
        printf("\n\t---------------------------------------------------------\n\n");
        output_flag = 0;
    }
    
    // Query
    // sprintf(query_string, "SELECT ipv4, domain_name FROM tb_domains WHERE ipv4 = '%s'", dstip);
    // mysql_query(connection, query_string);
    // sql_result = mysql_store_result(connection);
    // sql_row = mysql_fetch_row(sql_result);

    // every data from packet will be stored as big-endian way except the type of char(1 byte)
    /* ethernet output */

    output_flag = output_select;
}
/*
plus all the cksum_packet data as 2bytes each.
if there is carry nibble(over 2bytes), cut the carry nibble and plus it to rest of 2bytes.
get the 1's complement of sum.
*/
unsigned int get_checksum(unsigned short *cksum_packet, unsigned int cksum_len) {
    unsigned int sum = 0;
    unsigned int carry_nibble = 0;
    while (cksum_len > 1) {
        // printf("sum = %d\tpacket = %d\t len = %d\n", sum, *cksum_packet, cksum_len);
        sum += *cksum_packet++;
        cksum_len -= 2;
    }

    if (cksum_len) {
        // printf("additional\nsum = %d\tpacket = %d\t len = %d\n", sum, *(unsigned char *)cksum_packet, cksum_len);
        sum += *cksum_packet++;
        cksum_len--;
    }

    carry_nibble = sum >> 16;
    sum += carry_nibble;
    carry_nibble = sum + ~sum;
    
    if (output_flag > 1) {
        if (carry_nibble != (unsigned int)*(unsigned int *)&"\xff\xff\xff\xff") {
            printf("WARNING : checksum value isn't correct : %u\n", ~sum);
        } else { printf("ALERT : checksum value is identified : %u\n", ~sum); }
    }
    printf("\n");

    return ~sum;
}

int sendraw(const u_char *packet_ref, const struct pcap_pkthdr *header) {

    char packet_buffer[1464];
    char ethdr_buffer[sizeof(layer2)];
    layer2 *ether_ref = (layer2 *)packet_ref;
    unsigned int vlan_size = 0;
    layer2 *ethdr;
    layer3 *iphdr;
    unsigned int iphdr_size = sizeof(layer3);
    layer4 *tcphdr;
    unsigned int tcphdr_size = sizeof(layer4);
    int send_stat = 0;
    int i;

    // for ack num
    u_int ref_payload_size; // for ref's payload size
    u_int ref_header_size; // ip_ref header size
    layer3 *ip_ref; // ip_ref
    layer4 *tcp_ref; // tcp_ref

    // for payload
    http_payload block_site;

    // for checksum
    pseudo_header *psd_hdr;
    char checksum_buffer[1464];

    // for raw socket
    int socket_raw;
    int socket_opt_value = 1;
    ssize_t sendto_result = 0;
    struct sockaddr_in target_addr;

    bpf_u_int32 packet_buffer_size = sizeof(packet_buffer);

    /* ETHERNET TYPE EXAMINATION */
    // ether_type take-up 2bytes. 0x8100 and 0x0800 represent vlan and normal ipv4 each.
    if (ether_ref->ether_type == 0x81) {
        vlan_size = 4;
    } else if (ether_ref->ether_type == 0x08) {
        vlan_size = 0;
    }

    ip_ref = (layer3 *)(packet_ref + vlan_size + SIZE_ETHERNET); // ip_ref
    ref_header_size = IP_HL(ip_ref) * 4; // ip_ref header size
    tcp_ref = (layer4 *)(packet_ref + vlan_size + SIZE_ETHERNET + ref_header_size); // tcp_ref
    ref_header_size += TH_OFF(tcp_ref) * 4; // tcp_ref header size
    ref_payload_size = ntohs(ip_ref->ip_len) - ref_header_size; // ref_payload size

    /* TAMPERED PACKET CREATION */
    // clean-up all the memory bytes of packet_buffer[] and bind the two header variables to it.
    memset(packet_buffer, 0x00, 1600);
    iphdr = (layer3 *)(packet_buffer + vlan_size);
    tcphdr = (layer4 *)(packet_buffer + vlan_size + iphdr_size);

    // IP header
    // htonc, htons, htonl isn't necessary because the packet_ref is already loaded as Big-Endian.
    // and the headers we're creating here will be sent to the target network which is also Big-Endian.
    iphdr->ip_vhl = ip_ref->ip_vhl;
    iphdr->ip_tos = ip_ref->ip_tos;
    // iphdr->ip_len = ip_ref->ip_len;
    iphdr->ip_id = ip_ref->ip_id + htons(1); // should research about identification
    // iphdr->ip_off = ip_ref->ip_off; // 0 default
    iphdr->ip_ttl = 64;     // I just set this as 64, don't ask me why, anyway. :(
    iphdr->ip_p = 0x06;     // TCP == 0x06;
    iphdr->ip_src = ip_ref->ip_dst; // twist src ip and dst ip
    iphdr->ip_dst = ip_ref->ip_src; // because this will be sent to src ip from packet_ref
    iphdr->ip_sum = get_checksum((unsigned short *)iphdr, sizeof(layer3));
    
    // TCP header
    tcphdr->th_sport = tcp_ref->th_dport; // twist src port and dst port
    tcphdr->th_dport = tcp_ref->th_sport; // as the same reason as the ip hdr above
    tcphdr->th_seq = tcp_ref->th_ack; // seq is current total payload size sent to destination of one establish
    tcphdr->th_ack = tcp_ref->th_seq + htonl(ref_payload_size); // ack is current total payload size received from destiantion of one establish
    tcphdr->th_offx2 = 0x50;
    tcphdr->th_flags = tcp_ref->th_flags + TH_FIN;
    tcphdr->th_win = tcp_ref->th_win;

    // HTTP + HTML payload bind
    payloader(&block_site);
    // bongloader(&block_site);
    memcpy((char *)packet_buffer + (vlan_size + iphdr_size + tcphdr_size), block_site.http, block_site.http_size);
    memcpy((char *)packet_buffer + (vlan_size + iphdr_size + tcphdr_size + block_site.http_size), block_site.html, block_site.html_size);

    // printf("http_payload\n%s\n\n", (char *)packet_buffer + (vlan_size + iphdr_size + tcphdr_size));

    // Pseudo hedaer and buffer for checksum
    memset(checksum_buffer, 0x00, sizeof(checksum_buffer));

    psd_hdr = (pseudo_header *)checksum_buffer;
    psd_hdr->s_ip = iphdr->ip_src.s_addr;   // operand is already Big-Endian
    psd_hdr->d_ip = iphdr->ip_dst.s_addr;   // operand is already Big-Endian
    psd_hdr->rsvd = 0x00;                   // this should always be 0
    psd_hdr->prtc = IPPROTO_TCP;    // IPPTORO_TCP(which is 6) is defined in in.h
    psd_hdr->tcp_len = htons(tcphdr_size + block_site.data_size);   // host to network. lengh of header + data
    
    memcpy((char *)checksum_buffer + sizeof(pseudo_header), tcphdr, tcphdr_size);
    memcpy((char *)checksum_buffer + sizeof(pseudo_header) + tcphdr_size, block_site.http, block_site.http_size);
    memcpy((char *)checksum_buffer + sizeof(pseudo_header) + tcphdr_size + block_site.http_size, block_site.html, block_site.html_size);
    
    // is checksum should be htons?
    tcphdr->th_sum = get_checksum((unsigned short *)checksum_buffer, sizeof(pseudo_header) + tcphdr_size + block_site.data_size);
    // printf("psd = %x\n", psd_hdr->s_ip);
    // printf("short* = %02x:%p + %02x:%p = %02x\n", checksum_buffer[0], &checksum_buffer[0], (unsigned char)*(checksum_buffer+1), (unsigned char *)(checksum_buffer+1), (unsigned short)*(unsigned short *)checksum_buffer);
    iphdr->ip_len = htons(iphdr_size + vlan_size + tcphdr_size + block_site.data_size);
    iphdr->ip_sum = get_checksum((unsigned short *)iphdr, sizeof(layer3));
    // Socket creation
    /*
    1st parameter:
    AF_INET is an Address Family for ipv4 protocol, PF_INET is a Protocol Family.
    can also use PF_PACKET, then you have to create L2 header too.
    2nd parameter:
    SOCK_STREAM is a type for connection-based streams which is TCP.
    SOCK_RAW designates the socket as a raw data socket,
    which it makes the programmer can control the header datas.
    when the type is SOCK_RAW, the socket regards all the header datas as user datas.
    Only root account can create RAW socket because the TCP/IP stack provided from kernel,
    which only root account can access to them.
    3rd parameter:
    IPPROTO_RAW : raw protocol, which is user have to customise ip header too.
    */
    target_addr.sin_family = AF_INET;
    target_addr.sin_port = tcphdr->th_dport;
    target_addr.sin_addr = iphdr->ip_dst;
    memset(target_addr.sin_zero, 0x00, sizeof(target_addr.sin_zero));
    socket_raw = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
    if (socket_raw < 2 ) {
        puts("socket() failed.\n");
    }
    /* IP_HDRINCL's value is 1(TRUE(or enable), socket_opt_value) means user is going to create an ip header,
    so notice to Ubuntu kernel to not modify ip header*/
    if (setsockopt(socket_raw, IPPROTO_IP, IP_HDRINCL, &socket_opt_value, sizeof(socket_opt_value))) {
        puts("setsockopt() failed.\n");
    }

    sendto_result = sendto(socket_raw, packet_buffer, ntohs(iphdr->ip_len), 
                        0x00, (struct sockaddr *)&target_addr, sizeof(target_addr));
    if (sendto_result != ntohs(iphdr->ip_len)) {
        puts("sendto() failed.\n");
    } else if (sendto_result == ntohs(iphdr->ip_len)) {
        send_stat = 1;
    }


    // print_packet function preparing
    // memset(ethdr_buffer, 0x00, sizeof(ethdr_buffer));
    // ethdr = (layer2 *)ethdr_buffer;
    // for (i = 0; i < ETHER_ADDR_LEN; i++) {
    //     ethdr->ether_dhost[i] = ether_ref->ether_shost[i];
    //     ethdr->ether_shost[i] = ether_ref->ether_dhost[i];
    // }
    // ethdr->ether_type = ether_ref->ether_type;
    if (send_stat == 1 && output_flag == 2) {
        print_packet_enum(packet_ref, header, 0);    // for referenced packet
        print_packet_hex(packet_ref, header->len);
        printf("\n\t---------------------------------------------------------\n\n");
        print_packet_enum(packet_buffer, header, 1);    // for blocking packet
        print_packet_hex(packet_buffer, ntohs(iphdr->ip_len));
        printf("\n\t---------------------------------------------------------\n\n");
        output_flag == 0;
    } else if (send_stat == 1 && output_flag == 1) {
        print_packet_enum(packet_ref, header, 0);
        printf("\n\t---------------------------------------------------------\n\n");
        print_packet_enum(packet_buffer, header, 1);
        printf("\n\t---------------------------------------------------------\n\n");
        output_flag == 0;
    } else if (send_stat == 0 && output_flag == 2) {
        print_packet_enum(packet_ref, header, 0);
        print_packet_hex(packet_ref, header->len);
        printf("\n\n---------------------------------\n\n");
        output_flag == 0;
    } else if (send_stat == 0 && output_flag == 1) {
        print_packet_enum(packet_ref, header, 0);
        printf("\n\n---------------------------------\n\n");
        output_flag == 0;
    }


    close(socket_raw);
    return send_stat;
}

//////////////////// PACKET OUTPUT /////////////////////
void print_packet_enum(const u_char *packet, const struct pcap_pkthdr *header, int is_sendraw) {
    layer2 *ether = (layer2 *)(packet);
    int vlan_size = 0;
    layer3 *ip;
    layer4 *tcp;
    char *l2_type = "IPv4";
    char *l3_title = "Internet Protocol Version 4";
    char *l3_protocol;
    char *l4_title;
    unsigned char *payload;

    // payload variables
    unsigned char *pay_spoint;
    unsigned char *pay_epoint;
    unsigned char pay_line_buffer[1024];
    unsigned char pay_temp[2048];
    int i = 1;
    unsigned int pay_line_size = 0;
    u_int pay_size = 0;

    if (!is_sendraw) {      // when the packet to print is not sendraw() packet type
        if (ether->ether_type == 0x81) {
            vlan_size = 4;
        } else if (ether->ether_type == 0x08) {
            vlan_size = 0;
        }

        ip = (layer3 *)(packet + vlan_size + SIZE_ETHERNET);
        tcp = (layer4 *)(packet + vlan_size + SIZE_ETHERNET + (IP_HL(ip) * 4));
        payload = (char *)(packet + vlan_size + SIZE_ETHERNET + (IP_HL(ip) * 4) + (TH_OFF(tcp) * 4));
        
        if (ether->ether_type == (u_short)*(u_short *)&"\x08\x00") {
            l2_type = "IPv4";
            l3_title = "Internet Protocol Version 4";
        } else if (ether->ether_type == (u_short)*(u_short *)&"\x81\x00") {
            l2_type = "VLAN";
            l3_title = "Virtual Local Area Network";
        }

        if (ether->ether_type == (u_short)*(u_short *)&"\x08\x00") {
            l2_type = "IPv4";
            l3_title = "Internet Protocol Version 4";
        } else if (ether->ether_type == (u_short)*(u_short *)&"\x81\x00") {
            l2_type = "VLAN";
            l3_title = "Virtual Local Area Network";
        }
        pay_size = header->len - (SIZE_ETHERNET + IP_HL(ip) * 4 + vlan_size + TH_OFF(tcp) * 4);
        printf("▼ [PACKET CAPTURED] : %d bytes\n", header->len);
        /* layer2 output */
        printf("   ▼ Ethernet II\n");
        printf("     ▶ Destination: %02x:%02x:%02x:%02x:%02x:%02x\n", ether->ether_dhost[0],
                            (*ether).ether_dhost[1],
                            ether->ether_dhost[2],
                            ether->ether_dhost[3],
                            ether->ether_dhost[4],
                            ether->ether_dhost[5]
                            );
        printf("     ▶ Source: %02x:%02x:%02x:%02x:%02x:%02x\n", ether->ether_shost[0],
                            (*ether).ether_shost[1],
                            ether->ether_shost[2],
                            ether->ether_shost[3],
                            ether->ether_shost[4],
                            ether->ether_shost[5]
                            );
        printf("     ▶ Type: %s\n", l2_type);
        puts("");

    } else {            // when the packet to print is a sendraw() packet type
        ip = (layer3 *)(packet + vlan_size);
        tcp = (layer4 *)(packet + vlan_size + (IP_HL(ip) * 4));
        payload = (char *)(packet + vlan_size + (IP_HL(ip) * 4) + (TH_OFF(tcp) * 4));
        pay_size = ntohs(ip->ip_len) - (IP_HL(ip) * 4 + vlan_size + TH_OFF(tcp) * 4);
        printf("▼ [SENDRAW CAPTURED] : %d bytes\n", ntohs(ip->ip_len));
    }

    if (ip->ip_p == (u_char)*(u_char *)&"\x06") {
        l3_protocol = "TCP";
        l4_title = "Transmission Control Protocol";
    } else if (ip->ip_p == (u_char)*(u_char *)&"\x17") {
        l3_protocol = "UDP";
        l4_title = "User Datagram Protocol";
    }

    /* layer3 output */
    printf("   ▼ %s\n", l3_title);
    printf("     ▶ Header Length: %d bytes\n", IP_HL(ip) * 4);
    printf("     ▶ Total Length: %d bytes\n", ntohs(ip->ip_len));
    printf("     ▶ Protocol: %s\n", l3_protocol);
    printf("     ▶ Source: %s\n", inet_ntoa(ip->ip_src));
    printf("     ▶ Destination: %s\n", inet_ntoa(ip->ip_dst));
    puts("");

    /* layer4 output */
    if (ip->ip_p == (u_char)*(u_char *)&"\x06") {
        printf("   ▼ %s\n", l4_title);
        printf("     ▶ Source Port: %d\n", ntohs(tcp->th_sport));
        printf("     ▶ Destination Port: %d bytes\n", ntohs(tcp->th_dport));
        printf("     ▶ Squence number: %u\n", ntohl(tcp->th_seq));
        printf("     ▶ Acknowledgement number: %u\n", ntohl(tcp->th_ack));
        printf("     ▶ Header Length: %d\n", TH_OFF(tcp) * 4);
        printf("     ▶ Flags: 0x%03x\n", tcp->th_flags);
        puts("");
    }
    
    // printf("pay_size = %d\n", pay_size);
    if (strstr(payload, "HTTP") != NULL) {
        pay_spoint = payload;
        pay_epoint = payload;
        memset(pay_line_buffer, 0x00, sizeof(pay_line_size));
        puts("   ▼ Hypertext Transfer Protocol");
        puts("     ▶ Contents: ");
        while(1) {
            // printf("cnt = %d\n", pay_spoint - payload);
            if (pay_spoint - payload > pay_size - 1) {
                break;
            }
            memset(pay_line_buffer, 0x00, sizeof(pay_line_buffer));
            pay_epoint = strstr(pay_spoint, "\r\n");
            if (pay_epoint == NULL) {
                pay_epoint = strstr(pay_spoint, "\n");
                if (pay_epoint == NULL) {
                    pay_epoint = pay_spoint + 100;
                }
            }
            if (pay_epoint - payload > pay_size - 1) {
                pay_epoint = payload + pay_size;
            }
            // printf("spoint = %p\nepoint = %p\n", pay_spoint, pay_epoint);
            pay_line_size = pay_epoint - pay_spoint;
            // printf("pay_line_size = %u\n", pay_line_size);             ///////////// 음수문제 해결할 것
            memcpy(pay_line_buffer, pay_spoint, pay_line_size);
            printf("         %s\n", pay_line_buffer);
            pay_spoint = pay_epoint + 2;
        }
        // puts("---------------------------------\n");
    }
    

    /* payload output */
    
    // printf("[PAYLOAD]\n");
    // printf("%s\n", payload);
    // printf("==================================\n\n");
    // printf("[SQL RESULT]\n");
    // if (sql_row != NULL) {
    //     printf("Found IP : %s\t%s\n\n", sql_row[0], sql_row[1]);
    // } else printf("-- No IP Found --\n\n");
    // printf("==================================\n\n");
}

void print_packet_hex(const u_char* packet, bpf_u_int32 packet_len) {
    puts("\n   ▼ Hex Code");	
    puts("     ▶ Contents: ");
    //packet > 패킷 데이터
	//packet_len > 패킷 전체의 길이
	int i;
    int j = 0;
    int byte_zero = 0;
    int byte_offset = 16;
    //u_char* pk = packet;
    // int packet_len = header->len;

    // 1460byte 선언 -> 필요 x
	// u_char buff[1460] = {0,};
    
	// 데이터의 길이를 보여준다.
	for (i = 0; i < packet_len; i++)
	{   
        if (i % 8 == 0 && i != 0) printf(" ");
		// 16의 배수는 새 줄(줄 오프셋 있음)을 의미
		if ((i % 16) == 0)
		{
			//0번째 줄에 ASCII를 인쇄를 안함.
			if (i != 0) {
				printf(" \n");
			}
			// 입출력 바이트.
            // i = 10
			printf("\t %05d  ", byte_offset * byte_zero++);
		}

		// AB CD D2 A3 5B B3 A4 C2  > 아스키 코드를 16진수(정수)로 나열 X -> 16진수를 아스키 코드로 나열
        printf(" %02x", packet[i]);

        if ((i + 1) % 16 == 0 && i != 0) {
            printf("    ");
            while(j < i + 1) {
                if (j % 8 == 0 && j % 16 != 0 && j != 0) {
                    printf(" ");
                }
                if ((packet[j] < 0x20) || (packet[j] > 0x7e)) {
                    printf(".");
                } else if ((packet[j] == 0x0d) || (packet[j] == 0x0a)) {
                    printf(".");
                } else if (packet[j] == 0x20) { 
                    printf(".");
                } else {
                    printf("%c", packet[j]);
                }
                j++;
            }
            // printf("\n");
        }
        // 아스키코드 32 ~ 126 (10진수로)
            //32                //126, 127은 DEL문자 제외.
		// if ((packet[i] < 0x20) || (packet[i] > 0x7e)) {
		// 	buff[i % 16] = '.';
		// } else {
		// 	buff[i % 16] = packet[i];
		// }
		// buff[(i % 16) + 1] = '\0';
	}

	// 16진수가 아니면 마지막 줄을 펼침.
	while (i % 16 != 0) {
        if(i % 8 == 0) {
            printf(" ");
        }
		printf("   ");
		i++;
	}
    printf("    ");
    while(j < i) {
        if (j % 8 == 0 && j % 16 != 0 && j != 0) {
            printf(" ");
        }
        if ((packet[j] < 0x20) || (packet[j] > 0x7e)) {
            printf(".");
        } else if ((packet[j] == 0x0d) || (packet[j] == 0x0a)) {
            printf(".");
        } else if (packet[j] == 0x20) { 
            printf(".");
        } else {
            printf("%c", packet[j]);
        }
        j++;
    }
	// printf("  %s\n", buff);
    // printf("[byte : %d]",packet_len);
}

int sql_get_domain(char * url_name) {
    char query_string[768];      // must be freed before the function closed
    memset(query_string, 0x00, 768);

    sprintf(query_string, "SELECT domain_name FROM tb_domains WHERE domain_name = '%s' LIMIT 1;", url_name);

    sql_row = NULL;

    if (mysql_query(connection, query_string) == 0) {
        // puts("OK : SQL sent to DB server.");
    } else {
        return 0;
    }

    if ((sql_result = mysql_store_result(connection)) != NULL) {
    //    puts("OK : SQL result stored.");
    } else {
        return 0;
    }

    if ((sql_row = mysql_fetch_row(sql_result)) != NULL) {      // 기존 함수와 달리 결과가 없으면 NULL을 반환하는 mysql_fetch_row()의 성질을 이용하여 url이 db에 있는지 없는지를 비교
        
        // puts("\n[Found a matched url from DB server]");
        
        return 1;
    } else {
        
        // puts("[No matched url from DB server]");
        
        return 0;
    }
    return 0;
}

int sql_logger(char *srcip, char *dstip, u_short srcport, u_short dstport, char *url_name, int result, bpf_u_int32 packet_len) {
    char query_string[768];      // must be freed before the function closed
    memset(query_string, 0x00, 768);

    sprintf(query_string, "INSERT INTO tb_packet_log VALUES( '%s', '%s', %d, %d, '%s', %d, %d, now(), NULL )",
                                            srcip, dstip, srcport, dstport, url_name, result, packet_len);
    
    // printf("%s\n", query_string);

    if (mysql_query(connection, query_string) == 0) {
        puts("OK : SQL sent to DB server.");
        return 1;
    } else {
        return 0;
    }
    return 0;
}

// void print_packet_sendraw(const u_char *packet, const struct pcap_pkthdr *header) {}


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

/*
payloader() take-up a pointer of http_payload type variable.
the function creates a structure for the http packet payload.
*/
void payloader(http_payload *payload_buffer) {
    payload_buffer->html_size = sprintf(payload_buffer->html,
        "<!DOCTYPE html>\r\n"
        "<html>\r\n"
            "<head>\r\n"
                "<title>PPP - Packet Pirate Project</title>\r\n"
                "<style>\r\n"
                    "body { background-color : #404040 }\r\n"
                "</style>\r\n"
            "</head>\r\n"
            "<body>\r\n"
                "<center>\r\n"
                "<img src=\"https://cdn-icons-png.flaticon.com/512/179/179386.png\" width=\"300 px\">\r\n"
                "<hr>\r\n"
                "<h1 style=\"color:white; font-family:monospace; font-size:30px;\">UNAUTHORIZED ACCESS DENIED</h1>\r\n"
                "<p style=\"color:white; font-family:monospace; font-size:15px;\">According to the company rules, PPP blocked the page.</p>\r\n"
                "</center>\r\n"
            "</body>\r\n"
        "</html>\r\n");

    payload_buffer->http_size = sprintf(payload_buffer->http,
        "HTTP/1.1 200 OK\r\n"
        "Content-Type: text/html\r\n"
        "Content-Length: %d\r\n\r\n", payload_buffer->html_size);
    
    payload_buffer->data_size = payload_buffer->http_size + payload_buffer->html_size;
}

void bongloader(http_payload *payload_buffer) {
    payload_buffer->html_size = sprintf(payload_buffer->html,
        "<!DOCTYPE html>\r\n"
        "<html>\r\n"
            "<head>\r\n"
                "<title>PPP - Packet Pirate Project</title>\r\n"
                "<style>\r\n"
                    "body { background-color : grey }\r\n"
                "</style>\r\n"
            "</head>\r\n"
            "<body>\r\n"
                "<center>\r\n"
                "<img src=\"https://cdn.discordapp.com/attachments/1065602473248686233/1070207120600997908/image.png\" height=\"300px\">\r\n"
                "<h1 style=\"color: #FFFFFF;\">\" AHA! I GOT YOU! \"</h1>\r\n"
                "<p>You were excited thinking of accessing some <b>Hyung-Ak</b> page, don't you?</p>\r\n"
                "<p>Well, fortunetely <b>The Mighty Bong</b> is always watching you!</p>\r\n"
                "</center>\r\n"
            "</body>\r\n"
        "</html>\r\n");

    payload_buffer->http_size = sprintf(payload_buffer->http,
        "HTTP/1.1 200 OK\r\n"
        "Content-Type: text/html\r\n"
        "Content-Length: %d\r\n\r\n", payload_buffer->html_size);
    
    payload_buffer->data_size = payload_buffer->http_size + payload_buffer->html_size;
}

