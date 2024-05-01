%{
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;   /* Declare yylineno */
extern FILE *yyin;     /* Declare yyin */
%}

%start Program
%token SEMICOLON
%token INT FLOAT STRING
%token IDENTIFIER
%token INTEGER_VALUE FLOAT_VALUE STRING_LITERAL
%token EQUALS
%token ALPHABET STREAK CATEGORY TWO_WAY_CLASSIFICATION_MODEL

%%

Program : Statement
        | Program Statement
        ;

Statement : VariableDeclaration SEMICOLON;

VariableDeclaration : BasicType IDENTIFIER
                    | BasicType IDENTIFIER EQUALS Expression
                    | SpecializedType IDENTIFIER
                    ;

BasicType : INT
          | FLOAT
          | STRING
          ;

Expression : INTEGER_VALUE
            | FLOAT_VALUE
            | STRING_LITERAL
            ;

SpecializedType : ALPHABET | STREAK | CATEGORY | TWO_WAY_CLASSIFICATION_MODEL;

%%

int main (void) {
    FILE *file = fopen("input.in", "r");
    if (!file) {
        fprintf(stderr, "Could not open input.in\n");
        return 1;
    }
    yyin = file;

    return yyparse();
}

void yyerror (char *s) {
    fprintf(stderr, "%s at line %d\n", s, yylineno);
}