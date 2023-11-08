section .text
global productoEscalar

productoEscalar:
    xor rax, rax              ; Inicializar rax en 0
    movd xmm1, edi            ; Cargar el valor n en xmm1
    movdqu xmm2, [rsi]        ; Cargar el vector en xmm2 sin requerir alineación específica

    pmulld xmm2, xmm1         ; Multiplicar los elementos del vector por n (SSE2)

    paddw xmm2, xmm2
    movq rax, xmm2            ; Mover el resultado a rax
    ret





    (valor1, valr ......valor8)

    (2, cosas, cosas, cosas -...)
    (1,2,3, cosas, coasa .....)