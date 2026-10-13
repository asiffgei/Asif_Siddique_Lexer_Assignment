%{
#include <stdio.h>
%}

%option noyywrap

DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER      {DIGIT}+
STRING      \"[^\"]*\"

%%

"start"     { printf("KEYWORD_START: %s\n", yytext); }
"end"       { printf("KEYWORD_END: %s\n", yytext); }
"let"       { printf("KEYWORD_LET: %s\n", yytext); }
"if"        { printf("KEYWORD_IF: %s\n", yytext); }
"show"      { printf("KEYWORD_SHOW: %s\n", yytext); }

"<="        { printf("OPERATOR_LE: %s\n", yytext); }
"="         { printf("OPERATOR_ASSIGN: %s\n", yytext); }
"+"         { printf("OPERATOR_PLUS: %s\n", yytext); }
"*"         { printf("OPERATOR_MUL: %s\n", yytext); }

";"         { printf("SEMICOLON: %s\n", yytext); }
"("         { printf("LPAREN: %s\n", yytext); }
")"         { printf("RPAREN: %s\n", yytext); }

{STRING}    { printf("STRING_LITERAL: %s\n", yytext); }
{NUMBER}    { printf("NUMBER: %s\n", yytext); }
{ID}        { printf("IDENTIFIER: %s\n", yytext); }

[ \t\n]+    { /* skip whitespace */ }
.           { printf("UNKNOWN: %s\n", yytext); }

%%

int main() {
    printf("Lexer started...\n");
    yylex();
    return 0;
}