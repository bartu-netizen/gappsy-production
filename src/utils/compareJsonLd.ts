import { parsePriceNumber } from './toolJsonLd';

// Shared JSON-LD builder for /compare pages (2-tool and 3-tool). Compare
// pages already emit TechArticle + FAQPage + BreadcrumbList (via
// EntitySEOTags), but — unlike /tools/:slug pages, which emit a
// SoftwareApplication entity per buildToolJsonLd in toolJsonLd.ts — they
// never actually describe the software being compared in structured data.
// This fills that gap with a minimal ItemList of SoftwareApplication
// entities (name, url, rating, starting price), one per tool in the
// comparison, so both classic SEO rich results and LLM answer engines can
// see what's actually being compared, not just the article wrapper.

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function buildCompareItemListJsonLd(
  tools: { slug: string; name: string; logo: string | null; rating: number; reviewCount: number; pricingModel: string | null; startingPrice: string | null }[],
  canonicalUrl: string
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Record<string, any>[] {
  if (tools.length === 0) return [];

  return [
    {
      '@type': 'ItemList',
      '@id': `${canonicalUrl}#compared-tools`,
      name: `Tools compared: ${tools.map((t) => t.name).join(' vs ')}`,
      itemListElement: tools.map((tool, index) => ({
        '@type': 'ListItem',
        position: index + 1,
        item: {
          '@type': 'SoftwareApplication',
          '@id': `https://gappsy.com/tools/${tool.slug}/#software`,
          name: tool.name,
          url: `https://gappsy.com/tools/${tool.slug}/`,
          ...(tool.logo ? { image: tool.logo } : {}),
          ...(tool.pricingModel ? { applicationCategory: 'BusinessApplication' } : {}),
          ...(() => {
            const price = parsePriceNumber(tool.startingPrice);
            return price !== null ? { offers: { '@type': 'Offer', price, priceCurrency: 'USD', description: tool.pricingModel || undefined } } : {};
          })(),
          ...(tool.rating > 0
            ? { aggregateRating: { '@type': 'AggregateRating', ratingValue: tool.rating, reviewCount: tool.reviewCount, bestRating: 5, worstRating: 1 } }
            : {}),
        },
      })),
    },
  ];
}
