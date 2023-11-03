#include <stdio.h>
#include <stdint.h>

extern void ProductoEscalar(char *vector, int n);  // Declaración de la función en ensamblador

int main() {
    char vector[] = {1, 2, 3, 4, 5, 6, 7, 8};  // Vector de ejemplo con valores iniciales
    int n = 5;  // Valor n

    ProductoEscalar(vector, n);  // Llama a la función en ensamblador

    // Accede al resultado desde la variable 'result' en ensamblador
    int resultado;
    asm("movl result, %0" : "=r"(resultado));

    // Imprime el resultado
    printf("El resultado del producto escalar es: %d\n", resultado);

    return 0;
}









