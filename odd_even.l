/*bison flex different file*/

/* C Declarations */

%{
	#include "odd_even.tab.h"
	extern int yylval;
%}

/*RE and Action*/

%%

[0-9]*	{
		yylval = atoi(yytext); 

		if(yylval%2 == 0)
		{
			return EVEN;
		}
		else
		{
			return ODD;
		}
	}
%%

/* user subroutines */

int main(void)
{
	printf("\nEnter the number: ");
	yyparse();
	return 0;
}

int yywrap(void)
{
	return 0;
}

yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}
