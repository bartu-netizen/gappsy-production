import { useEffect, useRef, useState } from 'react';
import { Link } from 'react-router-dom';
import {
  Star, ExternalLink, FolderTree, Tag as TagIcon, CheckCircle2, Plug, Globe, Calendar,
  Users, MapPin, Languages as LanguagesIcon, ShieldCheck, Clock, Bookmark, Share2,
  GitCompareArrows, Smartphone, Monitor, Apple, Chrome, MonitorSmartphone, Package,
} from 'lucide-react';
import Card from './Card';
import { useBookmarkedTool } from '../../../hooks/useBookmarkedTools';
import { formatLastUpdated } from '../../../utils/formatLastUpdated';
import type { TaxonomyRef } from './types';

interface ToolFactsSidebarProps {
  slug: string;
  name: string;
  rating: number;
  reviewCount: number;
  pricingModel: string | null;
  startingPrice: string | null;
  websiteUrl: string | null;
  affiliateUrl: string | null;
  categories: TaxonomyRef[];
  tags: TaxonomyRef[];
  integrationCount: number;
  verified: boolean;
  updatedAt: string | null;
  foundedYear: number | null;
  companySize: string | null;
  headquarters: string | null;
  languages: string[];
  quickCompareLinks?: { label: string; href: string }[];
  categoryHref?: string | null;
  children?: React.ReactNode;
}

// Tag slugs (from the shared tool_tags taxonomy) that this sidebar reads to
// derive "quick facts" the schema has no dedicated columns for yet —
// Free Plan / Free Trial / API Available / platform availability — instead
// of adding new tools columns for each one.
export const PLATFORM_TAGS: { slug: string; label: string; icon: typeof Smartphone }[] = [
  { slug: 'web-app', label: 'Web', icon: MonitorSmartphone },
  { slug: 'ios', label: 'iOS', icon: Apple },
  { slug: 'android', label: 'Android', icon: Smartphone },
  { slug: 'mac', label: 'Mac', icon: Apple },
  { slug: 'windows', label: 'Windows', icon: Monitor },
  { slug: 'chrome-extension', label: 'Browser Extension', icon: Chrome },
  { slug: 'desktop-app', label: 'Desktop App', icon: Monitor },
  { slug: 'mobile-app', label: 'Mobile App', icon: Smartphone },
];

function hostnameOf(url: string): string {
  try {
    return new URL(url).hostname.replace(/^www\./, '');
  } catch {
    return url;
  }
}

export default function ToolFactsSidebar({
  slug,
  name,
  rating,
  reviewCount,
  pricingModel,
  startingPrice,
  websiteUrl,
  affiliateUrl,
  categories,
  tags,
  integrationCount,
  verified,
  updatedAt,
  foundedYear,
  companySize,
  headquarters,
  languages,
  quickCompareLinks = [],
  categoryHref = null,
  children,
}: ToolFactsSidebarProps) {
  const { bookmarked, toggle: toggleBookmark } = useBookmarkedTool(slug);
  const [shareState, setShareState] = useState<'idle' | 'copied'>('idle');
  const [compareOpen, setCompareOpen] = useState(false);
  const comparePopoverRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!compareOpen) return;
    function handleClickOutside(e: MouseEvent) {
      if (comparePopoverRef.current && !comparePopoverRef.current.contains(e.target as Node)) {
        setCompareOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, [compareOpen]);

  const cta = affiliateUrl || websiteUrl;
  const tagSlugs = new Set(tags.map((t) => t.slug));
  const hasFreePlan = tagSlugs.has('free-plan') || tagSlugs.has('freemium');
  const hasFreeTrial = tagSlugs.has('free-trial');
  const hasApi = tagSlugs.has('api');
  const platforms = PLATFORM_TAGS.filter((p) => tagSlugs.has(p.slug));
  const updatedLabel = formatLastUpdated(updatedAt);

  async function handleShare() {
    const url = window.location.href;
    if (navigator.share) {
      try {
        await navigator.share({ title: name, url });
        return;
      } catch {
        // user cancelled the native share sheet — fall through to clipboard
      }
    }
    try {
      await navigator.clipboard.writeText(url);
      setShareState('copied');
      setTimeout(() => setShareState('idle'), 2000);
    } catch {
      // clipboard unavailable — nothing more we can do silently
    }
  }

  return (
    <div className="space-y-4 order-first lg:order-none">
      {/* Only the facts card itself sticks — when this card alone is
          already taller than the viewport (common on a long tool page),
          anything appended *inside* a sticky element that overflows the
          viewport stays permanently clipped for the entire pinned scroll
          range. Content after the card (e.g. a featured-tool promo) is a
          plain sibling instead, so it scrolls into view predictably once
          the sticky card's pinned range ends. */}
      <aside className="lg:sticky lg:top-[88px]">
        <Card className="p-5 space-y-5">
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
            className="inline-flex items-center justify-center gap-1.5 w-full bg-[#4F46E5] hover:bg-[#4338CA] active:scale-[0.98] text-white px-4 py-2.5 rounded-full font-semibold transition-all text-sm"
          >
            Visit Website
            <ExternalLink className="w-3.5 h-3.5" />
          </a>
        )}

        <div className="flex items-center justify-center gap-1.5">
          <button
            type="button"
            onClick={toggleBookmark}
            aria-pressed={bookmarked}
            aria-label={bookmarked ? 'Remove bookmark' : 'Bookmark this tool'}
            className={`flex-1 inline-flex items-center justify-center gap-1.5 p-2 rounded-full border text-xs font-medium transition-colors ${bookmarked ? 'bg-indigo-50 border-indigo-200 text-indigo-600' : 'border-slate-200 text-slate-500 hover:text-slate-700 hover:border-slate-300'}`}
          >
            <Bookmark className={`w-3.5 h-3.5 ${bookmarked ? 'fill-indigo-600' : ''}`} />
            Save
          </button>
          <button
            type="button"
            onClick={handleShare}
            aria-label="Share this tool"
            className="flex-1 inline-flex items-center justify-center gap-1.5 p-2 rounded-full border border-slate-200 text-xs font-medium text-slate-500 hover:text-slate-700 hover:border-slate-300 transition-colors relative"
          >
            <Share2 className="w-3.5 h-3.5" />
            {shareState === 'copied' ? 'Copied!' : 'Share'}
          </button>
          <div className="relative flex-1" ref={comparePopoverRef}>
            <button
              type="button"
              onClick={() => setCompareOpen((v) => !v)}
              aria-expanded={compareOpen}
              aria-label="Quick compare"
              className={`w-full inline-flex items-center justify-center gap-1.5 p-2 rounded-full border text-xs font-medium transition-colors ${compareOpen ? 'bg-indigo-50 border-indigo-200 text-indigo-600' : 'border-slate-200 text-slate-500 hover:text-slate-700 hover:border-slate-300'}`}
            >
              <GitCompareArrows className="w-3.5 h-3.5" />
              Compare
            </button>
            {compareOpen && (
              <div className="absolute z-20 top-full mt-2 left-1/2 -translate-x-1/2 w-56 rounded-xl bg-white border border-[#eef0f3] shadow-[0_12px_28px_rgba(15,23,42,0.14)] p-1.5">
                {quickCompareLinks.length > 0 ? (
                  quickCompareLinks.map((link) => (
                    <Link
                      key={link.href}
                      to={link.href}
                      onClick={() => setCompareOpen(false)}
                      className="flex items-center gap-2 px-2.5 py-2 rounded-lg text-xs font-medium text-slate-600 hover:bg-slate-50 hover:text-indigo-600 transition-colors"
                    >
                      <GitCompareArrows className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                      {link.label}
                    </Link>
                  ))
                ) : categoryHref ? (
                  <Link
                    to={categoryHref}
                    onClick={() => setCompareOpen(false)}
                    className="flex items-center gap-2 px-2.5 py-2 rounded-lg text-xs font-medium text-slate-600 hover:bg-slate-50 hover:text-indigo-600 transition-colors"
                  >
                    <FolderTree className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                    Browse similar tools
                  </Link>
                ) : (
                  <p className="px-2.5 py-2 text-xs text-slate-400">No comparisons available yet.</p>
                )}
              </div>
            )}
          </div>
        </div>

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

        <dl className="space-y-2.5 text-sm">
          {websiteUrl && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><Globe className="w-3.5 h-3.5" />Website</dt>
              <dd className="truncate max-w-[150px] text-right">
                <a href={websiteUrl} target="_blank" rel="noopener noreferrer nofollow" className="text-indigo-600 hover:text-indigo-700 font-medium">
                  {hostnameOf(websiteUrl)}
                </a>
              </dd>
            </div>
          )}
          {foundedYear && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><Calendar className="w-3.5 h-3.5" />Founded</dt>
              <dd className="font-medium text-[#0B1221]">{foundedYear}</dd>
            </div>
          )}
          {companySize && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><Users className="w-3.5 h-3.5" />Company size</dt>
              <dd className="font-medium text-[#0B1221] text-right">{companySize}</dd>
            </div>
          )}
          {headquarters && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><MapPin className="w-3.5 h-3.5" />Headquarters</dt>
              <dd className="font-medium text-[#0B1221] text-right">{headquarters}</dd>
            </div>
          )}
          {languages.length > 0 && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><LanguagesIcon className="w-3.5 h-3.5" />Languages</dt>
              <dd className="font-medium text-[#0B1221] text-right truncate max-w-[150px]">{languages.join(', ')}</dd>
            </div>
          )}
          <div className="flex items-center justify-between gap-3">
            <dt className="inline-flex items-center gap-1.5 text-slate-500"><ShieldCheck className="w-3.5 h-3.5" />Verified</dt>
            <dd className={`font-medium ${verified ? 'text-emerald-600' : 'text-slate-400'}`}>{verified ? 'Yes' : 'Not yet'}</dd>
          </div>
          {updatedLabel && (
            <div className="flex items-center justify-between gap-3">
              <dt className="inline-flex items-center gap-1.5 text-slate-500"><Clock className="w-3.5 h-3.5" />Last updated</dt>
              <dd className="font-medium text-[#0B1221]">{updatedLabel}</dd>
            </div>
          )}
        </dl>

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

        {affiliateUrl && (
          <p className="flex items-start gap-1.5 text-[11px] text-slate-400 leading-relaxed pt-1 border-t border-slate-100">
            <Package className="w-3.5 h-3.5 shrink-0 mt-0.5" />
            We may earn a commission if you sign up through our link, at no extra cost to you.
          </p>
        )}
      </Card>
      </aside>
      {children}
    </div>
  );
}
