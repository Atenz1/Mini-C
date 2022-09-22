package codigo;
import java_cup.runtime.Symbol;
import java.util.ArrayList;
%%
%unicode
%class LexerCup
%cup
%line
%column


%{
    public String lexeme;
    String comentario="";
    String cadena="";
    ArrayList erroresLexicos = new ArrayList();
%}
LETTER = [a-zA-Z]
DIGIT = [0-9]+
SPACE = [" "]
QUOTE = \"
SPECIALCHAR = ","|":"|"'"|"!"|"?"|"¡"|"_"|"{"|"}"|"@"|"#"|"$"|"%"|"^"|"&"
DIGITFLOAT = ([0-9]*[.])?[0-9]+
FLOAT=float
COMMA = ","
MAIN=main
COMPARE = "=="
EQUALS = "="
COLON= ":"
SEMICOLON= ";"
PAR_L = "("
PAR_R = ")"
CURLY_I = "{"
CURLY_D = "}"
NEWLINE = \n
NEWLINES = \n|\r|\n\r|\t|{SPACE}
AND = "and"
OPINCDEC = "++"| "--"
OR = "or"
OPREL = "<"|">"|"<="|">="|"=="|"/="
FUNCTION="function"
OPSUM = [+-]
OPMULT = [*/]
IF = "if"
ELSE = "else"
VBOOLTRUE= true
VBOOLFALSE= false
FOR =for
WHILE=while
SWITCH=switch
VOID=void
CASE=case
ENDCASE=break
DEFAULT=default
INT=int
CHAR=char
PRINT=print
RETURN=return
BOOLEAN=bool
ASSIGNAMENT= " "
ID = {LETTER}({LETTER}|{DIGIT})*|{LETTER}({LETTER}|{DIGIT})*



L_COMMENT = "//"({LETTER}|{DIGIT}|" "|{SPECIALCHAR}|{OPREL}|{OPMULT}|{OPSUM}|{PAR_L}|{PAR_R})*
COMMENT = "/*" ({LETTER}|{DIGIT}|" "|{SPECIALCHAR}|{OPREL}|{OPMULT}|{OPSUM}|{PAR_L}|{PAR_R})*
COMMENTS_SEGMENT_END = "*/"


%state BLOCK_COMMENT
%state BLOCK_COMMENT_SEGMENT

%%

<YYINITIAL>{
    {IF}            {return new Symbol(sym.ITS_IF           ,yyline+1 ,yycolumn+1 ,yytext());}
    {ELSE}          {return new Symbol(sym.ITS_ELSE         ,yyline+1 ,yycolumn+1 ,yytext());}
    {AND}           {return new Symbol(sym.ITS_AND          ,yyline+1 ,yycolumn+1 ,yytext());}
    {VBOOLTRUE}     {return new Symbol(sym.ITS_TRUE         ,yyline+1 ,yycolumn+1 ,yytext());}
    {VBOOLFALSE}    {return new Symbol(sym.ITS_FALSE        ,yyline+1 ,yycolumn+1 ,yytext());}
    {COLON}     {return new Symbol(sym.ITS_COLON    ,yyline+1 ,yycolumn+1 ,yytext());}
    {VOID}          {return new Symbol(sym.ITS_VOID         ,yyline+1 ,yycolumn+1 ,yytext());}
    {RETURN}        {return new Symbol(sym.ITS_RETURN       ,yyline+1 ,yycolumn+1 ,yytext());}
    {FUNCTION}       {return new Symbol(sym.ITS_FUNCTION      ,yyline+1 ,yycolumn+1 ,yytext());}
    {COMMA}          {return new Symbol(sym.ITS_COMMA         ,yyline+1 ,yycolumn+1 ,yytext());}
    {COMPARE}         {return new Symbol(sym.ITS_COMPARE        ,yyline+1 ,yycolumn+1 ,yytext());}
    {MAIN}          {return new Symbol(sym.ITS_MAIN         ,yyline+1 ,yycolumn+1 ,yytext());}
    {OR}            {return new Symbol(sym.ITS_OR           ,yyline+1 ,yycolumn+1 ,yytext());}
    {PRINT}      {return new Symbol(sym.ITS_PRINT     ,yyline+1 ,yycolumn+1 ,yytext());}
    {DIGIT}        {return new Symbol(sym.ITS_DIGIT       ,yyline+1 ,yycolumn+1 ,yytext());}
    {DIGITFLOAT}   {return new Symbol(sym.ITS_DIGITFLOAT  ,yyline+1 ,yycolumn+1 ,yytext());}
    {PAR_L}   {return new Symbol(sym.ITS_PAR_L  ,yyline+1 ,yycolumn+1 ,yytext());}
    {LETTER}         {return new Symbol(sym.ITS_LETTER        ,yyline+1 ,yycolumn+1 ,yytext());}
    {PAR_R}   {return new Symbol(sym.ITS_PAR_R  ,yyline+1 ,yycolumn+1 ,yytext());}
    {CURLY_I}       {return new Symbol(sym.ITS_CURLY_I      ,yyline+1 ,yycolumn+1 ,yytext());}
    {CURLY_D}      {return new Symbol(sym.ITS_CURLY_D     ,yyline+1 ,yycolumn+1 ,yytext());}
    {QUOTE}       {return new Symbol(sym.ITS_QUOTE      ,yyline+1 ,yycolumn+1 ,yytext());}
    {OPSUM}     {return new Symbol(sym.ITS_OPSUM    ,yyline+1 ,yycolumn+1 ,yytext());}
    {OPREL}         {return new Symbol(sym.ITS_OPREL        ,yyline+1 ,yycolumn+1 ,yytext());}
    {OPMULT}       {return new Symbol(sym.ITS_OPMULT       ,yyline+1 ,yycolumn+1 ,yytext());}
    {FOR}           {return new Symbol(sym.ITS_FOR          ,yyline+1 ,yycolumn+1 ,yytext());}
    {WHILE}         {return new Symbol(sym.ITS_WHILE        ,yyline+1 ,yycolumn+1 ,yytext());}
    {INT}           {return new Symbol(sym.ITS_INT          ,yyline+1 ,yycolumn+1 ,yytext());}
    {FLOAT}         {return new Symbol(sym.ITS_FLOAT        ,yyline+1 ,yycolumn+1 ,yytext());}
    {CHAR}          {return new Symbol(sym.ITS_CHAR         ,yyline+1 ,yycolumn+1 ,yytext());}
    {BOOLEAN}       {return new Symbol(sym.ITS_BOOLEAN      ,yyline+1 ,yycolumn+1 ,yytext());}
    {ASSIGNAMENT}   {return new Symbol(sym.ITS_ASSIGNAMENT  ,yyline+1 ,yycolumn+1 ,yytext());}
    {ID}            {return new Symbol(sym.ITS_ID           ,yyline+1 ,yycolumn+1 ,yytext());}
    {EQUALS}        {return new Symbol(sym.ITS_EQUALS ,yyline+1 ,yycolumn+1 ,yytext());}
    {SEMICOLON} {return new Symbol(sym.ITS_SEMICOLON ,yyline+1 ,yycolumn+1 ,yytext());}
    {OPINCDEC}         {return new Symbol(sym.ITS_OPINCDEC ,yyline+1 ,yycolumn+1 ,yytext());}
    {NEWLINES}    {}

    {L_COMMENT}     {yybegin(BLOCK_COMMENT);}
	{COMMENT}       {yybegin(BLOCK_COMMENT_SEGMENT);}
    .               { erroresLexicos.add("Error lexico en linea: "+ (yyline+1) +" y columna " + (yycolumn+1) +" y en el texto: "+yytext()); }
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