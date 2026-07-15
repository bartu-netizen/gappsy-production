import { useEffect, useMemo, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Tag as TagIcon, ArrowLeft } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import ToolSpotlight from '../components/tools/ToolSpotlight';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState, { type ToolsEmptyStateLink } from '../components/tools/ToolsEmptyState';
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
  const [otherTags, setOtherTags] = useState<ToolsEmptyStateLink[]>([]);
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
            const toolRows = (links || []).map((row) => row.tools);
            setTools(toolRows);

            if (toolRows.length === 0) {
              Promise.all([
                supabase.from('tool_tags').select('id, slug, name').neq('id', data.id),
                supabase.from('tool_tag_links').select('tag_id, tools!inner(status)').eq('tools.status', 'published'),
              ]).then(([otherTagsResult, tagLinksResult]) => {
                const counts = new Map<string, number>();
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                (tagLinksResult.data || []).forEach((row: any) => {
                  counts.set(row.tag_id, (counts.get(row.tag_id) || 0) + 1);
                });
                const popular = (otherTagsResult.data || [])
                  .map((t) => ({ label: t.name, href: `/tool-tags/${t.slug}`, count: counts.get(t.id) || 0 }))
                  .filter((t) => t.count > 0)
                  .sort((a, b) => b.count - a.count)
                  .slice(0, 4)
                  .map(({ label, href }) => ({ label, href }));
                setOtherTags(popular);
                setLoading(false);
              });
            } else {
              setLoading(false);
            }
          });
      });
  }, [tagSlug]);

  const spotlightTool = useMemo(() => {
    if (tools.length === 0) return null;
    return tools.find((t) => t.featured) || [...tools].sort((a, b) => b.rating - a.rating)[0];
  }, [tools]);

  const restTools = tools.filter((t) => t.slug !== spotlightTool?.slug);

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <SoftwareHeader variant="premium" />
        <main className="max-w-6xl mx-auto px-4 sm:px-6 py-12">
          <ToolsSkeletonGrid count={6} />
        </main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tag) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Tag Not Found | Gappsy" description="This tag could not be found." path={`/tool-tags/${tagSlug || ''}`} noindex />
        <SoftwareHeader variant="premium" />
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <TagIcon className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">Tag not found</h1>
          <p className="text-slate-500 mb-6">This tag doesn't exist or has no published tools.</p>
          <Link to="/tools" className="inline-flex items-center gap-1.5 text-[#0A1735] font-semibold hover:text-[#132952]">
            <ArrowLeft className="w-4 h-4" />
            Browse all tools
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={`${tag.name} Tools | Gappsy`}
        description={tag.description || `Browse tools tagged "${tag.name}".`}
        path={`/tool-tags/${tag.slug}`}
        breadcrumbs={[{ name: 'Tools', path: '/tools' }, { name: tag.name, path: `/tool-tags/${tag.slug}` }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': `https://www.gappsy.com/tool-tags/${tag.slug}/#collection`, name: `${tag.name} Tools` }]}
      />

      <SoftwareHeader variant="premium" />

      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-10 sm:pb-12 text-center">
        <Link to="/tools" className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-400 hover:text-slate-600 transition-colors mb-5">
          <ArrowLeft className="w-3 h-3" />
          All tools
        </Link>
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#0A1735] mb-3 inline-flex items-center gap-1.5">
          <TagIcon className="w-3 h-3" />
          Tag
        </p>
        <h1 className="text-3xl sm:text-[38px] font-bold text-[#0B1221] leading-[1.1] mb-4">{tag.name}</h1>
        <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto">
          {tag.description || `Tools the community has tagged "${tag.name}."`}
        </p>
      </section>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-20">
        {tools.length === 0 ? (
          <ToolsEmptyState
            icon={TagIcon}
            eyebrow={tag.name}
            title="No tools tagged here yet"
            description="This tag hasn't been used yet. Here are some of the most popular tags to browse instead."
            actionLabel="Browse all tools"
            actionHref="/tools"
            exploreLinks={otherTags}
            exploreLabel="Popular tags"
          />
        ) : (
          <div className="space-y-12">
            {spotlightTool && (
              <section>
                <ToolSpotlight tool={spotlightTool} eyebrow={`Top pick tagged "${tag.name}"`} />
              </section>
            )}

            {restTools.length > 0 && (
              <section>
                <ToolsSectionHeader title={`More tagged "${tag.name}"`} />
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
