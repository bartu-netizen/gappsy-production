import { useEffect, useMemo, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
import { useNavigate } from 'react-router-dom';
import { Search, X, Loader2, Clock, ShieldCheck, Star, FolderTree, Tag as TagIcon, ArrowRight, CornerDownLeft } from 'lucide-react';
import { supabase } from '../../lib/supabase';
import { useRecentSoftwareSearches } from '../../hooks/useRecentSoftwareSearches';
import { trackSearchOpened, trackSearchQuery, trackSearchResultClicked, trackSearchNoResults } from '../../utils/searchAnalytics';

interface SearchResultRow {
  result_type: 'tool' | 'category' | 'tag';
  slug: string;
  name: string;
  subtitle: string | null;
  logo: string | null;
  primary_category_name: string | null;
  pricing_model: string | null;
  starting_price: string | null;
  rating: number | null;
  review_count: number | null;
  verified: boolean | null;
  featured: boolean | null;
  match_type: string;
  score: number;
}

interface FlatItem {
  key: string;
  kind: 'tool' | 'category' | 'tag' | 'view-all' | 'recent';
  href?: string;
  row?: SearchResultRow;
  recentTerm?: string;
}

const DEBOUNCE_MS = 220;

function destinationFor(row: SearchResultRow): string {
  if (row.result_type === 'tool') return `/tools/${row.slug}`;
  if (row.result_type === 'category') return `/tool-categories/${row.slug}`;
  return `/tool-tags/${row.slug}`;
}

export default function GlobalSearch({ open, onClose }: { open: boolean; onClose: () => void }) {
  const navigate = useNavigate();
  const inputRef = useRef<HTMLInputElement>(null);
  const requestIdRef = useRef(0);
  const { recentSearches, recordSearch, clearSearches } = useRecentSoftwareSearches();

  const [query, setQuery] = useState('');
  const [results, setResults] = useState<SearchResultRow[]>([]);
  const [loading, setLoading] = useState(false);
  const [hasSearched, setHasSearched] = useState(false);
  const [activeIndex, setActiveIndex] = useState(0);

  useEffect(() => {
    if (!open) return;
    trackSearchOpened();
    setQuery('');
    setResults([]);
    setHasSearched(false);
    setActiveIndex(0);
    const frame = requestAnimationFrame(() => inputRef.current?.focus());
    const prevOverflow = document.documentElement.style.overflow;
    document.documentElement.style.overflow = 'hidden';
    return () => {
      cancelAnimationFrame(frame);
      document.documentElement.style.overflow = prevOverflow;
    };
  }, [open]);

  useEffect(() => {
    if (!open) return;
    const trimmed = query.trim();
    if (trimmed.length < 2) {
      setResults([]);
      setLoading(false);
      setHasSearched(false);
      return;
    }

    setLoading(true);
    const requestId = ++requestIdRef.current;
    const timer = setTimeout(() => {
      supabase
        .rpc('search_software', { query_text: trimmed, max_results: 6 })
        .then(({ data, error }) => {
          if (requestId !== requestIdRef.current) return;
          setLoading(false);
          setHasSearched(true);
          if (error) {
            console.error('[GlobalSearch] search_software error:', error.message);
            setResults([]);
            return;
          }
          const rows = (data as SearchResultRow[]) || [];
          setResults(rows);
          setActiveIndex(0);
          trackSearchQuery(trimmed, rows.length);
          if (rows.length === 0) trackSearchNoResults(trimmed);
          recordSearch(trimmed);
        });
    }, DEBOUNCE_MS);

    return () => clearTimeout(timer);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [query, open]);

  const grouped = useMemo(() => {
    return {
      tools: results.filter((r) => r.result_type === 'tool'),
      categories: results.filter((r) => r.result_type === 'category'),
      tags: results.filter((r) => r.result_type === 'tag'),
    };
  }, [results]);

  const flatItems = useMemo<FlatItem[]>(() => {
    const trimmed = query.trim();
    if (trimmed.length < 2) {
      return recentSearches.map((term) => ({ key: `recent-${term}`, kind: 'recent', recentTerm: term }));
    }
    const items: FlatItem[] = [
      ...grouped.tools.map((row) => ({ key: `tool-${row.slug}`, kind: 'tool' as const, row, href: destinationFor(row) })),
      ...grouped.categories.map((row) => ({ key: `category-${row.slug}`, kind: 'category' as const, row, href: destinationFor(row) })),
      ...grouped.tags.map((row) => ({ key: `tag-${row.slug}`, kind: 'tag' as const, row, href: destinationFor(row) })),
    ];
    if (hasSearched && !loading) {
      items.push({ key: 'view-all', kind: 'view-all', href: `/tools?q=${encodeURIComponent(trimmed)}` });
    }
    return items;
  }, [query, recentSearches, grouped, hasSearched, loading]);

  function openItem(item: FlatItem, index: number) {
    if (item.kind === 'recent' && item.recentTerm) {
      setQuery(item.recentTerm);
      return;
    }
    if (item.kind === 'view-all' && item.href) {
      onClose();
      navigate(item.href);
      return;
    }
    if (item.row && item.href) {
      trackSearchResultClicked(item.row.result_type, item.row.slug, index);
      onClose();
      navigate(item.href);
    }
  }

  function handleKeyDown(e: React.KeyboardEvent) {
    if (e.key === 'Escape') {
      e.preventDefault();
      onClose();
      return;
    }
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActiveIndex((i) => Math.min(i + 1, flatItems.length - 1));
      return;
    }
    if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActiveIndex((i) => Math.max(i - 1, 0));
      return;
    }
    if (e.key === 'Enter') {
      e.preventDefault();
      const item = flatItems[activeIndex];
      if (item) openItem(item, activeIndex);
    }
  }

  if (!open) return null;

  const trimmedQuery = query.trim();
  const isEmptyQuery = trimmedQuery.length < 2;
  const totalResults = grouped.tools.length + grouped.categories.length + grouped.tags.length;
  const showNoResults = !isEmptyQuery && hasSearched && !loading && totalResults === 0;

  let runningIndex = -1;

  // Portaled to document.body: SoftwareHeader has backdrop-blur (a
  // backdrop-filter), which per spec makes it a containing block for
  // `position: fixed` descendants — without the portal this overlay would
  // be confined to the header's own ~64px box instead of the viewport.
  return createPortal(
    <div className="fixed inset-0 z-[100]" role="dialog" aria-modal="true" aria-label="Search software">
      <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-sm sm:block hidden" onClick={onClose} aria-hidden="true" />

      <div
        className="relative bg-white h-full w-full flex flex-col sm:h-auto sm:max-h-[min(600px,80vh)] sm:w-full sm:max-w-xl sm:mx-auto sm:mt-[10vh] sm:rounded-2xl sm:shadow-[0_24px_60px_rgba(15,23,42,0.25)] sm:border sm:border-slate-100 overflow-hidden"
        onKeyDown={handleKeyDown}
      >
        <div className="flex items-center gap-3 px-4 sm:px-5 h-14 sm:h-16 border-b border-slate-100 shrink-0">
          <Search className="w-4 h-4 text-slate-400 shrink-0" aria-hidden="true" />
          <input
            ref={inputRef}
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search software, categories, tags…"
            className="flex-1 min-w-0 bg-transparent outline-none text-[15px] text-[#0B1221] placeholder-slate-400"
            aria-label="Search software"
            autoComplete="off"
            spellCheck={false}
          />
          {loading && <Loader2 className="w-4 h-4 text-indigo-500 animate-spin shrink-0" aria-hidden="true" />}
          {!loading && query.length > 0 && (
            <button type="button" onClick={() => setQuery('')} aria-label="Clear search" className="text-slate-400 hover:text-slate-600 shrink-0">
              <X className="w-4 h-4" />
            </button>
          )}
          <button
            type="button"
            onClick={onClose}
            className="hidden sm:inline-flex items-center justify-center h-6 px-1.5 rounded-md border border-slate-200 text-[10px] font-medium text-slate-400 shrink-0"
          >
            Esc
          </button>
          <button type="button" onClick={onClose} aria-label="Close search" className="sm:hidden text-slate-400 hover:text-slate-600 shrink-0">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="flex-1 overflow-y-auto py-2">
          {isEmptyQuery && recentSearches.length > 0 && (
            <div className="px-2 pb-2">
              <div className="flex items-center justify-between px-3 py-1.5">
                <p className="text-[11px] font-semibold uppercase tracking-[0.06em] text-slate-400">Recent searches</p>
                <button type="button" onClick={clearSearches} className="text-[11px] font-medium text-slate-400 hover:text-slate-600">
                  Clear
                </button>
              </div>
              {recentSearches.map((term) => {
                runningIndex += 1;
                const isActive = runningIndex === activeIndex;
                return (
                  <button
                    key={term}
                    type="button"
                    onMouseEnter={() => setActiveIndex(runningIndex)}
                    onClick={() => openItem({ key: `recent-${term}`, kind: 'recent', recentTerm: term }, runningIndex)}
                    className={`w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl text-left text-sm transition-colors ${isActive ? 'bg-indigo-50 text-indigo-700' : 'text-slate-600 hover:bg-slate-50'}`}
                  >
                    <Clock className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                    {term}
                  </button>
                );
              })}
            </div>
          )}

          {isEmptyQuery && recentSearches.length === 0 && (
            <div className="px-6 py-14 text-center">
              <div className="w-11 h-11 rounded-2xl bg-indigo-50 flex items-center justify-center mx-auto mb-3">
                <Search className="w-5 h-5 text-indigo-500" />
              </div>
              <p className="text-sm font-medium text-[#0B1221]">Search thousands of software tools</p>
              <p className="text-xs text-slate-400 mt-1">Try a tool name, a category like "AI writing", or a keyword</p>
            </div>
          )}

          {!isEmptyQuery && (
            <>
              {grouped.tools.length > 0 && (
                <ResultGroup label="Software">
                  {grouped.tools.map((row) => {
                    runningIndex += 1;
                    const isActive = runningIndex === activeIndex;
                    const index = runningIndex;
                    return (
                      <button
                        key={row.slug}
                        type="button"
                        onMouseEnter={() => setActiveIndex(index)}
                        onClick={() => openItem({ key: `tool-${row.slug}`, kind: 'tool', row, href: destinationFor(row) }, index)}
                        className={`w-full flex items-start gap-3 px-3 py-2.5 rounded-xl text-left transition-colors ${isActive ? 'bg-indigo-50' : 'hover:bg-slate-50'}`}
                      >
                        {row.logo ? (
                          <img src={row.logo} alt="" className="w-9 h-9 rounded-lg object-contain border border-slate-100 bg-white shrink-0" />
                        ) : (
                          <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 font-semibold text-sm shrink-0">
                            {row.name.charAt(0)}
                          </div>
                        )}
                        <div className="min-w-0 flex-1">
                          <div className="flex items-center gap-1.5">
                            <span className="font-medium text-[#0B1221] text-sm truncate">{row.name}</span>
                            {row.verified && <ShieldCheck className="w-3.5 h-3.5 text-indigo-500 shrink-0" />}
                            {row.rating != null && row.rating > 0 && (
                              <span className="inline-flex items-center gap-0.5 text-[11px] text-amber-600 shrink-0">
                                <Star className="w-3 h-3 fill-amber-500 text-amber-500" />
                                {row.rating.toFixed(1)}
                              </span>
                            )}
                          </div>
                          {row.subtitle && <p className="text-xs text-slate-500 truncate mt-0.5">{row.subtitle}</p>}
                          <div className="flex items-center gap-2 mt-1 text-[11px] text-slate-400">
                            {row.primary_category_name && <span>{row.primary_category_name}</span>}
                            {row.pricing_model && <span>· {row.pricing_model}</span>}
                          </div>
                        </div>
                      </button>
                    );
                  })}
                </ResultGroup>
              )}

              {grouped.categories.length > 0 && (
                <ResultGroup label="Categories">
                  {grouped.categories.map((row) => {
                    runningIndex += 1;
                    const isActive = runningIndex === activeIndex;
                    const index = runningIndex;
                    return (
                      <button
                        key={row.slug}
                        type="button"
                        onMouseEnter={() => setActiveIndex(index)}
                        onClick={() => openItem({ key: `category-${row.slug}`, kind: 'category', row, href: destinationFor(row) }, index)}
                        className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-left transition-colors ${isActive ? 'bg-indigo-50' : 'hover:bg-slate-50'}`}
                      >
                        <div className="w-9 h-9 rounded-lg bg-indigo-50 flex items-center justify-center shrink-0">
                          <FolderTree className="w-4 h-4 text-indigo-500" />
                        </div>
                        <div className="min-w-0 flex-1">
                          <span className="font-medium text-[#0B1221] text-sm truncate block">{row.name}</span>
                          {row.subtitle && <p className="text-xs text-slate-500 truncate mt-0.5">{row.subtitle}</p>}
                        </div>
                      </button>
                    );
                  })}
                </ResultGroup>
              )}

              {grouped.tags.length > 0 && (
                <ResultGroup label="Tags">
                  {grouped.tags.map((row) => {
                    runningIndex += 1;
                    const isActive = runningIndex === activeIndex;
                    const index = runningIndex;
                    return (
                      <button
                        key={row.slug}
                        type="button"
                        onMouseEnter={() => setActiveIndex(index)}
                        onClick={() => openItem({ key: `tag-${row.slug}`, kind: 'tag', row, href: destinationFor(row) }, index)}
                        className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-left transition-colors ${isActive ? 'bg-indigo-50' : 'hover:bg-slate-50'}`}
                      >
                        <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center shrink-0">
                          <TagIcon className="w-4 h-4 text-slate-500" />
                        </div>
                        <span className="font-medium text-[#0B1221] text-sm truncate">{row.name}</span>
                      </button>
                    );
                  })}
                </ResultGroup>
              )}

              {showNoResults && (
                <div className="px-6 py-12 text-center">
                  <p className="text-sm font-medium text-[#0B1221]">No results for "{trimmedQuery}"</p>
                  <p className="text-xs text-slate-400 mt-1">Try a different name, category, or keyword.</p>
                </div>
              )}

              {hasSearched && !loading && (
                <div className="px-2 pt-1">
                  {(() => {
                    runningIndex += 1;
                    const isActive = runningIndex === activeIndex;
                    const index = runningIndex;
                    return (
                      <button
                        type="button"
                        onMouseEnter={() => setActiveIndex(index)}
                        onClick={() => openItem({ key: 'view-all', kind: 'view-all', href: `/tools?q=${encodeURIComponent(trimmedQuery)}` }, index)}
                        className={`w-full flex items-center justify-between gap-2 px-3 py-2.5 rounded-xl text-left text-sm font-medium transition-colors ${isActive ? 'bg-indigo-50 text-indigo-700' : 'text-indigo-600 hover:bg-slate-50'}`}
                      >
                        <span>View all results for "{trimmedQuery}"</span>
                        <ArrowRight className="w-3.5 h-3.5 shrink-0" />
                      </button>
                    );
                  })()}
                </div>
              )}
            </>
          )}
        </div>

        <div className="hidden sm:flex items-center gap-4 px-5 h-10 border-t border-slate-100 text-[11px] text-slate-400 shrink-0">
          <span className="inline-flex items-center gap-1"><ArrowRight className="w-3 h-3 -rotate-90" />/<ArrowRight className="w-3 h-3 rotate-90" /> Navigate</span>
          <span className="inline-flex items-center gap-1"><CornerDownLeft className="w-3 h-3" /> Open</span>
          <span className="inline-flex items-center gap-1">Esc Close</span>
        </div>
      </div>
    </div>,
    document.body
  );
}

function ResultGroup({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="px-2 pb-2">
      <p className="px-3 py-1.5 text-[11px] font-semibold uppercase tracking-[0.06em] text-slate-400">{label}</p>
      {children}
    </div>
  );
}
