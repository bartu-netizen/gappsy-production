// Fire-and-forget analytics relay — posts to the Netlify edge function
// (netlify/edge-functions/track-event.js), which attaches real geo/IP data
// (Netlify Edge Functions get this for free) before forwarding to the
// Supabase track-tool-event ingest function. Never awaited by callers and
// never throws — a broken analytics call must not affect the page.
function send(payload: Record<string, unknown>): void {
  try {
    fetch('/api/track-event', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload),
      keepalive: true,
    }).catch(() => {});
  } catch {
    // ignore
  }
}

export function trackToolPageView(toolSlug: string): void {
  send({ event_type: 'page_view', tool_slug: toolSlug });
}

export function trackToolOutboundClick(toolSlug: string, linkType: 'visit_website' | 'affiliate' | 'other', destinationUrl: string): void {
  send({ event_type: 'outbound_click', tool_slug: toolSlug, link_type: linkType, destination_url: destinationUrl });
}
