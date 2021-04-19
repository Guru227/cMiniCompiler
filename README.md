# cMiniCompiler
Compiler Design - 6th Semester Project

## Pre-requisites
flex and bison should be installed as the lex and yacc compiler respectiely. Install that by executing:
`sudo apt install bison flex`

## For 1_lexer
Checks if given input file has valid syntax or not.

### To compile, move to 1_lexer directory and execute the script
`./1.sh` 

### To run the lexer, redirect the input file into the a.out file
`./a.out < temp`

## For 2_lexer_yacc
This script generates the symbol table of all the variables and constants used in the C program and calculates the output.

### To compile, move to 2_lexer_yacc directory and execute the script
`./1.sh` 

### To run the lexer, redirect the input file into the a.out file
`./a.out < temp`

## For 3_quadruple_icg
Simply run the shell script to compile and reduce the program into low level quadruple format code (similar to assembly).
It will also generate a table of quadruples.

`./run_quad.sh`

## For 4_code_opt
To generate optimized code from the qudruple format, execute the python script by running:
`python codeopt.py`
