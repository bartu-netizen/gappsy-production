const JUNK_DOMAIN_PATTERNS = [
  'google.com/maps',
  'maps.google',
  'goo.gl/maps',
  'yelp.com',
  'facebook.com',
  'linkedin.com',
  'instagram.com',
  'twitter.com',
  'x.com/',
  'yellowpages.com',
  'bbb.org',
  'clutch.co',
  'trustpilot.com',
];

export function cleanAgencyDomain(raw: string | null | undefined): string | null {
  if (!raw) return null;
  const lower = raw.toLowerCase();
  if (lower.length > 120) return null;
  for (const pattern of JUNK_DOMAIN_PATTERNS) {
    if (lower.includes(pattern)) return null;
  }
  try {
    const url = new URL(raw.startsWith('http') ? raw : `https://${raw}`);
    const hostname = url.hostname.replace(/^www\./, '');
    return hostname.length > 0 && hostname.length < 80 ? hostname : null;
  } catch {
    const trimmed = raw.replace(/^https?:\/\//, '').replace(/^www\./, '').replace(/\/.*$/, '').trim();
    return trimmed.length > 0 && trimmed.length < 80 ? trimmed : null;
  }
}

export function normalizeUrl(value: string): string | null {
  if (!value || !value.trim()) {
    return null;
  }

  let url = value.trim();

  // Remove trailing slashes from input
  url = url.replace(/\/+$/, '');

  // If missing protocol, add https://
  if (!url.startsWith("http://") && !url.startsWith("https://")) {
    url = "https://" + url;
  }

  // Extract hostname (without protocol)
  let hostname = url.replace("https://", "").replace("http://", "").split('/')[0];

  // Basic validation - must have at least one dot
  if (!hostname.includes(".") || hostname.startsWith(".") || hostname.endsWith(".")) {
    return null;
  }

  // Split into parts to check if we need www.
  const parts = hostname.split(".");

  // If only 2 parts (e.g., gappsy.com), add www.
  if (parts.length === 2) {
    const protocol = url.startsWith("http://") ? "http://" : "https://";
    url = protocol + "www." + hostname + (url.substring(url.indexOf(hostname) + hostname.length) || '');
  }

  // Final validation using URL constructor
  try {
    const finalUrl = new URL(url);
    return finalUrl.href;
  } catch (e) {
    return null;
  }
}

export function isValidDomain(input: string): boolean {
  const normalized = normalizeUrl(input);
  return normalized !== null;
}

export function validateAndNormalizeUrl(input: string): { valid: boolean; url: string | null; error?: string } {
  if (!input || !input.trim()) {
    return {
      valid: false,
      url: null,
      error: 'Please enter a website address'
    };
  }

  const normalized = normalizeUrl(input);

  if (normalized === null) {
    return {
      valid: false,
      url: null,
      error: 'Please enter a valid website address (e.g., gappsy.com)'
    };
  }

  return {
    valid: true,
    url: normalized
  };
}
