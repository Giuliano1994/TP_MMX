section .data
 
    mmx_register dq 0

section .text
global procesarVector

procesarVector:
    pxor mm0, mm0             ; Limpiar el registro MM0 para usarlo como acumulador

loop_start:
    movd mm1, [rdi]           ; Cargar un byte del vector en el registro MM1
    paddb mm0, mm1            ; Sumar el valor del contador al acumulador en mm0
    add rdi, 1                ; Avanzar al siguiente byte del vector
    dec rsi                   ; Decrementar la longitud del vector

    jnz loop_start            ; Si no hemos terminado, repetir el ciclo

    movq [mmx_register], mm0  ; Mover el resultado al espacio de memoria 'mmx_register'
    emms                      ; Limpiar el estado multimedia
    ret