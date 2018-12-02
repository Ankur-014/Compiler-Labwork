/* author: pranto1507009 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507009.tab.h"
	#include<stdlib.h>
	

%}

identifiers pranto@[a-zA-Z]([a-zA-Z0-9])*
unary_operator "inc"|"dec"
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][p][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][p][/]

/*RE and Action*/

%%


{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

{unary_operator}   {return inc;}
"lb"	 { return LB; }
"rb"	  { return RB; }
"br"    {   return BREAK;     }
"option"      { return CASE;      }
"case"      { return SWITCH;	}
"normal"     {  return DEFAULT; 	}
"until" { return WHILE;}
"int_p"	{ return INT; }
"float_p"	{ return FLOAT; }
"char_p"	{ return CHAR; }
[:]     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"loop"   { return FOR;}	
"fbo"	{ return LP; }
"fbc"	{ return RP; }
","	{ return CM; }
"endl"	{ return SM; }
"add"	{ return PLUS;}
"sub"	{ return MINUS; }
"mul"	{ return MULT; }
"div"	{ return DIV; }
"power"	{ return POW; }
"="		{ return ASSIGN;  }
"gt"	{ return GT; }
"lt"	{ return LT; }

{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"condition"		{ return IF;}
"default"		{ return ELSE;}

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

