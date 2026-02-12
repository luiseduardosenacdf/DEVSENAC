# Task Control Center (React + Vite)

Aplicacao de tarefas com arquitetura por feature, foco em manutencao e UX profissional.

## Principais melhorias

- Separacao por dominio (`features/tasks`) e camadas (`app`, `shared`).
- Estado previsivel com `useReducer` + seletores dedicados.
- Persistencia robusta em `localStorage` com migracao automatica da chave legada `tarefas`.
- Fluxos de produtividade: criar, editar inline, buscar, filtrar, concluir, remover e limpar concluidas com confirmacao.
- Interface responsiva com CSS Modules e design system simples via tokens.
- Testes automatizados com Vitest + Testing Library.

## Scripts

```bash
npm run dev
npm run build
npm run lint
npm run test
npm run test:watch
npm run preview
```

## Estrutura

```text
src/
  app/
    App.jsx
    App.module.css
    styles/
      global.css
      tokens.css
  features/
    tasks/
      index.js
      lib/
        normalizeTask.js
        validateTaskText.js
      model/
        constants.js
        selectors.js
        storage.js
        tasksReducer.js
        useTasks.js
      ui/
        EmptyState.jsx
        EmptyState.module.css
        TaskComposer.jsx
        TaskComposer.module.css
        TaskItem.jsx
        TaskItem.module.css
        TaskList.jsx
        TaskList.module.css
        TaskStats.jsx
        TaskStats.module.css
        TaskToolbar.jsx
        TaskToolbar.module.css
  shared/
    lib/
      createId.js
      formatDate.js
  test/
    setup.js
  main.jsx
```

## Modelo de dados

`Task`:

```js
{
  id: string,
  text: string,
  completed: boolean,
  createdAt: number,
  updatedAt: number
}
```

`TodoState`:

```js
{
  tasks: Task[],
  ui: {
    filter: "all" | "pending" | "completed",
    query: string
  }
}
```

## Persistencia e migracao

- Chave atual: `todo_state_v1`
- Chave legada migrada automaticamente: `tarefas`
- JSON invalido nunca quebra a aplicacao; o estado padrao e usado como fallback.

## Qualidade

- Lint: ESLint com regras para React Hooks e Fast Refresh.
- Testes:
  - Integracao de fluxos principais no `App`.
  - Seletores de filtro e busca.
  - Persistencia e migracao no storage.