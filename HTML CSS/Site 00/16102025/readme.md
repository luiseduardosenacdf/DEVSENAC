# 🚀 Projeto: Blog Responsivo (HTML5 Semântico e CSS Flex/Grid)

Este projeto é um curso prático de HTML5 e CSS, focado na construção de layouts **responsivos** (adaptáveis a qualquer tamanho de tela) e no uso da **semântica** moderna. Ele demonstra a aplicação eficiente de containers como a `<div>` e elementos semânticos.

---

## 💡 Conceitos Chave Explorados

O projeto foi construído para ilustrar as melhores práticas de desenvolvimento front-end moderno:

### 1. HTML5 Semântico
Utilizamos tags HTML5 que dão **significado** ao conteúdo, melhorando a acessibilidade (leitores de tela) e o SEO (mecanismos de busca).

* **`<header>`, `<nav>`, `<footer>`**: Estrutura geral do site.
* **`<main>`**: Container principal do conteúdo, único por página.
* **`<section>` e `<aside>`**: Separação do conteúdo principal e da barra lateral, respectivamente.
* **`<article>`**: Usado para posts de blog individuais, que são conteúdos independentes.
* **`<time>`**: Para marcação de datas em formato de máquina e legível.

### 2. Uso Inteligente da `<div>`
A `<div>` foi utilizada com **propósito estrutural** e **não semântico**, atuando como um poderoso container para:

| Classe/Função | Objetivo |
| :--- | :--- |
| **`.container`** | **Limitar a largura e centralizar** todo o conteúdo do site, garantindo margens laterais em telas grandes. |
| **Containers de Layout** | Agrupar elementos que serão organizados lado a lado (como o `<main>` que agrupa `<section>` e `<aside>` para o layout de duas colunas). |
| **Containers Visuais** | Ex.: `widget-promocional` dentro da `<aside>`, usado apenas para aplicar um **bloco de estilo** (fundo, borda) a um grupo de elementos. |

### 3. Base para Responsividade
A fundação do design responsivo foi estabelecida desde o início:

* **`<meta name="viewport">`**: Configuração essencial no `<head>` para garantir que o navegador **renderize o site com a largura real do dispositivo**, não com a largura padrão de desktop.
* **Imagens Flexíveis**: A classe `.img-responsiva` será usada no CSS para evitar que imagens quebrem o layout (`max-width: 100%`).

---

## 📂 Estrutura do Projeto

A organização básica dos arquivos é a seguinte: