import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ArrowLeft, FolderTree } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import { supabase } from '../lib/supabase';
import { getToolContent } from '../data/toolContent';
import { useRecentlyViewedTools } from '../hooks/useRecentlyViewedTools';
import type { ToolCardData } from '../components/ToolCard';
import type { TaxonomyRef, ScreenshotItem, PricingPlanItem, IntegrationItem } from '../components/tools/detail/types';
import ToolBreadcrumbs from '../components/tools/detail/ToolBreadcrumbs';
import ToolHero from '../components/tools/detail/ToolHero';
import ToolFactsSidebar from '../components/tools/detail/ToolFactsSidebar';
import TableOfContents, { type TocSection } from '../components/tools/detail/TableOfContents';
import LongFormContent from '../components/tools/detail/LongFormContent';
import FeatureGrid from '../components/tools/detail/FeatureGrid';
import ProsConsSection from '../components/tools/detail/ProsConsSection';
import PricingSection from '../components/tools/detail/PricingSection';
import ScreenshotGallery from '../components/tools/detail/ScreenshotGallery';
import VideoSection from '../components/tools/detail/VideoSection';
import IntegrationsSection from '../components/tools/detail/IntegrationsSection';
import FAQSection from '../components/tools/detail/FAQSection';
import UseCasesSection from '../components/tools/detail/UseCasesSection';
import AlternativesSection from '../components/tools/detail/AlternativesSection';
import ComparisonLinksSection from '../components/tools/detail/ComparisonLinksSection';
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
}

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

export default function ToolDetailPage() {
  const { toolSlug } = useParams<{ toolSlug: string }>();
  const [tool, setTool] = useState<ToolDetail | null>(null);
  const [categories, setCategories] = useState<TaxonomyRef[]>([]);
  const [primaryCategory, setPrimaryCategory] = useState<TaxonomyRef | null>(null);
  const [tags, setTags] = useState<TaxonomyRef[]>([]);
  const [screenshots, setScreenshots] = useState<ScreenshotItem[]>([]);
  const [pricingPlans, setPricingPlans] = useState<PricingPlanItem[]>([]);
  const [integrations, setIntegrations] = useState<IntegrationItem[]>([]);
  const [relatedTools, setRelatedTools] = useState<ToolCardData[]>([]);
  const [recentTools, setRecentTools] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  const recentSlugs = useRecentlyViewedTools(toolSlug || '');

  useEffect(() => {
    if (!toolSlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tools')
      .select('id, slug, name, logo, website, affiliate_link, short_description, long_description, pricing_model, starting_price, youtube_url, rating, review_count, verified, featured, updated_at')
      .eq('slug', toolSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(({ data }) => {
        if (!data) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setTool(data);

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
        ]).then(([catResult, tagResult, screenshotResult, pricingResult, integrationsResult]) => {
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

          if (primaryCategoryId) {
            supabase
              .from('tool_category_links')
              .select('tools!inner(slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, status)')
              .eq('category_id', primaryCategoryId)
              .neq('tool_id', data.id)
              .eq('tools.status', 'published')
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
      .select('slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured')
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
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <ToolDetailSkeleton />
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tool) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Tool Not Found | Gappsy" description="This tool could not be found." path={`/tools/${toolSlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
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
  const hasAI = tags.some((t) => t.slug === 'ai');

  const tocSections: TocSection[] = [
    ...(extendedContent?.longForm.filter((b) => b.level === 2).map((b) => ({ id: b.id, label: b.heading })) || []),
    ...(extendedContent?.features.length ? [{ id: 'features', label: 'Features' }] : []),
    ...(extendedContent && (extendedContent.pros.length || extendedContent.cons.length) ? [{ id: 'pros-and-cons', label: 'Pros & Cons' }] : []),
    ...(pricingPlans.length ? [{ id: 'pricing', label: 'Pricing' }] : []),
    ...(safeScreenshots.length ? [{ id: 'screenshots', label: 'Screenshots' }] : []),
    ...(tool.youtube_url ? [{ id: 'video', label: 'Video' }] : []),
    ...(integrations.length ? [{ id: 'integrations', label: 'Integrations' }] : []),
    ...(extendedContent?.useCases.length ? [{ id: 'use-cases', label: 'Use Cases' }] : []),
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

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={`${tool.name} — Reviews, Pricing & Features | Gappsy`}
        description={tool.short_description || `Learn about ${tool.name}: pricing, features, and reviews.`}
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

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <div className="max-w-6xl mx-auto px-4 sm:px-6">
        <ToolBreadcrumbs
          items={[
            { name: 'Tools', path: '/tools' },
            ...(primaryCategory ? [{ name: primaryCategory.name, path: `/tool-categories/${primaryCategory.slug}` }] : []),
            { name: tool.name },
          ]}
        />
      </div>

      <ToolHero
        slug={tool.slug}
        name={tool.name}
        logo={safeLogo}
        shortDescription={tool.short_description}
        verified={tool.verified}
        featured={tool.featured}
        trending={false}
        hasAI={hasAI}
        rating={tool.rating}
        reviewCount={tool.review_count}
        pricingModel={tool.pricing_model}
        startingPrice={tool.starting_price}
        primaryCategory={primaryCategory}
        updatedAt={tool.updated_at}
        websiteUrl={websiteUrl}
        affiliateUrl={affiliateUrl}
      />

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-16">
        <div className="grid grid-cols-1 lg:grid-cols-[200px_1fr_300px] gap-8">
          <div className="hidden lg:block">
            <TableOfContents sections={tocSections} />
          </div>

          <div className="space-y-12 min-w-0">
            {extendedContent ? (
              <>
                <LongFormContent blocks={extendedContent.longForm} />
                <FeatureGrid toolName={tool.name} features={extendedContent.features} />
                <ProsConsSection toolName={tool.name} pros={extendedContent.pros} cons={extendedContent.cons} />
                <PricingSection toolName={tool.name} plans={pricingPlans} />
                <ScreenshotGallery toolName={tool.name} screenshots={safeScreenshots} />
                <VideoSection toolName={tool.name} youtubeUrl={tool.youtube_url} transcript={extendedContent.transcript} />
                <IntegrationsSection toolName={tool.name} integrations={integrations} />
                <UseCasesSection toolName={tool.name} useCases={extendedContent.useCases} />
                <FAQSection toolName={tool.name} faqs={extendedContent.faqs} />
                <AlternativesSection toolName={tool.name} alternatives={extendedContent.alternatives} />
                <ComparisonLinksSection toolName={tool.name} comparisons={extendedContent.comparisons} />
              </>
            ) : (
              <>
                {(tool.long_description || tool.short_description) && (
                  <section id="overview" className="scroll-mt-24">
                    {tool.long_description ? (
                      <p className="text-[17px] sm:text-lg text-slate-700 leading-relaxed whitespace-pre-line">
                        {tool.long_description}
                      </p>
                    ) : (
                      <blockquote className="border-l-2 border-indigo-200 pl-5 text-lg text-slate-700 leading-relaxed italic">
                        {tool.short_description}
                      </blockquote>
                    )}
                  </section>
                )}
                <ScreenshotGallery toolName={tool.name} screenshots={safeScreenshots} />
                <VideoSection toolName={tool.name} youtubeUrl={tool.youtube_url} />
                <IntegrationsSection toolName={tool.name} integrations={integrations} />
                <PricingSection toolName={tool.name} plans={pricingPlans} />
              </>
            )}
          </div>

          <ToolFactsSidebar
            rating={tool.rating}
            reviewCount={tool.review_count}
            pricingModel={tool.pricing_model}
            startingPrice={tool.starting_price}
            websiteUrl={websiteUrl}
            affiliateUrl={affiliateUrl}
            categories={categories}
            tags={tags}
            integrationCount={integrations.length}
          />
        </div>
      </main>

      <div className="max-w-6xl mx-auto px-4 sm:px-6 space-y-12 pb-16">
        <ToolCardRow eyebrow="Related" title={`More tools like ${tool.name}`} tools={relatedTools} minToShow={2} />
        <ToolCardRow eyebrow="History" title="Recently viewed" tools={recentTools} minToShow={1} />
        <ToolConversionBand toolName={tool.name} websiteUrl={websiteUrl} affiliateUrl={affiliateUrl} hasVideo={Boolean(tool.youtube_url)} />
      </div>

      <FooterWrapper />
    </div>
  );
}
