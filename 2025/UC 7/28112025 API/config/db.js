const mysql = require("mysql2");

const connection = mysql.createConnection({
    host: "localhost",
    port: 3307,
    user: "root",
    password: "senac",      // se tiver senha no XAMPP, coloque aqui
    database: "api_usuarios"
});

connection.connect((err) => {
    if (err) {
        console.error("Erro ao conectar ao MySQL:", err);
        return;
    }
    console.log("MySQL conectado com sucesso!");
});

module.exports = connection;