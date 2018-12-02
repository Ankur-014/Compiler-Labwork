/* author: asif1507001 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507001.tab.h"
	#include<stdlib.h>
	

%}

identifiers "asifur@"[a-zA-Z]([a-zA-Z0-9])*
unary_operator "$++"|"$--"
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][a][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][a][/]

/*RE and Action*/

%%


{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

{unary_operator}   {return inc;}
"so"	 { return LB; }
"sc"	  { return RB; }
"out"    {   return BREAK;     }
"option"      { return CASE;      }
"Collection"      { return SWITCH;	}
"noway"     {  return DEFAULT; 	}
"Till" { return WHILE;}
"int_a"	{ return INT; }
"float_a"	{ return FLOAT; }
"char_a"	{ return CHAR; }
[:]     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"Until"   { return FOR;}	
"fo"	{ return LP; }
"fc"	{ return RP; }
[`]	{ return CM; }
"#"	{ return SM; }
"add"	{ return PLUS;}
"sub"	{ return MINUS; }
"mul"	{ return MULT; }
"div"	{ return DIV; }
"exp"	{ return POW; }
[~]		{ return ASSIGN;  }
"gt"	{ return GT; }
"lt"	{ return LT; }

{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"Neither"		{ return IF;}
"either"	{ return ELIF; }
"Nor"		{ return ELSE;}

"func "[A-Za-z]+	{ return MAIN; }

[ \t\n]*	

.	{
		yyerror("Unknown Character.\n");
	}
%%

/* user subroutines */

int main()
{
	yyin = freopen("in.txt","r",stdin);
	yyout = freopen("out.txt","w",stdout);
	yyparse();
	
}

