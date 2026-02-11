package aula06_22_07_2025;

public class Peixe implements Nadador {
	String especie;
	double peso;
	
	public Peixe(String especie, double peso) {
		super();
		this.especie = especie;
		this.peso = peso;
	}
	
	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	@Override
	public void nadar() {
		System.out.println("Peixe nadando!");
	}
}
