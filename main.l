%{

#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%option yylineno
%%

int         { return INT; }
float       { return FLOAT; }
"="        { return EQUALS; }
";"         { return SEMICOLON; }
[a-zA-Z]+    {return IDENTIFIER; }
[0-9]+       {return INTEGER_VALUE; }
[0-9]+"."[0-9]*           { return FLOAT_VALUE; }
"/*"(.|\n)*"*/"           { /* Ignore comments */ }
"//".*                    { /* Ignore single line comments */ }
[ \t\n]+                  { /* Ignore whitespace */ }
.                         { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }                 
%%

int yywrap(void) { return 1; }

