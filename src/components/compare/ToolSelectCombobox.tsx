import { useEffect, useId, useRef, useState } from 'react';
import { Search, X, ChevronDown, Loader2 } from 'lucide-react';
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
// published tool. Server-side filtered + limited to 8 results per keystroke,
// so it scales to any tool-table size without ever loading the full list
// into the browser. Implements the WAI-ARIA combobox pattern (listbox
// popup, roving aria-activedescendant, Up/Down/Enter/Escape) for keyboard
// and screen-reader parity with the mouse.
export default function ToolSelectCombobox({
  label,
  value,
  onChange,
  excludeSlug,
  compact = false,
  disabled = false,
}: {
  label: string;
  value: ToolOption | null;
  onChange: (tool: ToolOption | null) => void;
  // A single slug, or several (e.g. excluding both "itself" and "the other
  // side of the comparison" at once when used as a swap-tool control).
  excludeSlug?: string | null | (string | null | undefined)[];
  compact?: boolean;
  disabled?: boolean;
}) {
  const excludedSlugs = new Set((Array.isArray(excludeSlug) ? excludeSlug : [excludeSlug]).filter(Boolean) as string[]);
  const [open, setOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [results, setResults] = useState<ToolOption[]>([]);
  const [loading, setLoading] = useState(false);
  const [activeIndex, setActiveIndex] = useState(0);
  const containerRef = useRef<HTMLDivElement>(null);
  const triggerRef = useRef<HTMLButtonElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const listboxId = useId();
  const inputId = useId();

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (containerRef.current && !containerRef.current.contains(e.target as Node)) {
        setOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  // Stable primitive key for the effect below — excludeSlug may be a fresh
  // array literal every render (e.g. the swap-tool control in CompareHero),
  // which would otherwise refetch on every parent re-render while open.
  const excludeKey = [...excludedSlugs].sort().join(',');

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
        setResults(((data || []) as ToolOption[]).filter((t) => !excludedSlugs.has(t.slug)));
        setActiveIndex(0);
        setLoading(false);
      });
    }, DEBOUNCE_MS);
    return () => clearTimeout(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query, open, excludeKey]);

  function openMenu() {
    if (disabled) return;
    setOpen(true);
    requestAnimationFrame(() => inputRef.current?.focus());
  }

  function closeMenu({ refocusTrigger = false } = {}) {
    setOpen(false);
    setQuery('');
    if (refocusTrigger) triggerRef.current?.focus();
  }

  function selectTool(tool: ToolOption) {
    onChange(tool);
    closeMenu();
  }

  function handleInputKeyDown(e: React.KeyboardEvent) {
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActiveIndex((i) => Math.min(i + 1, results.length - 1));
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActiveIndex((i) => Math.max(i - 1, 0));
    } else if (e.key === 'Enter') {
      e.preventDefault();
      const tool = results[activeIndex];
      if (tool) selectTool(tool);
    } else if (e.key === 'Escape') {
      e.preventDefault();
      closeMenu({ refocusTrigger: true });
    } else if (e.key === 'Tab') {
      closeMenu();
    }
  }

  const heightClass = compact ? 'h-11' : 'h-14';
  const activeOptionId = results[activeIndex] ? `${listboxId}-option-${results[activeIndex].slug}` : undefined;

  return (
    <div ref={containerRef} className="relative flex-1 min-w-0">
      {!compact && (
        <label htmlFor={inputId} className="block text-xs font-semibold uppercase tracking-wide text-slate-400 mb-1.5">
          {label}
        </label>
      )}
      <button
        ref={triggerRef}
        type="button"
        disabled={disabled}
        onClick={() => (open ? closeMenu() : openMenu())}
        aria-haspopup="listbox"
        aria-expanded={open}
        aria-label={compact ? label : undefined}
        className={`w-full flex items-center gap-2.5 ${heightClass} px-4 rounded-2xl border border-slate-200 bg-white text-left transition-colors ${
          disabled ? 'opacity-50 cursor-not-allowed' : 'hover:border-slate-300'
        } ${open ? 'border-[#5A6B94] ring-2 ring-[#DEE3EF]' : ''}`}
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
            {!disabled && (
              <span
                role="button"
                tabIndex={0}
                onClick={(e) => {
                  e.stopPropagation();
                  onChange(null);
                }}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    e.stopPropagation();
                    onChange(null);
                  }
                }}
                aria-label={`Clear ${label}`}
                className="text-slate-400 hover:text-slate-600 shrink-0 rounded focus:outline-none focus:ring-2 focus:ring-[#8A9AC4]"
              >
                <X className="w-4 h-4" />
              </span>
            )}
          </>
        ) : (
          <>
            <Search className="w-4 h-4 text-slate-400 shrink-0" />
            <span className="text-sm text-slate-400 flex-1">Choose a tool…</span>
            <ChevronDown className={`w-4 h-4 text-slate-400 shrink-0 transition-transform ${open ? 'rotate-180' : ''}`} />
          </>
        )}
      </button>

      {open && (
        <div className="absolute z-20 top-full left-0 right-0 mt-2 bg-white border border-slate-200 rounded-2xl shadow-[0_16px_40px_rgba(15,23,42,0.14)] overflow-hidden">
          <div className="flex items-center gap-2 px-3.5 h-11 border-b border-slate-100">
            <Search className="w-3.5 h-3.5 text-slate-400 shrink-0" />
            <input
              ref={inputRef}
              id={inputId}
              type="text"
              role="combobox"
              aria-expanded={open}
              aria-controls={listboxId}
              aria-activedescendant={activeOptionId}
              aria-autocomplete="list"
              aria-label={label}
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              onKeyDown={handleInputKeyDown}
              placeholder="Search tools…"
              className="flex-1 min-w-0 bg-transparent outline-none text-sm text-[#0B1221] placeholder-slate-400"
              autoComplete="off"
            />
            {loading && <Loader2 className="w-3.5 h-3.5 text-[#5A6B94] animate-spin shrink-0" aria-hidden="true" />}
          </div>
          <ul id={listboxId} role="listbox" aria-label={`${label} results`} className="max-h-72 overflow-y-auto py-1.5">
            {loading && results.length === 0 && <li className="px-3.5 py-3 text-xs text-slate-400">Searching…</li>}
            {!loading && results.length === 0 && <li className="px-3.5 py-3 text-xs text-slate-400">No tools found.</li>}
            {results.map((tool, index) => (
              <li key={tool.slug} role="presentation">
                <button
                  id={`${listboxId}-option-${tool.slug}`}
                  role="option"
                  aria-selected={index === activeIndex}
                  type="button"
                  onMouseEnter={() => setActiveIndex(index)}
                  onClick={() => selectTool(tool)}
                  className={`w-full flex items-center gap-2.5 px-3.5 py-2 text-left transition-colors ${
                    index === activeIndex ? 'bg-[#EEF1F7]' : 'hover:bg-slate-50'
                  }`}
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
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
