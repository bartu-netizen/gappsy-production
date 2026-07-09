function djb2(str: string): number {
  let h = 5381;
  for (let i = 0; i < str.length; i++) {
    h = ((h << 5) + h) ^ str.charCodeAt(i);
    h = h >>> 0;
  }
  return h;
}

const MIN_MISSED = 7;
const MAX_MISSED = 18;
const MIN_ANCHOR_OFFSET_H = 2;
const MAX_ANCHOR_OFFSET_H = 72;

export interface DeterministicFallback {
  agencyName: string;
  missedCount: number;
  anchorMs: number;
  isDeterministic: true;
}

export function buildDeterministicFallback(slug: string): DeterministicFallback {
  const h2 = djb2(slug + ':missed');
  const h3 = djb2(slug + ':anchor');

  const missedCount = MIN_MISSED + (h2 % (MAX_MISSED - MIN_MISSED + 1));
  const anchorOffsetH = MIN_ANCHOR_OFFSET_H + (h3 % (MAX_ANCHOR_OFFSET_H - MIN_ANCHOR_OFFSET_H + 1));
  const anchorMs = Date.now() - anchorOffsetH * 3_600_000;

  return {
    agencyName: formatSlugAsName(slug),
    missedCount,
    anchorMs,
    isDeterministic: true,
  };
}

function formatSlugAsName(slug: string): string {
  return slug
    .split('-')
    .map(w => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
}

export const REPLAY_MAX_HOURS_AGO = 72;
// Minimum display floor for public "most recent request" — keeps urgency credible
export const PUBLIC_REQUEST_MIN_DISPLAY_HOURS = 3;

export function deriveHoursAgo(anchorMs: number): number {
  const raw = Math.max(PUBLIC_REQUEST_MIN_DISPLAY_HOURS, Math.floor((Date.now() - anchorMs) / 3_600_000));
  return Math.min(raw, REPLAY_MAX_HOURS_AGO);
}
