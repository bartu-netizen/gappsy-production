import { useCallback, useState } from 'react';

const STORAGE_KEY = 'gappsy_recent_software_searches';
const MAX_ENTRIES = 6;

function readTerms(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? (JSON.parse(raw) as string[]) : [];
  } catch {
    return [];
  }
}

// Recent free-text search terms (not slugs), same localStorage-array shape as
// useRecentlyViewedTools.ts. The caller decides when to record a term (on a
// completed, non-empty search), not on every keystroke.
export function useRecentSoftwareSearches() {
  const [terms, setTerms] = useState<string[]>(() => readTerms());

  const recordSearch = useCallback((term: string) => {
    const trimmed = term.trim();
    if (trimmed.length < 2) return;
    setTerms((prev) => {
      const next = [trimmed, ...prev.filter((t) => t.toLowerCase() !== trimmed.toLowerCase())].slice(0, MAX_ENTRIES);
      try {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
      } catch {
        // storage unavailable — in-memory state still works for this session
      }
      return next;
    });
  }, []);

  const clearSearches = useCallback(() => {
    setTerms([]);
    try {
      localStorage.removeItem(STORAGE_KEY);
    } catch {
      // best-effort
    }
  }, []);

  return { recentSearches: terms, recordSearch, clearSearches };
}
