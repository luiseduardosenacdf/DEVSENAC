#include <stdio.h>
#include <string.h>

int main()
{
    char nomeProduto[50];
    int quantidade;
    float preco, totalProduto, totalDia = 0;

    int numProdutos = 2;  // fixa para 2 produtos

    printf("\n-- Registro de Vendas do Dia ---\n");

    for (int i = 1; i <= numProdutos; i++)
    {
        printf("\nProduto %d:\n", i);

        printf("Nome do produto: ");
        scanf(" %[^\n]s", nomeProduto); // ler string com espaços

        printf("Quantidade vendida: ");
        scanf("%d", &quantidade);

        if (quantidade <= 0)
        {
            printf("Quantidade inválida. Ignorando produto.\n");
            continue;
        }

        printf("Preço unitário: R$ ");
        scanf("%f", &preco);

        if (preco < 0)
        {
            printf("Preço inválido. Ignorando produto.\n");
            continue;
        }

        totalProduto = quantidade * preco;
        printf("Total do produto %s: R$ %.2f\n", nomeProduto, totalProduto);

        totalDia += totalProduto;
    }

    printf("\nTotal geral de vendas do dia: R$ %.2f\n", totalDia);
    printf("\nEncerrando o sistema de vendas.\n");
    return 0;
}
