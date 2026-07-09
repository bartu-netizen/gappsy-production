/**
 * Scanner Signal Detector
 *
 * Evaluates evidence that the current session is an automated scanner, email
 * security gateway, headless browser, or bot — rather than a real human.
 *
 * Evaluates at event-fire time. Never throws. Never blocks.
 *
 * Intentionally NOT checked as scanner evidence:
 *   - Absence of visibility changes (focused single-tab sessions are normal)
 *   - Auto-scene progression
 *   - JS timer completions
 *   - Auto-CTA reveal events
 *   - Cinematic transition events
 *   - Replay auto-continue events
 */

import type { HumanSignals } from './humanSignalCollector';

export interface ScannerSignals {
  session_age_ms: number;
  no_human_signals: boolean;
  ua_scanner_pattern: boolean;
  ua_pattern_matched: string | null;
  instant_fire: boolean;
  no_mobile_inertia: boolean;
  uniform_scroll_pattern: boolean;
  suspiciously_fast_commercial: boolean;
}

const SCANNER_UA_PATTERNS: Array<{ pattern: RegExp; label: string }> = [
  { pattern: /Microsoft.*Security/i,      label: 'microsoft_safelinks' },
  { pattern: /SafeLinks/i,                label: 'safelinks' },
  { pattern: /Barracuda/i,                label: 'barracuda' },
  { pattern: /Proofpoint/i,               label: 'proofpoint' },
  { pattern: /Mimecast/i,                 label: 'mimecast' },
  { pattern: /HeadlessChrome/i,           label: 'headless_chrome' },
  { pattern: /PhantomJS/i,                label: 'phantomjs' },
  { pattern: /Googlebot/i,                label: 'googlebot' },
  { pattern: /LinkedInBot/i,              label: 'linkedin_bot' },
  { pattern: /facebookexternalhit/i,      label: 'facebook_scraper' },
  { pattern: /Slackbot/i,                 label: 'slackbot' },
  { pattern: /Twitterbot/i,               label: 'twitterbot' },
  { pattern: /preview.*bot/i,             label: 'preview_bot' },
  { pattern: /\bpreview\b/i,              label: 'preview_agent' },
  { pattern: /crawler/i,                  label: 'crawler' },
  { pattern: /spider/i,                   label: 'spider' },
];

const INSTANT_FIRE_THRESHOLD_MS = 2000;
const FAST_COMMERCIAL_THRESHOLD_MS = 3000;
const UNIFORM_SCROLL_VARIANCE_MAX = 1;

function detectUA(): { matched: boolean; label: string | null } {
  if (typeof navigator === 'undefined') return { matched: false, label: null };
  const ua = navigator.userAgent || '';
  for (const { pattern, label } of SCANNER_UA_PATTERNS) {
    if (pattern.test(ua)) return { matched: true, label };
  }
  return { matched: false, label: null };
}

function isTouchDevice(): boolean {
  if (typeof window === 'undefined') return false;
  return 'ontouchstart' in window || navigator.maxTouchPoints > 0;
}

export function detect(signals: HumanSignals): ScannerSignals {
  const sessionAgeMs = Date.now() - signals.session_start_ms;

  const hasAnyInput =
    signals.first_mouse_move_ms !== null ||
    signals.first_scroll_ms !== null ||
    signals.first_touch_ms !== null ||
    signals.first_pointer_ms !== null;

  const noHumanSignals = !hasAnyInput;

  const { matched: uaScannerPattern, label: uaPatternMatched } = detectUA();

  // Fires within 2s of page load with zero input signals
  const instantFire = sessionAgeMs < INSTANT_FIRE_THRESHOLD_MS && noHumanSignals;

  // On a touch device with no inertial scroll detected
  const noMobileInertia = isTouchDevice() && !signals.inertial_scroll_detected;

  // Scroll deltas all nearly identical — automated scroll
  const uniformScrollPattern =
    signals.natural_scroll_variance !== null &&
    signals.natural_scroll_variance < UNIFORM_SCROLL_VARIANCE_MAX;

  // Commercial interaction happened unrealistically fast after first input
  const suspiciouslyFastCommercial =
    signals.first_input_ms !== null &&
    signals.first_commercial_interaction_ms !== null &&
    signals.first_commercial_interaction_ms - signals.first_input_ms < FAST_COMMERCIAL_THRESHOLD_MS;

  return {
    session_age_ms: sessionAgeMs,
    no_human_signals: noHumanSignals,
    ua_scanner_pattern: uaScannerPattern,
    ua_pattern_matched: uaPatternMatched,
    instant_fire: instantFire,
    no_mobile_inertia: noMobileInertia,
    uniform_scroll_pattern: uniformScrollPattern,
    suspiciously_fast_commercial: suspiciouslyFastCommercial,
  };
}
