// Pure functions for tool-page prerendering — no I/O here. Mirrors the shape
// of the JSON-LD / meta tags ToolDetailPage.tsx + EntitySEOTags.tsx already
// build client-side, so the prerendered and hydrated versions agree.
import { escapeHtml } from './seo-generator.js';

const DOMAIN = 'https://www.gappsy.com';
const META_DESCRIPTION_MAX = 160;

export function isSafeHttpUrl(value) {
  if (!value || typeof value !== 'string') return false;
  if (value.startsWith('//')) return false;
  try {
    const parsed = new URL(value);
    return parsed.protocol === 'http:' || parsed.protocol === 'https:';
  } catch {
    return false;
  }
}

export function parsePriceNumber(price) {
  if (!price) return null;
  const match = String(price).replace(/,/g, '').match(/(\d+(\.\d+)?)/);
  return match ? Number(match[1]) : null;
}

function truncate(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(' ');
  // Only snap back to the last word boundary if it doesn't waste much of
  // the budget; otherwise a hard cut is still better than a tiny snippet.
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
}

// Real data only — returns null (not a fabricated sentence) when the tool
// has neither a short nor a long description. Callers must treat null as a
// validation failure, never as "print nothing." seo_meta_description is a
// hand-tunable editorial override (set via the admin tool editor or the
// enrichment pipeline) and takes priority when present.
export function generateToolDescription(tool) {
  const override = tool.seo_meta_description && tool.seo_meta_description.trim();
  if (override) return truncate(override, META_DESCRIPTION_MAX);

  const short = tool.short_description && tool.short_description.trim();
  if (short) return truncate(short, META_DESCRIPTION_MAX);

  const long = tool.long_description && tool.long_description.trim();
  if (long) {
    const firstSentence = long.split(/\n+/)[0];
    return truncate(firstSentence, META_DESCRIPTION_MAX);
  }

  return null;
}

export function generateToolSEOData(tool) {
  const overrideTitle = tool.seo_title && tool.seo_title.trim();
  const title = overrideTitle || `${tool.name} Review, Pricing, Features & Alternatives | Gappsy`;
  const description = generateToolDescription(tool);
  const canonical = `${DOMAIN}/tools/${tool.slug}/`;
  const ogImage = isSafeHttpUrl(tool.logo) ? tool.logo : `${DOMAIN}/og/default-og-image.svg`;
  return { title, description, canonical, ogImage };
}

export function generateSEOTagsHTML(seoData, tool) {
  return `    <title>${escapeHtml(seoData.title)}</title>
    <meta name="description" content="${escapeHtml(seoData.description)}" />
    <meta name="robots" content="index,follow" />
    <link rel="canonical" href="${seoData.canonical}" />
    <meta property="og:site_name" content="Gappsy" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="${escapeHtml(seoData.title)}" />
    <meta property="og:description" content="${escapeHtml(seoData.description)}" />
    <meta property="og:url" content="${seoData.canonical}" />
    <meta property="og:image" content="${escapeHtml(seoData.ogImage)}" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:site" content="@Gappsy" />
    <meta name="twitter:title" content="${escapeHtml(seoData.title)}" />
    <meta name="twitter:description" content="${escapeHtml(seoData.description)}" />
    <meta name="twitter:image" content="${escapeHtml(seoData.ogImage)}" />`;
}

export function generateToolJSONLD({ tool, primaryCategory, pricingPlans = [], reviews = [], extendedContent, seoData }) {
  const canonical = seoData.canonical;
  const graph = [];

  const offers = pricingPlans
    .map((plan) => {
      const price = parsePriceNumber(plan.price);
      if (price === null) return null;
      return { '@type': 'Offer', name: plan.plan_name || undefined, price, priceCurrency: 'USD' };
    })
    .filter(Boolean);

  const reviewJsonLd = reviews.map((r) => ({
    '@type': 'Review',
    author: { '@type': 'Person', name: r.author_name },
    reviewRating: { '@type': 'Rating', ratingValue: r.rating, bestRating: 5, worstRating: 1 },
    reviewBody: r.quote,
  }));

  graph.push({
    '@type': 'SoftwareApplication',
    '@id': `${canonical}#software`,
    name: tool.name,
    description: seoData.description || undefined,
    image: isSafeHttpUrl(tool.logo) ? tool.logo : undefined,
    url: isSafeHttpUrl(tool.website) ? tool.website : undefined,
    applicationCategory: primaryCategory?.name || undefined,
    ...(offers.length > 0 ? { offers } : {}),
    ...(tool.rating > 0 && tool.review_count > 0
      ? { aggregateRating: { '@type': 'AggregateRating', ratingValue: tool.rating, reviewCount: tool.review_count } }
      : {}),
    ...(reviewJsonLd.length > 0 ? { review: reviewJsonLd } : {}),
  });

  const breadcrumbItems = [
    { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
    { '@type': 'ListItem', position: 2, name: 'Tools', item: `${DOMAIN}/tools/` },
  ];
  if (primaryCategory) {
    breadcrumbItems.push({
      '@type': 'ListItem',
      position: 3,
      name: primaryCategory.name,
      item: `${DOMAIN}/tool-categories/${primaryCategory.slug}/`,
    });
  }
  breadcrumbItems.push({
    '@type': 'ListItem',
    position: breadcrumbItems.length + 1,
    name: tool.name,
    item: canonical,
  });
  graph.push({ '@type': 'BreadcrumbList', '@id': `${canonical}#breadcrumb`, itemListElement: breadcrumbItems });

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

export function generateJSONLDScriptHTML(jsonLd) {
  // data-entity-jsonld matches EntitySEOTags.tsx's own cleanup selector, so
  // React removes this prerendered block the instant it hydrates and injects
  // its own — no duplicate-JSON-LD window, no client code changes needed.
  return `    <script type="application/ld+json" data-entity-jsonld="true">
${JSON.stringify(jsonLd, null, 2).split('\n').map((line) => `    ${line}`).join('\n')}
    </script>`;
}

function formatDate(iso) {
  if (!iso) return null;
  try {
    return new Date(iso).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
  } catch {
    return null;
  }
}

export function generateToolStaticBodyHTML({ tool, categories = [], tags = [], primaryCategory, pricingPlans = [], reviews = [], relatedTools = [], extendedContent }) {
  const description = generateToolDescription(tool);
  const updatedLabel = formatDate(tool.updated_at);

  const keyFacts = [];
  if (primaryCategory) keyFacts.push(['Category', primaryCategory.name]);
  if (tool.pricing_model || tool.starting_price) {
    keyFacts.push(['Pricing', [tool.pricing_model, tool.starting_price ? `from ${tool.starting_price}` : null].filter(Boolean).join(', ')]);
  }
  keyFacts.push(['Verified', tool.verified ? 'Yes' : 'Not yet']);
  if (updatedLabel) keyFacts.push(['Last updated', updatedLabel]);
  if (tool.founded_year) keyFacts.push(['Founded', String(tool.founded_year)]);
  if (tool.headquarters) keyFacts.push(['Headquarters', tool.headquarters]);

  const keyFactsHTML = keyFacts.length
    ? `<dl style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:1rem;margin:1.5rem 0;">
        ${keyFacts.map(([term, value]) => `<div><dt style="font-size:0.75rem;text-transform:uppercase;color:#6B7280;">${escapeHtml(term)}</dt><dd style="font-weight:600;color:#111827;">${escapeHtml(value)}</dd></div>`).join('\n        ')}
      </dl>`
    : '';

  const tagsHTML = tags.length
    ? `<div style="margin:1rem 0;">${tags.map((t) => `<span style="display:inline-block;padding:0.25rem 0.65rem;margin:0.15rem;background:#F3F4F6;border-radius:9999px;font-size:0.8rem;color:#374151;">${escapeHtml(t.name)}</span>`).join('')}</div>`
    : '';

  const overviewHTML = extendedContent?.longForm?.length
    ? extendedContent.longForm.slice(0, 3).map((block) => `
      <h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:0.75rem;color:#111827;">${escapeHtml(block.heading)}</h2>
      ${block.paragraphs.map((p) => `<p style="color:#374151;line-height:1.7;margin-bottom:1rem;">${escapeHtml(p)}</p>`).join('\n      ')}`).join('\n')
    : tool.long_description
      ? `<div style="color:#374151;line-height:1.7;margin:1.5rem 0;">${escapeHtml(tool.long_description).split('\n').filter(Boolean).map((p) => `<p style="margin-bottom:1rem;">${p}</p>`).join('\n        ')}</div>`
      : '';

  const featuresHTML = extendedContent?.features?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Key Features</h2>
      <ul style="list-style:disc;padding-left:1.5rem;">
        ${extendedContent.features.slice(0, 12).map((f) => `<li style="margin-bottom:0.75rem;"><strong>${escapeHtml(f.title)}</strong> — ${escapeHtml(f.description)}</li>`).join('\n        ')}
      </ul>`
    : '';

  const prosConsHTML = extendedContent && (extendedContent.pros?.length || extendedContent.cons?.length)
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pros &amp; Cons</h2>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:1.5rem;">
        <div><h3 style="font-weight:600;color:#047857;margin-bottom:0.5rem;">Pros</h3><ul style="list-style:disc;padding-left:1.25rem;">${(extendedContent.pros || []).map((p) => `<li style="margin-bottom:0.4rem;color:#374151;">${escapeHtml(p)}</li>`).join('')}</ul></div>
        <div><h3 style="font-weight:600;color:#BE123C;margin-bottom:0.5rem;">Cons</h3><ul style="list-style:disc;padding-left:1.25rem;">${(extendedContent.cons || []).map((c) => `<li style="margin-bottom:0.4rem;color:#374151;">${escapeHtml(c)}</li>`).join('')}</ul></div>
      </div>`
    : '';

  const pricingHTML = pricingPlans.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pricing</h2>
      <ul style="list-style:none;padding:0;display:grid;grid-template-columns:repeat(auto-fit,minmax(180px,1fr));gap:1rem;">
        ${pricingPlans.map((p) => `<li style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;"><strong>${escapeHtml(p.plan_name || 'Plan')}</strong><br>${escapeHtml(p.price || 'Custom')}${p.billing_cycle ? ` ${escapeHtml(p.billing_cycle)}` : ''}</li>`).join('\n        ')}
      </ul>`
    : '';

  const faqHTML = extendedContent?.faqs?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Frequently Asked Questions</h2>
      <div>${extendedContent.faqs.map((faq) => `<details style="margin-bottom:0.75rem;border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem 1rem;"><summary style="font-weight:600;cursor:pointer;">${escapeHtml(faq.question)}</summary><p style="margin-top:0.5rem;color:#374151;line-height:1.6;">${escapeHtml(faq.answer)}</p></details>`).join('\n        ')}</div>`
    : '';

  const reviewsHTML = reviews.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">What People Are Saying</h2>
      <div>${reviews.slice(0, 6).map((r) => `<blockquote style="border-left:3px solid #E5E7EB;padding-left:1rem;margin:0 0 1rem 0;color:#374151;">"${escapeHtml(r.quote)}" <footer style="color:#6B7280;font-size:0.875rem;margin-top:0.25rem;">— ${escapeHtml(r.author_name)}</footer></blockquote>`).join('\n        ')}</div>`
    : '';

  const relatedHTML = relatedTools.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Related Tools</h2>
      <ul style="list-style:disc;padding-left:1.5rem;">
        ${relatedTools.slice(0, 5).map((t) => `<li><a href="/tools/${t.slug}/" style="color:#4F46E5;">${escapeHtml(t.name)}</a></li>`).join('\n        ')}
      </ul>`
    : '';

  const categoryLinkHTML = primaryCategory
    ? `<a href="/tool-categories/${primaryCategory.slug}/" style="color:#4F46E5;">${escapeHtml(primaryCategory.name)}</a> · `
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> ·
        <a href="/tools/" style="color:#6B7280;">Tools</a> ·
        ${categoryLinkHTML}${escapeHtml(tool.name)}
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">${escapeHtml(tool.name)} Review, Pricing &amp; Features</h1>
      ${description ? `<p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">${escapeHtml(description)}</p>` : ''}
      ${keyFactsHTML}
      ${tagsHTML}
      ${overviewHTML}
      ${featuresHTML}
      ${prosConsHTML}
      ${pricingHTML}
      ${reviewsHTML}
      ${faqHTML}
      ${relatedHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience. Please enable JavaScript for reviews, screenshots, and comparison tools.
        </p>
      </noscript>
    </div>
  `;
}

export function injectToolSEOTags(baseHtml, seoData, jsonLd, staticBodyHTML) {
  let html = baseHtml;

  // Remove existing robots meta so ours is the only one.
  html = html.replace(/<meta name="robots"[^>]*>/g, '');

  // Replace <title>.
  const titleRegex = /<title>.*?<\/title>/;
  html = titleRegex.test(html) ? html.replace(titleRegex, '') : html;

  // Replace first meta description (drop it; the tags block below re-adds it).
  html = html.replace(/<meta name="description"[^>]*>/, '');
  // Remove any OG/twitter meta from the base template so we don't duplicate.
  html = html.replace(/<meta property="og:[^"]*"[^>]*>/g, '');
  html = html.replace(/<meta name="twitter:[^"]*"[^>]*>/g, '');
  // Remove any existing canonical link.
  html = html.replace(/<link[^>]+rel=["']canonical["'][^>]*>/g, '');
  // Remove all existing JSON-LD scripts.
  html = html.replace(/<script[^>]*type=["']application\/ld\+json["'][^>]*>[\s\S]*?<\/script>\s*/gi, '');

  const tagsBlock = generateSEOTagsHTML(seoData);
  const jsonLdBlock = generateJSONLDScriptHTML(jsonLd);

  const headCloseTag = '</head>';
  if (html.includes(headCloseTag)) {
    html = html.replace(headCloseTag, `${tagsBlock}\n\n${jsonLdBlock}\n  ${headCloseTag}`);
  }

  const rootDivRegex = /(<div id="root"><\/div>)/;
  if (rootDivRegex.test(html)) {
    // Use a replacer function, not a string: a string replacement interprets
    // $1/$2/... as backreferences, which silently corrupts any staticBodyHTML
    // content containing a literal "$1"-style sequence (e.g. "$10.99" pricing).
    html = html.replace(rootDivRegex, () => `<div id="root">${staticBodyHTML}</div>`);
  }

  return html;
}
