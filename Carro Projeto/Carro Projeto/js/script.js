document.addEventListener('DOMContentLoaded', () => {
  const carousel = document.querySelector('.carousel');
  const slides = document.querySelectorAll('.carousel__slide');
  const btnPrev = document.querySelector('.carousel__btn.prev');
  const btnNext = document.querySelector('.carousel__btn.next');

  if (!carousel || slides.length === 0) return;

  let currentIndex = 0;
  const totalSlides = slides.length;
  const intervalTime = 5000;
  let slideInterval;

  // Função para exibir o slide atual
  const showSlide = (index) => {
    slides.forEach(slide => slide.classList.remove('active'));
    currentIndex = (index + totalSlides) % totalSlides;
    slides[currentIndex].classList.add('active');
  };

  // Próximo e anterior
  const showNextSlide = () => showSlide(currentIndex + 1);
  const showPrevSlide = () => showSlide(currentIndex - 1);

  // Inicia o carrossel automático
  const startCarousel = () => {
    if (!slideInterval) {
      slideInterval = setInterval(showNextSlide, intervalTime);
    }
  };

  // Para o carrossel
  const stopCarousel = () => {
    if (slideInterval) {
      clearInterval(slideInterval);
      slideInterval = null;
    }
  };

  // Inicializa slides com primeiro ativo
  const initSlides = () => {
    slides.forEach(slide => slide.classList.remove('active'));
    if (slides[0]) slides[0].classList.add('active');
  };

  // Eventos
  if (carousel) {
    carousel.addEventListener('mouseenter', stopCarousel);
    carousel.addEventListener('mouseleave', startCarousel);
  }

  if (btnPrev) {
    btnPrev.addEventListener('click', () => {
      stopCarousel();
      showPrevSlide();
      startCarousel();
    });
  }

  if (btnNext) {
    btnNext.addEventListener('click', () => {
      stopCarousel();
      showNextSlide();
      startCarousel();
    });
  }

  // Inicializar tudo
  initSlides();
  startCarousel();
});
