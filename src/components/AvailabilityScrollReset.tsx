import { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

export default function AvailabilityScrollReset() {
  const location = useLocation();

  useEffect(() => {
    if (location.pathname.startsWith('/availability')) {
      window.scrollTo(0, 0);

      if (document.activeElement instanceof HTMLElement) {
        document.activeElement.blur();
      }

      const prevValues: Array<{ el: HTMLMetaElement; content: string }> = [];

      document.querySelectorAll('meta[name="robots"]:not([data-availability])').forEach(el => {
        const meta = el as HTMLMetaElement;
        prevValues.push({ el: meta, content: meta.getAttribute('content') ?? '' });
        meta.setAttribute('content', 'noindex,nofollow');
      });

      let metaRobots = document.querySelector('meta[name="robots"][data-availability]') as HTMLMetaElement | null;
      if (!metaRobots) {
        metaRobots = document.createElement('meta');
        metaRobots.setAttribute('name', 'robots');
        metaRobots.setAttribute('data-availability', '1');
        document.head.appendChild(metaRobots);
      }
      metaRobots.setAttribute('content', 'noindex,nofollow');

      return () => {
        prevValues.forEach(({ el, content }) => el.setAttribute('content', content));

        const el = document.querySelector('meta[name="robots"][data-availability]');
        if (el) el.remove();
      };
    }
  }, [location.pathname, location.search]);

  return null;
}
