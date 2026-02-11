import { useState } from "react";
import "./index.css";

export function ItemDeTarefa({
  tarefa,
  aoRemover,
  aoAlternarConclusao,
  aoEditar,
}) {
  const [estaEditando, setEstaEditando] = useState(false);
  const [textoEdicao, setTextoEdicao] = useState(tarefa.texto);
  const textoEdicaoValido = textoEdicao.trim() !== "";

  function iniciarEdicao() {
    setTextoEdicao(tarefa.texto);
    setEstaEditando(true);
  }

  function cancelarEdicao() {
    setTextoEdicao(tarefa.texto);
    setEstaEditando(false);
  }

  function salvarEdicao() {
    if (!textoEdicaoValido) {
      return;
    }

    aoEditar(tarefa.id, textoEdicao.trim());
    setEstaEditando(false);
  }

  return (
    <li
      className={`item-tarefa ${
        tarefa.concluida ? "item-tarefa--concluida" : ""
      }`}
    >
      <div className="item-tarefa__principal">
        <input
          className="item-tarefa__check"
          type="checkbox"
          checked={tarefa.concluida}
          onChange={() => aoAlternarConclusao(tarefa.id)}
          aria-label="Marcar tarefa como concluida"
        />

        {estaEditando ? (
          <input
            className="item-tarefa__input-edicao"
            type="text"
            aria-label="Editar texto da tarefa"
            value={textoEdicao}
            onChange={(e) => setTextoEdicao(e.target.value)}
            onKeyDown={(e) => {
              if (e.key === "Enter") {
                e.preventDefault();
                salvarEdicao();
              }

              if (e.key === "Escape") {
                cancelarEdicao();
              }
            }}
            autoFocus
          />
        ) : (
          <span className="item-tarefa__texto">{tarefa.texto}</span>
        )}
      </div>

      <div className="item-tarefa__acoes">
        {estaEditando ? (
          <>
            <button
              className="item-tarefa__botao item-tarefa__botao--primario"
              type="button"
              onClick={salvarEdicao}
              disabled={!textoEdicaoValido}
            >
              Salvar
            </button>
            <button
              className="item-tarefa__botao"
              type="button"
              onClick={cancelarEdicao}
            >
              Cancelar
            </button>
          </>
        ) : (
          <button
            className="item-tarefa__botao"
            type="button"
            onClick={iniciarEdicao}
          >
            Editar
          </button>
        )}

        <button
          className="item-tarefa__botao item-tarefa__botao--perigo"
          type="button"
          onClick={() => aoRemover(tarefa.id)}
        >
          Remover
        </button>
      </div>
    </li>
  );
}
