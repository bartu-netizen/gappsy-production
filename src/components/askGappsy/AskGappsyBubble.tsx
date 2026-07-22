import { useEffect, useState } from 'react';
import { Sparkles, X, ArrowRight } from 'lucide-react';
import AskGappsyChat from './AskGappsyChat';

interface AskGappsyBubbleProps {
  /** Non-tool page context passed through to AskGappsyChat (e.g.
   * 'feature_my_product', 'growth_upsell') — omit for the directory-wide
   * default. */
  page?: string;
  suggestedQuestions?: string[];
  placeholder?: string;
  chatTitle?: string;
  chatSubtitle?: string;
  triggerLabel?: string;
  /** A proactive speech-bubble callout that appears after a short delay to
   * invite engagement (Intercom-style) instead of waiting for the visitor
   * to notice a silent icon — shown once per mount, dismissible, and
   * clicking it opens the chat directly. Omit for the quiet default. */
  nudgeText?: string;
}

const DEFAULT_QUESTIONS = [
  'What tool should I use for social media graphics?',
  'Is there a free option for project management?',
  'Recommend a tool for team collaboration',
];

// Tool-agnostic floating entry point (Intercom-style) for pages that
// aren't scoped to one specific tool — the directory-wide chat can
// recommend across the whole catalog. Shares the exact same chat engine
// as the tool-page inline card, just wrapped in a floating trigger + panel
// shell instead of being permanently expanded inline.
export default function AskGappsyBubble({
  page, suggestedQuestions, placeholder, chatTitle, chatSubtitle, triggerLabel, nudgeText,
}: AskGappsyBubbleProps) {
  const [open, setOpen] = useState(false);
  const [showNudge, setShowNudge] = useState(false);

  useEffect(() => {
    if (!nudgeText) return;
    const timer = window.setTimeout(() => setShowNudge(true), 3500);
    return () => window.clearTimeout(timer);
  }, [nudgeText]);

  return (
    <>
      {open && (
        <div className="fixed bottom-24 right-4 sm:right-6 z-50 w-[calc(100vw-2rem)] sm:w-[380px] h-[70vh] max-h-[560px] bg-white rounded-2xl shadow-[0_24px_48px_rgba(0,0,0,0.2)] border border-slate-100 overflow-hidden flex flex-col">
          <AskGappsyChat
            page={page}
            title={chatTitle}
            subtitle={chatSubtitle}
            suggestedQuestions={suggestedQuestions || DEFAULT_QUESTIONS}
            placeholder={placeholder || 'Ask about any tool on Gappsy...'}
            threadMaxHeightClass="flex-1"
          />
        </div>
      )}

      {!open && showNudge && nudgeText && (
        <div className="fixed bottom-[4.75rem] right-4 sm:right-6 z-50 w-[calc(100vw-2rem)] sm:w-72 animate-nudge-in">
          <div className="relative bg-white rounded-2xl shadow-[0_20px_44px_rgba(15,23,42,0.18)] border border-slate-100 p-4 pr-8">
            <button
              type="button"
              onClick={() => setShowNudge(false)}
              aria-label="Dismiss"
              className="absolute top-2 right-2 w-6 h-6 rounded-full flex items-center justify-center text-slate-400 hover:text-slate-600 hover:bg-slate-100 transition-colors"
            >
              <X className="w-3.5 h-3.5" />
            </button>
            <button type="button" onClick={() => { setOpen(true); setShowNudge(false); }} className="text-left w-full flex items-start gap-2.5">
              <div className="w-7 h-7 rounded-full bg-gradient-to-br from-[#4F47E6] to-[#6C63F5] flex items-center justify-center shrink-0 mt-0.5">
                <Sparkles className="w-3.5 h-3.5 text-white" aria-hidden="true" />
              </div>
              <div className="min-w-0">
                <p className="text-[13.5px] font-semibold text-[#0B1221] leading-snug">{nudgeText}</p>
                <p className="mt-1.5 text-[12.5px] font-semibold text-[#4F47E6] inline-flex items-center gap-1">
                  Ask a question <ArrowRight className="w-3 h-3" aria-hidden="true" />
                </p>
              </div>
            </button>
            {/* Speech-bubble tail, pointing down at the trigger button below */}
            <div className="absolute -bottom-[7px] right-8 w-3.5 h-3.5 bg-white border-r border-b border-slate-100 rotate-45" aria-hidden="true" />
          </div>
        </div>
      )}

      <button
        type="button"
        onClick={() => { setOpen((v) => !v); setShowNudge(false); }}
        aria-expanded={open}
        aria-label={open ? 'Close Ask Gappsy chat' : 'Open Ask Gappsy chat'}
        className="group fixed bottom-4 right-4 sm:right-6 z-50 inline-flex items-center gap-2 bg-gradient-to-br from-[#0A1735] to-[#16244A] hover:from-[#132952] hover:to-[#1d2f5c] text-white pl-4 pr-5 h-12 rounded-full shadow-[0_8px_28px_rgba(10,23,53,0.4)] ring-1 ring-white/10 transition-all"
      >
        {open ? (
          <X className="w-4 h-4" />
        ) : (
          <span className="relative flex items-center justify-center w-4 h-4">
            <span className="absolute inset-0 rounded-full bg-[#8B90F5] animate-pulse-slow blur-[3px]" aria-hidden="true" />
            <Sparkles className="relative w-4 h-4 text-white" />
          </span>
        )}
        <span className="text-sm font-semibold">{open ? 'Close' : (triggerLabel || 'Ask Gappsy')}</span>
      </button>
    </>
  );
}
