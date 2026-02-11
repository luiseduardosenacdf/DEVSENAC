package aula16exercicio_04_08_2025;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // Cria um objeto Scanner para ler entradas do usuário
        Scanner scanner = new Scanner(System.in);

        // Declaração “manual” dos arrays de produtos e preços
        // String[] produtos guarda os nomes dos itens do cardápio
        String[] produtos = new String[7];
        produtos[0] = "X-Burguer";
        produtos[1] = "X-Salada";
        produtos[2] = "X-Bacon";
        produtos[3] = "Batata Frita";
        produtos[4] = "Refrigerante Lata";
        produtos[5] = "Suco Natural";
        produtos[6] = "Água Mineral";

        // double[] precos guarda o preço correspondente a cada produto
        double[] precos = new double[7];
        precos[0] = 10.0;
        precos[1] = 12.0;
        precos[2] = 14.0;
        precos[3] = 8.0;
        precos[4] = 5.0;
        precos[5] = 6.0;
        precos[6] = 3.0;

        // int[] quantidades inicia todas as quantidades em zero
        // será usado para acumular quantos itens de cada produto foram pedidos
        int[] quantidades = new int[7];

        // Exibe o cardápio para o usuário
        System.out.println("=== Cardápio da Lanchonete ===");
        for (int i = 0; i < 7; i++) {
            // i + 1: para numerar de 1 a 7 em vez de 0 a 6
            System.out.println((i + 1) + ". " + produtos[i] + " - R$ " + precos[i]);
        }

        System.out.println();
        System.out.println("Digite o número do produto para adicionar ao pedido.");
        System.out.println("Digite 0 para finalizar o pedido.");

        // Loop principal: solicita ao usuário que escolha itens até digitar 0
        while (true) {
            System.out.print("\nEscolha o produto (1 a 7) ou 0 para finalizar: ");
            int escolha = scanner.nextInt();  // lê a escolha

            if (escolha == 0) {
                // número zero finaliza o pedido
                break;
            }

            // verifica se a escolha está no intervalo válido
            if (escolha >= 1 && escolha <= 7) {
                // pergunta a quantidade do item escolhido
                System.out.print("Quantidade de " + produtos[escolha - 1] + ": ");
                int qtd = scanner.nextInt();  // lê a quantidade
                if (qtd > 0) {
                    // acumula a quantidade no array
                    quantidades[escolha - 1] += qtd;
                    System.out.println("Adicionado: " + qtd + "x " + produtos[escolha - 1]);
                } else {
                    // trata quantidade negativa ou zero
                    System.out.println("Quantidade inválida.");
                }
            } else {
                // trata escolha fora do intervalo 1–7
                System.out.println("Produto inválido. Digite um número entre 1 e 7.");
            }
        }

        // Ao sair do loop, gera o relatório final
        double totalGeral = 0;
        System.out.println("\n=== Relatório Final do Pedido ===");
        for (int i = 0; i < 7; i++) {
            if (quantidades[i] > 0) {
                // calcula subtotal por produto
                double subtotal = precos[i] * quantidades[i];
                System.out.println(
                    produtos[i]
                    + " - Quantidade: " + quantidades[i]
                    + " - Subtotal: R$ " + subtotal
                );
                totalGeral += subtotal;  // soma ao valor total
            }
        }

        // Exibe o valor total ou mensagem caso nada tenha sido selecionado
        if (totalGeral > 0) {
            System.out.println("Valor total do pedido: R$ " + totalGeral);
        } else {
            System.out.println("Nenhum produto foi selecionado.");
        }

        // Fecha o Scanner para liberar o recurso
        scanner.close();
    }
}
