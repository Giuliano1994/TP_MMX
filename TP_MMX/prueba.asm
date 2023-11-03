section .data
vector dd 1, 2, 3, 4, 5, 6, 7, 8    ; Declaramos un vector de enteros 
section .text
global _start
_start:
    movd mm0, [vector]  ; Cargamos los primeros cuatro elementos del vector en registros MMX del 0 al 3
    movd mm1, [vector+4]
    movd mm2, [vector+8]
    movd mm3, [vector+12]
    psllw mm0, 2    ; desplazamiento a la izquierda, multiplica cada elemento del vector por 2 elevado a la 2
    psllw mm1, 2
    psllw mm2, 2
    psllw mm3, 2
    movq mm4, mm0   ; guardamos en mm4 el valor de la suma de todos los registros
    paddw mm4, mm1
    paddw mm4, mm2
    paddw mm4, mm3
    movq [result], mm4
    ; Recorremos el vector cargado en el registro MMX
    mov ecx, 8 ; Número de elementos del vector
loop_start:
     mov eax, [esi + ecx*4 - 4] ; Cargamos el elemento del vector en eax
    ; Realizamos la operación deseada con el elemento del vector
    ; ...
    loop loop_start ; Volvemos al inicio del bucle hasta que ecx sea igual a cero

section .bss
result resq 1 ; Reservamos espacio para el resultado e inicializamos con cero.
