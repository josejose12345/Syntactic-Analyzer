%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%option yylineno

%%

alphabet { return ALPHABET; }
streak {return STREAK;}
category {return CATEGORY;}
two_way_classification_model { return TWO_WAY_CLASSIFICATION_MODEL; }


int         { return INT; }
float       { return FLOAT; }
string      { return STRING; }
symbol      { return SYMBOL; }

if          { return IF; }
else        { return ELSE; }


getStreaks { return GET_STREAKS; }
addCategory { return ADD_CATEGORY; }

[0-9]+                  { return INTEGER_VALUE; }
[0-9]+"."[0-9]*         { return FLOAT_VALUE; }

"\""[^"\n]*"\""         { return STRING_LITERAL; }
'.'        { return SYMBOL_VALUE; }


"="                     { return ASSIGN; }
"=="                    { return EQUALS; }
"<"                     { return LESS_THAN; }
">"                     { return GREATER_THAN; }
"<="                    { return LESS_THAN_OR_EQUAL_TO; }
">="                    { return GREATER_THAN_OR_EQUAL_TO; }
"!="                    { return NOT_EQUAL; }

";"                     { return SEMICOLON; }
"."                     { return DOT; }
","                     { return COMMA; }

[a-zA-Z]+               { return IDENTIFIER; }
"("                     { return LEFT_PAREN; }
")"                     { return RIGHT_PAREN; }
"{"                     { return LEFT_BRACE; }
"}"                     { return RIGHT_BRACE; }

"/*"(.|\n)*"*/"         { /* Ignore comments */ }
"//".*                  { /* Ignore single line comments */ }
[ \t\n]+                { /* Ignore whitespace */ }
.                       { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }                 

%%

int yywrap(void) { return 1; }