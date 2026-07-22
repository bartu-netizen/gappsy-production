// Thin wrapper around the site's existing analytics convention (guarded
// `window.gtag` calls — see GoogleAnalytics.tsx). No PII beyond the raw
// query string the user typed into the search box.

declare global {
  interface Window {
    gtag?: (...args: unknown[]) => void;
  }
}

function track(event: string, params: Record<string, unknown> = {}): void {
  if (typeof window.gtag === 'function') {
    window.gtag('event', event, params);
  }
}

export function trackSearchOpened(source: 'click' | 'shortcut' = 'click'): void {
  track('search_opened', { source });
}

export function trackSearchQuery(query: string, resultCount: number): void {
  track('search_query', { query, result_count: resultCount });
}

export function trackSearchResultClicked(resultType: string, slug: string, position: number): void {
  track('search_result_clicked', { result_type: resultType, slug, position });
}

export function trackSearchNoResults(query: string): void {
  track('search_no_results', { query });
}
