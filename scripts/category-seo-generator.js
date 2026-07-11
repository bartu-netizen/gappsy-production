// Pure functions for category-page prerendering — no I/O here. Mirrors
// tool-seo-generator.js's shape, and directly reuses its fully-generic
// helpers (meta-tag HTML, JSON-LD script injection, head/body injection)
// rather than duplicating them.
import { escapeHtml } from './seo-generator.js';
import { generateSEOTagsHTML, generateJSONLDScriptHTML, injectToolSEOTags as injectSEOTags } from './tool-seo-generator.js';

const DOMAIN = 'https://www.gappsy.com';
const META_DESCRIPTION_MAX = 160;

function truncate(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  return `${trimmed.slice(0, max - 1).trimEnd()}…`;
}

// Real data only — returns null (not a fabricated sentence) when the
// category has neither a seo_description nor a description.
export function generateCategoryDescription(category) {
  const seoDesc = category.seo_description && category.seo_description.trim();
  if (seoDesc) return truncate(seoDesc, META_DESCRIPTION_MAX);

  const desc = category.description && category.description.trim();
  if (desc) return truncate(desc, META_DESCRIPTION_MAX);

  return null;
}

export function generateCategorySEOData(category) {
  const title = category.seo_title?.trim() || `${category.name} Tools | Gappsy`;
  const description = generateCategoryDescription(category);
  const canonical = `${DOMAIN}/tool-categories/${category.slug}/`;
  const ogImage = `${DOMAIN}/og/default-og-image.svg`;
  return { title, description, canonical, ogImage };
}

export function generateCategoriesHubSEOData() {
  return {
    title: 'Tool Categories — Browse Software by Category | Gappsy',
    description: 'Browse software tools organized by category — find the right category, then compare top-rated tools inside it.',
    canonical: `${DOMAIN}/tool-categories/`,
    ogImage: `${DOMAIN}/og/default-og-image.svg`,
  };
}

export function generateCategoryJSONLD({ category, tools = [], extendedContent, seoData }) {
  const canonical = seoData.canonical;
  const graph = [];

  graph.push({
    '@type': 'CollectionPage',
    '@id': `${canonical}#collection`,
    name: `${category.name} Tools`,
  });

  if (tools.length > 0) {
    graph.push({
      '@type': 'ItemList',
      '@id': `${canonical}#itemlist`,
      itemListElement: tools.map((t, i) => ({
        '@type': 'ListItem',
        position: i + 1,
        name: t.name,
        url: `${DOMAIN}/tools/${t.slug}/`,
      })),
    });
  }

  graph.push({
    '@type': 'BreadcrumbList',
    '@id': `${canonical}#breadcrumb`,
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
      { '@type': 'ListItem', position: 2, name: 'Tool Categories', item: `${DOMAIN}/tool-categories/` },
      { '@type': 'ListItem', position: 3, name: category.name, item: canonical },
    ],
  });

  if (extendedContent?.faqs?.length) {
    graph.push({
      '@type': 'FAQPage',
      '@id': `${canonical}#faq`,
      mainEntity: extendedContent.faqs.map((faq) => ({
        '@type': 'Question',
        name: faq.question,
        acceptedAnswer: { '@type': 'Answer', text: faq.answer },
      })),
    });
  }

  return { '@context': 'https://schema.org', '@graph': graph };
}

export function generateCategoryStaticBodyHTML({ category, tools = [], extendedContent }) {
  const description = generateCategoryDescription(category);

  const toolsHTML = tools.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Tools in ${escapeHtml(category.name)}</h2>
      <ul style="list-style:disc;padding-left:1.5rem;">
        ${tools.map((t) => `<li><a href="/tools/${t.slug}/" style="color:#4F46E5;">${escapeHtml(t.name)}</a>${t.short_description ? ` — ${escapeHtml(t.short_description)}` : ''}</li>`).join('\n        ')}
      </ul>`
    : '';

  const buyersGuideHTML = extendedContent?.buyersGuide?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:0.75rem;color:#111827;">How to choose ${escapeHtml(category.name.toLowerCase())} software</h2>
      ${extendedContent.buyersGuide.map((p) => `<p style="color:#374151;line-height:1.7;margin-bottom:1rem;">${escapeHtml(p)}</p>`).join('\n      ')}`
    : '';

  const whoItsForHTML = extendedContent?.whoItsFor?.length
    ? `<h3 style="font-weight:600;color:#111827;margin-top:1.5rem;margin-bottom:0.5rem;">Who it's for</h3>
      <ul style="list-style:disc;padding-left:1.25rem;">${extendedContent.whoItsFor.map((i) => `<li style="margin-bottom:0.4rem;color:#374151;">${escapeHtml(i)}</li>`).join('')}</ul>`
    : '';

  const selectionCriteriaHTML = extendedContent?.selectionCriteria?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">What to look for</h2>
      <ul style="list-style:disc;padding-left:1.5rem;">
        ${extendedContent.selectionCriteria.map((c) => `<li style="margin-bottom:0.75rem;"><strong>${escapeHtml(c.title)}</strong> — ${escapeHtml(c.description)}</li>`).join('\n        ')}
      </ul>`
    : '';

  const faqHTML = extendedContent?.faqs?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Frequently Asked Questions</h2>
      <div>${extendedContent.faqs.map((faq) => `<details style="margin-bottom:0.75rem;border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem 1rem;"><summary style="font-weight:600;cursor:pointer;">${escapeHtml(faq.question)}</summary><p style="margin-top:0.5rem;color:#374151;line-height:1.6;">${escapeHtml(faq.answer)}</p></details>`).join('\n        ')}</div>`
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> ·
        <a href="/tool-categories/" style="color:#6B7280;">Tool Categories</a> ·
        ${escapeHtml(category.name)}
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">${escapeHtml(category.name)}</h1>
      ${description ? `<p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">${escapeHtml(description)}</p>` : ''}
      <p style="color:#6B7280;font-size:0.9rem;margin-bottom:1rem;">${tools.length} tool${tools.length === 1 ? '' : 's'}</p>
      ${buyersGuideHTML}
      ${whoItsForHTML}
      ${selectionCriteriaHTML}
      ${toolsHTML}
      ${faqHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience, including search, sorting, and filtering.
        </p>
      </noscript>
    </div>
  `;
}

export function generateCategoriesHubJSONLD(categories) {
  return {
    '@context': 'https://schema.org',
    '@graph': [
      { '@type': 'CollectionPage', '@id': `${DOMAIN}/tool-categories/#collection`, name: 'Tool Categories' },
      {
        '@type': 'ItemList',
        '@id': `${DOMAIN}/tool-categories/#itemlist`,
        itemListElement: categories.map((c, i) => ({
          '@type': 'ListItem',
          position: i + 1,
          name: c.name,
          url: `${DOMAIN}/tool-categories/${c.slug}/`,
        })),
      },
      {
        '@type': 'BreadcrumbList',
        '@id': `${DOMAIN}/tool-categories/#breadcrumb`,
        itemListElement: [
          { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
          { '@type': 'ListItem', position: 2, name: 'Tool Categories', item: `${DOMAIN}/tool-categories/` },
        ],
      },
    ],
  };
}

export function generateCategoriesHubStaticBodyHTML(categories) {
  const listHTML = categories.length
    ? `<ul style="list-style:disc;padding-left:1.5rem;">
        ${categories.map((c) => `<li><a href="/tool-categories/${c.slug}/" style="color:#4F46E5;">${escapeHtml(c.name)}</a>${c.description ? ` — ${escapeHtml(c.description)}` : ''}</li>`).join('\n        ')}
      </ul>`
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> · Tool Categories
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">Find tools by category</h1>
      <p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1.5rem;">Every category is a starting point — pick the one closest to what you're trying to solve.</p>
      ${listHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience, including category search.
        </p>
      </noscript>
    </div>
  `;
}

export { generateSEOTagsHTML, generateJSONLDScriptHTML, injectSEOTags };
