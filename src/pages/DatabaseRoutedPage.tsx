import { useState, useEffect, useLayoutEffect } from 'react';
import { useLocation, Navigate } from 'react-router-dom';
import { resolveStateByUrl } from '../utils/stateRouting';
import StatePageTemplate from './StatePageTemplate';
import NotFoundPage from './NotFoundPage';

export default function DatabaseRoutedPage() {
  const location = useLocation();
  const [resolvedSlug, setResolvedSlug] = useState<string | null>(null);
  const [canonicalUrl, setCanonicalUrl] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);
  const [needsRedirect, setNeedsRedirect] = useState(false);

  // CRITICAL: Set noindex during loading to prevent SEO Boost from indexing generic loading state
  useLayoutEffect(() => {
    if (loading) {
      let robotsMeta = document.querySelector('meta[name="robots"]') as HTMLMetaElement;
      if (!robotsMeta) {
        robotsMeta = document.createElement('meta');
        robotsMeta.name = 'robots';
        document.head.appendChild(robotsMeta);
      }
      robotsMeta.content = 'noindex,nofollow';
      console.log('[DatabaseRoutedPage] Set robots to noindex during async resolution');
    }
  }, [loading]);

  useEffect(() => {
    async function resolveRoute() {
      const pathname = location.pathname;
      console.log('[DatabaseRoutedPage] Attempting DB resolution for:', pathname);

      const stateInfo = await resolveStateByUrl(pathname);

      if (stateInfo) {
        console.log('[DatabaseRoutedPage] ✅ Route resolved to state:', stateInfo.stateSlug);
        console.log('[DatabaseRoutedPage] Canonical URL:', stateInfo.canonicalUrl);

        // SEO CANONICAL CHECK: If pathname doesn't match canonical, redirect
        if (pathname !== stateInfo.canonicalUrl) {
          console.log('[DatabaseRoutedPage] ⚠️ Non-canonical URL detected!');
          console.log('[DatabaseRoutedPage] Redirecting:', pathname, '→', stateInfo.canonicalUrl);
          setCanonicalUrl(stateInfo.canonicalUrl);
          setNeedsRedirect(true);
        } else {
          console.log('[DatabaseRoutedPage] ✅ Canonical URL match');
          setResolvedSlug(stateInfo.stateSlug);
          setNeedsRedirect(false);
        }
        setNotFound(false);
      } else {
        console.log('[DatabaseRoutedPage] ❌ No DB match, showing 404');
        setNotFound(true);
      }

      setLoading(false);
    }

    resolveRoute();
  }, [location.pathname]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-white">
        <div className="text-gray-600">Resolving route...</div>
      </div>
    );
  }

  // SEO CANONICAL REDIRECT: Redirect to canonical URL (with trailing slash)
  if (needsRedirect && canonicalUrl) {
    console.log('[DatabaseRoutedPage] 🔄 Performing redirect to canonical URL');
    return <Navigate to={canonicalUrl} replace />;
  }

  if (notFound) {
    return <NotFoundPage />;
  }

  return (
    <>
      {import.meta.env.DEV && resolvedSlug && (
        <div className="fixed top-0 left-0 z-50 bg-green-500 text-white px-4 py-2 text-sm font-mono">
          🟢 DB-ROUTED: {resolvedSlug}
        </div>
      )}
      <StatePageTemplate stateSlugOverride={resolvedSlug!} />
    </>
  );
}
