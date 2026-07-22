// Discovery Engine validation — reachability, HTTPS, redirect chain,
// robots.txt, sitemap.xml, favicon, dead/parked domain detection, and
// hostname normalization (for duplicate matching). Never fabricates a
// result: every field is either measured or left null/unknown.
//
// The reachability/SSRF-guard core mirrors admin-tool-url-check/index.ts —
// duplicated rather than imported because that function's guard is
// deliberately minimal (Step-1 wizard check); Discovery's validation runs
// unattended over many candidates and needs the extra checks below.

const TIMEOUT_MS = 6000;
const USER_AGENT = "GappsyBot/1.0 (+https://www.gappsy.com; Discovery Engine validation)";

const BLOCKED_HOSTNAME_PATTERNS = [
  /^localhost$/i,
  /^127\./,
  /^0\.0\.0\.0$/,
  /^10\./,
  /^172\.(1[6-9]|2\d|3[01])\./,
  /^192\.168\./,
  /^169\.254\./,
  /\.local$/i,
  /^\[?::1\]?$/,
];

export function isBlockedHostname(hostname: string): boolean {
  return BLOCKED_HOSTNAME_PATTERNS.some((re) => re.test(hostname));
}

// Strips "www." and lowercases — the same normalization admin-tools' own
// check-duplicate action uses, so hostname comparisons agree everywhere.
export function normalizeHostname(rawUrl: string): string | null {
  try {
    const url = new URL(rawUrl.match(/^https?:\/\//) ? rawUrl : `https://${rawUrl}`);
    return url.hostname.replace(/^www\./, "").toLowerCase();
  } catch {
    return null;
  }
}

// Code-hosting/package-registry domains where thousands of unrelated
// projects share the same base hostname (a tool whose "official website" is
// just its repo, common for self-hosted/open-source software). A bare
// hostname match on one of these is meaningless as a duplicate signal —
// see normalizeFullUrl/isMultiTenantHost's use in discoveryIngest.ts's
// findDuplicate.
const MULTI_TENANT_HOSTS = new Set([
  "github.com", "gitlab.com", "bitbucket.org", "sourceforge.net",
  "gitee.com", "codeberg.org", "npmjs.com", "pypi.org",
]);

export function isMultiTenantHost(hostname: string): boolean {
  return MULTI_TENANT_HOSTS.has(hostname.toLowerCase());
}

// Host + path (query/hash/trailing-slash stripped), for comparing identity
// on multi-tenant hosts where the path — not the hostname — is what
// actually identifies a distinct project (e.g. github.com/owner/repo).
export function normalizeFullUrl(rawUrl: string): string | null {
  try {
    const url = new URL(rawUrl.match(/^https?:\/\//) ? rawUrl : `https://${rawUrl}`);
    const host = url.hostname.replace(/^www\./, "").toLowerCase();
    const path = url.pathname.replace(/\/+$/, "").toLowerCase();
    return `${host}${path}`;
  } catch {
    return null;
  }
}

async function timedFetch(url: string, method: "HEAD" | "GET" = "GET"): Promise<{ ok: boolean; status?: number; finalUrl?: string; error?: string }> {
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), TIMEOUT_MS);
  try {
    const res = await fetch(url, {
      method,
      redirect: "follow",
      signal: controller.signal,
      headers: { "User-Agent": USER_AGENT },
    });
    return { ok: true, status: res.status, finalUrl: res.url };
  } catch (err) {
    const message = err instanceof Error && err.name === "AbortError" ? "Timed out" : "Could not connect";
    return { ok: false, error: message };
  } finally {
    clearTimeout(timeoutId);
  }
}

export interface ValidationNotes {
  https: boolean;
  reachable: boolean;
  status_code: number | null;
  final_url: string | null;
  redirect_chain_changed_host: boolean;
  robots_txt: boolean | null;
  sitemap_xml: boolean | null;
  favicon: boolean | null;
  dead_domain: boolean;
  parked_domain: boolean;
  error: string | null;
  checked_at: string;
}

// Heuristic only — a small, well-known set of parked/for-sale page markers.
// False negatives are expected and fine; this never claims certainty it
// doesn't have (parked_domain stays false unless a marker actually matched).
const PARKED_MARKERS = [
  "domain is for sale",
  "buy this domain",
  "this domain may be for sale",
  "parked free",
  "godaddy.com/domains",
  "sedo.com",
];

export async function validateWebsite(rawUrl: string): Promise<ValidationNotes> {
  const checkedAt = new Date().toISOString();
  let parsed: URL;
  try {
    parsed = new URL(rawUrl.match(/^https?:\/\//) ? rawUrl : `https://${rawUrl}`);
  } catch {
    return {
      https: false, reachable: false, status_code: null, final_url: null,
      redirect_chain_changed_host: false, robots_txt: null, sitemap_xml: null, favicon: null,
      dead_domain: true, parked_domain: false, error: "Not a valid URL", checked_at: checkedAt,
    };
  }

  if (isBlockedHostname(parsed.hostname)) {
    return {
      https: parsed.protocol === "https:", reachable: false, status_code: null, final_url: null,
      redirect_chain_changed_host: false, robots_txt: null, sitemap_xml: null, favicon: null,
      dead_domain: false, parked_domain: false, error: "This host cannot be checked", checked_at: checkedAt,
    };
  }

  let attempt = await timedFetch(parsed.toString(), "HEAD");
  if (!attempt.ok) attempt = await timedFetch(parsed.toString(), "GET");

  if (!attempt.ok) {
    return {
      https: parsed.protocol === "https:", reachable: false, status_code: null, final_url: null,
      redirect_chain_changed_host: false, robots_txt: null, sitemap_xml: null, favicon: null,
      dead_domain: true, parked_domain: false, error: attempt.error ?? "Could not connect", checked_at: checkedAt,
    };
  }

  const reachable = (attempt.status ?? 500) < 500;
  const finalHost = attempt.finalUrl ? (() => { try { return new URL(attempt.finalUrl!).hostname; } catch { return null; } })() : null;
  const redirectChainChangedHost = Boolean(finalHost && finalHost !== parsed.hostname);

  let parkedDomain = false;
  if (reachable) {
    const bodyAttempt = await timedFetch(parsed.toString(), "GET");
    if (bodyAttempt.ok) {
      try {
        const res = await fetch(parsed.toString(), { headers: { "User-Agent": USER_AGENT }, signal: AbortSignal.timeout(TIMEOUT_MS) });
        const text = (await res.text()).slice(0, 20000).toLowerCase();
        parkedDomain = PARKED_MARKERS.some((marker) => text.includes(marker));
      } catch {
        // Body fetch is best-effort only — leave parkedDomain false rather than guess.
      }
    }
  }

  const base = `${parsed.protocol}//${parsed.hostname}`;
  const [robotsCheck, sitemapCheck, faviconCheck] = await Promise.all([
    timedFetch(`${base}/robots.txt`, "GET"),
    timedFetch(`${base}/sitemap.xml`, "GET"),
    timedFetch(`${base}/favicon.ico`, "HEAD"),
  ]);

  return {
    https: parsed.protocol === "https:",
    reachable,
    status_code: attempt.status ?? null,
    final_url: attempt.finalUrl ?? null,
    redirect_chain_changed_host: redirectChainChangedHost,
    robots_txt: robotsCheck.ok ? (robotsCheck.status ?? 0) < 400 : null,
    sitemap_xml: sitemapCheck.ok ? (sitemapCheck.status ?? 0) < 400 : null,
    favicon: faviconCheck.ok ? (faviconCheck.status ?? 0) < 400 : null,
    dead_domain: !reachable,
    parked_domain: parkedDomain,
    error: null,
    checked_at: checkedAt,
  };
}
