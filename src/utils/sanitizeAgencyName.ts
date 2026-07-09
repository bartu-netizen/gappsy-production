const URL_PATTERN = /https?:\/\/[^\s,]+/gi;
const MAPS_PATTERN = /google\.com\/maps|maps\.google/i;
const OWNER_PREFIX = /^by\s+owner\s*[,:]?\s*/i;
const CSV_JUNK = /^["',\s]+|["',\s]+$/g;
const EXCESSIVE_COMMAS = /,{2,}/g;
const EXCESSIVE_QUOTES = /"{2,}|'{2,}/g;
const LONG_UNBROKEN = /\S{80,}/;
const COORDINATE_RE = /^-?\d+\.\d{3,}$/;
const MOSTLY_NUMERIC_RE = /^[\d\s.,()+\-/]+$/;

const ATTRIBUTE_LABELS = [
  "identifies as women-owned",
  "identifies as veteran-owned",
  "identifies as black-owned",
  "identifies as lgbtq+ owned",
  "identifies as asian-owned",
  "identifies as latino-owned",
  "women-owned",
  "veteran-owned",
  "black-owned",
  "lgbtq+ owned",
  "asian-owned",
  "latino-owned",
  "minority-owned",
  "wheelchair accessible",
  "wheelchair-accessible entrance",
  "wheelchair-accessible parking",
  "open 24 hours",
  "temporarily closed",
  "permanently closed",
  "online appointments",
  "in-store shopping",
  "onsite services",
  "lgbtq+ friendly",
];

const GENERIC_PLACEHOLDERS = [
  "agency",
  "business",
  "company",
  "n/a",
  "na",
  "none",
  "unknown",
  "test",
  "null",
  "undefined",
  "placeholder",
];

export type NameClassification = "valid" | "suspicious" | "junk";

export function classifyAgencyNameForDisplay(name: string): NameClassification {
  if (!name || name.trim().length === 0) return "junk";

  const trimmed = name.trim();

  if (COORDINATE_RE.test(trimmed)) return "junk";
  if (MOSTLY_NUMERIC_RE.test(trimmed) && trimmed.length < 20) return "junk";

  URL_PATTERN.lastIndex = 0;
  if (/^https?:\/\//i.test(trimmed) && !trimmed.includes(" ")) return "junk";
  if (MAPS_PATTERN.test(trimmed)) return "junk";

  const lower = trimmed.toLowerCase();
  for (const label of ATTRIBUTE_LABELS) {
    if (lower === label || lower.startsWith("identifies as ")) return "junk";
  }
  if (GENERIC_PLACEHOLDERS.includes(lower)) return "junk";
  if (trimmed.length < 2) return "junk";
  if (LONG_UNBROKEN.test(trimmed)) return "junk";

  if (EXCESSIVE_COMMAS.test(trimmed) || EXCESSIVE_QUOTES.test(trimmed)) return "suspicious";
  if ((trimmed.match(/,/g) || []).length >= 4) return "suspicious";
  if ((trimmed.match(/["']/g) || []).length >= 4) return "suspicious";
  if (OWNER_PREFIX.test(trimmed)) return "suspicious";

  return "valid";
}

export function isSuspiciousAgencyName(name: string): boolean {
  const cls = classifyAgencyNameForDisplay(name);
  return cls === "junk" || cls === "suspicious";
}

function extractDomainBrand(websiteUrl: string | undefined | null): string | null {
  if (!websiteUrl) return null;
  try {
    let domain = websiteUrl.trim().toLowerCase();
    domain = domain.replace(/^https?:\/\/(www\.)?/i, "");
    domain = domain.replace(/\/.*$/, "").replace(/\?.*$/, "");
    if (!domain || domain.length < 4 || !domain.includes(".")) return null;
    const brand = domain.split(".")[0];
    if (brand.length < 2 || brand.length > 40) return null;
    if (/^\d+$/.test(brand)) return null;
    return brand.charAt(0).toUpperCase() + brand.slice(1);
  } catch {
    return null;
  }
}

export function sanitizeAgencyName(
  rawName: string,
  websiteUrl?: string | null
): string {
  if (!rawName) {
    return extractDomainBrand(websiteUrl) || "";
  }

  let cleaned = rawName;
  cleaned = cleaned.replace(URL_PATTERN, "");
  cleaned = cleaned.replace(OWNER_PREFIX, "");
  cleaned = cleaned.replace(CSV_JUNK, "");
  cleaned = cleaned.replace(EXCESSIVE_COMMAS, ",");
  cleaned = cleaned.replace(EXCESSIVE_QUOTES, "");
  cleaned = cleaned.replace(/[,;|]+$/, "").replace(/^[,;|]+/, "");
  cleaned = cleaned.replace(/\s+/g, " ").trim();

  if (cleaned.length > 60) {
    const cutPoint = cleaned.lastIndexOf(" ", 57);
    cleaned = cutPoint > 20 ? cleaned.substring(0, cutPoint) : cleaned.substring(0, 57);
    cleaned = cleaned.replace(/[,;|\s]+$/, "");
  }

  const cls = classifyAgencyNameForDisplay(cleaned);

  if (cls === "junk") {
    const fallback = extractDomainBrand(websiteUrl);
    if (fallback && classifyAgencyNameForDisplay(fallback) === "valid") return fallback;
    return "";
  }

  return cleaned;
}

export function isDisplayableAgencyName(name: string, websiteUrl?: string | null): boolean {
  const sanitized = sanitizeAgencyName(name, websiteUrl);
  return sanitized.length >= 2;
}
