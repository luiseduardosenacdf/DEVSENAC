// Importa o framework Express, que facilita a criação de servidores HTTP e APIs no Node.js
const express = require('express');

// Cria uma instância do aplicativo Express
// Essa instância será usada para configurar rotas, middlewares e iniciar o servidor
const app = express();

// Middleware nativo do Express para interpretar o corpo (body) das requisições em formato JSON
// Sem isso, o servidor não conseguiria entender os dados enviados em JSON pelo cliente (ex: POST)
app.use(express.json());

// Define a porta onde o servidor irá "ouvir" as requisições HTTP
const PORT = 3000;

// Cria um array que funciona como um banco de dados em memória
// Ou seja, os dados existem apenas enquanto o servidor estiver em execução
let usuarios = [
  { id: 1, nome: "Maria" },
  { id: 2, nome: "João" }
];

// --------------------------------------------------
// ROTA GET /usuarios
// --------------------------------------------------
// Essa rota é acionada quando o cliente faz uma requisição GET para o caminho "/usuarios"
// Sua função é listar todos os usuários armazenados
app.get('/usuarios', (req, res) => {
  // Retorna o status HTTP 200 (OK) e envia o array de usuários em formato JSON
  res.status(200).json(usuarios);
});

// --------------------------------------------------
// ROTA POST /usuarios
// --------------------------------------------------
// Essa rota é acionada quando o cliente faz uma requisição POST para "/usuarios"
// Sua função é cadastrar um novo usuário no sistema
app.post('/usuarios', (req, res) => {
  // Extrai o campo "nome" do corpo da requisição (req.body)
  const { nome } = req.body;

  // Validação: verifica se o campo "nome" foi enviado
  // Se estiver ausente, retorna erro 400 (Bad Request) com mensagem explicativa
  if (!nome) {
    return res.status(400).json({ erro: "O campo 'nome' é obrigatório." });
  }

  // Cria um novo objeto representando o usuário
  // O id é gerado com base no tamanho atual do array (incremental)
  const novoUsuario = {
    id: usuarios.length + 1,
    nome
  };

  // Adiciona o novo usuário ao array (simula a inserção no banco de dados)
  usuarios.push(novoUsuario);

  // Retorna o status 201 (Created) e uma mensagem confirmando o cadastro,
  // junto com os dados do usuário recém-criado
  return res.status(201).json({
    mensagem: "Usuário adicionado com sucesso!",
    usuario: novoUsuario
  });
});

// --------------------------------------------------
// INICIALIZAÇÃO DO SERVIDOR
// --------------------------------------------------
// O método listen faz o servidor começar a "escutar" as requisições na porta especificada
// Quando o servidor estiver rodando, exibirá uma mensagem no terminal
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
