import { useEffect, useState } from 'react';
import { createPortal } from 'react-dom';
import { Link } from 'react-router-dom';
import { Star, ArrowRight, ArrowLeft } from 'lucide-react';
import AskGappsyChat from '../../askGappsy/AskGappsyChat';
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
}

interface ToolFitCheckWidgetProps {
  toolSlug: string;
  toolName: string;
  websiteUrl: string;
  onClose: () => void;
}

const QUICK_QUESTIONS = [
  'I care most about price',
  'I care most about features & integrations',
  'I care most about ease of use',
  "Not sure yet — show me options",
];

// Replaces the direct "Visit Website" CTA on UNCLAIMED tool pages only —
// claimed listings keep the plain direct link. Takes over the full viewport
// (edge-to-edge, no card/backdrop) in the same visual language as the Ask
// Gappsy chat, asks one quick multiple-choice question, and always keeps a
// direct path to the tool the visitor actually came to see. If a genuinely
// relevant Featured (paying) alternative exists in the same category — via
// a real tag-overlap relevance gate server-side, not just "same category" —
// it's shown alongside, clearly labeled "Featured", never in place of the
// original.
export default function ToolFitCheckWidget({ toolSlug, toolName, websiteUrl, onClose }: ToolFitCheckWidgetProps) {
  const [recommended, setRecommended] = useState<FitCheckAlternative | null>(null);
  const [loadingRecommendation, setLoadingRecommendation] = useState(true);
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
        if (!cancelled) setRecommended(data?.ok ? data.recommended || null : null);
      } catch {
        if (!cancelled) setRecommended(null);
      } finally {
        if (!cancelled) setLoadingRecommendation(false);
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

  function handleTryAlternative() {
    if (recommended) trackToolOutboundClick(toolSlug, 'fit_check_alternative', `/tools/${recommended.slug}`);
  }

  // Portaled to document.body: several ancestors between here and the page
  // root use backdrop-blur/transform (see GlobalSearch.tsx for the same
  // reasoning), which per spec makes them a containing block for `position:
  // fixed` descendants — without the portal this full-page takeover would
  // be confined to some ancestor's box and sit BEHIND the site's own sticky
  // header instead of covering the whole viewport above it. Confirmed live:
  // without this, the header intercepted clicks on the back button.
  return createPortal(
    <div className="fixed inset-0 z-50 bg-white flex flex-col fit-check-fullpage-in">
      <div className="flex items-center gap-3 h-14 px-4 sm:px-6 border-b border-slate-100 shrink-0">
        <button
          type="button"
          onClick={handleBackArrow}
          aria-label="Back"
          className="inline-flex items-center justify-center w-9 h-9 -ml-1.5 rounded-full text-slate-500 hover:text-slate-700 hover:bg-slate-50 transition-colors shrink-0"
        >
          <ArrowLeft className="w-5 h-5" />
        </button>
        <span className="font-semibold text-[13.5px] text-slate-500 truncate">{toolName}</span>
      </div>
      <div className="flex-1 flex flex-col min-h-0 w-full">
        <AskGappsyChat
          key={resetKey}
          toolSlug={toolSlug}
          page="tool_fit_check"
          title={`Is ${toolName} right for you?`}
          subtitle="Quick fit check — grounded in real listing data"
          suggestedQuestions={QUICK_QUESTIONS}
          placeholder={`Ask anything else about fitting ${toolName}...`}
          threadMaxHeightClass="max-h-none"
          onConversationStart={() => setHasAsked(true)}
          footerSlot={
                <div className="px-4 sm:px-5 py-3.5 border-t border-slate-100 space-y-2.5">
                  {!loadingRecommendation && recommended && (
                    <div className="rounded-2xl border border-amber-200 bg-amber-50/60 p-3">
                      <div className="flex items-center gap-1.5 mb-1.5">
                        <span className="inline-flex items-center text-[10px] font-semibold uppercase tracking-wide text-amber-700 bg-amber-100 px-2 py-0.5 rounded-full">
                          Featured
                        </span>
                        <span className="text-[11.5px] text-slate-500">Also worth a look in this category</span>
                      </div>
                      <div className="flex items-center gap-2.5">
                        {recommended.logo ? (
                          <img src={recommended.logo} alt="" className="w-8 h-8 rounded-lg object-contain bg-white border border-slate-100 shrink-0" />
                        ) : (
                          <div className="w-8 h-8 rounded-lg bg-white border border-slate-100 shrink-0" />
                        )}
                        <div className="min-w-0 flex-1">
                          <p className="font-semibold text-[#0B1221] text-[13.5px] truncate">{recommended.name}</p>
                          {recommended.rating > 0 && (
                            <p className="flex items-center gap-0.5 text-[11px] text-slate-500">
                              <Star className="w-3 h-3 text-amber-500 fill-amber-500" />
                              {recommended.rating.toFixed(1)} ({recommended.review_count})
                            </p>
                          )}
                        </div>
                        <Link
                          to={`/tools/${recommended.slug}`}
                          onClick={handleTryAlternative}
                          className="inline-flex items-center gap-1 text-[12.5px] font-semibold text-[#4F47E6] hover:text-[#4338CA] shrink-0"
                        >
                          View
                          <ArrowRight className="w-3 h-3" />
                        </Link>
                      </div>
                    </div>
                  )}

                  <a
                    href={outboundOriginal}
                    target="_blank"
                    rel="noopener noreferrer nofollow"
                    onClick={handleContinueAnyway}
                    className="flex items-center justify-center gap-1.5 w-full bg-slate-50 hover:bg-slate-100 text-[#0B1221] px-4 py-2.5 rounded-xl font-semibold transition-colors text-[13px]"
                  >
                    Continue to {toolName} anyway
                    <ArrowRight className="w-3.5 h-3.5" />
                  </a>
                </div>
              }
            />
      </div>
    </div>,
    document.body
  );
}
