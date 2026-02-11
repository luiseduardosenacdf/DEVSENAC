import { FormularioDeTarefa } from "../FormularioDeTarefa";
import { ListaDeTarefas } from "../ListaDeTarefas";
import "./index.css";

export function PainelDeTarefas({
  inputTarefa,
  setInputTarefa,
  aoAdicionar,
  tarefas,
  aoRemover,
  aoAlternarConclusao,
  aoEditar,
}) {
  return (
    <main className="painel">
      <h1 className="painel__titulo">Lista de tarefas</h1>

      <FormularioDeTarefa
        inputTarefa={inputTarefa}
        setInputTarefa={setInputTarefa}
        aoAdicionar={aoAdicionar}
      />

      <ListaDeTarefas
        tarefas={tarefas}
        aoRemover={aoRemover}
        aoAlternarConclusao={aoAlternarConclusao}
        aoEditar={aoEditar}
      />

      {tarefas.length === 0 && (
        <p className="painel__vazio">Parabens! Voce concluiu tudo!</p>
      )}
    </main>
  );
}
