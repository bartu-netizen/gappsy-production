import { useEffect, useMemo, useState } from 'react';
import { useParams, useSearchParams, Link } from 'react-router-dom';
import { FolderTree, ArrowLeft } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolCard, { type ToolCardData } from '../components/ToolCard';
import ToolSpotlight from '../components/tools/ToolSpotlight';
import { getCategoryVisual } from '../components/tools/CategoryTile';
import ToolsSectionHeader from '../components/tools/ToolsSectionHeader';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import ToolsEmptyState, { type ToolsEmptyStateLink } from '../components/tools/ToolsEmptyState';
import ToolFilterBar, { type ToolSortOption, type ToolFilterState } from '../components/tools/ToolFilterBar';
import { PLATFORM_TAGS } from '../components/tools/detail/ToolFactsSidebar';
import { getCategoryContent } from '../data/categoryContent';
import { formatLastUpdated } from '../utils/formatLastUpdated';
import { buildCanonicalUrl } from '../utils/canonicalUrl';
import { supabase } from '../lib/supabase';
import SmartSearchBox from '../components/search/SmartSearchBox';

interface CategoryDetail {
  id: string;
  slug: string;
  name: string;
  description: string | null;
  seo_title: string | null;
  seo_description: string | null;
  updated_at: string | null;
}

interface CategoryToolRow extends ToolCardData {
  id: string;
  created_at: string;
  tagSlugs: string[];
}

interface RelatedCategoryLink {
  slug: string;
  name: string;
  icon: string | null;
  href: string;
}

const CATEGORY_TOOLS_LIMIT = 60;

export default function ToolCategoryDetailPage() {
  const { categorySlug } = useParams<{ categorySlug: string }>();
  const [searchParams, setSearchParams] = useSearchParams();
  const [category, setCategory] = useState<CategoryDetail | null>(null);
  const [tools, setTools] = useState<CategoryToolRow[]>([]);
  const [otherCategories, setOtherCategories] = useState<ToolsEmptyStateLink[]>([]);
  const [relatedCategories, setRelatedCategories] = useState<RelatedCategoryLink[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    if (!categorySlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tool_categories')
      .select('id, slug, name, description, seo_title, seo_description, updated_at')
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
          .select(
            'tools!inner(id, slug, name, logo, short_description, pricing_model, starting_price, rating, review_count, verified, featured, website, claim_paid_at, status, created_at)'
          )
          .eq('category_id', data.id)
          .eq('tools.status', 'published')
          .limit(CATEGORY_TOOLS_LIMIT)
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          .then(({ data: links }: { data: any[] | null }) => {
            const toolRows = (links || []).map((row) => row.tools) as CategoryToolRow[];
            const toolIds = toolRows.map((t) => t.id);

            if (toolIds.length === 0) {
              setTools([]);
              supabase
                .from('tool_categories')
                .select('slug, name')
                .eq('status', 'published')
                .neq('id', data.id)
                .order('name')
                .limit(4)
                .then(({ data: others }) => {
                  setOtherCategories((others || []).map((c) => ({ label: c.name, href: `/tool-categories/${c.slug}` })));
                  setLoading(false);
                });
              return;
            }

            supabase
              .from('tool_tag_links')
              .select('tool_id, tool_tags(slug)')
              .in('tool_id', toolIds)
              .then(({ data: tagLinks }) => {
                const tagsByTool = new Map<string, string[]>();
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                (tagLinks || []).forEach((row: any) => {
                  const slug = row.tool_tags?.slug;
                  if (!slug) return;
                  const list = tagsByTool.get(row.tool_id) || [];
                  list.push(slug);
                  tagsByTool.set(row.tool_id, list);
                });
                setTools(toolRows.map((t) => ({ ...t, tagSlugs: tagsByTool.get(t.id) || [] })));
                setLoading(false);
              });
          });

        supabase
          .from('tool_categories')
          .select('slug, name, icon')
          .eq('status', 'published')
          .neq('id', data.id)
          .order('name')
          .limit(6)
          .then(({ data: related }) => {
            setRelatedCategories(
              (related || []).map((c) => ({ slug: c.slug, name: c.name, icon: c.icon, href: `/tool-categories/${c.slug}` }))
            );
          });
      });
  }, [categorySlug]);

  const sort = (searchParams.get('sort') as ToolSortOption) || 'recommended';
  const filters: ToolFilterState = useMemo(
    () => ({
      freePlan: searchParams.get('free') === '1',
      freeTrial: searchParams.get('trial') === '1',
      api: searchParams.get('api') === '1',
      platform: searchParams.get('platform'),
      pricing: searchParams.get('pricing'),
    }),
    [searchParams]
  );
  const isFiltered =
    sort !== 'recommended' || filters.freePlan || filters.freeTrial || filters.api || Boolean(filters.platform) || Boolean(filters.pricing);

  function updateParams(patch: Record<string, string | null>) {
    const next = new URLSearchParams(searchParams);
    Object.entries(patch).forEach(([key, value]) => {
      if (value === null || value === '') next.delete(key);
      else next.set(key, value);
    });
    setSearchParams(next, { replace: true });
  }

  const availablePlatforms = useMemo(() => {
    const present = new Set(tools.flatMap((t) => t.tagSlugs));
    return PLATFORM_TAGS.filter((p) => present.has(p.slug));
  }, [tools]);

  const pricingOptions = useMemo(() => {
    return Array.from(new Set(tools.map((t) => t.pricing_model).filter((p): p is string => Boolean(p)))).sort();
  }, [tools]);

  const filteredTools = useMemo(() => {
    let list = tools.filter((t) => {
      if (filters.freePlan && !(t.tagSlugs.includes('free-plan') || t.tagSlugs.includes('freemium'))) return false;
      if (filters.freeTrial && !t.tagSlugs.includes('free-trial')) return false;
      if (filters.api && !t.tagSlugs.includes('api')) return false;
      if (filters.platform && !t.tagSlugs.includes(filters.platform)) return false;
      if (filters.pricing && t.pricing_model !== filters.pricing) return false;
      return true;
    });

    list = [...list].sort((a, b) => {
      if (sort === 'rating') return b.rating - a.rating;
      if (sort === 'reviews') return b.review_count - a.review_count;
      if (sort === 'newest') return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
      // recommended
      if (a.featured !== b.featured) return a.featured ? -1 : 1;
      return b.rating - a.rating;
    });

    return list;
  }, [tools, filters, sort]);

  const spotlightTool = useMemo(() => {
    if (isFiltered || tools.length === 0) return null;
    return tools.find((t) => t.featured) || [...tools].sort((a, b) => b.rating - a.rating)[0];
  }, [tools, isFiltered]);

  const gridTools = isFiltered ? filteredTools : filteredTools.filter((t) => t.slug !== spotlightTool?.slug);
  // Only show the filter/browse section when there's something beyond the spotlight to
  // browse — otherwise a 1-tool category always renders an empty "no tools match" block
  // that has nothing to do with filtering. A filtered URL always shows it, even if that
  // particular filter combination happens to leave zero results (that's real feedback).
  const showBrowseSection = isFiltered || tools.length > (spotlightTool ? 1 : 0);

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

  if (notFound || !category) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Category Not Found | Gappsy" description="This category could not be found." path={`/tool-categories/${categorySlug || ''}`} noindex />
        <SoftwareHeader variant="premium" />
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">Category not found</h1>
          <p className="text-slate-500 mb-6">This category doesn't exist or is no longer published.</p>
          <Link to="/tool-categories" className="inline-flex items-center gap-1.5 text-[#4F47E6] font-semibold hover:text-[#4338CA]">
            <ArrowLeft className="w-4 h-4" />
            Browse all categories
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const extendedContent = getCategoryContent(category.slug);
  const updatedLabel = formatLastUpdated(category.updated_at);

  const itemListJsonLd =
    tools.length > 0
      ? [
          {
            '@type': 'ItemList',
            '@id': `https://gappsy.com/tool-categories/${category.slug}/#itemlist`,
            itemListElement: tools.map((t, i) => ({
              '@type': 'ListItem',
              position: i + 1,
              name: t.name,
              url: buildCanonicalUrl(`/tools/${t.slug}`),
            })),
          },
        ]
      : [];

  const faqJsonLd =
    extendedContent && extendedContent.faqs.length > 0
      ? [
          {
            '@type': 'FAQPage',
            '@id': `https://gappsy.com/tool-categories/${category.slug}/#faq`,
            mainEntity: extendedContent.faqs.map((faq) => ({
              '@type': 'Question',
              name: faq.question,
              acceptedAnswer: { '@type': 'Answer', text: faq.answer },
            })),
          },
        ]
      : [];

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={category.seo_title || `${category.name} Tools | Gappsy`}
        description={category.seo_description || category.description || `Browse the best ${category.name} tools.`}
        path={`/tool-categories/${category.slug}`}
        breadcrumbs={[{ name: 'Tool Categories', path: '/tool-categories' }, { name: category.name, path: `/tool-categories/${category.slug}` }]}
        noindex={isFiltered}
        jsonLd={[
          { '@type': 'CollectionPage', '@id': `https://gappsy.com/tool-categories/${category.slug}/#collection`, name: `${category.name} Tools` },
          ...itemListJsonLd,
          ...faqJsonLd,
        ]}
      />

      <SoftwareHeader variant="premium" />

      <section className="max-w-3xl mx-auto px-4 sm:px-6 pt-8 sm:pt-12 pb-8 sm:pb-10 text-center">
        <Link to="/tool-categories" className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-400 hover:text-slate-600 transition-colors mb-5">
          <ArrowLeft className="w-3 h-3" />
          All categories
        </Link>
        <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-[#4F47E6] mb-3">Category</p>
        <h1 className="text-3xl sm:text-[38px] font-bold text-[#0B1221] leading-[1.1] mb-4">{category.name}</h1>
        {category.description && (
          <p className="text-slate-500 text-[15px] sm:text-base leading-relaxed max-w-lg mx-auto">{category.description}</p>
        )}
        <div className="flex items-center justify-center gap-3 mt-4 mb-8 text-xs text-slate-400">
          <span>{tools.length} tool{tools.length === 1 ? '' : 's'}</span>
          {updatedLabel && (
            <>
              <span aria-hidden="true">·</span>
              <span>Updated {updatedLabel}</span>
            </>
          )}
        </div>

        {tools.length > 0 && (
          <SmartSearchBox
            mode="category-tools"
            categorySlug={category.slug}
            title={`Find the right tool in ${category.name}`}
            subtitle="Describe what you need — we'll point you to the best match in this category"
            placeholder={`What do you need from a ${category.name.toLowerCase()} tool?`}
            exampleQueries={[`The most beginner-friendly option`, `Something with a generous free plan`, `Built for larger teams`]}
          />
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
          <div className="space-y-14">
            {spotlightTool && (
              <section>
                <ToolSpotlight tool={spotlightTool} eyebrow={`Top pick in ${category.name}`} />
              </section>
            )}

            {showBrowseSection && (
              <section id="all-tools" className="scroll-mt-24">
                <ToolsSectionHeader title={isFiltered ? 'Filtered results' : `More in ${category.name}`} />
                <ToolFilterBar
                  sort={sort}
                  onSortChange={(s) => updateParams({ sort: s === 'recommended' ? null : s })}
                  filters={filters}
                  onToggleFilter={(key) => {
                    if (key === 'freePlan') updateParams({ free: filters.freePlan ? null : '1' });
                    if (key === 'freeTrial') updateParams({ trial: filters.freeTrial ? null : '1' });
                    if (key === 'api') updateParams({ api: filters.api ? null : '1' });
                  }}
                  platforms={availablePlatforms}
                  onPlatformChange={(platform) => updateParams({ platform })}
                  pricingOptions={pricingOptions}
                  onPricingChange={(pricing) => updateParams({ pricing })}
                  resultCount={gridTools.length}
                  isFiltered={isFiltered}
                  onReset={() => setSearchParams({}, { replace: true })}
                />

                {gridTools.length > 0 ? (
                  <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                    {gridTools.map((tool) => (
                      <ToolCard key={tool.slug} tool={tool} />
                    ))}
                  </div>
                ) : (
                  <div className="text-center py-14 border border-dashed border-slate-200 rounded-2xl">
                    <p className="text-sm font-medium text-[#0B1221]">No tools match these filters</p>
                    <p className="text-xs text-slate-400 mt-1">Try clearing a filter to see more results.</p>
                  </div>
                )}
              </section>
            )}

            {extendedContent && extendedContent.buyersGuide.length > 0 && (
              <section id="buyers-guide" className="scroll-mt-24 max-w-[70ch]">
                <ToolsSectionHeader eyebrow="Buyer's Guide" title={`How to choose ${category.name.toLowerCase()} software`} />
                <div className="space-y-4">
                  {extendedContent.buyersGuide.map((paragraph, i) => (
                    <p key={i} className="text-[15px] text-slate-700 leading-relaxed">
                      {paragraph}
                    </p>
                  ))}
                </div>
              </section>
            )}

            {extendedContent && (extendedContent.whoItsFor.length > 0 || extendedContent.whoShouldAvoid.length > 0) && (
              <section className="grid sm:grid-cols-2 gap-6">
                {extendedContent.whoItsFor.length > 0 && (
                  <div className="bg-white border border-[#eef0f3] rounded-2xl p-6">
                    <h3 className="text-sm font-semibold text-[#0B1221] mb-3">Who it's for</h3>
                    <ul className="space-y-2">
                      {extendedContent.whoItsFor.map((item, i) => (
                        <li key={i} className="text-sm text-slate-600 leading-relaxed">{item}</li>
                      ))}
                    </ul>
                  </div>
                )}
                {extendedContent.whoShouldAvoid.length > 0 && (
                  <div className="bg-white border border-[#eef0f3] rounded-2xl p-6">
                    <h3 className="text-sm font-semibold text-[#0B1221] mb-3">Who may not need it</h3>
                    <ul className="space-y-2">
                      {extendedContent.whoShouldAvoid.map((item, i) => (
                        <li key={i} className="text-sm text-slate-600 leading-relaxed">{item}</li>
                      ))}
                    </ul>
                  </div>
                )}
              </section>
            )}

            {extendedContent && extendedContent.selectionCriteria.length > 0 && (
              <section id="selection-criteria" className="scroll-mt-24">
                <ToolsSectionHeader eyebrow="Selection Criteria" title="What to look for" />
                <div className="grid sm:grid-cols-2 gap-4">
                  {extendedContent.selectionCriteria.map((c, i) => (
                    <div key={i} className="bg-slate-50 rounded-2xl p-5">
                      <h3 className="text-sm font-semibold text-[#0B1221] mb-1.5">{c.title}</h3>
                      <p className="text-sm text-slate-600 leading-relaxed">{c.description}</p>
                    </div>
                  ))}
                </div>
              </section>
            )}

            {extendedContent && extendedContent.faqs.length > 0 && (
              <section id="faq" className="scroll-mt-24 max-w-[70ch]">
                <ToolsSectionHeader eyebrow="FAQ" title="Frequently asked questions" />
                <div className="divide-y divide-slate-100 border-t border-slate-100">
                  {extendedContent.faqs.map((faq, i) => (
                    <div key={i} className="py-4">
                      <h3 className="text-sm font-semibold text-[#0B1221] mb-1.5">{faq.question}</h3>
                      <p className="text-sm text-slate-600 leading-relaxed">{faq.answer}</p>
                    </div>
                  ))}
                </div>
              </section>
            )}

            {extendedContent?.methodology && (
              <p className="text-[11px] text-slate-400 leading-relaxed border-t border-slate-100 pt-6">{extendedContent.methodology}</p>
            )}

            {relatedCategories.length > 0 && (
              <section>
                <ToolsSectionHeader title="Related categories" />
                <div className="flex flex-wrap gap-2">
                  {relatedCategories.map((c) => {
                    const { Icon, accent } = getCategoryVisual(c);
                    return (
                      <Link
                        key={c.href}
                        to={c.href}
                        className="flex items-center gap-2 text-sm font-medium bg-white border border-[#eef0f3] text-slate-600 hover:text-[#4F47E6] hover:border-[#C7CCF7] pl-2 pr-3.5 py-1.5 rounded-full transition-colors"
                      >
                        <span className="w-5 h-5 rounded-full flex items-center justify-center shrink-0" style={{ backgroundColor: accent.bg }}>
                          <Icon className="w-3 h-3" style={{ color: accent.icon }} />
                        </span>
                        {c.name}
                      </Link>
                    );
                  })}
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
