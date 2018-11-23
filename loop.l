/* RE and ACTIONS */
%{

#include <stdio.h>
#include "loop.tab.h"
#include<stdlib.h>
int varindex(char *var);

%}

IDENTIFIER [a-zA-Z][a-zA-Z0-9]*[_]?[a-zA-Z0-9]*
DIGIT [0-9]
CASEVAR [a-z]

%%


"FullNumber"	     { return INT; }

"RealNumber"	     { return FLOAT; }

"Letters"	{ return CHARACTER; }



"Kash"      { return JODI; }

"!_Kash"    { return NAHOY; }

[~<+]       { return *yytext; }
[#]         { return sesh; }
[=]         { return *yytext; }
[:]         { return *yytext; }
[~(]        { return *yytext; }
[)~]        { return *yytext; }
[~{]        { return *yytext; }
[}~]        { return *yytext; }


"LIYE"  { return FOR; }

"JABTAK" { return WHILE; }

"KARO"    { return DO; }


"| + |"        { return SUM; }

"| - |"        { return SUB; }

"| * |"        { return MUL; }

"| / |"        { return DIV; }

"| > |"       { return ISGREATER; }

"| < |"       { return ISLESS; }

"| >= |"     { return ISGREATEREQU; }
"| <= |"      { return ISLESSEQU; }

"| SINE |"    { return SINE; }
"| COS |"    { return COS; }
"| TAN |"    { return TAN; }
"| LN |"    { return LN; }
"| !! |" { return FACTORIAL; }
"| ^ |" { return TOTHEPOWER; }

"Switch"  { return Switch; }
"Case >"   {return Case1;}
"Case <"   {return Case2;}
"Case ="   {return Case3;}

"Arambh"   { return Main; }

"Khatam"   { return End; }
[ \t\n]*	;


{IDENTIFIER} {
			yylval.IN = *yytext - 'a';
 			return Variable;
 			}

"-"?{DIGIT}+ {
	yylval.DOB=atof(yytext);
	return Number;
	}

"-"?{DIGIT}+?"."{DIGIT}+ {
	yylval.DOB=atof(yytext);
	return Number;
	}
	
%%


int main()
{
	yyin = freopen("input.txt","r",stdin);
	yyout = freopen("result.txt","w",stdout);
	yyparse();

}
