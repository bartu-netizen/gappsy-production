/**
 * Extracts visitor IP address, browser user-agent, and Cloudflare geo headers
 * from an incoming HTTP request.
 *
 * Returns nullable fields — callers spread this directly into funnel_events rows.
 * When called outside an HTTP context (e.g. stripe-webhook server callbacks),
 * pass null and all fields will be null.
 */
export interface VisitorContext {
  ip_address: string | null;
  user_agent: string | null;
  country: string | null;
  city: string | null;
  region: string | null;
}

export function extractVisitorContext(req: Request | null): VisitorContext {
  if (!req) {
    return { ip_address: null, user_agent: null, country: null, city: null, region: null };
  }
  const cfIp = req.headers.get("CF-Connecting-IP");
  const xfwdIp = req.headers.get("X-Forwarded-For")?.split(",")[0]?.trim() ?? null;
  const xRealIp = req.headers.get("X-Real-IP") ?? null;
  return {
    ip_address: cfIp || xfwdIp || xRealIp || null,
    user_agent: req.headers.get("User-Agent") || null,
    country: req.headers.get("CF-IPCountry") || null,
    city: req.headers.get("CF-IPCity") || null,
    region: req.headers.get("CF-Region") || null,
  };
}
