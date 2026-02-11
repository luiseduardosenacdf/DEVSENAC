// Importa o módulo express
const express = require("express");

// Inicializa a aplicação
const app = express();

// Middleware para interpretar JSON no corpo das requisições
app.use(express.json());

// Banco de dados fictício
const users = [
  { id: 1, nome: "João Vitor" },
  { id: 2, nome: "Luis Eduardo" },
  { id: 3, nome: "Caue" },
  { id: 4, nome: "Guilherme" },
];

// Rota GET para listar todos os usuários
app.get("/users", (req, res) => {
  res.status(200).json(users);
});



// Define a porta (usa variável de ambiente ou padrão 3000)
const PORT = process.env.PORT || 3000;

// Inicia o servidor
app.listen(PORT, () => {
  console.log(`🚀 API rodando na porta ${PORT}`);
});
