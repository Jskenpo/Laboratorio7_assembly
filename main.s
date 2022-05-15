/*
*Organización de computadoras y assembler 
*Sección 10
*
*Laboratorio 7
*Ejercicio 1 (fortuna de bebé)
*
*Jose Santisteban
*Brandon Sicay 
*
*/


.text											@@ Inicio de segmento de codigo
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}								@@ SP = R13 link register 
	/* --- Impresion encabezado --- */
    mov r7 , #4
    mov r0, #1
    mov r2, #200
    ldr r1 , =bienvenida
    SWI 0

    /* --- Ingreso de nombre --- */

    mov r7 , #3
    mov r0, #0
    mov r2, #200
    ldr r1 , =nombre
    SWI 0
    ldr r6, [r1]

    
    /* --- Ingreso de apellido --- */
	mov r7 , #3
    mov r0, #0
    mov r2, #200
    ldr r1 , =apellido
    SWI 0
    ldr r8, [r1]

    /* --- Cargar Cantidad de letras --- */
    ldr r7,= numNombre @@ set de variable para el numero de letras del nombre
    ldrb r7, [r7]

    ldr r10,= vocalesNombre @@ set de variable para el numero de vocales del nombre
    ldr r10, [r10]

    ldr r11,= vocalesApellido @@ set de variable para el numero de vocales del apellido
    ldr r11, [r11]

    ldr r9,= numApellido @@ set de variable para el numero de letras del apellido
    ldrb r9, [r9]

    ldrb r1, [r6,#-1]! @@ carga el ultimo caracter del nombre
    ldrb r2, [r8,#-1]! @@ carga el ultimo caracter del apellido

    /* --- variables --- 
    r1 = ultimo caracter del nombre
    r2 = ultimo caracter del apellido
    r6 = nombre
    r7 = numero de letras del nombre
    r8 = apellido
    r9 = numero de letras del apellido
    r10 = numero de vocales del nombre
    r11 = numero de vocales del apellido

    subrutina contador (nombre)
    r3 = r7
    r1 = r1
    r2 = r6
    r0 = r10
    */

    mov r0, r10 @@ carga el numero de vocales del nombre en r0
    mov r3, r7 @@ carga el numero de letras del nombre en r3
    mov r4, r2 @@ carga el ultimo caracter del apellido en r4 
    mov r2, r6 @@ carga el nombre en r2
    bl contador

    ldr r10,[r0] @@ carga el numero de vocales del nombre en r10 (retorno de subrutina)

    /* --- variables --- 
    r1 = ultimo caracter del nombre
    r4 = ultimo caracter del apellido
    r6 = nombre
    r7 = numero de letras del nombre
    r8 = apellido
    r9 = numero de letras del apellido
    r10 = numero de vocales del nombre
    r11 = numero de vocales del apellido

    subrutina contador (apellido)
    r3 = r9
    r1 = r4
    r2 = r8
    r0 = r11    
    */

    mov r0, r11 @@ carga el numero de vocales del apellido en r0
    mov r3, r9 @@ carga el numero de letras del apellido en r3
    ldr r5, [r1] @@ carga el ultimo caracter del nombre en r5
    mov r1, r4 @@ carga el ultimo caracter del apellido en r1
    mov r2, r8 @@ carga el apellido en r2
    bl contador

    ldr r11,[r0] @@ carga el numero de vocales del apellido en r11 (retorno de subrutina)

comparar:
    /* --- Comparacion de cantidad de letras --- */
    ldr r2,= puntos @@ set de variable para el numero de puntos
    ldr r12, [r2]

    cmp r7, r9 @@ compara el numero de letras del nombre con el del apellido
    addeq r12, r12, #1 @@ si son iguales, suma 1 al numero de puntos
    
    /* --- Comparar vocales --- */
    cmp r10, r11 @@ compara el numero de vocales del nombre con el del apellido
    addeq r12, r12, #1 @@ si son iguales, suma 1 al numero de puntos

    /* --- Comparar Ultima Letra --- */
    ldrb r1, [r6,#-1] @@ carga el ultimo caracter del nombre
    ldrb r2, [r8,#-1] @@ carga el ultimo caracter del apellido

    cmp r1, r2 @@ compara el ultimo caracter del nombre con el del apellido
    addeq r12, r12, #1 @@ si son iguales, suma 1 al numero de puntos

    cmp r12, #2 
    bge Aprobado @@ si el numero de puntos es mayor o igual a 2, se cumple la condicion
    blt Rechazado @@ si el numero de puntos es menor a 2, se cumple la condicion

Aprobado:
    
    /* --- Impresion de mensaje aprobado--- */
    mov r7 , #4
    mov r0, #1
    mov r2, #200
    ldr r1 , =aprobado
    SWI 0

    mov r1, r12  @@ carga el numero de puntos en r1

    mov r7 , #4
    mov r0, #1
    mov r2, #200
    ldr r1 ,[r1]
    SWI 0


Rechazado:
    mov r7 , #4
    mov r0, #1
    mov r2, #200
    ldr r1 , =aprobado
    SWI 0

    mov r1, r12  @@ carga el numero de puntos en r1

    mov r7 , #4
    mov r0, #1
    mov r2, #200
    ldr r1 ,[r1]
    SWI 0
fin:    
	mov r7, #1
    SWI 0

.data
.align 2
ingresoNombre: .asciz "Ingrese el nombre del bebe"
ingresoApellido: .asciz "\nIngrese el apellido del bebe"
aprobado: .asciz " \n La calificacion es de %d puntos, el nombre fue abrobado\n"
rechazado: .asciz "\nLa calificacion es de %d puntos, el nombre fue rechazado\n"
bienvenida: .asciz "\n\t\t\t\t¡Bienvenido!\n\nPara el calculo de compatibilidad de nombres para bebes realice las que se pide\n--------------------------------------------------------------------------------\n"
nombre: "                        "
apellido: "                       "
numNombre: .word 0
numApellido: .word 0
puntos: .word 0
vocalesNombre: .word 0
vocalesApellido: .word 0



    
    
    

