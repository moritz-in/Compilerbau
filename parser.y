%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void);
int yyerror(const char *s);
%}

%union {
    char val[101];
    int number;
}

%left EQUIVALENT
%left IMPLICATION
%left OR
%left AND
%left NOT
%left ALL EXIST B_O B_C
%left COMMA

%token <val> ID
%token <number> DIGIT
%token TRUE FALSE
%token DECLARE PREDICATE FUNCTION VARIABLE DD INT
%token SEMICOLON COMMA
%token ALL EXIST NOT AND OR EQUIVALENT IMPLICATION
%token R_B_O R_B_C B_O B_C

%%

file:
      /* empty */
    | file declarations
    | file formula SEMICOLON
;

declarations:
      DECLARE PREDICATE ID DD DIGIT {
        fprintf(stderr,"PARSER: Declare Predicate %s with %d\n", $3, $5);
      }
    | DECLARE FUNCTION ID DD DIGIT {
        fprintf(stderr,"PARSER: Declare Function %s with %d\n", $3, $5);
      }
    | DECLARE VARIABLE ID DD INT {
        fprintf(stderr,"PARSER: Declare Variable %s with int\n", $3);
      }
;

formula:
      ID R_B_O term R_B_C {
        fprintf(stderr,"PARSER: %s( )\n", $1);
      }
    | TRUE {
        fprintf(stderr,"PARSER: True\n");
      }
    | FALSE {
        fprintf(stderr,"PARSER: False\n");
      }
    | R_B_O formula R_B_C {
        fprintf(stderr,"PARSER: ( )\n");
      }
    | NOT formula {
        fprintf(stderr,"PARSER: ~\n");
      }
    | formula AND formula {
        fprintf(stderr,"PARSER: AND\n");
      }
    | formula OR formula {
        fprintf(stderr,"PARSER: OR\n");
      }
    | formula EQUIVALENT formula {
        fprintf(stderr,"PARSER: EQUIVALENT\n");
      }
    | formula IMPLICATION formula {
        fprintf(stderr,"PARSER: IMPLICATION\n");
      }
    | ALL B_O ID B_C formula {
        fprintf(stderr,"PARSER: ALL[%s]\n", $3);
      }
    | EXIST B_O ID B_C formula {
        fprintf(stderr,"PARSER: EXIST[%s]\n", $3);
      }
;

term:
      ID {
        fprintf(stderr,"PARSER: ID %s\n", $1);
      }
    | DIGIT {
        fprintf(stderr,"PARSER: DIGIT %d\n", $1);
      }
    | ID R_B_O term R_B_C {
        fprintf(stderr,"PARSER: %s( )\n", $1);
      }
    | term COMMA term {
        fprintf(stderr,"PARSER: ,\n");
      }
;

%%

int yyerror(const char *s){
    fprintf(stderr,"ERROR: %s\n", s);
    return 0;
}