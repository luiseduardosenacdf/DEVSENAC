import { ItemDeTarefa } from "../ItemDeTarefa/index.jsx";
import "./index.css";

export function ListaDeTarefas({
  tarefas,
  estadoVazio,
  aoAlternarConclusao,
  aoRemover,
  aoEditar,
}) {
  if (tarefas.length === 0) {
    return (
      <div className="ldt-emptyState">
        <h2 className="ldt-title">{estadoVazio.titulo}</h2>
        <p className="ldt-description">{estadoVazio.descricao}</p>
      </div>
    );
  }

  return (
    <ul className="ldt-list" aria-label="Lista de tarefas">
      {tarefas.map((tarefa, indice) => (
        <ItemDeTarefa
          key={tarefa.id}
          tarefa={tarefa}
          indice={indice}
          aoAlternarConclusao={aoAlternarConclusao}
          aoRemover={aoRemover}
          aoEditar={aoEditar}
        />
      ))}
    </ul>
  );
}
