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
  /** Rendered right after the "Visit Website" CTA, inside the sticky card —
   * high in the visible viewport by construction, so it's never at risk of
   * being clipped by the sticky card's own pinned-scroll overflow the way
   * anything appended after a long list of facts would be. */
  children?: React.ReactNode;
  /** Rendered immediately after `children`, still near the top of the
   * sticky card — originally placed near Category/Tags, but that sat just
   * below the fold for most of the pinned-scroll range on a typical
   * viewport, making it effectively invisible (the same sticky-overflow
   * clipping bug `children`'s placement was fixed for). Kept as a separate
   * prop from `children` so the two can hold two different pool entries
   * (see ToolDetailPage) rather than one. */
  secondarySlot?: React.ReactNode;
  /** A 3rd placement, spread further down so all 3 ad slots aren't stacked
   * in one cluster — deliberately rendered right after Save/Share/Compare
   * rather than near Integrations/Category/Tags further below: measured at
   * ~640px into the card, comfortably inside the visible window even on a
   * 768px-tall laptop screen (viewport height minus the ~88px sticky
   * offset), where Integrations/Category/Tags (1000px+ into the card) are
   * already clipped for most of the pinned-scroll range — the same bug
   * `children`'s placement was fixed for. */
  tertiarySlot?: React.ReactNode;
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

const TAG_PREVIEW_COUNT = 8;

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
  secondarySlot,
  tertiarySlot,
}: ToolFactsSidebarProps) {
  const { bookmarked, toggle: toggleBookmark } = useBookmarkedTool(slug);
  const [shareState, setShareState] = useState<'idle' | 'copied'>('idle');
  const [compareOpen, setCompareOpen] = useState(false);
  const [tagsExpanded, setTagsExpanded] = useState(false);
  const comparePopoverRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!compareOpen) return;
    function handleClickOutside(e: MouseEvent) {
      if (comparePopoverRef.current && !comparePopoverRef.current.contains(e.target as Node)) {
        setCompareOpen(false);
      }
    }
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') setCompareOpen(false);
    }
    document.addEventListener('mousedown', handleClickOutside);
    document.addEventListener('keydown', handleKeyDown);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
      document.removeEventListener('keydown', handleKeyDown);
    };
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
    <aside className="lg:sticky lg:top-[88px] order-first lg:order-none">
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
            className="inline-flex items-center justify-center gap-1.5 w-full bg-[#4F47E6] hover:bg-[#4338CA] active:scale-[0.98] text-white px-4 py-2.5 rounded-xl font-semibold transition-all text-sm"
          >
            Visit Website
            <ExternalLink className="w-3.5 h-3.5" />
          </a>
        )}

        {children}
        {secondarySlot}

        <div className="flex items-center justify-center gap-1.5">
          <button
            type="button"
            onClick={toggleBookmark}
            aria-pressed={bookmarked}
            aria-label={bookmarked ? 'Remove bookmark' : 'Bookmark this tool'}
            className={`flex-1 inline-flex items-center justify-center gap-1.5 p-2 rounded-full border text-xs font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2 ${bookmarked ? 'bg-[#EEF0FE] border-[#C7CCF7] text-[#4F47E6]' : 'border-slate-200 text-slate-500 hover:text-slate-700 hover:border-slate-300'}`}
          >
            <Bookmark className={`w-3.5 h-3.5 ${bookmarked ? 'fill-[#4F47E6]' : ''}`} />
            Save
          </button>
          <button
            type="button"
            onClick={handleShare}
            aria-label="Share this tool"
            className="flex-1 inline-flex items-center justify-center gap-1.5 p-2 rounded-full border border-slate-200 text-xs font-medium text-slate-500 hover:text-slate-700 hover:border-slate-300 transition-colors relative focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2"
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
              className={`w-full inline-flex items-center justify-center gap-1.5 p-2 rounded-full border text-xs font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2 ${compareOpen ? 'bg-[#EEF0FE] border-[#C7CCF7] text-[#4F47E6]' : 'border-slate-200 text-slate-500 hover:text-slate-700 hover:border-slate-300'}`}
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
                      className="flex items-center gap-2 px-2.5 py-2 rounded-lg text-xs font-medium text-slate-600 hover:bg-slate-50 hover:text-[#4F47E6] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6]"
                    >
                      <GitCompareArrows className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                      {link.label}
                    </Link>
                  ))
                ) : categoryHref ? (
                  <Link
                    to={categoryHref}
                    onClick={() => setCompareOpen(false)}
                    className="flex items-center gap-2 px-2.5 py-2 rounded-lg text-xs font-medium text-slate-600 hover:bg-slate-50 hover:text-[#4F47E6] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6]"
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

        {tertiarySlot}

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
                <a href={websiteUrl} target="_blank" rel="noopener noreferrer nofollow" className="text-[#4F47E6] hover:text-[#4338CA] font-medium">
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
          <a href="#integrations" className="flex items-center justify-between text-sm text-slate-600 hover:text-[#4F47E6] transition-colors">
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
                  className="inline-flex items-center gap-1 text-xs font-medium bg-[#EEF0FE] text-[#4338CA] px-2.5 py-1 rounded-full hover:bg-[#E0E3FC] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-1"
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
              {(tagsExpanded ? tags : tags.slice(0, TAG_PREVIEW_COUNT)).map((t) => (
                <Link
                  key={t.slug}
                  to={`/tool-tags/${t.slug}`}
                  className="inline-flex items-center gap-1 text-xs font-medium bg-slate-100 text-slate-600 px-2.5 py-1 rounded-full hover:bg-slate-200 transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-1"
                >
                  <TagIcon className="w-3 h-3" />
                  {t.name}
                </Link>
              ))}
              {!tagsExpanded && tags.length > TAG_PREVIEW_COUNT && (
                <button
                  type="button"
                  onClick={() => setTagsExpanded(true)}
                  className="inline-flex items-center text-xs font-medium text-[#4F47E6] px-2.5 py-1 rounded-full border border-[#E0E3FC] hover:bg-[#EEF0FE] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-1"
                >
                  +{tags.length - TAG_PREVIEW_COUNT} more
                </button>
              )}
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
  );
}
