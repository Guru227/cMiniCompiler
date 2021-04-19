lex cpp_1.l
printf "\n"
yacc -d cpp_1.y
printf "\n"
cc lex.yy.c y.tab.c -ll
rm lex.yy.c
rm y.tab.c y.tab.h
rm y.tab.h.gch
