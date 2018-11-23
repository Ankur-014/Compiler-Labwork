
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     Number = 258,
     Variable = 259,
     Var = 260,
     JODI = 261,
     NAHOY = 262,
     Main = 263,
     End = 264,
     INT = 265,
     FLOAT = 266,
     CHARACTER = 267,
     SUM = 268,
     SUB = 269,
     MUL = 270,
     DIV = 271,
     FOR = 272,
     WHILE = 273,
     DO = 274,
     ISLESS = 275,
     ISGREATER = 276,
     ISGREATEREQU = 277,
     ISLESSEQU = 278,
     sesh = 279,
     SINE = 280,
     COS = 281,
     TAN = 282,
     LN = 283,
     FACTORIAL = 284,
     TOTHEPOWER = 285,
     Switch = 286,
     Case1 = 287,
     Case2 = 288,
     Case3 = 289,
     IFX = 290,
     ELSE = 291
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 13 "loop.y"

  double DOB;   
  int IN;  



/* Line 1676 of yacc.c  */
#line 95 "loop.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


