#include <stdio.h>
#include <stdint.h>
#include <emmintrin.h>

extern void procesarVector(int8_t *vector, int length);

void printMMX(__m64 mmx_register, int length) {
    int8_t* bytes = (int8_t*)&mmx_register;
    printf("Contenido del registro MMX: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", bytes[i]);
    }
    printf("\n");
}

int main() {

    // como los registros MMX solo soportan 8 bytes podemos ingresar 8 elementos como maximo
    int8_t vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    int length = sizeof(vector) / sizeof(vector[0]);

    procesarVector(vector, length);

    // Llamamos a una función para imprimir el contenido del registro MMX
    printMMX(*(__m64*)vector, length);

    return 0;
}