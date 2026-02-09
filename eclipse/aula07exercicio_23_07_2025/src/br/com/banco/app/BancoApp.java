package br.com.banco.app;

import br.com.banco.contas.ContaCorrente;
import br.com.banco.contas.ContaPoupanca;

public class BancoApp {

    public static void main(String[] args) {

        // Conta Corrente do João
        ContaCorrente contaJoao = new ContaCorrente(1, "João", 1000.0);
        contaJoao.sacar(50.0); // João sacou R$50
        contaJoao.depositar(0.0); // Apenas demonstração de uso do método

        System.out.println("Conta Corrente - " + contaJoao.getTitular());
        contaJoao.exibirSaldo();
        System.out.println("Tributo: R$ " + String.format("%.2f", contaJoao.calcularTributo()));
        System.out.println(); // quebra de linha

        // Conta Poupança da Maria
        ContaPoupanca contaMaria = new ContaPoupanca(2, "Maria", 1200.0);
        contaMaria.sacar(50.0); // Maria sacou R$50
        contaMaria.depositar(0.0); // Apenas demonstração de uso do método

        System.out.println("Conta Poupança - " + contaMaria.getTitular());
        contaMaria.exibirSaldo();
    }
}
