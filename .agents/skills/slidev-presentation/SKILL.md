---
name: slidev-presentation
description: Create, customize, build, and debug interactive Slidev presentation decks with custom palettes, embedded media, clean UI suppression, and Playwright visual verification.
---

# Slidev Presentation Builder & Presenter Skill

Expert workflow for generating, configuring, styling, and visually testing interactive Slidev presentation decks for audiences, workshops, and communities.

## Core Architecture & File Hierarchy

Every Slidev project must maintain this minimal, robust file structure:

```
├── slides.md              # Markdown slides with frontmatter configuration
├── package.json           # Slidev CLI and theme dependencies
├── Makefile               # Process management (start, stop, status, build)
├── style.css              # Custom styling, palette overrides, UI cleanup
├── global-bottom.vue      # Persistent branding (logo, footer)
├── setup/
│   └── main.ts            # Runtime setup & state resets (disable side editor)
├── public/                # Static assets (images, videos, logo)
└── tests/                 # Playwright visual verification scripts
```

---

## 1. Project Initialization (`package.json`)

```json
{
  "name": "slidev-deck",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "slidev --open",
    "build": "slidev build",
    "export": "slidev export"
  },
  "dependencies": {
    "@slidev/cli": "^51.4.0",
    "@slidev/theme-default": "^0.25.0",
    "@iconify-json/lucide": "^1.2.0"
  },
  "devDependencies": {
    "playwright": "^1.40.0"
  }
}
```

---

## 2. Clean UI & Sidebar Suppression (`style.css` & `setup/main.ts`)

Slidev dev mode includes side editors and search dialogs that can distract from the slides. Use these overrides:

### `style.css`
```css
:root {
  --slidev-theme-primary: #1d4ed8;
  --slidev-theme-accent: #eab308;
  --slidev-theme-text: #0f172a;
  --slidev-theme-bg: #ffffff;
}

html, body, #app {
  background-color: var(--slidev-theme-bg) !important;
  color: var(--slidev-theme-text) !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow: hidden !important;
  width: 100vw !important;
  height: 100vh !important;
}

/* Force presentation to single-column full-width view */
#page-root {
  display: flex !important;
  width: 100vw !important;
  height: 100vh !important;
  grid-template-columns: 1fr !important;
}

#slide-container {
  width: 100vw !important;
  height: 100vh !important;
  max-width: 100vw !important;
  flex: 1 1 100% !important;
}

/* Suppress SideEditor and Autocomplete Goto dialogs */
#slidev-goto-dialog,
.autocomplete-list,
#page-root > div:not(#slide-container),
.slidev-side-editor,
.z-modal,
.z-dragging {
  display: none !important;
  visibility: hidden !important;
  width: 0 !important;
  height: 0 !important;
  pointer-events: none !important;
  position: absolute !important;
  left: -9999px !important;
  opacity: 0 !important;
}
```

### `setup/main.ts`
```ts
import { defineAppSetup } from '@slidev/types'

export default defineAppSetup(() => {
  if (typeof window !== 'undefined') {
    try {
      localStorage.setItem('slidev-show-editor', 'false')
      localStorage.setItem('slidev-show-overview', 'false')
    } catch (_) {}
  }
})
```

---

## 3. Persistent Branding (`global-bottom.vue`)

Place branding (e.g., logo) at the bottom-left of every slide:

```vue
<template>
  <footer class="absolute bottom-3 left-6 z-50 flex items-center gap-2 pointer-events-none">
    <img src="/logo.jpg" alt="Logo" class="h-9 object-contain rounded shadow-sm bg-white p-0.5 border border-slate-100" />
  </footer>
</template>
```

---

## 4. Media Embedding (Videos & Assets)

1. Store all media in `./public/` (e.g. `public/video.mp4`).
2. Reference directly in `slides.md` using HTML5 video tags:

```html
<video 
  controls 
  playsinline 
  class="w-full max-h-[330px] rounded-xl shadow-md border-2 border-slate-300 bg-black mx-auto"
  src="/video.mp4"
>
  Browser does not support video.
</video>
```

---

## 5. Process Lifecycle Management (`Makefile`)

```makefile
PID_FILE := .slidev.pid
PORT := 3030

.PHONY: start stop restart status build

start:
	@if [ -f $(PID_FILE) ] && kill -0 $$(cat $(PID_FILE)) 2>/dev/null; then \
		echo "Slidev is already running"; \
	else \
		nohup npx slidev --port $(PORT) --open > slidev.log 2>&1 & echo $$! > $(PID_FILE); \
		sleep 2; \
		echo "Slidev started at http://localhost:$(PORT)"; \
	fi

stop:
	@if [ -f $(PID_FILE) ]; then \
		kill $$(cat $(PID_FILE)) 2>/dev/null || true; \
		rm -f $(PID_FILE); \
	fi; \
	pkill -f "slidev" 2>/dev/null || true; \
	echo "Slidev stopped."

restart: stop start
status:
	@if [ -f $(PID_FILE) ] && kill -0 $$(cat $(PID_FILE)) 2>/dev/null; then \
		echo "Slidev is RUNNING (PID: $$(cat $(PID_FILE)))"; \
	else \
		echo "Slidev is STOPPED"; \
	fi
build:
	npm run build
```

---

## 6. Visual Verification with Playwright

To verify clean layout and rendering without browser distortions:

```javascript
import { chromium } from "playwright";

const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width: 1440, height: 900 } });
await page.goto("http://localhost:3030/1", { waitUntil: "networkidle" });
await page.screenshot({ path: "screenshot-slide1.png" });
await browser.close();
```
