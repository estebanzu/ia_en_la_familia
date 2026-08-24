import { defineAppSetup } from '@slidev/types'

export default defineAppSetup(() => {
  if (typeof window !== 'undefined') {
    try {
      localStorage.setItem('slidev-show-editor', 'false')
      localStorage.setItem('slidev-show-overview', 'false')
    } catch (_) {}
  }
})
