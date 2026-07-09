import { createContext, useContext, useState, useCallback, useRef, useLayoutEffect } from 'react';

interface OwnerBannerContextValue {
  bannerHeight: number;
  registerBanner: (el: HTMLElement | null) => void;
  remeasure: () => void;
}

const OwnerBannerContext = createContext<OwnerBannerContextValue>({
  bannerHeight: 180,
  registerBanner: () => {},
  remeasure: () => {},
});

export function useOwnerBanner() {
  return useContext(OwnerBannerContext);
}

export function OwnerBannerProvider({ children }: { children: React.ReactNode }) {
  const [bannerHeight, setBannerHeight] = useState(180);
  const observerRef = useRef<ResizeObserver | null>(null);
  const elRef = useRef<HTMLElement | null>(null);

  const measureEl = useCallback((el: HTMLElement) => {
    const h = el.getBoundingClientRect().height;
    if (h > 0) {
      setBannerHeight(h);
      document.documentElement.style.setProperty('--owner-banner-h', `${h}px`);
    }
  }, []);

  const remeasure = useCallback(() => {
    if (elRef.current) measureEl(elRef.current);
  }, [measureEl]);

  const registerBanner = useCallback((el: HTMLElement | null) => {
    if (el === elRef.current) {
      if (el) measureEl(el);
      return;
    }

    if (observerRef.current) {
      observerRef.current.disconnect();
      observerRef.current = null;
    }

    elRef.current = el;

    if (!el) return;

    measureEl(el);

    const ro = new ResizeObserver(() => measureEl(el));
    ro.observe(el);
    observerRef.current = ro;
  }, [measureEl]);

  useLayoutEffect(() => {
    const onResize = () => {
      if (elRef.current) measureEl(elRef.current);
    };
    window.addEventListener('resize', onResize, { passive: true });
    window.addEventListener('orientationchange', onResize, { passive: true });
    return () => {
      window.removeEventListener('resize', onResize);
      window.removeEventListener('orientationchange', onResize);
      if (observerRef.current) observerRef.current.disconnect();
      document.documentElement.style.removeProperty('--owner-banner-h');
    };
  }, [measureEl]);

  return (
    <OwnerBannerContext.Provider value={{ bannerHeight, registerBanner, remeasure }}>
      {children}
    </OwnerBannerContext.Provider>
  );
}
