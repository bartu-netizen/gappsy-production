import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { Sparkles, ArrowRight, ArrowUp, Rocket } from 'lucide-react';
import { supabase } from '../../../lib/supabase';
import OverflowMarqueeText from './OverflowMarqueeText';

export interface FeaturedTool {
  slug: string;
  name: string;
  logo: string | null;
  short_description: string | null;
  pricing_model: string | null;
  starting_price: string | null;
}

// The actual fulfillment surface for Feature My Product's "your software
// appears on other tool pages" placement promise. Reads tools.featured —
// today that's a couple of editorially-marked tools (Canva, Figma); as real
// paid subscriptions land (see vendor_feature_subscriptions), those tools
// get featured=true too and start rotating through here automatically, no
// code change needed.
//
// Returns a shuffled POOL (up to `count`, excluding the tool(s) whose own
// page this is — a single slug on a tool page, both slugs on a /compare/
// page), not a single tool — the page distributes pool[0], pool[1], ...
// across multiple placements (sidebar top/bottom, a few spots inline in the
// article) so a page never shows the *same* competitor twice. When
// inventory is thin (today: 1-2 tools total), later slots simply come back
// `undefined` and those placements render nothing — no repeats, no
// placeholder clutter, same convention as ToolCardRow.
export function useFeaturedToolPool(excludeSlug: string | string[], count: number): FeaturedTool[] | undefined {
  const [pool, setPool] = useState<FeaturedTool[] | undefined>(undefined);
  const excludeSlugs = Array.isArray(excludeSlug) ? excludeSlug : [excludeSlug];
  const excludeKey = excludeSlugs.join(',');

  useEffect(() => {
    let cancelled = false;
    let query = supabase
      .from('tools')
      .select('slug, name, logo, short_description, pricing_model, starting_price')
      .eq('featured', true)
      .eq('status', 'published');
    for (const slug of excludeSlugs) {
      if (slug) query = query.neq('slug', slug);
    }
    query.limit(20).then(({ data }) => {
      if (cancelled) return;
      const shuffled = [...(data || [])].sort(() => Math.random() - 0.5);
      setPool(shuffled.slice(0, count));
    });
    return () => { cancelled = true; };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [excludeKey, count]);

  return pool;
}

// Distributes up to `promos.length` inline cards evenly through a long-form
// article's block list, skipping entirely on short articles (an ad in the
// first or last paragraph reads as spam, not placement) and never using
// more slots than the article can comfortably absorb.
export function planInlinePromoSlots<T>(totalBlocks: number, promos: T[]): { index: number; promo: T }[] {
  if (promos.length === 0 || totalBlocks < 6) return [];
  const usable = Math.min(promos.length, Math.floor(totalBlocks / 5));
  const slots: { index: number; promo: T }[] = [];
  for (let i = 1; i <= usable; i++) {
    slots.push({ index: Math.round((totalBlocks * i) / (usable + 1)), promo: promos[i - 1] });
  }
  return slots;
}

// Every featured-ad placement carries this same "want in on this?" nudge
// toward the paying-customer funnel — not just the sidebar's top slot.
function WantYourProductHereLink({ className = '' }: { className?: string }) {
  return (
    <Link
      to="/feature-my-product"
      className={`flex items-center gap-1 text-[11px] font-semibold text-[#4F47E6] hover:text-[#4338CA] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] rounded-sm ${className}`}
    >
      <ArrowUp className="w-3 h-3" aria-hidden="true" />
      Want your product here?
    </Link>
  );
}

export function FeaturedBadge({ large = false }: { large?: boolean }) {
  return (
    <span className={`inline-flex items-center gap-1 font-bold uppercase tracking-[0.06em] text-white bg-[#4F47E6] rounded-full ${large ? 'text-[10px] px-2.5 py-1' : 'text-[9px] px-2 py-0.5'}`}>
      <Sparkles className={large ? 'w-3 h-3' : 'w-2.5 h-2.5'} aria-hidden="true" />
      Featured
    </span>
  );
}

// Every sidebar featured-ad slot (the prominent one right after "Visit
// Website" and the quieter ones further down near Category/Tags) uses this
// same compact card — kept deliberately consistent rather than giving the
// first slot its own larger treatment. short_description rotates in on its
// own full-width row under the name (not squeezed next to the logo), same
// pause-on-hover-only-when-overflowing behavior as the sticky bottom bar.
export function FeaturedToolSidebarCompact({ tool }: { tool: FeaturedTool }) {
  return (
    <div className="rounded-xl bg-gradient-to-br from-[#EEF0FE]/70 to-purple-50/70 border border-[#E0E3FC] px-3 py-2.5">
      <Link
        to={`/tools/${tool.slug}`}
        className="group flex items-center gap-2.5 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] rounded-lg"
      >
        {tool.logo ? (
          <img src={tool.logo} alt="" className="w-8 h-8 rounded-lg object-contain border border-white bg-white shrink-0" />
        ) : (
          <div className="w-8 h-8 rounded-lg bg-white flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">{tool.name.charAt(0)}</div>
        )}
        <div className="min-w-0 flex-1">
          <FeaturedBadge />
          <p className="font-semibold text-[#0B1221] text-[13px] leading-tight truncate group-hover:text-[#4F47E6] transition-colors">{tool.name}</p>
        </div>
        <ArrowRight className="w-3.5 h-3.5 text-slate-400 shrink-0" aria-hidden="true" />
      </Link>
      {tool.short_description && (
        <OverflowMarqueeText text={tool.short_description} className="text-[11.5px] text-slate-500 mt-1.5 w-full" />
      )}
      <WantYourProductHereLink className="mt-2 pt-2 border-t border-[#E0E3FC]/80" />
    </div>
  );
}

// Shown instead of FeaturedToolSidebarCompact when the current tool is NOT
// featured — nudging the (possible) owner toward Feature My Product rather
// than spending that sidebar slot on a competitor ad. Prefills the
// onboarding wizard's URL step via ?url= so they don't have to retype it.
export function ClaimListingCard({ toolName, website }: { toolName: string; website: string | null }) {
  const onboardingHref = website ? `/feature-my-product/onboarding?url=${encodeURIComponent(website)}` : '/feature-my-product/onboarding';
  return (
    <div className="rounded-2xl bg-gradient-to-br from-[#EEF0FE] to-purple-50 border border-[#E0E3FC] p-4">
      <div className="w-9 h-9 rounded-xl bg-white flex items-center justify-center mb-2.5 shadow-sm">
        <Rocket className="w-4.5 h-4.5 text-[#4F47E6]" aria-hidden="true" />
      </div>
      <p className="font-bold text-[#0B1221] text-sm">Is {toolName} your product?</p>
      <p className="text-xs text-slate-600 leading-relaxed mt-1">
        Verify it and get a verified badge, self-serve editing, and the ability to reply to reviews — then optionally unlock featured placement.
      </p>
      <Link
        to={onboardingHref}
        className="flex items-center justify-center gap-1.5 w-full mt-3 px-4 py-2.5 rounded-xl text-sm font-semibold text-white bg-[#4F47E6] hover:bg-[#4338CA] transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2"
      >
        Verify it now
        <ArrowRight className="w-3.5 h-3.5" aria-hidden="true" />
      </Link>
    </div>
  );
}

// Inline mid-article placement — visually distinct from prose (tinted card,
// not a plain paragraph) so it's never mistaken for editorial content.
export function FeaturedToolInlineCard({ tool }: { tool: FeaturedTool }) {
  return (
    <div className="not-prose rounded-2xl border border-[#E0E3FC] bg-gradient-to-br from-[#EEF0FE]/60 to-purple-50/40 p-5">
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-center gap-3 min-w-0 flex-1">
          {tool.logo ? (
            <img src={tool.logo} alt="" className="w-11 h-11 rounded-xl object-contain border border-white bg-white shrink-0 shadow-sm" />
          ) : (
            <div className="w-11 h-11 rounded-xl bg-white flex items-center justify-center text-slate-400 font-semibold shrink-0 shadow-sm">{tool.name.charAt(0)}</div>
          )}
          <div className="min-w-0">
            <div className="flex items-center gap-2 mb-0.5">
              <FeaturedBadge large />
            </div>
            <p className="font-bold text-[#0B1221] text-[15px]">{tool.name}</p>
          </div>
        </div>
        {/* Small and tucked into the top-right corner rather than sharing a
            row with the description — that used to cap the description's
            width to whatever was left beside this button, so it could
            never rotate across the card's full width. */}
        <Link
          to={`/tools/${tool.slug}`}
          className="inline-flex items-center gap-1 px-2.5 py-1.5 rounded-lg text-xs font-semibold text-white bg-[#4F47E6] hover:bg-[#4338CA] transition-colors shrink-0 whitespace-nowrap focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-[#4F47E6] focus-visible:ring-offset-2"
        >
          View listing
          <ArrowRight className="w-3 h-3" aria-hidden="true" />
        </Link>
      </div>
      {tool.short_description && (
        <OverflowMarqueeText text={tool.short_description} className="text-[13px] text-slate-600 leading-relaxed mt-2 w-full" />
      )}
      <WantYourProductHereLink className="mt-3 pt-3 border-t border-[#E0E3FC]/80" />
    </div>
  );
}
