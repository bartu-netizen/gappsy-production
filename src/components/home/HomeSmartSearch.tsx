import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Sparkles, ArrowRight, Loader2 } from 'lucide-react';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const SESSION_STORAGE_KEY = 'smart_search_session_id';

const EXAMPLE_QUERIES = [
  'A free tool to design social posts',
  'CRM with a free trial',
  'Marketing agency in New Jersey',
];

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
// replaces the old state-name-only search bar. One free-text query goes to
// the smart-search-route edge function, which decides whether this is a
// specific tool, a category of software, a tool-vs-tool comparison, or an
// agency/state search, and returns a real, DB-validated path to land on
// (never a slug the model just made up — see the edge function for the
// grounding/validation strategy). Falls back to the existing /tools?q=
// search-results page on any error, so this can never dead-end.
export default function HomeSmartSearch({ id, className = '' }: { id?: string; className?: string }) {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function runSearch(text: string) {
    const trimmed = text.trim();
    if (!trimmed || loading) return;
    setLoading(true);
    setError(null);

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/smart-search-route`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
        body: JSON.stringify({ session_id: getSessionId(), query: trimmed }),
      });
      const data = await res.json().catch(() => null);
      if (res.ok && data?.path) {
        navigate(data.path);
        return;
      }
      if (res.status === 429) {
        setError(data?.error || "You've searched a lot — please wait a bit and try again.");
        setLoading(false);
        return;
      }
      // Any other failure: never dead-end, just fall through to the plain
      // tools search so the field always does *something* useful.
      navigate(`/tools?q=${encodeURIComponent(trimmed)}`);
    } catch {
      navigate(`/tools?q=${encodeURIComponent(trimmed)}`);
    }
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    runSearch(query);
  }

  return (
    <div id={id} className={`relative max-w-2xl mx-auto scroll-mt-28 ${className}`}>
      <form
        onSubmit={handleSubmit}
        className="flex items-center w-full h-14 rounded-2xl bg-white text-gray-900 border border-[#E0E3FC] shadow-[0_8px_24px_rgba(79,71,230,0.10)] focus-within:ring-2 focus-within:ring-[#4F47E6] focus-within:border-[#4F47E6] transition-all"
      >
        <div className="ml-4 sm:ml-5 w-6 h-6 rounded-lg bg-[#EEF0FE] flex items-center justify-center shrink-0" aria-hidden="true">
          <Sparkles className="w-3.5 h-3.5 text-[#4F47E6]" />
        </div>
        <input
          type="text"
          placeholder="What are you looking for? Try a tool, a need, or 'agency in New Jersey'…"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          disabled={loading}
          className="flex-1 h-full min-w-0 bg-transparent outline-none px-3 text-[13.5px] sm:text-base text-gray-900 placeholder-gray-400 disabled:opacity-60"
        />
        <button
          type="submit"
          disabled={loading || !query.trim()}
          aria-label="Search"
          className="mr-2 w-10 h-10 shrink-0 rounded-xl bg-[#4F47E6] hover:bg-[#4338CA] text-white flex items-center justify-center transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
        >
          {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <ArrowRight className="w-4 h-4" />}
        </button>
      </form>

      <div className="flex flex-wrap items-center justify-center gap-1.5 sm:gap-2 mt-3">
        {EXAMPLE_QUERIES.map((example) => (
          <button
            key={example}
            type="button"
            disabled={loading}
            onClick={() => {
              setQuery(example);
              runSearch(example);
            }}
            className="text-left text-[11px] sm:text-[12.5px] font-medium text-[#4F47E6] bg-[#EEF0FE] hover:bg-[#E0E3FC] px-2.5 sm:px-3 py-1.5 rounded-full transition-colors disabled:opacity-50"
          >
            {example}
          </button>
        ))}
      </div>

      {error && <p className="text-xs text-red-600 mt-2 text-center">{error}</p>}
    </div>
  );
}
