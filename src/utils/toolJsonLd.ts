import { formatSchemaDate } from './formatLastUpdated';
import type { PricingPlanItem, ReviewItem } from '../components/tools/detail/types';

// Extracted from ToolDetailPage.tsx's inline JSON-LD construction so the
// admin editor's JSON-LD preview (Publishing tab) renders exactly what the
// public page emits — same function, not a re-implementation that could
// silently drift.

export function parsePriceNumber(price: string | null): number | null {
  if (!price) return null;
  const match = price.replace(/,/g, '').match(/(\d+(\.\d+)?)/);
  return match ? Number(match[1]) : null;
}

interface BuildToolJsonLdInput {
  slug: string;
  name: string;
  shortDescription: string | null;
  longDescription: string | null;
  logo: string | null;
  websiteUrl: string | null;
  primaryCategoryName: string | null | undefined;
  rating: number;
  reviewCount: number;
  pricingPlans: Pick<PricingPlanItem, 'plan_name' | 'price'>[];
  reviews: Pick<ReviewItem, 'author_name' | 'rating' | 'quote' | 'created_at'>[];
  faqs: Array<{ question: string; answer: string }>;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function buildToolJsonLd(input: BuildToolJsonLdInput): Record<string, any>[] {
  const offers = input.pricingPlans
    .map((plan) => {
      const price = parsePriceNumber(plan.price);
      if (price === null) return null;
      return { '@type': 'Offer', name: plan.plan_name || undefined, price, priceCurrency: 'USD' };
    })
    .filter(Boolean);

  const reviewJsonLd = input.reviews.map((review) => ({
    '@type': 'Review',
    author: { '@type': 'Person', name: review.author_name },
    reviewRating: { '@type': 'Rating', ratingValue: review.rating, bestRating: 5, worstRating: 1 },
    reviewBody: review.quote,
    ...(review.created_at ? { datePublished: formatSchemaDate(review.created_at) || undefined } : {}),
  }));

  return [
    {
      '@type': 'SoftwareApplication',
      '@id': `https://www.gappsy.com/tools/${input.slug}/#software`,
      name: input.name,
      description: input.shortDescription || input.longDescription || undefined,
      image: input.logo || undefined,
      url: input.websiteUrl || undefined,
      applicationCategory: input.primaryCategoryName || undefined,
      ...(offers.length > 0 ? { offers } : {}),
      ...(input.rating > 0 && input.reviewCount > 0
        ? { aggregateRating: { '@type': 'AggregateRating', ratingValue: input.rating, reviewCount: input.reviewCount } }
        : {}),
      ...(reviewJsonLd.length > 0 ? { review: reviewJsonLd } : {}),
    },
    ...(input.faqs.length
      ? [
          {
            '@type': 'FAQPage',
            '@id': `https://www.gappsy.com/tools/${input.slug}/#faq`,
            mainEntity: input.faqs.map((faq) => ({
              '@type': 'Question',
              name: faq.question,
              acceptedAnswer: { '@type': 'Answer', text: faq.answer },
            })),
          },
        ]
      : []),
  ];
}
