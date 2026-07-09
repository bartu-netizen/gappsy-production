const PLACEHOLDER_VALUES = new Set(["-", "n/a", "none", "null", "undefined", "na", "no", "not available", ""]);

function isPlaceholder(value: string): boolean {
  return PLACEHOLDER_VALUES.has(value.trim().toLowerCase());
}

export function normalizeEmail(email: string): string | null {
  if (!email) return null;
  const trimmed = email.trim().toLowerCase();
  if (isPlaceholder(trimmed) || !trimmed.includes("@")) return null;
  return trimmed;
}

export function normalizeDomain(urlOrDomain: string): string | null {
  if (!urlOrDomain) return null;
  let d = urlOrDomain.trim().toLowerCase();
  if (isPlaceholder(d)) return null;
  d = d.replace(/^https?:\/\/(www\.)?/i, "");
  d = d.replace(/\/.*$/, "");
  d = d.replace(/\?.*$/, "");
  d = d.trim();
  if (!d || d.length < 4 || !d.includes(".")) return null;
  return d;
}

export function normalizeAgencyName(name: string): string | null {
  if (!name) return null;
  let n = name.trim().toLowerCase();
  if (isPlaceholder(n)) return null;
  n = n.replace(/\s+/g, " ").trim();
  return n || null;
}

export function normalizePhone(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let cleaned = phoneRaw
    .replace(/[\s\-().]/g, "")
    .replace(/[x|ext.?].*$/i, "")
    .trim();
  if (!cleaned || isPlaceholder(cleaned)) return null;
  if (cleaned.startsWith("+")) {
    const digits = cleaned.substring(1).replace(/\D/g, "");
    if (digits.length >= 10) return `+${digits}`;
    return null;
  }
  const digits = cleaned.replace(/\D/g, "");
  if (!digits) return null;
  if (digits.length === 10) return `+1${digits}`;
  if (digits.length === 11 && digits.startsWith("1")) return `+${digits}`;
  if (digits.length >= 11) return `+${digits}`;
  return null;
}

export function normalizePhoneDigits(phoneRaw: string): string | null {
  if (!phoneRaw) return null;
  let digits = phoneRaw.replace(/\D/g, "");
  if (digits.length === 11 && digits.startsWith("1")) {
    digits = digits.slice(1);
  }
  if (digits.length < 7) return null;
  return digits || null;
}

export function normalizeAddress(address: string): string | null {
  if (!address) return null;
  let a = address.trim().toLowerCase();
  if (isPlaceholder(a)) return null;
  a = a.replace(/\s+/g, " ").trim();
  return a || null;
}

export function normalizeCity(city: string): string | null {
  if (!city) return null;
  let c = city.trim().toLowerCase();
  if (isPlaceholder(c)) return null;
  return c || null;
}

export function normalizeState(state: string): string | null {
  if (!state) return null;
  let s = state.trim().toLowerCase();
  if (isPlaceholder(s)) return null;
  return s || null;
}

/**
 * Compute a GLOBAL agency identity key (no state in the key).
 * This allows the same agency to be recognized across multiple states.
 *
 * Priority order (highest to lowest):
 *   1. normalized_domain (website URL)
 *   2. normalized_name + normalized_phone_digits
 *   3. normalized_name only (last resort, risky - only use with caution)
 *
 * Returns null if no usable identity can be computed.
 */
export function computeGlobalAgencyIdentityKey(opts: {
  websiteUrl?: string | null;
  name?: string | null;
  phone?: string | null;
}): string | null {
  const domain = normalizeDomain(opts.websiteUrl || "");
  if (domain) {
    return `domain:${domain}`;
  }

  const name = normalizeAgencyName(opts.name || "");
  if (!name) return null;

  const phoneDigits = normalizePhoneDigits(opts.phone || "");
  if (phoneDigits && phoneDigits.length >= 7) {
    return `name_phone:${name}|${phoneDigits}`;
  }

  return null;
}

/**
 * Compute a STATE-SCOPED agency dedupe key.
 * Used when global identity cannot be established.
 *
 * Priority order:
 *   1. normalized_domain + state (website match within state)
 *   2. normalized_name + normalized_phone + state
 *   3. normalized_name + normalized_address + state
 *   4. normalized_name + city + state
 *   5. normalized_name + state (last resort)
 */
export function computeStateScopedDedupeKey(opts: {
  websiteUrl?: string | null;
  name?: string | null;
  phone?: string | null;
  address?: string | null;
  city?: string | null;
  stateSlug?: string | null;
}): string | null {
  const state = normalizeState(opts.stateSlug || "");
  if (!state) return null;

  const domain = normalizeDomain(opts.websiteUrl || "");
  if (domain) {
    return `state_domain:${domain}|${state}`;
  }

  const name = normalizeAgencyName(opts.name || "");
  if (!name) return null;

  const phoneDigits = normalizePhoneDigits(opts.phone || "");
  if (phoneDigits && phoneDigits.length >= 7) {
    return `state_name_phone:${name}|${phoneDigits}|${state}`;
  }

  const address = normalizeAddress(opts.address || "");
  if (address) {
    return `state_name_addr:${name}|${address}|${state}`;
  }

  const city = normalizeCity(opts.city || "");
  if (city) {
    return `state_name_city:${name}|${city}|${state}`;
  }

  return `state_name:${name}|${state}`;
}

/**
 * Legacy dedupe key computation for backwards compatibility.
 * Priority: domain > name+phone > name+address+state > name+state
 * Returns null only if name is also missing/placeholder.
 */
export function computeAgencyDedupeKey(opts: {
  websiteUrl?: string | null;
  name?: string | null;
  phone?: string | null;
  address?: string | null;
  stateSlug?: string | null;
}): string | null {
  const domain = normalizeDomain(opts.websiteUrl || "");
  if (domain) return domain;

  const name = normalizeAgencyName(opts.name || "");
  if (!name) return null;

  const phone = normalizePhone(opts.phone || "");
  if (phone) return `${name}|${phone}`;

  const address = normalizeAddress(opts.address || "");
  const state = normalizeState(opts.stateSlug || "");
  if (address && state) return `${name}|${address}|${state}`;

  if (state) return `${name}|${state}`;

  return name;
}

const TRAILING_SUFFIX_TOKENS = [
  "marketing agency",
  "digital agency",
  "creative agency",
  "advertising agency",
  "corporation",
  "company",
  "marketing",
  "digital",
  "agency",
  "agencies",
  "studio",
  "studios",
  "group",
  "media",
  "llc",
  "l.l.c",
  "inc",
  "incorporated",
  "ltd",
  "limited",
  "co",
  "corp",
];

function stripPunctuation(value: string): string {
  return value.replace(/[.,&'"`!?:;|/\\()\[\]{}]/g, " ").replace(/\s+/g, " ").trim();
}

/**
 * Strict agency-name normalizer for customer suppression matching.
 * - Lowercases, removes punctuation, collapses whitespace
 * - Iteratively strips ONLY clear trailing legal/generic suffixes
 * - Refuses to strip if result would have < 2 tokens or < 3 characters
 * - Preserves core distinguishing names (e.g. "Marketing Pros" stays intact)
 *
 * Returns:
 *   - canonical: the stripped form (best for matching)
 *   - preserved: the un-stripped form (fallback / dual-pass matching)
 *   - both null if input is placeholder/empty
 */
export function normalizeAgencyNameStrict(name: string | null | undefined): {
  canonical: string | null;
  preserved: string | null;
} {
  if (!name) return { canonical: null, preserved: null };
  let n = name.trim().toLowerCase();
  if (isPlaceholder(n)) return { canonical: null, preserved: null };
  n = stripPunctuation(n);
  if (!n) return { canonical: null, preserved: null };

  const preserved = n;
  let canonical = n;

  let didStrip = true;
  while (didStrip) {
    didStrip = false;
    for (const suffix of TRAILING_SUFFIX_TOKENS) {
      const re = new RegExp(`(^|\\s)${suffix.replace(/\s+/g, "\\s+")}$`);
      if (re.test(canonical)) {
        const candidate = canonical.replace(re, "").trim();
        const tokens = candidate.split(/\s+/).filter(Boolean);
        if (candidate.length >= 3 && tokens.length >= 1 && candidate !== canonical) {
          canonical = candidate;
          didStrip = true;
          break;
        }
      }
    }
  }

  if (!canonical || canonical.length < 3) {
    return { canonical: preserved, preserved };
  }

  return { canonical, preserved };
}

export type CanonicalVerificationStatus = "pending" | "valid" | "invalid" | "retry" | "failed";

export function mapLegacyVerificationStatus(status: string | null | undefined): CanonicalVerificationStatus {
  if (!status) return "pending";

  const s = status.toLowerCase().trim();

  if (s === "valid" || s === "deliverable") return "valid";
  if (s === "invalid" || s === "undeliverable") return "invalid";
  if (s === "failed") return "failed";
  if (s === "retry") return "retry";
  if (s === "pending") return "pending";

  if (s === "unknown_retry" || s === "unknown_retrying" || s === "verification_unknown_retrying") {
    console.warn("Legacy verification status detected:", status);
    return "retry";
  }
  if (s === "unknown_final" || s === "verification_unknown_final") {
    console.warn("Legacy verification status detected:", status);
    return "failed";
  }
  if (s === "unknown" || s === "catch_all" || s === "risky" || s === "accept_all") {
    console.warn("Legacy verification status detected:", status);
    return "retry";
  }

  return "pending";
}
