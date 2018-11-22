%%
http[s]?"://www."[a-zA-z0-9]+"."((com)|(net)|(org))	{printf("URL vaild\n");}


%%
int yywrap()
{
	return 1;
}
int main()
{
printf("URL Detection\n");
	yylex();
return 0;
}
