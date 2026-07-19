import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ArrowLeft, FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolBreadcrumbs from '../components/tools/detail/ToolBreadcrumbs';
import TableOfContents, { type TocSection } from '../components/tools/detail/TableOfContents';
import GroupCompareHero from '../components/groupCompare/GroupCompareHero';
import GroupCompareHighlights from '../components/groupCompare/GroupCompareHighlights';
import GroupCompareFeatureMatrix from '../components/groupCompare/GroupCompareFeatureMatrix';
import { fetchToolExtras, buildFacts, type ToolRow } from '../components/compare/compareToolFacts';
import type { CompareToolFacts } from '../components/compare/types';
import { supabase } from '../lib/supabase';
import { getGroupComparisonContent } from '../data/groupComparisonContent';
import { useFeaturedToolPool, FeaturedToolSidebarCompact, FeaturedToolInlineCard, type FeaturedTool } from '../components/tools/detail/FeaturedToolPromo';
import StickyMobileToolBar from '../components/tools/detail/StickyMobileToolBar';
import StickyDesktopToolBar from '../components/tools/detail/StickyDesktopToolBar';

interface GroupComparisonMemberRow {
  sort_order: number;
  best_for: string | null;
  tools: ToolRow;
}

interface GroupComparisonRow {
  id: string;
  slug: string;
  title: string;
  created_at: string | null;
  updated_at: string | null;
  tool_group_comparison_members: GroupComparisonMemberRow[];
}

const GROUP_COMPARISON_SELECT =
  'id, slug, title, created_at, updated_at, tool_group_comparison_members(sort_order, best_for, tools(id,slug,name,logo,website,affiliate_link,pricing_model,starting_price,rating,review_count,verified))';

function truncateDescription(text: string, max = 160): string {
  const trimmed = text.trim();
  if (trimmed.length <= max) return trimmed;
  const cut = trimmed.slice(0, max - 1);
  const lastSpace = cut.lastIndexOf(' ');
  const clean = lastSpace > max - 20 ? cut.slice(0, lastSpace) : cut;
  return `${clean.trimEnd()}…`;
}

export default function GroupCompareDetailPage() {
  const { comparisonSlug: groupSlug } = useParams<{ comparisonSlug: string }>();
  const [groupComparison, setGroupComparison] = useState<GroupComparisonRow | null>(null);
  const [facts, setFacts] = useState<CompareToolFacts[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    if (!groupSlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tool_group_comparisons')
      .select(GROUP_COMPARISON_SELECT)
      .eq('slug', groupSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(async ({ data }) => {
        const row = data as unknown as GroupComparisonRow | null;
        const members = (row?.tool_group_comparison_members || []).filter((m) => m.tools).sort((a, b) => a.sort_order - b.sort_order);
        if (!row || members.length < 3) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setGroupComparison({ ...row, tool_group_comparison_members: members });
        const extras = await Promise.all(members.map((m) => fetchToolExtras(m.tools.id)));
        setFacts(members.map((m, i) => buildFacts(m.tools, extras[i])));
        setLoading(false);
      });
  }, [groupSlug]);

  // Same featured-ad mechanism as ToolDetailPage/CompareDetailPage: a pool
  // of up to 6, excluding all 3 tools in this comparison, distributed across
  // a couple of sidebar slots (desktop, below the TOC), two inline
  // mid-content cards, and the sticky footer bars.
  const featuredExcludeSlugs = facts.map((f) => f.slug);
  const featuredPool = useFeaturedToolPool(featuredExcludeSlugs, 6);
  const featuredPromo = featuredPool?.[0];
  const featuredPromoSecondary = featuredPool?.[1];
  const inlineFeaturedPromoA = featuredPool?.[2];
  const inlineFeaturedPromoB = featuredPool?.[3];
  const hasSidebarPromos = Boolean(featuredPromo || featuredPromoSecondary);

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <SoftwareHeader variant="premium" />
        <div className="max-w-5xl mx-auto px-4 sm:px-6 py-20 animate-pulse space-y-8">
          <div className="h-8 bg-slate-200 rounded-lg w-2/3 mx-auto" />
          <div className="flex justify-center gap-6">
            <div className="w-20 h-20 rounded-2xl bg-slate-200" />
            <div className="w-20 h-20 rounded-2xl bg-slate-200" />
            <div className="w-20 h-20 rounded-2xl bg-slate-200" />
          </div>
          <div className="h-64 bg-slate-100 rounded-2xl" />
        </div>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !groupComparison) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Comparison Not Found | Gappsy" description="This comparison could not be found." path={`/compare/${groupSlug || ''}`} noindex />
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

  const toolNames: Record<string, string> = Object.fromEntries(facts.map((f) => [f.slug, f.name]));
  const groupComparisonContent = getGroupComparisonContent(groupComparison.slug);

  const description = groupComparisonContent?.verdict
    ? truncateDescription(groupComparisonContent.verdict)
    : `Compare ${facts.map((f) => f.name).join(', ')} on pricing, features, and who each one is built for.`;

  const canonicalUrl = `https://www.gappsy.com/compare/${groupComparison.slug}/`;
  const gappsyOrg = { '@type': 'Organization', name: 'Gappsy', url: 'https://www.gappsy.com' };

  const articleJsonLd = groupComparisonContent
    ? [
        {
          '@type': 'TechArticle',
          '@id': `${canonicalUrl}#article`,
          headline: groupComparison.title,
          description,
          mainEntityOfPage: canonicalUrl,
          url: canonicalUrl,
          ...(groupComparison.created_at ? { datePublished: groupComparison.created_at } : {}),
          dateModified: groupComparison.updated_at || groupComparison.created_at || undefined,
          author: gappsyOrg,
          publisher: gappsyOrg,
          ...(facts[0]?.logo ? { image: facts[0].logo } : {}),
        },
      ]
    : [];

  const faqJsonLd =
    groupComparisonContent && groupComparisonContent.faqs.length > 0
      ? [
          {
            '@type': 'FAQPage',
            '@id': `${canonicalUrl}#faq`,
            mainEntity: groupComparisonContent.faqs.map((faq) => ({
              '@type': 'Question',
              name: faq.question,
              acceptedAnswer: { '@type': 'Answer', text: faq.answer },
            })),
          },
        ]
      : [];

  const tocSections: TocSection[] = [
    ...(groupComparisonContent ? [{ id: 'verdict', label: 'Verdict' }] : []),
    ...(groupComparisonContent?.highlights.length ? [{ id: 'highlights', label: 'Highlights' }] : []),
    ...(groupComparisonContent?.featureMatrix.length ? [{ id: 'features', label: 'Features' }] : []),
    ...(groupComparisonContent?.faqs.length ? [{ id: 'faq', label: 'FAQ' }] : []),
  ];

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={`${groupComparison.title} | Gappsy`}
        description={description}
        path={`/compare/${groupComparison.slug}`}
        ogImage={facts[0]?.logo || '/og/default-og-image.svg'}
        breadcrumbs={[{ name: 'Compare', path: '/compare' }, { name: groupComparison.title, path: `/compare/${groupComparison.slug}` }]}
        jsonLd={[...articleJsonLd, ...faqJsonLd]}
      />

      <SoftwareHeader variant="premium" />

      <div className="max-w-5xl mx-auto px-4 sm:px-6 pt-6">
        <ToolBreadcrumbs items={[{ name: 'Compare', path: '/compare' }, { name: groupComparison.title }]} />
      </div>

      <GroupCompareHero title={groupComparison.title} tools={facts} bestFor={groupComparisonContent?.bestFor || {}} />

      <main className="max-w-5xl mx-auto px-4 sm:px-6 pb-16">
        <div className="lg:grid lg:grid-cols-[180px_1fr] lg:gap-10">
          <div className="hidden lg:block space-y-4 lg:sticky lg:top-24 lg:self-start">
            <TableOfContents sections={tocSections} />
            {hasSidebarPromos && (
              <div className="space-y-4">
                {featuredPromo && <FeaturedToolSidebarCompact tool={featuredPromo} />}
                {featuredPromoSecondary && <FeaturedToolSidebarCompact tool={featuredPromoSecondary} />}
              </div>
            )}
          </div>

          <div className="min-w-0 space-y-14">
            {groupComparisonContent && (
              <section id="verdict" className="scroll-mt-24">
                <p className="text-[15px] sm:text-lg text-slate-700 leading-[1.75] max-w-[70ch]">{groupComparisonContent.verdict}</p>
              </section>
            )}

            {groupComparisonContent && <GroupCompareHighlights toolNames={toolNames} highlights={groupComparisonContent.highlights} />}

            {inlineFeaturedPromoA && <FeaturedToolInlineCard tool={inlineFeaturedPromoA} />}

            {groupComparisonContent && <GroupCompareFeatureMatrix toolNames={toolNames} groups={groupComparisonContent.featureMatrix} />}

            {inlineFeaturedPromoB && <FeaturedToolInlineCard tool={inlineFeaturedPromoB} />}

            {groupComparisonContent && groupComparisonContent.faqs.length > 0 && (
              <section id="faq" className="scroll-mt-24">
                <h2 className="text-xl font-bold text-[#0B1221] mb-4">Frequently Asked Questions</h2>
                <div className="space-y-3">
                  {groupComparisonContent.faqs.map((faq) => (
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
                {facts.map((f) => (
                  <Link
                    key={f.slug}
                    to={`/tools/${f.slug}`}
                    className="inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full px-4 py-2 text-sm font-medium text-slate-600 hover:border-[#C7CCF7] hover:text-[#4F47E6] transition-colors"
                  >
                    Full {f.name} review
                  </Link>
                ))}
              </div>
            </section>
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
