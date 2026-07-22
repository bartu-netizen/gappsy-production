// Tags an outbound tool link (Visit Website, Try Free, etc.) with UTM
// parameters identifying Gappsy as the referral source, so the
// destination site's own analytics can attribute the click back to us —
// separate from our own click-tracking in tool_outbound_clicks, which
// only sees that the click happened, not what the destination site does
// with the visitor afterward.
export function buildOutboundUrl(url: string): string {
  try {
    const parsed = new URL(url);
    parsed.searchParams.set("utm_source", "gappsy.com");
    parsed.searchParams.set("utm_medium", "referral");
    parsed.searchParams.set("utm_campaign", "tool_directory");
    return parsed.toString();
  } catch {
    // Malformed/relative URL — return as-is rather than throwing on a
    // real visitor's click.
    return url;
  }
}
