#include <stdio.h>

int main() {
    // Declaração das variáveis
    char nome[50];      // Para armazenar o nome do usuário
    int idade;          // Para armazenar a idade
    int temIngresso;    // Para armazenar se possui ingresso (1 = Sim, 0 = Não)

    // Solicita o nome do usuário
    printf("Digite seu nome: ");
    scanf("%s", nome); // Lê o nome (sem espaços)

    // Solicita a idade
    printf("Digite sua idade: ");
    scanf("%d", &idade); // Lê a idade e armazena na variável

    // Solicita se possui ingresso (1 para Sim, 0 para Não)
    printf("Voce possui ingresso? (1 para Sim, 0 para Nao): ");
    scanf("%d", &temIngresso); // Lê se tem ingresso

    // Verifica as condições de acesso ao evento
    if (idade >= 18 && temIngresso == 1) {
        // Se for maior de idade e tiver ingresso, pode entrar
        printf("Entrada permitida. Bem-vindo(a), %s!\n", nome);
    } else if (idade < 18) {
        // Se for menor de idade, não pode entrar
        printf("Entrada nao permitida para menores de idade.\n");
    } else if (temIngresso == 0) {
        // Se não tiver ingresso, não pode entrar
        printf("É necessario possuir ingresso para entrar.\n");
    }

    return 0; // Fim do programa
}
