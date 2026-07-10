import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { Search } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import { supabase } from '../lib/supabase';

export default function ToolsIndexPage() {
  const [tools, setTools] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');

  useEffect(() => {
    supabase
      .from('tools')
      .select('slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured')
      .eq('status', 'published')
      .order('featured', { ascending: false })
      .order('name')
      .then(({ data }) => {
        setTools((data || []) as ToolCardData[]);
        setLoading(false);
      });
  }, []);

  const filtered = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return tools;
    return tools.filter((t) => t.name.toLowerCase().includes(q) || (t.short_description || '').toLowerCase().includes(q));
  }, [tools, search]);

  return (
    <div>
      <EntitySEOTags
        title="Tools Directory — Discover the Best Software Tools | Gappsy"
        description="Browse a curated directory of software tools, filterable by category and use case."
        path="/tools"
        breadcrumbs={[{ name: 'Tools', path: '/tools' }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': 'https://www.gappsy.com/tools/#collection', name: 'Tools Directory' }]}
      />

      <div className="pt-6 pb-2">
        <MiniHeader />
      </div>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 py-8">
        <div className="flex items-center justify-between flex-wrap gap-2 mb-2">
          <h1 className="text-3xl font-bold text-slate-900">Tools Directory</h1>
          <Link to="/tool-categories" className="text-sm text-blue-600 hover:text-blue-700 font-medium">
            Browse by category →
          </Link>
        </div>
        <p className="text-slate-500 mb-6">Discover and compare software tools.</p>

        <div className="relative mb-6 max-w-sm">
          <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Search tools..."
            className="w-full pl-9 pr-3 py-2 text-sm border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
        </div>

        {loading && <p className="text-slate-400 text-sm">Loading tools...</p>}

        {!loading && filtered.length === 0 && <p className="text-slate-400 text-sm">No tools found.</p>}

        {!loading && filtered.length > 0 && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {filtered.map((tool) => (
              <ToolCard key={tool.slug} tool={tool} />
            ))}
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
