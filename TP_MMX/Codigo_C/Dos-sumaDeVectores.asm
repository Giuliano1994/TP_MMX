section .data
    vectorA db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
    vectorB db 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160
    vectorResult db 16 dup(0)  ; Vector para almacenar el resultado

    output_msg db "Resultado:", 10
    
section .text
global _start

_start:
    ; Parámetros:
    ; - ESI: Puntero a vectorA
    ; - EDI: Puntero a vectorB
    ; - EDX: Puntero a vectorResult
    ; - ECX: Dimensión (número de elementos)
    
    mov esi, vectorA
    mov edi, vectorB
    mov edx, vectorResult
    mov ecx, 16  ; Dimensión de los vectores (16 bytes) PARA EL BUCLE

    ; Código SIMD para sumar los vectores
    xorps xmm6, xmm6  ; xmm6 = 0
    xorps xmm7, xmm7  ; xmm7 = 0

    bucle:
        movdqu xmm0, [esi]  ; Cargar 16 bytes de vectorA en xmm0
        movdqu xmm1, [edi]  ; Cargar 16 bytes de vectorB en xmm1
        paddb xmm0, xmm1    ; Sumar los elementos de xmm0 y xmm1
        movdqu [edx], xmm0  ; Almacenar el resultado en vectorResult

        add esi, 16  ; Avanzar los punteros de los vectores
        add edi, 16
        add edx, 16
        loop bucle

    ; El resultado está en vectorResult

  
 ; Mostrar el resultado por pantalla
    mov eax, 4        ; Número de syscall para write
    mov ebx, 1        ; Descriptor de archivo para stdout (salida estándar)
    mov ecx, vectorResult
    mov edx, 16       ; Longitud del vectorResult
    int 0x80
    
    ; Terminar el programa
    mov eax, 1        ; Número de syscall para exit
    int 0x80          ; Llamar a la syscall para salir