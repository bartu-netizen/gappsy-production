import { useEffect, useLayoutEffect, useRef } from 'react';
import { useLocation } from 'react-router-dom';

const isIOS =
  /iPad|iPhone|iPod/.test(navigator.userAgent) ||
  (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);

function isMobile() {
  return window.matchMedia('(max-width: 768px)').matches;
}

export default function ScrollManager() {
  const location = useLocation();
  const t1Ref = useRef<ReturnType<typeof setTimeout> | null>(null);
  const t2Ref = useRef<ReturnType<typeof setTimeout> | null>(null);
  const rafRef = useRef<number | null>(null);

  useLayoutEffect(() => {
    history.scrollRestoration = 'manual';
  }, []);

  useLayoutEffect(() => {
    if (t1Ref.current !== null) clearTimeout(t1Ref.current);
    if (t2Ref.current !== null) clearTimeout(t2Ref.current);
    if (rafRef.current !== null) cancelAnimationFrame(rafRef.current);

    if (location.hash && location.hash.length > 1) return;

    const params = new URLSearchParams(location.search);
    if (params.get('preserveScroll') === '1') return;

    function forceTop() {
      window.scrollTo(0, 0);
      if (document.documentElement) document.documentElement.scrollTop = 0;
      if (document.body) document.body.scrollTop = 0;
    }

    forceTop();

    rafRef.current = requestAnimationFrame(() => {
      forceTop();
      rafRef.current = null;
    });

    if (isIOS || isMobile()) {
      t1Ref.current = setTimeout(() => {
        forceTop();
        t1Ref.current = null;
      }, 50);

      t2Ref.current = setTimeout(() => {
        forceTop();
        t2Ref.current = null;
      }, 250);
    }
  }, [location.pathname, location.search, location.hash]);

  useEffect(() => {
    return () => {
      if (t1Ref.current !== null) clearTimeout(t1Ref.current);
      if (t2Ref.current !== null) clearTimeout(t2Ref.current);
      if (rafRef.current !== null) cancelAnimationFrame(rafRef.current);
    };
  }, []);

  return null;
}
