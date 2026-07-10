import { useEffect, useState } from 'react';
import { FolderTree } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import CategoryTile, { type CategoryTileData } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState from '../components/tools/ToolsEmptyState';
import { supabase } from '../lib/supabase';

const FEATURED_COUNT = 3;

export default function ToolCategoriesIndexPage() {
  const [categories, setCategories] = useState<CategoryTileData[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([
      supabase.from('tool_categories').select('id, slug, name, description').eq('status', 'published').order('name'),
      supabase.from('tool_category_links').select('category_id, tools!inner(status)').eq('tools.status', 'published'),
    ]).then(([categoriesResult, linksResult]) => {
      const counts = new Map<string, number>();
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (linksResult.data || []).forEach((row: any) => {
        counts.set(row.category_id, (counts.get(row.category_id) || 0) + 1);
      });
      const data = (categoriesResult.data || [])
        .map((c) => ({ ...c, toolCount: counts.get(c.id) || 0 }))
        .sort((a, b) => b.toolCount - a.toolCount);
      setCategories(data);
      setLoading(false);
    });
  }, []);

  const featured = categories.slice(0, FEATURED_COUNT);
  const rest = categories.slice(FEATURED_COUNT);

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title="Tool Categories — Browse Software by Category | Gappsy"
        description="Browse software tools organized by category."
        path="/tool-categories"
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-10 sm:pb-14 text-center">
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-indigo-600 mb-3">Browse</p>
        <h1 className="text-3xl sm:text-[38px] font-bold text-[#0B1221] leading-[1.1] mb-4">
          Find tools by category
        </h1>
        <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto">
          Every category is a starting point — pick the one closest to what you're trying to solve.
        </p>
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

            {rest.length > 0 && (
              <section>
                <ToolsSectionHeader title="All other categories" />
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {rest.map((category) => (
                    <CategoryTile key={category.slug} category={category} size="compact" />
                  ))}
                </div>
              </section>
            )}
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
