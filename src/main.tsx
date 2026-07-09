import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';
import './index.css';
import './styles/owner-preview.css';
import { OwnerListingEditProvider } from './contexts/OwnerListingEditContext';
import { Top25CheckoutProvider } from './contexts/Top25CheckoutContext';
import { initPerfObserver } from './utils/perfObserver';
import { runReplayCacheMigration } from './utils/canonicalReplayData';

if (import.meta.env.DEV) {
  initPerfObserver();
}

runReplayCacheMigration();

const rootElement = document.getElementById('root');
if (!rootElement) throw new Error('Root element #root not found');

createRoot(rootElement).render(
  <StrictMode>
    <OwnerListingEditProvider>
      <Top25CheckoutProvider>
        <App />
      </Top25CheckoutProvider>
    </OwnerListingEditProvider>
  </StrictMode>
);
