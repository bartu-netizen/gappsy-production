// Pure functions for the /compare hub page — mirrors category-seo-generator.js's
// hub functions exactly, just listing comparison pages instead of categories.
// Written to close a real gap: individual /compare/:slug pages had zero
// prerendered inbound links from anywhere on the site (not the homepage, not
// tool pages, not category pages) — reachable only via sitemap.xml. This hub
// gives every one of them a real, crawlable inbound link.
import { escapeHtml } from './seo-generator.js';
import { generateSEOTagsHTML, generateJSONLDScriptHTML, injectToolSEOTags as injectSEOTags } from './tool-seo-generator.js';

const DOMAIN = 'https://gappsy.com';

export function generateCompareHubSEOData() {
  return {
    title: 'Compare Software Tools Side by Side | Gappsy',
    description: 'Browse every tool comparison on Gappsy — head-to-head breakdowns of pricing, features, and verdicts to help you pick the right software.',
    canonical: `${DOMAIN}/compare/`,
    ogImage: `${DOMAIN}/og/default-og-image.svg`,
  };
}

// `pairwise`/`group` are the same {slug, title, canonical} summaries
// prerender-comparisons.js / prerender-group-comparisons.js already return
// after successfully writing each individual page — reused here rather than
// re-querying Supabase for the same data.
export function generateCompareHubJSONLD({ pairwise, group }) {
  const all = [...pairwise, ...group];
  const graph = [
    { '@type': 'CollectionPage', '@id': `${DOMAIN}/compare/#collection`, name: 'Tool Comparisons' },
  ];

  if (all.length > 0) {
    graph.push({
      '@type': 'ItemList',
      '@id': `${DOMAIN}/compare/#itemlist`,
      itemListElement: all.map((c, i) => ({
        '@type': 'ListItem',
        position: i + 1,
        name: c.title,
        url: c.canonical,
      })),
    });
  }

  graph.push({
    '@type': 'BreadcrumbList',
    '@id': `${DOMAIN}/compare/#breadcrumb`,
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
      { '@type': 'ListItem', position: 2, name: 'Compare', item: `${DOMAIN}/compare/` },
    ],
  });

  return { '@context': 'https://schema.org', '@graph': graph };
}

function renderList(items) {
  return `<ul style="list-style:disc;padding-left:1.5rem;">
        ${items.map((c) => `<li><a href="${new URL(c.canonical).pathname}" style="color:#4F46E5;">${escapeHtml(c.title)}</a></li>`).join('\n        ')}
      </ul>`;
}

export function generateCompareHubStaticBodyHTML({ pairwise, group }) {
  const pairwiseHTML = pairwise.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Head-to-head comparisons (${pairwise.length})</h2>
      ${renderList(pairwise)}`
    : '';

  const groupHTML = group.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Multi-tool roundups (${group.length})</h2>
      ${renderList(group)}`
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> · Compare
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">Compare software tools</h1>
      <p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1.5rem;">Every comparison on Gappsy, in one place — pricing, features, and verdicts side by side.</p>
      ${pairwiseHTML}
      ${groupHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience, including search and filtering.
        </p>
      </noscript>
    </div>
  `;
}

export { generateSEOTagsHTML, generateJSONLDScriptHTML, injectSEOTags };
