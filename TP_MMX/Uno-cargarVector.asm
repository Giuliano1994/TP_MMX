section .data
vector dd 1, 2, 3, 4, 5, 6, 7, 8
vector_size equ ($ - vector) / 4   ; Tamaño del vector en palabras (cada palabra es de 4 bytes)

section .text
global _start

_start:
    movd mm0, [vector]  ; Cargar el primer elemento del vector en mm0

    ; Recorrer el vector y realizar operaciones
    xor ecx, ecx         ; Inicializar el contador
loop_start:
   mov eax, [vector + ecx*4]  ; Cargar el elemento del vector en eax

    ; Realizar operaciones con el elemento en eax
    ; Por ejemplo, imprimirlo
    push eax  ; Guardar el valor en la pila para imprimirlo
    push ecx  ; Guardar el índice del elemento en la pila para imprimirlo
    call imprimir_elemento  ; Llamar a una función para imprimir el elemento
    add esp, 8  ; Limpiar la pila

    inc ecx  ; Incrementar el contador
    cmp ecx, vector_size  ; Comparar el contador con el tamaño del vector
    jl loop_start  ; Saltar al inicio del bucle si no hemos llegado al final

    ; Terminar el programa
    mov eax, 1        ; Número de syscall para exit
    int 0x80           ; Llamar a la syscall para salir

section .bss
imprimir_elemento:
    resb 4  ; Espacio para almacenar el valor a imprimir