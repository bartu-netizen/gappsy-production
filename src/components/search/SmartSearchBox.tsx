import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Sparkles, ArrowRight, Send, Loader2, AlertCircle } from 'lucide-react';
import { getVisitorId } from '../../utils/funnelTracking';

const SESSION_STORAGE_KEY = 'smart_search_session_id';

const DEFAULT_EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'CRM with a free trial',
  'Marketing agency in New Jersey',
  'Canva',
];

interface Exchange {
  query: string;
  status: 'loading' | 'done' | 'error';
  message?: string;
  buttonLabel?: string;
  path?: string;
  // Only present on a "fallback" (no confident match) result when the query
  // reads as a specific product name — a soft, secondary nudge (never a
  // headline) toward listing that product, kept separate from `message`/
  // `path` so it always renders smaller and below the main reply.
  secondaryMessage?: string;
  secondaryButtonLabel?: string;
  secondaryPath?: string;
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

interface SmartSearchBoxProps {
  id?: string;
  className?: string;
  /** 'category' biases smart-search-route toward always resolving to a
   * category (even a specific-tool query resolves to that tool's own
   * category) instead of the general tool/compare/category/state mix —
   * used on /tool-categories, where routing straight to a tool page would
   * skip past the category-browsing context entirely. 'category-tools'
   * scopes matching to the tools inside ONE category (requires
   * categorySlug) — used on /tool-categories/:slug to help pick the right
   * tool within that category specifically. */
  mode?: 'general' | 'category' | 'category-tools';
  /** Required when mode="category-tools" — which category's tool list to
   * search within. */
  categorySlug?: string;
  title?: string;
  subtitle?: string;
  placeholder?: string;
  exampleQueries?: string[];
}

// Shared chat-style "what are you looking for" entry point — originally
// built for the homepage, reused as-is on /tool-categories (mode="category")
// since the UX (query → short reply → "Visit X" button, never an instant
// navigation) is identical, only the routing bias differs. A query never
// navigates immediately: the visitor sees *why* they're being sent
// somewhere before committing to the click. Every destination is a real,
// DB-validated path (see smart-search-route) — a hallucinated slug can
// only ever fall back to the /tools search page, never a 404.
export default function SmartSearchBox({
  id,
  className = '',
  mode = 'general',
  categorySlug,
  title = 'What are you looking for?',
  subtitle = "Tell us what you need — we'll point you to the right page",
  placeholder = "A tool, a need, or 'agency in New Jersey'…",
  exampleQueries = DEFAULT_EXAMPLE_QUERIES,
}: SmartSearchBoxProps) {
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
      // Routed through a Netlify Edge Function relay (not straight to
      // Supabase) so the query gets tagged with real city/country from
      // Netlify's free context.geo — see smart-search-relay.js.
      const res = await fetch('/api/smart-search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ session_id: sessionIdRef.current, query: trimmed, mode, visitor_id: getVisitorId(), ...(categorySlug ? { category_slug: categorySlug } : {}) }),
      });
      const data = await res.json().catch(() => null);

      if (res.ok && data?.path) {
        setExchanges((prev) => {
          const copy = [...prev];
          copy[copy.length - 1] = {
            query: trimmed,
            status: 'done',
            message: data.message,
            buttonLabel: data.buttonLabel,
            path: data.path,
            secondaryMessage: data.secondaryMessage,
            secondaryButtonLabel: data.secondaryButtonLabel,
            secondaryPath: data.secondaryPath,
          };
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
      <div className="rounded-2xl bg-white border border-slate-200 shadow-[0_12px_32px_rgba(10,23,53,0.12)] overflow-hidden">
        <div className="flex items-center gap-2.5 px-4 sm:px-5 py-3.5 border-b border-slate-100">
          <div className="w-8 h-8 rounded-lg bg-[#0A1735] flex items-center justify-center shrink-0">
            <Sparkles className="w-4 h-4 text-white" aria-hidden="true" />
          </div>
          <div className="min-w-0">
            <p className="font-bold text-[#0B1221] text-sm leading-tight">{title}</p>
            <p className="text-[11.5px] text-slate-400 leading-tight">{subtitle}</p>
          </div>
        </div>

        {exchanges.length === 0 ? (
          <div className="px-4 sm:px-5 py-5">
            <p className="text-[13px] text-slate-500 mb-3">Try asking:</p>
            <div className="flex flex-wrap gap-2">
              {exampleQueries.map((example) => (
                <button
                  key={example}
                  type="button"
                  onClick={() => handleExampleClick(example)}
                  className="text-left text-[12.5px] font-medium text-[#0A1735] bg-slate-100 hover:bg-slate-200 px-3 py-2 rounded-xl transition-colors"
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
                  <div className="max-w-[85%] rounded-2xl px-3.5 py-2.5 text-[13.5px] leading-relaxed bg-[#0A1735] text-white">{ex.query}</div>
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
                          className="inline-flex items-center gap-1.5 bg-[#0A1735] hover:bg-[#1B2E5C] active:scale-[0.98] text-white px-4 py-2 rounded-xl font-semibold transition-all text-[12.5px]"
                        >
                          {ex.buttonLabel || 'View'}
                          <ArrowRight className="w-3.5 h-3.5" />
                        </button>
                      )}
                      {ex.secondaryMessage && (
                        <p className="text-[11.5px] text-slate-400 leading-relaxed pt-2 border-t border-slate-200/70">
                          {ex.secondaryMessage}{' '}
                          {ex.secondaryPath && (
                            <button
                              type="button"
                              onClick={() => navigate(ex.secondaryPath!)}
                              className="font-medium text-[#4F47E6] hover:text-[#4338CA] underline underline-offset-2"
                            >
                              {ex.secondaryButtonLabel || 'Learn more'}
                            </button>
                          )}
                        </p>
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
            placeholder={placeholder}
            disabled={busy}
            className="flex-1 h-11 min-w-0 rounded-full border border-slate-200 px-4 text-[13.5px] sm:text-sm placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#0A1735]/15 focus:border-[#0A1735]/40 transition-shadow disabled:opacity-60"
          />
          <button
            type="submit"
            disabled={busy || !input.trim()}
            aria-label="Search"
            className="w-11 h-11 shrink-0 rounded-full bg-[#0A1735] hover:bg-[#1B2E5C] text-white flex items-center justify-center transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
          >
            {busy ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
          </button>
        </form>
      </div>
    </div>
  );
}
