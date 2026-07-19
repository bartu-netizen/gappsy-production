import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Sparkles, ArrowRight, Send, Loader2, AlertCircle } from 'lucide-react';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const SESSION_STORAGE_KEY = 'smart_search_session_id';

const EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'CRM with a free trial',
  'Marketing agency in New Jersey',
];

interface Exchange {
  query: string;
  status: 'loading' | 'done' | 'error';
  message?: string;
  buttonLabel?: string;
  path?: string;
  error?: string;
}

function getSessionId(): string {
  try {
    const existing = sessionStorage.getItem(SESSION_STORAGE_KEY);
    if (existing) return existing;
    const fresh = crypto.randomUUID();
    sessionStorage.setItem(SESSION_STORAGE_KEY, fresh);
    return fresh;
  } catch {
    return crypto.randomUUID();
  }
}

// The homepage's single entry point for "what are you looking for" —
// replaces the old state-name-only search bar. Deliberately chat-shaped
// rather than a plain search box: a query never navigates immediately: it
// gets a short reply plus a "Visit X" button, so the visitor sees *why*
// they're being sent somewhere before committing to the click. Every
// destination is a real, DB-validated path (see smart-search-route) — a
// hallucinated slug can only ever fall back to the /tools search page,
// never a 404.
export default function HomeSmartSearch({ id, className = '' }: { id?: string; className?: string }) {
  const navigate = useNavigate();
  const [input, setInput] = useState('');
  const [exchanges, setExchanges] = useState<Exchange[]>([]);
  const threadRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const sessionIdRef = useRef<string>(getSessionId());
  const busy = exchanges.some((e) => e.status === 'loading');

  useEffect(() => {
    if (threadRef.current) threadRef.current.scrollTop = threadRef.current.scrollHeight;
  }, [exchanges]);

  async function runSearch(text: string) {
    const trimmed = text.trim();
    if (!trimmed || busy) return;
    setInput('');
    setExchanges((prev) => [...prev, { query: trimmed, status: 'loading' }]);

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/smart-search-route`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
        body: JSON.stringify({ session_id: sessionIdRef.current, query: trimmed }),
      });
      const data = await res.json().catch(() => null);

      if (res.ok && data?.path) {
        setExchanges((prev) => {
          const copy = [...prev];
          copy[copy.length - 1] = { query: trimmed, status: 'done', message: data.message, buttonLabel: data.buttonLabel, path: data.path };
          return copy;
        });
        return;
      }

      const errorText = res.status === 429 ? data?.error || "You've searched a lot — please wait a bit and try again." : "Something went wrong — please try again.";
      setExchanges((prev) => {
        const copy = [...prev];
        copy[copy.length - 1] = { query: trimmed, status: 'error', error: errorText };
        return copy;
      });
    } catch {
      setExchanges((prev) => {
        const copy = [...prev];
        copy[copy.length - 1] = { query: trimmed, status: 'error', error: 'Something went wrong — please try again.' };
        return copy;
      });
    }
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    runSearch(input);
  }

  function handleExampleClick(example: string) {
    containerRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    runSearch(example);
  }

  return (
    <div ref={containerRef} id={id} className={`relative max-w-2xl mx-auto scroll-mt-28 text-left ${className}`}>
      <div className="rounded-2xl bg-white border border-[#E0E3FC] shadow-[0_12px_32px_rgba(79,71,230,0.12)] overflow-hidden">
        <div className="flex items-center gap-2.5 px-4 sm:px-5 py-3.5 border-b border-slate-100">
          <div className="w-8 h-8 rounded-lg bg-[#0A1735] flex items-center justify-center shrink-0">
            <Sparkles className="w-4 h-4 text-white" aria-hidden="true" />
          </div>
          <div className="min-w-0">
            <p className="font-bold text-[#0B1221] text-sm leading-tight">What are you looking for?</p>
            <p className="text-[11.5px] text-slate-400 leading-tight">Tell us what you need — we'll point you to the right page</p>
          </div>
        </div>

        {exchanges.length === 0 ? (
          <div className="px-4 sm:px-5 py-5">
            <p className="text-[13px] text-slate-500 mb-3">Try asking:</p>
            <div className="flex flex-wrap gap-2">
              {EXAMPLE_QUERIES.map((example) => (
                <button
                  key={example}
                  type="button"
                  onClick={() => handleExampleClick(example)}
                  className="text-left text-[12.5px] font-medium text-[#4F47E6] bg-[#EEF0FE] hover:bg-[#E0E3FC] px-3 py-2 rounded-xl transition-colors"
                >
                  {example}
                </button>
              ))}
            </div>
          </div>
        ) : (
          <div ref={threadRef} className="px-4 sm:px-5 py-4 space-y-4 max-h-[360px] overflow-y-auto">
            {exchanges.map((ex, i) => (
              <div key={i} className="space-y-2.5">
                <div className="flex justify-end">
                  <div className="max-w-[85%] rounded-2xl px-3.5 py-2.5 text-[13.5px] leading-relaxed bg-[#4F47E6] text-white">{ex.query}</div>
                </div>
                <div className="flex justify-start">
                  {ex.status === 'loading' && (
                    <div className="max-w-[85%] rounded-2xl px-3.5 py-2.5 bg-slate-50">
                      <Loader2 className="w-3.5 h-3.5 animate-spin text-slate-400" />
                    </div>
                  )}
                  {ex.status === 'error' && (
                    <div className="max-w-[85%] flex items-start gap-1.5 rounded-2xl px-3.5 py-2.5 text-[13px] text-rose-600 bg-rose-50">
                      <AlertCircle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
                      {ex.error}
                    </div>
                  )}
                  {ex.status === 'done' && (
                    <div className="max-w-[90%] rounded-2xl px-3.5 py-2.5 bg-slate-50 space-y-2.5">
                      <p className="text-[13.5px] text-[#0B1221] leading-relaxed">{ex.message}</p>
                      {ex.path && (
                        <button
                          type="button"
                          onClick={() => navigate(ex.path!)}
                          className="inline-flex items-center gap-1.5 bg-[#4F47E6] hover:bg-[#4338CA] active:scale-[0.98] text-white px-4 py-2 rounded-xl font-semibold transition-all text-[12.5px]"
                        >
                          {ex.buttonLabel || 'View'}
                          <ArrowRight className="w-3.5 h-3.5" />
                        </button>
                      )}
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}

        <form onSubmit={handleSubmit} className="flex items-center gap-2 px-4 sm:px-5 py-3.5 border-t border-slate-100">
          <input
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            placeholder="A tool, a need, or 'agency in New Jersey'…"
            disabled={busy}
            className="flex-1 h-11 min-w-0 rounded-full border border-slate-200 px-4 text-[13.5px] sm:text-sm placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow disabled:opacity-60"
          />
          <button
            type="submit"
            disabled={busy || !input.trim()}
            aria-label="Search"
            className="w-11 h-11 shrink-0 rounded-full bg-[#4F47E6] hover:bg-[#4338CA] text-white flex items-center justify-center transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
          >
            {busy ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
          </button>
        </form>
      </div>
    </div>
  );
}
