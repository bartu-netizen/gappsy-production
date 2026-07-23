import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { X, Star, ArrowRight } from 'lucide-react';
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
// claimed listings keep the plain direct link. Opens a premium widget in
// the same visual language as the Ask Gappsy chat, asks one quick
// multiple-choice question, and always keeps a direct path to the tool the
// visitor actually came to see. If a genuinely relevant Featured (paying)
// alternative exists in the same category — via a real tag-overlap
// relevance gate server-side, not just "same category" — it's shown
// alongside, clearly labeled "Featured", never in place of the original.
export default function ToolFitCheckWidget({ toolSlug, toolName, websiteUrl, onClose }: ToolFitCheckWidgetProps) {
  const [recommended, setRecommended] = useState<FitCheckAlternative | null>(null);
  const [loadingRecommendation, setLoadingRecommendation] = useState(true);

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

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-slate-900/50 backdrop-blur-sm p-4"
      onClick={(e) => {
        if (e.target === e.currentTarget) onClose();
      }}
    >
      <div className="w-full max-w-[440px] max-h-[85vh] bg-white rounded-3xl shadow-[0_24px_64px_rgba(15,23,42,0.28)] flex flex-col overflow-hidden">
        <div className="relative flex flex-col min-h-[420px]">
          <button
            type="button"
            onClick={onClose}
            aria-label="Close"
            className="absolute right-3 top-3 z-10 w-8 h-8 rounded-full bg-white/90 hover:bg-slate-100 flex items-center justify-center text-slate-400 hover:text-slate-600 transition-colors shadow-sm"
          >
            <X className="w-4 h-4" />
          </button>
          <div className="flex-1 flex flex-col min-h-0">
            <AskGappsyChat
              toolSlug={toolSlug}
              page="tool_fit_check"
              title={`Is ${toolName} right for you?`}
              subtitle="Quick fit check — grounded in real listing data"
              suggestedQuestions={QUICK_QUESTIONS}
              placeholder={`Ask anything else about fitting ${toolName}...`}
              threadMaxHeightClass="max-h-[300px]"
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
        </div>
      </div>
    </div>
  );
}
