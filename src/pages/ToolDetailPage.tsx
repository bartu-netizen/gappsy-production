import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ShieldCheck, Star, ExternalLink, ArrowLeft, Tag as TagIcon, FolderTree } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ToolsSkeletonGrid from '../components/tools/ToolsSkeletonGrid';
import { supabase } from '../lib/supabase';

interface ToolDetail {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  website: string | null;
  affiliate_link: string | null;
  short_description: string | null;
  long_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
  featured: boolean;
}

interface TaxonomyRef {
  slug: string;
  name: string;
}

interface Screenshot {
  id: string;
  image_url: string;
  caption: string | null;
}

// Defensive, client-side check before rendering anything as a clickable link or
// image source. The admin edge function already rejects non-http(s) URLs at
// write time, but this ensures the page itself never trusts stored data blindly
// (e.g. rows written before validation existed, or edited directly in the DB).
function isSafeHttpUrl(value: string | null | undefined): value is string {
  if (!value) return false;
  if (value.startsWith('//')) return false;
  try {
    const parsed = new URL(value);
    return parsed.protocol === 'http:' || parsed.protocol === 'https:';
  } catch {
    return false;
  }
}

export default function ToolDetailPage() {
  const { toolSlug } = useParams<{ toolSlug: string }>();
  const [tool, setTool] = useState<ToolDetail | null>(null);
  const [categories, setCategories] = useState<TaxonomyRef[]>([]);
  const [tags, setTags] = useState<TaxonomyRef[]>([]);
  const [screenshots, setScreenshots] = useState<Screenshot[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);

  useEffect(() => {
    if (!toolSlug) return;
    setLoading(true);
    setNotFound(false);

    supabase
      .from('tools')
      .select('id, slug, name, logo, website, affiliate_link, short_description, long_description, pricing_model, starting_price, rating, review_count, verified, featured')
      .eq('slug', toolSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(({ data }) => {
        if (!data) {
          setNotFound(true);
          setLoading(false);
          return;
        }
        setTool(data);

        Promise.all([
          // !inner + status filter: only categories that are themselves published
          // are returned. Without !inner, PostgREST would still return the link row
          // with a null embed for an unpublished category — filtering that null out
          // works too, but this is explicit and matches the pattern used on
          // ToolCategoryDetailPage/ToolTagDetailPage/ToolsIndexPage.
          supabase
            .from('tool_category_links')
            .select('tool_categories!inner(slug, name, status)')
            .eq('tool_id', data.id)
            .eq('tool_categories.status', 'published'),
          // Tags have no status column yet (per spec) — always shown.
          supabase
            .from('tool_tag_links')
            .select('tool_tags(slug, name)')
            .eq('tool_id', data.id),
          supabase
            .from('tool_screenshots')
            .select('id, image_url, caption')
            .eq('tool_id', data.id)
            .order('sort_order', { ascending: true }),
        ]).then(([catResult, tagResult, screenshotResult]) => {
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          setCategories((catResult.data || []).map((r: any) => r.tool_categories).filter(Boolean));
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          setTags((tagResult.data || []).map((r: any) => r.tool_tags).filter(Boolean));
          setScreenshots(screenshotResult.data || []);
          setLoading(false);
        });
      });
  }, [toolSlug]);

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-5xl mx-auto px-4 sm:px-6 py-12">
          <ToolsSkeletonGrid count={3} />
        </main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tool) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Tool Not Found | Gappsy" description="This tool could not be found." path={`/tools/${toolSlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">This tool isn't available</h1>
          <p className="text-slate-500 mb-6">It doesn't exist, or it's no longer published.</p>
          <Link to="/tools" className="inline-flex items-center gap-1.5 text-indigo-600 font-semibold hover:text-indigo-700">
            <ArrowLeft className="w-4 h-4" />
            Browse the directory
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const ctaCandidate = tool.affiliate_link || tool.website;
  const cta = isSafeHttpUrl(ctaCandidate) ? ctaCandidate : null;
  const safeLogo = isSafeHttpUrl(tool.logo) ? tool.logo : null;
  const safeScreenshots = screenshots.filter((shot) => isSafeHttpUrl(shot.image_url));
  const featuredShot = safeScreenshots[0];
  const supportingShots = safeScreenshots.slice(1, 5);
  const narrative = tool.long_description || tool.short_description;
  const hasFacts = tool.pricing_model || tool.starting_price || categories.length > 0 || tags.length > 0;

  return (
    <div className="bg-[#f7f8fa] min-h-screen">
      <EntitySEOTags
        title={`${tool.name} — Reviews, Pricing & Details | Gappsy`}
        description={tool.short_description || `Learn about ${tool.name}: pricing, features, and reviews.`}
        path={`/tools/${tool.slug}`}
        ogImage={safeLogo || undefined}
        breadcrumbs={[{ name: 'Tools', path: '/tools' }, { name: tool.name, path: `/tools/${tool.slug}` }]}
        jsonLd={[
          {
            '@type': 'SoftwareApplication',
            '@id': `https://www.gappsy.com/tools/${tool.slug}/#software`,
            name: tool.name,
            description: tool.short_description || tool.long_description || undefined,
            image: safeLogo || undefined,
            url: isSafeHttpUrl(tool.website) ? tool.website : undefined,
            ...(tool.rating > 0
              ? { aggregateRating: { '@type': 'AggregateRating', ratingValue: tool.rating, reviewCount: tool.review_count } }
              : {}),
          },
        ]}
      />

      <div className="pt-6 pb-2"><MiniHeader /></div>

      {/* Hero */}
      <section className="max-w-5xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-10">
        <Link to="/tools" className="inline-flex items-center gap-1.5 text-xs font-medium text-slate-400 hover:text-slate-600 transition-colors mb-6">
          <ArrowLeft className="w-3 h-3" />
          All tools
        </Link>

        <div className="flex flex-col sm:flex-row sm:items-center gap-6">
          {safeLogo ? (
            <img src={safeLogo} alt={tool.name} className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm shrink-0" />
          ) : (
            <div className="w-16 h-16 sm:w-20 sm:h-20 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-400 font-bold text-2xl shrink-0">
              {tool.name.charAt(0)}
            </div>
          )}

          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 flex-wrap">
              <h1 className="text-2xl sm:text-[34px] font-bold text-[#0B1221] leading-tight">{tool.name}</h1>
              {tool.verified && <ShieldCheck className="w-5 h-5 text-indigo-500" />}
              {tool.featured && (
                <span className="text-[11px] font-semibold uppercase tracking-wide bg-amber-100 text-amber-700 px-2 py-0.5 rounded-full">
                  Featured
                </span>
              )}
            </div>
            {tool.short_description && (
              <p className="text-slate-600 text-[15px] sm:text-base mt-1.5 max-w-xl">{tool.short_description}</p>
            )}
            {tool.rating > 0 && (
              <div className="flex items-center gap-1 text-sm text-slate-500 mt-2">
                <Star className="w-4 h-4 text-amber-500 fill-amber-500" />
                <span className="font-medium text-[#0B1221]">{tool.rating.toFixed(1)}</span>
                <span className="text-slate-400">({tool.review_count} reviews)</span>
              </div>
            )}
          </div>

          {cta && (
            <a
              href={cta}
              target="_blank"
              rel="noopener noreferrer nofollow"
              className="inline-flex items-center gap-1.5 bg-[#4F46E5] hover:bg-[#4338CA] text-white px-5 py-3 rounded-full font-semibold transition-colors text-sm shrink-0 self-start sm:self-center"
            >
              Visit Website
              <ExternalLink className="w-3.5 h-3.5" />
            </a>
          )}
        </div>
      </section>

      <main className="max-w-5xl mx-auto px-4 sm:px-6 pb-20">
        <div className="grid grid-cols-1 lg:grid-cols-[1fr_260px] gap-10">
          {/* Narrative column */}
          <div className="space-y-10">
            {narrative && (
              <section>
                {tool.long_description ? (
                  <div className="prose prose-slate max-w-none">
                    <p className="text-[17px] sm:text-lg text-slate-700 leading-relaxed whitespace-pre-line">{narrative}</p>
                  </div>
                ) : (
                  <blockquote className="border-l-2 border-indigo-200 pl-5 text-lg text-slate-700 leading-relaxed italic">
                    {narrative}
                  </blockquote>
                )}
              </section>
            )}

            {featuredShot && (
              <section>
                <img
                  src={featuredShot.image_url}
                  alt={featuredShot.caption || tool.name}
                  className="w-full rounded-2xl border border-[#eef0f3] shadow-sm"
                />
                {featuredShot.caption && <p className="text-xs text-slate-400 mt-2">{featuredShot.caption}</p>}

                {supportingShots.length > 0 && (
                  <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mt-3">
                    {supportingShots.map((shot) => (
                      <figure key={shot.id}>
                        <img
                          src={shot.image_url}
                          alt={shot.caption || tool.name}
                          className="w-full aspect-[4/3] object-cover rounded-xl border border-[#eef0f3]"
                        />
                      </figure>
                    ))}
                  </div>
                )}
              </section>
            )}
          </div>

          {/* Quick facts rail */}
          {hasFacts && (
            <aside className="lg:pt-1">
              <div className="bg-white border border-[#eef0f3] rounded-2xl p-5 space-y-5 lg:sticky lg:top-6">
                {(tool.pricing_model || tool.starting_price) && (
                  <div>
                    <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2">Pricing</p>
                    {tool.pricing_model && <p className="text-sm font-medium text-[#0B1221]">{tool.pricing_model}</p>}
                    {tool.starting_price && <p className="text-sm text-slate-500 mt-0.5">From {tool.starting_price}</p>}
                  </div>
                )}

                {categories.length > 0 && (
                  <div>
                    <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2">Category</p>
                    <div className="flex flex-wrap gap-1.5">
                      {categories.map((c) => (
                        <Link
                          key={c.slug}
                          to={`/tool-categories/${c.slug}`}
                          className="inline-flex items-center gap-1 text-xs font-medium bg-indigo-50 text-indigo-700 px-2.5 py-1 rounded-full hover:bg-indigo-100 transition-colors"
                        >
                          <FolderTree className="w-3 h-3" />
                          {c.name}
                        </Link>
                      ))}
                    </div>
                  </div>
                )}

                {tags.length > 0 && (
                  <div>
                    <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2">Tags</p>
                    <div className="flex flex-wrap gap-1.5">
                      {tags.map((t) => (
                        <Link
                          key={t.slug}
                          to={`/tool-tags/${t.slug}`}
                          className="inline-flex items-center gap-1 text-xs font-medium bg-slate-100 text-slate-600 px-2.5 py-1 rounded-full hover:bg-slate-200 transition-colors"
                        >
                          <TagIcon className="w-3 h-3" />
                          {t.name}
                        </Link>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            </aside>
          )}
        </div>
      </main>

      <FooterWrapper />
    </div>
  );
}
