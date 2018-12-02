/* author: azahar1507001 */

%{
	#include<stdio.h>
	#include <string.h>
	#include "1507024.tab.h"
	#include<stdlib.h>
	

%}

identifiers "azahar_"[a-zA-Z]([a-zA-Z0-9])*
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
"sbo"	 { return LB; }
"sbc"	  { return RB; }
"break"    {   return BREAK;     }
"choose"      { return CASE;      }
"other"      { return SWITCH;	}
"blocked"     {  return DEFAULT; 	}
"repeat" { return WHILE;}
"int_a"	{ return INT; }
"float_a"	{ return FLOAT; }
"char_a"	{ return CHAR; }
[:]     { return COL;}
[0-9]+	{ 
		yylval.number = atoi(yytext);
		return NUM;
	}
"trap"   { return FOR;}	
"fbo"	{ return LP; }
"fbc"	{ return RP; }
","		{ return CM; }
"#"		{ return SM; }
"jog"	{ return PLUS;}
"biyog"	{ return MINUS; }
"gun"	{ return MULT; }
"vag"	{ return DIV; }
"ghat"	{ return POW; }
"="		{ return ASSIGN;  }
"gt"	{ return GT; }
"lt"	{ return LT; }

{identifiers} {
	 yylval.string=strdup(yytext);
	 return VAR;
	}

"jodi"		{ return IF;}
"jodina"		{ return ELSE;}

"function "[A-Za-z]+	{ return MAIN; }

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

