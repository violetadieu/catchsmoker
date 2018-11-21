#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/sendfile.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>

#define MAXLINE  511

int tcp_connect(int af, char *servip, unsigned short port) {
    struct sockaddr_in servaddr;
    int  s;
    // 소켓 생성
    if ((s = socket(af, SOCK_STREAM, 0)) < 0)
        return -1;
    // 채팅 서버의 소켓주소 구조체 servaddr 초기화
    bzero((char *)&servaddr, sizeof(servaddr));
    servaddr.sin_family = af;
    inet_pton(AF_INET, servip, &servaddr.sin_addr);
    servaddr.sin_port = htons(port);
    
    // 연결요청
    if (connect(s, (struct sockaddr *)&servaddr, sizeof(servaddr))
        < 0)
        return -1;
    return s;
}

int main(int argc, char *argv[])
{
    struct sockaddr_in server;
    struct stat obj;
    int sock;
    char bufmsg[MAXLINE];
    char  command[5],  *f;
    char temp[20];
    int k, size, status;
    int filehandle;
    
    if (argc != 3) {
        printf("사용법 : %s server_ip port\n", argv[0]);
        exit(1);
    }
    
    sock = tcp_connect(AF_INET, argv[1], atoi(argv[2]));
    if (sock == -1) {
        printf("tcp_connect fail");
        exit(1);
    }
    
    while (1) {
	char buf[100];
	char filename[MAXLINE];
	memset(buf,'\0',100);
	memset(filename,'\0',MAXLINE);
        printf("\033[1;33m명령어 : get, put, pwd, ls, cd, quit\n");
        printf("\033[1;32mclient> ");
        fprintf(stderr, "\033[97m");   //글자색을 흰색으로 변경
        
        printf("업로드할 파일 : ");
        
        scanf("%s", filename);       //파일 이름 입력
        printf("파일 이름 입력 성공 \n");
        fgets(temp, MAXLINE, stdin); //버퍼에 남은 엔터 제거
        filehandle = open(filename, O_RDONLY);
        if (filehandle == -1) {//파일이 없다면
            printf("파일이 없습니다.\n");
            continue;
        }
    
        strcat(buf, filename);
        send(sock, buf, 100, 0);
        printf("파일 이름 전송 성공 \n");
        stat(filename, &obj);
        size = obj.st_size;
        send(sock, &size, sizeof(int), 0);//명령어 전송
        sendfile(sock, filehandle, NULL, size);//파일 전송
        recv(sock, &status, sizeof(int), 0);
        if (status)//업로드가 잘 되었다면
            printf("업로드 완료\n");
        else
            printf("업로드 실패\n");
        
    }
}

