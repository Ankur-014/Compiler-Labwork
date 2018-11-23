/* author: asif1507001 */

%{
	#include<stdio.h>
	#include <math.h>
	int cnt=1,cntt=0,val;
	typedef struct entry {
    	char *str;
    	int n;
	}store;
	store st[1000],sym[1000];
	void ins(store *p, char *s, int n);
	int cnt2=1; 
	void ins2 (store *p, char *s, int n);
	
%}
%union 
{
        int number;
        char *string;
}
/* BISON Declarations */

%token <number> NUM
%token <string> VAR 
%token <string> IF  ELSE MAIN INT FLOAT DOUBLE CHAR LP RP LB RB CM SM PLUS MINUS MULT DIV POW ASSIGN FOR COL WHILE BREAK DEFAULT CASE SWITCH inc 
%type <string> statement
%type <number> expression
%nonassoc IFX
%nonassoc ELSE
%left LT GT
%left PLUS MINUS
%left MULT DIV
%left POW

/* Simple grammar rules */

%%

program: MAIN LP RP LB cstatement RB { printf("\nSuccessful compilation\n"); }
	 ;

cstatement: /* empty */

	| cstatement statement
	
	| cdeclaration
	;

cdeclaration:	TYPE ID1 SM	{ printf("\nvalid declaration\n"); }
   
			;
			
TYPE : INT

     | FLOAT

     | CHAR
     ;

ID1  : ID1 CM VAR	{
						if(look_for_key($3))
						{
							printf("%s is already declared\n", $3 );
						}
						else
						{
							ins(&st[cnt],$3, cnt);
							cnt++;
							
						}
			}

     |VAR	{
				if(look_for_key($1))
				{
					printf("%s is already declared\n", $1 );
				}
				else
				{
					ins(&st[cnt],$1, cnt);
							cnt++;
				}
			}
     ;

statement: SM
	| SWITCH LP expression RP LB BASE RB    {printf("SWITCH case.\n");val=$3;} 

	| expression SM 			{ printf("\nvalue of expression: %d\n", ($1)); }

        | VAR ASSIGN expression SM 		{
							if(look_for_key($1)){
								int i = look_for_key2($1);
								if (!i){
									ins(&sym[cntt], $1, $3);
									cntt++;
								}
								sym[i].n = $3;
								printf("\n(%s) Value of the variable: %d\t\n",$1,$3);
							}
							else {
								printf("%s not declared yet\n",$1);
							}
							
						}

	| IF LP expression RP LB expression SM RB %prec IFX {
								if($3)
								{
									printf("\nvalue of expression in IF: %d\n",($6));
								}
								else
								{
									printf("\ncondition value zero in IF block\n");
								}
							}

	| IF LP expression RP LB expression SM RB ELSE LB expression SM RB {
								 	if($3)
									{
										printf("\nvalue of expression in IF: %d\n",$6);
									}
									else
									{
										printf("\nvalue of expression in ELSE: %d\n",$11);
									}
								   }

						   
	| FOR LP NUM COL NUM RP LB expression RB     {
	   int i=0;
	   for(i=$3;i<$5;i++){
	   printf("for loop statement\n");
	   }
	}
	| WHILE LP NUM GT NUM RP LB expression RB   {
										int i;
										printf("While LOOP: ");
										for(i=$3;i<=$5;i++)
										{
											printf("%d ",i);
										}
										printf("\n");
										printf("value of the expression: %d\n",$8);

	}
	;
///////////////////////
	
			BASE : Bas   
				 | Bas Dflt 
				 ;

			Bas   : /*NULL*/
				 | Bas Cs     
				 ;

			Cs    : CASE NUM COL expression SM   {
						if($2==2){
							  cntt=1;
							  printf("\nCase No : %d  and Result :  %d\n",$2,$4);
						}
					}
				 ;

			Dflt    : DEFAULT COL NUM SM    {
						if(cntt==0){
							printf("\nResult in default Value is :  %d \n",$3);
						}
					}
				 ;    
	/////////////////////////////
	
	
expression: NUM				{ $$ = $1; 	}

	| VAR				{ $$ = look_for_key2($1); printf("Variable value: %d",$$)}

	| expression PLUS expression	{ $$ = $1 + $3; }

	| expression MINUS expression	{ $$ = $1 - $3; }

	| expression MULT expression	{ $$ = $1 * $3; }

	| expression DIV expression	{ 	if($3) 
				  		{
				     			$$ = $1 / $3;
				  		}
				  		else
				  		{
							$$ = 0;
							printf("\ndivision by zero\t");
				  		} 	
				    	}
	| expression POW expression { $$ = pow($1,$3); }


	| expression LT expression	{ $$ = $1 < $3; }

	| expression GT expression	{ $$ = $1 > $3; }

	| LP expression RP		{ $$ = $2;	}
	
	| inc expression inc         { $$=$2+1; printf("inc: %d\n",$$);}
	;
%%
//////////////////////////
void ins(store *p, char *s, int n)
{
  p->str = s;
  p->n = n;
}

int look_for_key(char *key)
{
    int i = 1;
    char *name = st[i].str;
    while (name) {
        if (strcmp(name, key) == 0)
            return st[i].n;
        name = st[++i].str;
    }
    return 0;
}
/////////////////////////
void ins2 (store *p, char *s, int n)
{
  p->str = s;
  p->n = n;
  
}

int look_for_key2(char *key)
{
    int i = 1;
    char *name = sym[i].str;
    while (name) {
        if (strcmp(name, key) == 0)
            return i;
        name = sym[++i].str;
    }
    return 0;
}

///////////////////////////


int yywrap()
{
return 1;
}


yyerror(char *s){
	printf( "%s\n", s);
}

