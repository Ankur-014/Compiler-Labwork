

%%

([+-]?[0-9]+[.][0-9]+)|([+-]?[.][0-9]+)|([+-]?[0-9]+[.][0-9]+"*10^"[+-]?[0-9]+)	{printf("floating value\n");}

%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("floating value detection\n");
	yylex();
	return 0;
}