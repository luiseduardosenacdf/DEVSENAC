import { useEffect, useRef, useState } from "react";
import "./index.css";

const formatadorData = new Intl.DateTimeFormat("pt-BR", {
  dateStyle: "short",
  timeStyle: "short",
});

function formatarData(timestamp) {
  if (!Number.isFinite(timestamp)) {
    return "";
  }

  try {
    return formatadorData.format(new Date(timestamp));
  } catch {
    return "";
  }
}

function toIsoDate(valor) {
  if (!Number.isFinite(valor)) {
    return undefined;
  }

  try {
    return new Date(valor).toISOString();
  } catch {
    return undefined;
  }
}

export function ItemDeTarefa({
  tarefa,
  indice,
  aoAlternarConclusao,
  aoRemover,
  aoEditar,
}) {
  const [estaEditando, setEstaEditando] = useState(false);
  const [rascunho, setRascunho] = useState(tarefa.texto);
  const [erro, setErro] = useState("");
  const [confirmarRemocao, setConfirmarRemocao] = useState(false);
  const inputRef = useRef(null);

  useEffect(() => {
    if (estaEditando && inputRef.current) {
      inputRef.current.focus();
      inputRef.current.select();
    }
  }, [estaEditando]);

  useEffect(() => {
    if (!confirmarRemocao) {
      return undefined;
    }

    const timer = window.setTimeout(() => {
      setConfirmarRemocao(false);
    }, 3000);

    return () => {
      window.clearTimeout(timer);
    };
  }, [confirmarRemocao]);

  function iniciarEdicao() {
    setEstaEditando(true);
    setErro("");
    setRascunho(tarefa.texto);
  }

  function cancelarEdicao() {
    setEstaEditando(false);
    setErro("");
    setRascunho(tarefa.texto);
  }

  function salvarEdicao() {
    const resultado = aoEditar(tarefa.id, rascunho);

    if (!resultado.ok) {
      setErro(resultado.erro ?? "Valor de tarefa invalido.");
      return;
    }

    setEstaEditando(false);
    setErro("");
  }

  function handleEdicaoKeyDown(evento) {
    if (evento.key === "Enter") {
      evento.preventDefault();
      salvarEdicao();
    }

    if (evento.key === "Escape") {
      evento.preventDefault();
      cancelarEdicao();
    }
  }

  function handleRemover() {
    if (!confirmarRemocao) {
      setConfirmarRemocao(true);
      return;
    }

    aoRemover(tarefa.id);
  }

  const atrasoAnimacao = `${Math.min(indice, 8) * 55}ms`;
  const criadaEmLabel = formatarData(tarefa.criadaEm);
  const atualizadaEmLabel = formatarData(tarefa.atualizadaEm);

  return (
    <li
      className={tarefa.concluida ? "idt-item idt-completed" : "idt-item"}
      style={{ "--delay": atrasoAnimacao }}
    >
      <div className="idt-mainRow">
        <label className="idt-checkboxLabel">
          <input
            type="checkbox"
            checked={tarefa.concluida}
            onChange={() => aoAlternarConclusao(tarefa.id)}
            aria-label={`Marcar "${tarefa.texto}" como ${
              tarefa.concluida ? "pendente" : "concluida"
            }`}
          />
          <span className="idt-customCheck" aria-hidden="true" />
        </label>

        <div className="idt-contentArea">
          {estaEditando ? (
            <div className="idt-editor">
              <input
                ref={inputRef}
                type="text"
                className="idt-editInput"
                value={rascunho}
                onChange={(evento) => {
                  setRascunho(evento.target.value);
                  if (erro) {
                    setErro("");
                  }
                }}
                onKeyDown={handleEdicaoKeyDown}
                aria-invalid={Boolean(erro)}
              />

              <div className="idt-inlineActions">
                <button
                  type="button"
                  className="idt-saveButton"
                  onClick={salvarEdicao}
                >
                  Salvar
                </button>
                <button
                  type="button"
                  className="idt-ghostButton"
                  onClick={cancelarEdicao}
                >
                  Cancelar
                </button>
              </div>
            </div>
          ) : (
            <button
              type="button"
              className="idt-textButton"
              onClick={iniciarEdicao}
              title="Editar tarefa"
            >
              {tarefa.texto}
            </button>
          )}
        </div>
      </div>

      <div className="idt-footerRow">
        <div className="idt-metadata">
          <time dateTime={toIsoDate(tarefa.criadaEm)}>
            Criada {criadaEmLabel || "agora mesmo"}
          </time>
          {tarefa.atualizadaEm > tarefa.criadaEm ? (
            <span>Atualizada {atualizadaEmLabel || "recentemente"}</span>
          ) : null}
        </div>

        <div className="idt-rowActions">
          {!estaEditando ? (
            <button
              type="button"
              className="idt-ghostButton"
              onClick={iniciarEdicao}
            >
              Editar
            </button>
          ) : null}

          <button
            type="button"
            className={
              confirmarRemocao
                ? "idt-removeButton idt-confirmRemove"
                : "idt-removeButton"
            }
            onClick={handleRemover}
          >
            {confirmarRemocao ? "Confirmar" : "Remover"}
          </button>
        </div>
      </div>

      {confirmarRemocao ? (
        <p className="idt-statusMessage" role="status" aria-live="polite">
          Clique em remover novamente para confirmar.
        </p>
      ) : null}

      {erro ? (
        <p className="idt-errorMessage" role="alert">
          {erro}
        </p>
      ) : null}
    </li>
  );
}
