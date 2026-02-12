import { useEffect, useMemo, useState } from "react";
import { PainelDeTarefas } from "./componentes/PainelDeTarefas/index.jsx";

const CHAVE_STORAGE = "todo_state_v1";
const CHAVE_LEGADA = "tarefas";
const MAX_TEXTO_TAREFA = 180;

const FILTROS = Object.freeze({
  TODAS: "all",
  PENDENTES: "pending",
  CONCLUIDAS: "completed",
});

function temStorage() {
  return typeof window !== "undefined" && typeof window.localStorage !== "undefined";
}

function gerarId() {
  if (typeof crypto !== "undefined" && typeof crypto.randomUUID === "function") {
    return crypto.randomUUID();
  }

  return `${Date.now()}-${Math.random().toString(36).slice(2, 10)}`;
}

function normalizarTexto(valor) {
  return String(valor ?? "")
    .replace(/\s+/g, " ")
    .trim();
}

function normalizarNumero(valor, fallback) {
  return Number.isFinite(valor) ? valor : fallback;
}

function normalizarFiltro(valor) {
  if (valor === FILTROS.PENDENTES) {
    return FILTROS.PENDENTES;
  }

  if (valor === FILTROS.CONCLUIDAS) {
    return FILTROS.CONCLUIDAS;
  }

  return FILTROS.TODAS;
}

function normalizarTarefa(entrada) {
  if (!entrada || typeof entrada !== "object") {
    return null;
  }

  const texto = normalizarTexto(entrada.texto ?? entrada.text ?? "");
  if (!texto) {
    return null;
  }

  const agora = Date.now();
  const criadaEm = normalizarNumero(entrada.criadaEm ?? entrada.createdAt, agora);
  const atualizadaEm = normalizarNumero(
    entrada.atualizadaEm ?? entrada.updatedAt,
    criadaEm,
  );
  const idBruto = typeof entrada.id === "string" ? entrada.id.trim() : "";

  return {
    id: idBruto || gerarId(),
    texto,
    concluida: Boolean(entrada.concluida ?? entrada.completed),
    criadaEm,
    atualizadaEm,
  };
}

function normalizarLista(entrada) {
  if (!Array.isArray(entrada)) {
    return [];
  }

  const ids = new Set();
  const tarefas = [];

  entrada.forEach((item) => {
    const tarefa = normalizarTarefa(item);
    if (!tarefa) {
      return;
    }

    if (ids.has(tarefa.id)) {
      tarefa.id = gerarId();
    }

    ids.add(tarefa.id);
    tarefas.push(tarefa);
  });

  return tarefas;
}

function estadoPadrao() {
  return {
    tarefas: [],
    filtroAtivo: FILTROS.TODAS,
    termoBusca: "",
  };
}

function serializarEstado(tarefas, filtroAtivo, termoBusca) {
  return {
    tasks: tarefas.map((tarefa) => ({
      id: tarefa.id,
      text: tarefa.texto,
      completed: tarefa.concluida,
      createdAt: tarefa.criadaEm,
      updatedAt: tarefa.atualizadaEm,
    })),
    ui: {
      filter: filtroAtivo,
      query: termoBusca,
    },
  };
}

function lerJsonSeguro(chave) {
  if (!temStorage()) {
    return null;
  }

  try {
    const bruto = window.localStorage.getItem(chave);
    if (!bruto) {
      return null;
    }

    return JSON.parse(bruto);
  } catch {
    return null;
  }
}

function validarTextoTarefa(valor) {
  const texto = normalizarTexto(valor);

  if (!texto) {
    return {
      ok: false,
      texto: "",
      erro: "A tarefa nao pode ficar vazia.",
    };
  }

  if (texto.length > MAX_TEXTO_TAREFA) {
    return {
      ok: false,
      texto,
      erro: `A tarefa deve ter no maximo ${MAX_TEXTO_TAREFA} caracteres.`,
    };
  }

  return {
    ok: true,
    texto,
    erro: "",
  };
}

function carregarEstadoInicial() {
  const fallback = estadoPadrao();

  if (!temStorage()) {
    return fallback;
  }

  const estadoAtual = lerJsonSeguro(CHAVE_STORAGE);
  if (estadoAtual && typeof estadoAtual === "object" && !Array.isArray(estadoAtual)) {
    const tarefas = normalizarLista(estadoAtual.tasks ?? estadoAtual.tarefas);
    const ui = estadoAtual.ui && typeof estadoAtual.ui === "object" ? estadoAtual.ui : {};
    const filtroAtivo = normalizarFiltro(ui.filter ?? estadoAtual.filtroAtivo);
    const query = ui.query ?? estadoAtual.termoBusca;
    const termoBusca = typeof query === "string" ? query : "";

    return {
      tarefas,
      filtroAtivo,
      termoBusca,
    };
  }

  const tarefasLegadas = lerJsonSeguro(CHAVE_LEGADA);
  if (Array.isArray(tarefasLegadas)) {
    const migrado = {
      tarefas: normalizarLista(tarefasLegadas),
      filtroAtivo: FILTROS.TODAS,
      termoBusca: "",
    };

    try {
      window.localStorage.setItem(
        CHAVE_STORAGE,
        JSON.stringify(
          serializarEstado(migrado.tarefas, migrado.filtroAtivo, migrado.termoBusca),
        ),
      );
      window.localStorage.removeItem(CHAVE_LEGADA);
    } catch {
      // noop
    }

    return migrado;
  }

  return fallback;
}

function obterEstadoVazio(estatisticas, filtroAtivo, termoBusca) {
  const buscaNormalizada = termoBusca.trim();

  if (estatisticas.total === 0) {
    return {
      titulo: "Ainda nao ha tarefas",
      descricao: "Crie sua primeira tarefa acima e comece a organizar seu dia.",
    };
  }

  if (buscaNormalizada) {
    return {
      titulo: "Nenhum resultado encontrado",
      descricao: `Nenhuma tarefa contem "${buscaNormalizada}". Tente outro termo de busca.`,
    };
  }

  if (filtroAtivo === FILTROS.PENDENTES) {
    return {
      titulo: "Nenhuma tarefa pendente",
      descricao: "Otimo ritmo. Todas as tarefas estao concluidas no momento.",
    };
  }

  if (filtroAtivo === FILTROS.CONCLUIDAS) {
    return {
      titulo: "Nenhuma tarefa concluida",
      descricao: "Conclua uma tarefa para ve-la listada aqui.",
    };
  }

  return {
    titulo: "Nada para exibir",
    descricao: "Ajuste os filtros ou adicione uma nova tarefa.",
  };
}

function App() {
  const [estadoInicial] = useState(() => carregarEstadoInicial());
  const [tarefas, setTarefas] = useState(estadoInicial.tarefas);
  const [inputTarefa, setInputTarefa] = useState("");
  const [filtroAtivo, setFiltroAtivo] = useState(estadoInicial.filtroAtivo);
  const [termoBusca, setTermoBusca] = useState(estadoInicial.termoBusca);

  useEffect(() => {
    if (!temStorage()) {
      return;
    }

    try {
      const payload = serializarEstado(tarefas, filtroAtivo, termoBusca);
      window.localStorage.setItem(CHAVE_STORAGE, JSON.stringify(payload));
    } catch {
      // noop
    }
  }, [tarefas, filtroAtivo, termoBusca]);

  function adicionarTarefa(evento) {
    evento.preventDefault();

    const resultado = validarTextoTarefa(inputTarefa);
    if (!resultado.ok) {
      return resultado;
    }

    const agora = Date.now();
    const novaTarefa = {
      id: gerarId(),
      texto: resultado.texto,
      concluida: false,
      criadaEm: agora,
      atualizadaEm: agora,
    };

    setTarefas((anteriores) => [...anteriores, novaTarefa]);
    setInputTarefa("");

    return {
      ok: true,
      texto: resultado.texto,
      erro: "",
    };
  }

  function removerTarefa(idRemover) {
    setTarefas((anteriores) => anteriores.filter((tarefa) => tarefa.id !== idRemover));
  }

  function alternarConclusao(idAlternar) {
    const agora = Date.now();

    setTarefas((anteriores) =>
      anteriores.map((tarefa) =>
        tarefa.id === idAlternar
          ? { ...tarefa, concluida: !tarefa.concluida, atualizadaEm: agora }
          : tarefa,
      ),
    );
  }

  function editarTarefa(idEditar, textoAtualizado) {
    const resultado = validarTextoTarefa(textoAtualizado);
    if (!resultado.ok) {
      return resultado;
    }

    const agora = Date.now();

    setTarefas((anteriores) =>
      anteriores.map((tarefa) =>
        tarefa.id === idEditar
          ? { ...tarefa, texto: resultado.texto, atualizadaEm: agora }
          : tarefa,
      ),
    );

    return {
      ok: true,
      texto: resultado.texto,
      erro: "",
    };
  }

  function alterarFiltro(novoFiltro) {
    setFiltroAtivo(normalizarFiltro(novoFiltro));
  }

  function alterarBusca(valor) {
    setTermoBusca(String(valor ?? ""));
  }

  function limparConcluidas() {
    setTarefas((anteriores) => anteriores.filter((tarefa) => !tarefa.concluida));
  }

  const estatisticas = useMemo(() => {
    const total = tarefas.length;
    const concluidas = tarefas.reduce(
      (quantidade, tarefa) => (tarefa.concluida ? quantidade + 1 : quantidade),
      0,
    );

    return {
      total,
      concluidas,
      pendentes: total - concluidas,
    };
  }, [tarefas]);

  const taxaConclusao = useMemo(() => {
    if (estatisticas.total === 0) {
      return 0;
    }

    return Math.round((estatisticas.concluidas / estatisticas.total) * 100);
  }, [estatisticas]);

  const tarefasVisiveis = useMemo(() => {
    const buscaNormalizada = termoBusca.trim().toLowerCase();

    return tarefas.filter((tarefa) => {
      if (filtroAtivo === FILTROS.PENDENTES && tarefa.concluida) {
        return false;
      }

      if (filtroAtivo === FILTROS.CONCLUIDAS && !tarefa.concluida) {
        return false;
      }

      if (buscaNormalizada && !tarefa.texto.toLowerCase().includes(buscaNormalizada)) {
        return false;
      }

      return true;
    });
  }, [tarefas, filtroAtivo, termoBusca]);

  const estadoVazio = useMemo(
    () => obterEstadoVazio(estatisticas, filtroAtivo, termoBusca),
    [estatisticas, filtroAtivo, termoBusca],
  );

  return (
    <PainelDeTarefas
      inputTarefa={inputTarefa}
      setInputTarefa={setInputTarefa}
      aoAdicionar={adicionarTarefa}
      tarefas={tarefasVisiveis}
      aoRemover={removerTarefa}
      aoAlternarConclusao={alternarConclusao}
      aoEditar={editarTarefa}
      filtroAtivo={filtroAtivo}
      aoAlterarFiltro={alterarFiltro}
      termoBusca={termoBusca}
      aoAlterarBusca={alterarBusca}
      aoLimparConcluidas={limparConcluidas}
      estatisticas={estatisticas}
      taxaConclusao={taxaConclusao}
      estadoVazio={estadoVazio}
      maxCaracteres={MAX_TEXTO_TAREFA}
    />
  );
}

export default App;
