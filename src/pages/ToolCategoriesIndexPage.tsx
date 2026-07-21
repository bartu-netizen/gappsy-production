import { useEffect, useState } from 'react';
import { FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import CategoryTile, { type CategoryTileData } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState from '../components/tools/ToolsEmptyState';
import ToolCardRow from '../components/tools/detail/ToolCardRow';
import TrendingToolsSection from '../components/tools/TrendingToolsSection';
import SmartSearchBox from '../components/search/SmartSearchBox';
import AskGappsyBubble from '../components/askGappsy/AskGappsyBubble';
import { useFeaturedToolPool, FeaturedToolSidebarCompact } from '../components/tools/detail/FeaturedToolPromo';
import { buildCanonicalUrl } from '../utils/canonicalUrl';
import { supabase } from '../lib/supabase';
import type { ToolCardData } from '../components/ToolCard';

const FEATURED_COUNT = 3;
const TOOL_CARD_COLUMNS = 'slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured';

const CATEGORY_EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'Something to track team tasks',
  'CRM with a free trial',
];

export default function ToolCategoriesIndexPage() {
  const [categories, setCategories] = useState<CategoryTileData[]>([]);
  const [recentlyUpdated, setRecentlyUpdated] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);

  // Same featured-ad mechanism as tool/compare pages, shown beside the
  // search box — this index page had zero ad placements before, unlike
  // every other detail-page type.
  const featuredPool = useFeaturedToolPool([], 2);

  useEffect(() => {
    Promise.all([
      supabase.from('tool_categories').select('id, slug, name, description, icon').eq('status', 'published').order('name'),
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

  const featured = categories.slice(0, FEATURED_COUNT);
  const rest = categories.slice(FEATURED_COUNT);

  const itemListJsonLd =
    categories.length > 0
      ? [
          {
            '@type': 'ItemList',
            '@id': 'https://gappsy.com/tool-categories/#itemlist',
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

      <section className="max-w-2xl mx-auto px-4 sm:px-6 pt-8 sm:pt-12 pb-6 text-center">
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-3">Browse</p>
        <h1 className="text-3xl sm:text-4xl font-bold text-[#0B1221] leading-[1.15] mb-4">
          Find tools by category
        </h1>

        {!loading && categories.length > 0 && (
          <div className="inline-flex items-center gap-2 bg-white border border-slate-200 rounded-full px-4 py-1.5 shadow-sm">
            <span className="text-sm font-bold text-[#4F47E6] tabular-nums">{categories.length}</span>
            <span className="text-[13px] text-slate-500">categories to explore</span>
          </div>
        )}
      </section>

      <section className="max-w-5xl mx-auto px-4 sm:px-6 pb-8 sm:pb-10">
        <div className="grid lg:grid-cols-[1.6fr_1fr] gap-5 items-start">
          <div className="min-w-0">
            <SmartSearchBox
              mode="category"
              title="What do you need help finding?"
              subtitle="Tell us what you're trying to solve — we'll point you to the right category"
              placeholder="A tool, a need, or 'agency in New Jersey'…"
              exampleQueries={CATEGORY_EXAMPLE_QUERIES}
            />
          </div>
          {featuredPool && featuredPool.length > 0 && (
            <div className="min-w-0 flex flex-col gap-3">
              {featuredPool.map((promo) => (
                <FeaturedToolSidebarCompact key={promo.slug} tool={promo} />
              ))}
            </div>
          )}
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

        {!loading && categories.length > 0 && (
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

            <TrendingToolsSection />

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
      <AskGappsyBubble />
    </div>
  );
}
