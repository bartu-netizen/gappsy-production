/**
 * Confidence Scorer
 *
 * Combines HumanSignals and ScannerSignals into a confidence_score and
 * intent_level classification, plus a structured confidence_reasoning object
 * for debugging and tuning.
 *
 * Scoring rules:
 *   - Only actual user input device signals contribute to the score
 *   - Page loads, auto-scene progression, JS timer completions, cinematic
 *     transitions, and auto-CTA reveals are explicitly excluded and contribute 0
 *
 * Thresholds (conservative rollout — tighten once production data is available):
 *   score < 0   → scanner
 *   0 – 49      → possible_human
 *   50+         → verified_human
 *
 * Threshold constants are named exports so they can be tightened with a single
 * config change without touching scoring logic.
 */

import type { HumanSignals } from './humanSignalCollector';
import { setCommercialMarkerCallback, HAD_EXISTING_FSID_AT_PAGE_LOAD } from './humanSignalCollector';
import type { ScannerSignals } from './scannerSignalDetector';

export type IntentLevel = 'scanner' | 'possible_human' | 'verified_human';

export interface ConfidenceReasoning {
  positive: string[];
  negative: string[];
}

export interface ConfidenceResult {
  confidence_score: number;
  intent_level: IntentLevel;
  confidence_reasoning: ConfidenceReasoning;
}

// Conservative rollout thresholds — adjust here when ready to tighten
export const THRESHOLD_SCANNER = 0;
export const THRESHOLD_VERIFIED = 50;

function classifyScore(score: number): IntentLevel {
  if (score < THRESHOLD_SCANNER) return 'scanner';
  if (score >= THRESHOLD_VERIFIED) return 'verified_human';
  return 'possible_human';
}

export function scoreSession(human: HumanSignals, scanner: ScannerSignals): ConfidenceResult {
  const positive: string[] = [];
  const negative: string[] = [];
  let score = 0;

  // ── Negative signals ──────────────────────────────────────────────────────

  if (scanner.ua_scanner_pattern) {
    score -= 50;
    negative.push('ua_scanner_pattern');
  }

  if (scanner.instant_fire) {
    score -= 35;
    negative.push('instant_fire_no_input');
  }

  if (scanner.no_human_signals) {
    score -= 15;
    negative.push('no_human_signals');
  }

  if (scanner.uniform_scroll_pattern) {
    score -= 15;
    negative.push('uniform_scroll_pattern');
  }

  if (scanner.suspiciously_fast_commercial) {
    score -= 20;
    negative.push('suspiciously_fast_commercial');
  }

  if (scanner.no_mobile_inertia) {
    score -= 10;
    negative.push('no_mobile_inertia');
  }

  // ── Positive signals — human presence ────────────────────────────────────

  if (human.first_mouse_move_ms !== null || human.first_scroll_ms !== null) {
    score += 15;
    positive.push('mouse_or_scroll_present');
  }

  if (human.first_touch_ms !== null) {
    score += 15;
    positive.push('touch_present');
  }

  if (human.inertial_scroll_detected) {
    score += 15;
    positive.push('inertial_scroll');
  }

  if (human.natural_scroll_variance !== null && human.natural_scroll_variance > 5) {
    score += 10;
    positive.push('natural_scroll_variance');
  }

  if (human.tap_count >= 2 && human.tap_cadence_ms !== null) {
    score += 10;
    positive.push('tap_cadence');
  }

  if (human.swipe_count >= 1) {
    score += 10;
    positive.push('swipe_detected');
  }

  if (human.keyboard_focus_count >= 1 || human.input_characters_typed >= 1) {
    score += 10;
    positive.push('keyboard_input');
  }

  if (human.active_visible_ms >= 10_000) {
    score += 10;
    positive.push('active_visible_10s');
  }

  if (human.active_visible_ms >= 30_000) {
    score += 10;
    positive.push('active_visible_30s');
  }

  if (human.visibility_changes >= 1) {
    score += 5;
    positive.push('visibility_change');
  }

  // Return visit — FSID already existed in localStorage before this page load
  if (isReturnVisit()) {
    score += 20;
    positive.push('return_visit');
  }

  // ── Positive signals — commercial intent ──────────────────────────────────

  if (human.manual_click_count >= 1 && human.first_cta_click_ms !== null) {
    score += 15;
    positive.push('manual_cta_click');
  }

  if (human.cta_hover_count >= 1) {
    score += 10;
    positive.push('cta_hover');
  }

  // Thinking time signals — measured in absolute ms
  const thinkingToFirstInput = human.thinking_time_to_first_input_ms;
  const thinkingToCta = human.thinking_time_first_input_to_cta_ms;
  const thinkingToPricing = human.thinking_time_first_scroll_to_pricing_ms;

  if (thinkingToFirstInput !== null && thinkingToFirstInput > 4_000) {
    score += 10;
    positive.push('thinking_time_first_input');
  }

  if (thinkingToCta !== null && thinkingToCta > 8_000) {
    score += 15;
    positive.push('thinking_time_to_cta');
  }

  if (thinkingToPricing !== null && thinkingToPricing > 5_000) {
    score += 15;
    positive.push('thinking_time_to_pricing');
  }

  // Commercial interaction markers (set by markCommercialInteraction)
  const comm = human.first_commercial_interaction_ms;
  if (comm !== null && !scanner.suspiciously_fast_commercial) {
    // Pricing / top25 / upgrade
    if (hasCommercialMarker('pricing_selection')) {
      score += 25;
      positive.push('pricing_interaction');
    }
    if (hasCommercialMarker('top25_selection')) {
      score += 25;
      positive.push('top25_selection');
    }
    if (hasCommercialMarker('upgrade_selection')) {
      score += 25;
      positive.push('upgrade_selection');
    }
    if (hasCommercialMarker('checkout_open')) {
      score += 35;
      positive.push('checkout_open');
    }
    if (hasCommercialMarker('stripe_checkout')) {
      score += 40;
      positive.push('stripe_checkout_interaction');
    }
  }

  return {
    confidence_score: score,
    intent_level: classifyScore(score),
    confidence_reasoning: { positive, negative },
  };
}

// ── Commercial interaction registry ─────────────────────────────────────────
// Populated by humanSignalCollector.markCommercialInteraction() via callback

const commercialMarkers = new Set<string>();

export function registerCommercialMarker(type: string): void {
  commercialMarkers.add(type);
}

function hasCommercialMarker(type: string): boolean {
  return commercialMarkers.has(type);
}

// Wire callback once registry function is defined
setCommercialMarkerCallback(registerCommercialMarker);

// ── Return visit detection ────────────────────────────────────────────────────
// Uses the snapshot captured at module evaluation time in humanSignalCollector,
// before any tracking utility could create a new FSID for this page load.

function isReturnVisit(): boolean {
  return HAD_EXISTING_FSID_AT_PAGE_LOAD;
}
