section .data
    vector dd 1, 2, 3, 4, 5, 6, 7, 8  ; Vector de ejemplo con valores iniciales
    vector_size equ 8  ; Tamaño del vector
    result_msg db "El resultado del producto escalar es: ", 0

section .bss
    result resd 1  ; Almacenar el resultado del producto escalar

section .text
global _start

_start:
    ; Cargar la dirección base del vector en ESI
    lea esi, [vector]

    ; Cargar el valor n en ECX
    mov ecx, 5  ; Cambia el valor de n según sea necesario

    ; Llamar a la función para realizar el producto escalar
    call ProductoEscalar

    ; Imprimir el resultado del producto escalar
    call ImprimirResultado

    ; Salir del programa
    mov eax, 1
    int 0x80

ProductoEscalar:
    ; Esta función toma la dirección base del vector en ESI y el valor n en ECX

    xor eax, eax  ; Inicializar el resultado en 0

    ; Repetir el siguiente bucle hasta que ECX sea cero
    ; Este bucle multiplica cada elemento del vector por n y suma el resultado a eax
    .loop:
        mov edx, [esi]  ; Cargar el valor actual del vector en edx
        imul edx, ecx  ; Multiplicar el valor por n
        add eax, edx   ; Sumar el resultado a eax
        add esi, 4     ; Mover a la siguiente posición del vector (4 bytes por elemento)
        loop .loop      ; Decrementar ECX y saltar a .loop si no es cero

    ; El resultado del producto escalar está en eax

    ; Almacenar el resultado en la variable 'result'
    mov [result], eax

    ret

ImprimirResultado:
    ; Esta función imprime el resultado del producto escalar en la consola

    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 33  ; Longitud del mensaje (incluyendo el resultado y el espacio)
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 10  ; Longitud del resultado
    int 0x80

    ret