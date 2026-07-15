import { useState } from 'react';
import { Sparkles, X } from 'lucide-react';
import AskGappsyChat from './AskGappsyChat';

// Tool-agnostic floating entry point (Intercom-style) for pages that
// aren't scoped to one specific tool — the directory-wide chat can
// recommend across the whole catalog. Shares the exact same chat engine
// as the tool-page inline card, just wrapped in a floating trigger + panel
// shell instead of being permanently expanded inline.
export default function AskGappsyBubble() {
  const [open, setOpen] = useState(false);

  return (
    <>
      {open && (
        <div className="fixed bottom-24 right-4 sm:right-6 z-50 w-[calc(100vw-2rem)] sm:w-[380px] h-[70vh] max-h-[560px] bg-white rounded-2xl shadow-[0_24px_48px_rgba(0,0,0,0.2)] border border-slate-100 overflow-hidden flex flex-col">
          <AskGappsyChat
            suggestedQuestions={[
              'What tool should I use for social media graphics?',
              'Is there a free option for project management?',
              'Recommend a tool for team collaboration',
            ]}
            placeholder="Ask about any tool on Gappsy..."
            threadMaxHeightClass="flex-1"
          />
        </div>
      )}

      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        aria-expanded={open}
        aria-label={open ? 'Close Ask Gappsy chat' : 'Open Ask Gappsy chat'}
        className="fixed bottom-4 right-4 sm:right-6 z-50 inline-flex items-center gap-2 bg-[#0A1735] hover:bg-[#132952] text-white pl-4 pr-5 h-12 rounded-full shadow-[0_8px_24px_rgba(0,0,0,0.25)] transition-colors"
      >
        {open ? <X className="w-4 h-4" /> : <Sparkles className="w-4 h-4" />}
        <span className="text-sm font-semibold">{open ? 'Close' : 'Ask Gappsy'}</span>
      </button>
    </>
  );
}
