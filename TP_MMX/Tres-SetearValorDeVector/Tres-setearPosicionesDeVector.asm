section .data
    vector db 1, 2, 3, 4, 5, 6, 7, 8  ; Vector de ejemplo con valores iniciales
    vector_size equ 8  ; Tamaño del vector

section .bss
  

section .text
global _start

_start:
    ; Cargar la dirección base del vector en ESI
    lea esi, [vector]

    ; Cargar la longitud del vector en ECX
    mov ecx, vector_size

    ; Llamar a la función para inicializar el vector en cero
    call InicializarVectorEnCero

    ; Imprimir el vector por pantalla
    call ImprimirVector

    ; Salir del programa
    mov eax, 1
    int 0x80

InicializarVectorEnCero:
    ; Esta función toma la dirección base del vector en ESI y la dimensión en ECX

    xor eax, eax  ; Valor cero en AL (0x00)

    ; Repetir el siguiente bucle hasta que ECX sea cero
    ; Este bucle pone 0 en cada posición del vector
    .loop:
        mov [esi], al  ; Almacenar 0 en la posición actual del vector
        inc esi        ; Mover a la siguiente posición
        loop .loop     ; Decrementar ECX y saltar a .loop si no es cero

    ret

ImprimirVector:
    ; Esta función imprime los elementos del vector en la consola

    pusha  ; Guardar los registros

    mov edx, ecx  ; Longitud del vector
    mov ecx, esi  ; Dirección base del vector

    mov eax, 4
    mov ebx, 1
    mov edx, ecx
    mov eax, 4  ; Llamada al sistema para escribir en stdout
    mov ebx, 1  ; Descriptor de archivo para stdout (consola)
    mov ecx, edx  ; Dirección del buffer de salida
    mov edx, vector_size  ; Longitud del vector
    int 0x80

    popa  ; Restaurar los registros

    ret