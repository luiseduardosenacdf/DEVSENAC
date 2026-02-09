package aula04exercicio_17_07_2025;

public class Carro extends Veiculo {

    public Carro(String veiculo) {
        super(veiculo);
    }

    @Override
    public void mover() {
        System.out.println("O carro está andando na estrada.");
    }

    @Override
    public String tipoCombustivel() {
        return "Gasolina";
    }
}
