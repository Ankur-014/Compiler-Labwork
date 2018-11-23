/* Simple grammar rules */
%{
	#include<stdio.h>
	#include <math.h>
	int sym[26];
	#define var 180
        #define pi  3.1416
	#include<stdlib.h>
	#include<string.h>
	
%}

%union {
  double DOB;   
  int IN;  
}

%token <DOB>  Number    
%token <IN>  Variable  
%type  <DOB>  expression 
%type  <DOB>  subsent

%token Var JODI NAHOY Main End INT FLOAT CHARACTER SUM SUB MUL DIV FOR WHILE DO ISLESS ISGREATER ISGREATEREQU ISLESSEQU sesh SINE COS TAN LN FACTORIAL TOTHEPOWER Switch Case1 Case2 Case3
%nonassoc IFX
%nonassoc ELSE
%left ISLESS ISGREATER ISLESSEQU ISGREATEREQU
%left SUM SUB
%left MUL DIV
%left SINE COS TAN LN
%left FACTORIAL
%left TOTHEPOWER

%%

	 

sentence: /* empty */

	| sentence subsent
	
	| ghosona
	;
	
ghosona: TYPE ID1 sesh	{ printf("\nvalid declaration\n"); }
	        ;
			
TYPE : INT

     | FLOAT

     | CHARACTER
     ;

ID1  : ID1 '~' Variable

     |Variable
     ;

subsent: sesh


	| expression sesh		{ $$ = $1; printf("value of expression: %.10g\n", $1); }
	

        | Variable '=' expression sesh 		
                             		{ 
							sym[$1] = $3; $$ = sym[$1];
							printf("Value of the variable: %.10g\t\n",$3);
						}

	| JODI '(' expression ')' expression sesh %prec IFX {
								if($3)
								{
									printf("\nvalue of expression in IF: %.10g\n",$5);
								}
								else
								{
									printf("condition value zero in IF block\n");
								}
							}

	| JODI '(' expression ')' expression sesh NAHOY expression sesh {
								 	if($3)
									{
										printf("value of expression in IF: %.10g\n",$5);
									}
									else
									{
										printf("value of expression in ELSE: %.10g\n",$8);
									}
								   }


| JODI '(' expression ')' '{' JODI '(' expression ')' expression sesh NAHOY expression sesh '}'  NAHOY expression sesh %prec IFX {
								 	if($3)
									{
										if($8)
										printf("\nvalue of expression middle IF: %.10g\n",$10);
										else
										printf("\nvalue of expression middle ELSE: %.10g\n",$13);
									}
									else
									{
										printf("\nvalue of expression in else: %.10g\n",$17);
									}
								   }
								   
							   
								   
								   


| FOR '(' Variable '=' Number '~' Variable '<' Number '~' Variable '+''+' ')' '{' subsent '}' {
	    int i;
		
	      for (sym[$3]=$5 ; sym[$3]<$9;sym[$3] += 1)
{
		  		       printf("expression in for loop : %.10g\n",$16);
			   		  }
	
	
	
	}		   
	


	;

expression: Number		{ $$ = $1; 	}
	

	| Variable			{ $$ = sym[$1]; }

	| expression SUM expression	   { $$ = $1 + $3; }


	| expression SUB expression	   { $$ = $1 - $3; }

	| expression MUL expression	   { $$ = $1 * $3; }

	| expression DIV expression	   { 	if($3) 
				  		{
				     			$$ = $1 / $3;
				  		}
				  		else
				  		{
							$$ = 0;
							printf("\ndivision by zero\t");
				  		} 	
				    	}
						
	| SINE '(' expression ')' { $$=sin($3 * pi / var); printf(" sin value %.10g\n",$$); }
	| COS '(' expression ')' { $$=cos($3 *pi / var); printf(" cos value %.10g\n",$$); }
	| TAN '(' expression ')' { $$=tan($3 *pi / var); printf(" tan value %.10g\n",$$); }
	| LN '(' expression ')' { $$=log($3); printf(" ln value %.10g\n",$$); }	

    | expression FACTORIAL {
						int mult=1 ,i;
						for(i=$1;i>0;i--)
						{
							mult=mult*i;
						}
						$$=mult;
						printf("factorial value !%.10g\n",$$); 
					 }	
					 
	| expression TOTHEPOWER expression { $$=pow($1,$3); printf("To the power value %.10g\n",$$); }				 

	| expression ISLESS expression	{ $$ = $1 < $3; }

	| expression ISGREATER expression	{ $$ = $1 > $3; }

	| '~''(' expression ')''~'		       { $$ = $3 ;}
	
        | expression ISGREATEREQU expression  { $$ = $1 >= $3; }
       
        | expression ISLESSEQU expression     { $$ = $1 <= $3; }
	
        ;
%%




int yywrap()
{
return 1;
}


yyerror(char *s){
	printf( "%s\n", s);
}










