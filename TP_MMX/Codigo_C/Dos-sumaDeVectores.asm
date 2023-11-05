section .text
global SumarVectores

SumarVectores:
    movdqu xmm0, [rdi]       ; Cargar los primeros 16 bytes de vectorA en xmm0
    movdqu xmm1, [rsi]       ; Cargar los primeros 16 bytes de vectorB en xmm1
    paddb xmm0, xmm1         ; Sumar los elementos de xmm0 y xmm1 (SSE)

    movdqu [rdx], xmm0       ; Almacenar el resultado en vectorResult

    ret