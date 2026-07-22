import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { GitCompareArrows, ArrowRight, ArrowLeftRight } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolSelectCombobox, { type ToolOption } from '../components/compare/ToolSelectCombobox';
import ComparisonCard from '../components/compare/ComparisonCard';
import GroupCompareCard from '../components/groupCompare/GroupCompareCard';
import { supabase } from '../lib/supabase';
import { readRecentlyViewedComparisons } from '../hooks/useRecentlyViewedComparisons';

interface ComparisonToolRef {
  slug: string;
  name: string;
  logo: string | null;
}

interface ApprovedComparison {
  slug: string;
  tool_a: ComparisonToolRef;
  tool_b: ComparisonToolRef;
}

interface GroupComparisonListItem {
  slug: string;
  title: string;
  tools: ComparisonToolRef[];
}

const COMPARISON_LIST_SELECT =
  'slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(slug,name,logo), tool_b:tools!tool_comparisons_tool_b_id_fkey(slug,name,logo)';

function ComparisonCardSkeleton() {
  return (
    <div className="flex items-center gap-4 bg-white border border-[#eef0f3] rounded-2xl p-5 animate-pulse">
      <div className="flex items-center -space-x-2 shrink-0">
        <div className="w-10 h-10 rounded-xl bg-slate-100" />
        <div className="w-7 h-7 rounded-full bg-slate-50 border-2 border-white" />
        <div className="w-10 h-10 rounded-xl bg-slate-100" />
      </div>
      <div className="flex-1 min-w-0 space-y-1.5">
        <div className="h-3.5 bg-slate-100 rounded w-2/3" />
        <div className="h-2.5 bg-slate-50 rounded w-1/3" />
      </div>
    </div>
  );
}

export default function ComparePage() {
  const navigate = useNavigate();
  const [toolA, setToolA] = useState<ToolOption | null>(null);
  const [toolB, setToolB] = useState<ToolOption | null>(null);
  const [approved, setApproved] = useState<ApprovedComparison[]>([]);
  const [recent, setRecent] = useState<ApprovedComparison[]>([]);
  const [loadingApproved, setLoadingApproved] = useState(true);
  const [groupComparisons, setGroupComparisons] = useState<GroupComparisonListItem[]>([]);
  const [loadingGroupComparisons, setLoadingGroupComparisons] = useState(true);

  // Read once on mount — a stable reference so the fetch effect below
  // doesn't re-run every render (this list only changes by visiting a
  // comparison detail page, i.e. after navigating away from this page).
  const [recentSlugs] = useState(() => readRecentlyViewedComparisons());

  useEffect(() => {
    supabase
      .from('tool_comparisons')
      .select(COMPARISON_LIST_SELECT)
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(24)
      .then(({ data }) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        setApproved(((data || []) as any[]).filter((c) => c.tool_a && c.tool_b) as ApprovedComparison[]);
        setLoadingApproved(false);
      });
  }, []);

  useEffect(() => {
    supabase
      .from('tool_group_comparisons')
      .select('slug, title, tool_group_comparison_members(sort_order, tools(slug, name, logo))')
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(24)
      .then(({ data }) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const rows = (data || []) as any[];
        const mapped = rows
          .map((r) => ({
            slug: r.slug,
            title: r.title,
            tools: (r.tool_group_comparison_members || [])
              .sort((a: { sort_order: number }, b: { sort_order: number }) => a.sort_order - b.sort_order)
              .map((m: { tools: ComparisonToolRef }) => m.tools)
              .filter(Boolean),
          }))
          .filter((r) => r.tools.length >= 3);
        setGroupComparisons(mapped);
        setLoadingGroupComparisons(false);
      });
  }, []);

  useEffect(() => {
    if (recentSlugs.length === 0) {
      setRecent([]);
      return;
    }
    supabase
      .from('tool_comparisons')
      .select(COMPARISON_LIST_SELECT)
      .in('slug', recentSlugs)
      .eq('status', 'published')
      .then(({ data }) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const rows = ((data || []) as any[]).filter((c) => c.tool_a && c.tool_b) as ApprovedComparison[];
        const bySlug = new Map(rows.map((c) => [c.slug, c]));
        setRecent(recentSlugs.map((slug) => bySlug.get(slug)).filter((c): c is ApprovedComparison => Boolean(c)));
      });
  }, [recentSlugs]);

  const sameToolSelected = Boolean(toolA && toolB && toolA.slug === toolB.slug);
  const canCompare = Boolean(toolA && toolB) && !sameToolSelected;

  function handleSwap() {
    setToolA(toolB);
    setToolB(toolA);
  }

  function handleCompare() {
    if (!canCompare || !toolA || !toolB) return;
    // Canonical ordering: always alphabetical by slug, so this never
    // produces the duplicate/non-canonical URL ordering — matches the
    // admin-tool-comparisons edge function's resolveCanonicalPair logic.
    const [first, second] = [toolA.slug, toolB.slug].sort((a, b) => a.localeCompare(b));
    navigate(`/compare/${first}-vs-${second}`);
  }

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title="Compare Software Tools Side by Side | Gappsy"
        description="Compare pricing, features, platforms, and ratings for popular software tools before you buy."
        path="/compare"
        breadcrumbs={[{ name: 'Compare', path: '/compare' }]}
      />

      <SoftwareHeader variant="premium" />

      <main className="max-w-5xl mx-auto px-4 sm:px-6 py-14 sm:py-20">
        <div className="text-center max-w-2xl mx-auto mb-10">
          <div className="w-12 h-12 rounded-2xl bg-[#EEF0FE] flex items-center justify-center mx-auto mb-4">
            <GitCompareArrows className="w-5 h-5 text-[#4F47E6]" />
          </div>
          <h1 className="text-3xl sm:text-4xl font-bold text-[#0B1221] tracking-tight">Compare Software, Side by Side</h1>
          <p className="text-slate-500 mt-3 text-[15px]">
            Pick two tools to see pricing, platforms, free plans, and real editorial differences — no fabricated scores, just what's actually documented.
          </p>
        </div>

        <div className="bg-white border border-[#eef0f3] rounded-3xl p-5 sm:p-6 shadow-[0_8px_24px_rgba(15,23,42,0.06)] mb-14">
          <div className="flex flex-col sm:flex-row items-stretch sm:items-end gap-3">
            <ToolSelectCombobox label="Tool A" value={toolA} onChange={setToolA} excludeSlug={toolB?.slug} />

            <button
              type="button"
              onClick={handleSwap}
              disabled={!toolA && !toolB}
              aria-label="Swap Tool A and Tool B"
              title="Swap tools"
              className="hidden sm:inline-flex items-center justify-center w-8 h-14 shrink-0 text-slate-300 rounded-xl hover:bg-slate-50 hover:text-[#4F47E6] disabled:opacity-40 disabled:hover:bg-transparent disabled:hover:text-slate-300 transition-colors"
            >
              <ArrowLeftRight className="w-4 h-4" />
            </button>
            <button
              type="button"
              onClick={handleSwap}
              disabled={!toolA && !toolB}
              aria-label="Swap Tool A and Tool B"
              className="sm:hidden inline-flex items-center justify-center gap-1.5 h-9 rounded-xl text-xs font-medium text-slate-400 hover:text-[#4F47E6] disabled:opacity-40 transition-colors"
            >
              <ArrowLeftRight className="w-3.5 h-3.5" />
              Swap
            </button>

            <ToolSelectCombobox label="Tool B" value={toolB} onChange={setToolB} excludeSlug={toolA?.slug} />
            <button
              type="button"
              onClick={handleCompare}
              disabled={!canCompare}
              aria-disabled={!canCompare}
              className="h-14 shrink-0 inline-flex items-center justify-center gap-2 px-6 rounded-2xl bg-[#4F47E6] text-white font-semibold text-sm transition-all active:scale-[0.98] disabled:opacity-40 disabled:cursor-not-allowed disabled:active:scale-100 enabled:hover:bg-[#4338CA] enabled:shadow-[0_8px_20px_rgba(10,23,53,0.25)]"
            >
              Compare
              <ArrowRight className="w-4 h-4" />
            </button>
          </div>
          {sameToolSelected && <p className="text-sm text-amber-600 mt-3">Choose two different tools to compare.</p>}
        </div>

        <section className="mb-14">
          <ToolsSectionHeader eyebrow="Approved" title="Popular Comparisons" />
          {loadingApproved && (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <ComparisonCardSkeleton />
              <ComparisonCardSkeleton />
            </div>
          )}
          {!loadingApproved && approved.length > 0 && (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {approved.map((c) => (
                <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
              ))}
            </div>
          )}
          {!loadingApproved && approved.length === 0 && (
            <div className="text-center py-10 border border-dashed border-slate-200 rounded-2xl">
              <p className="text-sm text-slate-500">No approved comparisons yet — pick two tools above to build one.</p>
            </div>
          )}
        </section>

        {(loadingGroupComparisons || groupComparisons.length > 0) && (
          <section className="mb-14">
            <ToolsSectionHeader eyebrow="Multi-Tool" title="3+ Tool Comparisons" subtitle="See three or more tools compared side by side in one page." />
            {loadingGroupComparisons && (
              <div className="grid grid-cols-1 gap-3">
                <ComparisonCardSkeleton />
                <ComparisonCardSkeleton />
              </div>
            )}
            {!loadingGroupComparisons && groupComparisons.length > 0 && (
              <div className="grid grid-cols-1 gap-3">
                {groupComparisons.map((r) => (
                  <GroupCompareCard key={r.slug} slug={r.slug} title={r.title} tools={r.tools} />
                ))}
              </div>
            )}
          </section>
        )}

        {recent.length > 0 && (
          <section>
            <ToolsSectionHeader eyebrow="History" title="Recently Viewed" />
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {recent.map((c) => (
                <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
              ))}
            </div>
          </section>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
