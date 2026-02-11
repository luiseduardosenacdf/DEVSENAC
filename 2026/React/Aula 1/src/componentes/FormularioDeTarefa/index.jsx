import "./index.css";

export function FormularioDeTarefa({ inputTarefa, setInputTarefa, aoAdicionar }) {
  return (
    <form className="formulario" onSubmit={aoAdicionar}>
      <input
        id="nova-tarefa"
        name="nova-tarefa"
        className="formulario__input"
        type="text"
        aria-label="Nova tarefa"
        placeholder="Digite aqui uma nova tarefa..."
        value={inputTarefa}
        onChange={(e) => setInputTarefa(e.target.value)}
      />
      <button className="formulario__botao" type="submit">
        Adicionar
      </button>
    </form>
  );
}
