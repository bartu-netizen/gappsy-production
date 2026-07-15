import { useEffect, useState } from 'react';
import { ShieldCheck, Star, Sparkles, BadgeCheck, MessageSquarePlus, GitCompareArrows } from 'lucide-react';
import { Link } from 'react-router-dom';
import { Badge } from '../../Badge';
import { formatLastUpdated } from '../../../utils/formatLastUpdated';
import type { TaxonomyRef } from './types';

interface ToolHeroProps {
  name: string;
  logo: string | null;
  shortDescription: string | null;
  verified: boolean;
  featured: boolean;
  hasAI: boolean;
  rating: number;
  reviewCount: number;
  pricingModel: string | null;
  startingPrice: string | null;
  primaryCategory: TaxonomyRef | null;
  updatedAt: string | null;
  reviewerNames?: string[];
  /** Real /compare/x-vs-y pages only (see ToolDetailPage's quickCompareLinks
   * filter) — the hero's Compare button uses the first one, falling back
   * to the category page so it never promises a head-to-head that dead-ends. */
  quickCompareLinks?: { label: string; href: string }[];
  categoryHref?: string | null;
}

const AVATAR_COLORS = ['bg-indigo-100 text-indigo-600', 'bg-violet-100 text-violet-600', 'bg-emerald-100 text-emerald-600', 'bg-amber-100 text-amber-700'];

function initialsOf(name: string): string {
  const parts = name.trim().split(/\s+/);
  return ((parts[0]?.[0] || '') + (parts[1]?.[0] || '')).toUpperCase();
}

export default function ToolHero({
  name,
  logo,
  shortDescription,
  verified,
  featured,
  hasAI,
  rating,
  reviewCount,
  pricingModel,
  startingPrice,
  primaryCategory,
  updatedAt,
  reviewerNames = [],
  quickCompareLinks = [],
  categoryHref = null,
}: ToolHeroProps) {
  const updatedLabel = formatLastUpdated(updatedAt);
  const visibleReviewers = reviewerNames.slice(0, 4);
  const extraReviewerCount = Math.max(0, reviewerNames.length - visibleReviewers.length);
  const compareHref = quickCompareLinks[0]?.href || categoryHref;
  const compareLabel = quickCompareLinks[0]?.label || 'Compare alternatives';

  const [mounted, setMounted] = useState(false);
  useEffect(() => {
    const frame = requestAnimationFrame(() => setMounted(true));
    return () => cancelAnimationFrame(frame);
  }, []);

  return (
    <section className="max-w-6xl mx-auto px-4 sm:px-6 pt-6 sm:pt-10 pb-8 relative overflow-hidden">
      <div
        className="absolute inset-x-0 top-0 h-40 sm:h-64 -z-10 opacity-60"
        style={{ background: 'radial-gradient(60% 100% at 50% 0%, rgba(79,70,229,0.08), transparent)' }}
        aria-hidden="true"
      />
      <div
        className="absolute inset-x-0 top-0 h-48 sm:h-72 -z-10 opacity-40"
        style={{
          background: 'radial-gradient(45% 80% at 85% 0%, rgba(139,92,246,0.10), transparent)',
          backgroundImage:
            'radial-gradient(45% 80% at 85% 0%, rgba(139,92,246,0.10), transparent), radial-gradient(circle, rgba(79,70,229,0.06) 1px, transparent 1px)',
          backgroundSize: 'auto, 22px 22px',
        }}
        aria-hidden="true"
      />

      <div
        className={`flex flex-wrap sm:flex-nowrap sm:items-start gap-x-4 sm:gap-x-6 gap-y-5 transition-all duration-500 ease-out ${
          mounted ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-2'
        }`}
      >
        <div className="relative shrink-0">
          <div
            className="absolute -inset-3 -z-10 rounded-full opacity-70 blur-xl"
            style={{ background: 'radial-gradient(circle, rgba(79,70,229,0.18), transparent 70%)' }}
            aria-hidden="true"
          />
          {logo ? (
            <img
              src={logo}
              alt={name}
              width={96}
              height={96}
              fetchPriority="high"
              className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm"
            />
          ) : (
            <div className="w-20 h-20 sm:w-24 sm:h-24 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-400 font-bold text-3xl">
              {name.charAt(0)}
            </div>
          )}
        </div>

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 flex-wrap mb-1">
            <h1 className="text-3xl sm:text-[42px] font-bold text-[#0B1221] leading-tight tracking-[-0.02em]">{name}</h1>
            {verified && <ShieldCheck className="w-6 h-6 text-indigo-500 shrink-0" aria-label="Verified" />}
          </div>

          <div className="flex items-center gap-2 flex-wrap mb-3">
            {featured && <Badge className="bg-amber-100 text-amber-700">Editor's Pick</Badge>}
            {hasAI && (
              <Badge className="bg-violet-50 text-violet-600">
                <Sparkles className="w-3 h-3 mr-1 inline -mt-0.5" />
                AI-Powered
              </Badge>
            )}
            {primaryCategory && (
              <Link
                to={`/tool-categories/${primaryCategory.slug}`}
                className="inline-flex items-center text-xs font-medium bg-indigo-50 text-indigo-700 px-2.5 py-1 rounded-full hover:bg-indigo-100 transition-colors"
              >
                {primaryCategory.name}
              </Link>
            )}
            {verified && (
              <Link
                to="/editorial-policy"
                className="inline-flex items-center gap-1 text-xs font-medium text-slate-400 hover:text-indigo-600 transition-colors"
              >
                <BadgeCheck className="w-3.5 h-3.5" />
                How we review
              </Link>
            )}
          </div>

          {shortDescription && (
            <p className="text-slate-600 text-[15px] sm:text-lg leading-relaxed max-w-2xl mb-4">{shortDescription}</p>
          )}

          <div className="flex items-center gap-x-5 gap-y-2 flex-wrap text-sm">
            {rating > 0 && (
              <span className="inline-flex items-center gap-1.5 text-slate-600">
                <span className="inline-flex items-center gap-0.5 bg-amber-50 text-amber-700 font-bold text-[13px] px-2 py-0.5 rounded-md tabular-nums">
                  <Star className="w-3.5 h-3.5 fill-amber-500 text-amber-500" />
                  {rating.toFixed(1)}
                </span>
                {reviewCount > 0 ? (
                  <span className="text-slate-400 tabular-nums">{reviewCount.toLocaleString()} reviews</span>
                ) : (
                  <span className="text-slate-400">Editor score</span>
                )}
              </span>
            )}
            {(pricingModel || startingPrice) && (
              <span className="text-slate-500">
                {pricingModel}
                {pricingModel && startingPrice ? ' · ' : ''}
                {startingPrice && <span className="font-medium text-slate-700">From {startingPrice}</span>}
              </span>
            )}
            {updatedLabel && <span className="text-slate-400">Updated {updatedLabel}</span>}
          </div>

          {visibleReviewers.length > 0 && (
            <div className="flex items-center gap-2 mt-3">
              <div className="flex -space-x-2">
                {visibleReviewers.map((reviewer, i) => (
                  <span
                    key={reviewer + i}
                    title={reviewer}
                    className={`w-6 h-6 rounded-full border-2 border-white flex items-center justify-center text-[10px] font-semibold ${AVATAR_COLORS[i % AVATAR_COLORS.length]}`}
                  >
                    {initialsOf(reviewer)}
                  </span>
                ))}
                {extraReviewerCount > 0 && (
                  <span className="w-6 h-6 rounded-full border-2 border-white bg-slate-100 text-slate-500 flex items-center justify-center text-[10px] font-semibold">
                    +{extraReviewerCount}
                  </span>
                )}
              </div>
              <span className="text-xs text-slate-400">Trusted by real reviewers</span>
            </div>
          )}
        </div>

        {/* Not a "Visit Website" repeat — the sidebar CTA is already
            permanently visible (lg:sticky) and the mobile/desktop sticky
            bars cover conversion too. This slot instead drives on-site
            engagement: writing a review (bootstraps the review system)
            and comparing against a real alternative. One clear primary
            action plus a quiet text link reads as an intentional pair, not
            two competing buttons — the earlier bordered-pill treatment for
            Compare looked like a shrunken copy of the CTA above it. */}
        <div className="flex flex-col items-start sm:items-end gap-2.5 shrink-0 w-full sm:w-auto">
          <a
            href="#reviews"
            className="inline-flex items-center justify-center gap-1.5 bg-gradient-to-br from-[#4F46E5] to-[#7C3AED] hover:from-[#4338CA] hover:to-[#6D28D9] active:scale-[0.98] text-white px-6 py-3 rounded-full font-semibold transition-all text-sm w-full sm:w-auto shadow-[0_8px_20px_rgba(79,70,229,0.3)] focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 focus-visible:ring-offset-2"
          >
            <MessageSquarePlus className="w-4 h-4" aria-hidden="true" />
            Write a review
          </a>
          {compareHref && (
            <Link
              to={compareHref}
              className="inline-flex items-center gap-1.5 text-slate-500 hover:text-indigo-600 transition-colors text-[13px] font-medium focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-500 rounded-sm"
            >
              <GitCompareArrows className="w-3.5 h-3.5" aria-hidden="true" />
              {compareLabel}
            </Link>
          )}
        </div>
      </div>
    </section>
  );
}
