// script.js
// ================================
// Produto 1 - Condicional simples
// ================================
const nomeProduto1 = "Café Expresso";
let precoProduto1 = 8.50;
const statusProduto1 = "Em Estoque";
const produto1 = document.getElementById("produto1");

if (statusProduto1 != "Em Estoque") {
  produto1.classList.add("esgotado");
}

// ================================
// Produto 2 - Condicional composta
// ================================
const nomeProduto2 = "Cappuccino";
let precoProduto2 = 12.00;
const statusProduto2 = "Em Estoque";
const produto2 = document.getElementById("produto2");

if (precoProduto2 > 10) {
  produto2.classList.add("premium");
} else {
  produto2.classList.add("padrao");
}

// ================================
// Produto 3 - Condicional simples
// ================================
const nomeProduto3 = "Latte";
let precoProduto3 = 9.00;
const statusProduto3 = "Esgotado";
const produto3 = document.getElementById("produto3");

if (statusProduto3 != "Em Estoque") {
  produto3.classList.add("esgotado");
}

// ================================
// Simulação de Lote e Desconto
// ================================
console.log("=== Simulação de Estoque ===");
for (let i = 1; i <= 10; i++) {
  if (i % 2 == 0) {
    console.log(`Unidade ${i}: PROMOÇÃO! (Com R$ 1,00 de desconto)`);
  } else {
    console.log(`Unidade ${i}: Preço Normal.`);
  }
}

// ================================
// Interatividade extra: Newsletter
// ================================
const form = document.getElementById("form-news");
const msg = document.getElementById("msg");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  const nome = document.getElementById("firstname").value;
  msg.textContent = `Obrigado, ${nome}! ☕ Você foi inscrito(a) com sucesso!`;
  form.reset();
});
