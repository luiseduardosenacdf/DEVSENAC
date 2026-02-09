#include <stdio.h>
#include <string.h>  // Necessário para strcspn

int main() {
    char nome[50];
    float peso, altura, imc;

    printf("Digite seu nome: ");
    fgets(nome, sizeof(nome), stdin);  // lê string com espaços
    nome[strcspn(nome, "\n")] = '\0';  // remove o \n do final, se houver

    printf("Digite seu peso (em kg): ");
    scanf("%f", &peso);

    printf("Digite sua altura (em metros): ");
    scanf("%f", &altura);

    imc = peso / (altura * altura);

    printf("\nOlá, %s\n", nome);
    printf("Seu IMC é: %.2f\n", imc);

    if (imc < 18.5) {
        printf("Classificação: Abaixo do peso\n");
    } else if (imc < 25) {
        printf("Classificação: Peso normal\n");
    } else if (imc < 30) {
        printf("Classificação: Sobrepeso\n");
    } else {
        printf("Classificação: Obesidade\n");
    }

    return 0;
}

