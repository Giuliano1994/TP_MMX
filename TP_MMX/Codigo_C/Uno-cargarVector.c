#include <stdio.h>
#include <emmintrin.h>

extern void procesarVector(char *vector, int length);

void printMMX(__m64 mmx_register, int length) {
    char* bytes = (char*)&mmx_register;
    printf("Contenido del registro MMX: ");
    for (int i = 0; i < length; i++) {
        printf("%d ", bytes[i]);
    }
    printf("\n");
}

int main() {
    char vector[] = {1, 2, 3, 4, 5, 6, 7, 8};
    int length = sizeof(vector) / sizeof(vector[0]);

    procesarVector(vector, length);

    printMMX(*(__m64*)vector, length);

    return 0;
}