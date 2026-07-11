import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ArrowLeft, FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import LazyLoad from '../components/LazyLoad';
import { supabase } from '../lib/supabase';
import { getToolContent } from '../data/toolContent';
import { useRecentlyViewedTools } from '../hooks/useRecentlyViewedTools';
import { formatLastUpdated, formatSchemaDate } from '../utils/formatLastUpdated';
import type { ToolCardData } from '../components/ToolCard';
import type { TaxonomyRef, ScreenshotItem, PricingPlanItem, IntegrationItem, ReviewItem } from '../components/tools/detail/types';
import ToolBreadcrumbs from '../components/tools/detail/ToolBreadcrumbs';
import ToolHero from '../components/tools/detail/ToolHero';
import ToolFactsSidebar, { PLATFORM_TAGS } from '../components/tools/detail/ToolFactsSidebar';
import TableOfContents, { type TocSection } from '../components/tools/detail/TableOfContents';
import QuickSummarySection from '../components/tools/detail/QuickSummarySection';
import KeyFactsSection from '../components/tools/detail/KeyFactsSection';
import LongFormContent from '../components/tools/detail/LongFormContent';
import FeatureGrid from '../components/tools/detail/FeatureGrid';
import ProsConsSection from '../components/tools/detail/ProsConsSection';
import PricingSection from '../components/tools/detail/PricingSection';
import FAQSection from '../components/tools/detail/FAQSection';
import UseCasesSection from '../components/tools/detail/UseCasesSection';
import ToolCardRow from '../components/tools/detail/ToolCardRow';
import ToolConversionBand from '../components/tools/detail/ToolConversionBand';
import ToolDetailSkeleton from '../components/tools/detail/ToolDetailSkeleton';

interface ToolDetail {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  website: string | null;
  affiliate_link: string | null;
  short_description: string | null;
  long_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  youtube_url: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
  featured: boolean;
  updated_at: string | null;
  founded_year: number | null;
  company_size: string | null;
  headquarters: string | null;
  languages: string[];
}

const TOOL_CARD_COLUMNS = 'slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured';

// Defensive, client-side check before rendering anything as a clickable link or
// image source. The admin edge function already rejects non-http(s) URLs at
// write time, but this ensures the page itself never trusts stored data blindly
// (e.g. rows written before validation existed, or edited directly in the DB).
function isSafeHttpUrl(value: string | null | undefined): value is string {
  if (!value) return false;
  if (value.startsWith('//')) return false;
  try {
    const parsed = new URL(value);
    return parsed.protocol === 'http:' || parsed.protocol === 'https:';
  } catch {
    return false;
  }
}

function parsePriceNumber(price: string | null): number | null {
  if (!price) return null;
  const match = price.replace(/,/g, '').match(/(\d+(\.\d+)?)/);
  return match ? Number(match[1]) : null;
}

// Real data only — mirrors scripts/tool-seo-generator.js's generateToolDescription
// so the prerendered and hydrated meta descriptions agree. Never a generic
// templated sentence; returns null when the tool genuinely has neither field
// (the build-time prerender treats that as a validation failure, not a page
// that should ship with fabricated copy).
function generateMetaDescription(shortDescription: string | null, longDescription: string | null): string | null {
  const short = shortDescription?.trim();
  if (short) return short.length > 160 ? `${short.slice(0, 159).trimEnd()}…` : short;
  const long = longDescription?.trim().split(/\n+/)[0];
  if (long) return long.length > 160 ? `${long.slice(0, 159).trimEnd()}…` : long;
  return null;
}

export default function ToolDetailPage() {
  const { toolSlug } = useParams<{ toolSlug: string }>();
  const [tool, setTool] = useState<ToolDetail | null>(null);
  const [categories, setCategories] = useState<TaxonomyRef[]>([]);
  const [primaryCategory, setPrimaryCategory] = useState<TaxonomyRef | null>(null);
  const [tags, setTags] = useState<TaxonomyRef[]>([]);
  const [screenshots, setScreenshots] = useState<ScreenshotItem[]>([]);
  const [pricingPlans, setPricingPlans] = useState<PricingPlanItem[]>([]);
  const [integrations, setIntegrations] = useState<IntegrationItem[]>([]);
  const [reviews, setReviews] = useState<ReviewItem[]>([]);
  const [relatedTools, setRelatedTools] = useState<ToolCardData[]>([]);
  const [recentTools, setRecentTools] = useState<ToolCardData[]>([]);
  const [editorPicks, setEditorPicks] = useState<ToolCardData[]>([]);
  const [recentlyUpdated, setRecentlyUpdated] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  const recentSlugs = useRecentlyViewedTools(toolSlug || '');

  useEffect(() => {
    if (!toolSlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tools')
      .select(
        'id, slug, name, logo, website, affiliate_link, short_description, long_description, pricing_model, starting_price, youtube_url, rating, review_count, verified, featured, updated_at, founded_year, company_size, headquarters, languages'
      )
      .eq('slug', toolSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(({ data }) => {
        if (!data) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setTool({ ...data, languages: data.languages || [] });

        Promise.all([
          supabase
            .from('tool_category_links')
            .select('category_id, primary_category, tool_categories!inner(slug, name, status)')
            .eq('tool_id', data.id)
            .eq('tool_categories.status', 'published'),
          supabase.from('tool_tag_links').select('tool_tags(slug, name)').eq('tool_id', data.id),
          supabase.from('tool_screenshots').select('id, image_url, caption').eq('tool_id', data.id).order('sort_order', { ascending: true }),
          supabase.from('tool_pricing_plans').select('id, plan_name, price, billing_cycle, description, features, sort_order').eq('tool_id', data.id).order('sort_order', { ascending: true }),
          supabase.from('tool_integrations').select('id, integration_name, integration_slug, integration_logo, description').eq('tool_id', data.id),
          supabase.from('tool_reviews').select('id, author_name, author_title, rating, quote, source, created_at').eq('tool_id', data.id).order('sort_order', { ascending: true }),
          supabase.from('tools').select(TOOL_CARD_COLUMNS).eq('featured', true).eq('status', 'published').neq('id', data.id).order('rating', { ascending: false }).limit(6),
          supabase.from('tools').select(TOOL_CARD_COLUMNS).eq('status', 'published').neq('id', data.id).order('updated_at', { ascending: false }).limit(6),
        ]).then(([catResult, tagResult, screenshotResult, pricingResult, integrationsResult, reviewsResult, editorPicksResult, recentlyUpdatedResult]) => {
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const categoryLinks = (catResult.data || []) as any[];
          const cats: TaxonomyRef[] = categoryLinks.map((r) => r.tool_categories).filter(Boolean);
          const primaryLink = categoryLinks.find((r) => r.primary_category) || categoryLinks[0] || null;
          const primary: TaxonomyRef | null = primaryLink?.tool_categories || null;
          const primaryCategoryId: string | null = primaryLink?.category_id || null;

          setCategories(cats);
          setPrimaryCategory(primary);
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          setTags((tagResult.data || []).map((r: any) => r.tool_tags).filter(Boolean));
          setScreenshots(screenshotResult.data || []);
          setPricingPlans(
            (pricingResult.data || []).map((p) => ({
              ...p,
              features: Array.isArray(p.features) ? p.features : [],
            }))
          );
          setIntegrations(integrationsResult.data || []);
          setReviews(reviewsResult.data || []);
          setEditorPicks(editorPicksResult.data || []);
          setRecentlyUpdated(recentlyUpdatedResult.data || []);

          if (primaryCategoryId) {
            supabase
              .from('tool_category_links')
              .select('tools!inner(slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, status)')
              .eq('category_id', primaryCategoryId)
              .neq('tool_id', data.id)
              .eq('tools.status', 'published')
              .order('featured', { ascending: false, referencedTable: 'tools' })
              .order('rating', { ascending: false, referencedTable: 'tools' })
              .limit(8)
              .then(({ data: relatedLinks }) => {
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                const related = ((relatedLinks || []) as any[]).map((r) => r.tools).filter(Boolean);
                setRelatedTools(related);
              });
          }

          setLoading(false);
        });
      });
  }, [toolSlug]);

  useEffect(() => {
    if (recentSlugs.length === 0) {
      setRecentTools([]);
      return;
    }
    supabase
      .from('tools')
      .select(TOOL_CARD_COLUMNS)
      .in('slug', recentSlugs)
      .eq('status', 'published')
      .then(({ data }) => {
        const bySlug = new Map((data || []).map((t) => [t.slug, t]));
        setRecentTools(recentSlugs.map((slug) => bySlug.get(slug)).filter((t): t is ToolCardData => Boolean(t)));
      });
  }, [recentSlugs]);

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <SoftwareHeader />
        <ToolDetailSkeleton />
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tool) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Tool Not Found | Gappsy" description="This tool could not be found." path={`/tools/${toolSlug || ''}`} noindex />
        <SoftwareHeader />
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">This tool isn't available</h1>
          <p className="text-slate-500 mb-6">It doesn't exist, or it's no longer published.</p>
          <Link to="/tools" className="inline-flex items-center gap-1.5 text-indigo-600 font-semibold hover:text-indigo-700">
            <ArrowLeft className="w-4 h-4" />
            Browse the directory
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const websiteUrl = isSafeHttpUrl(tool.website) ? tool.website : null;
  const affiliateUrl = isSafeHttpUrl(tool.affiliate_link) ? tool.affiliate_link : null;
  const safeLogo = isSafeHttpUrl(tool.logo) ? tool.logo : null;
  const safeScreenshots = screenshots.filter((shot) => isSafeHttpUrl(shot.image_url));
  const extendedContent = getToolContent(tool.slug);
  const tagSlugs = new Set(tags.map((t) => t.slug));
  const hasAI = tagSlugs.has('ai');
  const hasFreePlan = tagSlugs.has('free-plan') || tagSlugs.has('freemium');
  const hasFreeTrial = tagSlugs.has('free-trial');
  const hasApi = tagSlugs.has('api');
  const platforms = PLATFORM_TAGS.filter((p) => tagSlugs.has(p.slug));
  const platformsLabel = platforms.length > 0 ? platforms.map((p) => p.label).join(', ') : null;
  const updatedLabel = formatLastUpdated(tool.updated_at);
  const metaDescription = generateMetaDescription(tool.short_description, tool.long_description) || tool.name;
  const standoutFeature = extendedContent?.features[0]
    ? { title: extendedContent.features[0].title, description: extendedContent.features[0].description }
    : null;

  const tocSections: TocSection[] = [
    ...(extendedContent?.longForm.filter((b) => b.level === 2).map((b) => ({ id: b.id, label: b.heading })) || []),
    ...(extendedContent?.features.length ? [{ id: 'features', label: 'Features' }] : []),
    ...(extendedContent && (extendedContent.pros.length || extendedContent.cons.length) ? [{ id: 'pros-and-cons', label: 'Pros & Cons' }] : []),
    ...(pricingPlans.length ? [{ id: 'pricing', label: 'Pricing' }] : []),
    ...(safeScreenshots.length ? [{ id: 'screenshots', label: 'Screenshots' }] : []),
    ...(tool.youtube_url ? [{ id: 'video', label: 'Video' }] : []),
    ...(integrations.length ? [{ id: 'integrations', label: 'Integrations' }] : []),
    ...(extendedContent?.useCases.length ? [{ id: 'use-cases', label: 'Use Cases' }] : []),
    ...(reviews.length ? [{ id: 'reviews', label: 'Reviews' }] : []),
    ...(extendedContent?.faqs.length ? [{ id: 'faq', label: 'FAQ' }] : []),
    ...(extendedContent?.alternatives.length ? [{ id: 'alternatives', label: 'Alternatives' }] : []),
    ...(extendedContent?.comparisons.length ? [{ id: 'comparisons', label: 'Comparisons' }] : []),
  ];

  const offers = pricingPlans
    .map((plan) => {
      const price = parsePriceNumber(plan.price);
      if (price === null) return null;
      return { '@type': 'Offer', name: plan.plan_name || undefined, price, priceCurrency: 'USD' };
    })
    .filter(Boolean);

  const reviewJsonLd = reviews.map((review) => ({
    '@type': 'Review',
    author: { '@type': 'Person', name: review.author_name },
    reviewRating: { '@type': 'Rating', ratingValue: review.rating, bestRating: 5, worstRating: 1 },
    reviewBody: review.quote,
    ...(review.created_at ? { datePublished: formatSchemaDate(review.created_at) || undefined } : {}),
  }));

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={`${tool.name} Review, Pricing, Features & Alternatives | Gappsy`}
        description={metaDescription}
        path={`/tools/${tool.slug}`}
        ogImage={safeLogo || '/og/default-og-image.svg'}
        breadcrumbs={[{ name: 'Tools', path: '/tools' }, { name: tool.name, path: `/tools/${tool.slug}` }]}
        jsonLd={[
          {
            '@type': 'SoftwareApplication',
            '@id': `https://www.gappsy.com/tools/${tool.slug}/#software`,
            name: tool.name,
            description: tool.short_description || tool.long_description || undefined,
            image: safeLogo || undefined,
            url: websiteUrl || undefined,
            applicationCategory: primaryCategory?.name,
            ...(offers.length > 0 ? { offers } : {}),
            ...(tool.rating > 0 && tool.review_count > 0
              ? { aggregateRating: { '@type': 'AggregateRating', ratingValue: tool.rating, reviewCount: tool.review_count } }
              : {}),
            ...(reviewJsonLd.length > 0 ? { review: reviewJsonLd } : {}),
          },
          ...(extendedContent?.faqs.length
            ? [
                {
                  '@type': 'FAQPage',
                  '@id': `https://www.gappsy.com/tools/${tool.slug}/#faq`,
                  mainEntity: extendedContent.faqs.map((faq) => ({
                    '@type': 'Question',
                    name: faq.question,
                    acceptedAnswer: { '@type': 'Answer', text: faq.answer },
                  })),
                },
              ]
            : []),
        ]}
      />

      <SoftwareHeader />

      <div className="max-w-6xl mx-auto px-4 sm:px-6 pt-6">
        <ToolBreadcrumbs
          items={[
            { name: 'Tools', path: '/tools' },
            ...(primaryCategory ? [{ name: primaryCategory.name, path: `/tool-categories/${primaryCategory.slug}` }] : []),
            { name: tool.name },
          ]}
        />
      </div>

      <ToolHero
        name={tool.name}
        logo={safeLogo}
        shortDescription={tool.short_description}
        verified={tool.verified}
        featured={tool.featured}
        hasAI={hasAI}
        rating={tool.rating}
        reviewCount={tool.review_count}
        pricingModel={tool.pricing_model}
        startingPrice={tool.starting_price}
        primaryCategory={primaryCategory}
        updatedAt={tool.updated_at}
        websiteUrl={websiteUrl}
        affiliateUrl={affiliateUrl}
        reviewerNames={reviews.map((r) => r.author_name)}
      />

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-16">
        <div className="lg:grid lg:grid-cols-[200px_1fr] lg:gap-8">
          <div className="hidden lg:block">
            <TableOfContents sections={tocSections} />
          </div>

          {/* Content stack: Zone A pairs the narrative with the facts sidebar;
              Zone B (below) drops the sidebar column entirely once its content
              naturally ends, so grids/cards get the full content width instead
              of leaving an empty column beside a short sidebar. */}
          <div className="min-w-0 space-y-12">
            <div className="lg:grid lg:grid-cols-[1fr_300px] lg:gap-8 lg:items-start">
              <div className="space-y-10 min-w-0">
                <QuickSummarySection
                  toolName={tool.name}
                  categoryName={primaryCategory?.name || null}
                  pricingModel={tool.pricing_model}
                  startingPrice={tool.starting_price}
                  platformsLabel={platformsLabel}
                  standoutFeature={standoutFeature}
                />

                <KeyFactsSection
                  toolName={tool.name}
                  shortDescription={extendedContent ? null : tool.short_description}
                  categoryName={primaryCategory?.name || null}
                  pricingModel={tool.pricing_model}
                  startingPrice={tool.starting_price}
                  platformsLabel={platformsLabel}
                  hasFreePlan={hasFreePlan}
                  hasApi={hasApi}
                  verified={tool.verified}
                  updatedLabel={updatedLabel}
                />

                {extendedContent ? (
                  <LongFormContent blocks={extendedContent.longForm} />
                ) : (
                  tool.long_description && (
                    <section id="overview" className="scroll-mt-24">
                      <p className="text-[17px] sm:text-lg text-slate-700 leading-[1.75] max-w-[70ch] whitespace-pre-line">
                        {tool.long_description}
                      </p>
                    </section>
                  )
                )}
              </div>

              <ToolFactsSidebar
                slug={tool.slug}
                name={tool.name}
                rating={tool.rating}
                reviewCount={tool.review_count}
                pricingModel={tool.pricing_model}
                startingPrice={tool.starting_price}
                websiteUrl={websiteUrl}
                affiliateUrl={affiliateUrl}
                categories={categories}
                tags={tags}
                integrationCount={integrations.length}
                verified={tool.verified}
                updatedAt={tool.updated_at}
                foundedYear={tool.founded_year}
                companySize={tool.company_size}
                headquarters={tool.headquarters}
                languages={tool.languages}
              />
            </div>

            {/* Zone B — full width, no sidebar column */}
            <div className="space-y-14 lg:space-y-16">
              {extendedContent && <FeatureGrid toolName={tool.name} features={extendedContent.features} />}
              <PricingSection toolName={tool.name} plans={pricingPlans} websiteUrl={websiteUrl} affiliateUrl={affiliateUrl} />
              {extendedContent && <ProsConsSection toolName={tool.name} pros={extendedContent.pros} cons={extendedContent.cons} />}
              <LazyLoad component={() => import('../components/tools/detail/ScreenshotGallery')} componentProps={{ toolName: tool.name, screenshots: safeScreenshots, websiteUrl }} />
              <LazyLoad component={() => import('../components/tools/detail/VideoSection')} componentProps={{ toolName: tool.name, youtubeUrl: tool.youtube_url, transcript: extendedContent?.transcript }} />
              <LazyLoad component={() => import('../components/tools/detail/IntegrationsSection')} componentProps={{ toolName: tool.name, integrations }} />
              {extendedContent && <UseCasesSection toolName={tool.name} useCases={extendedContent.useCases} />}
              <LazyLoad component={() => import('../components/tools/detail/ReviewsSection')} componentProps={{ toolName: tool.name, reviews }} />
              {extendedContent && <FAQSection toolName={tool.name} faqs={extendedContent.faqs} />}
              {extendedContent && (
                <LazyLoad component={() => import('../components/tools/detail/AlternativesSection')} componentProps={{ toolName: tool.name, alternatives: extendedContent.alternatives }} />
              )}
              {extendedContent && (
                <LazyLoad component={() => import('../components/tools/detail/ComparisonLinksSection')} componentProps={{ toolName: tool.name, comparisons: extendedContent.comparisons }} />
              )}
            </div>
          </div>
        </div>
      </main>

      <div className="max-w-6xl mx-auto px-4 sm:px-6 space-y-12 pb-16">
        <ToolCardRow eyebrow="Same Category" title={`More tools like ${tool.name}`} tools={relatedTools} minToShow={2} />
        <LazyLoad
          component={() => import('../components/tools/detail/ToolCardRow')}
          componentProps={{ eyebrow: 'Editor Picks', title: 'Hand-picked by our editors', tools: editorPicks, minToShow: 2 }}
        />
        <LazyLoad
          component={() => import('../components/tools/detail/ToolCardRow')}
          componentProps={{ eyebrow: 'Recently Updated', title: 'Fresh listings worth a look', tools: recentlyUpdated, minToShow: 2 }}
        />
        <ToolCardRow eyebrow="History" title="Recently viewed" tools={recentTools} minToShow={1} />
        <ToolConversionBand
          toolName={tool.name}
          websiteUrl={websiteUrl}
          affiliateUrl={affiliateUrl}
          hasVideo={Boolean(tool.youtube_url)}
          hasFreeOffering={hasFreePlan || hasFreeTrial}
        />
      </div>

      <FooterWrapper />
    </div>
  );
}
