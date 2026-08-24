<script setup>
import confetti from 'canvas-confetti'

function triggerConfetti() {
  confetti({
    particleCount: 100,
    spread: 80,
    origin: { y: 0.65 },
    colors: ['#1d4ed8', '#eab308', '#38bdf8', '#fbbf24', '#ffffff']
  })
}
</script>

<template>
  <button 
    @click="triggerConfetti" 
    class="mt-4 px-6 py-2.5 rounded-full bg-amber-400 hover:bg-amber-500 active:scale-95 text-amber-950 font-bold text-sm shadow-md hover:shadow-lg transition-all duration-200 cursor-pointer inline-flex items-center gap-2"
  >
    <span>🎉</span>
    <span>¡Compromiso Familiar y Pastoral!</span>
  </button>
</template>
