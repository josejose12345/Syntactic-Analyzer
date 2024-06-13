%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;
extern FILE *yyin;

int yylex(void);
void yyerror(const char *s);
extern char *yytext; // Variable que contiene el texto que causó el error

%}

%start Program
%token SEMICOLON DOT COMMA
%token INT FLOAT STRING SYMBOL
%token IDENTIFIER 
%token INTEGER_VALUE FLOAT_VALUE STRING_LITERAL SYMBOL_VALUE
%token EQUALS LESS_THAN GREATER_THAN LESS_THAN_OR_EQUAL_TO GREATER_THAN_OR_EQUAL_TO NOT_EQUAL ASSIGN
%token PLUS MINUS MULTIPLY DIVIDE MODULO EXPONENT PRINT
%token ALPHABET STREAK CATEGORY MULTICOTOMIZED_STRING TWO_WAY_CLASSIFICATION_MODEL ARRAY MATRIX
%token IF ELSE WHILE FOR LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE LEFT_BRACKET RIGHT_BRACKET
%token GET_STREAKS ADD_SYMBOL COUNTER_FUNCTION TOTAL_STREAKS MULTICOTOMIZE
%token TOTAL_DATA_MODEL TOTAL_DATA_BLOCK TOTAL_DATA_TREATMENT GET_TOTAL_DATA GET_BLOCK_DATA GET_TREATMENT_DATA
%token STREAK_NUMBER STREAK_AVERAGE BLOCK_STREAK_SUM TREATMENT_STREAK_SUM
%token AVERAGE_STREAK_BLOCK AVERAGE_STREAK_TREATMENT MODEL_STREAK_SUM MODEL_STREAK_AVERAGE

%%

Program : Statement
        | Program Statement
        ;

Statement : VariableDeclaration SEMICOLON
           | Assignment SEMICOLON
           | IfStatement
           | WhileStatement
           | ForStatement
           | PrintStatement SEMICOLON /* Added PrintStatement */
           | StreakFunction SEMICOLON /* Added StreakFunction */
           ;

VariableDeclaration : BasicType IDENTIFIER
                    | BasicType IDENTIFIER ASSIGN Expression
                    | BasicType IDENTIFIER MatrixSize
                    | SpecializedType IDENTIFIER
                    | SpecializedType IDENTIFIER LEFT_PAREN ExpressionList RIGHT_PAREN
                    | SpecializedType IDENTIFIER LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET /* Added ArrayDeclaration */
                    | SpecializedType IDENTIFIER LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET /* Added MatrixDeclaration */
                    ;

BasicType : INT
          | FLOAT
          | STRING
          | SYMBOL
          ;

Assignment : IDENTIFIER ASSIGN Expression
            | IDENTIFIER MatrixSize ASSIGN Expression
            | IDENTIFIER ASSIGN 
           ;

Expression : INTEGER_VALUE
            | FLOAT_VALUE
            | STRING_LITERAL
            | SYMBOL_VALUE
            | IDENTIFIER
            | ArithmeticOperation
            ;

ExpressionList : Expression
               | ExpressionList COMMA Expression
               ;

MatrixSize : LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           | LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           ;

ComparisonExpression : Expression ComparisonOperator Expression
                      ;

ComparisonOperator : ASSIGN
                   | LESS_THAN
                   | GREATER_THAN
                   | LESS_THAN_OR_EQUAL_TO
                   | GREATER_THAN_OR_EQUAL_TO
                   | NOT_EQUAL
                   ;

ArithmeticOperation : Expression ArithmeticOperator Expression
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
                | ARRAY
                | MATRIX
                ;

IfStatement : IF LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
            | IF LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE ELSE LEFT_BRACE Program RIGHT_BRACE
            ;

WhileStatement: WHILE LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
              ;

ForStatement: FOR LEFT_PAREN VariableDeclaration SEMICOLON ComparisonExpression SEMICOLON Assignment RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
            ;

/* PrintStatement */
PrintStatement : PRINT LEFT_PAREN Expression RIGHT_PAREN
               ;

/* StreakFunction */
StreakFunction : GET_STREAKS LEFT_PAREN Expression RIGHT_PAREN
               | ADD_SYMBOL LEFT_PAREN ExpressionList RIGHT_PAREN
               | COUNTER_FUNCTION LEFT_PAREN Expression RIGHT_PAREN
               | TOTAL_STREAKS LEFT_PAREN RIGHT_PAREN
               | MULTICOTOMIZE LEFT_PAREN Expression RIGHT_PAREN
               | TOTAL_DATA_MODEL LEFT_PAREN RIGHT_PAREN
               | TOTAL_DATA_BLOCK LEFT_PAREN Expression RIGHT_PAREN
               | TOTAL_DATA_TREATMENT LEFT_PAREN Expression RIGHT_PAREN
               | GET_TOTAL_DATA LEFT_PAREN RIGHT_PAREN
               | GET_BLOCK_DATA LEFT_PAREN Expression RIGHT_PAREN
               | GET_TREATMENT_DATA LEFT_PAREN Expression RIGHT_PAREN
               | STREAK_NUMBER LEFT_PAREN Expression RIGHT_PAREN
               | STREAK_AVERAGE LEFT_PAREN Expression RIGHT_PAREN
               | BLOCK_STREAK_SUM LEFT_PAREN Expression RIGHT_PAREN
               | TREATMENT_STREAK_SUM LEFT_PAREN Expression RIGHT_PAREN
               | AVERAGE_STREAK_BLOCK LEFT_PAREN Expression RIGHT_PAREN
               | AVERAGE_STREAK_TREATMENT LEFT_PAREN Expression RIGHT_PAREN
               | MODEL_STREAK_SUM LEFT_PAREN RIGHT_PAREN
               | MODEL_STREAK_AVERAGE LEFT_PAREN RIGHT_PAREN
               ;

%%

int main (void) {
    FILE *file = fopen("input.in", "r");
    if (!file) {
        fprintf(stderr, "Could not open input.in\\n");
        return 1;
    }
    yyin = file;

    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s at line %d, near '%s'\n", s, yylineno, yytext);
}
