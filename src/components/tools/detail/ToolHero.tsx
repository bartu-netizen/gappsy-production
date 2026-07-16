import { useEffect, useState } from 'react';
import { ShieldCheck, Star, Sparkles, BadgeCheck } from 'lucide-react';
import { Link } from 'react-router-dom';
import { Badge } from '../../Badge';
import { formatLastUpdated } from '../../../utils/formatLastUpdated';
import AskGappsyChat from '../../askGappsy/AskGappsyChat';
import type { TaxonomyRef } from './types';

interface ToolHeroProps {
  slug: string;
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
}

const AVATAR_COLORS = ['bg-[#E0E3FC] text-[#4F47E6]', 'bg-violet-100 text-violet-600', 'bg-emerald-100 text-emerald-600', 'bg-amber-100 text-amber-700'];

function initialsOf(name: string): string {
  const parts = name.trim().split(/\s+/);
  return ((parts[0]?.[0] || '') + (parts[1]?.[0] || '')).toUpperCase();
}

export default function ToolHero({
  slug,
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
}: ToolHeroProps) {
  const updatedLabel = formatLastUpdated(updatedAt);
  const visibleReviewers = reviewerNames.slice(0, 4);
  const extraReviewerCount = Math.max(0, reviewerNames.length - visibleReviewers.length);

  const [mounted, setMounted] = useState(false);
  useEffect(() => {
    const frame = requestAnimationFrame(() => setMounted(true));
    return () => cancelAnimationFrame(frame);
  }, []);

  return (
    <section className="max-w-6xl mx-auto px-4 sm:px-6 pt-4 sm:pt-10 pb-8 relative overflow-hidden">
      <div
        className="absolute inset-x-0 top-0 h-40 sm:h-64 -z-10 opacity-60"
        style={{ background: 'radial-gradient(60% 100% at 50% 0%, rgba(41,82,204,0.08), transparent)' }}
        aria-hidden="true"
      />
      <div
        className="absolute inset-x-0 top-0 h-48 sm:h-72 -z-10 opacity-40"
        style={{
          background: 'radial-gradient(45% 80% at 85% 0%, rgba(139,92,246,0.10), transparent)',
          backgroundImage:
            'radial-gradient(45% 80% at 85% 0%, rgba(139,92,246,0.10), transparent), radial-gradient(circle, rgba(41,82,204,0.06) 1px, transparent 1px)',
          backgroundSize: 'auto, 22px 22px',
        }}
        aria-hidden="true"
      />

      {/* Top identity row — logo, name, badges, description, rating. No CTA
          column squeezed in beside it anymore: the chat card below gets the
          hero's full width instead of sharing a cramped sidebar slot, which
          is what "See Reviews" + a compare link used to sit in. */}
      <div
        className={`flex flex-wrap sm:flex-nowrap sm:items-start gap-x-4 sm:gap-x-6 gap-y-5 transition-all duration-500 ease-out ${
          mounted ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-2'
        }`}
      >
        <div className="relative shrink-0">
          <div
            className="absolute -inset-3 -z-10 rounded-full opacity-70 blur-xl"
            style={{ background: 'radial-gradient(circle, rgba(41,82,204,0.18), transparent 70%)' }}
            aria-hidden="true"
          />
          {logo ? (
            <img
              src={logo}
              alt={name}
              width={96}
              height={96}
              fetchPriority="high"
              className="w-14 h-14 sm:w-24 sm:h-24 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm"
            />
          ) : (
            <div className="w-14 h-14 sm:w-24 sm:h-24 rounded-2xl bg-[#EEF0FE] flex items-center justify-center text-[#8B90D9] font-bold text-xl sm:text-3xl">
              {name.charAt(0)}
            </div>
          )}
        </div>

        <div className="flex-1 min-w-0">
          <div className="flex items-center flex-wrap gap-1.5 sm:gap-2 mb-0.5 sm:mb-1">
            <h1 className="text-2xl sm:text-[42px] font-bold text-[#0B1221] leading-tight tracking-[-0.02em]">{name}</h1>
            {verified && <ShieldCheck className="w-5 h-5 sm:w-6 sm:h-6 text-[#4F47E6] shrink-0" aria-label="Verified" />}
            {/* Pushed to the far right of this same row (falls to its own
                line only if the name+shield already fill it, e.g. very
                long names) — was previously in the badges row below, where
                it was the item most likely to get clipped by the mobile
                horizontal scroll. */}
            {verified && (
              <Link
                to="/editorial-policy"
                className="ml-auto shrink-0 inline-flex items-center gap-1 text-[10px] sm:text-xs font-medium text-slate-400 hover:text-[#4F47E6] transition-colors"
              >
                <BadgeCheck className="w-3 h-3 sm:w-3.5 sm:h-3.5" />
                How we review
              </Link>
            )}
          </div>

          {/* Mobile: forced single row (flex-nowrap + horizontal scroll) so
              these never wrap to a second line regardless of how many are
              present — restores normal wrapping from sm: up. */}
          <div className="flex items-center gap-1.5 sm:gap-2 flex-nowrap overflow-x-auto scrollbar-hide sm:flex-wrap sm:overflow-visible mb-1.5 sm:mb-3 -mx-4 px-4 sm:mx-0 sm:px-0">
            {featured && <Badge compact className="bg-amber-100 text-amber-700 shrink-0">Editor's Pick</Badge>}
            {hasAI && (
              <Badge compact className="bg-violet-50 text-violet-600 shrink-0">
                <Sparkles className="w-3 h-3 mr-1 inline -mt-0.5" />
                AI-Powered
              </Badge>
            )}
            {primaryCategory && (
              <Link
                to={`/tool-categories/${primaryCategory.slug}`}
                className="inline-flex items-center shrink-0 text-[10px] sm:text-xs font-medium bg-[#EEF0FE] text-[#4338CA] px-2 py-0.5 sm:px-2.5 sm:py-1 rounded-full hover:bg-[#E0E3FC] transition-colors"
              >
                {primaryCategory.name}
              </Link>
            )}
          </div>

          {shortDescription && (
            <p className="text-slate-600 text-[15px] sm:text-lg leading-relaxed max-w-2xl mb-2 sm:mb-4 line-clamp-2 sm:line-clamp-none">{shortDescription}</p>
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
            <div className="flex items-center gap-2 mt-2 sm:mt-3">
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
      </div>

      {/* Full-width "Ask Gappsy" chat — the crucial, highly-visible slot the
          old CTA column used to occupy. Wide enough here for a real
          conversation instead of a cramped sidebar-width widget. */}
      <div className="mt-2 sm:mt-6 rounded-2xl border border-slate-100 bg-white shadow-[0_8px_24px_rgba(15,23,42,0.08)] overflow-hidden">
        <AskGappsyChat
          toolSlug={slug}
          toolName={name}
          suggestedQuestions={[
            `Is ${name} free to use?`,
            `What's ${name} best for?`,
            `Is it easy to learn?`,
          ]}
        />
      </div>
    </section>
  );
}
