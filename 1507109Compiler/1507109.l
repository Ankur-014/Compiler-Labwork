/* author: shahriar1507109 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507109.tab.h"
	#include<stdlib.h>
	

%}

identifiers "shahriar%"[a-zA-Z]([a-zA-Z0-9])*
unary_operator "barao"|"komao"
single_line_comment [/][/].*
multiple_line_comment [ ]*[/][s][/][a-zA-Z0-9!@#*(){}_+-,.:\|?><\n\t ]*[/][s][/]

/*RE and Action*/

%%


{single_line_comment} {
	printf("single line comment\n");

}
{multiple_line_comment} {
	printf("multiple_line_comment");
}

{unary_operator}   {return inc;}
"bb"	 { return LB; } 
"db"	  { return RB; }
"vango"    {   return BREAK;     }
"ghotona"      { return CASE;      }
"tip"      { return SWITCH;	}
"nirupai"     {  return DEFAULT; 	}
"jokhon" { return WHILE;}
"int_s"	{ return INT; }
"float_s"	{ return FLOAT; }
"char_s"	{ return CHAR; }
[:]     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"jonno"   { return FOR;}	
"pbb"	{ return LP; }
"pdb"	{ return RP; }
"biroti"	{ return CM; }
"@"	{ return SM; }
"jog"	{ return PLUS;}
"biyog"	{ return MINUS; }
"gun"	{ return MULT; }
"vag"	{ return DIV; }
"sokti"	{ return POW; }
"probesh"		{ return ASSIGN;  }
"boro"	{ return GT; }
"soto"	{ return LT; }

{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"jodi"		{ return IF;}
"onnothai"		{ return ELSE;}

"kormokando "[A-Za-z]+	{ return MAIN; }

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

