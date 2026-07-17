import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Layers, ArrowRight } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import RoundupCard from '../components/roundup/RoundupCard';
import { supabase } from '../lib/supabase';

interface RoundupToolRef {
  slug: string;
  name: string;
  logo: string | null;
}

interface RoundupListItem {
  slug: string;
  title: string;
  tools: RoundupToolRef[];
}

function RoundupCardSkeleton() {
  return (
    <div className="flex items-center gap-4 bg-white border border-[#eef0f3] rounded-2xl p-5 animate-pulse">
      <div className="flex items-center -space-x-2 shrink-0">
        <div className="w-10 h-10 rounded-xl bg-slate-100" />
        <div className="w-10 h-10 rounded-xl bg-slate-100" />
        <div className="w-10 h-10 rounded-xl bg-slate-100" />
      </div>
      <div className="flex-1 min-w-0 space-y-1.5">
        <div className="h-3.5 bg-slate-100 rounded w-2/3" />
        <div className="h-2.5 bg-slate-50 rounded w-1/3" />
      </div>
    </div>
  );
}

export default function RoundupPage() {
  const [roundups, setRoundups] = useState<RoundupListItem[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase
      .from('tool_roundups')
      .select('slug, title, tool_roundup_members(sort_order, tools(slug, name, logo))')
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
            tools: (r.tool_roundup_members || [])
              .sort((a: { sort_order: number }, b: { sort_order: number }) => a.sort_order - b.sort_order)
              .map((m: { tools: RoundupToolRef }) => m.tools)
              .filter(Boolean),
          }))
          .filter((r) => r.tools.length >= 3);
        setRoundups(mapped);
        setLoading(false);
      });
  }, []);

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title="Multi-Tool Roundups: Compare 3+ Software Tools Side by Side | Gappsy"
        description="Compare three or more software tools at once — pricing, features, and verdicts for the whole category, not just a single pair."
        path="/roundup"
        breadcrumbs={[{ name: 'Roundups', path: '/roundup' }]}
      />

      <SoftwareHeader variant="premium" />

      <main className="max-w-5xl mx-auto px-4 sm:px-6 py-14 sm:py-20">
        <div className="text-center max-w-2xl mx-auto mb-10">
          <div className="w-12 h-12 rounded-2xl bg-[#EEF0FE] flex items-center justify-center mx-auto mb-4">
            <Layers className="w-5 h-5 text-[#4F47E6]" />
          </div>
          <h1 className="text-3xl sm:text-4xl font-bold text-[#0B1221] tracking-tight">Multi-Tool Roundups</h1>
          <p className="text-slate-500 mt-3 text-[15px]">
            See three or more tools compared side by side in one page — pricing, features, and who each one is actually built for.
          </p>
          <Link to="/compare" className="inline-flex items-center gap-1.5 text-sm font-semibold text-[#4F47E6] hover:text-[#4338CA] mt-4">
            Comparing just two tools? Use the 1-on-1 comparison tool
            <ArrowRight className="w-3.5 h-3.5" />
          </Link>
        </div>

        <section>
          <ToolsSectionHeader eyebrow="Roundups" title="Published Roundups" />
          {loading && (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <RoundupCardSkeleton />
              <RoundupCardSkeleton />
            </div>
          )}
          {!loading && roundups.length > 0 && (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {roundups.map((r) => (
                <RoundupCard key={r.slug} slug={r.slug} title={r.title} tools={r.tools} />
              ))}
            </div>
          )}
          {!loading && roundups.length === 0 && (
            <div className="text-center py-10 border border-dashed border-slate-200 rounded-2xl">
              <p className="text-sm text-slate-500">No roundups published yet — check back soon.</p>
            </div>
          )}
        </section>
      </main>

      <FooterWrapper />
    </div>
  );
}
