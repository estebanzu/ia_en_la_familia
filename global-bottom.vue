<template>
  <footer
    class="absolute bottom-0 left-0 right-0 z-50 pointer-events-none pb-3 px-8"
  >
    <div
      class="relative flex items-center justify-between opacity-80 hover:opacity-100 transition-opacity duration-300"
    >
      <!-- Centered Logo and Text -->
      <div class="flex items-center gap-2 pl-2">
        <img
          src="/logo_rm_bg.png"
          alt="Logo Parroquia Inmaculada Concepción"
          class="h-5 object-contain"
        />
        <span
          class="text-xs italic font-semibold text-slate-500 tracking-wide select-none"
        >
          Parroquia Inmaculada Concepción — Mes de la Familia Agosto 2026
        </span>
      </div>

      <!-- Page Counter on the right -->
      <div
        v-if="$slidev.nav.currentPage > 1"
        class="text-xs font-bold text-slate-700 select-none bg-slate-100/90 px-2.5 py-0.5 rounded-full border border-slate-300 shadow-2xs"
        aria-label="Número de diapositiva"
      >
        {{ $slidev.nav.currentPage }} / {{ $slidev.nav.total }}
      </div>
    </div>
  </footer>
</template>
