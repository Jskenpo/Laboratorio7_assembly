/*
*Organización de computadoras y assembler 
*Sección 10
*
*Laboratorio 6
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
    ldr r0,= bienvenida
    bl puts

    /* --- Ingreso de nombre --- */
	ldr r0,=ingresoNombre
	bl puts

	ldr r0,=typeLetras
	ldr r1,=nombre
	bl scanf

    ldr r6,= nombre

    
    /* --- Ingreso de apellido --- */
	ldr r0,=ingresoApellido
	bl puts

    ldr r0,=typeLetras
	ldr r1,=apellido
	bl scanf

    ldr r8,= apellido

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

    ldr r0, [r10] @@ carga el numero de vocales del nombre en r0
    ldr r3, [r7] @@ carga el numero de letras del nombre en r3
    ldr r4, [r2] @@ carga el ultimo caracter del nombre en r4 
    ldr r2,[r6] @@ carga el nombre en r2
    bl contador

    ldr r10,[r0] @@ carga el numero de vocales del nombre en r10 (retorno de subrutina)

    
    
    

