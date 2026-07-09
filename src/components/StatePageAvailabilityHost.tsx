import { Suspense, lazy, useEffect, useCallback, useState, StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { MemoryRouter, Routes, Route, useLocation, useNavigate } from 'react-router-dom';
import { OwnerListingEditProvider } from '../contexts/OwnerListingEditContext';

const AvailabilityStartPage = lazy(() => import('../pages/AvailabilityStartPage'));
const AvailabilityClientPage = lazy(() => import('../pages/AvailabilityClientPage'));
const AvailabilityVerifyPage = lazy(() => import('../pages/AvailabilityVerifyPage'));
const AvailabilityRequestsPage = lazy(() => import('../pages/AvailabilityRequestsPage'));
const AvailabilityOwnerEditListingPage = lazy(() => import('../pages/AvailabilityOwnerEditListingPage'));
const AvailabilityOwnerDemoPage = lazy(() => import('../pages/AvailabilityOwnerDemoPage'));
const AvailabilityOwnerPreviewPage = lazy(() => import('../pages/AvailabilityOwnerPreviewPage'));
const AvailabilityOwnerPreview1Page = lazy(() => import('../pages/AvailabilityOwnerPreview1Page'));
const AvailabilityOwnerSimulatePage = lazy(() => import('../pages/AvailabilityOwnerSimulatePage'));
const AvailabilityOwnerDashboardPage = lazy(() => import('../pages/AvailabilityOwnerDashboardPage'));

export interface StatePageAvailabilityHostProps {
  agencyId: string;
  stateSlug: string;
  onClose: () => void;
  directClient?: boolean;
  source?: 'other' | 'top25';
}

const EXTERNAL_PREFIXES = [
  '/activation/upgrade',
  '/order/complete',
  '/top-25',
  '/spotlight/confirm',
];

function isExternalRoute(pathname: string): boolean {
  return EXTERNAL_PREFIXES.some(p => pathname.startsWith(p));
}

function ExternalNavigationWatcher() {
  const location = useLocation();
  const [redirecting, setRedirecting] = useState(false);

  useEffect(() => {
    const { pathname, search } = location;
    if (isExternalRoute(pathname)) {
      setRedirecting(true);
      window.location.assign(pathname + search);
    }
  }, [location]);

  if (redirecting) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#0A1735]" />
      </div>
    );
  }

  return null;
}

function HostCatchAll({
  onClose,
  agencyId,
  stateSlug,
  source = 'other',
}: {
  onClose: () => void;
  agencyId: string;
  stateSlug: string;
  source?: 'other' | 'top25';
}) {
  const location = useLocation();
  const navigate = useNavigate();

  if (isExternalRoute(location.pathname)) {
    return null;
  }

  return (
    <div className="min-h-screen flex items-center justify-center px-4 py-8 bg-gradient-to-br from-slate-50 to-slate-100">
      <div className="w-full max-w-sm rounded-2xl bg-white shadow-lg p-8 text-center">
        <p className="text-sm text-slate-500 mb-6">This step couldn't be loaded. Please try again.</p>
        <div className="flex flex-col gap-3">
          <button
            onClick={() =>
              navigate(
                `/availability/start?agencyId=${agencyId}&source=${source}&state=${stateSlug}`,
                { replace: true }
              )
            }
            className="w-full bg-[#0A1735] text-white py-3 rounded-lg font-semibold hover:bg-[#0d1f42] transition-colors"
          >
            Restart
          </button>
          <button
            onClick={onClose}
            className="text-sm text-slate-500 hover:text-slate-700 transition-colors"
          >
            Return to state page
          </button>
        </div>
      </div>
    </div>
  );
}

function StatePageAvailabilityHostApp({
  agencyId,
  stateSlug,
  onClose,
  directClient = false,
  source = 'other',
}: StatePageAvailabilityHostProps) {
  const initialPath = directClient ? '/availability/client' : '/availability/start';
  const initialUrl = `${initialPath}?agencyId=${agencyId}&source=${source}&state=${stateSlug}`;

  useEffect(() => {
    const prev = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    return () => {
      document.body.style.overflow = prev;
    };
  }, []);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose();
    };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, [onClose]);

  return (
    <div
      className="fixed inset-0 z-[9999] overflow-y-auto bg-gradient-to-br from-slate-50 to-slate-100"
      role="dialog"
      aria-modal="true"
    >
      <MemoryRouter initialEntries={[initialUrl]}>
        <ExternalNavigationWatcher />
        <Suspense
          fallback={
            <div className="min-h-screen flex items-center justify-center">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-[#0A1735]" />
            </div>
          }
        >
          <Routes>
            <Route path="/availability/start" element={<AvailabilityStartPage />} />
            <Route path="/availability/client" element={<AvailabilityClientPage />} />
            <Route path="/availability/verify" element={<AvailabilityVerifyPage />} />
            <Route path="/availability/requests" element={<AvailabilityRequestsPage />} />
            <Route path="/availability/owner-demo" element={<AvailabilityOwnerDemoPage />} />
            <Route path="/availability/owner-preview" element={<AvailabilityOwnerPreviewPage />} />
            <Route path="/availability/owner-preview-1" element={<AvailabilityOwnerPreview1Page />} />
            <Route path="/availability/owner-simulate" element={<AvailabilityOwnerSimulatePage />} />
            <Route path="/availability/owner-dashboard" element={<AvailabilityOwnerDashboardPage />} />
            <Route path="/availability/owner/edit-listing" element={<AvailabilityOwnerEditListingPage />} />
            <Route
              path="*"
              element={
                <HostCatchAll onClose={onClose} agencyId={agencyId} stateSlug={stateSlug} source={source} />
              }
            />
          </Routes>
        </Suspense>
      </MemoryRouter>
    </div>
  );
}

export default function StatePageAvailabilityHost({
  agencyId,
  stateSlug,
  onClose,
  directClient = false,
  source = 'other',
}: StatePageAvailabilityHostProps) {
  const stableClose = useCallback(() => {
    onClose();
  }, [onClose]);

  useEffect(() => {
    const container = document.createElement('div');
    container.id = 'statepage-availability-host-root';
    document.body.appendChild(container);

    const root = createRoot(container);
    root.render(
      <StrictMode>
        <OwnerListingEditProvider>
          <StatePageAvailabilityHostApp
            agencyId={agencyId}
            stateSlug={stateSlug}
            onClose={stableClose}
            directClient={directClient}
            source={source}
          />
        </OwnerListingEditProvider>
      </StrictMode>
    );

    return () => {
      root.unmount();
      container.remove();
      document.body.style.overflow = '';
    };
  }, [agencyId, stateSlug, stableClose, directClient, source]);

  return null;
}
