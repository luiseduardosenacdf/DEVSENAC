import { useState } from "react";
import "./index.css";

export function FormularioDeTarefa({
  inputTarefa,
  setInputTarefa,
  aoAdicionar,
  maxCaracteres,
}) {
  const [erro, setErro] = useState("");
  const tamanhoAtual = inputTarefa.trim().length;

  function handleSubmit(evento) {
    const resultado = aoAdicionar(evento);

    if (!resultado?.ok) {
      setErro(resultado?.erro ?? "Nao foi possivel adicionar a tarefa.");
      return;
    }

    setErro("");
  }

  function handleChange(evento) {
    setInputTarefa(evento.target.value);

    if (erro) {
      setErro("");
    }
  }

  return (
    <form className="fdt-form" onSubmit={handleSubmit} noValidate>
      <label className="fdt-label" htmlFor="nova-tarefa-input">
        Nova tarefa
      </label>

      <div className="fdt-controls">
        <input
          id="nova-tarefa-input"
          name="tarefa"
          type="text"
          className="fdt-input"
          placeholder="Descreva a proxima acao"
          value={inputTarefa}
          onChange={handleChange}
          maxLength={maxCaracteres}
          aria-invalid={Boolean(erro)}
          aria-describedby={erro ? "nova-tarefa-erro" : undefined}
        />

        <button
          className="fdt-submitButton"
          type="submit"
          disabled={tamanhoAtual === 0}
        >
          Adicionar tarefa
        </button>
      </div>

      <div className="fdt-metaRow">
        <span className="fdt-hint">Pressione Enter para adicionar rapidamente.</span>
        <span className="fdt-counter">
          {tamanhoAtual}/{maxCaracteres}
        </span>
      </div>

      {erro ? (
        <p className="fdt-error" id="nova-tarefa-erro" role="alert">
          {erro}
        </p>
      ) : null}
    </form>
  );
}
