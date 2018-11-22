%%
[a-zA-z0-9]+"@"((gmail)|(yahoo))".com"	{printf("Email vaild\n");}

%%
int yywrap()
{
	return 1;
}
int main()
{
printf("E-mail Detection\n");
	yylex();
return 0;
}
