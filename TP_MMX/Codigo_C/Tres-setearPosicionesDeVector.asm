section .text
global InicializarVectorEnCero

InicializarVectorEnCero:
    pxor xmm0, xmm0            ; Establecer xmm0 en 0
.loop:
    movd [rdi], xmm0           ; Almacenar el resultado en el vector original
    add rdi, 4                 ; Avanzar al siguiente elemento
    sub rsi, 4                 ; Decrementar el contador
    jnz .loop                  ; Si el contador no es cero, continuar el bucle
    ret