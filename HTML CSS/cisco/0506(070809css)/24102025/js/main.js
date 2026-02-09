/* ============================================================
   ⚔️ Portal de Runeterra - main.js (v4.0)
   Autor: Grimoire, O Mago do Código
   Funções: Partículas, Scroll suave, Animações e Formulário
   ============================================================ */

// === 1. Scroll suave ===
document.querySelectorAll('a[href^="#"]').forEach(link => {
  link.addEventListener('click', e => {
    e.preventDefault();
    const target = document.querySelector(link.getAttribute('href'));
    if (target) target.scrollIntoView({ behavior: 'smooth' });
  });
});

// === 2. Animações ao rolar ===
document.addEventListener('DOMContentLoaded', () => {
  const animated = document.querySelectorAll('.fade-up');
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) entry.target.classList.add('show');
    });
  }, { threshold: 0.2 });
  animated.forEach(el => observer.observe(el));
});

// === 3. Partículas mágicas ===
function createParticles() {
  const container = document.createElement('div');
  container.classList.add('particles-container');
  document.body.appendChild(container);

  const total = 40;
  for (let i = 0; i < total; i++) {
    const p = document.createElement('span');
    p.classList.add('particle');
    const size = Math.random() * 4 + 2;
    const x = Math.random() * 100;
    const y = Math.random() * 100;
    const delay = Math.random() * 10;
    const duration = Math.random() * 10 + 6;
    p.style.width = `${size}px`;
    p.style.height = `${size}px`;
    p.style.left = `${x}%`;
    p.style.top = `${y}%`;
    p.style.animationDelay = `${delay}s`;
    p.style.animationDuration = `${duration}s`;
    container.appendChild(p);
  }
}
window.addEventListener('load', createParticles);

// === 4. Validação de formulário ===
const form = document.getElementById('formContato');
if (form) {
  form.addEventListener('submit', e => {
    e.preventDefault();
    if (!form.checkValidity()) {
      form.classList.add('was-validated');
      return;
    }
    document.getElementById('statusForm').textContent = 'Mensagem enviada com sucesso! ✨';
    setTimeout(() => {
      form.reset();
      document.getElementById('statusForm').textContent = '';
      form.classList.remove('was-validated');
    }, 2500);
  });
}

// === 5. Atualizar ano automaticamente ===
document.getElementById('ano').textContent = new Date().getFullYear();

// === 6. Efeito energético nas partículas ===
setInterval(() => {
  document.querySelectorAll('.particle').forEach(p => {
    const pulse = Math.random() * 0.5 + 0.5;
    p.style.opacity = pulse;
  });
}, 1200);

// === 7. Saudação secreta no console ===
console.log("%c⚔️ Portal de Runeterra Ativado", "color:#00e5ff;font-weight:bold;font-size:14px;");
console.log("%c✨ Forjado por Grimoire - O Mago do Código", "color:#8b5cf6;font-style:italic;");
