import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link, Navigate } from 'react-router-dom';
import { ArrowLeft, FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolBreadcrumbs from '../components/tools/detail/ToolBreadcrumbs';
import TableOfContents, { type TocSection } from '../components/tools/detail/TableOfContents';
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
import { fetchToolExtras, buildFacts, type ToolRow, type ToolExtras, EMPTY_EXTRAS } from '../components/compare/compareToolFacts';
import { supabase } from '../lib/supabase';
import { getToolContent } from '../data/toolContent';
import { getComparisonContent } from '../data/comparisonContent';
import { useRecentlyViewedComparisons } from '../hooks/useRecentlyViewedComparisons';
import { buildCompareItemListJsonLd } from '../utils/compareJsonLd';
import { useFeaturedToolPool, FeaturedToolSidebarCompact, FeaturedToolInlineCard, type FeaturedTool } from '../components/tools/detail/FeaturedToolPromo';
import StickyMobileToolBar from '../components/tools/detail/StickyMobileToolBar';
import StickyDesktopToolBar from '../components/tools/detail/StickyDesktopToolBar';
import AskGappsyChat from '../components/askGappsy/AskGappsyChat';

interface ComparisonRow {
  id: string;
  slug: string;
  created_at: string | null;
  updated_at: string | null;
  tool_a: ToolRow;
  tool_b: ToolRow;
}

function truncateDescription(text: string, max = 160): string {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(' ');
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
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
  'id, slug, created_at, updated_at, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name,logo,website,affiliate_link,pricing_model,starting_price,rating,review_count,verified), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name,logo,website,affiliate_link,pricing_model,starting_price,rating,review_count,verified)';

export default function CompareDetailPage() {
  const { comparisonSlug } = useParams<{ comparisonSlug: string }>();
  const navigate = useNavigate();
  const [comparison, setComparison] = useState<ComparisonRow | null>(null);
  const [extrasA, setExtrasA] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [extrasB, setExtrasB] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [related, setRelated] = useState<{ slug: string; tool_a: ToolRow; tool_b: ToolRow }[]>([]);
  const [sameToolComparisons, setSameToolComparisons] = useState<{ slug: string; tool_a: ToolRow; tool_b: ToolRow }[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);
  const [redirectTo, setRedirectTo] = useState<string | null>(null);

  const recentSlugs = useRecentlyViewedComparisons(comparisonSlug || '');

  // Same featured-ad mechanism as ToolDetailPage: a pool of up to 6,
  // excluding BOTH tools being compared (neither is "this page's own tool"
  // here), distributed across 2 sidebar slots and 3 inline cards spread
  // through the page. Only 2 in the sidebar (not 3) — a 3rd stacked
  // straight underneath the first two with nothing but whitespace between
  // them read as a wall of ads, so that slot moved to an inline card near
  // Related Comparisons instead. Thin inventory just means later slots come
  // back empty and render nothing — see FeaturedToolPromo.tsx.
  const featuredExcludeSlugs = comparison ? [comparison.tool_a.slug, comparison.tool_b.slug] : [];
  const featuredPool = useFeaturedToolPool(featuredExcludeSlugs, 6);
  const featuredPromo = featuredPool?.[0];
  const featuredPromoSecondary = featuredPool?.[1];
  const inlineFeaturedPromoA = featuredPool?.[2];
  const inlineFeaturedPromoB = featuredPool?.[3];
  const inlineFeaturedPromoC = featuredPool?.[4];
  const hasSidebarPromos = Boolean(featuredPromo || featuredPromoSecondary);

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

  // Real, always-populated "related comparisons": other published comparisons
  // sharing either tool with the one currently open. Unlike `related`
  // (below), this doesn't depend on localStorage/browsing history, so it is
  // non-empty for first-time visitors and (via the mirrored static-prerender
  // logic in scripts/comparison-seo-generator.js) for crawlers as well.
  useEffect(() => {
    if (!comparison) {
      setSameToolComparisons([]);
      return;
    }
    const aId = comparison.tool_a.id;
    const bId = comparison.tool_b.id;
    supabase
      .from('tool_comparisons')
      .select(COMPARISON_SELECT)
      .or(`tool_a_id.eq.${aId},tool_b_id.eq.${aId},tool_a_id.eq.${bId},tool_b_id.eq.${bId}`)
      .eq('status', 'published')
      .neq('slug', comparison.slug)
      .order('slug', { ascending: true })
      .limit(8)
      .then(({ data }) => {
        const rows = (data || []) as unknown as { slug: string; tool_a: ToolRow; tool_b: ToolRow }[];
        setSameToolComparisons(rows.filter((r) => r.tool_a && r.tool_b));
      });
  }, [comparison]);

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
  const description = comparisonContent?.verdict
    ? truncateDescription(comparisonContent.verdict)
    : `Compare ${aRow.name} and ${bRow.name} on pricing, features, platforms, and ratings.`;

  const canonicalUrl = `https://gappsy.com/compare/${comparison.slug}/`;
  const gappsyOrg = { '@type': 'Organization', name: 'Gappsy', url: 'https://gappsy.com' };

  const articleJsonLd = comparisonContent
    ? [
        {
          '@type': 'TechArticle',
          '@id': `${canonicalUrl}#article`,
          headline: `${aRow.name} vs ${bRow.name}: Pricing, Features & Verdict Compared`,
          description,
          mainEntityOfPage: canonicalUrl,
          url: canonicalUrl,
          ...(comparison.created_at ? { datePublished: comparison.created_at } : {}),
          dateModified: comparison.updated_at || comparison.created_at || undefined,
          author: gappsyOrg,
          publisher: gappsyOrg,
          ...(factsA.logo || factsB.logo ? { image: factsA.logo || factsB.logo } : {}),
        },
      ]
    : [];

  const faqJsonLd =
    comparisonContent && comparisonContent.faqs.length > 0
      ? [
          {
            '@type': 'FAQPage',
            '@id': `https://gappsy.com/compare/${comparison.slug}/#faq`,
            mainEntity: comparisonContent.faqs.map((faq) => ({
              '@type': 'Question',
              name: faq.question,
              acceptedAnswer: { '@type': 'Answer', text: faq.answer },
            })),
          },
        ]
      : [];

  const itemListJsonLd = buildCompareItemListJsonLd([factsA, factsB], canonicalUrl);

  const tocSections: TocSection[] = [
    ...(comparisonContent ? [{ id: 'verdict', label: 'Verdict' }] : []),
    { id: 'at-a-glance', label: 'At a Glance' },
    ...(comparisonContent?.keyDifferences.length ? [{ id: 'differences', label: 'Differences' }] : []),
    ...(comparisonContent?.featureMatrix.length ? [{ id: 'features', label: 'Features' }] : []),
    { id: 'pricing', label: 'Pricing' },
    ...((extrasA.pros.length || extrasA.cons.length || extrasB.pros.length || extrasB.cons.length) ? [{ id: 'pros-and-cons', label: 'Pros & Cons' }] : []),
    ...((extrasA.useCases.length || extrasB.useCases.length || comparisonContent?.whoNeedsBoth) ? [{ id: 'use-cases', label: 'Use Cases' }] : []),
    ...(extrasA.screenshots.length || extrasB.screenshots.length ? [{ id: 'screenshots', label: 'Screenshots' }] : []),
    ...((contentA?.alternatives.length || contentB?.alternatives.length) ? [{ id: 'alternatives', label: 'Alternatives' }] : []),
    ...(comparisonContent?.faqs.length ? [{ id: 'faq', label: 'FAQ' }] : []),
    ...(sameToolComparisons.length > 0 ? [{ id: 'related-comparisons', label: 'Related Comparisons' }] : []),
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
        jsonLd={[...articleJsonLd, ...itemListJsonLd, ...faqJsonLd]}
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

      <div className="max-w-5xl mx-auto px-4 sm:px-6 mb-10">
        <div className="rounded-2xl border border-slate-100 bg-white shadow-[0_8px_24px_rgba(15,23,42,0.08)] overflow-hidden">
          <AskGappsyChat
            toolSlugs={[aRow.slug, bRow.slug]}
            toolNames={[aRow.name, bRow.name]}
            suggestedQuestions={[
              `Which is better for beginners, ${aRow.name} or ${bRow.name}?`,
              `How does ${aRow.name}'s pricing compare to ${bRow.name}?`,
              `What's the biggest difference between them?`,
            ]}
          />
        </div>
      </div>

      <main className="max-w-5xl mx-auto px-4 sm:px-6 pb-16">
        <div className="lg:grid lg:grid-cols-[180px_1fr] lg:gap-10">
          <div className="hidden lg:block">
            <TableOfContents sections={tocSections} />
          </div>

          <div className="min-w-0 space-y-14">
            {/* Zone A pairs the verdict/facts/differences narrative with the
                featured-ad sidebar; Zone B (below) drops the sidebar column
                entirely once its content naturally ends — same convention as
                ToolDetailPage's Zone A/B split. The sidebar itself only
                exists to carry ad slots (unlike ToolFactsSidebar, which
                always has real facts to show), so it's only rendered at all
                when there's actually a promo to fill it with. */}
            <div className={hasSidebarPromos ? 'flex flex-col lg:grid lg:grid-cols-[1fr_300px] lg:gap-8 lg:items-start' : ''}>
              <div className="space-y-14 min-w-0">
                {comparisonContent && (
                  <section id="verdict" className="scroll-mt-24">
                    <p className="text-[15px] sm:text-lg text-slate-700 leading-[1.75] max-w-[70ch]">{comparisonContent.verdict}</p>
                  </section>
                )}

                <CompareFactsTable toolA={factsA} toolB={factsB} content={comparisonContent} />

                {comparisonContent && (
                  <CompareKeyDifferences toolAName={aRow.name} toolBName={bRow.name} differences={comparisonContent.keyDifferences} />
                )}
              </div>

              {hasSidebarPromos && (
                <div className="space-y-4 lg:sticky lg:top-24">
                  {featuredPromo && <FeaturedToolSidebarCompact tool={featuredPromo} />}
                  {featuredPromoSecondary && <FeaturedToolSidebarCompact tool={featuredPromoSecondary} />}
                </div>
              )}
            </div>

            {/* Zone B — full width, no sidebar column */}
            {comparisonContent && <CompareFeatureMatrix toolAName={aRow.name} toolBName={bRow.name} groups={comparisonContent.featureMatrix} />}

            <ComparePricing toolA={factsA} toolB={factsB} plansA={extrasA.pricingPlans} plansB={extrasB.pricingPlans} />

            <CompareProsCons
              toolA={{ name: aRow.name, pros: extrasA.pros, cons: extrasA.cons }}
              toolB={{ name: bRow.name, pros: extrasB.pros, cons: extrasB.cons }}
            />

            {inlineFeaturedPromoA && <FeaturedToolInlineCard tool={inlineFeaturedPromoA} />}

            <CompareUseCases
              toolA={{ name: aRow.name, useCases: extrasA.useCases }}
              toolB={{ name: bRow.name, useCases: extrasB.useCases }}
              whoShouldChooseA={comparisonContent?.bestForToolA}
              whoShouldChooseB={comparisonContent?.bestForToolB}
              whoNeedsBoth={comparisonContent?.whoNeedsBoth}
            />

            <CompareScreenshots
              toolA={{ name: aRow.name, slug: aRow.slug, screenshots: extrasA.screenshots, websiteUrl: factsA.websiteUrl }}
              toolB={{ name: bRow.name, slug: bRow.slug, screenshots: extrasB.screenshots, websiteUrl: factsB.websiteUrl }}
            />

            {inlineFeaturedPromoB && <FeaturedToolInlineCard tool={inlineFeaturedPromoB} />}

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

            {inlineFeaturedPromoC && <FeaturedToolInlineCard tool={inlineFeaturedPromoC} />}

            {sameToolComparisons.length > 0 && (
              <section id="related-comparisons">
                <h2 className="text-xl font-bold text-[#0B1221] mb-4">Related Comparisons</h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {sameToolComparisons.map((c) => (
                    <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
                  ))}
                </div>
              </section>
            )}

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

      <StickyMobileToolBar featuredPromo={featuredPromo} />

      <StickyDesktopToolBar
        promos={[featuredPromo, featuredPromoSecondary].filter((t): t is FeaturedTool => Boolean(t))}
      />
    </div>
  );
}
