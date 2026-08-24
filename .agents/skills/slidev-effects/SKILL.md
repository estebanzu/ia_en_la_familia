---
name: slidev-effects
description: Master advanced visual effects, animations, micro-interactions, and transitions in Slidev presentations. Use when adding cool animations (v-motion, v-mark, rough-notation, floating particles, glassmorphism, confetti, hover physics, and staggered reveals) to Slidev decks.
---

# Slidev Advanced Visual Effects & Animations Skill

This skill provides production-tested recipes for enhancing Slidev presentation decks with high-impact animations, interactive transitions, and modern UI effects without hurting performance or legibility.

---

## 1. Core Slidev Animation Directives

### A. Spring & Physics Animations (`v-motion`)

Slidev includes built-in support for `@vueuse/motion`:

```html
<!-- Smooth spring entry for cards -->
<div
  v-motion
  :initial="{ y: 40, opacity: 0, scale: 0.95 }"
  :enter="{ y: 0, opacity: 1, scale: 1, transition: { type: 'spring', stiffness: 200, damping: 20 } }"
  class="p-4 rounded-2xl bg-white border-2 border-slate-200 shadow-md"
>
  Tarjeta con entrada física suave
</div>
```

### B. Animated Hand-Drawn Highlights (`v-mark` / RoughNotation)

Slidev includes RoughNotation directives out of the box:

```html
<!-- Underline highlight on click -->
<span v-mark.underline.blue="{ at: 1 }">texto subrayado animado</span>

<!-- Circle highlight -->
<span v-mark.circle.amber="{ at: 2 }">concepto clave</span>

<!-- Box highlight -->
<span v-mark.box.rose="{ at: 3 }">alerta importante</span>

<!-- Highlight background marker -->
<span v-mark.highlight.yellow="{ at: 1 }">resaltado fluorescente</span>
```

### C. Staggered Click-by-Click Reveals (`v-clicks`)

```html
<v-clicks>
  <li>Primer punto aparece suavemente</li>
  <li>Segundo punto aparece con el siguiente clic</li>
  <li>Tercer punto aparece al final</li>
</v-clicks>
```

---

## 2. Modern UI & CSS Micro-Interactions

### A. Card Hover Physics & Lift

In `style.css`:

```css
.hover-lift {
  transition:
    transform 0.25s cubic-bezier(0.16, 1, 0.3, 1),
    box-shadow 0.25s ease,
    border-color 0.25s ease;
}
.hover-lift:hover {
  transform: translateY(-4px) scale(1.01);
  box-shadow:
    0 14px 30px -8px rgba(0, 0, 0, 0.12),
    0 4px 6px -2px rgba(0, 0, 0, 0.05);
}
```

### B. Subtle Pulse & Attention Badges

```html
<div class="relative flex h-3 w-3">
  <span
    class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"
  ></span>
  <span class="relative inline-flex rounded-full h-3 w-3 bg-blue-600"></span>
</div>
```

### C. Glassmorphism Accent Cards

```html
<div
  class="backdrop-blur-md bg-white/80 border border-white/40 shadow-lg rounded-2xl p-4"
>
  Contenido translúcido con desenfoque de fondo
</div>
```

---

## 3. Interactive Components in Slidev

### A. Live Counter Component (`components/Counter.vue`)

```vue
<script setup>
import { ref } from "vue";
const count = ref(0);
</script>

<template>
  <button
    @click="count++"
    class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl shadow-md transition-all active:scale-95"
  >
    Clics: {{ count }}
  </button>
</template>
```

### B. Confetti Celebration Trigger

```html
<script setup>
  import confetti from "canvas-confetti";
  function celebrate() {
    confetti({ particleCount: 80, spread: 70, origin: { y: 0.6 } });
  }
</script>

<button
  @click="celebrate"
  class="px-5 py-2.5 rounded-full bg-amber-400 text-amber-950 font-bold shadow-md hover:scale-105 transition-all"
>
  🎉 ¡Celebrar Compromiso!
</button>
```

---

## 4. Best Practices Checklist

1. **Never overload a single slide:** Max 2-3 motion elements per slide to avoid distracting the audience.
2. **Prioritize Contrast:** Ensure text remains WCAG AAA legible over animated gradients.
3. **Presenter Mode Compatibility:** Always test on `http://localhost:3030/presenter` to ensure animations don't interfere with speaker timers.
