import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { ShieldCheck, Star, ExternalLink } from 'lucide-react';
import MiniHeader from '../components/MiniHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
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
      <div>
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-16 text-center text-slate-400">Loading...</main>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !tool) {
    return (
      <div>
        <EntitySEOTags title="Tool Not Found | Gappsy" description="This tool could not be found." path={`/tools/${toolSlug || ''}`} noindex />
        <div className="pt-6 pb-2"><MiniHeader /></div>
        <main className="max-w-4xl mx-auto px-4 py-16 text-center">
          <h1 className="text-2xl font-bold text-slate-900 mb-2">Tool Not Found</h1>
          <p className="text-slate-500 mb-6">This tool doesn't exist or is no longer published.</p>
          <Link to="/tools" className="text-blue-600 font-medium hover:text-blue-700">Browse all tools →</Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const ctaCandidate = tool.affiliate_link || tool.website;
  const cta = isSafeHttpUrl(ctaCandidate) ? ctaCandidate : null;
  const safeLogo = isSafeHttpUrl(tool.logo) ? tool.logo : null;

  return (
    <div>
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

      <main className="max-w-4xl mx-auto px-4 sm:px-6 py-8">
        <div className="flex items-start gap-4 mb-6">
          {safeLogo ? (
            <img src={safeLogo} alt={tool.name} className="w-16 h-16 rounded-xl object-contain border border-slate-100 bg-white" />
          ) : (
            <div className="w-16 h-16 rounded-xl bg-slate-100 flex items-center justify-center text-slate-400 font-bold text-xl">
              {tool.name.charAt(0)}
            </div>
          )}
          <div className="flex-1">
            <div className="flex items-center gap-2">
              <h1 className="text-2xl font-bold text-slate-900">{tool.name}</h1>
              {tool.verified && <ShieldCheck className="w-5 h-5 text-blue-500" />}
              {tool.featured && (
                <span className="text-xs font-medium bg-amber-100 text-amber-700 px-2 py-0.5 rounded">Featured</span>
              )}
            </div>
            {tool.rating > 0 && (
              <div className="flex items-center gap-1 text-sm text-slate-500 mt-1">
                <Star className="w-4 h-4 text-amber-500 fill-amber-500" />
                {tool.rating.toFixed(1)} ({tool.review_count} reviews)
              </div>
            )}
          </div>
          {cta && (
            <a
              href={cta}
              target="_blank"
              rel="noopener noreferrer nofollow"
              className="inline-flex items-center gap-1.5 bg-slate-900 text-white px-4 py-2.5 rounded-lg font-semibold hover:bg-slate-800 transition text-sm shrink-0"
            >
              Visit Website
              <ExternalLink className="w-3.5 h-3.5" />
            </a>
          )}
        </div>

        {tool.short_description && <p className="text-slate-600 mb-4">{tool.short_description}</p>}

        {(tool.pricing_model || tool.starting_price) && (
          <div className="flex items-center gap-2 text-sm text-slate-500 mb-6">
            {tool.pricing_model && <span className="bg-slate-100 px-2.5 py-1 rounded-full">{tool.pricing_model}</span>}
            {tool.starting_price && <span className="bg-slate-100 px-2.5 py-1 rounded-full">From {tool.starting_price}</span>}
          </div>
        )}

        {(categories.length > 0 || tags.length > 0) && (
          <div className="flex flex-wrap gap-2 mb-6">
            {categories.map((c) => (
              <Link key={c.slug} to={`/tool-categories/${c.slug}`} className="text-xs bg-blue-50 text-blue-700 px-2.5 py-1 rounded-full hover:bg-blue-100">
                {c.name}
              </Link>
            ))}
            {tags.map((t) => (
              <Link key={t.slug} to={`/tool-tags/${t.slug}`} className="text-xs bg-slate-100 text-slate-600 px-2.5 py-1 rounded-full hover:bg-slate-200">
                {t.name}
              </Link>
            ))}
          </div>
        )}

        {tool.long_description && (
          <div className="prose prose-slate max-w-none mb-8 whitespace-pre-line text-slate-700">
            {tool.long_description}
          </div>
        )}

        {screenshots.filter((shot) => isSafeHttpUrl(shot.image_url)).length > 0 && (
          <div className="mb-8">
            <h2 className="text-lg font-semibold text-slate-900 mb-3">Screenshots</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              {screenshots.filter((shot) => isSafeHttpUrl(shot.image_url)).map((shot) => (
                <figure key={shot.id}>
                  <img src={shot.image_url} alt={shot.caption || tool.name} className="w-full rounded-lg border border-slate-200" />
                  {shot.caption && <figcaption className="text-xs text-slate-400 mt-1">{shot.caption}</figcaption>}
                </figure>
              ))}
            </div>
          </div>
        )}
      </main>

      <FooterWrapper />
    </div>
  );
}
