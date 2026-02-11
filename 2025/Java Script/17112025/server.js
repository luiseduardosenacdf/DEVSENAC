const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

// Banco de dados em memória (NÃO persiste ao reiniciar)
let habits = [];
let meals = [];
let workouts = [];

// ------------------------------
// Rotas de HÁBITOS (CRUD simples)
// ------------------------------

// Listar hábitos
app.get("/habits", (req, res) => {
  res.json(habits);
});

// Criar hábito
app.post("/habits", (req, res) => {
  const habit = {
    id: "id" + Math.random().toString(36).slice(2, 9),
    title: req.body.title,
    time: req.body.time,
    active: true
  };
  habits.push(habit);
  res.status(201).json(habit);
});

// Excluir hábito
app.delete("/habits/:id", (req, res) => {
  habits = habits.filter(h => h.id !== req.params.id);
  res.json({ message: "Hábito removido" });
});

// ------------------------------
// Rotas de REFEIÇÕES
// ------------------------------

// Listar refeições
app.get("/meals", (req, res) => {
  res.json(meals);
});

// Criar refeição
app.post("/meals", (req, res) => {
  const meal = {
    id: "id" + Math.random().toString(36).slice(2, 9),
    title: req.body.title,
    calories: req.body.calories,
    note: req.body.note,
    datetime: new Date().toISOString()
  };
  meals.push(meal);
  res.status(201).json(meal);
});

// ------------------------------
// Rotas de TREINOS
// ------------------------------

// Listar treinos
app.get("/workouts", (req, res) => {
  res.json(workouts);
});

// Criar treino
app.post("/workouts", (req, res) => {
  const workout = {
    id: "id" + Math.random().toString(36).slice(2, 9),
    type: req.body.type,
    duration: req.body.duration,
    note: req.body.note,
    datetime: new Date().toISOString()
  };
  workouts.push(workout);
  res.status(201).json(workout);
});

// ------------------------------
// Inicializar o servidor
// ------------------------------
const PORT = 3000;
app.listen(PORT, () => {
  console.log("API rodando em http://localhost:" + PORT);
});
