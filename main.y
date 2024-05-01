%{
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;   /* Declare yylineno */
extern FILE *yyin;     /* Declare yyin */

%}


%start Program
%token SEMICOLON
%token INT FLOAT
%token IDENTIFIER
%token INTEGER_VALUE, FLOAT_VALUE
%token EQUALS


%%

Program : Statement
        | Program Statement
        ;


Statement : VariableDeclaration SEMICOLON;

VariableDeclaration : Type IDENTIFIER
                    | Type IDENTIFIER EQUALS Expression
                    ;

Type : INT
     | FLOAT
     ;

Expression : INTEGER_VALUE
             | FLOAT_VALUE
           ;

%%


int main (void) {
	FILE *file = fopen("input.in", "r");
    if (!file) {
        fprintf(stderr, "Could not open input.in\n");
        return 1;
    }
    yyin = file;

	return yyparse ( );
}

void yyerror (char *s) {
    fprintf (stderr, "%s at line %d\n", s, yylineno);
}
