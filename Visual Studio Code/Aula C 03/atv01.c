// Funções
#include <stdio.h>

// Declaração da função
int soma(int a, int b);

int main() {
    // Declaração de variáveis
    int x = 5, y = 3;

    // Chamada da função
    int resultado = soma(x, y);
    printf("A soma de %d e %d é: %d\n", x, y, resultado);

    return 0;
}

// Definição da função
int soma(int a, int b) {
    return a + b;
}
