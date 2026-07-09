import { useLayoutEffect } from 'react';

export function useNoindex() {
  useLayoutEffect(() => {
    let el = document.querySelector('meta[name="robots"]');
    if (!el) {
      el = document.createElement('meta');
      el.setAttribute('name', 'robots');
      document.head.appendChild(el);
    }
    const prev = el.getAttribute('content');
    el.setAttribute('content', 'noindex,nofollow');
    return () => {
      if (prev !== null) el!.setAttribute('content', prev);
    };
  }, []);
}

export default function NoindexMeta() {
  useNoindex();
  return null;
}
