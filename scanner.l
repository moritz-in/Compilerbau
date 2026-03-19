%{
#include "parser.h"
#include <string.h>
#include <stdio.h>
%}

%option noyywrap

ID [a-zA-Z][a-zA-Z0-9_]*
DIGIT [0-9]+

%%

"DECLARE"      { return DECLARE; }
"FUNCTION"     { return FUNCTION; }
"PREDICATE"    { return PREDICATE; }
"VARIABLE"     { return VARIABLE; }
":"            { return DD; }
"int"          { return INT; }

"<->"          { return EQUIVALENT; }
"->"           { return IMPLICATION; }
"|"            { return OR; }
"&"            { return AND; }
"ALL"          { return ALL; }
"EXIST"        { return EXIST; }
"TRUE"         { return TRUE; }
"FALSE"        { return FALSE; }
"~"            { return NOT; }
"["            { return B_O; }
"]"            { return B_C; }
"("            { return R_B_O; }
")"            { return R_B_C; }
";"            { return SEMICOLON; }
","            { return COMMA; }

{ID}           { strcpy(yylval.val, yytext); return ID; }
{DIGIT}        { yylval.number = atoi(yytext); return DIGIT; }

[ \t\n\r]+     ;  /* ignore whitespace */
.              { printf("LEX: unknown char '%s'\n", yytext); }

%%