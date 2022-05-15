.text											@@ Inicio de segmento de codigo
.align 2
.global contador

contador:
    add r3  , #1
    ldrb r1, [r2,#1]! @@ carga el siguiente caracter del nombre

    /* --- Contador vocales nombre --- */

    cmp r1, #'a' 
    addeq r0, #1 
    cmp r1, #'A'
    addeq r0, #1

    cmp r1, #'e'
    addeq r0, #1
    cmp r1, #'E'
    addeq r0, #1

    cmp r1, #'I'
    addeq r0, #1
    cmp r1, #'i'
    addeq r0, #1

    cmp r1, #'o'
    addeq r0, #1
    cmp r1, #'O'
    addeq r0, #1

    cmp r1, #'u'
    addeq r0, #1
    cmp r1, #'U'
    addeq r0, #1

    
    
    cmp r1, #0 @@ si la comparción es 0, termina el ciclo
	bne contadorNombre  @@ si no es 0, continua el ciclo