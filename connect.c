#include <stdio.h>
#include <mysql/mysql.h>
#include <stdlib.h>

int main(int argc, char * argv[])
{
	MYSQL mysql;
	MYSQL_RES *myresult;
	MYSQL_ROW row;

	unsigned int num_fields;
	unsigned int num_rows;
	char * string_query;

	mysql_init(&mysql);
	if(mysql_real_connect(&mysql, "localhost", "lonely", "lonely723", "GIL_BBANG", 0, NULL, 0))
		fputs("mysql connect success!\n", stdout);
	else
	{
		fputs("mysql connect error!\n", stdout);
		exit(1);
	}

	fputs("001\n", stdout);

	string_query = "INSERT INTO SMOKE(smoker, device, picture) VALUES('10', '1', 'dogejakim.jpg')";
	fputs("002\n", stdout);

	mysql_query(&mysql, string_query);
	fputs("003\n", stdout);
	myresult = mysql_store_result(&mysql);
	fputs("004\n", stdout);
	
	//while(row = mysql_fetch_row(myresult))
	//	printf("%s\t %s\n", row[0], row[1]);
	mysql_free_result(myresult);
	fputs("005\n", stdout);
	mysql_close(&mysql);
	fputs("006\n", stdout);

	return 0;
}
