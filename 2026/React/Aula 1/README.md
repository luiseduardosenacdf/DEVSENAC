# Lista de Tarefas com React

Aplicacao web de lista de tarefas (to-do list) desenvolvida com React e Vite.

## Sobre o Projeto

Este projeto foi criado para praticar fundamentos de desenvolvimento front-end, como:

- componentes reutilizaveis em React
- gerenciamento de estado com `useState`
- eventos de formulario e manipulacao de listas
- organizacao de estilos por componente

## Sobre o Autor

Sou aluno do curso Tecnico em Desenvolvimento de Sistemas e este projeto faz parte da minha evolucao pratica em programacao web.

## Funcionalidades

- adicionar nova tarefa
- editar tarefa existente
- marcar tarefa como concluida
- remover tarefa
- validacao para impedir tarefas vazias

## Tecnologias Utilizadas

- React
- Vite
- JavaScript (ES Modules)
- CSS
- ESLint

## Como Executar Localmente

1. Instale as dependencias:

```bash
npm install
```

2. Rode em modo desenvolvimento:

```bash
npm run dev
```

3. Gere o build de producao:

```bash
npm run build
```

4. Visualize o build localmente:

```bash
npm run preview
```

## Estrutura Basica do Projeto

```text
src/
  App.jsx
  main.jsx
  index.css
  componentes/
    FormularioDeTarefa/
    ItemDeTarefa/
    ListaDeTarefas/
    PainelDeTarefas/
```

## Proximas Melhorias

- persistencia das tarefas no navegador (LocalStorage)
- filtros por status (todas, pendentes, concluidas)
- testes automatizados para fluxos principais
