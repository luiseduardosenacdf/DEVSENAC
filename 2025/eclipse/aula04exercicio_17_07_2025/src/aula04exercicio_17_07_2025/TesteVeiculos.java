package aula04exercicio_17_07_2025;

public class TesteVeiculos {

    public static void main(String[] args) {

        // Testando Veículo genérico
        Veiculo testeVeiculos = new Veiculo("Veículo");
        testeVeiculos.mover();
        System.out.println("Tipo de Veículo: " + testeVeiculos.getVeiculo());
        System.out.println("Combustível: " + testeVeiculos.tipoCombustivel());
        System.out.println("");

        // Testando Carro
        Carro carro1 = new Carro("Carro");
        System.out.println("Tipo de Veículo: " + carro1.getVeiculo());
        carro1.mover();
        System.out.println("Combustível: " + carro1.tipoCombustivel());
        System.out.println("");

        // Testando Bicicleta
        Bicicleta bicicleta1 = new Bicicleta("Bicicleta");
        System.out.println("Tipo de Veículo: " + bicicleta1.getVeiculo());
        bicicleta1.mover();
        System.out.println("Combustível: " + bicicleta1.tipoCombustivel());
    }
}
