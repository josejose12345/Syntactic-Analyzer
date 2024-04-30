workshop_2: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o workshop_2

lex.yy.c: y.tab.c main.l
	lex main.l

y.tab.c: main.y
	yacc -d main.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h workshop_2 workshop_2.dSYM