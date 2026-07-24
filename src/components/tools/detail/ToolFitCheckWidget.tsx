import { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';
import { Link } from 'react-router-dom';
import { Star, ArrowRight, ArrowLeft } from 'lucide-react';
import AskGappsyChat from '../../askGappsy/AskGappsyChat';
import { FeaturedBadge } from './FeaturedToolPromo';
import { buildOutboundUrl } from '../../../utils/outboundLink';
import { trackToolOutboundClick } from '../../../lib/trackToolEvent';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

interface FitCheckAlternative {
  id: string;
  slug: string;
  name: string;
  logo: string | null;
  short_description: string | null;
  rating: number;
  review_count: number;
  billing_interval: string | null;
}

interface ToolFitCheckWidgetProps {
  toolSlug: string;
  toolName: string;
  toolLogo: string | null;
  websiteUrl: string;
  onClose: () => void;
}

const QUICK_QUESTIONS = [
  'I care most about price',
  'I care most about features & integrations',
  'I care most about ease of use',
  "Not sure yet — show me options",
];

function AlternativeCard({ tool, onNavigate, compact = false }: { tool: FitCheckAlternative; onNavigate: () => void; compact?: boolean }) {
  return (
    <Link
      to={`/tools/${tool.slug}`}
      onClick={onNavigate}
      className={`group block rounded-2xl border border-slate-200 bg-white hover:border-slate-300 hover:shadow-[0_4px_16px_rgba(10,23,53,0.06)] transition-all p-3.5 ${compact ? 'w-[240px] shrink-0' : ''}`}
    >
      <div className="flex items-center gap-2.5">
        {tool.logo ? (
          <img src={tool.logo} alt="" className="w-10 h-10 rounded-xl object-contain border border-slate-100 bg-white shrink-0" />
        ) : (
          <div className="w-10 h-10 rounded-xl bg-slate-50 border border-slate-100 flex items-center justify-center text-slate-400 font-semibold shrink-0">
            {tool.name.charAt(0)}
          </div>
        )}
        <div className="min-w-0 flex-1">
          <FeaturedBadge paid={Boolean(tool.billing_interval)} />
          <p className="font-semibold text-[#0B1221] text-[13.5px] leading-tight truncate mt-1">{tool.name}</p>
        </div>
      </div>
      {tool.short_description && (
        <p className="text-[12px] text-slate-500 leading-relaxed mt-2.5 line-clamp-2">{tool.short_description}</p>
      )}
      <div className="flex items-center justify-between mt-2.5">
        {tool.rating > 0 ? (
          <span className="flex items-center gap-1 text-[11.5px] text-slate-500">
            <Star className="w-3 h-3 text-amber-500 fill-amber-500" />
            {tool.rating.toFixed(1)}
            <span className="text-slate-400">({tool.review_count})</span>
          </span>
        ) : <span />}
        <span className="flex items-center gap-1 text-[11.5px] font-semibold text-[#4F47E6] group-hover:text-[#4338CA]">
          View
          <ArrowRight className="w-3 h-3" />
        </span>
      </div>
    </Link>
  );
}

function AlternativeCardSkeleton({ compact = false }: { compact?: boolean }) {
  return (
    <div className={`rounded-2xl border border-slate-100 bg-slate-50/60 p-3.5 animate-pulse ${compact ? 'w-[240px] shrink-0' : ''}`}>
      <div className="flex items-center gap-2.5">
        <div className="w-10 h-10 rounded-xl bg-slate-200 shrink-0" />
        <div className="min-w-0 flex-1 space-y-1.5">
          <div className="h-3 w-14 rounded bg-slate-200" />
          <div className="h-3 w-24 rounded bg-slate-200" />
        </div>
      </div>
      <div className="h-2.5 w-full rounded bg-slate-200 mt-3" />
      <div className="h-2.5 w-2/3 rounded bg-slate-200 mt-1.5" />
    </div>
  );
}

// Replaces the direct "Visit Website" CTA on UNCLAIMED tool pages only —
// claimed listings keep the plain direct link. Full-viewport editorial
// takeover (edge-to-edge, no card/backdrop): a large centered headline +
// chat on the left, a "similar tools" rail of genuinely relevant Featured
// listings on the right (desktop) / a horizontal strip (mobile) — never in
// place of the original tool, always alongside it, with a direct path to
// the original always one tap away via the header's "Visit anyway" link.
export default function ToolFitCheckWidget({ toolSlug, toolName, toolLogo, websiteUrl, onClose }: ToolFitCheckWidgetProps) {
  const [alternatives, setAlternatives] = useState<FitCheckAlternative[]>([]);
  const [loadingAlternatives, setLoadingAlternatives] = useState(true);
  // hasAsked drives what the single top-left back arrow does; resetKey
  // remounts AskGappsyChat (clearing its internal messages/error/streaming
  // state) so stepping "back" from a result is a real reset, not just a
  // visual toggle.
  const [hasAsked, setHasAsked] = useState(false);
  const [resetKey, setResetKey] = useState(0);

  // One back arrow, two jobs depending on where the visitor is — pops one
  // level at a time like a normal navigation stack: from a result, it
  // returns to the quick-question view; from the quick-question view
  // itself, it exits the fit-check entirely back to the tool page.
  function handleBackArrow() {
    if (hasAsked) {
      setHasAsked(false);
      setResetKey((k) => k + 1);
    } else {
      onClose();
    }
  }

  useEffect(() => {
    let cancelled = false;
    (async () => {
      try {
        const res = await fetch(`${SUPABASE_URL}/functions/v1/tool-fit-check`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
          body: JSON.stringify({ tool_slug: toolSlug }),
        });
        const data = await res.json().catch(() => null);
        if (!cancelled) setAlternatives(data?.ok ? data.alternatives || [] : []);
      } catch {
        if (!cancelled) setAlternatives([]);
      } finally {
        if (!cancelled) setLoadingAlternatives(false);
      }
    })();
    return () => {
      cancelled = true;
    };
  }, [toolSlug]);

  useEffect(() => {
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') onClose();
    }
    document.addEventListener('keydown', handleKeyDown);
    return () => document.removeEventListener('keydown', handleKeyDown);
  }, [onClose]);

  const outboundOriginal = buildOutboundUrl(websiteUrl);

  function handleContinueAnyway() {
    trackToolOutboundClick(toolSlug, 'fit_check_continue', outboundOriginal);
  }

  function handleTryAlternative(slug: string) {
    trackToolOutboundClick(toolSlug, 'fit_check_alternative', `/tools/${slug}`);
  }

  const hasAlternatives = !loadingAlternatives && alternatives.length > 0;
  const showAlternativesRail = loadingAlternatives || hasAlternatives;

  // Portaled to document.body: several ancestors between here and the page
  // root use backdrop-blur/transform (see GlobalSearch.tsx for the same
  // reasoning), which per spec makes them a containing block for `position:
  // fixed` descendants — without the portal this full-page takeover would
  // be confined to some ancestor's box and sit BEHIND the site's own sticky
  // header instead of covering the whole viewport above it. Confirmed live:
  // without this, the header intercepted clicks on the back button.
  return createPortal(
    <div className="fixed inset-0 z-50 bg-white flex flex-col fit-check-fullpage-in">
      <div className="flex items-center justify-between gap-3 h-14 px-4 sm:px-6 border-b border-slate-100 shrink-0">
        <button
          type="button"
          onClick={handleBackArrow}
          aria-label="Back"
          className="inline-flex items-center justify-center w-9 h-9 -ml-1.5 rounded-full text-slate-500 hover:text-slate-700 hover:bg-slate-50 transition-colors shrink-0"
        >
          <ArrowLeft className="w-5 h-5" />
        </button>
        <a
          href={outboundOriginal}
          target="_blank"
          rel="noopener noreferrer nofollow"
          onClick={handleContinueAnyway}
          className="inline-flex items-center gap-1 text-[12.5px] font-semibold text-slate-500 hover:text-[#0B1221] transition-colors shrink-0"
        >
          Visit {toolName} anyway
          <ArrowRight className="w-3.5 h-3.5" />
        </a>
      </div>

      <div className="flex-1 min-h-0 flex flex-col lg:flex-row overflow-y-auto lg:overflow-hidden">
        <div className="flex-1 min-w-0 flex flex-col lg:min-h-0">
          <div className="px-5 sm:px-8 pt-8 pb-5 sm:pt-10 sm:pb-6 text-center max-w-xl mx-auto w-full shrink-0">
            {toolLogo && (
              <img src={toolLogo} alt="" className="w-12 h-12 rounded-2xl object-contain border border-slate-100 bg-white shadow-sm mx-auto mb-4" />
            )}
            <h1 className="text-[22px] sm:text-[26px] font-bold text-[#0B1221] tracking-tight leading-tight">
              Is {toolName} right for you?
            </h1>
            <p className="text-[13.5px] text-slate-500 mt-2">Quick fit check — grounded in real listing data</p>
          </div>

          {showAlternativesRail && (
            <div className="lg:hidden px-5 sm:px-8 pb-5 shrink-0">
              <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400 mb-2.5">Similar tools worth a look</p>
              <div className="flex gap-3 overflow-x-auto pb-1 -mx-5 px-5 sm:-mx-8 sm:px-8">
                {loadingAlternatives
                  ? Array.from({ length: 2 }).map((_, i) => <AlternativeCardSkeleton key={i} compact />)
                  : alternatives.map((alt) => (
                      <AlternativeCard key={alt.id} tool={alt} compact onNavigate={() => handleTryAlternative(alt.slug)} />
                    ))}
              </div>
            </div>
          )}

          <div className="flex-1 min-h-0 max-w-xl mx-auto w-full flex flex-col border-t border-slate-100 lg:border-t-0">
            <AskGappsyChat
              key={resetKey}
              toolSlug={toolSlug}
              page="tool_fit_check"
              hideHeader
              suggestedQuestions={QUICK_QUESTIONS}
              placeholder={`Ask anything else about fitting ${toolName}...`}
              threadMaxHeightClass="max-h-none"
              onConversationStart={() => setHasAsked(true)}
            />
          </div>
        </div>

        {showAlternativesRail && (
          <div className="hidden lg:flex lg:flex-col w-[340px] shrink-0 border-l border-slate-100 lg:h-full lg:overflow-y-auto">
            <div className="px-5 py-6 space-y-3">
              <div>
                <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-slate-400">Similar tools worth a look</p>
                <p className="text-[12px] text-slate-400 mt-0.5">Featured listings matched by category and tags</p>
              </div>
              {loadingAlternatives
                ? Array.from({ length: 3 }).map((_, i) => <AlternativeCardSkeleton key={i} />)
                : alternatives.map((alt) => (
                    <AlternativeCard key={alt.id} tool={alt} onNavigate={() => handleTryAlternative(alt.slug)} />
                  ))}
            </div>
          </div>
        )}
      </div>
    </div>,
    document.body
  );
}
