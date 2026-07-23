// Shared traffic-source classifier for admin analytics surfaces (currently
// admin-visitor-journey). Turns a raw utm_source or referrer into a short,
// human-readable label. Deliberately permissive/best-effort — this is for
// display in an admin table, not for attribution logic that revenue
// decisions hinge on.

const UTM_SOURCE_LABELS: Record<string, string> = {
  google: "Google",
  youtube: "YouTube",
  tiktok: "TikTok",
  instagram: "Instagram",
  ig: "Instagram",
  facebook: "Facebook",
  fb: "Facebook",
  email: "Email",
  newsletter: "Email",
};

// Ordered so a more specific substring (e.g. "l.instagram.com") is checked
// before a shorter one that could otherwise mis-tag it.
const REFERRER_DOMAIN_LABELS: Array<{ match: string; label: string }> = [
  { match: "google.", label: "Google" },
  { match: "youtube.com", label: "YouTube" },
  { match: "tiktok.com", label: "TikTok" },
  { match: "l.instagram.com", label: "Instagram" },
  { match: "instagram.com", label: "Instagram" },
  { match: "l.facebook.com", label: "Facebook" },
  { match: "facebook.com", label: "Facebook" },
  { match: "t.co", label: "Twitter / X" },
  { match: "twitter.com", label: "Twitter / X" },
  { match: "x.com", label: "Twitter / X" },
];

function capitalize(value: string): string {
  if (!value) return value;
  return value.charAt(0).toUpperCase() + value.slice(1);
}

export function classifyTrafficSource(utmSource: string | null, referrer: string | null): string {
  if (utmSource && utmSource.trim()) {
    const normalized = utmSource.trim().toLowerCase();
    const label = UTM_SOURCE_LABELS[normalized];
    if (label) return label;
    return capitalize(utmSource.trim());
  }

  if (referrer && referrer.trim()) {
    try {
      const hostname = new URL(referrer).hostname.toLowerCase();
      for (const { match, label } of REFERRER_DOMAIN_LABELS) {
        if (hostname.includes(match)) return label;
      }
      return hostname;
    } catch {
      // Not a parseable URL — fall through to Direct / Unknown.
    }
  }

  return "Direct / Unknown";
}
