import { ItemDeTarefa } from "../ItemDeTarefa";
import "./index.css";

export function ListaDeTarefas({
  tarefas,
  aoRemover,
  aoAlternarConclusao,
  aoEditar,
}) {
  return (
    <ul className="lista-tarefas">
      {tarefas.map((tarefa) => (
        <ItemDeTarefa
          key={tarefa.id}
          tarefa={tarefa}
          aoRemover={aoRemover}
          aoAlternarConclusao={aoAlternarConclusao}
          aoEditar={aoEditar}
        />
      ))}
    </ul>
  );
}
