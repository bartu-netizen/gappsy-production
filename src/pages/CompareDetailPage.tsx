import { useEffect, useState } from 'react';
import { useParams, Link, Navigate } from 'react-router-dom';
import { ArrowLeft, Star, ExternalLink, Check, X as XIcon, FolderTree } from 'lucide-react';
import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';
import ComparisonCard from '../components/compare/ComparisonCard';
import { supabase } from '../lib/supabase';
import { getToolContent } from '../data/toolContent';
import { getComparisonContent } from '../data/comparisonContent';
import { useRecentlyViewedComparisons } from '../hooks/useRecentlyViewedComparisons';
import { PLATFORM_TAGS } from '../components/tools/detail/ToolFactsSidebar';

interface CompareToolFacts {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  website: string | null;
  affiliate_link: string | null;
  short_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number;
  review_count: number;
  verified: boolean;
  updated_at: string | null;
}

interface ComparisonRow {
  id: string;
  slug: string;
  tool_a: CompareToolFacts;
  tool_b: CompareToolFacts;
}

interface TaxonomyRef {
  id: string;
  slug: string;
  name: string;
}

interface ToolExtras {
  primaryCategory: TaxonomyRef | null;
  categories: TaxonomyRef[];
  tags: TaxonomyRef[];
  integrations: { id: string; integration_name: string }[];
}

const EMPTY_EXTRAS: ToolExtras = { primaryCategory: null, categories: [], tags: [], integrations: [] };

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

function reverseSlug(slug: string): string | null {
  const idx = slug.indexOf('-vs-');
  if (idx === -1) return null;
  const first = slug.slice(0, idx);
  const second = slug.slice(idx + 4);
  if (!first || !second) return null;
  return `${second}-vs-${first}`;
}

const COMPARISON_SELECT =
  'id, slug, tool_a:tools!tool_comparisons_tool_a_id_fkey(id,slug,name,logo,website,affiliate_link,short_description,pricing_model,starting_price,rating,review_count,verified,updated_at), tool_b:tools!tool_comparisons_tool_b_id_fkey(id,slug,name,logo,website,affiliate_link,short_description,pricing_model,starting_price,rating,review_count,verified,updated_at)';

async function fetchToolExtras(supabase_: typeof supabase, toolId: string): Promise<ToolExtras> {
  const [catResult, tagResult, integrationsResult] = await Promise.all([
    supabase_
      .from('tool_category_links')
      .select('category_id, primary_category, tool_categories!inner(id, slug, name, status)')
      .eq('tool_id', toolId)
      .eq('tool_categories.status', 'published'),
    supabase_.from('tool_tag_links').select('tool_tags(id, slug, name)').eq('tool_id', toolId),
    supabase_.from('tool_integrations').select('id, integration_name').eq('tool_id', toolId),
  ]);

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const categoryLinks = (catResult.data || []) as any[];
  const categories: TaxonomyRef[] = categoryLinks.map((r) => r.tool_categories).filter(Boolean);
  const primaryLink = categoryLinks.find((r) => r.primary_category) || categoryLinks[0] || null;
  const primaryCategory: TaxonomyRef | null = primaryLink?.tool_categories || null;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const tags: TaxonomyRef[] = ((tagResult.data || []) as any[]).map((r) => r.tool_tags).filter(Boolean);
  const integrations = integrationsResult.data || [];

  return { primaryCategory, categories, tags, integrations };
}

export default function CompareDetailPage() {
  const { comparisonSlug } = useParams<{ comparisonSlug: string }>();
  const [comparison, setComparison] = useState<ComparisonRow | null>(null);
  const [extrasA, setExtrasA] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [extrasB, setExtrasB] = useState<ToolExtras>(EMPTY_EXTRAS);
  const [related, setRelated] = useState<{ slug: string; tool_a: CompareToolFacts; tool_b: CompareToolFacts }[]>([]);
  const [loading, setLoading] = useState(true);
  const [notFound, setNotFound] = useState(false);
  const [redirectTo, setRedirectTo] = useState<string | null>(null);

  const recentSlugs = useRecentlyViewedComparisons(comparisonSlug || '');

  useEffect(() => {
    if (!comparisonSlug) return;
    setLoading(true);
    setNotFound(false);
    setRedirectTo(null);

    supabase
      .from('tool_comparisons')
      .select(COMPARISON_SELECT)
      .eq('slug', comparisonSlug)
      .eq('status', 'published')
      .maybeSingle()
      .then(async ({ data }) => {
        if (data && (data as unknown as ComparisonRow).tool_a && (data as unknown as ComparisonRow).tool_b) {
          const row = data as unknown as ComparisonRow;
          setComparison(row);
          const [a, b] = await Promise.all([fetchToolExtras(supabase, row.tool_a.id), fetchToolExtras(supabase, row.tool_b.id)]);
          setExtrasA(a);
          setExtrasB(b);
          setLoading(false);
          return;
        }

        // Not found under this exact slug — check whether the reversed
        // ordering exists as the real canonical comparison, and redirect
        // to it instead of 404ing. This is the only place a non-canonical
        // /compare/:slug URL is ever reachable from (a hand-typed or
        // stale link), so it's handled here rather than at the router.
        const reversed = reverseSlug(comparisonSlug);
        if (reversed) {
          const { data: reversedData } = await supabase
            .from('tool_comparisons')
            .select('slug')
            .eq('slug', reversed)
            .eq('status', 'published')
            .maybeSingle();
          if (reversedData) {
            setRedirectTo(`/compare/${reversedData.slug}`);
            setLoading(false);
            return;
          }
        }

        setNotFound(true);
        setLoading(false);
      });
  }, [comparisonSlug]);

  useEffect(() => {
    if (recentSlugs.length === 0) {
      setRelated([]);
      return;
    }
    supabase
      .from('tool_comparisons')
      .select(COMPARISON_SELECT)
      .in('slug', recentSlugs)
      .eq('status', 'published')
      .then(({ data }) => {
        const rows = (data || []) as unknown as { slug: string; tool_a: CompareToolFacts; tool_b: CompareToolFacts }[];
        setRelated(rows.filter((r) => r.tool_a && r.tool_b));
      });
  }, [recentSlugs]);

  if (redirectTo) {
    return <Navigate to={redirectTo} replace />;
  }

  if (loading) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <SoftwareHeader />
        <div className="max-w-5xl mx-auto px-4 sm:px-6 py-20 animate-pulse space-y-6">
          <div className="h-8 bg-slate-200 rounded-lg w-2/3 mx-auto" />
          <div className="h-40 bg-slate-200 rounded-2xl" />
        </div>
        <FooterWrapper />
      </div>
    );
  }

  if (notFound || !comparison) {
    return (
      <div className="bg-[#f7f8fa] min-h-screen">
        <EntitySEOTags title="Comparison Not Found | Gappsy" description="This comparison could not be found." path={`/compare/${comparisonSlug || ''}`} noindex />
        <SoftwareHeader />
        <main className="max-w-4xl mx-auto px-4 py-20 text-center">
          <div className="w-14 h-14 rounded-2xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-6">
            <FolderTree className="w-6 h-6 text-slate-400" />
          </div>
          <h1 className="text-2xl font-bold text-[#0B1221] mb-2">This comparison isn't available</h1>
          <p className="text-slate-500 mb-6">It doesn't exist, or it hasn't been approved for publishing yet.</p>
          <Link to="/compare" className="inline-flex items-center gap-1.5 text-indigo-600 font-semibold hover:text-indigo-700">
            <ArrowLeft className="w-4 h-4" />
            Browse comparisons
          </Link>
        </main>
        <FooterWrapper />
      </div>
    );
  }

  const { tool_a: a, tool_b: b } = comparison;
  const contentA = getToolContent(a.slug);
  const contentB = getToolContent(b.slug);
  const comparisonContent = getComparisonContent(comparison.slug);

  const websiteA = isSafeHttpUrl(a.website) ? a.website : null;
  const websiteB = isSafeHttpUrl(b.website) ? b.website : null;
  const affiliateA = isSafeHttpUrl(a.affiliate_link) ? a.affiliate_link : null;
  const affiliateB = isSafeHttpUrl(b.affiliate_link) ? b.affiliate_link : null;
  const logoA = isSafeHttpUrl(a.logo) ? a.logo : null;
  const logoB = isSafeHttpUrl(b.logo) ? b.logo : null;

  const tagSlugsA = new Set(extrasA.tags.map((t) => t.slug));
  const tagSlugsB = new Set(extrasB.tags.map((t) => t.slug));
  const platformsA = PLATFORM_TAGS.filter((p) => tagSlugsA.has(p.slug)).map((p) => p.label);
  const platformsB = PLATFORM_TAGS.filter((p) => tagSlugsB.has(p.slug)).map((p) => p.label);

  const title = `${a.name} vs ${b.name}: Pricing, Features & Verdict Compared | Gappsy`;
  const description =
    comparisonContent?.verdict.slice(0, 155).trim() ||
    `Compare ${a.name} and ${b.name} on pricing, features, platforms, and ratings.`;

  const faqJsonLd =
    comparisonContent && comparisonContent.faqs.length > 0
      ? [
          {
            '@type': 'FAQPage',
            '@id': `https://www.gappsy.com/compare/${comparison.slug}/#faq`,
            mainEntity: comparisonContent.faqs.map((faq) => ({
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
        title={title}
        description={description}
        path={`/compare/${comparison.slug}`}
        ogImage={logoA || logoB || '/og/default-og-image.svg'}
        breadcrumbs={[{ name: 'Compare', path: '/compare' }, { name: `${a.name} vs ${b.name}`, path: `/compare/${comparison.slug}` }]}
        jsonLd={faqJsonLd}
      />

      <SoftwareHeader />

      <div className="max-w-5xl mx-auto px-4 sm:px-6 pt-6">
        <nav aria-label="Breadcrumb" className="text-xs text-slate-400 flex items-center gap-1.5 flex-wrap">
          <Link to="/compare" className="hover:text-slate-600">Compare</Link>
          <span>/</span>
          <span className="text-slate-500">{a.name} vs {b.name}</span>
        </nav>
      </div>

      <main className="max-w-5xl mx-auto px-4 sm:px-6 py-8 space-y-14">
        {/* Hero */}
        <section>
          <div className="flex items-center justify-center gap-4 sm:gap-6 mb-6">
            <ToolIdentity name={a.name} logo={logoA} />
            <span className="text-slate-300 font-bold text-sm shrink-0">VS</span>
            <ToolIdentity name={b.name} logo={logoB} />
          </div>
          <h1 className="text-2xl sm:text-4xl font-bold text-[#0B1221] tracking-tight text-center">
            {a.name} vs {b.name}
          </h1>
          {comparisonContent && (
            <p className="text-slate-600 text-[15px] sm:text-lg leading-relaxed max-w-[70ch] mx-auto text-center mt-4">
              {comparisonContent.verdict}
            </p>
          )}
        </section>

        {/* Best for each */}
        {comparisonContent && (
          <section className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <BestForCard name={a.name} text={comparisonContent.bestForToolA} />
            <BestForCard name={b.name} text={comparisonContent.bestForToolB} />
          </section>
        )}

        {/* Facts table */}
        <section>
          <h2 className="text-xl font-bold text-[#0B1221] mb-4">At a Glance</h2>
          <FactsTable
            a={{ name: a.name, rating: a.rating, reviewCount: a.review_count, pricingModel: a.pricing_model, startingPrice: a.starting_price, verified: a.verified, hasFreePlan: tagSlugsA.has('free-plan') || tagSlugsA.has('freemium'), hasFreeTrial: tagSlugsA.has('free-trial'), platforms: platformsA, category: extrasA.primaryCategory?.name || null, integrationCount: extrasA.integrations.length }}
            b={{ name: b.name, rating: b.rating, reviewCount: b.review_count, pricingModel: b.pricing_model, startingPrice: b.starting_price, verified: b.verified, hasFreePlan: tagSlugsB.has('free-plan') || tagSlugsB.has('freemium'), hasFreeTrial: tagSlugsB.has('free-trial'), platforms: platformsB, category: extrasB.primaryCategory?.name || null, integrationCount: extrasB.integrations.length }}
          />
        </section>

        {/* Key differences */}
        {comparisonContent && comparisonContent.keyDifferences.length > 0 && (
          <section>
            <h2 className="text-xl font-bold text-[#0B1221] mb-4">Key Differences</h2>
            <div className="bg-white border border-[#eef0f3] rounded-2xl overflow-hidden overflow-x-auto">
              <table className="w-full text-sm min-w-[560px]">
                <thead>
                  <tr className="bg-slate-50 border-b border-slate-100">
                    <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-500 w-1/4">Difference</th>
                    <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-700">{a.name}</th>
                    <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-700">{b.name}</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {comparisonContent.keyDifferences.map((diff) => (
                    <tr key={diff.title}>
                      <th scope="row" className="text-left px-4 py-3 font-medium text-slate-500 align-top">{diff.title}</th>
                      <td className="px-4 py-3 text-slate-700 align-top">{diff.toolA}</td>
                      <td className="px-4 py-3 text-slate-700 align-top">{diff.toolB}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        )}

        {/* Features */}
        {(contentA?.features.length || contentB?.features.length) && (
          <section className="grid grid-cols-1 sm:grid-cols-2 gap-6">
            <FeatureColumn name={a.name} features={contentA?.features.slice(0, 8) || []} />
            <FeatureColumn name={b.name} features={contentB?.features.slice(0, 8) || []} />
          </section>
        )}

        {/* Pros & cons */}
        {(contentA || contentB) && (
          <section>
            <h2 className="text-xl font-bold text-[#0B1221] mb-4">Pros & Cons</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
              <ProsConsColumn name={a.name} pros={contentA?.pros.slice(0, 6) || []} cons={contentA?.cons.slice(0, 6) || []} />
              <ProsConsColumn name={b.name} pros={contentB?.pros.slice(0, 6) || []} cons={contentB?.cons.slice(0, 6) || []} />
            </div>
          </section>
        )}

        {/* Integrations */}
        {(extrasA.integrations.length > 0 || extrasB.integrations.length > 0) && (
          <section>
            <h2 className="text-xl font-bold text-[#0B1221] mb-4">Integrations</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
              <IntegrationsColumn name={a.name} integrations={extrasA.integrations} />
              <IntegrationsColumn name={b.name} integrations={extrasB.integrations} />
            </div>
          </section>
        )}

        {/* FAQs */}
        {comparisonContent && comparisonContent.faqs.length > 0 && (
          <section>
            <h2 className="text-xl font-bold text-[#0B1221] mb-4">Frequently Asked Questions</h2>
            <div className="space-y-3">
              {comparisonContent.faqs.map((faq) => (
                <details key={faq.question} className="bg-white border border-[#eef0f3] rounded-xl p-4 group">
                  <summary className="font-medium text-[#0B1221] text-sm cursor-pointer list-none flex items-center justify-between gap-2">
                    {faq.question}
                  </summary>
                  <p className="text-sm text-slate-500 leading-relaxed mt-2.5">{faq.answer}</p>
                </details>
              ))}
            </div>
          </section>
        )}

        {/* Related comparisons */}
        {related.length > 0 && (
          <section>
            <h2 className="text-xl font-bold text-[#0B1221] mb-4">Recently Viewed Comparisons</h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              {related.map((c) => (
                <ComparisonCard key={c.slug} slug={c.slug} toolA={c.tool_a} toolB={c.tool_b} />
              ))}
            </div>
          </section>
        )}

        {/* CTAs */}
        <section className="bg-white border border-[#eef0f3] rounded-2xl p-6 sm:p-8 grid grid-cols-1 sm:grid-cols-2 gap-4">
          <CtaCard name={a.name} slug={a.slug} websiteUrl={websiteA} affiliateUrl={affiliateA} />
          <CtaCard name={b.name} slug={b.slug} websiteUrl={websiteB} affiliateUrl={affiliateB} />
        </section>
      </main>

      <FooterWrapper />
    </div>
  );
}

function ToolIdentity({ name, logo }: { name: string; logo: string | null }) {
  return (
    <div className="flex flex-col items-center gap-2">
      {logo ? (
        <img src={logo} alt={name} className="w-14 h-14 sm:w-16 sm:h-16 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm" />
      ) : (
        <div className="w-14 h-14 sm:w-16 sm:h-16 rounded-2xl bg-slate-100 flex items-center justify-center text-slate-400 font-bold text-lg shadow-sm">
          {name.charAt(0)}
        </div>
      )}
    </div>
  );
}

function BestForCard({ name, text }: { name: string; text: string }) {
  return (
    <div className="bg-white border border-[#eef0f3] rounded-2xl p-5">
      <p className="text-xs font-semibold uppercase tracking-wide text-indigo-500 mb-1.5">Best for</p>
      <p className="text-sm text-slate-700 leading-relaxed"><span className="font-semibold text-[#0B1221]">{name}:</span> {text}</p>
    </div>
  );
}

interface FactsRow {
  name: string;
  rating: number;
  reviewCount: number;
  pricingModel: string | null;
  startingPrice: string | null;
  verified: boolean;
  hasFreePlan: boolean;
  hasFreeTrial: boolean;
  platforms: string[];
  category: string | null;
  integrationCount: number;
}

function FactsTable({ a, b }: { a: FactsRow; b: FactsRow }) {
  const rows: { label: string; a: React.ReactNode; b: React.ReactNode }[] = [
    { label: 'Rating', a: a.rating > 0 ? <RatingCell rating={a.rating} count={a.reviewCount} /> : 'Not yet rated', b: b.rating > 0 ? <RatingCell rating={b.rating} count={b.reviewCount} /> : 'Not yet rated' },
    { label: 'Category', a: a.category || 'Not listed', b: b.category || 'Not listed' },
    { label: 'Pricing model', a: a.pricingModel || 'Not listed', b: b.pricingModel || 'Not listed' },
    { label: 'Starting price', a: a.startingPrice || 'Not listed', b: b.startingPrice || 'Not listed' },
    { label: 'Free plan', a: <BoolCell value={a.hasFreePlan} />, b: <BoolCell value={b.hasFreePlan} /> },
    { label: 'Free trial', a: <BoolCell value={a.hasFreeTrial} />, b: <BoolCell value={b.hasFreeTrial} /> },
    { label: 'Platforms', a: a.platforms.length > 0 ? a.platforms.join(', ') : 'Not listed', b: b.platforms.length > 0 ? b.platforms.join(', ') : 'Not listed' },
    { label: 'Integrations', a: a.integrationCount > 0 ? `${a.integrationCount} listed` : 'Not listed', b: b.integrationCount > 0 ? `${b.integrationCount} listed` : 'Not listed' },
    { label: 'Verified listing', a: <BoolCell value={a.verified} />, b: <BoolCell value={b.verified} /> },
  ];

  return (
    <div className="bg-white border border-[#eef0f3] rounded-2xl overflow-hidden overflow-x-auto">
      <table className="w-full text-sm min-w-[480px]">
        <caption className="sr-only">Feature and pricing comparison between {a.name} and {b.name}</caption>
        <thead>
          <tr className="bg-slate-50 border-b border-slate-100">
            <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-500 w-1/3">&nbsp;</th>
            <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-700">{a.name}</th>
            <th scope="col" className="text-left px-4 py-3 font-semibold text-slate-700">{b.name}</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-slate-100">
          {rows.map((row) => (
            <tr key={row.label}>
              <th scope="row" className="text-left px-4 py-3 font-medium text-slate-500">{row.label}</th>
              <td className="px-4 py-3 text-slate-700">{row.a}</td>
              <td className="px-4 py-3 text-slate-700">{row.b}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function RatingCell({ rating, count }: { rating: number; count: number }) {
  return (
    <span className="inline-flex items-center gap-1">
      <Star className="w-3.5 h-3.5 text-amber-500 fill-amber-500" />
      {rating.toFixed(1)}
      {count > 0 && <span className="text-slate-400">({count})</span>}
    </span>
  );
}

function BoolCell({ value }: { value: boolean }) {
  return value ? (
    <span className="inline-flex items-center gap-1 text-emerald-600 font-medium"><Check className="w-3.5 h-3.5" /> Yes</span>
  ) : (
    <span className="inline-flex items-center gap-1 text-slate-400"><XIcon className="w-3.5 h-3.5" /> Not listed</span>
  );
}

function FeatureColumn({ name, features }: { name: string; features: { title: string; description: string }[] }) {
  if (features.length === 0) return null;
  return (
    <div>
      <h3 className="font-semibold text-[#0B1221] mb-3">{name} Features</h3>
      <ul className="space-y-2.5">
        {features.map((f) => (
          <li key={f.title} className="text-sm">
            <span className="font-medium text-slate-700">{f.title}</span>
            <span className="text-slate-500"> — {f.description}</span>
          </li>
        ))}
      </ul>
    </div>
  );
}

function ProsConsColumn({ name, pros, cons }: { name: string; pros: string[]; cons: string[] }) {
  if (pros.length === 0 && cons.length === 0) return null;
  return (
    <div className="bg-white border border-[#eef0f3] rounded-2xl p-5">
      <h3 className="font-semibold text-[#0B1221] mb-3">{name}</h3>
      {pros.length > 0 && (
        <ul className="space-y-1.5 mb-3">
          {pros.map((p) => (
            <li key={p} className="flex items-start gap-2 text-sm text-slate-600">
              <Check className="w-3.5 h-3.5 text-emerald-500 mt-0.5 shrink-0" />
              {p}
            </li>
          ))}
        </ul>
      )}
      {cons.length > 0 && (
        <ul className="space-y-1.5">
          {cons.map((c) => (
            <li key={c} className="flex items-start gap-2 text-sm text-slate-600">
              <XIcon className="w-3.5 h-3.5 text-red-400 mt-0.5 shrink-0" />
              {c}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

function IntegrationsColumn({ name, integrations }: { name: string; integrations: { id: string; integration_name: string }[] }) {
  if (integrations.length === 0) {
    return (
      <div>
        <h3 className="font-semibold text-[#0B1221] mb-3">{name}</h3>
        <p className="text-sm text-slate-400">No integrations listed yet.</p>
      </div>
    );
  }
  return (
    <div>
      <h3 className="font-semibold text-[#0B1221] mb-3">{name}</h3>
      <div className="flex flex-wrap gap-2">
        {integrations.map((i) => (
          <span key={i.id} className="inline-flex items-center px-3 py-1.5 rounded-full bg-slate-100 text-xs font-medium text-slate-600">
            {i.integration_name}
          </span>
        ))}
      </div>
    </div>
  );
}

function CtaCard({ name, slug, websiteUrl, affiliateUrl }: { name: string; slug: string; websiteUrl: string | null; affiliateUrl: string | null }) {
  const primaryUrl = affiliateUrl || websiteUrl;
  return (
    <div className="flex flex-col gap-2.5">
      <p className="font-semibold text-[#0B1221]">{name}</p>
      {primaryUrl && (
        <a
          href={primaryUrl}
          target="_blank"
          rel={affiliateUrl ? 'noopener sponsored' : 'noopener noreferrer'}
          className="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-xl bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] text-white font-semibold text-sm hover:opacity-95 transition-opacity"
        >
          Visit {name}
          <ExternalLink className="w-3.5 h-3.5" />
        </a>
      )}
      <Link
        to={`/tools/${slug}`}
        className="inline-flex items-center justify-center gap-2 px-4 py-2.5 rounded-xl border border-slate-200 text-slate-600 font-medium text-sm hover:bg-slate-50 transition-colors"
      >
        Read the full {name} review
      </Link>
    </div>
  );
}
