// Pure functions for /compare page prerendering. Reuses the generic
// tag/JSON-LD injection plumbing from tool-seo-generator.js (nothing in
// generateSEOTagsHTML / generateJSONLDScriptHTML / injectToolSEOTags is
// tool-specific) and only adds the comparison-specific SEO data, JSON-LD
// graph, and static body markup — mirrors what CompareDetailPage.tsx builds
// client-side so prerendered and hydrated HTML agree.
import { escapeHtml } from './seo-generator.js';
import { isSafeHttpUrl } from './tool-seo-generator.js';

const DOMAIN = 'https://www.gappsy.com';
const META_DESCRIPTION_MAX = 160;

function truncate(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  return `${trimmed.slice(0, max - 1).trimEnd()}…`;
}

export function generateComparisonSEOData({ toolA, toolB, comparisonContent }) {
  const title = `${toolA.name} vs ${toolB.name}: Pricing, Features & Verdict Compared | Gappsy`;
  const description = comparisonContent?.verdict
    ? truncate(comparisonContent.verdict, META_DESCRIPTION_MAX)
    : `Compare ${toolA.name} and ${toolB.name} on pricing, features, platforms, and ratings.`;
  const slug = `${toolA.slug}-vs-${toolB.slug}`;
  const canonical = `${DOMAIN}/compare/${slug}/`;
  const ogImage = isSafeHttpUrl(toolA.logo) ? toolA.logo : isSafeHttpUrl(toolB.logo) ? toolB.logo : `${DOMAIN}/og/default-og-image.svg`;
  return { title, description, canonical, ogImage, slug };
}

export function generateComparisonJSONLD({ toolA, toolB, comparisonContent, seoData }) {
  const canonical = seoData.canonical;
  const graph = [];

  graph.push({
    '@type': 'BreadcrumbList',
    '@id': `${canonical}#breadcrumb`,
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
      { '@type': 'ListItem', position: 2, name: 'Compare', item: `${DOMAIN}/compare/` },
      { '@type': 'ListItem', position: 3, name: `${toolA.name} vs ${toolB.name}`, item: canonical },
    ],
  });

  if (comparisonContent?.faqs?.length) {
    graph.push({
      '@type': 'FAQPage',
      '@id': `${canonical}#faq`,
      mainEntity: comparisonContent.faqs.map((faq) => ({
        '@type': 'Question',
        name: faq.question,
        acceptedAnswer: { '@type': 'Answer', text: faq.answer },
      })),
    });
  }

  return { '@context': 'https://schema.org', '@graph': graph };
}

function factsRow(label, aValue, bValue) {
  return `<tr><th scope="row" style="text-align:left;padding:0.6rem 0.9rem;color:#6B7280;font-weight:500;">${escapeHtml(label)}</th><td style="padding:0.6rem 0.9rem;color:#374151;">${escapeHtml(aValue)}</td><td style="padding:0.6rem 0.9rem;color:#374151;">${escapeHtml(bValue)}</td></tr>`;
}

export function generateComparisonStaticBodyHTML({ toolA, toolB, factsA, factsB, comparisonContent, seoData }) {
  const bestForHTML = comparisonContent
    ? `<div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin:1.5rem 0;">
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;"><strong>Best for ${escapeHtml(toolA.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolA)}</div>
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;"><strong>Best for ${escapeHtml(toolB.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolB)}</div>
      </div>`
    : '';

  const factsTableHTML = `
    <h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">At a Glance</h2>
    <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;">
      <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">&nbsp;</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolA.name)}</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolB.name)}</th></tr></thead>
      <tbody>
        ${factsRow('Rating', factsA.rating > 0 ? `${factsA.rating.toFixed(1)} (${factsA.reviewCount})` : 'Not yet rated', factsB.rating > 0 ? `${factsB.rating.toFixed(1)} (${factsB.reviewCount})` : 'Not yet rated')}
        ${factsRow('Pricing model', factsA.pricingModel || 'Not listed', factsB.pricingModel || 'Not listed')}
        ${factsRow('Starting price', factsA.startingPrice || 'Not listed', factsB.startingPrice || 'Not listed')}
        ${factsRow('Free plan', factsA.hasFreePlan ? 'Yes' : 'Not listed', factsB.hasFreePlan ? 'Yes' : 'Not listed')}
        ${factsRow('Free trial', factsA.hasFreeTrial ? 'Yes' : 'Not listed', factsB.hasFreeTrial ? 'Yes' : 'Not listed')}
        ${factsRow('Platforms', factsA.platforms.length ? factsA.platforms.join(', ') : 'Not listed', factsB.platforms.length ? factsB.platforms.join(', ') : 'Not listed')}
      </tbody>
    </table>`;

  const keyDifferencesHTML = comparisonContent?.keyDifferences?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Key Differences</h2>
      <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;">
        <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">Difference</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolA.name)}</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolB.name)}</th></tr></thead>
        <tbody>${comparisonContent.keyDifferences.map((d) => factsRow(d.title, d.toolA, d.toolB)).join('\n        ')}</tbody>
      </table>`
    : '';

  const faqHTML = comparisonContent?.faqs?.length
    ? `<h2 style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Frequently Asked Questions</h2>
      <div>${comparisonContent.faqs.map((faq) => `<details style="margin-bottom:0.75rem;border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem 1rem;"><summary style="font-weight:600;cursor:pointer;">${escapeHtml(faq.question)}</summary><p style="margin-top:0.5rem;color:#374151;line-height:1.6;">${escapeHtml(faq.answer)}</p></details>`).join('\n        ')}</div>`
    : '';

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> ·
        <a href="/compare/" style="color:#6B7280;">Compare</a> ·
        ${escapeHtml(toolA.name)} vs ${escapeHtml(toolB.name)}
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">${escapeHtml(toolA.name)} vs ${escapeHtml(toolB.name)}</h1>
      ${seoData.description ? `<p style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">${escapeHtml(seoData.description)}</p>` : ''}
      ${bestForHTML}
      ${factsTableHTML}
      ${keyDifferencesHTML}
      ${faqHTML}
      <p style="margin-top:2rem;"><a href="/tools/${escapeHtml(toolA.slug)}/" style="color:#4F46E5;">Read the full ${escapeHtml(toolA.name)} review</a> · <a href="/tools/${escapeHtml(toolB.slug)}/" style="color:#4F46E5;">Read the full ${escapeHtml(toolB.name)} review</a></p>
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience.
        </p>
      </noscript>
    </div>
  `;
}
