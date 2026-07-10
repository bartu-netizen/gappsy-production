import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import { supabase } from '../lib/supabase';

interface TagDetail {
  id: string;
  slug: string;
  name: string;
  description: string | null;
}

export default function ToolTagDetailPage() {
  const { tagSlug } = useParams<{ tagSlug: string }>();
  const [tag, setTag] = useState<TagDetail | null>(null);
  const [tools, setTools] = useState<ToolCardData[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    if (!tagSlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tool_tags')
      .select('id, slug, name, description')
      .eq('slug', tagSlug)
      .maybeSingle()
      .then(({ data }) => {
        if (!data) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setTag(data);

        supabase
          .from('tool_tag_links')
          .select('tools!inner(slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, status)')
          .eq('tag_id', data.id)
          .eq('tools.status', 'published')
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          .then(({ data: links }: { data: any[] | null }) => {
            setTools((links || []).map((row) => row.tools));
            setLoading(false);
          });
      });
  }, [tagSlug]);

  if (loading) {
    return (
      <div>
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-6xl mx-auto px-4 py-16 text-center text-slate-400">Loading...</main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tag) {
    return (
      <div>
        <EntitySEOTags title="Tag Not Found | Gappsy" description="This tag could not be found." path={`/tool-tags/${tagSlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-16 text-center">
          <h1 className="text-2xl font-bold text-slate-900 mb-2">Tag Not Found</h1>
          <Link to="/tools" className="text-blue-600 font-medium hover:text-blue-700">Browse all tools →</Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  return (
    <div>
      <EntitySEOTags
        title={`${tag.name} Tools | Gappsy`}
        description={tag.description || `Browse tools tagged "${tag.name}".`}
        path={`/tool-tags/${tag.slug}`}
        breadcrumbs={[{ name: 'Tools', path: '/tools' }, { name: tag.name, path: `/tool-tags/${tag.slug}` }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': `https://www.gappsy.com/tool-tags/${tag.slug}/#collection`, name: `${tag.name} Tools` }]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 py-8">
        <h1 className="text-3xl font-bold text-slate-900 mb-2">{tag.name} Tools</h1>
        {tag.description && <p className="text-slate-500 mb-6">{tag.description}</p>}

        {tools.length === 0 && <p className="text-slate-400 text-sm">No published tools with this tag yet.</p>}

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
