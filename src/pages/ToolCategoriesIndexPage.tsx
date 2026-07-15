import { useEffect, useMemo, useState } from 'react';
import { FolderTree, Search, X } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import CategoryTile, { type CategoryTileData } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState from '../components/tools/ToolsEmptyState';
import ToolCardRow from '../components/tools/detail/ToolCardRow';
import { buildCanonicalUrl } from '../utils/canonicalUrl';
import { supabase } from '../lib/supabase';
import type { ToolCardData } from '../components/ToolCard';

const FEATURED_COUNT = 3;
const TOOL_CARD_COLUMNS = 'slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured';

export default function ToolCategoriesIndexPage() {
  const [categories, setCategories] = useState<CategoryTileData[]>([]);
  const [recentlyUpdated, setRecentlyUpdated] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');

  useEffect(() => {
    Promise.all([
      supabase.from('tool_categories').select('id, slug, name, description').eq('status', 'published').order('name'),
      supabase.from('tool_category_links').select('category_id, tools!inner(status)').eq('tools.status', 'published'),
      supabase.from('tools').select(TOOL_CARD_COLUMNS).eq('status', 'published').order('updated_at', { ascending: false }).limit(8),
    ]).then(([categoriesResult, linksResult, recentResult]) => {
      const counts = new Map<string, number>();
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (linksResult.data || []).forEach((row: any) => {
        counts.set(row.category_id, (counts.get(row.category_id) || 0) + 1);
      });
      const data = (categoriesResult.data || [])
        .map((c) => ({ ...c, toolCount: counts.get(c.id) || 0 }))
        .sort((a, b) => b.toolCount - a.toolCount);
      setCategories(data);
      setRecentlyUpdated(recentResult.data || []);
      setLoading(false);
    });
  }, []);

  const searchResults = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return null;
    return categories.filter((c) => c.name.toLowerCase().includes(q) || (c.description || '').toLowerCase().includes(q));
  }, [categories, search]);

  const isSearching = search.trim().length > 0;
  const featured = categories.slice(0, FEATURED_COUNT);
  const rest = categories.slice(FEATURED_COUNT);

  const itemListJsonLd =
    categories.length > 0
      ? [
          {
            '@type': 'ItemList',
            '@id': 'https://www.gappsy.com/tool-categories/#itemlist',
            itemListElement: categories.map((c, i) => ({
              '@type': 'ListItem',
              position: i + 1,
              name: c.name,
              url: buildCanonicalUrl(`/tool-categories/${c.slug}`),
            })),
          },
        ]
      : [];

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title="Tool Categories — Browse Software by Category | Gappsy"
        description="Browse software tools organized by category — find the right category, then compare top-rated tools inside it."
        path="/tool-categories"
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }]}
        jsonLd={itemListJsonLd}
      />

      <SoftwareHeader variant="premium" />

      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-8 sm:pt-12 pb-8 sm:pb-10 text-center">
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-blue-600 mb-3">Browse</p>
        <h1 className="text-3xl sm:text-[38px] font-bold text-[#0B1221] leading-[1.1] mb-4">
          Find tools by category
        </h1>
        <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto mb-8">
          Every category is a starting point — pick the one closest to what you're trying to solve.
        </p>

        <div className="relative max-w-lg mx-auto">
          <div className="flex items-center w-full h-12 rounded-full bg-white border border-slate-200 shadow-sm focus-within:ring-2 focus-within:ring-blue-500/20 focus-within:border-blue-300 transition-shadow">
            <Search className="ml-4 h-4 w-4 text-slate-400 shrink-0" strokeWidth={2} aria-hidden="true" />
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Filter categories…"
              className="flex-1 h-full bg-transparent outline-none px-3 text-sm text-[#0B1221] placeholder-slate-400"
            />
            {isSearching && (
              <button onClick={() => setSearch('')} className="mr-4 text-slate-400 hover:text-slate-600 transition-colors" aria-label="Clear filter">
                <X className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>
      </section>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-20">
        {loading && <ToolsSkeletonGrid count={6} />}

        {!loading && categories.length === 0 && (
          <ToolsEmptyState
            icon={FolderTree}
            eyebrow="Browse"
            title="Categories are on their way"
            description="We're organizing the directory into categories now. Check back shortly."
            actionLabel="Browse all tools"
            actionHref="/tools"
          />
        )}

        {!loading && isSearching && (
          <section>
            <ToolsSectionHeader title={`${searchResults?.length || 0} categor${searchResults?.length === 1 ? 'y' : 'ies'} match "${search.trim()}"`} />
            {searchResults && searchResults.length > 0 ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
                {searchResults.map((category) => (
                  <CategoryTile key={category.slug} category={category} size="compact" />
                ))}
              </div>
            ) : (
              <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-blue-50 via-white to-white border border-[#eef0f3] px-6 sm:px-12 py-14 sm:py-16 text-center">
                <div className="mx-auto w-14 h-14 rounded-2xl bg-white border border-blue-100 shadow-sm flex items-center justify-center mb-6">
                  <Search className="w-6 h-6 text-blue-600" strokeWidth={1.75} />
                </div>
                <h3 className="text-xl sm:text-2xl font-bold text-[#0B1221] mb-3 max-w-lg mx-auto leading-snug">No categories match that filter</h3>
                <p className="text-slate-500 text-[15px] leading-relaxed max-w-md mx-auto mb-7">Try a different word, or browse the full list below.</p>
                <button
                  type="button"
                  onClick={() => setSearch('')}
                  className="inline-flex items-center gap-1.5 bg-[#2952CC] hover:bg-[#1F3FA3] text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors"
                >
                  Clear filter
                </button>
              </div>
            )}
          </section>
        )}

        {!loading && !isSearching && categories.length > 0 && (
          <div className="space-y-14">
            {featured.length > 0 && (
              <section>
                <ToolsSectionHeader eyebrow="Most active" title="Popular categories" />
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
                  {featured.map((category) => (
                    <CategoryTile key={category.slug} category={category} size="large" />
                  ))}
                </div>
              </section>
            )}

            {rest.length > 0 && (
              <section>
                <ToolsSectionHeader title="All categories" />
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
                  {rest.map((category) => (
                    <CategoryTile key={category.slug} category={category} size="compact" />
                  ))}
                </div>
              </section>
            )}

            <ToolCardRow eyebrow="Fresh listings" title="Recently updated tools" tools={recentlyUpdated} minToShow={1} />
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
