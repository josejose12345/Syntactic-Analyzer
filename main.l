%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "y.tab.hpp"

void yyerror(const char *s) {  /* Define yyerror */
  fprintf(stderr, "error: %s\n", s);
}
%}

%option yylineno

%%
Alphabet { return ALPHABET; }
Streak {return STREAK;}
Category {return CATEGORY;}
String      { return STRING; }
MulticotomizedString {return MULTICOTOMIZED_STRING;}
TwoWayClassificationModel {return TWO_WAY_CLASSIFICATION_MODEL;}

int         { return INT; }
float       { return FLOAT; }
symbol      { return SYMBOL; }


if          { return IF; }
else        { return ELSE; }


getStreaks { return GET_STREAKS; }
addSymbol  { return ADD_SYMBOL; }
counterFunction { return COUNTER_FUNCTION; }
totalStreaks { return TOTAL_STREAKS; }
multicotomize { return MULTICOTOMIZE; }

[0-9]+                  { return INTEGER_VALUE; }  
[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? { return FLOAT_VALUE; }

"\""[^"\n]*"\""         { return STRING_LITERAL; }
'.'        { return SYMBOL_VALUE; }


"="                     { return ASSIGN; }
"=="                    { return EQUALS; }
"<"                     { return LESS_THAN; }
">"                     { return GREATER_THAN; }
"<="                    { return LESS_THAN_OR_EQUAL_TO; }
">="                    { return GREATER_THAN_OR_EQUAL_TO; }
"!="                    { return NOT_EQUAL; }

"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MULTIPLY; }
"/"                     { return DIVIDE; }
"%"                     { return MODULO; }
"^"                     { return EXPONENT; }

";"                     { return SEMICOLON; }
"."                     { return DOT; }
","                     { return COMMA; }

[a-zA-Z]+               { return IDENTIFIER; }
"("                     { return LEFT_PAREN; }
")"                     { return RIGHT_PAREN; }
"{"                     { return LEFT_BRACE; }
"}"                     { return RIGHT_BRACE; }
"["                     { return LEFT_BRACKET; }
"]"                     { return RIGHT_BRACKET; }

"/*"(.|\n)*"*/"         { /* Ignore comments */ }
"//".*                  { /* Ignore single line comments */ }
[ \t\n]+                { /* Ignore whitespace */ }
.                       { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }                 

%%

int yywrap(void) { return 1; }