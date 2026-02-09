// Importando as dependências necessárias
const express = require("express"); // Framework para criação de servidores HTTP
const { v4: uuid } = require("uuid"); // Gerador de IDs únicos
const morgan = require("morgan"); // Logger de requisições HTTP
const cors = require("cors"); // Permite que o servidor aceite requisições de diferentes domínios
const Joi = require("joi"); // Biblioteca para validação de dados
const helmet = require("helmet"); // Adiciona cabeçalhos de segurança HTTP
const rateLimit = require("express-rate-limit"); // Limita o número de requisições para prevenir abuso
const pino = require("pino"); // Logger de alto desempenho
const jwt = require("jsonwebtoken"); // Para gerar e verificar tokens JWT
const bcrypt = require("bcryptjs"); // Biblioteca para criptografar senhas

// Inicializando o servidor e a configuração de logging
const app = express(); // Cria uma instância do servidor Express
const PORT = 3000; // Porta que o servidor vai escutar
const logger = pino({ transport: { target: "pino-pretty" }}); // Inicializa o logger com uma configuração bonita de saída

// Configurações de segurança e middlewares
app.use(helmet()); // Adiciona cabeçalhos HTTP para segurança
app.use(express.json()); // Permite que o servidor entenda JSON nas requisições
app.use(cors()); // Habilita o CORS (Cross-Origin Resource Sharing) para permitir requisições de outros domínios
app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100, message: "Muitas requisições, tente novamente mais tarde." })); // Limita o número de requisições para evitar ataques de força bruta
app.use(morgan("dev")); // Loga as requisições HTTP de forma compacta no console

// Chave secreta para autenticação JWT
const JWT_SECRET = "segredo-super-forte"; // Chave secreta usada para assinar os tokens JWT

// Base de dados simulada de usuários
let usuarios = [  // Exemplo de base de dados de usuários
  { id: "1", nome: "Luis Eduardo", email: "luiseduardo@email.com", senha: bcrypt.hashSync("senha123", 10) },
  { id: "2", nome: "Gabi Gol", email: "gabigol@email.com", senha: bcrypt.hashSync("123456", 10) }
];

// Função para formatar as respostas padrão da API
const resposta = (mensagem, data = null, error = false) => ({ mensagem, data, error });

// Definição do esquema de validação dos dados do usuário
const usuarioSchema = Joi.object({
  nome: Joi.string().min(3).max(100).trim().required(), // Valida o nome com mínimo de 3 e máximo de 100 caracteres
  email: Joi.string().email().lowercase().trim().required(), // Valida o email
  senha: Joi.string().min(4).required() // Valida a senha com no mínimo 4 caracteres
});

// Middleware para autenticação com JWT
const autenticar = (req, res, next) => { // Middleware que verifica a validade do token JWT
  const token = req.headers.authorization?.split(" ")[1]; // Extrai o token do header Authorization
  if (!token) return res.status(401).json(resposta("Token não encontrado", null, true)); // Se não houver token, retorna erro de autenticação

  jwt.verify(token, JWT_SECRET, (err, decoded) => { // Verifica o token usando a chave secreta
    if (err) return res.status(401).json(resposta("Token inválido", null, true)); // Se o token for inválido, retorna erro
    req.userId = decoded.id; // Adiciona o ID do usuário ao objeto da requisição
    next(); // Continua para o próximo middleware ou rota
  });
};

// Rota para login de usuários e geração de token JWT
app.post('/login', (req, res) => {
  const { email, senha } = req.body; // Pega os dados enviados no corpo da requisição
  const user = usuarios.find(u => u.email === email); // Busca o usuário pelo email

  // Se não encontrar o usuário ou a senha estiver errada
  if (!user || !bcrypt.compareSync(senha, user.senha)) { 
    return res.status(401).json(resposta("Credenciais inválidas", null, true)); // Retorna erro de autenticação
  }

  const token = jwt.sign({ id: user.id }, JWT_SECRET, { expiresIn: "1h" }); // Gera o token JWT com validade de 1 hora

  res.json(resposta("Login bem-sucedido", { token })); // Retorna o token para o usuário
});

// Rota para obter todos os usuários (somente para usuários autenticados)
app.get("/usuarios", autenticar, (req, res) => { // Verifica se o usuário está autenticado
  logger.info({ rota: "/usuarios", metodo: "GET" }); // Loga a requisição
  res.json(resposta("Lista recuperada com sucesso", { total: usuarios.length, usuarios })); // Retorna a lista de usuários
});

// Rota para obter um usuário específico pelo ID (somente para usuários autenticados)
app.get("/usuarios/:id", autenticar, (req, res, next) => {
  try {
    const usuario = usuarios.find(u => u.id === req.params.id); // Busca o usuário pelo ID
    if (!usuario) { // Se o usuário não for encontrado
      const err = new Error("Usuário não encontrado");
      err.status = 404; // Define o status como 404 (não encontrado)
      throw err; // Lança o erro
    }
    logger.info({ rota: "/usuarios/:id", metodo: "GET", id: req.params.id }); // Loga a requisição
    res.json(resposta("Usuário encontrado", usuario)); // Retorna o usuário
  } catch (err) {
    logger.error({ erro: err.message }); // Loga o erro
    next(err); // Passa o erro para o middleware de erro
  }
});

// Rota para criar um novo usuário (somente para usuários autenticados)
app.post("/usuarios", autenticar, (req, res, next) => { // Requer autenticação
  try {
    const { error } = usuarioSchema.validate(req.body); // Valida os dados do novo usuário
    if (error) { // Se a validação falhar
      const err = new Error(error.details[0].message);
      err.status = 400; // Retorna erro de validação
      throw err;
    }

    const { nome, email, senha } = req.body;

    // Verifica se o email já está cadastrado
    if (usuarios.some(u => u.email === email)) { 
      const err = new Error("Email já cadastrado");
      err.status = 400; // Retorna erro de email duplicado
      throw err;
    }

    // Cria um novo usuário e o adiciona à base de dados
    const novo = { id: uuid(), nome, email, senha: bcrypt.hashSync(senha, 10) }; 
    usuarios.push(novo);

    logger.info({ rota: "/usuarios", metodo: "POST", usuario: novo }); // Loga a criação do usuário
    res.status(201).json(resposta("Usuário criado com sucesso", novo)); // Retorna o novo usuário criado
  } catch (err) {
    logger.error({ erro: err.message });
    next(err); // Passa o erro para o middleware de erro
  }
});

// Rota para atualizar um usuário (somente para usuários autenticados)
app.put("/usuarios/:id", autenticar, (req, res, next) => {
  try {
    const { error } = usuarioSchema.validate(req.body); // Valida os dados enviados para atualizar o usuário
    if (error) { // Se a validação falhar
      const err = new Error(error.details[0].message);
      err.status = 400; // Retorna erro de validação
      throw err;
    }

    const { email, nome, senha } = req.body;
    
    // Verifica se o email já está em uso por outro usuário
    if (usuarios.some(u => u.email === email && u.id !== req.params.id)) { 
      const err = new Error("Email já está em uso por outro usuário");
      err.status = 400;
      throw err;
    }

    // Busca o usuário pelo ID
    const index = usuarios.findIndex(u => u.id === req.params.id);
    if (index === -1) { // Se não encontrar o usuário
      const err = new Error("Usuário não encontrado");
      err.status = 404; // Retorna erro 404 (não encontrado)
      throw err;
    }

    // Atualiza os dados do usuário
    usuarios[index] = { id: req.params.id, nome, email, senha: bcrypt.hashSync(senha, 10) };

    logger.info({ rota: "/usuarios/:id", metodo: "PUT", id: req.params.id }); // Loga a atualização
    res.json(resposta("Usuário atualizado com sucesso", usuarios[index])); // Retorna o usuário atualizado
  } catch (err) {
    logger.error({ erro: err.message });
    next(err); // Passa o erro para o middleware de erro
  }
});

// Rota para deletar um usuário (somente para usuários autenticados)
app.delete("/usuarios/:id", autenticar, (req, res, next) => {
  try {
    // Busca o usuário pelo ID e o remove da base de dados
    const index = usuarios.findIndex(u => u.id === req.params.id);
    if (index === -1) { // Se não encontrar o usuário
      const err = new Error("Usuário não encontrado");
      err.status = 404; // Retorna erro 404
      throw err;
    }

    // Remove o usuário
    const removido = usuarios.splice(index, 1)[0];
    logger.info({ rota: "/usuarios/:id", metodo: "DELETE", id: req.params.id }); // Loga a remoção
    res.json(resposta("Usuário removido com sucesso", removido)); // Retorna o usuário removido
  } catch (err) {
    logger.error({ erro: err.message });
    next(err); // Passa o erro para o middleware de erro
  }
});

// Rota para verificar a saúde da API (status)
app.get("/", (req, res) => {
  logger.info({ rota: "/", metodo: "GET" }); // Loga a requisição de saúde
  res.json(resposta("API funcionando 🚀", { versao: "5.0.0", timestamp: new Date().toISOString(), status: "online", seguranca: "JWT ativo" }));
});

// Middleware de erro para capturar e tratar erros globais
app.use((err, req, res, next) => {
  logger.error({ mensagem: err.message, rota: req.path }); // Loga o erro
  res.status(err.status || 500).json(resposta(err.message, null, true)); // Retorna a resposta de erro
});

// Inicialização do servidor
app.listen(PORT, () => {
  logger.info(`Servidor rodando: http://localhost:${PORT}`); // Inicia o servidor e loga a URL de acesso
});
