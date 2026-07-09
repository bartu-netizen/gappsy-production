import { useLayoutEffect } from 'react';

interface YourAgencySEOProps {
  title: string;
  description: string;
  canonical: string;
  noindex?: boolean;
}

export default function YourAgencySEO({
  title,
  description,
  canonical,
  noindex = false,
}: YourAgencySEOProps) {
  useLayoutEffect(() => {
    document.title = title;

    const setMeta = (name: string, content: string, attr = 'name') => {
      let el = document.querySelector(`meta[${attr}="${name}"]`);
      if (!el) {
        el = document.createElement('meta');
        el.setAttribute(attr, name);
        document.head.appendChild(el);
      }
      el.setAttribute('content', content);
    };

    const setLink = (rel: string, href: string) => {
      let el = document.querySelector(`link[rel="${rel}"]`);
      if (!el) {
        el = document.createElement('link');
        el.setAttribute('rel', rel);
        document.head.appendChild(el);
      }
      el.setAttribute('href', href);
    };

    setMeta('description', description);
    setLink('canonical', canonical);

    let robotsEl = document.querySelector('meta[name="robots"]');
    if (!robotsEl) {
      robotsEl = document.createElement('meta');
      robotsEl.setAttribute('name', 'robots');
      document.head.appendChild(robotsEl);
    }
    robotsEl.setAttribute('content', noindex ? 'noindex,nofollow' : 'index,follow');

    return () => {
    };
  }, [title, description, canonical, noindex]);

  return null;
}
