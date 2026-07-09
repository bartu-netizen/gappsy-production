export interface CanonicalAgencyRow {
  name: string;
  website_url?: string;
  phone?: string;
  email?: string;
  city?: string;
  description?: string;
  services?: string;
  primary_service?: string;
  logo_url?: string;
  state_slug?: string;
  zip_code?: string;
  full_address?: string;
  street_address?: string;
  keyword?: string;
  facebook_url?: string;
  twitter_url?: string;
  instagram_url?: string;
  youtube_url?: string;
  linkedin_url?: string;
  tiktok_url?: string;
  pinterest_url?: string;
  plus_code?: string;
  maps_url?: string;
  latitude?: string;
  longitude?: string;
  _nameClassification?: string;
  _nameReason?: string;
  [key: string]: string | undefined;
}

const NAME_ALIASES = [
  "name",
  "agency_name",
  "company_name",
  "company",
  "business_name",
  "business",
  "agency",
  "agency_title",
  "listing_name",
  "title",
];

const WEBSITE_ALIASES = [
  "website",
  "website_url",
  "url",
  "domain",
  "company_website",
  "site",
  "web",
];

const PHONE_ALIASES = [
  "phone",
  "phone_number",
  "phone_numbers",
  "phones",
  "telephone",
  "tel",
  "mobile",
  "business_phone",
  "contact_number",
];

const EMAIL_ALIASES = [
  "email",
  "emails",
  "email_address",
  "company_email",
  "contact_email",
];

const CITY_ALIASES = ["city", "town", "location_city"];

const DESCRIPTION_ALIASES = ["description", "intro", "about", "bio", "summary"];

const SERVICES_ALIASES = ["services", "service", "offerings", "service_list"];

const PRIMARY_SERVICE_ALIASES = ["primary_service", "main_service", "core_service"];

const LOGO_ALIASES = ["logo_url", "logo", "image_url"];

const STATE_ALIASES = ["state_slug", "state", "state_code"];

const ZIP_ALIASES = ["zip_code", "zip", "postal_code", "postcode"];

const FULL_ADDRESS_ALIASES = ["full_address", "address", "complete_address"];

const STREET_ADDRESS_ALIASES = ["street_address", "street"];

const KEYWORD_ALIASES = ["keyword", "keywords", "search_keyword"];

const FACEBOOK_ALIASES = ["facebook", "facebook_url", "fb", "fb_url"];

const TWITTER_ALIASES = ["twitter", "twitter_url", "x", "x_url"];

const INSTAGRAM_ALIASES = ["instagram", "instagram_url", "ig", "ig_url"];

const YOUTUBE_ALIASES = ["youtube", "youtube_url", "yt", "yt_url"];

const LINKEDIN_ALIASES = ["linkedin", "linkedin_url", "li", "li_url"];

const TIKTOK_ALIASES = ["tiktok", "tiktok_url", "tt", "tt_url"];

const PINTEREST_ALIASES = ["pinterest", "pinterest_url", "pin", "pin_url"];

const PLUS_CODE_ALIASES = ["plus_code", "pluscode", "google_plus_code"];

const MAPS_URL_ALIASES = ["maps_url", "google_maps_url", "maps", "google_maps", "url"];

const LATITUDE_ALIASES = ["latitude", "lat"];

const LONGITUDE_ALIASES = ["longitude", "lng", "lon"];

function normalizeKey(key: string): string {
  return key
    .toLowerCase()
    .trim()
    .replace(/[\ufeff\u200b]/g, "")
    .replace(/^["']|["']$/g, "")
    .replace(/\s+/g, "_");
}

function findValue(
  row: Record<string, any>,
  aliases: string[]
): string | undefined {
  for (const alias of aliases) {
    for (const key of Object.keys(row)) {
      const normalizedKey = normalizeKey(key);
      if (normalizedKey === alias) {
        const val = row[key];
        if (val !== null && val !== undefined) {
          const strVal = String(val).trim().replace(/^["']|["']$/g, "");
          if (strVal.length > 0) {
            return strVal;
          }
        }
      }
    }
  }
  return undefined;
}

const URL_RE = /https?:\/\/[^\s,]+/gi;
const MAPS_RE = /google\.com\/maps|maps\.google/i;
const OWNER_PREFIX_RE = /^by\s+owner\s*[,:]?\s*/i;
const CSV_JUNK_RE = /^["',\s]+|["',\s]+$/g;
const EXCESSIVE_COMMAS_RE = /,{2,}/g;
const EXCESSIVE_QUOTES_RE = /"{2,}|'{2,}/g;
const LONG_UNBROKEN_RE = /\S{80,}/;

const COORDINATE_RE = /^-?\d+\.\d{3,}$/;
const MOSTLY_NUMERIC_RE = /^[\d\s.,()+\-/]+$/;
const ATTRIBUTE_LABELS: string[] = [
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

export interface ClassifiedName {
  classification: NameClassification;
  cleanedName: string | null;
  reason: string | null;
}

export function classifyAgencyName(name: string, websiteUrl?: string | null): ClassifiedName {
  if (!name || name.trim().length === 0) {
    return { classification: "junk", cleanedName: null, reason: "empty_name" };
  }

  const trimmed = name.trim();

  if (COORDINATE_RE.test(trimmed)) {
    return { classification: "junk", cleanedName: null, reason: "coordinate_like_number" };
  }

  if (MOSTLY_NUMERIC_RE.test(trimmed) && trimmed.length < 20) {
    return { classification: "junk", cleanedName: null, reason: "mostly_numeric" };
  }

  URL_RE.lastIndex = 0;
  if (/^https?:\/\//i.test(trimmed) && !trimmed.includes(" ")) {
    return { classification: "junk", cleanedName: null, reason: "url_only_string" };
  }

  if (MAPS_RE.test(trimmed)) {
    return { classification: "junk", cleanedName: null, reason: "google_maps_fragment" };
  }

  const lower = trimmed.toLowerCase();
  for (const label of ATTRIBUTE_LABELS) {
    if (lower === label || lower.startsWith("identifies as ")) {
      return { classification: "junk", cleanedName: null, reason: `attribute_label:${label}` };
    }
  }

  if (GENERIC_PLACEHOLDERS.includes(lower)) {
    return { classification: "junk", cleanedName: null, reason: `generic_placeholder:${lower}` };
  }

  if (trimmed.length < 2) {
    return { classification: "junk", cleanedName: null, reason: "too_short" };
  }

  if (LONG_UNBROKEN_RE.test(trimmed)) {
    return { classification: "junk", cleanedName: null, reason: "long_unbroken_string" };
  }

  if (EXCESSIVE_COMMAS_RE.test(trimmed) || EXCESSIVE_QUOTES_RE.test(trimmed)) {
    return { classification: "suspicious", cleanedName: trimmed, reason: "excessive_punctuation" };
  }
  if ((trimmed.match(/,/g) || []).length >= 4) {
    return { classification: "suspicious", cleanedName: trimmed, reason: "many_commas" };
  }
  if ((trimmed.match(/["']/g) || []).length >= 4) {
    return { classification: "suspicious", cleanedName: trimmed, reason: "many_quotes" };
  }

  if (OWNER_PREFIX_RE.test(trimmed)) {
    return { classification: "suspicious", cleanedName: trimmed.replace(OWNER_PREFIX_RE, "").trim(), reason: "owner_prefix" };
  }

  URL_RE.lastIndex = 0;
  if (URL_RE.test(trimmed) && trimmed.length > 10) {
    const withoutUrl = trimmed.replace(/https?:\/\/[^\s,]+/gi, "").trim();
    if (withoutUrl.length >= 3) {
      return { classification: "suspicious", cleanedName: withoutUrl, reason: "name_contains_url" };
    }
    return { classification: "junk", cleanedName: null, reason: "url_dominated" };
  }

  return { classification: "valid", cleanedName: trimmed, reason: null };
}

function extractDomainBrand(url: string | undefined): string | null {
  if (!url) return null;
  try {
    let d = url.trim().toLowerCase();
    d = d.replace(/^https?:\/\/(www\.)?/i, "");
    d = d.replace(/\/.*$/, "").replace(/\?.*$/, "");
    if (!d || d.length < 4 || !d.includes(".")) return null;
    const brand = d.split(".")[0];
    if (brand.length < 2 || brand.length > 40) return null;
    if (/^\d+$/.test(brand)) return null;
    return brand.charAt(0).toUpperCase() + brand.slice(1);
  } catch {
    return null;
  }
}

export function sanitizeImportName(
  raw: string,
  websiteUrl?: string
): { name: string; wasCleaned: boolean; classification: NameClassification; reason: string | null } {
  if (!raw) {
    const fallback = extractDomainBrand(websiteUrl);
    return { name: fallback || "", wasCleaned: true, classification: "junk", reason: "empty_raw" };
  }

  let cleaned = raw;
  cleaned = cleaned.replace(CSV_JUNK_RE, "");
  cleaned = cleaned.replace(/\s+/g, " ").trim();

  if (cleaned.length > 80) {
    const cutPoint = cleaned.lastIndexOf(" ", 77);
    cleaned = cutPoint > 20 ? cleaned.substring(0, cutPoint) : cleaned.substring(0, 77);
    cleaned = cleaned.replace(/[,;|\s]+$/, "");
  }

  const result = classifyAgencyName(cleaned, websiteUrl);

  if (result.classification === "junk") {
    const fallback = extractDomainBrand(websiteUrl);
    if (fallback) {
      const fallbackCheck = classifyAgencyName(fallback);
      if (fallbackCheck.classification === "valid") {
        return { name: fallback, wasCleaned: true, classification: "junk", reason: result.reason };
      }
    }
    return { name: "", wasCleaned: true, classification: "junk", reason: result.reason };
  }

  if (result.classification === "suspicious" && result.cleanedName) {
    return { name: result.cleanedName, wasCleaned: result.cleanedName !== raw, classification: "suspicious", reason: result.reason };
  }

  return { name: cleaned, wasCleaned: cleaned !== raw, classification: "valid", reason: null };
}

export function normalizeRow(
  rawRow: Record<string, any>,
  fallbackStateSlug?: string
): CanonicalAgencyRow | null {
  const rawName = findValue(rawRow, NAME_ALIASES);
  if (!rawName) {
    return null;
  }

  const websiteUrl = findValue(rawRow, WEBSITE_ALIASES);
  const { name, classification, reason } = sanitizeImportName(rawName, websiteUrl);

  const canonical: CanonicalAgencyRow = {
    name,
    _nameClassification: classification,
    _nameReason: reason || undefined,
    website_url: findValue(rawRow, WEBSITE_ALIASES),
    phone: findValue(rawRow, PHONE_ALIASES),
    email: findValue(rawRow, EMAIL_ALIASES),
    city: findValue(rawRow, CITY_ALIASES),
    description: findValue(rawRow, DESCRIPTION_ALIASES),
    services: findValue(rawRow, SERVICES_ALIASES),
    primary_service: findValue(rawRow, PRIMARY_SERVICE_ALIASES),
    logo_url: findValue(rawRow, LOGO_ALIASES),
    state_slug: findValue(rawRow, STATE_ALIASES) || fallbackStateSlug,
    zip_code: findValue(rawRow, ZIP_ALIASES),
    full_address: findValue(rawRow, FULL_ADDRESS_ALIASES),
    street_address: findValue(rawRow, STREET_ADDRESS_ALIASES),
    keyword: findValue(rawRow, KEYWORD_ALIASES),
    facebook_url: findValue(rawRow, FACEBOOK_ALIASES),
    twitter_url: findValue(rawRow, TWITTER_ALIASES),
    instagram_url: findValue(rawRow, INSTAGRAM_ALIASES),
    youtube_url: findValue(rawRow, YOUTUBE_ALIASES),
    linkedin_url: findValue(rawRow, LINKEDIN_ALIASES),
    tiktok_url: findValue(rawRow, TIKTOK_ALIASES),
    pinterest_url: findValue(rawRow, PINTEREST_ALIASES),
    plus_code: findValue(rawRow, PLUS_CODE_ALIASES),
    maps_url: findValue(rawRow, MAPS_URL_ALIASES),
    latitude: findValue(rawRow, LATITUDE_ALIASES),
    longitude: findValue(rawRow, LONGITUDE_ALIASES),
  };

  return canonical;
}

export function normalizeRows(
  rawRows: Record<string, any>[],
  fallbackStateSlug?: string
): CanonicalAgencyRow[] {
  const normalized: CanonicalAgencyRow[] = [];
  for (const raw of rawRows) {
    const row = normalizeRow(raw, fallbackStateSlug);
    if (row) {
      normalized.push(row);
    }
  }
  return normalized;
}

export function detectHeaders(rawRow: Record<string, any>): string[] {
  return Object.keys(rawRow).map((k) => normalizeKey(k));
}

export function getAcceptedNameAliases(): string[] {
  return [...NAME_ALIASES];
}
