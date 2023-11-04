section .data
    mmx_register dq 0

section .text
global procesarVector

procesarVector:
    movq mm0, [rdi]           ; Cargar el primer valor del vector en el registro MMX
    pxor mm1, mm1             ; Limpiar el registro MM1 para usarlo como contador

loop_start:
    paddb mm0, mm1            ; Sumar el valor del contador a los elementos en mm0
    add rdi, 8                ; Avanzar al siguiente segmento del vector
    dec rsi                   ; Decrementar la longitud del vector

    jnz loop_start            ; Si no hemos terminado, repetir el ciclo

    ret