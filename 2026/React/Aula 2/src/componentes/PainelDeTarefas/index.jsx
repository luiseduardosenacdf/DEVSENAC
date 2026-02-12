import { useEffect, useState } from "react";
import { FormularioDeTarefa } from "../FormularioDeTarefa/index.jsx";
import { ListaDeTarefas } from "../ListaDeTarefas/index.jsx";
import "./index.css";

const OPCOES_FILTRO = [
  { chave: "all", rotulo: "Todas" },
  { chave: "pending", rotulo: "Pendentes" },
  { chave: "completed", rotulo: "Concluidas" },
];

export function PainelDeTarefas({
  inputTarefa,
  setInputTarefa,
  aoAdicionar,
  tarefas,
  aoRemover,
  aoAlternarConclusao,
  aoEditar,
  filtroAtivo,
  aoAlterarFiltro,
  termoBusca,
  aoAlterarBusca,
  aoLimparConcluidas,
  estatisticas,
  taxaConclusao,
  estadoVazio,
  maxCaracteres,
}) {
  const [confirmarLimpeza, setConfirmarLimpeza] = useState(false);
  const podeLimpar = estatisticas.concluidas > 0;
  const emConfirmacao = confirmarLimpeza && podeLimpar;

  useEffect(() => {
    if (!emConfirmacao) {
      return undefined;
    }

    const timer = window.setTimeout(() => {
      setConfirmarLimpeza(false);
    }, 3500);

    return () => {
      window.clearTimeout(timer);
    };
  }, [emConfirmacao]);

  useEffect(() => {
    if (!podeLimpar && confirmarLimpeza) {
      const timer = window.setTimeout(() => {
        setConfirmarLimpeza(false);
      }, 0);

      return () => {
        window.clearTimeout(timer);
      };
    }

    return undefined;
  }, [podeLimpar, confirmarLimpeza]);

  function handleLimparConcluidas() {
    if (!podeLimpar) {
      return;
    }

    if (!emConfirmacao) {
      setConfirmarLimpeza(true);
      return;
    }

    aoLimparConcluidas();
    setConfirmarLimpeza(false);
  }

  return (
    <main className="pdt-shell">
      <header className="pdt-header">
        <div>
          <p className="pdt-eyebrow">Fluxo de trabalho pessoal</p>
          <h1 className="pdt-title">Central de Controle de Tarefas</h1>
          <p className="pdt-subtitle">
            Execucao estruturada, pesquisavel e focada para suas tarefas diarias.
          </p>
        </div>
      </header>

      <section className="pdt-surface" aria-label="Criar tarefa">
        <FormularioDeTarefa
          inputTarefa={inputTarefa}
          setInputTarefa={setInputTarefa}
          aoAdicionar={aoAdicionar}
          maxCaracteres={maxCaracteres}
        />
      </section>

      <section className="pdt-surface" aria-label="Visao geral das tarefas">
        <div className="pdt-stats">
          <article className="pdt-statCard">
            <p className="pdt-statLabel">Total</p>
            <p className="pdt-statValue">{estatisticas.total}</p>
          </article>

          <article className="pdt-statCard">
            <p className="pdt-statLabel">Pendentes</p>
            <p className="pdt-statValue">{estatisticas.pendentes}</p>
          </article>

          <article className="pdt-statCard">
            <p className="pdt-statLabel">Concluidas</p>
            <p className="pdt-statValue">{estatisticas.concluidas}</p>
          </article>

          <article className="pdt-statCard pdt-progressCard">
            <p className="pdt-statLabel">Progresso</p>
            <p className="pdt-statValue">{taxaConclusao}%</p>
          </article>
        </div>
      </section>

      <section className="pdt-surface" aria-label="Filtros e busca de tarefas">
        <section className="pdt-toolbar" aria-label="Controles de tarefas">
          <div className="pdt-filters" role="group" aria-label="Filtros de tarefas">
            {OPCOES_FILTRO.map((opcao) => (
              <button
                key={opcao.chave}
                type="button"
                className={
                  filtroAtivo === opcao.chave
                    ? "pdt-filterButton pdt-filterAtivo"
                    : "pdt-filterButton"
                }
                onClick={() => aoAlterarFiltro(opcao.chave)}
                aria-pressed={filtroAtivo === opcao.chave}
              >
                {opcao.rotulo}
              </button>
            ))}
          </div>

          <div className="pdt-searchArea">
            <label className="pdt-searchLabel" htmlFor="busca-tarefa">
              Buscar tarefas
            </label>

            <input
              id="busca-tarefa"
              className="pdt-searchInput"
              type="search"
              placeholder="Buscar por titulo"
              value={termoBusca}
              onChange={(evento) => aoAlterarBusca(evento.target.value)}
            />
          </div>

          <div className="pdt-actions">
            <button
              type="button"
              className={emConfirmacao ? "pdt-clearButton pdt-clearConfirm" : "pdt-clearButton"}
              onClick={handleLimparConcluidas}
              disabled={!podeLimpar}
            >
              {emConfirmacao ? "Confirmar limpeza" : "Limpar concluidas"}
            </button>
          </div>

          <p className="pdt-statusMessage" role="status" aria-live="polite">
            {emConfirmacao
              ? "Clique novamente para remover todas as tarefas concluidas."
              : ""}
          </p>
        </section>
      </section>

      <section className="pdt-surface" aria-label="Resultados das tarefas">
        <ListaDeTarefas
          tarefas={tarefas}
          estadoVazio={estadoVazio}
          aoAlternarConclusao={aoAlternarConclusao}
          aoRemover={aoRemover}
          aoEditar={aoEditar}
        />
      </section>
    </main>
  );
}
