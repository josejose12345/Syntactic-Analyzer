%{
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;   /* Declare yylineno */
extern FILE *yyin;     /* Declare yyin */
%}

%start Program
%token SEMICOLON DOT COMMA
%token INT FLOAT STRING SYMBOL
%token IDENTIFIER
%token INTEGER_VALUE FLOAT_VALUE STRING_LITERAL SYMBOL_VALUE
%token EQUALS LESS_THAN GREATER_THAN LESS_THAN_OR_EQUAL_TO GREATER_THAN_OR_EQUAL_TO NOT_EQUAL ASSIGN
%token ALPHABET STREAK CATEGORY TWO_WAY_CLASSIFICATION_MODEL
%token IF ELSE LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE
%token GET_STREAKS ADD_CATEGORY GET_CATEGORIES

%%

Program : Statement
        | Program Statement
        ;

Statement : VariableDeclaration SEMICOLON
           | Function SEMICOLON
           | IfStatement
           ;

VariableDeclaration : BasicType IDENTIFIER
                    | BasicType IDENTIFIER ASSIGN Expression
                    | SpecializedType IDENTIFIER
                    ;

BasicType : INT
          | FLOAT
          | STRING
          | SYMBOL
          ;

Expression : INTEGER_VALUE
            | FLOAT_VALUE
            | STRING_LITERAL
            | SYMBOL_VALUE
            ;

ExpressionList : Expression
               | ExpressionList COMMA Expression
               | // Empty. This allows for functions with no arguments
               ;

Function : IDENTIFIER DOT FunctionName;


FunctionName: GET_STREAKS LEFT_PAREN RIGHT_PAREN
              |  ADD_CATEGORY LEFT_PAREN ExpressionList RIGHT_PAREN
              | GET_CATEGORIES LEFT_PAREN RIGHT_PAREN
              ;


ComparisonExpression : Expression ComparisonOperator Expression
                      | IDENTIFIER ComparisonOperator Expression
                      | IDENTIFIER ComparisonOperator IDENTIFIER
                      | Expression ComparisonOperator IDENTIFIER
                      ;

ComparisonOperator : EQUALS
                   | LESS_THAN
                   | GREATER_THAN
                   | LESS_THAN_OR_EQUAL_TO
                   | GREATER_THAN_OR_EQUAL_TO
                   | NOT_EQUAL
                   ;

SpecializedType : ALPHABET
                | STREAK
                | CATEGORY
                | TWO_WAY_CLASSIFICATION_MODEL
                ;

IfStatement : IF LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
            | IF LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE ELSE LEFT_BRACE Program RIGHT_BRACE
            ;

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