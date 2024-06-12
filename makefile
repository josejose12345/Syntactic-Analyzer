# Makefile for Flex and Bison project

# Define the compiler and flags
CC = gcc
FLEX = flex
BISON = bison
FLEX_FLAGS = 
BISON_FLAGS = -d
CFLAGS = -lfl

# Define the targets
all: myparser

myparser: lex.yy.o main.tab.o
	$(CC) lex.yy.o main.tab.o -o myparser $(CFLAGS)

lex.yy.o: lex.yy.c main.tab.h
	$(CC) -c lex.yy.c

main.tab.o: main.tab.c
	$(CC) -c main.tab.c

lex.yy.c: main.l
	$(FLEX) $(FLEX_FLAGS) main.l

main.tab.c main.tab.h: main.y
	$(BISON) $(BISON_FLAGS) main.y

clean:
	rm -f myparser lex.yy.c main.tab.c main.tab.h lex.yy.o main.tab.o

.PHONY: all clean
