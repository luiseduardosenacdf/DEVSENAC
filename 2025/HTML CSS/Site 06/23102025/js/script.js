/* Script polido para a versão final:
   - toggle do vídeo (acessível + live region)
   - lazy loading com suporte a <picture> data-srcset
   - mobile nav toggle
   - form handler com feedback
   - ano dinâmico no rodapé
*/

document.addEventListener('DOMContentLoaded', () => {
    const video = document.getElementById('bgVideo');
    const btn = document.getElementById('toggleVideo');
    const toggleLabel = document.getElementById('toggleLabel');
    const ariaStatus = createAriaStatus();
    const lazyImages = document.querySelectorAll('img.lazy');
    const yearEl = document.getElementById('year');
    const navToggle = document.getElementById('navToggle');
    const mainNav = document.getElementById('mainNav');
    const contactForm = document.getElementById('contactForm');
    const formMessage = document.getElementById('formMessage');
  
    // 1) ano no rodapé
    if (yearEl) yearEl.textContent = new Date().getFullYear();
  
    // 2) cria live region (se necessário) e anexa ao DOM
    function createAriaStatus() {
      let region = document.getElementById('ariaStatus');
      if (!region) {
        region = document.createElement('div');
        region.id = 'ariaStatus';
        region.className = 'visually-hidden';
        region.setAttribute('aria-live', 'polite');
        region.setAttribute('aria-atomic', 'true');
        document.body.appendChild(region);
      }
      return region;
    }
  
    // 3) respeitar reduced-motion: se preferido, pause o vídeo
    const reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    if (reduceMotion && video) {
      try { video.pause(); } catch (e) { /* ignore */ }
      if (btn) {
        btn.setAttribute('aria-pressed', 'false');
        if (toggleLabel) toggleLabel.textContent = 'Tocar vídeo';
      }
    } else if (video) {
      // tenta autoplay (muted vídeos normalmente tocam), se for bloqueado ajusta UI
      video.play().catch(() => {
        if (btn) {
          btn.setAttribute('aria-pressed', 'false');
          if (toggleLabel) toggleLabel.textContent = 'Tocar vídeo';
        }
        ariaStatus.textContent = 'Autoplay bloqueado — toque para reproduzir o vídeo.';
      });
    }
  
    // 4) sincroniza estado do botão com eventos do vídeo
    if (video) {
      video.addEventListener('play', () => {
        if (btn) btn.setAttribute('aria-pressed', 'true');
        if (toggleLabel) toggleLabel.textContent = 'Pausar vídeo';
        ariaStatus.textContent = 'Vídeo em reprodução';
      });
      video.addEventListener('pause', () => {
        if (btn) btn.setAttribute('aria-pressed', 'false');
        if (toggleLabel) toggleLabel.textContent = 'Tocar vídeo';
        ariaStatus.textContent = 'Vídeo pausado';
      });
    }
  
    // 5) toggle click handler
    if (btn && video) {
      btn.addEventListener('click', () => {
        if (video.paused) {
          video.play().catch(() => {
            ariaStatus.textContent = 'Não foi possível reproduzir o vídeo automaticamente.';
          });
        } else {
          video.pause();
        }
      });
    }
  
    // 6) lazy-loading imagens com IntersectionObserver
    if ('IntersectionObserver' in window && lazyImages.length) {
      const io = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const img = entry.target;
            const picture = img.closest('picture');
            if (picture) {
              picture.querySelectorAll('source').forEach(source => {
                const srcset = source.getAttribute('data-srcset');
                if (srcset) source.setAttribute('srcset', srcset);
              });
            }
            const dataSrc = img.getAttribute('data-src');
            if (dataSrc) img.src = dataSrc;
            img.addEventListener('load', () => img.classList.remove('lazy'));
            observer.unobserve(img);
          }
        });
      }, { rootMargin: '200px 0px 200px 0px', threshold: 0.01 });
  
      lazyImages.forEach(i => io.observe(i));
    } else {
      // fallback carregar imediatamente
      lazyImages.forEach(img => {
        const picture = img.closest('picture');
        if (picture) {
          picture.querySelectorAll('source').forEach(source => {
            const srcset = source.getAttribute('data-srcset');
            if (srcset) source.setAttribute('srcset', srcset);
          });
        }
        const dataSrc = img.getAttribute('data-src');
        if (dataSrc) img.src = dataSrc;
        img.classList.remove('lazy');
      });
    }
  
    // 7) mobile nav toggle
    if (navToggle && mainNav) {
      navToggle.addEventListener('click', () => {
        const expanded = navToggle.getAttribute('aria-expanded') === 'true';
        navToggle.setAttribute('aria-expanded', String(!expanded));
        navToggle.setAttribute('aria-label', !expanded ? 'Fechar menu' : 'Abrir menu');
        mainNav.style.display = expanded ? '' : 'block';
        // focus first link when opened
        if (!expanded) {
          const firstLink = mainNav.querySelector('a');
          if (firstLink) firstLink.focus();
        }
      });
  
      // fechar menu ao clicar em link (mobile)
      mainNav.querySelectorAll('a').forEach(a => {
        a.addEventListener('click', () => {
          if (window.innerWidth <= 900) {
            navToggle.setAttribute('aria-expanded', 'false');
            mainNav.style.display = '';
          }
        });
      });
    }
  
    // 8) contact form (frontend mock)
    if (contactForm) {
      contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const name = contactForm.querySelector('#nome').value.trim();
        // fake "sending" feedback
        if (formMessage) {
          formMessage.classList.remove('visually-hidden');
          formMessage.textContent = 'Enviando...';
        }
        // simulate network delay (short)
        setTimeout(() => {
          if (formMessage) {
            formMessage.textContent = `Obrigado, ${name || 'visitante'}! Recebemos sua mensagem. Responderemos em breve.`;
          }
          contactForm.reset();
        }, 800);
      });
    }
  
    // 9) keyboard accessibility: space/enter to activate video toggle when focused
    if (btn) {
      btn.addEventListener('keydown', (ev) => {
        if (ev.key === ' ' || ev.key === 'Enter') {
          ev.preventDefault();
          btn.click();
        }
      });
    }
  
    // 10) small UX: hide native video controls and ensure muted
    if (video) {
      video.controls = false;
      video.muted = true;
      // ensure loop if browser interrupted
      video.addEventListener('ended', () => {
        try { video.play(); } catch(e) {}
      });
    }
  });  