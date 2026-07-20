import { useEffect, useMemo, useState } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { Search, Sparkles, Tag as TagIcon, Clock, Mail } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import ToolSpotlight from '../components/tools/ToolSpotlight';
import CategoryTile, { type CategoryTileData } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState from '../components/tools/ToolsEmptyState';
import AskGappsyBubble from '../components/askGappsy/AskGappsyBubble';
import SmartSearchBox from '../components/search/SmartSearchBox';
import { supabase } from '../lib/supabase';

const TOOLS_EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'Something to track team tasks',
  'CRM with a free trial',
];

interface ToolRow extends ToolCardData {
  created_at: string;
}

interface TagWithCount {
  slug: string;
  name: string;
  toolCount: number;
}

export default function ToolsIndexPage() {
  const [tools, setTools] = useState<ToolRow[]>([]);
  const [categories, setCategories] = useState<CategoryTileData[]>([]);
  const [tags, setTags] = useState<TagWithCount[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchParams] = useSearchParams();
  const [search] = useState(() => searchParams.get('q') || '');

  useEffect(() => {
    Promise.all([
      supabase
        .from('tools')
        .select('slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, created_at')
        .eq('status', 'published')
        .order('featured', { ascending: false })
        .order('name'),
      supabase.from('tool_categories').select('id, slug, name, description, icon').eq('status', 'published').order('name'),
      supabase.from('tool_category_links').select('category_id, tools!inner(status)').eq('tools.status', 'published'),
      supabase.from('tool_tags').select('id, slug, name').order('name'),
      supabase.from('tool_tag_links').select('tag_id, tools!inner(status)').eq('tools.status', 'published'),
    ]).then(([toolsResult, categoriesResult, categoryLinksResult, tagsResult, tagLinksResult]) => {
      setTools((toolsResult.data || []) as ToolRow[]);

      const categoryCounts = new Map<string, number>();
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (categoryLinksResult.data || []).forEach((row: any) => {
        categoryCounts.set(row.category_id, (categoryCounts.get(row.category_id) || 0) + 1);
      });
      const categoriesWithCounts = (categoriesResult.data || [])
        .map((c) => ({ ...c, toolCount: categoryCounts.get(c.id) || 0 }))
        .sort((a, b) => b.toolCount - a.toolCount);
      setCategories(categoriesWithCounts);

      const tagCounts = new Map<string, number>();
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (tagLinksResult.data || []).forEach((row: any) => {
        tagCounts.set(row.tag_id, (tagCounts.get(row.tag_id) || 0) + 1);
      });
      const tagsWithCounts = (tagsResult.data || [])
        .map((t) => ({ slug: t.slug, name: t.name, toolCount: tagCounts.get(t.id) || 0 }))
        .filter((t) => t.toolCount > 0)
        .sort((a, b) => b.toolCount - a.toolCount)
        .slice(0, 14);
      setTags(tagsWithCounts);

      setLoading(false);
    });
  }, []);

  const searchResults = useMemo(() => {
    const q = search.trim().toLowerCase();
    if (!q) return null;
    return tools.filter((t) => t.name.toLowerCase().includes(q) || (t.short_description || '').toLowerCase().includes(q));
  }, [tools, search]);

  const spotlightTool = useMemo(() => {
    if (tools.length === 0) return null;
    return tools.find((t) => t.featured) || [...tools].sort((a, b) => b.rating - a.rating)[0];
  }, [tools]);

  const recentTools = useMemo(() => {
    return [...tools]
      .filter((t) => t.slug !== spotlightTool?.slug)
      .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
      .slice(0, 5);
  }, [tools, spotlightTool]);

  const topCategories = categories.slice(0, 3);
  const isSearching = search.trim().length > 0;
  const maxTagCount = tags[0]?.toolCount || 1;

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title="Tools Directory — Discover the Best Software Tools | Gappsy"
        description="Browse a curated directory of software tools, filterable by category and use case."
        path="/tools"
        breadcrumbs={[{ name: 'Tools', path: '/tools' }]}
        jsonLd={[{ '@type': 'CollectionPage', '@id': 'https://gappsy.com/tools/#collection', name: 'Tools Directory' }]}
      />

      <SoftwareHeader variant="premium" />

      {/* Hero */}
      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-10 sm:pb-14 text-center">
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-3">Tools Directory</p>
        <h1 className="text-3xl sm:text-[40px] font-bold text-[#0B1221] leading-[1.1] mb-4">
          Software worth building your stack around
        </h1>
        <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto mb-8">
          A curated directory of tools — hand-picked, organized by category, and easy to compare.
        </p>

        <SmartSearchBox
          mode="general"
          title="What do you need help finding?"
          subtitle="Tell us what you're trying to solve — we'll point you to the right tool"
          placeholder="A tool, a need, or 'agency in New Jersey'…"
          exampleQueries={TOOLS_EXAMPLE_QUERIES}
        />
      </section>

      <main className="max-w-6xl mx-auto px-4 sm:px-6 pb-20">
        {loading && <ToolsSkeletonGrid count={6} />}

        {!loading && isSearching && (
          <section>
            <ToolsSectionHeader
              title={`${searchResults?.length || 0} result${searchResults?.length === 1 ? '' : 's'} for "${search.trim()}"`}
            />
            {searchResults && searchResults.length > 0 ? (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                {searchResults.map((tool) => (
                  <ToolCard key={tool.slug} tool={tool} />
                ))}
              </div>
            ) : (
              <ToolsEmptyState
                icon={Search}
                title="Nothing matches that search"
                description="Try a different name, use case, or browse the directory by category instead."
                actionLabel="Clear search"
                actionHref="/tools"
                exploreLinks={topCategories.map((c) => ({ label: c.name, href: `/tool-categories/${c.slug}` }))}
              />
            )}
          </section>
        )}

        {!loading && !isSearching && tools.length === 0 && (
          <ToolsEmptyState
            icon={Sparkles}
            eyebrow="Tools Directory"
            title="The directory is just getting started"
            description="We're curating the first wave of tools now. Check back soon, or browse categories to see what's coming."
            actionLabel="Browse categories"
            actionHref="/tool-categories"
          />
        )}

        {!loading && !isSearching && tools.length > 0 && (
          <div className="space-y-16 sm:space-y-20">
            {spotlightTool && (
              <section>
                <ToolSpotlight tool={spotlightTool} />
              </section>
            )}

            {topCategories.length > 0 && (
              <section>
                <ToolsSectionHeader
                  eyebrow="Curated"
                  title="Explore by category"
                  subtitle="A few starting points — or browse the full list."
                  viewAllHref="/tool-categories"
                  viewAllLabel="All categories"
                />
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
                  {topCategories.map((category) => (
                    <CategoryTile key={category.slug} category={category} size="large" />
                  ))}
                </div>
              </section>
            )}

            {recentTools.length > 0 && (
              <section>
                <ToolsSectionHeader eyebrow="Fresh" title="Recently added" />
                <div className="bg-white border border-[#eef0f3] rounded-2xl divide-y divide-[#eef0f3] overflow-hidden">
                  {recentTools.map((tool) => (
                    <Link
                      key={tool.slug}
                      to={`/tools/${tool.slug}`}
                      className="flex items-center gap-4 px-5 py-4 hover:bg-slate-50/80 transition-colors group"
                    >
                      {tool.logo ? (
                        <img src={tool.logo} alt={tool.name} className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0" />
                      ) : (
                        <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 text-sm font-semibold shrink-0">
                          {tool.name.charAt(0)}
                        </div>
                      )}
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-semibold text-[#0B1221] group-hover:text-[#4F47E6] transition-colors truncate">
                          {tool.name}
                        </p>
                        {tool.short_description && (
                          <p className="text-xs text-slate-500 truncate">{tool.short_description}</p>
                        )}
                      </div>
                      <Clock className="w-3.5 h-3.5 text-slate-300 shrink-0" />
                    </Link>
                  ))}
                </div>
              </section>
            )}

            {tags.length > 0 && (
              <section>
                <ToolsSectionHeader eyebrow="Browse" title="Popular tags" />
                <div className="flex flex-wrap gap-2.5">
                  {tags.map((tag) => {
                    const weight = tag.toolCount / maxTagCount;
                    const scaleClass = weight > 0.66 ? 'text-[15px] px-4 py-2' : weight > 0.33 ? 'text-sm px-3.5 py-1.5' : 'text-[13px] px-3 py-1.5';
                    return (
                      <Link
                        key={tag.slug}
                        to={`/tool-tags/${tag.slug}`}
                        className={`inline-flex items-center gap-1.5 bg-white border border-[#eef0f3] rounded-full font-medium text-slate-600 hover:text-[#4F47E6] hover:border-[#C7CCF7] transition-colors ${scaleClass}`}
                      >
                        <TagIcon className="w-3 h-3 text-slate-300" />
                        {tag.name}
                      </Link>
                    );
                  })}
                </div>
              </section>
            )}

            <section className="bg-[#0F172A] rounded-[28px] px-6 sm:px-12 py-12 sm:py-14 text-center">
              <div className="w-11 h-11 rounded-xl bg-white/10 flex items-center justify-center mx-auto mb-5">
                <Mail className="w-5 h-5 text-white" />
              </div>
              <h3 className="text-xl sm:text-2xl font-bold text-white mb-2.5">Get the best new tools first</h3>
              <p className="text-slate-300 text-sm sm:text-[15px] max-w-md mx-auto mb-7 leading-relaxed">
                A short, occasional email when something worth switching to shows up. No spam.
              </p>
              <form
                onSubmit={(e) => e.preventDefault()}
                className="flex flex-col sm:flex-row items-center gap-2.5 max-w-sm mx-auto"
              >
                <input
                  type="email"
                  disabled
                  placeholder="you@company.com"
                  className="w-full h-11 rounded-full bg-white/10 border border-white/15 px-5 text-sm text-white placeholder-slate-400 outline-none cursor-not-allowed"
                />
                <button
                  type="submit"
                  disabled
                  className="w-full sm:w-auto shrink-0 h-11 px-6 rounded-xl bg-white text-[#0F172A] text-sm font-semibold cursor-not-allowed opacity-90"
                >
                  Notify me
                </button>
              </form>
              <p className="text-[11px] text-slate-500 mt-4">Coming soon</p>
            </section>
          </div>
        )}
      </main>

      <FooterWrapper />
      <AskGappsyBubble />
    </div>
  );
}
