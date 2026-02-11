import { useState } from "react";
import { PainelDeTarefas } from "./componentes/PainelDeTarefas";

function gerarId() {
  if (typeof crypto !== "undefined" && crypto.randomUUID) {
    return crypto.randomUUID();
  }

  return String(Date.now() + Math.random());
}

function App() {
  const [tarefas, setTarefas] = useState(() => [
    {
      id: gerarId(),
      texto: "Aprender a fazer programa de computador",
      concluida: false,
    },
  ]);
  const [inputTarefa, setInputTarefa] = useState("");

  function adicionarTarefa(e) {
    e.preventDefault();
    const textoNormalizado = inputTarefa.trim();

    if (textoNormalizado !== "") {
      const novaTarefa = {
        id: gerarId(),
        texto: textoNormalizado,
        concluida: false,
      };

      setTarefas((prev) => [...prev, novaTarefa]);
      setInputTarefa("");
    }
  }

  function removerTarefa(idRemover) {
    setTarefas((prev) => prev.filter((tarefa) => tarefa.id !== idRemover));
  }

  function alternarConclusao(idAlternar) {
    setTarefas((prev) =>
      prev.map((tarefa) =>
        tarefa.id === idAlternar
          ? { ...tarefa, concluida: !tarefa.concluida }
          : tarefa
      )
    );
  }

  function editarTarefa(idEditar, textoAtualizado) {
    const textoNormalizado = textoAtualizado.trim();

    if (textoNormalizado === "") {
      return;
    }

    setTarefas((prev) =>
      prev.map((tarefa) =>
        tarefa.id === idEditar
          ? { ...tarefa, texto: textoNormalizado }
          : tarefa
      )
    );
  }

  return (
    <PainelDeTarefas
      inputTarefa={inputTarefa}
      setInputTarefa={setInputTarefa}
      aoAdicionar={adicionarTarefa}
      tarefas={tarefas}
      aoRemover={removerTarefa}
      aoAlternarConclusao={alternarConclusao}
      aoEditar={editarTarefa}
    />
  );
}

export default App;
