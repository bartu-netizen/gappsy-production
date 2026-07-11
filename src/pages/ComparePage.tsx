import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { GitCompareArrows, ArrowRight } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolSelectCombobox, { type ToolOption } from '../components/compare/ToolSelectCombobox';
import ComparisonCard from '../components/compare/ComparisonCard';
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

export default function ComparePage() {
  const navigate = useNavigate();
  const [toolA, setToolA] = useState<ToolOption | null>(null);
  const [toolB, setToolB] = useState<ToolOption | null>(null);
  const [formError, setFormError] = useState<string | null>(null);
  const [approved, setApproved] = useState<ApprovedComparison[]>([]);
  const [recent, setRecent] = useState<ApprovedComparison[]>([]);
  const [loading, setLoading] = useState(true);

  // Read once on mount — a stable reference so the fetch effect below
  // doesn't re-run every render (this list only changes by visiting a
  // comparison detail page, i.e. after navigating away from this page).
  const [recentSlugs] = useState(() => readRecentlyViewedComparisons());

  useEffect(() => {
    supabase
      .from('tool_comparisons')
      .select(
        'slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(slug,name,logo), tool_b:tools!tool_comparisons_tool_b_id_fkey(slug,name,logo)'
      )
      .eq('status', 'published')
      .order('created_at', { ascending: false })
      .limit(24)
      .then(({ data }) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        setApproved(((data || []) as any[]).filter((c) => c.tool_a && c.tool_b) as ApprovedComparison[]);
        setLoading(false);
      });
  }, []);

  useEffect(() => {
    if (recentSlugs.length === 0) {
      setRecent([]);
      return;
    }
    supabase
      .from('tool_comparisons')
      .select(
        'slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(slug,name,logo), tool_b:tools!tool_comparisons_tool_b_id_fkey(slug,name,logo)'
      )
      .in('slug', recentSlugs)
      .eq('status', 'published')
      .then(({ data }) => {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const rows = ((data || []) as any[]).filter((c) => c.tool_a && c.tool_b) as ApprovedComparison[];
        const bySlug = new Map(rows.map((c) => [c.slug, c]));
        setRecent(recentSlugs.map((slug) => bySlug.get(slug)).filter((c): c is ApprovedComparison => Boolean(c)));
      });
  }, [recentSlugs]);

  function handleCompare() {
    setFormError(null);
    if (!toolA || !toolB) {
      setFormError('Choose two tools to compare.');
      return;
    }
    if (toolA.slug === toolB.slug) {
      setFormError('Choose two different tools.');
      return;
    }
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

      <SoftwareHeader />

      <main className="max-w-5xl mx-auto px-4 sm:px-6 py-14 sm:py-20">
        <div className="text-center max-w-2xl mx-auto mb-10">
          <div className="w-12 h-12 rounded-2xl bg-indigo-50 flex items-center justify-center mx-auto mb-4">
            <GitCompareArrows className="w-5 h-5 text-indigo-500" />
          </div>
          <h1 className="text-3xl sm:text-4xl font-bold text-[#0B1221] tracking-tight">Compare Software, Side by Side</h1>
          <p className="text-slate-500 mt-3 text-[15px]">
            Pick two tools to see pricing, platforms, free plans, and real editorial differences — no fabricated scores, just what's actually documented.
          </p>
        </div>

        <div className="bg-white border border-[#eef0f3] rounded-3xl p-5 sm:p-6 shadow-[0_8px_24px_rgba(15,23,42,0.06)] mb-14">
          <div className="flex flex-col sm:flex-row items-stretch sm:items-end gap-3">
            <ToolSelectCombobox label="Tool A" value={toolA} onChange={setToolA} excludeSlug={toolB?.slug} />
            <div className="hidden sm:flex items-center justify-center w-8 h-14 shrink-0 text-slate-300 font-bold text-xs">VS</div>
            <ToolSelectCombobox label="Tool B" value={toolB} onChange={setToolB} excludeSlug={toolA?.slug} />
            <button
              type="button"
              onClick={handleCompare}
              className="h-14 shrink-0 inline-flex items-center justify-center gap-2 px-6 rounded-2xl bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] text-white font-semibold text-sm hover:opacity-95 transition-opacity"
            >
              Compare
              <ArrowRight className="w-4 h-4" />
            </button>
          </div>
          {formError && <p className="text-sm text-red-600 mt-3">{formError}</p>}
        </div>

        {!loading && approved.length > 0 && (
          <section className="mb-14">
            <h2 className="text-lg font-bold text-[#0B1221] mb-4">Popular Comparisons</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {approved.map((c) => (
                <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
              ))}
            </div>
          </section>
        )}

        {!loading && approved.length === 0 && (
          <div className="text-center py-10 border border-dashed border-slate-200 rounded-2xl mb-14">
            <p className="text-sm text-slate-500">No approved comparisons yet — pick two tools above to build one.</p>
          </div>
        )}

        {recent.length > 0 && (
          <section>
            <h2 className="text-lg font-bold text-[#0B1221] mb-4">Recently Viewed</h2>
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
