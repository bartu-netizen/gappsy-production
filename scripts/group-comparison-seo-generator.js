// Pure functions for /compare/:slug page prerendering (N-tool
// comparisons, 3+). Mirrors comparison-seo-generator.js's structure and
// reuses the same generic tag/JSON-LD injection plumbing from
// tool-seo-generator.js — only the comparison-specific parts here are
// generalized from exactly 2 tools to an arbitrary list, matching what
// GroupCompareDetailPage.tsx (and its src/components/groupCompare/*
// sections) build client-side.
import { escapeHtml } from './seo-generator.js';
import { isSafeHttpUrl } from './tool-seo-generator.js';

const DOMAIN = 'https://gappsy.com';
const META_DESCRIPTION_MAX = 160;

function truncate(text, max) {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(' ');
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
}

export function generateGroupComparisonSEOData({ groupComparison, tools, groupComparisonContent }) {
  const title = `${groupComparison.title} | Gappsy`;
  const description = groupComparisonContent?.verdict
    ? truncate(groupComparisonContent.verdict, META_DESCRIPTION_MAX)
    : `Compare ${tools.map((t) => t.name).join(', ')} on pricing, features, and who each one is built for.`;
  const canonical = `${DOMAIN}/compare/${groupComparison.slug}/`;
  const ogImage = tools.find((t) => isSafeHttpUrl(t.logo))?.logo || `${DOMAIN}/og/default-og-image.svg`;
  return { title, description, canonical, ogImage, slug: groupComparison.slug };
}

const GAPPSY_ORG = { '@type': 'Organization', name: 'Gappsy', url: DOMAIN };

export function generateGroupComparisonJSONLD({ groupComparison, tools, groupComparisonContent, seoData, createdAt, updatedAt }) {
  const canonical = seoData.canonical;
  const graph = [];

  graph.push({
    '@type': 'BreadcrumbList',
    '@id': `${canonical}#breadcrumb`,
    itemListElement: [
      { '@type': 'ListItem', position: 1, name: 'Home', item: `${DOMAIN}/` },
      { '@type': 'ListItem', position: 2, name: 'Compare', item: `${DOMAIN}/compare/` },
      { '@type': 'ListItem', position: 3, name: groupComparison.title, item: canonical },
    ],
  });

  graph.push({
    '@type': 'TechArticle',
    '@id': `${canonical}#article`,
    headline: groupComparison.title,
    description: seoData.description,
    mainEntityOfPage: canonical,
    url: canonical,
    ...(createdAt ? { datePublished: createdAt } : {}),
    ...(updatedAt || createdAt ? { dateModified: updatedAt || createdAt } : {}),
    author: GAPPSY_ORG,
    publisher: GAPPSY_ORG,
    ...(isSafeHttpUrl(seoData.ogImage) ? { image: seoData.ogImage } : {}),
  });

  if (groupComparisonContent?.faqs?.length) {
    graph.push({
      '@type': 'FAQPage',
      '@id': `${canonical}#faq`,
      mainEntity: groupComparisonContent.faqs.map((faq) => ({
        '@type': 'Question',
        name: faq.question,
        acceptedAnswer: { '@type': 'Answer', text: faq.answer },
      })),
    });
  }

  return { '@context': 'https://schema.org', '@graph': graph };
}

const NOT_DOCUMENTED = 'Not documented';
const FEATURE_STATUS_LABEL = { available: 'Available', limited: 'Limited', unavailable: 'Unavailable', 'not-documented': NOT_DOCUMENTED };
const yesOrUnknown = (value) => (value ? 'Yes' : NOT_DOCUMENTED);

function factsRow(label, values) {
  return `<tr><th scope="row" style="text-align:left;padding:0.6rem 0.9rem;color:#6B7280;font-weight:500;">${escapeHtml(label)}</th>${values.map((v) => `<td style="padding:0.6rem 0.9rem;color:#374151;">${escapeHtml(v)}</td>`).join('')}</tr>`;
}

// `tools` items here carry more than the base id/slug/name/logo/pricing
// fields used elsewhere in this file — the prerender script merges in
// category, rating, reviewCount, the hasX tag-derived flags, platforms,
// plans, pros, cons, useCases, and screenshots per tool (mirrors what
// fetchToolExtras + buildFacts assemble client-side for GroupCompareDetailPage).
export function generateGroupComparisonStaticBodyHTML({ groupComparison, tools, groupComparisonContent, seoData, relatedGroupComparisons = [] }) {
  const toolCardsHTML = `
    <div style="display:flex;flex-wrap:wrap;gap:1rem;margin:1.5rem 0;">
      ${tools
        .map(
          (t) => `<div style="flex:1;min-width:180px;border:1px solid #E5E7EB;border-radius:0.75rem;padding:1rem;text-align:center;">
        <p style="font-weight:700;color:#111827;margin-bottom:0.25rem;"><a href="/tools/${escapeHtml(t.slug)}/" style="color:#111827;">${escapeHtml(t.name)}</a></p>
        ${t.pricingModel || t.startingPrice ? `<p style="color:#6B7280;font-size:0.85rem;">${escapeHtml(t.pricingModel || '')}${t.pricingModel && t.startingPrice ? ' · ' : ''}${t.startingPrice ? `From ${escapeHtml(t.startingPrice)}` : ''}</p>` : ''}
        ${groupComparisonContent?.bestFor?.[t.slug] ? `<p style="color:#374151;font-size:0.8rem;margin-top:0.5rem;"><strong>Best for:</strong> ${escapeHtml(groupComparisonContent.bestFor[t.slug])}</p>` : ''}
      </div>`
        )
        .join('')}
    </div>`;

  const factsTableHTML = `
    <h2 id="at-a-glance" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">At a Glance</h2>
    <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;">
      <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">&nbsp;</th>${tools.map((t) => `<th scope="col" style="text-align:left;padding:0.6rem 0.9rem;">${escapeHtml(t.name)}</th>`).join('')}</tr></thead>
      <tbody>
        ${factsRow('Primary category', tools.map((t) => t.category?.name || NOT_DOCUMENTED))}
        ${factsRow('Rating', tools.map((t) => (t.rating > 0 ? `${t.rating.toFixed(1)} (${t.reviewCount || 0})` : NOT_DOCUMENTED)))}
        ${factsRow('Pricing model', tools.map((t) => t.pricingModel || NOT_DOCUMENTED))}
        ${factsRow('Starting price', tools.map((t) => t.startingPrice || NOT_DOCUMENTED))}
        ${factsRow('Free plan', tools.map((t) => yesOrUnknown(t.hasFreePlan)))}
        ${factsRow('Free trial', tools.map((t) => yesOrUnknown(t.hasFreeTrial)))}
        ${factsRow('Platforms', tools.map((t) => ((t.platforms || []).length ? t.platforms.join(', ') : NOT_DOCUMENTED)))}
        ${factsRow('Team collaboration', tools.map((t) => yesOrUnknown(t.hasTeamCollaboration)))}
        ${factsRow('AI features', tools.map((t) => yesOrUnknown(t.hasAI)))}
        ${factsRow('Public API', tools.map((t) => yesOrUnknown(t.hasApi)))}
      </tbody>
    </table>`;

  const highlightsHTML = groupComparisonContent?.highlights?.length
    ? `<h2 id="highlights" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Standout Differences</h2>
      ${groupComparisonContent.highlights
        .map(
          (h) => `<div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:1rem;margin-bottom:0.75rem;">
        <p style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(h.title)}</p>
        <p style="color:#374151;margin-bottom:0.5rem;">${escapeHtml(h.description)}</p>
        <p style="color:#6B7280;font-size:0.85rem;">${h.toolSlugs.map((s) => escapeHtml(tools.find((t) => t.slug === s)?.name || s)).join(', ')}</p>
      </div>`
        )
        .join('\n      ')}`
    : '';

  const featureMatrixHTML = groupComparisonContent?.featureMatrix?.length
    ? `<h2 id="features" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Feature-by-Feature</h2>
      ${groupComparisonContent.featureMatrix
        .map(
          (group) => `<h3 style="font-weight:600;color:#111827;margin-top:1rem;margin-bottom:0.5rem;">${escapeHtml(group.group)}</h3>
        <table style="width:100%;border-collapse:collapse;border:1px solid #E5E7EB;margin-bottom:0.5rem;">
          <thead><tr style="background:#F9FAFB;"><th scope="col" style="text-align:left;padding:0.5rem 0.75rem;">Feature</th>${tools.map((t) => `<th scope="col" style="text-align:left;padding:0.5rem 0.75rem;">${escapeHtml(t.name)}</th>`).join('')}</tr></thead>
          <tbody>${group.rows
            .map(
              (row) =>
                `<tr><th scope="row" style="text-align:left;padding:0.5rem 0.75rem;color:#6B7280;font-weight:500;">${escapeHtml(row.feature)}</th>${tools.map((t) => `<td style="padding:0.5rem 0.75rem;color:#374151;">${escapeHtml(FEATURE_STATUS_LABEL[row.statuses?.[t.slug]] || NOT_DOCUMENTED)}</td>`).join('')}</tr>`
            )
            .join('')}</tbody>
        </table>`
        )
        .join('\n      ')}`
    : '';

  const pricingColumn = (plans = []) =>
    plans.length
      ? plans
          .map(
            (p) =>
              `<div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;margin-bottom:0.5rem;"><strong>${escapeHtml(p.plan_name || 'Plan')}</strong> — ${escapeHtml(p.price || 'Custom')}${p.billing_cycle ? ` ${escapeHtml(p.billing_cycle)}` : ''}</div>`
          )
          .join('')
      : `<p style="color:#6B7280;">No individual plan breakdown documented yet.</p>`;

  const hasPricing = tools.some((t) => (t.plans || []).length > 0 || t.pricingModel || t.startingPrice);
  const pricingHTML = hasPricing
    ? `<h2 id="pricing" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pricing Compared</h2>
    <p style="color:#6B7280;font-size:0.9rem;margin-bottom:1rem;">Starting price reflects the lowest paid tier, not the full cost for every team size or usage level.</p>
    <div style="display:grid;grid-template-columns:${tools.map(() => '1fr').join(' ')};gap:1rem;">
      ${tools.map((t) => `<div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(t.name)}</h3>${pricingColumn(t.plans)}</div>`).join('')}
    </div>`
    : '';

  const prosConsColumn = (pros = [], cons = []) => `
      ${pros.length ? `<p style="font-weight:600;color:#047857;margin-bottom:0.35rem;">Pros</p><ul style="list-style:disc;padding-left:1.25rem;margin-bottom:0.75rem;">${pros.slice(0, 6).map((p) => `<li style="color:#374151;margin-bottom:0.25rem;">${escapeHtml(p)}</li>`).join('')}</ul>` : ''}
      ${cons.length ? `<p style="font-weight:600;color:#BE123C;margin-bottom:0.35rem;">Cons</p><ul style="list-style:disc;padding-left:1.25rem;">${cons.slice(0, 6).map((c) => `<li style="color:#374151;margin-bottom:0.25rem;">${escapeHtml(c)}</li>`).join('')}</ul>` : ''}`;

  const hasProsCons = tools.some((t) => (t.pros || []).length || (t.cons || []).length);
  const prosConsHTML = hasProsCons
    ? `<h2 id="pros-and-cons" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Pros &amp; Cons</h2>
      <div style="display:grid;grid-template-columns:${tools.map(() => '1fr').join(' ')};gap:1rem;">
        ${tools.map((t) => `<div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(t.name)}</h3>${prosConsColumn(t.pros, t.cons)}</div>`).join('')}
      </div>`
    : '';

  const useCasesColumn = (useCases = []) =>
    useCases.length
      ? `<ul style="list-style:disc;padding-left:1.25rem;">${useCases.slice(0, 4).map((u) => `<li style="color:#374151;margin-bottom:0.35rem;"><strong>${escapeHtml(u.title)}</strong> — ${escapeHtml(u.description)}</li>`).join('')}</ul>`
      : '';

  const whoShouldChooseHTML = groupComparisonContent?.bestFor
    ? `<div style="display:grid;grid-template-columns:${tools.map(() => '1fr').join(' ')};gap:0.75rem;margin-bottom:1rem;">
        ${tools
          .filter((t) => groupComparisonContent.bestFor[t.slug])
          .map((t) => `<div style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><strong>Choose ${escapeHtml(t.name)}:</strong> ${escapeHtml(groupComparisonContent.bestFor[t.slug])}</div>`)
          .join('')}
      </div>`
    : '';

  const hasUseCases = tools.some((t) => (t.useCases || []).length > 0);
  const useCasesHTML =
    hasUseCases || groupComparisonContent?.bestFor
      ? `<h2 id="use-cases" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Use Cases</h2>
      ${whoShouldChooseHTML}
      ${
        hasUseCases
          ? `<div style="display:grid;grid-template-columns:${tools.map(() => '1fr').join(' ')};gap:1rem;">
        ${tools.map((t) => `<div><h3 style="font-weight:600;color:#111827;margin-bottom:0.5rem;">${escapeHtml(t.name)}</h3>${useCasesColumn(t.useCases)}</div>`).join('')}
      </div>`
          : ''
      }`
      : '';

  const hasScreenshots = tools.some((t) => (t.screenshots || []).length > 0);
  const screenshotsHTML = hasScreenshots
    ? `<h2 id="screenshots" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Screenshots</h2>
      ${tools
        .filter((t) => (t.screenshots || []).length > 0)
        .map(
          (t) => `<h3 style="font-weight:600;color:#111827;margin-top:1rem;margin-bottom:0.5rem;">${escapeHtml(t.name)}</h3>
        <div style="display:flex;flex-wrap:wrap;gap:0.75rem;">
          ${t.screenshots
            .slice(0, 6)
            .map(
              (s) =>
                `<img src="${escapeHtml(s.image_url)}" alt="${escapeHtml(s.caption || `${t.name} screenshot`)}" loading="lazy" style="width:220px;height:140px;object-fit:cover;border-radius:0.5rem;border:1px solid #E5E7EB;" />`
            )
            .join('')}
        </div>`
        )
        .join('\n      ')}`
    : '';

  const relatedComparisonsHTML = relatedGroupComparisons.length
    ? `<h2 id="related-comparisons" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Related Comparisons</h2>
      <ul style="list-style:none;padding:0;display:grid;grid-template-columns:1fr 1fr;gap:0.75rem;">
        ${relatedGroupComparisons
          .map(
            (c) =>
              `<li style="border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem;"><a href="/compare/${escapeHtml(c.slug)}/" style="color:#4F46E5;font-weight:500;">${escapeHtml(c.title)}</a></li>`
          )
          .join('')}
      </ul>`
    : '';

  const faqHTML = groupComparisonContent?.faqs?.length
    ? `<h2 id="faq" style="font-size:1.5rem;font-weight:700;margin-top:2rem;margin-bottom:1rem;color:#111827;">Frequently Asked Questions</h2>
      <div>${groupComparisonContent.faqs.map((faq) => `<details style="margin-bottom:0.75rem;border:1px solid #E5E7EB;border-radius:0.5rem;padding:0.75rem 1rem;"><summary style="font-weight:600;cursor:pointer;">${escapeHtml(faq.question)}</summary><p style="margin-top:0.5rem;color:#374151;line-height:1.6;">${escapeHtml(faq.answer)}</p></details>`).join('\n        ')}</div>`
    : '';

  const exploreMoreHTML = `<p style="margin-top:2rem;">${tools.map((t) => `<a href="/tools/${escapeHtml(t.slug)}/" style="color:#4F46E5;">Read the full ${escapeHtml(t.name)} review</a>`).join(' · ')}</p>`;

  return `
    <!-- PRERENDER_OK: Static HTML for crawlers -->
    <div style="max-width:960px;margin:0 auto;padding:20px;font-family:system-ui,-apple-system,sans-serif;">
      <nav style="font-size:0.85rem;color:#6B7280;margin-bottom:1rem;">
        <a href="/" style="color:#6B7280;">Home</a> ·
        <a href="/compare/" style="color:#6B7280;">Compare</a> ·
        ${escapeHtml(groupComparison.title)}
      </nav>
      <h1 style="font-size:2.25rem;font-weight:800;margin-bottom:1rem;color:#111827;">${escapeHtml(groupComparison.title)}</h1>
      ${seoData.description ? `<p id="verdict" style="font-size:1.15rem;color:#374151;line-height:1.6;margin-bottom:1rem;">${escapeHtml(seoData.description)}</p>` : ''}
      ${toolCardsHTML}
      ${factsTableHTML}
      ${highlightsHTML}
      ${featureMatrixHTML}
      ${pricingHTML}
      ${prosConsHTML}
      ${useCasesHTML}
      ${screenshotsHTML}
      ${faqHTML}
      ${relatedComparisonsHTML}
      ${exploreMoreHTML}
      <noscript>
        <p style="background:#FEF3C7;border:1px solid #F59E0B;padding:1rem;border-radius:0.5rem;margin-top:2rem;">
          JavaScript is required for the full interactive experience.
        </p>
      </noscript>
    </div>
  `;
}
