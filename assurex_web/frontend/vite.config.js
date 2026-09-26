import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

export default defineConfig(({ command }) => ({
  root: '.',
  base: command === 'build' ? '/AssureX_Team_Handoff/' : '/',
  publicDir: 'public',
  build: {
    outDir: '../dist',
  },
  plugins: [react()],
}))
