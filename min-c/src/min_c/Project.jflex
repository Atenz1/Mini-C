package min_c;
import java_cup.runtime.Symbol;
import java_cup.runtime.*;
import java.util.*;

%%
%unicode
%class Lexer
%line
%class LexicalElements
%integer
%standalone
%column
%cup
%ignorecase
%state BLOCK_COMMENT
%state BLOCK_COMMENT_SEGMENT

%{
    ArrayList output = new ArrayList();
%}

%{
    public static int erroresLexicos = 0;
%}

//Caracteres
LETTER = [a-zA-Z]|"_"
DIGIT = [0-9]

//manejo de arreglo
ARRAY = "[]"
BRACKET_L = "["
BRACKET_R = "]"

//Operaciones y caracteres especiales
SPACE = [" "]
NEWLINE=\n
NEWLINES = \n|\r|\n\r|\t|{SPACE}
SPECIALCHAR = ","|":"|"'"|"!"|"?"|"¡"|"_"|"{"|"}"|"@"|"#"|"$"|"%"|"^"|"&"
ASSIGNMENT = "="
DECLARE = " "
OPREL = :==|"/="|"<"|"<="|">"|">="
OPMULT = "*" | "/"
OPSUM = "+" | "-"
BRA_L = "{"
BRA_R = "}"
PAR_L = "("
PAR_R = ")"
SEMICOLON = ";"
COMMA = ","
COLON = ":"
DOT = "."


//Identicador
ID = {LETTER}({LETTER}|{DIGIT})*|{LETTER}({LETTER}|{DIGIT})*


//Numeros
NUMINT ={DIGIT}+|"-"{DIGIT}+

DOUBLE = {DIGIT}+{DOT}{DIGIT}+|"-"{DIGIT}+{DOT}{DIGIT}+

//comments
L_COMMENT = "//"({LETTER}|{DIGIT}|" "|{SPECIALCHAR}|{OPREL}|{OPMULT}|{OPSUM}|{PAR_L}|{PAR_R})*
COMMENT = "/*" ({LETTER}|{DIGIT}|" "|{SPECIALCHAR}|{OPREL}|{OPMULT}|{OPSUM}|{PAR_L}|{PAR_R})*
COMMENTS_SEGMENT_END = "*/"

//String and chars
STRING = "\"" ({LETTER}|{DIGIT}|{SPACE}|{SPECIALCHAR}|{OPREL}|{PAR_L}|{PAR_R})* + "\""
CHARACTER = "\'"({LETTER}|{DIGIT})"\'"

//tipos
INT = ("int")
BOOLEAN =("bool")
CHAR=("chr")
STR=("string")
VOID=("void")
AND=("&&")
OR=("||")

//Decisiones
MAIN = ("main")
ELSE = ("else")
IF = ("if")

//Palabras
EXIT = ("exit")
NULL = ("null")
RETURN = ("return")
TRUE = ("true")
FALSE = ("false")
//SCENARIO = ("scenario")
//BRK = ("stop")
//DFT = ("dft")
FUNC =("function")

//Fors, while y switch
FOR = ("for")
WHILE = ("while")
//SWITCH = ("swch")

//const y array
CONST = ("const")

//Escritura y lectura
SCANF = "scanf"
PRINTF = "printf"




%%

<YYINITIAL>{
	{MAIN} 							{return new Symbol(sym.ITSMAIN 	,yyline+1,yycolumn+1,yytext());}
	{DECLARE}					    {return new Symbol(sym.ITSDECLARE 	,yyline+1,yycolumn+1,yytext());}
	{ASSIGNMENT}					{return new Symbol(sym.ITSASSIGNMENT 	,yyline+1,yycolumn+1,yytext());}
	{NUMINT}						{return new Symbol(sym.ITSNUMINT 	,yyline+1,yycolumn+1,yytext());}

	{SCANF}							{return new Symbol(sym.ITSSCANF 	,yyline+1,yycolumn+1,yytext());}
	{PRINTF}						{return new Symbol(sym.ITSPRINTF 	,yyline+1,yycolumn+1,yytext());}
	
	{DOUBLE}                   {return new Symbol(sym.ITSDOUBLE 	,yyline+1,yycolumn+1,yytext());}
	
	{INT}                           {return new Symbol(sym.ITSINT            ,yyline+1,yycolumn+1,yytext());}   
	{BOOLEAN}                       {return new Symbol(sym.ITSBOOLEAN            ,yyline+1,yycolumn+1,yytext());}   
	{VOID}                          {return new Symbol(sym.ITSVOID           ,yyline+1,yycolumn+1,yytext());}   
	{AND}                           {return new Symbol(sym.ITSAND           ,yyline+1,yycolumn+1,yytext());}   
	{OR}                            {return new Symbol(sym.ITSOR          ,yyline+1,yycolumn+1,yytext());}   
	{FUNC}                      	{return new Symbol(sym.ITSFUNCTION         ,yyline+1,yycolumn+1,yytext());}   
    {STRING}						{return new Symbol(sym.ITSSTRING 	,yyline+1,yycolumn+1,yytext());}
    {STR}                           {return new Symbol(sym.ITSSTR 	,yyline+1,yycolumn+1,yytext());}
    
    {L_COMMENT}                    	{yybegin(BLOCK_COMMENT);}
	{COMMENT}               		{yybegin(BLOCK_COMMENT_SEGMENT);}
	{CHAR}							{return new Symbol(sym.ITSCHAR 	,yyline+1,yycolumn+1,yytext());}
	{CHARACTER}						{return new Symbol(sym.ITSCHARACTER 	,yyline+1,yycolumn+1,yytext());}
	{TRUE}							{return new Symbol(sym.ITSTRUE 	,yyline+1,yycolumn+1,yytext());}
	{FALSE}							{return new Symbol(sym.ITSFALSE 	,yyline+1,yycolumn+1,yytext());}
	{FOR}							{return new Symbol(sym.ITSFOR 	,yyline+1,yycolumn+1,yytext());}
	{WHILE}							{return new Symbol(sym.ITSWHILE 	,yyline+1,yycolumn+1,yytext());}
	
	{IF}							{return new Symbol(sym.ITSIF 	,yyline+1,yycolumn+1,yytext());}
	{ELSE}							{return new Symbol(sym.ITSELSE 	,yyline+1,yycolumn+1,yytext());}

	{RETURN}						{return new Symbol(sym.ITSRETURN 	,yyline+1,yycolumn+1,yytext());}
	{NULL}							{return new Symbol(sym.ITSNULL 	,yyline+1,yycolumn+1,yytext());}
	{SEMICOLON}						{return new Symbol(sym.ITSSEMICOLON 	,yyline+1,yycolumn+1,yytext());}
	{COMMA}                         {return new Symbol(sym.ITSCOMMA 	,yyline+1,yycolumn+1,yytext());}
	{COLON}							{return new Symbol(sym.ITSCOLON 	,yyline+1,yycolumn+1,yytext());}
	{OPREL}							{return new Symbol(sym.ITSOPREL 	,yyline+1,yycolumn+1,yytext());}
	{OPMULT}                        {return new Symbol(sym.ITSOPMULT 	,yyline+1,yycolumn+1,yytext());}
	{OPSUM}                         {return new Symbol(sym.ITSOPSUM 	,yyline+1,yycolumn+1,yytext());}
	{BRA_L}							{return new Symbol(sym.ITSBRA_L 	,yyline+1,yycolumn+1,yytext());}
	{BRA_R}							{return new Symbol(sym.ITSBRA_R 	,yyline+1,yycolumn+1,yytext());}
	{PAR_L}							{return new Symbol(sym.ITSPAR_L	,yyline+1,yycolumn+1,yytext());}
	{PAR_R}							{return new Symbol(sym.ITSPAR_R 	,yyline+1,yycolumn+1,yytext());}
        
    {CONST}							{return new Symbol(sym.ITSCONST 	,yyline+1,yycolumn+1,yytext());}
    {ARRAY}							{return new Symbol(sym.ITSARRAY 	,yyline+1,yycolumn+1,yytext());}
    {BRACKET_L}                     {return new Symbol(sym.ITSBRACKET_L 	,yyline+1,yycolumn+1,yytext());}
    {BRACKET_R}						{return new Symbol(sym.ITSBRACKET_R 	,yyline+1,yycolumn+1,yytext());}
	
	{EXIT}							{return new Symbol(sym.ITSEXIT 	,yyline+1,yycolumn+1,yytext());}								
    {ID}							{return new Symbol(sym.ITSID 	,yyline+1,yycolumn+1,yytext());}	
    {SPACE}                       	{}
	{NEWLINES}                    	{}
    .                               {System.out.println("Error lexico. Caracter illegal: <" + yytext() + ">. Línea: " + (yyline + 1) + ", Columna: " + (yycolumn + 1));
                                       /*output.add("Error lexico. Caracter illegal: <" + yytext() + ">. Línea: " + (yyline + 1) + ", Columna: " + (yycolumn + 1));*/
                            			erroresLexicos++;
                            		}
}
<BLOCK_COMMENT>
{
	{NEWLINE}					{ yybegin(YYINITIAL); }
	.								{/*nothing*/}
}

<BLOCK_COMMENT_SEGMENT>
{
	{COMMENTS_SEGMENT_END}			{ yybegin(YYINITIAL); }
	.								{/*nothing*/}
}