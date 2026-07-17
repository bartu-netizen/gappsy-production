// Pure functions for /compare page prerendering. Reuses the generic
// tag/JSON-LD injection plumbing from tool-seo-generator.js (nothing in
// generateSEOTagsHTML / generateJSONLDScriptHTML / injectToolSEOTags is
// tool-specific) and only adds the comparison-specific SEO data, JSON-LD
// graph, and static body markup — mirrors what CompareDetailPage.tsx (and
// its src/components/compare/* sections) build client-side, so prerendered
// and hydrated HTML show the same content, not a thin subset of it.
import { escapeHtml } from './seo-generator.js';
import { isSafeHttpUrl } from './tool-seo-generator.js';

const DOMAIN = 'https://www.gappsy.com';
const META_DESCRIPTION_MAX = 160;

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

const GAPPSY_ORG = { '@type': 'Organization', name: 'Gappsy', url: DOMAIN };

export function generateComparisonJSONLD({ toolA, toolB, comparisonContent, seoData, createdAt, updatedAt }) {
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

  if (comparisonContent) {
    graph.push({
      '@type': 'TechArticle',
      '@id': `${canonical}#article`,
      headline: `${toolA.name} vs ${toolB.name}: Pricing, Features & Verdict Compared`,
      description: seoData.description,
      mainEntityOfPage: canonical,
      url: canonical,
      ...(createdAt ? { datePublished: createdAt } : {}),
      ...(updatedAt || createdAt ? { dateModified: updatedAt || createdAt } : {}),
      author: GAPPSY_ORG,
      publisher: GAPPSY_ORG,
      ...(isSafeHttpUrl(seoData.ogImage) ? { image: seoData.ogImage } : {}),
    });
  }

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

const NOT_DOCUMENTED = 'Not documented';
const yesOrUnknown = (value) => (value ? 'Yes' : NOT_DOCUMENTED);

const FEATURE_STATUS_LABEL = { available: 'Available', limited: 'Limited', unavailable: 'Unavailable', 'not-documented': NOT_DOCUMENTED };

export function generateComparisonStaticBodyHTML({
  toolA,
  toolB,
  factsA,
  factsB,
  categoryA,
  categoryB,
  plansA = [],
  plansB = [],
  contentA,
  contentB,
  comparisonContent,
  seoData,
  relatedComparisons = [],
}) {
  const bestForHTML = comparisonContent
    ? `<div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin:1.5rem 0;">
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;"><strong>Best for ${escapeHtml(toolA.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolA)}</div>
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;"><strong>Best for ${escapeHtml(toolB.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolB)}</div>
      </div>`
    : '';

  const factsTableHTML = `
    <h2 id="at-a-glance" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">At a Glance</h2>
    <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;">
      <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">&nbsp;</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolA.name)}</th><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(toolB.name)}</th></tr></thead>
      <tbody>
        ${factsRow('Primary category', categoryA?.name || NOT_DOCUMENTED, categoryB?.name || NOT_DOCUMENTED)}
        ${factsRow('Rating', factsA.rating > 0 ? `${factsA.rating.toFixed(1)} (${factsA.reviewCount})` : NOT_DOCUMENTED, factsB.rating > 0 ? `${factsB.rating.toFixed(1)} (${factsB.reviewCount})` : NOT_DOCUMENTED)}
        ${factsRow('Pricing model', factsA.pricingModel || NOT_DOCUMENTED, factsB.pricingModel || NOT_DOCUMENTED)}
        ${factsRow('Starting price', factsA.startingPrice || NOT_DOCUMENTED, factsB.startingPrice || NOT_DOCUMENTED)}
        ${factsRow('Free plan', yesOrUnknown(factsA.hasFreePlan), yesOrUnknown(factsB.hasFreePlan))}
        ${factsRow('Free trial', yesOrUnknown(factsA.hasFreeTrial), yesOrUnknown(factsB.hasFreeTrial))}
        ${factsRow('Platforms', factsA.platforms.length ? factsA.platforms.join(', ') : NOT_DOCUMENTED, factsB.platforms.length ? factsB.platforms.join(', ') : NOT_DOCUMENTED)}
        ${factsRow('Team collaboration', yesOrUnknown(factsA.hasTeamCollaboration), yesOrUnknown(factsB.hasTeamCollaboration))}
        ${factsRow('AI features', yesOrUnknown(factsA.hasAI), yesOrUnknown(factsB.hasAI))}
        ${factsRow('Public API', yesOrUnknown(factsA.hasApi), yesOrUnknown(factsB.hasApi))}
      </tbody>
    </table>`;

  const keyDifferencesHTML = comparisonContent?.keyDifferences?.length
    ? `<h2 id="differences" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Key Differences</h2>
      ${comparisonContent.keyDifferences
        .map(
          (d) => `<div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;margin-bottom:0.75rem;">
        <p style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(d.title)}</p>
        <p style="color:#374151;margin-bottom:0.35rem;"><strong>${escapeHtml(toolA.name)}:</strong> ${escapeHtml(d.toolA)}</p>
        <p style="color:#374151;margin-bottom:0.5rem;"><strong>${escapeHtml(toolB.name)}:</strong> ${escapeHtml(d.toolB)}</p>
        <p style="color:#6B7280;font-size:0.9rem;">${escapeHtml(d.whyItMatters)}</p>
      </div>`
        )
        .join('\n      ')}`
    : '';

  const featureMatrixHTML = comparisonContent?.featureMatrix?.length
    ? `<h2 id="features" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Feature-by-Feature</h2>
      ${comparisonContent.featureMatrix
        .map(
          (group) => `<h3 style="font-weight:600;color:#111827;margin-top:1rem;margin-bottom:0.5rem;">${escapeHtml(group.group)}</h3>
        <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;margin-bottom:0.5rem;">
          <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.5rem 0.75rem;">Feature</th><th scope="col" style="text-align:left;padding:0.5rem 0.75rem;">${escapeHtml(toolA.name)}</th><th scope="col" style="text-align:left;padding:0.5rem 0.75rem;">${escapeHtml(toolB.name)}</th></tr></thead>
          <tbody>${group.rows.map((row) => factsRow(row.feature, FEATURE_STATUS_LABEL[row.toolA] || row.toolA, FEATURE_STATUS_LABEL[row.toolB] || row.toolB)).join('')}</tbody>
        </table>`
        )
        .join('\n      ')}`
    : '';

  const pricingColumn = (tool, plans) =>
    plans.length
      ? plans
          .map(
            (p) =>
              `<div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;margin-bottom:0.5rem;"><strong>${escapeHtml(p.plan_name || 'Plan')}</strong> — ${escapeHtml(p.price || 'Custom')}${p.billing_cycle ? ` ${escapeHtml(p.billing_cycle)}` : ''}</div>`
          )
          .join('')
      : `<p style="color:#6B7280;">No individual plan breakdown documented yet.</p>`;

  const pricingHTML = `
    <h2 id="pricing" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pricing Compared</h2>
    <p style="color:#6B7280;font-size:0.9rem;margin-bottom:1rem;">Starting price reflects the lowest paid tier, not the full cost for every team size or usage level.</p>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
      <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolA.name)}</h3>${pricingColumn(toolA, plansA)}</div>
      <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolB.name)}</h3>${pricingColumn(toolB, plansB)}</div>
    </div>`;

  const prosConsColumn = (pros = [], cons = []) => `
      ${pros.length ? `<p style="font-weight:600;color:#047857;margin-bottom:0.35rem;">Pros</p><ul style="list-style:disc;padding-left:1.25rem;margin-bottom:0.75rem;">${pros.slice(0, 6).map((p) => `<li style="color:#374151;margin-bottom:0.25rem;">${escapeHtml(p)}</li>`).join('')}</ul>` : ''}
      ${cons.length ? `<p style="font-weight:600;color:#BE123C;margin-bottom:0.35rem;">Cons</p><ul style="list-style:disc;padding-left:1.25rem;">${cons.slice(0, 6).map((c) => `<li style="color:#374151;margin-bottom:0.25rem;">${escapeHtml(c)}</li>`).join('')}</ul>` : ''}`;

  const hasProsConsA = (contentA?.pros?.length || contentA?.cons?.length) > 0;
  const hasProsConsB = (contentB?.pros?.length || contentB?.cons?.length) > 0;
  const prosConsHTML =
    hasProsConsA || hasProsConsB
      ? `<h2 id="pros-and-cons" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pros &amp; Cons</h2>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolA.name)}</h3>${prosConsColumn(contentA?.pros, contentA?.cons)}</div>
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolB.name)}</h3>${prosConsColumn(contentB?.pros, contentB?.cons)}</div>
      </div>`
      : '';

  const useCasesColumn = (useCases = []) =>
    useCases.length
      ? `<ul style="list-style:disc;padding-left:1.25rem;">${useCases.slice(0, 4).map((u) => `<li style="color:#374151;margin-bottom:0.35rem;"><strong>${escapeHtml(u.title)}</strong> — ${escapeHtml(u.description)}</li>`).join('')}</ul>`
      : '';

  const whoShouldChooseHTML = comparisonContent
    ? `<div style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:0.75rem;margin-bottom:1rem;">
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><strong>Choose ${escapeHtml(toolA.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolA)}</div>
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><strong>Choose ${escapeHtml(toolB.name)}:</strong> ${escapeHtml(comparisonContent.bestForToolB)}</div>
        <div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><strong>Need both:</strong> ${escapeHtml(comparisonContent.whoNeedsBoth)}</div>
      </div>`
    : '';

  const hasUseCases = (contentA?.useCases?.length || contentB?.useCases?.length) > 0;
  const useCasesHTML =
    hasUseCases || comparisonContent
      ? `<h2 id="use-cases" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Use Cases</h2>
      ${whoShouldChooseHTML}
      ${
        hasUseCases
          ? `<div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolA.name)}</h3>${useCasesColumn(contentA?.useCases)}</div>
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(toolB.name)}</h3>${useCasesColumn(contentB?.useCases)}</div>
      </div>`
          : ''
      }`
      : '';

  const alternativesColumn = (alternatives = []) =>
    alternatives.length
      ? `<ul style="list-style:disc;padding-left:1.25rem;">${alternatives.slice(0, 3).map((a) => `<li style="color:#374151;margin-bottom:0.35rem;"><a href="${escapeHtml(a.href)}" style="color:#4F46E5;">${escapeHtml(a.name)}</a> — ${escapeHtml(a.description)}</li>`).join('')}</ul>`
      : '';

  const hasAlternatives = (contentA?.alternatives?.length || contentB?.alternatives?.length) > 0;
  const alternativesHTML = hasAlternatives
    ? `<h2 id="alternatives" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Alternatives</h2>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem;">
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">Alternatives to ${escapeHtml(toolA.name)}</h3>${alternativesColumn(contentA?.alternatives)}</div>
        <div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">Alternatives to ${escapeHtml(toolB.name)}</h3>${alternativesColumn(contentB?.alternatives)}</div>
      </div>`
    : '';

  const faqHTML = comparisonContent?.faqs?.length
    ? `<h2 id="faq" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Frequently Asked Questions</h2>
      <div>${comparisonContent.faqs.map((faq) => `<details style="margin-bottom:0.75rem;border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem 1rem;"><summary style="font-weight:600;cursor:pointer;">${escapeHtml(faq.question)}</summary><p style="margin-top:0.5rem;color:#374151;line-height:1.6;">${escapeHtml(faq.answer)}</p></details>`).join('\n        ')}</div>`
    : '';

  const relatedComparisonsHTML = relatedComparisons.length
    ? `<h2 id="related-comparisons" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Related Comparisons</h2>
      <ul style="list-style:none;padding:0;display:grid;grid-template-columns:1fr 1fr;gap:0.75rem;">
        ${relatedComparisons
          .map(
            (c) =>
              `<li style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><a href="/compare/${escapeHtml(c.slug)}/" style="color:#4F46E5;font-weight:500;">${escapeHtml(c.tool_a.name)} vs ${escapeHtml(c.tool_b.name)}</a></li>`
          )
          .join('')}
      </ul>`
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
      ${seoData.description ? `<p id="verdict" style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">${escapeHtml(seoData.description)}</p>` : ''}
      ${bestForHTML}
      ${factsTableHTML}
      ${keyDifferencesHTML}
      ${featureMatrixHTML}
      ${pricingHTML}
      ${prosConsHTML}
      ${useCasesHTML}
      ${alternativesHTML}
      ${faqHTML}
      ${relatedComparisonsHTML}
      <p style="margin-top:2rem;"><a href="/tools/${escapeHtml(toolA.slug)}/" style="color:#4F46E5;">Read the full ${escapeHtml(toolA.name)} review</a> · <a href="/tools/${escapeHtml(toolB.slug)}/" style="color:#4F46E5;">Read the full ${escapeHtml(toolB.name)} review</a></p>
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience.
        </p>
      </noscript>
    </div>
  `;
}
