import { useEffect, useRef, useState } from 'react';
import { Search, X, ChevronDown } from 'lucide-react';
import { supabase } from '../../lib/supabase';

export interface ToolOption {
  slug: string;
  name: string;
  logo: string | null;
}

const DEBOUNCE_MS = 200;

// A searchable, tool-only combobox for picking one side of a comparison.
// Deliberately queries `tools` directly (not the multi-entity
// search_software RPC GlobalSearch uses) so results are never mixed with
// categories/tags — this selector only ever needs to resolve to a real,
// published tool.
export default function ToolSelectCombobox({
  label,
  value,
  onChange,
  excludeSlug,
}: {
  label: string;
  value: ToolOption | null;
  onChange: (tool: ToolOption | null) => void;
  excludeSlug?: string | null;
}) {
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<ToolOption[]>([]);
  const [loading, setLoading] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  useEffect(() => {
    if (!open) return;
    setLoading(true);
    const timer = setTimeout(() => {
      let request = supabase
        .from('tools')
        .select('slug, name, logo')
        .eq('status', 'published')
        .order('featured', { ascending: false })
        .order('rating', { ascending: false })
        .limit(8);
      if (query.trim()) request = request.ilike('name', `%${query.trim()}%`);
      request.then(({ data }) => {
        setResults(((data || []) as ToolOption[]).filter((t) => t.slug !== excludeSlug));
        setLoading(false);
      });
    }, DEBOUNCE_MS);
    return () => clearTimeout(timer);
  }, [query, open, excludeSlug]);

  function selectTool(tool: ToolOption) {
    onChange(tool);
    setOpen(false);
    setQuery('');
  }

  return (
    <div ref={containerRef} className="relative flex-1 min-w-0">
      <label className="block text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5">{label}</label>
      <button
        type="button"
        onClick={() => {
          setOpen((v) => !v);
          requestAnimationFrame(() => inputRef.current?.focus());
        }}
        className="w-full flex items-center gap-2.5 h-14 px-4 rounded-2xl border border-slate-200 bg-white text-left hover:border-slate-300 transition-colors"
      >
        {value ? (
          <>
            {value.logo ? (
              <img src={value.logo} alt="" className="w-7 h-7 rounded-lg object-contain border border-slate-100 shrink-0" />
            ) : (
              <div className="w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">
                {value.name.charAt(0)}
              </div>
            )}
            <span className="font-semibold text-[#0B1221] text-sm truncate flex-1">{value.name}</span>
            <span
              role="button"
              tabIndex={0}
              onClick={(e) => {
                e.stopPropagation();
                onChange(null);
              }}
              aria-label={`Clear ${label}`}
              className="text-slate-400 hover:text-slate-600 shrink-0"
            >
              <X className="w-4 h-4" />
            </span>
          </>
        ) : (
          <>
            <Search className="w-4 h-4 text-slate-400 shrink-0" />
            <span className="text-sm text-slate-400 flex-1">Choose a tool…</span>
            <ChevronDown className="w-4 h-4 text-slate-400 shrink-0" />
          </>
        )}
      </button>

      {open && (
        <div className="absolute z-20 top-full left-0 right-0 mt-2 bg-white border border-slate-200 rounded-2xl shadow-[0_16px_40px_rgba(15,23,42,0.14)] overflow-hidden">
          <div className="flex items-center gap-2 px-3.5 h-11 border-b border-slate-100">
            <Search className="w-3.5 h-3.5 text-slate-400 shrink-0" />
            <input
              ref={inputRef}
              type="text"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Search tools…"
              className="flex-1 min-w-0 bg-transparent outline-none text-sm text-[#0B1221] placeholder-slate-400"
              autoComplete="off"
            />
          </div>
          <div className="max-h-72 overflow-y-auto py-1.5">
            {loading && <p className="px-3.5 py-3 text-xs text-slate-400">Searching…</p>}
            {!loading && results.length === 0 && <p className="px-3.5 py-3 text-xs text-slate-400">No tools found.</p>}
            {!loading &&
              results.map((tool) => (
                <button
                  key={tool.slug}
                  type="button"
                  onClick={() => selectTool(tool)}
                  className="w-full flex items-center gap-2.5 px-3.5 py-2 text-left hover:bg-slate-50 transition-colors"
                >
                  {tool.logo ? (
                    <img src={tool.logo} alt="" className="w-7 h-7 rounded-lg object-contain border border-slate-100 shrink-0" />
                  ) : (
                    <div className="w-7 h-7 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-xs shrink-0">
                      {tool.name.charAt(0)}
                    </div>
                  )}
                  <span className="text-sm font-medium text-[#0B1221] truncate">{tool.name}</span>
                </button>
              ))}
          </div>
        </div>
      )}
    </div>
  );
}
