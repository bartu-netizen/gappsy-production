import { useCallback, useEffect, useState } from 'react';

const STORAGE_KEY = 'gappsy_bookmarked_tools';

function readBookmarks(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? (JSON.parse(raw) as string[]) : [];
  } catch {
    return [];
  }
}

// Client-only bookmarking for tool pages — no account/backend required.
// Reusable by any future tool detail page via the same hook.
export function useBookmarkedTool(slug: string) {
  const [bookmarked, setBookmarked] = useState(false);

  useEffect(() => {
    setBookmarked(readBookmarks().includes(slug));
  }, [slug]);

  const toggle = useCallback(() => {
    const current = readBookmarks();
    const next = current.includes(slug) ? current.filter((s) => s !== slug) : [...current, slug];
    localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
    setBookmarked(next.includes(slug));
  }, [slug]);

  return { bookmarked, toggle };
}
