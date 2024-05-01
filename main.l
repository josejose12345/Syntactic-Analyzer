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

[0-9]+                  { return INTEGER_VALUE; }
[0-9]+"."[0-9]*         { return FLOAT_VALUE; }
"\""[^"\n]*"\""         { return STRING_LITERAL; }

"="                     { return EQUALS; }
";"                     { return SEMICOLON; }

[a-zA-Z]+               { return IDENTIFIER; }

"/*"(.|\n)*"*/"         { /* Ignore comments */ }
"//".*                  { /* Ignore single line comments */ }
[ \t\n]+                { /* Ignore whitespace */ }
.                       { fprintf(stderr, "Invalid token: %s\n", yytext); exit(1); }                 

%%

int yywrap(void) { return 1; }