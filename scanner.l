%{

%}

%%
"DECLARE" {
  fprintf(stderr, "LEX: Keyword: DECLARE\n");
  return DECLARE;
}
"FUNCTION" {
  fprintf(stderr, "LEX: Keyword: FUNCTION\n");
  return FUNCTION;
}
"PREDICATE" {
  fprintf(stderr, "LEX: Keyword: PREDICATE\n");
  return PREDICATE;
}
"VARIABLE" {
  fprintf(stderr, "LEX: Keyword: VARIABLE\n");
  return VARIABLE;
}
":" {
  fprintf(stderr, "LEX: Keyword :\n");
  return DD;
}
"int" {
  fprintf(stderr, "LEX: Keyword int\n");
  return INT;
}
"<->" {
  fprintf(stderr,"LEX: Keyword EQUIVALENT\n");
  return EQUIVALENT;
}
"->" {
  fprintf(stderr,"LEX: Keyword implication\n");
  return IMPLICATION;
}
%%