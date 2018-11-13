#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <mysql/mysql.h> // for MYSQL

#define BUF_SIZE 1024
void error_handling(char *message);

int main(int argc, char *argv[])
{
	// for socket programming
	int serv_sock, clnt_sock;
	char message[BUF_SIZE];
	int str_len, i;
	
	struct sockaddr_in serv_adr, clnt_adr;
	socklen_t clnt_adr_sz;

	if(argc != 2)
	{
		printf("Usage : %s <port> \n", argv[0]);
		exit(1);
	}

	serv_sock = socket(PF_INET, SOCK_STREAM, 0);
	if(serv_sock == -1)
		error_handling("socket() error");

	memset(&serv_adr, 0, sizeof(serv_adr));
	serv_adr.sin_family = AF_INET;
	serv_adr.sin_addr.s_addr = htonl(INADDR_ANY);
	serv_adr.sin_port = htons(atoi(argv[1]));

	if(bind(serv_sock, (struct sockaddr*)&serv_adr, sizeof(serv_adr)) == -1)
		error_handling("bind() error");

	if(listen(serv_sock, 5) == -1)
		error_handling("listen() error");

	clnt_adr_sz = sizeof(clnt_adr);

	// for MYSQL
	MYSQL mysql;
	MYSQL_RES *myresult;
	MYSQL_ROW row;

	char * string_query;
	
	mysql_init(&mysql);
	if(mysql_real_connect(&mysql, "localhost", "lonely", "lonely723", "GIL_BBANG", 0, NULL, 0))
		fputs("mysql connect success!\n", stdout);
	else
	{
		fputs("mysql connect error!\n", stdout);
		exit(1);
	}
	char tempQuery[1024] = "\0";



	// for string cutter separted by "-"
	char machine_num_str[5]; // ex) 001
	int machine_num;
	char type_str[5]; // ex) 1 or 2 
	int type;
	char date_str[20]; // ex) 201811081427
	double date_t;
	char dust25_str[10]; // i don't know
	double dust25;
	char dust10_str[10];
	double dust10;

	for(i = 0; i<5; i++) // 5 clients can be connected
	{
		clnt_sock = accept(serv_sock, (struct sockaddr*)&clnt_adr, &clnt_adr_sz);
		if(clnt_sock == -1)
			error_handling("accept() error");
		else
			printf("Connected client %d \n", i+1);

		while((str_len = read(clnt_sock, message, BUF_SIZE))!=0)
		{
			printf("you received : %s\n", message);
			
			date_t = message[4]*100000000000 + message[5]*10000000000 + message[6]*1000000000 + message[7]*100000000 + message[8]*10000000 + message[9]*1000000 + message[10]*100000 + message[11]*10000 + message[12]*1000 + message[13]*100 + message[14]*10 + message[15];
			dust25 = message[16]*100 + message[17]*10 + message[18] + message[20]/10;
			dust10 = message[21]*100 + message[22]*10 + message[23] + message[25]/10;


			
			sprintf(tempQuery, "INSERT INTO MISE(device, nowtime, dust25, dust10) VALUES('1', '%.2f', '%.2f', '%.2f')", date_t, dust25, dust10);
			strcpy(string_query, tempQuery);
			mysql_query(&mysql, string_query);

			write(clnt_sock, message, str_len);

		}

		close(clnt_sock);
	}
	close(serv_sock);
	mysql_close(&mysql);
	return 0;
}

void error_handling(char *message)
{
	fputs(message, stderr);
	fputc('\n', stderr);
	exit(1);
}
