#include <stdio.h>
#include <stdint.h>
#include <emmintrin.h>

extern void procesarVector(int8_t *vector, int length);
extern __m64 mmx_register;  // Aquí está la declaración de mmx_register

__m64 mmx_register;  // Aquí está la definición de mmx_register

int main() {

    // como los registros MMX solo soportan 8 bytes podemos ingresar 8 elementos como maximo
    int8_t vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    int length = sizeof(vector) / sizeof(vector[0]);

    procesarVector(vector, length);

    // Sumamos los elementos del registro MMX
    int8_t* bytes = (int8_t*)&mmx_register;
    int sum = 0;
    for (int i = 0; i < 8; i++) {
        sum += bytes[i];
    }

    // Imprimimos la suma
    printf("La suma de los elementos del vector es: %d\n", sum);

    return 0;
}