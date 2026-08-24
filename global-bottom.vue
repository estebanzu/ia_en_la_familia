<template>
  <footer
    class="absolute bottom-0 left-0 right-0 z-50 pointer-events-none pb-2.5 px-8"
  >
    <div
      class="relative flex items-center justify-center opacity-65 hover:opacity-100 transition-opacity duration-300"
    >
      <!-- Centered Logo and Italic Text -->
      <div class="flex items-center gap-2">
        <img
          src="/logo_rm_bg.png"
          alt="Logo Parroquia"
          class="h-4.5 object-contain opacity-80"
        />
        <span
          class="text-[10.5px] italic font-medium text-slate-400 tracking-wide select-none"
        >
          Parroquia Inmaculada Concepción — Mes de la Familia Agosto 2026
        </span>
      </div>

      <!-- Page Counter on the right -->
      <div
        v-if="$slidev.nav.currentPage > 1"
        class="absolute right-0 text-[10px] italic text-slate-300 font-normal select-none"
      >
        {{ $slidev.nav.currentPage }} / {{ $slidev.nav.total }}
      </div>
    </div>
  </footer>
</template>
