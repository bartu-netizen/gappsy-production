// Pure functions for the /tools hub page — mirrors category-seo-generator.js
// and compare-hub-seo-generator.js's hub functions. Closes the same gap
// those fixed: ToolsIndexPage.tsx (the /tools directory index) had no
// prerendered HTML at all, so crawlers that don't execute JS (and Google's
// own first-wave crawl) saw an empty SPA shell with zero links to any tool.
import { escapeHtml } from './seo-generator.js';
import { generateSEOTagsHTML, generateJSONLDScriptHTML, injectToolSEOTags as injectSEOTags } from './tool-seo-generator.js';

const DOMAIN = 'https://gappsy.com';

export function generateToolsHubSEOData() {
  return {
    title: 'Software Tools Directory — Browse All Tools | Gappsy',
    description: 'Browse every software tool in the Gappsy directory — compare pricing, features, and reviews to find the right tool for your business.',
    canonical: `${DOMAIN}/tools/`,
    ogImage: `${DOMAIN}/og/default-og-image.svg`,
  };
}

// `tools` is the same {slug, name, title, canonical} summary
// prerender-tools.js already returns after successfully writing each
// individual tool page — reused here rather than re-querying Supabase.
export function generateToolsHubJSONLD(tools) {
  const graph = [
    { '@type': 'CollectionPage', '@id': `${DOMAIN}/tools/#collection`, name: 'Software Tools Directory' },
  ];

  if (tools.length > 0) {
    graph.push({
      '@type': 'ItemList',
      '@id': `${DOMAIN}/tools/#itemlist`,
      itemListElement: tools.map((t, i) => ({
        '@type': 'ListItem',
        position: i + 1,
        name: t.name,
        url: t.canonical,
      })),
    });
  }

  graph.push({
    '@type': 'BreadcrumbList',
    '@id': `${DOMAIN}/tools/#breadcrumb`,
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
      { '@type': 'ListItem', position: 2, name: 'Tools', item: `${DOMAIN}/tools/` },
    ],
  });

  return { '@context': 'https://schema.org', '@graph': graph };
}

export function generateToolsHubStaticBodyHTML(tools) {
  const sorted = [...tools].sort((a, b) => a.name.localeCompare(b.name));
  const listHTML = sorted.length
    ? `<ul style="list-style:disc;padding-left:1.5rem;">
        ${sorted.map((t) => `<li><a href="${new URL(t.canonical).pathname}" style="color:#4F46E5;">${escapeHtml(t.name)}</a></li>`).join('\n        ')}
      </ul>`
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> · Tools
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">Software tools directory</h1>
      <p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">A curated directory of tools — hand-picked, organized by category, and easy to compare.</p>
      <p style="color:#6B7280;font-size:0.9rem;margin-bottom:1.5rem;">${sorted.length} tool${sorted.length === 1 ? '' : 's'} · <a href="/tool-categories/" style="color:#4F46E5;">Browse by category</a></p>
      ${listHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience, including search, sorting, and filtering.
        </p>
      </noscript>
    </div>
  `;
}

export { generateSEOTagsHTML, generateJSONLDScriptHTML, injectSEOTags };
