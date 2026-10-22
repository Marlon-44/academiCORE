import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './styles/index.css'
import { AppRouter } from './app/AppRouter'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AppRouter>

    </AppRouter>
  </StrictMode>,
)
