package aula02_15_07_2025;

public class Carro {
    public String marca;
    public String modelo;
    public String cor;
    public String potencia;
    public String placa;
    public int portas;
    public double preco;
    public String chassi;

    public void exibirDetalhes() {
        System.out.println("Marca: " + marca);
        System.out.println("Modelo: " + modelo);
        System.out.println("Cor: " + cor);
        System.out.println("Potência: " + potencia);
        System.out.println("Placa: " + placa);
        System.out.println("Portas: " + portas);
        System.out.println("Preço: R$" + preco);
        System.out.println("Chassi: " + chassi);
    }
}
