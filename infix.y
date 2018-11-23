/* tcalc.y - a four function calculator */

/* C Declarations */

%{
	#define YYSTYPE double /* yyparse() stack type */
	#include <malloc.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
%}

/* BISON Declarations */

%token NEWLINE NUMBER PLUS MINUS SLASH ASTERISK LPAREN RPAREN
%left PLUS MINUS
%left ASTERISK SLASH
%right EXPONEN

/* Grammar follows */

%%
input:	/* empty string */

	| input line
	;

line:	NEWLINE

	| exp NEWLINE { printf("\t%.10g\n",$1); }
	;

exp:      NUMBER		{ $$ = $1; 	}

        | exp PLUS exp		{ $$ = $1 + $3; }

        | exp MINUS exp 	{ $$ = $1 - $3; }

        | exp ASTERISK exp	{ $$ = $1 * $3; }

        | exp SLASH exp		{ $$ = $1 / $3; }

        | LPAREN exp RPAREN	{ $$ = $2; 	}
	;

%%

/* Additional C code */

/* Error processor for yyparse */


int yyerror(char *s) /* called by yyparse on error */
{
	printf("%s\n",s);
	return(0);
}

/* The controlling function */

int main(void)
{
	yyparse();
	exit(0);
}