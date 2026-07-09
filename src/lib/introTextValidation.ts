export interface ValidationResult {
  valid: boolean;
  error?: string;
}

const FORBIDDEN_WORDS = [
  'gok',
  'gokautomaat',
  'gambling',
  'porn',
  'pornography',
  'sex',
];

const URL_PATTERNS = [
  /https?:\/\/[^\s]+/gi,
  /www\.[^\s]+/gi,
  /[a-z0-9.-]+\.[a-z]{2,}(?:\/[^\s]*)?\b/gi,
];

export function validateIntroText(text: string): ValidationResult {
  if (!text || !text.trim()) {
    return { valid: false, error: 'Intro text is required.' };
  }

  const trimmed = text.trim().toLowerCase();

  for (const word of FORBIDDEN_WORDS) {
    if (trimmed.includes(word.toLowerCase())) {
      return {
        valid: false,
        error: `Your intro contains restricted words. Please update the text and try again.`,
      };
    }
  }

  for (const pattern of URL_PATTERNS) {
    if (pattern.test(text)) {
      return {
        valid: false,
        error: `Please remove website links from the intro text.`,
      };
    }
  }

  return { valid: true };
}

export function sanitizeIntroText(text: string): string {
  if (!text) return text;
  text = text.replace(/<a\s[^>]*>(.*?)<\/a>/gi, '$1');
  text = text.replace(/\bhttps?:\/\/\S+|\bwww\.\S+/gi, '');
  text = text.replace(/\b[a-z0-9.-]+\.[a-z]{2,}\/?\S*/gi, '');
  return text.replace(/\s{2,}/g, ' ').trim();
}

export function validateWebsiteUrl(url: string): ValidationResult {
  if (!url || !url.trim()) {
    return { valid: true };
  }

  const trimmed = url.trim();

  const urlPattern = /^(https?:\/\/)?(www\.)?[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z]{2,})+([\/\w\-._~:?#[\]@!$&'()*+,;=]*)?$/i;

  if (!urlPattern.test(trimmed)) {
    return {
      valid: false,
      error: 'Please enter a valid website URL (e.g., example.com or https://example.com).',
    };
  }

  return { valid: true };
}
