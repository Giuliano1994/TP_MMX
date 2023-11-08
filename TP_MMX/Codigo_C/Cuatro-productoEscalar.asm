section .text
global productoEscalar

productoEscalar:
    xor rax, rax              ; Inicializar rax en 0
    movdqu xmm1, [edi]           ; Cargar el valor n en xmm1
    movdqu xmm2, [rsi]        ; Cargar el vector en xmm2 sin requerir alineación específica

    pmulld xmm2, xmm1         ; Multiplicar los elementos del vector por n (SSE2)

    loop_start:
    paddb xmm0, xmm2          ; Sumar el valor del contador a los elementos en mm0
    add rdi, 8                ; Avanzar al siguiente segmento del vector
    dec rsi                   ; Decrementar la longitud del vector

    jnz loop_start
   
    movq rax, xmm0            ; Mover el resultado a rax
    ret





    (valor1, valr ......valor8)

    (2, cosas, cosas, cosas -...)
    (1,2,3, cosas, coasa .....)