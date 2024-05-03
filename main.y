%{
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;   /* Declare yylineno */
extern FILE *yyin;     /* Declare yyin */

int yylex(void);       /* Declare yylex */
void yyerror(const char *s); /* Declare yyerror */
%}

%start Program
%token SEMICOLON DOT COMMA
%token INT FLOAT STRING SYMBOL
%token IDENTIFIER
%token INTEGER_VALUE FLOAT_VALUE STRING_LITERAL SYMBOL_VALUE
%token EQUALS LESS_THAN GREATER_THAN LESS_THAN_OR_EQUAL_TO GREATER_THAN_OR_EQUAL_TO NOT_EQUAL ASSIGN
%token PLUS MINUS MULTIPLY DIVIDE MODULO EXPONENT
%token ALPHABET STREAK CATEGORY MULTICOTOMIZED_STRING TWO_WAY_CLASSIFICATION_MODEL
%token IF ELSE LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE LEFT_BRACKET RIGHT_BRACKET
%token GET_STREAKS ADD_SYMBOL COUNTER_FUNCTION TOTAL_STREAKS

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
                    | BasicType IDENTIFIER MatrixSize
                    | SpecializedType IDENTIFIER
                    | SpecializedType IDENTIFIER LEFT_PAREN ExpressionList RIGHT_PAREN
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

MatrixSize : LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           | MatrixSize LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           ;



Function : IDENTIFIER DOT FunctionName;


FunctionName: GET_STREAKS LEFT_PAREN RIGHT_PAREN
            | ADD_SYMBOL LEFT_PAREN SYMBOL_VALUE RIGHT_PAREN
            | ADD_SYMBOL LEFT_PAREN IDENTIFIER RIGHT_PAREN
            | COUNTER_FUNCTION LEFT_PAREN RIGHT_PAREN
            | TOTAL_STREAKS LEFT_PAREN RIGHT_PAREN
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

ArithmeticOperation : Expression ArithmeticOperator Expression
                     | IDENTIFIER ArithmeticOperator Expression
                     | IDENTIFIER ArithmeticOperator IDENTIFIER
                     | Expression ArithmeticOperator IDENTIFIER
                        ;

ArithmeticOperator : PLUS 
                   | MINUS
                   | MULTIPLY
                   | DIVIDE
                   | MODULO
                   | EXPONENT
                   ;


SpecializedType : ALPHABET
                | STREAK
                | CATEGORY
                | MULTICOTOMIZED_STRING
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