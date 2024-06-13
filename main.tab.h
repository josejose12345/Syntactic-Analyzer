/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MAIN_TAB_H_INCLUDED
# define YY_YY_MAIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    SEMICOLON = 258,               /* SEMICOLON  */
    DOT = 259,                     /* DOT  */
    COMMA = 260,                   /* COMMA  */
    INT = 261,                     /* INT  */
    FLOAT = 262,                   /* FLOAT  */
    STRING = 263,                  /* STRING  */
    SYMBOL = 264,                  /* SYMBOL  */
    IDENTIFIER = 265,              /* IDENTIFIER  */
    INTEGER_VALUE = 266,           /* INTEGER_VALUE  */
    FLOAT_VALUE = 267,             /* FLOAT_VALUE  */
    STRING_LITERAL = 268,          /* STRING_LITERAL  */
    SYMBOL_VALUE = 269,            /* SYMBOL_VALUE  */
    EQUALS = 270,                  /* EQUALS  */
    LESS_THAN = 271,               /* LESS_THAN  */
    GREATER_THAN = 272,            /* GREATER_THAN  */
    LESS_THAN_OR_EQUAL_TO = 273,   /* LESS_THAN_OR_EQUAL_TO  */
    GREATER_THAN_OR_EQUAL_TO = 274, /* GREATER_THAN_OR_EQUAL_TO  */
    NOT_EQUAL = 275,               /* NOT_EQUAL  */
    ASSIGN = 276,                  /* ASSIGN  */
    PLUS = 277,                    /* PLUS  */
    MINUS = 278,                   /* MINUS  */
    MULTIPLY = 279,                /* MULTIPLY  */
    DIVIDE = 280,                  /* DIVIDE  */
    MODULO = 281,                  /* MODULO  */
    EXPONENT = 282,                /* EXPONENT  */
    PRINT = 283,                   /* PRINT  */
    ALPHABET = 284,                /* ALPHABET  */
    STREAK = 285,                  /* STREAK  */
    CATEGORY = 286,                /* CATEGORY  */
    MULTICOTOMIZED_STRING = 287,   /* MULTICOTOMIZED_STRING  */
    TWO_WAY_CLASSIFICATION_MODEL = 288, /* TWO_WAY_CLASSIFICATION_MODEL  */
    ARRAY = 289,                   /* ARRAY  */
    MATRIX = 290,                  /* MATRIX  */
    IF = 291,                      /* IF  */
    ELSE = 292,                    /* ELSE  */
    WHILE = 293,                   /* WHILE  */
    FOR = 294,                     /* FOR  */
    LEFT_PAREN = 295,              /* LEFT_PAREN  */
    RIGHT_PAREN = 296,             /* RIGHT_PAREN  */
    LEFT_BRACE = 297,              /* LEFT_BRACE  */
    RIGHT_BRACE = 298,             /* RIGHT_BRACE  */
    LEFT_BRACKET = 299,            /* LEFT_BRACKET  */
    RIGHT_BRACKET = 300,           /* RIGHT_BRACKET  */
    GET_STREAKS = 301,             /* GET_STREAKS  */
    ADD_SYMBOL = 302,              /* ADD_SYMBOL  */
    COUNTER_FUNCTION = 303,        /* COUNTER_FUNCTION  */
    TOTAL_STREAKS = 304,           /* TOTAL_STREAKS  */
    MULTICOTOMIZE = 305,           /* MULTICOTOMIZE  */
    TOTAL_DATA_MODEL = 306,        /* TOTAL_DATA_MODEL  */
    TOTAL_DATA_BLOCK = 307,        /* TOTAL_DATA_BLOCK  */
    TOTAL_DATA_TREATMENT = 308,    /* TOTAL_DATA_TREATMENT  */
    GET_TOTAL_DATA = 309,          /* GET_TOTAL_DATA  */
    GET_BLOCK_DATA = 310,          /* GET_BLOCK_DATA  */
    GET_TREATMENT_DATA = 311,      /* GET_TREATMENT_DATA  */
    STREAK_NUMBER = 312,           /* STREAK_NUMBER  */
    STREAK_AVERAGE = 313,          /* STREAK_AVERAGE  */
    BLOCK_STREAK_SUM = 314,        /* BLOCK_STREAK_SUM  */
    TREATMENT_STREAK_SUM = 315,    /* TREATMENT_STREAK_SUM  */
    AVERAGE_STREAK_BLOCK = 316,    /* AVERAGE_STREAK_BLOCK  */
    AVERAGE_STREAK_TREATMENT = 317, /* AVERAGE_STREAK_TREATMENT  */
    MODEL_STREAK_SUM = 318,        /* MODEL_STREAK_SUM  */
    MODEL_STREAK_AVERAGE = 319     /* MODEL_STREAK_AVERAGE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MAIN_TAB_H_INCLUDED  */
