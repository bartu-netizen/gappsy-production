import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
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
            setTools((links || []).map((row) => row.tools));
            setLoading(false);
          });
      });
  }, [categorySlug]);

  if (loading) {
    return (
      <div>
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-6xl mx-auto px-4 py-16 text-center text-slate-400">Loading...</main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !category) {
    return (
      <div>
        <EntitySEOTags title="Category Not Found | Gappsy" description="This category could not be found." path={`/tool-categories/${categorySlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-16 text-center">
          <h1 className="text-2xl font-bold text-slate-900 mb-2">Category Not Found</h1>
          <Link to="/tool-categories" className="text-blue-600 font-medium hover:text-blue-700">Browse all categories →</Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  return (
    <div>
      <EntitySEOTags
        title={category.seo_title || `${category.name} Tools | Gappsy`}
        description={category.seo_description || category.description || `Browse the best ${category.name} tools.`}
        path={`/tool-categories/${category.slug}`}
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }, { name: category.name, path: `/tool-categories/${category.slug}` }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': `https://www.gappsy.com/tool-categories/${category.slug}/#collection`, name: `${category.name} Tools` }]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 py-8">
        <h1 className="text-3xl font-bold text-slate-900 mb-2">{category.name} Tools</h1>
        {category.description && <p className="text-slate-500 mb-6">{category.description}</p>}

        {tools.length === 0 && <p className="text-slate-400 text-sm">No published tools in this category yet.</p>}

        {tools.length > 0 && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {tools.map((tool) => (
              <ToolCard key={tool.slug} tool={tool} />
            ))}
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
