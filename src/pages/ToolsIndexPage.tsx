import { useEffect, useMemo, useState } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { Search, Sparkles, Tag as TagIcon, Clock, Mail } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import CategoryTile, { type CategoryTileData } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState from '../components/tools/ToolsEmptyState';
import AskGappsyBubble from '../components/askGappsy/AskGappsyBubble';
import SmartSearchBox from '../components/search/SmartSearchBox';
import { useFeaturedToolPool, FeaturedToolSidebarCompact } from '../components/tools/detail/FeaturedToolPromo';
import { supabase } from '../lib/supabase';

const TOOLS_EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'Something to track team tasks',
  'CRM with a free trial',
];

const SPOTLIGHT_COUNT = 3;

// Small curated accent palette so tag chips read as distinct, colored
// entities instead of one flat gray pill repeated N times — same idea as
// CategoryTile's per-slug accent hashing, kept local since tags have no
// icon field of their own to key off of.
const TAG_ACCENT_PALETTE: { bg: string; icon: string }[] = [
  { bg: '#EEF0FE', icon: '#4F47E6' },
  { bg: '#E0F2FE', icon: '#0284C7' },
  { bg: '#D1FAE5', icon: '#059669' },
  { bg: '#FEF3C7', icon: '#D97706' },
  { bg: '#FCE7F3', icon: '#DB2777' },
  { bg: '#EDE9FE', icon: '#7C3AED' },
];
function tagAccent(slug: string): { bg: string; icon: string } {
  let hash = 0;
  for (let i = 0; i < slug.length; i++) hash = (hash * 31 + slug.charCodeAt(i)) >>> 0;
  return TAG_ACCENT_PALETTE[hash % TAG_ACCENT_PALETTE.length];
}

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

  // Sponsored placements shown beside the search box — same ad mechanism
  // used on tool detail pages, just relocated here to fill what was dead
  // white space next to the chat box.
  const heroAdPool = useFeaturedToolPool([], 2);

  useEffect(() => {
    Promise.all([
      supabase
        .from('tools')
        .select('slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, is_open_source, created_at')
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

  const spotlightTools = useMemo(() => {
    if (tools.length === 0) return [];
    const featured = tools.filter((t) => t.featured);
    const rest = [...tools]
      .filter((t) => !t.featured)
      .sort((a, b) => (a.is_open_source === b.is_open_source ? b.rating - a.rating : a.is_open_source ? 1 : -1));
    return [...featured, ...rest].slice(0, SPOTLIGHT_COUNT);
  }, [tools]);
  const spotlightSlugs = useMemo(() => new Set(spotlightTools.map((t) => t.slug)), [spotlightTools]);

  const recentTools = useMemo(() => {
    return [...tools]
      .filter((t) => !spotlightSlugs.has(t.slug))
      .sort((a, b) => {
        if (a.is_open_source !== b.is_open_source) return a.is_open_source ? 1 : -1;
        return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
      })
      .slice(0, 5);
  }, [tools, spotlightSlugs]);

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
      <section className="max-w-4xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-6 sm:pb-8 text-center">
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-3">Tools Directory</p>
        <h1 className="text-3xl sm:text-4xl font-bold text-[#0B1221] leading-[1.15] lg:whitespace-nowrap">
          Software worth building your stack around
        </h1>
      </section>

      <section className="max-w-5xl mx-auto px-4 sm:px-6 pb-10 sm:pb-14">
        <div className="grid lg:grid-cols-[1.6fr_1fr] gap-5 items-start">
          <div className="min-w-0">
            <SmartSearchBox
              mode="general"
              title="What do you need help finding?"
              subtitle="Tell us what you're trying to solve — we'll point you to the right tool"
              placeholder="A tool, a need, or 'agency in New Jersey'…"
              exampleQueries={TOOLS_EXAMPLE_QUERIES}
            />
          </div>
          {heroAdPool && heroAdPool.length > 0 && (
            <div className="min-w-0 flex flex-col gap-3">
              {heroAdPool.map((promo) => (
                <FeaturedToolSidebarCompact key={promo.slug} tool={promo} />
              ))}
            </div>
          )}
        </div>
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
            {spotlightTools.length > 0 && (
              <section>
                <ToolsSectionHeader eyebrow="Editors' picks" title="Spotlight" />
                <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
                  {spotlightTools.map((tool) => (
                    <ToolCard key={tool.slug} tool={tool} />
                  ))}
                </div>
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
                    const scaleClass = weight > 0.66 ? 'text-[15px] pl-2 pr-4 py-2' : weight > 0.33 ? 'text-sm pl-1.5 pr-3.5 py-1.5' : 'text-[13px] pl-1.5 pr-3 py-1.5';
                    const accent = tagAccent(tag.slug);
                    return (
                      <Link
                        key={tag.slug}
                        to={`/tool-tags/${tag.slug}`}
                        className={`inline-flex items-center gap-2 bg-white border border-[#eef0f3] rounded-full font-medium text-slate-600 hover:border-[#C7CCF7] hover:shadow-sm transition-all ${scaleClass}`}
                      >
                        <span className="w-5 h-5 rounded-full flex items-center justify-center shrink-0" style={{ backgroundColor: accent.bg }}>
                          <TagIcon className="w-3 h-3" style={{ color: accent.icon }} />
                        </span>
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
