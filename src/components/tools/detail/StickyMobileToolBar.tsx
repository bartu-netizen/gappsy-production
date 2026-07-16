import { Link } from 'react-router-dom';
import { FeaturedBadge } from './FeaturedToolPromo';
import OverflowMarqueeText from './OverflowMarqueeText';

interface FeaturedTool {
  slug: string;
  name: string;
  logo: string | null;
  short_description?: string | null;
}

interface StickyMobileToolBarProps {
  featuredPromo?: FeaturedTool | null;
}

// Mobile/tablet sticky bottom bar surfacing a featured competitor — same
// "Featured"-labeled promo pattern as FeaturedToolPromo, just in this one
// bottom-of-viewport placement. `lg:hidden` (not `md:hidden`) so there's no
// dead zone between this bar and StickyDesktopToolBar's `lg:` breakpoint —
// without it, viewports in the 768-1023px range (e.g. iPad portrait) showed
// neither bar at all. Shows on every tool page, including a featured tool's
// own: `tools.featured` today is purely an editorial flag (no tool has an
// actual paid feature subscription yet — see vendor_feature_subscriptions),
// so there's no real listing whose page this slot should be reserved away
// from. Once real paid subscriptions exist, that's the point to reintroduce
// a "paying tool's own page skips the ad" branch, gated on actual payment
// status rather than the editorial flag. Renders nothing if there's no
// promo candidate (pool exhausted — no placeholder clutter).
//
// Name sits where the "Featured" label used to be — it's the thing worth
// reading first at a glance — with the full-width rotating description
// underneath (same OverflowMarqueeText used by every other featured slot).
// "Featured" itself becomes a small corner badge rather than competing for
// the same line as the name; it's a disclosure label, not the headline.
export default function StickyMobileToolBar({ featuredPromo }: StickyMobileToolBarProps) {
  if (!featuredPromo) return null;

  return (
    <div className="lg:hidden fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-4 py-2.5 pb-[calc(0.625rem+env(safe-area-inset-bottom))]">
      <Link
        to={`/tools/${featuredPromo.slug}`}
        className="relative flex items-center gap-3 rounded-xl border border-slate-100 bg-slate-50/70 px-3 py-2 active:bg-[#EEF0FE] active:border-[#E0E3FC] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6]"
      >
        {featuredPromo.logo ? (
          <img src={featuredPromo.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
        ) : (
          <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-sm shrink-0">{featuredPromo.name.charAt(0)}</div>
        )}
        <div className="min-w-0 flex-1 pr-14">
          <p className="text-[13px] font-semibold text-[#0B1221] leading-tight truncate">{featuredPromo.name}</p>
          {featuredPromo.short_description && (
            <OverflowMarqueeText text={featuredPromo.short_description} className="text-[11px] text-slate-500 mt-0.5 w-full" />
          )}
        </div>
        <div className="absolute top-1.5 right-1.5 scale-90 origin-top-right">
          <FeaturedBadge />
        </div>
      </Link>
    </div>
  );
}
