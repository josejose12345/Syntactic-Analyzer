%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "main.tab.h"


%}

%option yylineno

%%

Alphabet { return ALPHABET; }
Streak {return STREAK;}
Category {return CATEGORY;}
MulticotomizedString {return MULTICOTOMIZED_STRING;}
TwoWayClassificationModel {return TWO_WAY_CLASSIFICATION_MODEL;}
array       {return ARRAY;}
matrix      {return MATRIX;}


int         { return INT; }
float       { return FLOAT; }
String      { return STRING; }
symbol      { return SYMBOL; }



if          { return IF; }
else        { return ELSE; }
while       { return WHILE; }
for         { return FOR; }


print       {return PRINT;}


getStreaks              {return GET_STREAKS; }
addSymbol               {return ADD_SYMBOL; }
counterFunction         {return COUNTER_FUNCTION; }
totalStreaks            {return TOTAL_STREAKS; }
multicotomize           {return MULTICOTOMIZE; }
totalDataModel          {return TOTAL_DATA_MODEL;}
totalDataBlock          {return TOTAL_DATA_BLOCK;}
totalDataTreatment      {return TOTAL_DATA_TREATMENT;}
getTotalData            {return GET_TOTAL_DATA;}
getBlockData            {return GET_BLOCK_DATA;}
getTreatmentData        {return GET_TREATMENT_DATA;}
streakNumber            {return STREAK_NUMBER;}
streakAverage           {return STREAK_AVERAGE;}
blockStreakSum          {return BLOCK_STREAK_SUM;}
treatmentStreakSum      {return TREATMENT_STREAK_SUM;}
averageStreakBlock      {return AVERAGE_STREAK_BLOCK;}
averageStreakTreatment  {return AVERAGE_STREAK_TREATMENT ;}
modelStreakAverage      {return MODEL_STREAK_AVERAGE;}
modelStreakSum          {return MODEL_STREAK_SUM;}



[0-9]+                  { return INTEGER_VALUE; }  
[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)? { return FLOAT_VALUE; }

"\'"([a-zA-Z])"\'"      { return SYMBOL_VALUE; }
"\""[^"\n]*"\""         { return STRING_LITERAL; }

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