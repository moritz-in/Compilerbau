#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "scanner.h"
#include "parser.h"


int yyparse(void);

int main(int argc, char** argv)
{
    ++argv, --argc;  /* skip over program name */
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;
        //yylex();
        yyparse();
}