#include <stdio.h>

int main() {
    float distancia, tempo, velocidade;

    printf("Informe a distância (em metros): ");
    scanf("%f", &distancia);

    printf("Informe o tempo (em segundos): ");
    scanf("%f", &tempo);

    if (tempo <= 0) {
        printf("Tempo inválido! Deve ser maior que zero.\n");
        return 1;
    }

    velocidade = distancia / tempo;

    printf("A velocidade do objeto é: %.2f metros por segundo.\n", velocidade);

    return 0;
}
