import { useCallback, useEffect, useState } from 'react';
import type { AdminScope } from '../components/wpadmin/adminTools';
import { ADMIN_VIEWS } from '../components/wpadmin/adminTools';

// Shares the currently-selected admin nav view (All/Agencies/Software/
// Shared) between the sidebar (WpAdminLayout) and any page that wants to
// filter its OWN content by the same scope — e.g. the Dashboard's "quick
// access" tool grid, which lives outside the sidebar but should still
// respect the switcher for a consistent experience.
//
// Deliberately NOT a React Context: WpAdminDashboardPage (and every other
// page) renders <WpAdminLayout>{content}</WpAdminLayout> — the PAGE is the
// parent that invokes the layout, not a descendant of it, so a Provider
// created inside WpAdminLayout can never reach the page's own hooks (the
// page's render — including any useContext call — happens before
// WpAdminLayout ever mounts). Instead, every call site independently reads
// the same localStorage key and stays in sync via a same-tab custom event
// (the native `storage` event only fires for OTHER tabs/windows).
const VIEW_STORAGE_KEY = 'wpAdminNavView';
const VIEW_CHANGE_EVENT = 'wpAdminNavViewChange';

function readStoredView(): AdminScope | 'all' {
  if (typeof window === 'undefined') return 'all';
  const stored = window.localStorage.getItem(VIEW_STORAGE_KEY);
  const valid = ADMIN_VIEWS.some((v) => v.value === stored);
  return valid ? (stored as AdminScope | 'all') : 'all';
}

export function setAdminView(next: AdminScope | 'all'): void {
  window.localStorage.setItem(VIEW_STORAGE_KEY, next);
  window.dispatchEvent(new CustomEvent(VIEW_CHANGE_EVENT, { detail: next }));
}

export function useAdminView(): AdminScope | 'all' {
  const [view, setViewState] = useState<AdminScope | 'all'>(readStoredView);

  useEffect(() => {
    const handler = (e: Event) => {
      const detail = (e as CustomEvent<AdminScope | 'all'>).detail;
      setViewState(detail ?? readStoredView());
    };
    window.addEventListener(VIEW_CHANGE_EVENT, handler);
    window.addEventListener('storage', handler);
    return () => {
      window.removeEventListener(VIEW_CHANGE_EVENT, handler);
      window.removeEventListener('storage', handler);
    };
  }, []);

  return view;
}

// Convenience combined hook for the one call site that also needs to
// change the view (the switcher itself, in WpAdminLayout).
export function useAdminViewState(): [AdminScope | 'all', (next: AdminScope | 'all') => void] {
  const view = useAdminView();
  const setView = useCallback((next: AdminScope | 'all') => setAdminView(next), []);
  return [view, setView];
}
