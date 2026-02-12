import { render, screen, within } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import { beforeEach, describe, expect, it } from "vitest";
import App from "./App";

const CHAVE_STORAGE = "todo_state_v1";
const CHAVE_LEGADA = "tarefas";

async function adicionarTarefa(user, texto) {
  const input = screen.getByLabelText(/nova tarefa/i);
  await user.clear(input);
  await user.type(input, texto);
  await user.click(screen.getByRole("button", { name: /adicionar tarefa/i }));
}

describe("App integration", () => {
  beforeEach(() => {
    window.localStorage.clear();
  });

  it("renderiza layout principal e controles", () => {
    render(<App />);

    expect(
      screen.getByRole("heading", { name: /central de controle de tarefas/i }),
    ).toBeInTheDocument();
    expect(screen.getByLabelText(/nova tarefa/i)).toBeInTheDocument();
    expect(screen.getByRole("button", { name: /^todas$/i })).toBeInTheDocument();
    expect(screen.getByRole("button", { name: /^pendentes$/i })).toBeInTheDocument();
    expect(screen.getByRole("button", { name: /^concluidas$/i })).toBeInTheDocument();
  });

  it("adiciona tarefa com trim e bloqueia envio vazio", async () => {
    const user = userEvent.setup();
    render(<App />);

    const botaoAdicionar = screen.getByRole("button", { name: /adicionar tarefa/i });
    const input = screen.getByLabelText(/nova tarefa/i);

    expect(botaoAdicionar).toBeDisabled();

    await user.type(input, "   ");
    expect(botaoAdicionar).toBeDisabled();

    await user.clear(input);
    await user.type(input, "   Finalizar relatorio   ");
    await user.click(botaoAdicionar);

    expect(screen.getByText("Finalizar relatorio")).toBeInTheDocument();
    expect(input).toHaveValue("");
  });

  it("edita com Enter e cancela com Escape", async () => {
    const user = userEvent.setup();
    render(<App />);

    await adicionarTarefa(user, "Preparar planejamento semanal");

    await user.click(screen.getByRole("button", { name: /editar/i }));
    const inputEdicao = screen.getByDisplayValue("Preparar planejamento semanal");

    await user.clear(inputEdicao);
    await user.type(inputEdicao, "Preparar planejamento de sprint{Enter}");

    expect(screen.getByText("Preparar planejamento de sprint")).toBeInTheDocument();

    await user.click(screen.getByRole("button", { name: /editar/i }));
    const inputEdicaoNovamente = screen.getByDisplayValue(
      "Preparar planejamento de sprint",
    );

    await user.clear(inputEdicaoNovamente);
    await user.type(inputEdicaoNovamente, "Rascunho temporario{Escape}");

    expect(screen.queryByText("Rascunho temporario")).not.toBeInTheDocument();
    expect(screen.getByText("Preparar planejamento de sprint")).toBeInTheDocument();
  });

  it("filtra e busca tarefas", async () => {
    const user = userEvent.setup();
    render(<App />);

    await adicionarTarefa(user, "Planejar sprint");
    await adicionarTarefa(user, "Revisar PR");

    await user.click(
      screen.getByRole("checkbox", { name: /marcar "planejar sprint" como concluida/i }),
    );

    await user.click(screen.getByRole("button", { name: /^pendentes$/i }));
    expect(screen.getByText("Revisar PR")).toBeInTheDocument();
    expect(screen.queryByText("Planejar sprint")).not.toBeInTheDocument();

    await user.click(screen.getByRole("button", { name: /^concluidas$/i }));
    expect(screen.getByText("Planejar sprint")).toBeInTheDocument();
    expect(screen.queryByText("Revisar PR")).not.toBeInTheDocument();

    await user.click(screen.getByRole("button", { name: /^todas$/i }));
    const inputBusca = screen.getByLabelText(/buscar tarefas/i);

    await user.type(inputBusca, "revisar");

    expect(screen.getByText("Revisar PR")).toBeInTheDocument();
    expect(screen.queryByText("Planejar sprint")).not.toBeInTheDocument();
  });

  it("confirma remocao e limpar concluidas", async () => {
    const user = userEvent.setup();
    render(<App />);

    await adicionarTarefa(user, "Primeira tarefa");
    await adicionarTarefa(user, "Segunda tarefa");

    await user.click(
      screen.getByRole("checkbox", { name: /marcar "primeira tarefa" como concluida/i }),
    );

    const itemSegundaTarefa = screen.getByText("Segunda tarefa").closest("li");
    expect(itemSegundaTarefa).not.toBeNull();

    const botaoRemover = within(itemSegundaTarefa).getByRole("button", {
      name: /remover/i,
    });

    await user.click(botaoRemover);
    expect(
      screen.getByText(/clique em remover novamente para confirmar/i),
    ).toBeInTheDocument();

    await user.click(within(itemSegundaTarefa).getByRole("button", { name: /confirmar/i }));
    expect(screen.queryByText("Segunda tarefa")).not.toBeInTheDocument();

    const botaoLimpar = screen.getByRole("button", { name: /limpar concluidas/i });
    await user.click(botaoLimpar);
    expect(screen.getByRole("button", { name: /confirmar limpeza/i })).toBeInTheDocument();

    await user.click(screen.getByRole("button", { name: /confirmar limpeza/i }));
    expect(screen.queryByText("Primeira tarefa")).not.toBeInTheDocument();
  });
});

describe("Persistencia e migracao", () => {
  beforeEach(() => {
    window.localStorage.clear();
  });

  it("carrega estado antigo em ingles e respeita ui salva", () => {
    window.localStorage.setItem(
      CHAVE_STORAGE,
      JSON.stringify({
        tasks: [
          {
            id: "legacy-1",
            text: "Legacy task",
            completed: false,
            createdAt: 10,
            updatedAt: 11,
          },
        ],
        ui: {
          filter: "pending",
          query: "legacy",
        },
      }),
    );

    render(<App />);

    expect(screen.getByText("Legacy task")).toBeInTheDocument();
    expect(screen.getByLabelText(/buscar tarefas/i)).toHaveValue("legacy");
    expect(screen.getByRole("button", { name: /^pendentes$/i })).toHaveAttribute(
      "aria-pressed",
      "true",
    );
  });

  it("migra tarefas da chave legada", () => {
    window.localStorage.setItem(
      CHAVE_LEGADA,
      JSON.stringify([
        {
          id: "legado-1",
          texto: "Tarefa legada",
          concluida: true,
          criadaEm: 99,
          atualizadaEm: 99,
        },
      ]),
    );

    render(<App />);

    expect(screen.getByText("Tarefa legada")).toBeInTheDocument();
    expect(window.localStorage.getItem(CHAVE_STORAGE)).not.toBeNull();
    expect(window.localStorage.getItem(CHAVE_LEGADA)).toBeNull();
  });

  it("usa fallback seguro quando json persistido e invalido", () => {
    window.localStorage.setItem(CHAVE_STORAGE, "{ broken-json }");

    render(<App />);

    expect(
      screen.getByRole("heading", { name: /central de controle de tarefas/i }),
    ).toBeInTheDocument();
    expect(screen.getByText(/ainda nao ha tarefas/i)).toBeInTheDocument();
  });
});
