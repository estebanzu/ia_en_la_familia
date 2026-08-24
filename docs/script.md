---
theme: default
colorSchema: light
background: white
title: "Inteligencia Artificial Segura - Inicio Animado"
info: false
editor: false
drawings:
  enabled: false
  persist: false
  presenterOnly: true
overview: false
class: text-center
highlighter: shiki
transition: fade
mdc: true
---

# Animación del Logo - Script de Inicio

<div class="absolute inset-0 flex items-center justify-center" v-click>

  <!-- Capa 1: Fondo con gradiente animado -->
  <div class="absolute inset-0 bg-gradient-to-br from-blue-50 via-white to-amber-50" />

  <!-- Capa 2: Partículas flotantes decorativas -->
  <div class="absolute inset-0 overflow-hidden pointer-events-none">
    <div v-for="i in 12" :key="i" 
      class="absolute rounded-full bg-blue-300/30 animate-float"
      :style="{
        width: (20 + i * 4) + 'px',
        height: (20 + i * 4) + 'px',
        left: (i * 8.33) + '%',
        top: (50 + (i % 3) * 15) + '%',
        animationDelay: (i * 0.5) + 's',
        animationDuration: (8 + i * 0.5) + 's'
      }" />
  </div>

  <!-- Capa 3: Logo principal con animación de entrada -->
  <div class="relative z-10 flex flex-col items-center">
    
    <!-- Anillo de luz pulsante detrás del logo -->
    <div class="absolute -inset-4 rounded-full bg-gradient-to-r from-blue-400 via-amber-400 to-blue-400 opacity-0 animate-pulse-ring" 
      style="animation-delay: 0.3s; animation-duration: 3s;" />
    
    <!-- Logo -->
    <img 
      src="/logo.jpg" 
      alt="Logo Inteligencia Artificial Segura"
      class="w-48 h-48 md:w-64 md:h-64 object-contain drop-shadow-2xl rounded-2xl
             animate-logo-entrance"
      style="animation-delay: 0.5s;"
    />
    
    <!-- Texto reveal animado -->
    <div class="mt-6 space-y-3" v-click="2">
      <h1 class="text-3xl md:text-4xl font-bold text-slate-900 tracking-tight
                 animate-text-reveal"
        style="animation-delay: 1.2s;"
      >
        Inteligencia Artificial Segura
      </h1>
      
      <h2 class="text-lg md:text-xl text-blue-700 font-medium
                 animate-text-reveal"
        style="animation-delay: 1.5s;"
      >
        Cómo Comprenderla, Usarla y Protegerse en Comunidad
      </h2>
      
      <div class="flex items-center justify-center gap-2 mt-4
                 animate-text-reveal"
        style="animation-delay: 1.8s;"
      >
        <div class="w-16 h-px bg-gradient-to-r from-transparent via-blue-500 to-transparent" />
        <lucide-sparkles class="text-amber-500 text-xl animate-pulse-gentle" />
        <div class="w-16 h-px bg-gradient-to-r from-transparent via-amber-500 to-transparent" />
      </div>
      
      <p class="text-sm md:text-base text-slate-600 font-medium
                 animate-text-reveal"
        style="animation-delay: 2.1s;"
      >
        Una guía práctica, ética y de protección para madres, padres y cuidadores
      </p>
    </div>

    <!-- Indicador de inicio -->
    <div class="mt-10 flex items-center justify-center gap-2
               animate-bounce-gentle"
      v-click="3"
      style="animation-delay: 2.8s;"
    >
      <kbd class="px-3 py-1.5 bg-slate-100 border border-slate-300 rounded text-xs text-slate-600 font-mono">
        Espacio
      </kbd>
      <span class="text-xs text-slate-500">para comenzar</span>
      <kbd class="px-3 py-1.5 bg-slate-100 border border-slate-300 rounded text-xs text-slate-600 font-mono">
        →
      </kbd>
    </div>
  </div>

  <!-- Capa 4: Versículo de fondo sutil -->
  <div class="absolute bottom-8 left-1/2 -translate-x-1/2 text-center
             animate-fade-in-up"
    v-click="4"
    style="animation-delay: 3.2s;"
  >
    <blockquote class="text-xs text-slate-400 italic max-w-md px-4">
      "Pues Dios no nos ha dado un espíritu de timidez, sino de fortaleza, de amor y de buen juicio."
    </blockquote>
    <cite class="text-[10px] text-slate-300 block mt-1">— 2 Timoteo 1:7</cite>
  </div>
</div>

<!-- Estilos de animación personalizados -->
<style>
@keyframes float {
  0%, 100% { transform: translateY(0) translateX(0) rotate(0deg); }
  25% { transform: translateY(-30px) translateX(15px) rotate(90deg); }
  50% { transform: translateY(-15px) translateX(-10px) rotate(180deg); }
  75% { transform: translateY(-40px) translateX(5px) rotate(270deg); }
}

@keyframes pulse-ring {
  0% { transform: scale(0.8); opacity: 0.4; }
  50% { transform: scale(1.3); opacity: 0.1; }
  100% { transform: scale(0.8); opacity: 0.4; }
}

@keyframes logo-entrance {
  0% { 
    transform: scale(0.3) rotate(-15deg); 
    opacity: 0; 
    filter: blur(20px);
  }
  40% { 
    transform: scale(1.05) rotate(2deg); 
    opacity: 0.8; 
    filter: blur(0);
  }
  60% { 
    transform: scale(0.98) rotate(-1deg); 
  }
  100% { 
    transform: scale(1) rotate(0deg); 
    opacity: 1; 
  }
}

@keyframes text-reveal {
  0% { 
    transform: translateY(30px); 
    opacity: 0; 
  }
  100% { 
    transform: translateY(0); 
    opacity: 1; 
  }
}

@keyframes bounce-gentle {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

@keyframes pulse-gentle {
  0%, 100% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.15); opacity: 0.7; }
}

@keyframes fade-in-up {
  0% { transform: translateX(-50%) translateY(20px); opacity: 0; }
  100% { transform: translateX(-50%) translateY(0); opacity: 1; }
}

.animate-float { animation: float infinite ease-in-out; }
.animate-pulse-ring { animation: pulse-ring infinite ease-in-out; }
.animate-logo-entrance { animation: logo-entrance 1.2s cubic-bezier(0.34, 1.56, 0.64, 1) forwards; opacity: 0; }
.animate-text-reveal { animation: text-reveal 0.7s cubic-bezier(0.16, 1, 0.3, 1) forwards; opacity: 0; }
.animate-bounce-gentle { animation: bounce-gentle 2s infinite ease-in-out; }
.animate-pulse-gentle { animation: pulse-gentle 2s infinite ease-in-out; }
.animate-fade-in-up { animation: fade-in-up 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards; opacity: 0; }

/* Reducir movimiento para accesibilidad */
@media (prefers-reduced-motion: reduce) {
  .animate-float,
  .animate-pulse-ring,
  .animate-logo-entrance,
  .animate-text-reveal,
  .animate-bounce-gentle,
  .animate-pulse-gentle,
  .animate-fade-in-up {
    animation: none !important;
    opacity: 1 !important;
    transform: none !important;
  }
}
</style>

---
layout: default
transition: slide-left
---

# Inicio de la Presentación Principal

<!-- La presentación continua desde slides.md línea 19 en adelante -->