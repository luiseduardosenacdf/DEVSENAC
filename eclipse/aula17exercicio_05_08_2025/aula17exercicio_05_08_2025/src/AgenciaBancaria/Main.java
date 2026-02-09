package AgenciaBancaria;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        String nomeCliente = "";
        String tipoConta = "Corrente";
        double saldo = 0.0;
        int opcao;

        System.out.println("Bem-vindo!");
        System.out.print("Digite seu nome: ");
        nomeCliente = scanner.nextLine();

        System.out.print("Saldo inicial: ");
        try {
            saldo = scanner.nextDouble();
        } catch (InputMismatchException e) {
            System.out.println("Saldo inválido. Definido como 0.0.");
            saldo = 0.0;
            scanner.next();
        }
        scanner.nextLine();

        System.out.println("Cliente: " + nomeCliente + ", Conta: " + tipoConta);

        do {
            System.out.println("\nEscolha:");
            System.out.println("1 - Ver saldo");
            System.out.println("2 - Depositar");
            System.out.println("3 - Sacar");
            System.out.println("4 - Sair");
            System.out.print("Opção: ");

            try {
                opcao = scanner.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Opção inválida. Tente novamente.");
                opcao = -1;
                scanner.next();
            }
            scanner.nextLine();

            switch (opcao) {
                case 1:
                    System.out.println("Saldo: " + saldo);
                    break;
                case 2:
                    System.out.print("Valor do depósito: ");
                    try {
                        double valor = scanner.nextDouble();
                        if (valor > 0) {
                            saldo += valor;
                            System.out.println("Depósito realizado. Novo saldo: " + saldo);
                        } else {
                            System.out.println("Valor inválido.");
                        }
                    } catch (InputMismatchException e) {
                        System.out.println("Valor inválido.");
                        scanner.next();
                    }
                    scanner.nextLine();
                    break;
                case 3:
                    System.out.print("Valor do saque: ");
                    try {
                        double valor = scanner.nextDouble();
                        if (valor > 0 && valor <= saldo) {
                            saldo -= valor;
                            System.out.println("Saque realizado. Novo saldo: " + saldo);
                        } else {
                            System.out.println("Valor inválido ou saldo insuficiente.");
                        }
                    } catch (InputMismatchException e) {
                        System.out.println("Valor inválido.");
                        scanner.next();
                    }
                    scanner.nextLine();
                    break;
                case 4:
                    System.out.println("Saindo.");
                    break;
                default:
                    System.out.println("Inválido.");
            }

        } while (opcao != 4);

        scanner.close();
    }
}
