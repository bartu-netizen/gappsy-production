import { useLayoutEffect } from 'react';
import { buildCanonicalUrl } from '../utils/canonicalUrl';

export interface EntityBreadcrumbItem {
  name: string;
  path: string;
}

interface EntitySEOTagsProps {
  title: string;
  description: string;
  path: string;
  ogImage?: string;
  breadcrumbs?: EntityBreadcrumbItem[];
  jsonLd?: Record<string, unknown>[];
  noindex?: boolean;
}

/**
 * Generic SEO tag setter for entity-platform pages (Tools, and future entity
 * modules — Agencies v2, MCP Servers, APIs, etc.). Unlike `SEOTags.tsx`, this is
 * not coupled to the state-directory schema (agencies/FAQ/rank fields).
 */
export default function EntitySEOTags({
  title,
  description,
  path,
  ogImage,
  breadcrumbs = [],
  jsonLd = [],
  noindex = false,
}: EntitySEOTagsProps) {
  useLayoutEffect(() => {
    const canonical = buildCanonicalUrl(path);

    document.title = title;

    const setMeta = (attribute: 'name' | 'property', key: string, content: string) => {
      let el = document.querySelector(`meta[${attribute}="${key}"]`) as HTMLMetaElement | null;
      if (!el) {
        el = document.createElement('meta');
        el.setAttribute(attribute, key);
        document.head.appendChild(el);
      }
      el.setAttribute('content', content);
    };

    setMeta('name', 'description', description);
    setMeta('name', 'robots', noindex ? 'noindex,nofollow' : 'index,follow');
    setMeta('property', 'og:site_name', 'Gappsy');
    setMeta('property', 'og:type', 'website');
    setMeta('property', 'og:title', title);
    setMeta('property', 'og:description', description);
    setMeta('property', 'og:url', canonical);
    setMeta('name', 'twitter:card', 'summary_large_image');
    setMeta('name', 'twitter:site', '@Gappsy');
    setMeta('name', 'twitter:title', title);
    setMeta('name', 'twitter:description', description);
    if (ogImage) {
      setMeta('property', 'og:image', ogImage);
      setMeta('name', 'twitter:image', ogImage);
    }

    let canonicalLink = document.querySelector('link[rel="canonical"]') as HTMLLinkElement | null;
    if (!canonicalLink) {
      canonicalLink = document.createElement('link');
      canonicalLink.rel = 'canonical';
      document.head.appendChild(canonicalLink);
    }
    canonicalLink.href = canonical;

    const graphItems: Record<string, unknown>[] = [];

    if (breadcrumbs.length > 0) {
      graphItems.push({
        '@type': 'BreadcrumbList',
        '@id': `${canonical}#breadcrumb`,
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'Home', item: 'https://www.gappsy.com/' },
          ...breadcrumbs.map((item, index) => ({
            '@type': 'ListItem',
            position: index + 2,
            name: item.name,
            item: buildCanonicalUrl(item.path),
          })),
        ],
      });
    }

    graphItems.push(...jsonLd);

    const existingScripts = Array.from(document.querySelectorAll('script[data-entity-jsonld]'));
    existingScripts.forEach((script) => script.remove());

    if (graphItems.length > 0) {
      const script = document.createElement('script');
      script.type = 'application/ld+json';
      script.setAttribute('data-entity-jsonld', 'true');
      script.textContent = JSON.stringify({ '@context': 'https://schema.org', '@graph': graphItems });
      document.head.appendChild(script);
    }
  }, [title, description, path, ogImage, breadcrumbs, jsonLd, noindex]);

  return null;
}
