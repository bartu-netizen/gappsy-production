import { useEffect, useState } from 'react';

const STORAGE_KEY = 'gappsy_recently_viewed_comparisons';
const MAX_ENTRIES = 6;

function readSlugs(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? (JSON.parse(raw) as string[]) : [];
  } catch {
    return [];
  }
}

// Read-only accessor for pages (e.g. the /compare landing page) that want to
// display the list without recording a "view" — recording only happens from
// the comparison detail page itself, via the hook below.
export function readRecentlyViewedComparisons(): string[] {
  return readSlugs();
}

// Records the current comparison as viewed and returns the *other* recently
// viewed slugs (most-recent-first) for the page to fetch and render. Mirrors
// useRecentlyViewedTools.ts.
export function useRecentlyViewedComparisons(currentSlug: string): string[] {
  const [otherSlugs, setOtherSlugs] = useState<string[]>([]);

  useEffect(() => {
    const existing = readSlugs();
    setOtherSlugs(existing.filter((slug) => slug !== currentSlug));

    const next = [currentSlug, ...existing.filter((slug) => slug !== currentSlug)].slice(0, MAX_ENTRIES);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
  }, [currentSlug]);

  return otherSlugs;
}
