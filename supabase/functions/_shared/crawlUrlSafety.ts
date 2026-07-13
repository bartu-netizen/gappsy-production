// URL validation + SSRF protection for the crawl integration. Used by
// admin-crawl-jobs BEFORE ever calling the gateway (defense in depth — the
// gateway enforces the same rules again, server-side, independently; see
// Phase 7 of the crawl integration plan).

const PRIVATE_IPV4_RANGES: Array<[number, number]> = [
  [ip4("10.0.0.0"), ip4("10.255.255.255")],
  [ip4("172.16.0.0"), ip4("172.31.255.255")],
  [ip4("192.168.0.0"), ip4("192.168.255.255")],
  [ip4("127.0.0.0"), ip4("127.255.255.255")],
  [ip4("169.254.0.0"), ip4("169.254.255.255")], // link-local + cloud metadata (169.254.169.254)
  [ip4("100.64.0.0"), ip4("100.127.255.255")], // CGNAT
  [ip4("0.0.0.0"), ip4("0.255.255.255")],
];

function ip4(addr: string): number {
  const parts = addr.split(".").map(Number);
  return ((parts[0] << 24) | (parts[1] << 16) | (parts[2] << 8) | parts[3]) >>> 0;
}

function isPrivateIPv4(addr: string): boolean {
  const parts = addr.split(".");
  if (parts.length !== 4 || parts.some((p) => !/^\d{1,3}$/.test(p) || Number(p) > 255)) return false;
  const n = ip4(addr);
  return PRIVATE_IPV4_RANGES.some(([lo, hi]) => n >= lo && n <= hi);
}

function isPrivateIPv6(addr: string): boolean {
  const a = addr.toLowerCase();
  return a === "::1" || a.startsWith("fe80:") || a.startsWith("fc") || a.startsWith("fd") || a.startsWith("::ffff:127.");
}

// Small common-suffix list for two-label registrable-domain extraction —
// not a full Public Suffix List. Good enough to compare same-site (e.g.
// example.co.uk vs sub.example.co.uk) for this MVP's single-domain crawl
// scope; documented as a known limitation, not a general-purpose PSL parser.
const TWO_LABEL_SUFFIXES = new Set([
  "co.uk", "org.uk", "ac.uk", "gov.uk", "co.jp", "co.nz", "co.za", "com.au",
  "com.br", "com.mx", "com.sg", "co.in", "co.kr", "com.cn",
]);

export function registrableDomain(hostname: string): string {
  const labels = hostname.toLowerCase().split(".").filter(Boolean);
  if (labels.length <= 2) return labels.join(".");
  const lastTwo = labels.slice(-2).join(".");
  if (TWO_LABEL_SUFFIXES.has(lastTwo) && labels.length >= 3) return labels.slice(-3).join(".");
  return lastTwo;
}

export function isSameRegistrableDomain(a: string, b: string): boolean {
  return registrableDomain(a) === registrableDomain(b);
}

export interface UrlValidationResult {
  ok: boolean;
  reason?: string;
  normalizedUrl?: string;
  hostname?: string;
}

// Structural validation only (protocol, hostname literal shape). Does NOT
// resolve DNS — call resolvesToPublicAddress() separately for that, since
// DNS resolution is async and callers may want to run both checks together.
export function validateCrawlUrl(rawUrl: string): UrlValidationResult {
  let parsed: URL;
  try {
    parsed = new URL(rawUrl);
  } catch {
    return { ok: false, reason: "invalid_url" };
  }

  if (parsed.protocol !== "http:" && parsed.protocol !== "https:") {
    return { ok: false, reason: "unsupported_protocol" };
  }

  const hostname = parsed.hostname.toLowerCase();

  if (hostname === "localhost" || hostname.endsWith(".localhost") || hostname.endsWith(".local")) {
    return { ok: false, reason: "localhost_blocked" };
  }
  if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname) && isPrivateIPv4(hostname)) {
    return { ok: false, reason: "private_ip_blocked" };
  }
  if (hostname.includes(":") && isPrivateIPv6(hostname)) {
    return { ok: false, reason: "private_ip_blocked" };
  }
  if (hostname === "metadata.google.internal") {
    return { ok: false, reason: "metadata_endpoint_blocked" };
  }

  return { ok: true, normalizedUrl: parsed.toString(), hostname };
}

// Real SSRF defense: resolve the hostname and check the ACTUAL IP(s), not
// just the URL string — blocks DNS-rebinding (a hostname that resolves to
// a private IP even though the literal string looks like a public domain).
export async function resolvesToPublicAddress(hostname: string): Promise<{ ok: boolean; reason?: string }> {
  if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(hostname)) {
    return isPrivateIPv4(hostname) ? { ok: false, reason: "private_ip_blocked" } : { ok: true };
  }
  try {
    const records = await Deno.resolveDns(hostname, "A").catch(() => [] as string[]);
    const aaaaRecords = await Deno.resolveDns(hostname, "AAAA").catch(() => [] as string[]);
    const all = [...records, ...aaaaRecords];
    if (all.length === 0) return { ok: false, reason: "dns_resolution_failed" };
    for (const addr of all) {
      if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.test(addr) && isPrivateIPv4(addr)) return { ok: false, reason: "dns_rebinding_private_ip" };
      if (addr.includes(":") && isPrivateIPv6(addr)) return { ok: false, reason: "dns_rebinding_private_ip" };
    }
    return { ok: true };
  } catch {
    return { ok: false, reason: "dns_resolution_failed" };
  }
}

// Path-based scope filter — informational prioritization/exclusion, not a
// security control by itself (the SSRF checks above are). Mirrors Phase 3's
// prioritize/ignore lists.
const PRIORITY_PATH_PATTERNS = [/^\/$/, /pricing/i, /features?/i, /product/i, /integrations?/i, /^\/about/i, /faq|help/i, /^\/docs/i, /security|trust/i, /platform|apps/i];
const IGNORE_PATH_PATTERNS = [/privacy/i, /terms/i, /careers/i, /^\/blog\//i, /changelog/i, /login|signin|sign-in/i, /signup|sign-up|register/i, /checkout|cart|billing/i, /^\/admin/i, /^\/account/i, /^\/dashboard/i, /utm_/i];

export function isPriorityPath(pathname: string): boolean {
  return PRIORITY_PATH_PATTERNS.some((re) => re.test(pathname));
}
export function isIgnoredPath(pathname: string): boolean {
  return IGNORE_PATH_PATTERNS.some((re) => re.test(pathname));
}

// MAX_ACTIVE_JOBS was removed: global crawl concurrency is now a
// configurable, DB-backed setting (crawl_settings.max_concurrent_crawls,
// default 2, hard-bounded 1-4 by a CHECK constraint) claimed atomically via
// the claim_crawl_jobs() RPC — see _shared/crawlRunner.ts. Everything below
// is unrelated to concurrency and stays as the gateway's own hard resource
// ceiling (unchanged by the concurrency work).
export const CRAWL_LIMITS = {
  MAX_PAGES: 10,
  MAX_DEPTH: 2,
  MAX_DURATION_MS: 10 * 60 * 1000,
  MAX_RESPONSE_BYTES: 5_000_000,
  MAX_REDIRECTS: 5,
} as const;
