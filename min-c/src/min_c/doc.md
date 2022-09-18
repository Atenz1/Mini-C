

Manual de Usuario: **Cookie**
=============================

Contenido

- [Manual de Usuario: **Cookie**](#manual-de-usuario-cookie)
  - [1\. **Descripción**](#1-descripción)
  - [2\. **Dependencias**](#2-dependencias)
  - [3\. **Lenguaje**](#3-lenguaje)
    - [3.1. **Estructura**](#31-estructura)
      - [3.1.1. **Palabras Reservadas**](#311-palabras-reservadas)
      - [3.1.2. **Declaraciones, Instancias y Llamadas**](#312-declaraciones-instancias-y-llamadas)
        - [3.1.2.1. **Variables**](#3121-variables)
        - [3.1.2.2. **Funciones**](#3122-funciones)
          - [3.1.2.2.1. _**Definición**_](#31221-definición)
          - [3.1.2.2.2. _**Llamadas**_](#31222-llamadas)
          - [3.1.2.2.3. _**Funciones de Sistema**_](#31223-funciones-de-sistema)
      - [3.1.3. **Bucles**](#313-bucles)
          - [3.1.3.1. _**For**_](#3131-for)
          - [3.1.3.2. _**While**_](#3132-while)
      - [3.1.4. **Bloques de Decisión**](#314-bloques-de-decisión)
        - [3.1.4.1. _**If else**_](#3141-if-else)
        - [3.1.4.2. _**Switch**_](#3142-switch)
    - [3.2. **Léxico y Gramática**](#32-léxico-y-gramática)
      - [3.2.1. **Terminales**](#321-terminales)
      - [3.2.2. **No-Terminales**](#322-no-terminales)
  - [4\. **Demostración**](#4-demostración)

**Proyecto de Clase de Compiladores I creado por:**

*   **Bryan Alexis Mejia Fonseca**
    
*   **Jamil Fernando Villeda Cortez**
    

1\. **Descripción**
-------------------

Después de varias horas de pensar en un nombre único para este lenguaje, llegamos a la conclusión que queremos algo simple, que necesitariamos muchas galletas para no aguantar hambre y poder lograr concluir el proyecto de la clase. Así que el nombre de este proyecto nace de estar trabajando y necesitar algo rapido de alivar el hambre, y por eso, su nombre es **Cookie** ademas de ser simple y podria decirse algo elegante(?).

\-_Cookie simplicidad en el codigo._

2\. **Dependencias**
--------------------

Este proyecto actualmente utiliza las librerias de JFLEX y JCUP para trabajar la definición lexica y sintactica.

3\. **Lenguaje**
----------------

### 3.1. **Estructura**

#### 3.1.1. **Palabras Reservadas**

| Palabra Reservada | Significado |
| --- | --- |
| int | Tipo entero |
| chr | Tipo caracter |
| bool | Tipo booleano |
| string | Tipo cadena |
| if  | Para bloques de decisión |
| else | Para bloques de decisión |
| while  | Para bucles while |
| for | Para bucles for |
| main | Tag para función main |
| swch  | para bloques de decisión tipo switch |
| scenario | Para bloques de decisión tipo switch |
| dft | Para bloques de decisión tipo switch |
| stop | Para salir de un bucle o un bloque switch |
| void | Tipo void |
| true | Valor booleano |
| false | Valor booleano |
| null | Valor nulo |
| func | Diferenciador para funciones |
| input | Función de sistema |
| output | Función de sistema |

#### 3.1.2. **Declaraciones, Instancias y Llamadas**

##### 3.1.2.1. **Variables**

    int:= a;
    
    string:= b <- "holi";
    
    bool:= c <- false;
    
    int:= d[5] <- {1,2,3,4,5};
    
    int:= dd[2][2] <- {{1,2}, {3,4}};
    
    int:= indice <- d.at(3);
    
        indice <- dd.at(1,1);
    
    chr:= e <- 'e';

##### 3.1.2.2. **Funciones**

Para las funciones se definen en primer lugar usando la palabra reservada "func" seguido del id, sus parámetros entre paréntesis, los cuales se definen de la misma manera que las variables y por último no sin antes poner dos puntos establecemos su tipo(también establecimos el tipo void para las funciones que no retornan nada y el tipo main para establecer la función principal).

###### 3.1.2.2.1. _**Definición**_

    main{
        >_
            Do something...
        _<
    }
    
    func void := hola_soy_funcion () {
        >_
            Hola soy codigo...
        _<
    }
    
    func int:= hola_funcion_unica (string:= x, bool:= b){
        >_
            Hola soy codigo...
        _<
    }

###### 3.1.2.2.2. _**Llamadas**_

    hola();
    
    hola(num, holi);

###### 3.1.2.2.3. _**Funciones de Sistema**_

    int:= x;
    
    input(x);
    
    output(x + 5);

#### 3.1.3. **Bucles**

Los bucles **for** permiten iteración ascendente y descendente. También se les define un by, para el incremento o decremento del límite de iteraciones.

Nuestros bucles condicionales son los **while**.

###### 3.1.3.1. _**For**_

    >.iteración por incremento
    for(int := i <- 1; i < 0; i++){
        >.codigo?
	}   
    
    int:= z <- 2;
    
    for (z, i < 5, i++) {
    	z++;
    }
    
    >.Iteración por decremento
    for (var int:= y, 5 >= 1, i++) {
    	>.codigo?
    }

###### 3.1.3.2. _**While**_

    while(true){
        output("esta jugada solo puede hacerse una vez...");
    	stop;
    }

#### 3.1.4. **Bloques de Decisión**

Los bloques de descisión que manejamos son el de "if, else if, else" y "switch", el bloque de "if, else if, else" se maneja de la manera mas comun con la palabra "if" ya que esta es usada en java y en la mayoria de lenguajes, seguida de una condicion entre parentesis, seguido esta el bloque que dentro de ese bloque lleva codigo, puede haber otra condicion o un else o directamente nada solo dejando la condicion de if, el switch se maneja de manera similar al de java (porque nos estamos basando en java y otros lenguajes con los cuales sentimos mas comoda la sintaxis) iniciando con la palabra reservada "swch" seguida del id de una variable entre parentesis y despues estarian adentro de este bloque las diferentes rutas que puede tomar con la palabra reservada "scenario" seguida de un valor y dos puntos, le seguiria un bloque de codigo, el cual se cerraria/detendria con un "stop" y al final la palabra "dft" como el caso por default (el default no necesariamente debe de existir pero se pone en caso que se quiera decir que si no aplica en ninguna que al menos haga o muestre algo).

##### 3.1.4.1. _**If else**_

    if(1 < 3){
        >_
            Hola soy codigo...
        _<
    }
    else{
        >_
            Hola soy codigo, en caso que ninguno de los de arriba aplique...
        _<
    }

##### 3.1.4.2. _**Switch**_

    swch (variable) {
        scenario 1:
            >_
                Hola soy codigo...
            _<
        stop;
        scenario 2:
            >_
                Hola soy codigo diferente al de arriba...
            _<
        stop;
        scenario 3:
            >_
                Hola soy codigo que no aplico en ningun lado...
            _<
        stop;
        dft:
            >_
                Hola soy codigo, en caso de incendio usarme...
            _<
    }

### 3.2. **Léxico y Gramática**

#### 3.2.1. **Terminales**

 
  
| **Nombre de Terminal** | **Descripción** |
| --- | --- |
| FUNCTION | Terminal para token _**func**_ |
| NUM | Terminal para tokens de tipo entero |
| STRING | Terminal para token _**string**_ |
| INT | Terminal para token _**int**_ |
| CHARACTER | Terminal para token _**chr**_ |
| BOOLEAN | Terminal para token _**bool**_ |
| IF  | Terminal para token _**if**_ |
| ELIF | Terminal para token _**elif**_ |
| ELSE | Terminal para token _**else**_ |
| WHILE | Terminal para token _**while**_ |
| FOR | Terminal para token _**for**_ |
| RETURN | Terminal para token _**return**_ |
| VOID | Terminal para token _**void**_ |
| TRUE | Terminal para token _**true**_ |
| FALSE | Terminal para token _**false**_ |
| BREAK | Terminal para token _**stop**_ |
| NULL | Terminal para token _**null**_ |
| INPUT | Terminal para token _**input**_ |
| OUTPUT | Terminal para token _**output**_ |
| SWITCH | Terminal para token _**swch**_ |
| SCENARIO | Terminal para token _**scenario**_ |
| DEFAULT | Terminal para token _**dft**_ |
| ID  | Terminal para los IDs de cada variable |
| OPREL | Terminal para tokens _**=**_ , _**\>**_ , _**>=**_ , _**<**_ , _**⇐**_ y _**!=**_ |
| OPCOND | Terminal para token _**?**_ |
| OPLOG | Terminal para tokens _**\|**_ y _**&&**_ |
| OPMOD | Terminal para token _**mod**_ |
| OPMULT | Terminal para tokens _**\***_ y _**/**_ |
| OPSUM | Terminal para tokens _**\+**_ y _**-**_ |
| OPINC | Terminal para tokens _**\+\+**_ y _** — **_ |
| ASSIGNMENT | Terminal para token _**:=**_ |
| OPASIGNADD | Terminal para tokens _**+=**_ y _**-=**_ |
| OPASIGNMULT | Terminal para tokens _***=**_ y _**/=**_ |
| L_KEY | Terminal para token _**{**_ |
| R_KEY | Terminal para token _**}**_ |
| L_BRACKET | Terminal para token _**\[**_ |
| R_BRACKET | Terminal para token _**\]**_ |
| L_PAR | Terminal para token _**(**_ |
| R_PAR | Terminal para token _**)**_ |
| COMMA | Terminal para token _**,**_ |
| SEMICOLON | Terminal para token _**;**_ |
| COLON | Terminal para token _**:**_ |



#### 3.2.2. **No-Terminales**

**Nombre de No-Terminal**

| **Nombre de No-Terminal** |
| --- |
| INICIO |
| VARIABLE |
| FUNC |
| STATEMENTS |
| COMPARE |
| CONDITION |
| VALUE |
| CALL |
| DECLARE |
| ARGS |
| FUNCS |
| PARAM |
| FOR |
| IF |
| WHILE |
| COND_AND_OR |
| ELSE |
| THEN |
| SWITCH |
| SCENARIO |
| BRK |
| DFT |
| TRUE |
| FALSE |
| RETURN |
| NULL |
| EXIT |
| MAIN |
| TYPE |
| STRING |
| CHAR |
| L_COMMENT |
| COMMENT |
| NUMINT |
| ID |
| PAR_R |
| PAR_L |
| BRA_R |
| OPSUM |
| OPMULT |
| OPREL |
| ASSIGNMENT |
| SPECIALCHAR |
| SPACE |
| LETTER |
| DIGIT |
| ARRAY |
| FILL |
| FILLSTRING |
| FILLCHAR |
| FILLBOOL |






4\. **Demostración**
--------------------

       Proximamente*

**11511125 BRYAN ALEXIS MEJIA FONSECA  **

**31641572 JAMIL FERNANDO VILLEDA CORTEZ **

Last updated 2022-03-29 10:16:09 -0600