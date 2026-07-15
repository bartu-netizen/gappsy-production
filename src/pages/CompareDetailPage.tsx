import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link, Navigate } from 'react-router-dom';
import { ArrowLeft, FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolBreadcrumbs from '../components/tools/detail/ToolBreadcrumbs';
import TableOfContents, { type TocSection } from '../components/tools/detail/TableOfContents';
import { PLATFORM_TAGS } from '../components/tools/detail/ToolFactsSidebar';
import type { TaxonomyRef, ScreenshotItem, PricingPlanItem } from '../components/tools/detail/types';
import CompareHero from '../components/compare/CompareHero';
import CompareFactsTable from '../components/compare/CompareFactsTable';
import CompareKeyDifferences from '../components/compare/CompareKeyDifferences';
import CompareFeatureMatrix from '../components/compare/CompareFeatureMatrix';
import ComparePricing from '../components/compare/ComparePricing';
import CompareProsCons from '../components/compare/CompareProsCons';
import CompareUseCases from '../components/compare/CompareUseCases';
import CompareAlternatives from '../components/compare/CompareAlternatives';
import CompareScreenshots from '../components/compare/CompareScreenshots';
import ComparisonCard from '../components/compare/ComparisonCard';
import type { ToolOption } from '../components/compare/ToolSelectCombobox';
import type { CompareToolFacts } from '../components/compare/types';
import { supabase } from '../lib/supabase';
import { getToolContent } from '../data/toolContent';
import { getComparisonContent } from '../data/comparisonContent';
import { useRecentlyViewedComparisons } from '../hooks/useRecentlyViewedComparisons';

interface ToolRow {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  website: string | null;
  affiliate_link: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
}

interface ComparisonRow {
  id: string;
  slug: string;
  tool_a: ToolRow;
  tool_b: ToolRow;
}

interface ToolExtras {
  primaryCategory: TaxonomyRef | null;
  tagSlugs: Set<string>;
  integrationCount: number;
  pricingPlans: PricingPlanItem[];
  screenshots: ScreenshotItem[];
}

const EMPTY_EXTRAS: ToolExtras = { primaryCategory: null, tagSlugs: new Set(), integrationCount: 0, pricingPlans: [], screenshots: [] };

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

function reverseSlug(slug: string): string | null {
  const idx = slug.indexOf('-vs-');
  if (idx === -1) return null;
  const first = slug.slice(0, idx);
  const second = slug.slice(idx + 4);
  if (!first || !second) return null;
  return `${second}-vs-${first}`;
}

const COMPARISON_SELECT =
  'id, slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name,logo,website,affiliate_link,pricing_model,starting_price,rating,review_count,verified), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name,logo,website,affiliate_link,pricing_model,starting_price,rating,review_count,verified)';

async function fetchToolExtras(toolId: string): Promise<ToolExtras> {
  const [catResult, tagResult, integrationsResult, pricingResult, screenshotsResult] = await Promise.all([
    supabase
      .from('tool_category_links')
      .select('primary_category, tool_categories!inner(id, slug, name, status)')
      .eq('tool_id', toolId)
      .eq('tool_categories.status', 'published'),
    supabase.from('tool_tag_links').select('tool_tags(slug)').eq('tool_id', toolId),
    supabase.from('tool_integrations').select('id', { count: 'exact', head: true }).eq('tool_id', toolId),
    supabase
      .from('tool_pricing_plans')
      .select('id, plan_name, price, billing_cycle, description, features, sort_order')
      .eq('tool_id', toolId)
      .order('sort_order', { ascending: true }),
    supabase.from('tool_screenshots').select('id, image_url, caption').eq('tool_id', toolId).order('sort_order', { ascending: true }),
  ]);

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const categoryLinks = (catResult.data || []) as any[];
  const primaryLink = categoryLinks.find((r) => r.primary_category) || categoryLinks[0] || null;
  const primaryCategory: TaxonomyRef | null = primaryLink?.tool_categories || null;

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const tagSlugs = new Set(((tagResult.data || []) as any[]).map((r) => r.tool_tags?.slug).filter(Boolean));

  return {
    primaryCategory,
    tagSlugs,
    integrationCount: integrationsResult.count || 0,
    pricingPlans: (pricingResult.data || []).map((p) => ({ ...p, features: Array.isArray(p.features) ? p.features : [] })),
    screenshots: (screenshotsResult.data || []).filter((s) => isSafeHttpUrl(s.image_url)),
  };
}

function buildFacts(tool: ToolRow, extras: ToolExtras): CompareToolFacts {
  const platforms = PLATFORM_TAGS.filter((p) => extras.tagSlugs.has(p.slug)).map((p) => p.label);
  return {
    slug: tool.slug,
    name: tool.name,
    logo: isSafeHttpUrl(tool.logo) ? tool.logo : null,
    websiteUrl: isSafeHttpUrl(tool.website) ? tool.website : null,
    affiliateUrl: isSafeHttpUrl(tool.affiliate_link) ? tool.affiliate_link : null,
    rating: tool.rating,
    reviewCount: tool.review_count,
    verified: tool.verified,
    pricingModel: tool.pricing_model,
    startingPrice: tool.starting_price,
    primaryCategory: extras.primaryCategory,
    hasFreePlan: extras.tagSlugs.has('free-plan') || extras.tagSlugs.has('freemium'),
    hasFreeTrial: extras.tagSlugs.has('free-trial'),
    hasApi: extras.tagSlugs.has('api'),
    hasAI: extras.tagSlugs.has('ai'),
    hasTeamCollaboration: extras.tagSlugs.has('real-time-collaboration') || extras.tagSlugs.has('team-management'),
    platforms,
    integrationCount: extras.integrationCount,
  };
}

export default function CompareDetailPage() {
  const { comparisonSlug } = useParams<{ comparisonSlug: string }>();
  const navigate = useNavigate();
  const [comparison, setComparison] = useState<ComparisonRow | null>(null);
  const [extrasA, setExtrasA] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [extrasB, setExtrasB] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [related, setRelated] = useState<{ slug: string; tool_a: ToolRow; tool_b: ToolRow }[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);
  const [redirectTo, setRedirectTo] = useState<string | null>(null);

  const recentSlugs = useRecentlyViewedComparisons(comparisonSlug || '');

  useEffect(() => {
    if (!comparisonSlug) return;
    setLoading(true);
    setNotFound(false);
    setRedirectTo(null);

    supabase
      .from('tool_comparisons')
      .select(COMPARISON_SELECT)
      .eq('slug', comparisonSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(async ({ data }) => {
        if (data && (data as unknown as ComparisonRow).tool_a && (data as unknown as ComparisonRow).tool_b) {
          const row = data as unknown as ComparisonRow;
          setComparison(row);
          const [a, b] = await Promise.all([fetchToolExtras(row.tool_a.id), fetchToolExtras(row.tool_b.id)]);
          setExtrasA(a);
          setExtrasB(b);
          setLoading(false);
          return;
        }

        // Not found under this exact slug — check whether the reversed
        // ordering exists as the real canonical comparison, and redirect
        // to it instead of 404ing. This is the only place a non-canonical
        // /compare/:slug URL is ever reachable from (a hand-typed or
        // stale link), so it's handled here rather than at the router.
        const reversed = comparisonSlug ? reverseSlug(comparisonSlug) : null;
        if (reversed) {
          const { data: reversedData } = await supabase
            .from('tool_comparisons')
            .select('slug')
            .eq('slug', reversed)
            .eq('status', 'published')
            .maybeSingle();
          if (reversedData) {
            setRedirectTo(`/compare/${reversedData.slug}`);
            setLoading(false);
            return;
          }
        }

        setNotFound(true);
        setLoading(false);
      });
  }, [comparisonSlug]);

  useEffect(() => {
    if (recentSlugs.length === 0) {
      setRelated([]);
      return;
    }
    supabase
      .from('tool_comparisons')
      .select(COMPARISON_SELECT)
      .in('slug', recentSlugs)
      .eq('status', 'published')
      .then(({ data }) => {
        const rows = (data || []) as unknown as { slug: string; tool_a: ToolRow; tool_b: ToolRow }[];
        setRelated(rows.filter((r) => r.tool_a && r.tool_b && r.slug !== comparisonSlug));
      });
  }, [recentSlugs, comparisonSlug]);

  function navigateToPair(slugA: string, slugB: string) {
    const [first, second] = [slugA, slugB].sort((a, b) => a.localeCompare(b));
    navigate(`/compare/${first}-vs-${second}`);
  }

  if (redirectTo) {
    return <Navigate to={redirectTo} replace />;
  }

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <SoftwareHeader variant="premium" />
        <div className="max-w-5xl mx-auto px-4 sm:px-6 py-20 animate-pulse space-y-8">
          <div className="h-8 bg-slate-200 rounded-lg w-2/3 mx-auto" />
          <div className="flex justify-center gap-10">
            <div className="w-20 h-20 rounded-2xl bg-slate-200" />
            <div className="w-20 h-20 rounded-2xl bg-slate-200" />
          </div>
          <div className="h-64 bg-slate-100 rounded-2xl" />
        </div>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !comparison) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Comparison Not Found | Gappsy" description="This comparison could not be found." path={`/compare/${comparisonSlug || ''}`} noindex />
        <SoftwareHeader variant="premium" />
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">This comparison isn't available</h1>
          <p className="text-slate-500 mb-6">It doesn't exist, or it hasn't been approved for publishing yet.</p>
          <Link to="/compare" className="inline-flex items-center gap-1.5 text-[#4F47E6] font-semibold hover:text-[#4338CA]">
            <ArrowLeft className="w-4 h-4" />
            Browse comparisons
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const { tool_a: aRow, tool_b: bRow } = comparison;
  const factsA = buildFacts(aRow, extrasA);
  const factsB = buildFacts(bRow, extrasB);
  const contentA = getToolContent(aRow.slug);
  const contentB = getToolContent(bRow.slug);
  const comparisonContent = getComparisonContent(comparison.slug);

  const title = `${aRow.name} vs ${bRow.name}: Pricing, Features & Verdict Compared | Gappsy`;
  const description =
    comparisonContent?.verdict.slice(0, 155).trim() ||
    `Compare ${aRow.name} and ${bRow.name} on pricing, features, platforms, and ratings.`;

  const faqJsonLd =
    comparisonContent && comparisonContent.faqs.length > 0
      ? [
          {
            '@type': 'FAQPage',
            '@id': `https://www.gappsy.com/compare/${comparison.slug}/#faq`,
            mainEntity: comparisonContent.faqs.map((faq) => ({
              '@type': 'Question',
              name: faq.question,
              acceptedAnswer: { '@type': 'Answer', text: faq.answer },
            })),
          },
        ]
      : [];

  const tocSections: TocSection[] = [
    ...(comparisonContent ? [{ id: 'verdict', label: 'Verdict' }] : []),
    { id: 'at-a-glance', label: 'At a Glance' },
    ...(comparisonContent?.keyDifferences.length ? [{ id: 'differences', label: 'Differences' }] : []),
    ...(comparisonContent?.featureMatrix.length ? [{ id: 'features', label: 'Features' }] : []),
    { id: 'pricing', label: 'Pricing' },
    ...((contentA?.pros.length || contentA?.cons.length || contentB?.pros.length || contentB?.cons.length) ? [{ id: 'pros-and-cons', label: 'Pros & Cons' }] : []),
    ...((contentA?.useCases.length || contentB?.useCases.length || comparisonContent?.whoNeedsBoth) ? [{ id: 'use-cases', label: 'Use Cases' }] : []),
    ...(extrasA.screenshots.length || extrasB.screenshots.length ? [{ id: 'screenshots', label: 'Screenshots' }] : []),
    ...((contentA?.alternatives.length || contentB?.alternatives.length) ? [{ id: 'alternatives', label: 'Alternatives' }] : []),
    ...(comparisonContent?.faqs.length ? [{ id: 'faq', label: 'FAQ' }] : []),
  ];

  function handleSwitchA(next: ToolOption) {
    navigateToPair(next.slug, bRow.slug);
  }
  function handleSwitchB(next: ToolOption) {
    navigateToPair(aRow.slug, next.slug);
  }

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={title}
        description={description}
        path={`/compare/${comparison.slug}`}
        ogImage={factsA.logo || factsB.logo || '/og/default-og-image.svg'}
        breadcrumbs={[{ name: 'Compare', path: '/compare' }, { name: `${aRow.name} vs ${bRow.name}`, path: `/compare/${comparison.slug}` }]}
        jsonLd={faqJsonLd}
      />

      <SoftwareHeader variant="premium" />

      <div className="max-w-5xl mx-auto px-4 sm:px-6 pt-6">
        <ToolBreadcrumbs items={[{ name: 'Compare', path: '/compare' }, { name: `${aRow.name} vs ${bRow.name}` }]} />
      </div>

      <CompareHero
        toolA={factsA}
        toolB={factsB}
        bestForA={comparisonContent?.bestForToolA}
        bestForB={comparisonContent?.bestForToolB}
        onSwitchToolA={handleSwitchA}
        onSwitchToolB={handleSwitchB}
      />

      <main className="max-w-5xl mx-auto px-4 sm:px-6 pb-16">
        <div className="lg:grid lg:grid-cols-[180px_1fr] lg:gap-10">
          <div className="hidden lg:block">
            <TableOfContents sections={tocSections} />
          </div>

          <div className="min-w-0 space-y-14">
            {comparisonContent && (
              <section id="verdict" className="scroll-mt-24">
                <p className="text-[15px] sm:text-lg text-slate-700 leading-[1.75] max-w-[70ch]">{comparisonContent.verdict}</p>
              </section>
            )}

            <CompareFactsTable toolA={factsA} toolB={factsB} content={comparisonContent} />

            {comparisonContent && (
              <CompareKeyDifferences toolAName={aRow.name} toolBName={bRow.name} differences={comparisonContent.keyDifferences} />
            )}

            {comparisonContent && <CompareFeatureMatrix toolAName={aRow.name} toolBName={bRow.name} groups={comparisonContent.featureMatrix} />}

            <ComparePricing toolA={factsA} toolB={factsB} plansA={extrasA.pricingPlans} plansB={extrasB.pricingPlans} />

            <CompareProsCons
              toolA={{ name: aRow.name, pros: contentA?.pros || [], cons: contentA?.cons || [] }}
              toolB={{ name: bRow.name, pros: contentB?.pros || [], cons: contentB?.cons || [] }}
            />

            <CompareUseCases
              toolA={{ name: aRow.name, useCases: contentA?.useCases || [] }}
              toolB={{ name: bRow.name, useCases: contentB?.useCases || [] }}
              whoShouldChooseA={comparisonContent?.bestForToolA}
              whoShouldChooseB={comparisonContent?.bestForToolB}
              whoNeedsBoth={comparisonContent?.whoNeedsBoth}
            />

            <CompareScreenshots
              toolA={{ name: aRow.name, slug: aRow.slug, screenshots: extrasA.screenshots, websiteUrl: factsA.websiteUrl }}
              toolB={{ name: bRow.name, slug: bRow.slug, screenshots: extrasB.screenshots, websiteUrl: factsB.websiteUrl }}
            />

            <CompareAlternatives
              toolA={{ name: aRow.name, alternatives: contentA?.alternatives || [] }}
              toolB={{ name: bRow.name, alternatives: contentB?.alternatives || [] }}
            />

            {comparisonContent && comparisonContent.faqs.length > 0 && (
              <section id="faq" className="scroll-mt-24">
                <h2 className="text-xl font-bold text-[#0B1221] mb-4">Frequently Asked Questions</h2>
                <div className="space-y-3">
                  {comparisonContent.faqs.map((faq) => (
                    <details key={faq.question} className="bg-white border border-[#eef0f3] rounded-xl p-4 group">
                      <summary className="font-medium text-[#0B1221] text-sm cursor-pointer list-none">{faq.question}</summary>
                      <p className="text-sm text-slate-500 leading-relaxed mt-2.5">{faq.answer}</p>
                    </details>
                  ))}
                </div>
              </section>
            )}

            <section>
              <h2 className="text-xl font-bold text-[#0B1221] mb-4">Explore More</h2>
              <div className="flex flex-wrap gap-2.5">
                <Link to={`/tools/${aRow.slug}`} className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors">
                  Full {aRow.name} review
                </Link>
                <Link to={`/tools/${bRow.slug}`} className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors">
                  Full {bRow.name} review
                </Link>
                {factsA.primaryCategory && (
                  <Link
                    to={`/tool-categories/${factsA.primaryCategory.slug}`}
                    className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors"
                  >
                    More {factsA.primaryCategory.name} tools
                  </Link>
                )}
                {factsB.primaryCategory && factsB.primaryCategory.slug !== factsA.primaryCategory?.slug && (
                  <Link
                    to={`/tool-categories/${factsB.primaryCategory.slug}`}
                    className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors"
                  >
                    More {factsB.primaryCategory.name} tools
                  </Link>
                )}
              </div>
            </section>

            {related.length > 0 && (
              <section>
                <h2 className="text-xl font-bold text-[#0B1221] mb-4">Recently Viewed Comparisons</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {related.map((c) => (
                    <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
                  ))}
                </div>
              </section>
            )}
          </div>
        </div>
      </main>

      <FooterWrapper />
    </div>
  );
}
