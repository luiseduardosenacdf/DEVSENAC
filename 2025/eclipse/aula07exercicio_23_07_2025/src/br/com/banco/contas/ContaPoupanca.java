package br.com.banco.contas;

import br.com.banco.model.Conta;

public class ContaPoupanca extends Conta {

    public ContaPoupanca(int numero, String titular, double saldo) {
        super(numero, titular, saldo);
    }

    @Override
    public void sacar(double valor) {
        setSaldo(getSaldo() - valor);
    }

    @Override
    public void depositar(double valor) {
        setSaldo(getSaldo() + valor);
    }
}
