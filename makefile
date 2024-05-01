workshop_2: y.tab.cpp lex.yy.cpp
	g++ -g y.tab.cpp lex.yy.cpp -o workshop_2

lex.yy.cpp: main.l
	flex -o lex.yy.cpp main.l

y.tab.cpp: main.y
	bison -d -o y.tab.cpp main.y

clean: 
	rm -rf lex.yy.cpp y.tab.cpp y.tab.hpp workshop_2 workshop_2.dSYM