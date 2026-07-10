import { useEffect, useState } from 'react';

const STORAGE_KEY = 'gappsy_recently_viewed_tools';
const MAX_ENTRIES = 8;

function readSlugs(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? (JSON.parse(raw) as string[]) : [];
  } catch {
    return [];
  }
}

// Records the current tool as viewed and returns the *other* recently viewed
// slugs (most-recent-first) for the page to fetch and render. Works
// automatically for every future tool page — no per-tool wiring needed.
export function useRecentlyViewedTools(currentSlug: string): string[] {
  const [otherSlugs, setOtherSlugs] = useState<string[]>([]);

  useEffect(() => {
    const existing = readSlugs();
    setOtherSlugs(existing.filter((slug) => slug !== currentSlug));

    const next = [currentSlug, ...existing.filter((slug) => slug !== currentSlug)].slice(0, MAX_ENTRIES);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
  }, [currentSlug]);

  return otherSlugs;
}
