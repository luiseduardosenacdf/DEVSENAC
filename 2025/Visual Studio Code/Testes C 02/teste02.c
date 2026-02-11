#include <stdio.h>

#define MAX_ALUNOS 20

int main() {
    float notas[MAX_ALUNOS];
    int quantidade, i;
    float soma = 0.0;

    printf("Quantos alunos deseja cadastrar? (Máximo: %d): ", MAX_ALUNOS);
    scanf("%d", &quantidade);

    if (quantidade > MAX_ALUNOS || quantidade <= 0) {
        printf("Quantidade inválida. Deve estar entre 1 e %d.\n", MAX_ALUNOS);
        return 1;
    }

    for (i = 0; i < quantidade; i++) {
        printf("Digite a nota do aluno %d: ", i + 1);
        scanf("%f", &notas[i]);
        soma += notas[i];
    }

    float media = soma / quantidade;
    printf("Média das notas: %.2f\n", media);

    return 0;
}
