import { useEffect, useMemo, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { FolderTree, ArrowLeft } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import ToolSpotlight from '../components/tools/ToolSpotlight';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState, { type ToolsEmptyStateLink } from '../components/tools/ToolsEmptyState';
import { supabase } from '../lib/supabase';

interface CategoryDetail {
  id: string;
  slug: string;
  name: string;
  description: string | null;
  seo_title: string | null;
  seo_description: string | null;
}

export default function ToolCategoryDetailPage() {
  const { categorySlug } = useParams<{ categorySlug: string }>();
  const [category, setCategory] = useState<CategoryDetail | null>(null);
  const [tools, setTools] = useState<ToolCardData[]>([]);
  const [otherCategories, setOtherCategories] = useState<ToolsEmptyStateLink[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    if (!categorySlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tool_categories')
      .select('id, slug, name, description, seo_title, seo_description')
      .eq('slug', categorySlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(({ data }) => {
        if (!data) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setCategory(data);

        supabase
          .from('tool_category_links')
          .select('tools!inner(slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, status)')
          .eq('category_id', data.id)
          .eq('tools.status', 'published')
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          .then(({ data: links }: { data: any[] | null }) => {
            const toolRows = (links || []).map((row) => row.tools);
            setTools(toolRows);

            if (toolRows.length === 0) {
              supabase
                .from('tool_categories')
                .select('slug, name')
                .eq('status', 'published')
                .neq('id', data.id)
                .order('name')
                .limit(4)
                .then(({ data: others }) => {
                  setOtherCategories(
                    (others || []).map((c) => ({ label: c.name, href: `/tool-categories/${c.slug}` }))
                  );
                  setLoading(false);
                });
            } else {
              setLoading(false);
            }
          });
      });
  }, [categorySlug]);

  const spotlightTool = useMemo(() => {
    if (tools.length === 0) return null;
    return tools.find((t) => t.featured) || [...tools].sort((a, b) => b.rating - a.rating)[0];
  }, [tools]);

  const restTools = tools.filter((t) => t.slug !== spotlightTool?.slug);

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-6xl mx-auto px-4 sm:px-6 py-12">
          <ToolsSkeletonGrid count={6} />
        </main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !category) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Category Not Found | Gappsy" description="This category could not be found." path={`/tool-categories/${categorySlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">Category not found</h1>
          <p className="text-slate-500 mb-6">This category doesn't exist or is no longer published.</p>
          <Link to="/tool-categories" className="inline-flex items-center gap-1.5 text-indigo-600 font-semibold hover:text-indigo-700">
            <ArrowLeft className="w-4 h-4" />
            Browse all categories
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={category.seo_title || `${category.name} Tools | Gappsy`}
        description={category.seo_description || category.description || `Browse the best ${category.name} tools.`}
        path={`/tool-categories/${category.slug}`}
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }, { name: category.name, path: `/tool-categories/${category.slug}` }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': `https://www.gappsy.com/tool-categories/${category.slug}/#collection`, name: `${category.name} Tools` }]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-10 sm:pb-12 text-center">
        <Link to="/tool-categories" className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-400 hover:text-slate-600 transition-colors mb-5">
          <ArrowLeft className="w-3 h-3" />
          All categories
        </Link>
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-indigo-600 mb-3">Category</p>
        <h1 className="text-3xl sm:text-[38px] font-bold text-[#0B1221] leading-[1.1] mb-4">{category.name}</h1>
        {category.description && (
          <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto">{category.description}</p>
        )}
      </section>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-20">
        {tools.length === 0 ? (
          <ToolsEmptyState
            icon={FolderTree}
            eyebrow={category.name}
            title="No tools published here yet"
            description="This category is still filling out. Take a look at what's already live in these categories instead."
            actionLabel="Browse all tools"
            actionHref="/tools"
            exploreLinks={otherCategories}
          />
        ) : (
          <div className="space-y-12">
            {spotlightTool && (
              <section>
                <ToolSpotlight tool={spotlightTool} eyebrow={`Top pick in ${category.name}`} />
              </section>
            )}

            {restTools.length > 0 && (
              <section>
                <ToolsSectionHeader title={`More in ${category.name}`} />
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                  {restTools.map((tool) => (
                    <ToolCard key={tool.slug} tool={tool} />
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
