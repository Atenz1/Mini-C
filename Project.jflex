
import java_cup.runtime.*;
import java.util.ArrayList;

%%

%class LexicalElements
%cupsym Sym
%cup
%standalone
%unicode
%integer
%ignorecase
%line
%column

%{
	public static int erroresLexicos = 0;
%}

/*Symbols */

letter = [a-z]|[A-Z]|"_"
digit = [0-9]

/* Integer */
int = {digit}+

/* Boolean */
bool = true|false

/* Identifier */
identifier = {letter}({digit}|{letter})*


//separadores y delimitadores
l_key = "{"
r_key = "}"
l_bracket= "["
r_bracket ="]"
l_par="("
r_par=")"
comma =","
semicolon=";"
colon=":"
dot="."

special_characters = "^"|@|"$"|#|&|"%"|"'"|"?"|"!"|{left_curly_bracket}|{right_curly_bracket}|{semicolon}|{lpar}|{rpar}|{dot}|{comma}|{colon}|{left_square_bracket}|{right_square_bracket}

//
/* Comments */
comment_start = "//"
break_line = \n
comments_line = {comment_start}{letter}*{break_line}
comments_segment_Start = "/*"
comments_segment_End = "*/"

//saltos de linea y espacios
newline = [\n]
spaces = [ \n\t\r]

equals = "="

//operadores aritmeticos
op_mult = "*"|"/"
op_sum = "+"|"-"
op_inc = "++"
op_dec = "--"
op_mod = "%"
const_char = '({letter}|{digit}|{special_characters}|" ")'
const_str = '({letter}|{digit}|{special_characters}|" ")+'

//operador condicional
op_condicional = "?:"

//operadores de asignacion
OPASIGN="="
OPASIGNADD= "+=" | "-="
OPASIGNMULT= "*=" | "/="

//operadores relacionales
OPCOMP= "=="
OPDIF = "!="
OPGREATER= ">"
OPGREATEREQ= ">="
OPLESS= "<"
OPLESSEQ = "<="
OPAND ="&&"
OPOR="||"
OPREL = {OPCOMP}|{OPDIF}|{OPGREATER}|{OPGREATEREQ}|{OPLESS}|{OPLESSEQ}|{OPAND}|{OPOR}


//reservadas
integer = "int"
float = "float"
character= "chr"
bool = "bool"
string = "string"
if = "if"
else ="else"
elif = "elif"
while = "while"
for = "for"
main = "main"
return = "return"
true = "true"
false ="false"
null = "null"
break = "stop"
function = "fnc"
upTo = "to"
downTo = "until"
var = "var"
return = "rtn"

//switch 
// case = "case"
// scenario = "scenario"
// default= "dft"

//Escritura y lectura
lectura = "scanf"
escritura = "printf"


float_value = {numbers}{dot}{numbers}

%state BLOCK_COMMENT
%state BLOCK_COMMENT_SEGMENT

%%

<YYINITIAL>
{
	"main"			{ return new Symbol(sym.main,yycolumn,yyline); }
	"char"			{ System.out.println("char"); }
	"integer"		{ System.out.println("int"); }
	"string"		{ System.out.println("string"); }
	"case"			{ System.out.println("case"); }
   
    "if"			{ System.out.println("if"); }
	"else"			{ System.out.println("else"); }
	"while"			{ System.out.println("while"); }

	{int}			{ return new Symbol(sym.INT,yycolumn,yyline,yytext()); }
	{bool}			{ return new Symbol(sym.BOOL,yycolumn,yyline,yytext()); }
    {equals}						{ return new Symbol(sym.EQUALS,yycolumn,yyline,yytext()); }

	{op_rel}						{ return new Symbol(sym.OPREL,yycolumn,yyline,yytext()); }

	{op_sum}						{ return new Symbol(sym.OPSUM,yycolumn,yyline,yytext()); }
	{op_mult}						{ return new Symbol(sym.OPMULT,yycolumn,yyline,yytext()); }

	{semicolon}						{ return new Symbol(sym.SEMICOLON,yycolumn,yyline); }
	{colon}							{ return new Symbol(sym.COLON,yycolumn,yyline); }
	{dot}							{ return new Symbol(sym.DOT,yycolumn,yyline); }
	{comma}							{ return new Symbol(sym.COMMA,yycolumn,yyline); }
	{lpar}							{ return new Symbol(sym.LPAR,yycolumn,yyline); }
	{rpar}							{ return new Symbol(sym.RPAR,yycolumn,yyline); }
	{left_square_bracket}			{ return new Symbol(sym.LBRAC,yycolumn,yyline); }
	{right_square_bracket}			{ return new Symbol(sym.RBRAC,yycolumn,yyline); }



	{comment_start}					{System.out.println("entre"+yytext()); yybegin(BLOCK_COMMENT);}
	{comments_segment_Start}		{System.out.println("entre"+yytext()); yybegin(BLOCK_COMMENT_SEGMENT);}
	.								{}

}


<BLOCK_COMMENT>
{
	{break_line}					{ System.out.println("Sali"); yybegin(YYINITIAL); }
	.								{ System.out.println(yytext()); }
}

<BLOCK_COMMENT_SEGMENT>
{
	{comments_segment_End}			{System.out.println("Sali" + yytext()); yybegin(YYINITIAL); }
	.								{ System.out.println(yytext()); }
}

// asd