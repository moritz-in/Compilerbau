%{
#include <stdio.h>
%}

%option noyywrap

ID [a-zA-Z][a-zA-Z0-9_]*


%%
"DECLARE" {
  fprintf(stderr, "LEX: Keyword: DECLARE\n");

}
"FUNCTION" {
  fprintf(stderr, "LEX: Keyword: FUNCTION\n");

}
"PREDICATE" {
  fprintf(stderr, "LEX: Keyword: PREDICATE\n");

}
"VARIABLE" {
  fprintf(stderr, "LEX: Keyword: VARIABLE\n");

}
":" {
  fprintf(stderr, "LEX: Keyword :\n");

}
"int" {
  fprintf(stderr, "LEX: Keyword int\n");

}
"<->" {
  fprintf(stderr,"LEX: Keyword EQUIVALENT\n");

}
"->" {
  fprintf(stderr,"LEX: Keyword implication\n");
}
"|" {
  fprintf(stderr,"LEX: Keyword OR\n");

}
"&" {
  fprintf(stderr,"LEX: Keyword AND\n");

}
"ALL" {
  fprintf(stderr,"LEX: Keyword ALL\n");

}
"EXIST" {
  fprintf(stderr, "LEX: Operator EXISTS\n");

}
"TRUE" {
  fprintf(stderr, "LEX: Keyword TRUE\n");

}
"FALSE" {
  fprintf(stderr, "LEX: Keyword FALSE\n");

}
"~" {
  fprintf(stderr, "LEX: Keyword negation %s\n", yytext );

}
"[" {
  fprintf(stderr, "LEX: Keyword eckige Klammer auf %s\n", yytext );

  }
"]" {
  fprintf(stderr, "LEX: Keyword eckige Klammer zu %s\n", yytext );

}
"(" {
  fprintf(stderr, "LEX: Keyword runde Klammer auf %s\n", yytext );

}
")" {
  fprintf(stderr, "LEX: Keyword runde Klammer zu %s\n", yytext );

}
"/*".*"*/" {
  fprintf(stderr, "LEX: Comment %s\n", yytext );
}
";" {
  fprintf(stderr, "LEX: Keyword ;\n");

}
"," {
  fprintf(stderr, "LEX: Keyword , \n");

}
{ID} {
  fprintf(stderr, "LEX: Identifier: %s\n", yytext );


}
[0-9]+ {
  fprintf(stderr,"LEX: Digit: %s\n", yytext );


}

[ \t\n\r] {

}
. {
  fprintf(stderr,"LEX: Error: %s\n", yytext );
}

%%

int main(int argc, char** argv)
{
  ++argv, --argc;  /* skip over program name */
  if ( argc > 0 )
    yyin = fopen( argv[0], "r" );
  else
    yyin = stdin;
  yylex();
}