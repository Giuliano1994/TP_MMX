section .data
vector dw 1, 2, 3, 4, 5, 6, 7, 8  ; Vector de 8 elementos
result_msg db "El resultado es: ", 0
newline db 10  ; Salto de línea

section .bss
result resb 32  ; Almacenar el resultado como cadena de caracteres

section .text
global _start

_start:
    ; Cargar el vector en el registro MM0
    movq mm0, qword [vector]

    ; Inicializar el contador y el resultado en MM1
    pxor mm1, mm1
    mov ecx, 8  ; Número de elementos en el vector
loop_start:
    ; Realizar la operación deseada aquí (por ejemplo, sumar los elementos)
    paddw mm1, [vector + ecx*2 - 2]

    ; Decrementar el contador
    dec ecx
    jnz loop_start  ; Saltar si el contador no es cero

    ; Almacenar el resultado en la variable 'result' como una cadena de caracteres
    movq [result], mm1

    ; Imprimir el mensaje "El resultado es:"
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 17  ; Longitud del mensaje
    int 0x80
; Convertir el resultado a una cadena de caracteres y luego imprimirlo
    mov eax, 0x1     ; syscall número 1: sys_write
    mov ebx, 0x1     ; descriptor de archivo estándar de salida
    mov ecx, result  ; dirección de la cadena a imprimir
    mov edx, 32      ; longitud máxima de la cadena
    int 0x80

    ; Agregar un salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Limpiar registros MMX antes de salir
    emms

    ; Salir del programa
mov eax, 1  ; Código de salida (1)
    int 0x80