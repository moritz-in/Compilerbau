objects = parser.o scanner.o main.o
CC = gcc
LEX = flex
YACC = bison

all: pl1c

pl1c: $(objects)
	$(CC) -o $@ $^

parser.c parser.h: parser.y
	$(YACC) -d $< -o parser.c

scanner.c: scanner.l
	$(LEX) -t $< > $@

parser.o: parser.c parser.h
scanner.o: scanner.c parser.h
main.o: main.c parser.h


clean:
	rm -f pl1c parser.c scanner.c parser.h $(objects)