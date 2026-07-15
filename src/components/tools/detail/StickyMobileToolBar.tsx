import { Link } from 'react-router-dom';
import { ExternalLink, Sparkles, ArrowRight } from 'lucide-react';

interface FeaturedTool {
  slug: string;
  name: string;
  logo: string | null;
}

interface StickyMobileToolBarProps {
  toolName: string;
  featured: boolean;
  cta: string | null;
  featuredPromo?: FeaturedTool | null;
}

// Mobile-only sticky bottom bar. This slot is a perk of being a featured
// listing, not a given: a featured tool gets its own persistent "Visit
// Website" CTA (real conversion value — the CTA in the hero/sidebar scrolls
// out of view on a long page). A non-featured tool's page instead uses that
// same slot to surface a featured competitor — same "Featured"-labeled
// promo pattern as FeaturedToolPromo, just in the one placement that's
// actually reserved for paying listings. Renders nothing if neither applies
// (no CTA and no promo candidate).
export default function StickyMobileToolBar({ toolName, featured, cta, featuredPromo }: StickyMobileToolBarProps) {
  if (featured && cta) {
    return (
      <div className="md:hidden fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-4 py-3 pb-[calc(0.75rem+env(safe-area-inset-bottom))]">
        <a
          href={cta}
          target="_blank"
          rel="noopener noreferrer nofollow"
          className="flex items-center justify-center gap-1.5 w-full px-5 py-3 rounded-full text-[15px] font-semibold text-white bg-[#4F46E5] active:scale-[0.99] transition-transform"
        >
          Visit {toolName}
          <ExternalLink className="w-4 h-4" aria-hidden="true" />
        </a>
      </div>
    );
  }

  if (featuredPromo) {
    return (
      <div className="md:hidden fixed bottom-0 inset-x-0 z-30 bg-white/95 backdrop-blur-sm border-t border-[#f1f3f5] px-4 py-2.5 pb-[calc(0.625rem+env(safe-area-inset-bottom))]">
        <Link to={`/tools/${featuredPromo.slug}`} className="flex items-center gap-3">
          {featuredPromo.logo ? (
            <img src={featuredPromo.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0" />
          ) : (
            <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-sm shrink-0">{featuredPromo.name.charAt(0)}</div>
          )}
          <div className="min-w-0 flex-1">
            <span className="inline-flex items-center gap-1 text-[9px] font-semibold uppercase tracking-[0.06em] text-[#4F46E5]">
              <Sparkles className="w-2.5 h-2.5" aria-hidden="true" />
              Featured
            </span>
            <p className="text-[13px] font-semibold text-[#0B1221] leading-tight truncate">{featuredPromo.name}</p>
          </div>
          <ArrowRight className="w-4 h-4 text-slate-400 shrink-0" aria-hidden="true" />
        </Link>
      </div>
    );
  }

  return null;
}
