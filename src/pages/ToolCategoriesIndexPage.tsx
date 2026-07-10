import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { FolderTree } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import { supabase } from '../lib/supabase';

interface CategoryWithCount {
  id: string;
  slug: string;
  name: string;
  description: string | null;
  toolCount: number;
}

export default function ToolCategoriesIndexPage() {
  const [categories, setCategories] = useState<CategoryWithCount[]>([]);
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
      const data = (categoriesResult.data || []).map((c) => ({ ...c, toolCount: counts.get(c.id) || 0 }));
      setCategories(data);
      setLoading(false);
    });
  }, []);

  return (
    <div>
      <EntitySEOTags
        title="Tool Categories — Browse Software by Category | Gappsy"
        description="Browse software tools organized by category."
        path="/tool-categories"
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 py-8">
        <h1 className="text-3xl font-bold text-slate-900 mb-2">Tool Categories</h1>
        <p className="text-slate-500 mb-6">Browse tools by category.</p>

        {loading && <p className="text-slate-400 text-sm">Loading categories...</p>}

        {!loading && categories.length === 0 && <p className="text-slate-400 text-sm">No categories yet.</p>}

        {!loading && categories.length > 0 && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {categories.map((category) => (
              <Link
                key={category.id}
                to={`/tool-categories/${category.slug}`}
                className="flex flex-col bg-white border border-slate-200 rounded-xl p-5 hover:shadow-md hover:border-slate-300 transition-all"
              >
                <div className="flex items-center gap-2 mb-2">
                  <FolderTree className="w-4 h-4 text-slate-400" />
                  <h3 className="font-semibold text-slate-900 text-sm">{category.name}</h3>
                </div>
                {category.description && <p className="text-sm text-slate-500 line-clamp-2 mb-2">{category.description}</p>}
                <p className="text-xs text-slate-400 mt-auto">{category.toolCount} tool{category.toolCount === 1 ? '' : 's'}</p>
              </Link>
            ))}
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
