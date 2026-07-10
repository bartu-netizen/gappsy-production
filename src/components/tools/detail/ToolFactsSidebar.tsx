import { Link } from 'react-router-dom';
import {
  Star, ExternalLink, FolderTree, Tag as TagIcon, CheckCircle2, Plug,
  Smartphone, Monitor, Apple, Chrome, MonitorSmartphone,
} from 'lucide-react';
import type { TaxonomyRef } from './types';

interface ToolFactsSidebarProps {
  rating: number;
  reviewCount: number;
  pricingModel: string | null;
  startingPrice: string | null;
  websiteUrl: string | null;
  affiliateUrl: string | null;
  categories: TaxonomyRef[];
  tags: TaxonomyRef[];
  integrationCount: number;
}

// Tag slugs (from the shared tool_tags taxonomy) that this sidebar reads to
// derive "quick facts" the schema has no dedicated columns for yet —
// Free Plan / Free Trial / API Available / platform availability — instead
// of adding new tools columns for each one.
const PLATFORM_TAGS: { slug: string; label: string; icon: typeof Smartphone }[] = [
  { slug: 'web-app', label: 'Web', icon: MonitorSmartphone },
  { slug: 'ios', label: 'iOS', icon: Apple },
  { slug: 'android', label: 'Android', icon: Smartphone },
  { slug: 'mac', label: 'Mac', icon: Apple },
  { slug: 'windows', label: 'Windows', icon: Monitor },
  { slug: 'chrome-extension', label: 'Chrome', icon: Chrome },
];

export default function ToolFactsSidebar({
  rating,
  reviewCount,
  pricingModel,
  startingPrice,
  websiteUrl,
  affiliateUrl,
  categories,
  tags,
  integrationCount,
}: ToolFactsSidebarProps) {
  const cta = affiliateUrl || websiteUrl;
  const tagSlugs = new Set(tags.map((t) => t.slug));
  const hasFreePlan = tagSlugs.has('free-plan') || tagSlugs.has('freemium');
  const hasFreeTrial = tagSlugs.has('free-trial');
  const hasApi = tagSlugs.has('api');
  const platforms = PLATFORM_TAGS.filter((p) => tagSlugs.has(p.slug));

  return (
    <aside className="lg:sticky lg:top-6 space-y-4">
      <div className="bg-white border border-[#eef0f3] rounded-2xl p-5 space-y-5 shadow-sm">
        {rating > 0 && (
          <div>
            <div className="flex items-center gap-1">
              {Array.from({ length: 5 }).map((_, i) => (
                <Star key={i} className={`w-4 h-4 ${i < Math.round(rating) ? 'text-amber-500 fill-amber-500' : 'text-slate-200 fill-slate-200'}`} />
              ))}
              <span className="ml-1 font-semibold text-[#0B1221] text-sm">{rating.toFixed(1)}</span>
            </div>
            <p className="text-xs text-slate-400 mt-1">{reviewCount > 0 ? `${reviewCount.toLocaleString()} reviews` : 'Editorial rating'}</p>
          </div>
        )}

        {(pricingModel || startingPrice) && (
          <div>
            <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-1.5">Pricing</p>
            {pricingModel && <p className="text-sm font-medium text-[#0B1221]">{pricingModel}</p>}
            {startingPrice && <p className="text-sm text-slate-500 mt-0.5">From {startingPrice}</p>}
          </div>
        )}

        {cta && (
          <a
            href={cta}
            target="_blank"
            rel="noopener noreferrer nofollow"
            className="inline-flex items-center justify-center gap-1.5 w-full bg-[#4F46E5] hover:bg-[#4338CA] text-white px-4 py-2.5 rounded-full font-semibold transition-colors text-sm"
          >
            Visit Website
            <ExternalLink className="w-3.5 h-3.5" />
          </a>
        )}

        {(hasFreePlan || hasFreeTrial || hasApi) && (
          <div className="flex flex-wrap gap-x-4 gap-y-1.5 text-xs text-slate-600">
            {hasFreePlan && <span className="inline-flex items-center gap-1"><CheckCircle2 className="w-3.5 h-3.5 text-emerald-500" />Free plan</span>}
            {hasFreeTrial && <span className="inline-flex items-center gap-1"><CheckCircle2 className="w-3.5 h-3.5 text-emerald-500" />Free trial</span>}
            {hasApi && <span className="inline-flex items-center gap-1"><CheckCircle2 className="w-3.5 h-3.5 text-emerald-500" />API available</span>}
          </div>
        )}

        {platforms.length > 0 && (
          <div>
            <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2">Platforms</p>
            <div className="flex flex-wrap gap-2">
              {platforms.map((p) => (
                <span key={p.slug} className="inline-flex items-center gap-1 text-xs text-slate-600 bg-slate-50 px-2 py-1 rounded-lg">
                  <p.icon className="w-3.5 h-3.5" />
                  {p.label}
                </span>
              ))}
            </div>
          </div>
        )}

        {integrationCount > 0 && (
          <a href="#integrations" className="flex items-center justify-between text-sm text-slate-600 hover:text-indigo-600 transition-colors">
            <span className="inline-flex items-center gap-1.5"><Plug className="w-3.5 h-3.5" />Integrations</span>
            <span className="font-medium">{integrationCount}</span>
          </a>
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
  );
}
