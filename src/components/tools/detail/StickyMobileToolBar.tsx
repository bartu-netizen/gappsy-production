import { Link } from 'react-router-dom';
import { Sparkles, ArrowRight } from 'lucide-react';

interface FeaturedTool {
  slug: string;
  name: string;
  logo: string | null;
}

interface StickyMobileToolBarProps {
  featuredPromo?: FeaturedTool | null;
  categoryHref?: string | null;
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
// The whole row is styled as one obvious tappable chip (border, background,
// active-state feedback) with a bold, colored trailing arrow — a plain
// hover-only color change doesn't read as "clickable" on a touch device
// where hover never fires.
export default function StickyMobileToolBar({ featuredPromo, categoryHref }: StickyMobileToolBarProps) {
  if (featuredPromo) {
    return (
      <div className="lg:hidden fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-4 py-2.5 pb-[calc(0.625rem+env(safe-area-inset-bottom))]">
        <Link
          to={`/tools/${featuredPromo.slug}`}
          className="flex items-center gap-3 rounded-xl border border-slate-100 bg-slate-50/70 px-3 py-2 active:bg-[#EEF1F7] active:border-[#DEE3EF] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735]"
        >
          {featuredPromo.logo ? (
            <img src={featuredPromo.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0 bg-white" />
          ) : (
            <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-sm shrink-0">{featuredPromo.name.charAt(0)}</div>
          )}
          <div className="min-w-0 flex-1">
            <span className="inline-flex items-center gap-1 text-[9px] font-semibold uppercase tracking-[0.06em] text-[#2952CC]">
              <Sparkles className="w-2.5 h-2.5" aria-hidden="true" />
              Featured
            </span>
            <p className="text-[13px] font-semibold text-[#0B1221] leading-tight truncate">{featuredPromo.name}</p>
          </div>
          <ArrowRight className="w-4 h-4 text-[#2952CC] shrink-0" aria-hidden="true" />
        </Link>
        {/* A neutral escape hatch for visitors who aren't interested in the
            one competitor being promoted here — this slot is reserved for a
            paying feature, so it can only ever show a single ad; this link
            is how a non-featured page still offers a route to "something
            else" without turning the bar into a multi-ad carousel. */}
        {categoryHref && (
          <Link
            to={categoryHref}
            className="block text-center text-[10.5px] text-slate-400 hover:text-slate-600 mt-1.5 pt-1.5 border-t border-slate-100 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#0A1735] rounded-sm"
          >
            See alternatives
          </Link>
        )}
      </div>
    );
  }

  return null;
}
