package atividades.calculadora;

import java.util.Scanner;

public class CalculadoraMenu {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.println("Digite o primeiro número: ");
            double num1 = Double.parseDouble(scanner.nextLine().replace(",", "."));

            System.out.println("Digite o segundo número: ");
            double num2 = Double.parseDouble(scanner.nextLine().replace(",", "."));

            System.out.println("\nEscolha uma operação:");
            System.out.println("1 - Soma");
            System.out.println("2 - Subtração");
            System.out.println("3 - Multiplicação");
            System.out.println("4 - Divisão");
            System.out.print("Opção: ");
            int opcao = Integer.parseInt(scanner.nextLine());

            double resultado = 0; 

            switch (opcao) {
                case 1:
                    resultado = num1 + num2;
                    System.out.println("Resultado da soma: " + resultado);
                    break;
                case 2:
                    resultado = num1 - num2;
                    System.out.println("Resultado da subtração: " + resultado);
                    break;
                case 3:
                    resultado = num1 * num2;
                    System.out.println("Resultado da multiplicação: " + resultado);
                    break;
                case 4:
                    if (num2 != 0) {
                        resultado = num1 / num2;
                        System.out.println("Resultado da divisão: " + resultado);
                    } else {
                        System.out.println("Erro: divisão por zero.");
                    }
                    break;
                default:
                    System.out.println("Opção inválida.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Erro: entrada inválida. Use números válidos com ponto como separador decimal.");
        } finally {
            scanner.close();
        }
    }
}