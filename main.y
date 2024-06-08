%{
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
extern int yylineno;   /* Declare yylineno */
extern FILE *yyin;     /* Declare yyin */

int yylex(void);       /* Declare yylex */
void yyerror(const char *s); /* Declare yyerror */

// Declaraciones de funciones
void getStreaks();
void addSymbol(const char* symbol);
int counterFunction();
int totalStreaks();
void multicotomize(const char* str);
void totalDataModel();
void totalDataBlock();
void totalDataTreatment();
void getTotalData();
void getBlockData();
void getTreatmentData();
%}

%start Program
%token SEMICOLON DOT COMMA
%token INT FLOAT STRING SYMBOL
%token IDENTIFIER
%token INTEGER_VALUE FLOAT_VALUE STRING_LITERAL SYMBOL_VALUE
%token EQUALS LESS_THAN GREATER_THAN LESS_THAN_OR_EQUAL_TO GREATER_THAN_OR_EQUAL_TO NOT_EQUAL ASSIGN
%token PLUS MINUS MULTIPLY DIVIDE MODULO EXPONENT
%token ALPHABET STREAK CATEGORY MULTICOTOMIZED_STRING TWO_WAY_CLASSIFICATION_MODEL
%token IF ELSE WHILE FOR LEFT_PAREN RIGHT_PAREN LEFT_BRACE RIGHT_BRACE LEFT_BRACKET RIGHT_BRACKET
%token GET_STREAKS ADD_SYMBOL COUNTER_FUNCTION TOTAL_STREAKS MULTICOTOMIZE
%token TOTAL_DATA_MODEL TOTAL_DATA_BLOCK TOTAL_DATA_TREATMENT GET_TOTAL_DATA GET_BLOCK_DATA GET_TREATMENT_DATA

%%

Program : Statement
        | Program Statement
        ;

Statement : VariableDeclaration SEMICOLON
           | Function SEMICOLON
           | Assignment SEMICOLON
           | IfStatement
           | WhileStatement
           | ForStatement
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

Assignment : IDENTIFIER ASSIGN Expression
            | IDENTIFIER MatrixSize ASSIGN Expression
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
               | // Empty. This allows for functions with no arguments
               ;

MatrixSize : LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           | MatrixSize LEFT_BRACKET INTEGER_VALUE RIGHT_BRACKET
           ;



Function : IDENTIFIER DOT FunctionName | PiecewiseFunction;

PiecewiseFunction : IDENTIFIER LEFT_PAREN RIGHT_PAREN
                   | IDENTIFIER LEFT_PAREN ExpressionList RIGHT_PAREN
                   ;


FunctionName: GET_STREAKS LEFT_PAREN RIGHT_PAREN { getStreaks(); }
            | ADD_SYMBOL LEFT_PAREN SYMBOL_VALUE RIGHT_PAREN { addSymbol($3); }
            | ADD_SYMBOL LEFT_PAREN IDENTIFIER RIGHT_PAREN { addSymbol($3); }
            | COUNTER_FUNCTION LEFT_PAREN RIGHT_PAREN { $$ = counterFunction(); }
            | TOTAL_STREAKS LEFT_PAREN RIGHT_PAREN { $$ = totalStreaks(); }
            | MULTICOTOMIZE LEFT_PAREN ExpressionList RIGHT_PAREN { multicotomize("some_string"); /* Implementación específica */ }
            | TOTAL_DATA_MODEL LEFT_PAREN RIGHT_PAREN { totalDataModel(); }
            | TOTAL_DATA_BLOCK LEFT_PAREN RIGHT_PAREN { totalDataBlock(); }
            | TOTAL_DATA_TREATMENT LEFT_PAREN RIGHT_PAREN { totalDataTreatment(); }
            | GET_TOTAL_DATA LEFT_PAREN RIGHT_PAREN { getTotalData(); }
            | GET_BLOCK_DATA LEFT_PAREN RIGHT_PAREN { getBlockData(); }
            | GET_TREATMENT_DATA LEFT_PAREN RIGHT_PAREN { getTreatmentData(); }
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

WhileStatement: WHILE LEFT_PAREN ComparisonExpression RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
              ;

ForStatement: FOR LEFT_PAREN VariableDeclaration SEMICOLON ComparisonExpression SEMICOLON Assignment RIGHT_PAREN LEFT_BRACE Program RIGHT_BRACE
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
void getStreaks() {
    printf("Called getStreaks\n");
    // Implementación de la lógica de getStreaks
}

void addSymbol(const char* symbol) {
    printf("Called addSymbol with %s\n", symbol);
    // Implementación de la lógica de addSymbol
}

int counterFunction() {
    printf("Called counterFunction\n");
    // Implementación de la lógica de counterFunction
    return 0;
}

int totalStreaks() {
    printf("Called totalStreaks\n");
    // Implementación de la lógica de totalStreaks
    return 0;
}

void multicotomize(const char* str) {
    printf("Called multicotomize with %s\n", str);
    // Implementación de la lógica de multicotomize
}

void totalDataModel() {
    printf("Called totalDataModel\n");
    // Implementación de la lógica de totalDataModel
}

void totalDataBlock() {
    printf("Called totalDataBlock\n");
    // Implementación de la lógica de totalDataBlock
}

void totalDataTreatment() {
    printf("Called totalDataTreatment\n");
    // Implementación de la lógica de totalDataTreatment
}

void getTotalData() {
    printf("Called getTotalData\n");
    // Implementación de la lógica de getTotalData
}

void getBlockData() {
    printf("Called getBlockData\n");
    // Implementación de la lógica de getBlockData
}

void getTreatmentData() {
    printf("Called getTreatmentData\n");
    // Implementación de la lógica de getTreatmentData
}