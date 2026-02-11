package aula04exercicio_17_07_2025;

public class Bicicleta extends Veiculo {

    public Bicicleta(String veiculo) {
        super(veiculo);
    }

    @Override
    public void mover() {
        System.out.println("A bicicleta está sendo pedalada.");
    }

    @Override
    public String tipoCombustivel() {
        return "Nenhum (movida a pedal)";
    }
}
