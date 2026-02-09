package aula04exercicio_17_07_2025;

public class Veiculo {

    private String veiculo;

    public Veiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public void mover() {
        System.out.println("O veículo está se movendo.");
    }

    public String tipoCombustivel() {
        return "Tipo de Combustível";
    }
}
