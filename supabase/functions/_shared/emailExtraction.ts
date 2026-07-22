// Pulls real, self-published contact emails out of a Crawl4AI raw crawl
// result — mailto: links first (a company explicitly publishing "email us
// at X" is the strongest signal), plain-text email matches as a fallback
// for addresses mentioned without a mailto: link. Deliberately NOT a
// pattern-guesser (info@/hello@/support@) — see the "why" in
// emailDiscoveryScanHandler in schedulerRegistry.ts.

export interface Crawl4aiPageResultForEmails {
  url: string;
  redirected_url?: string | null;
  html?: string;
  cleaned_html?: string;
  markdown?: { raw_markdown?: string } | string | null;
  links?: { internal?: Array<{ href?: string }>; external?: Array<{ href?: string }> };
}

export interface DiscoveredEmail {
  email: string;
  source_url: string;
}

const EMAIL_RE = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;

// Filenames/asset paths that happen to contain "@" (e.g. logo@2x.png),
// tracking/analytics domains, and obvious placeholder addresses — none of
// these are a real point of contact, so they're dropped rather than stored.
const EXCLUDED_DOMAIN_SUBSTRINGS = [
  "sentry.io", "wixpress.com", "example.com", "example.org", "yourdomain",
  "domain.com", "email.com", "test.com", "godaddy.com", "schema.org",
  "w3.org", "gravatar.com",
];
const EXCLUDED_LOCAL_PARTS = new Set(["noreply", "no-reply", "donotreply", "postmaster", "abuse", "webmaster"]);
const IMAGE_EXTENSION_RE = /\.(png|jpe?g|gif|svg|webp|avif)$/i;

function isLikelyRealEmail(email: string): boolean {
  const lower = email.toLowerCase();
  if (IMAGE_EXTENSION_RE.test(lower)) return false; // logo@2x.png style false positive
  const [localPart, domain] = lower.split("@");
  if (!localPart || !domain) return false;
  if (EXCLUDED_LOCAL_PARTS.has(localPart)) return false;
  if (EXCLUDED_DOMAIN_SUBSTRINGS.some((d) => domain.includes(d))) return false;
  return true;
}

function getMarkdown(page: Crawl4aiPageResultForEmails): string {
  if (!page.markdown) return "";
  if (typeof page.markdown === "string") return page.markdown;
  return page.markdown.raw_markdown || "";
}

function pageUrl(page: Crawl4aiPageResultForEmails): string {
  return page.redirected_url || page.url;
}

function extractFromPage(page: Crawl4aiPageResultForEmails): string[] {
  const found = new Set<string>();
  const url = pageUrl(page);

  const links = [...(page.links?.internal || []), ...(page.links?.external || [])];
  for (const link of links) {
    if (!link.href || !link.href.toLowerCase().startsWith("mailto:")) continue;
    const address = link.href.slice("mailto:".length).split("?")[0].trim();
    if (address) found.add(address);
  }

  const text = `${page.cleaned_html || page.html || ""}\n${getMarkdown(page)}`;
  const matches = text.match(EMAIL_RE) || [];
  for (const m of matches) found.add(m.trim());

  return [...found].filter(isLikelyRealEmail).map((e) => e.toLowerCase());
}

// One tool can legitimately publish several addresses (info@, sales@, a
// named founder@) — every distinct one found across every crawled page is
// returned, not just the first match.
export function extractContactEmails(pages: Crawl4aiPageResultForEmails[]): DiscoveredEmail[] {
  const byEmail = new Map<string, string>(); // email -> first source_url it was found on
  for (const page of pages) {
    const url = pageUrl(page);
    for (const email of extractFromPage(page)) {
      if (!byEmail.has(email)) byEmail.set(email, url);
    }
  }
  return [...byEmail.entries()].map(([email, source_url]) => ({ email, source_url }));
}
