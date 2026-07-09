import { getSignals } from './humanSignalCollector';
import { detect as detectScanner } from './scannerSignalDetector';
import { scoreSession } from './confidenceScorer';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

/**
 * Reliable analytics event transport — lossless by design.
 *
 * Attempt 1: fetch() with keepalive:true — survives page navigation,
 *            redirects, modal transitions, and checkout opens.
 * Attempt 2: fetch() without keepalive (plain retry with auth headers).
 *            Used when keepalive quota is exceeded (~64 KB in Chromium).
 * Attempt 3: navigator.sendBeacon() — fire-and-forget, no auth header.
 *            Works only when the edge function allows anonymous calls.
 * Final:     console.warn with endpoint + event label so failures are
 *            visible during debugging without blocking the UI.
 *
 * Automatically enriches every payload with confidence classification fields:
 *   intent_level, confidence_score, scanner_signals, human_signals,
 *   timing_signals, confidence_reasoning
 */
export function reliablePost(
  endpoint: string,
  payload: Record<string, unknown>,
  eventLabel?: string,
): void {
  const url = `${SUPABASE_URL}/functions/v1/${endpoint}`;
  const label = eventLabel ?? endpoint;

  // Build confidence enrichment — never throws
  let confidenceFields: Record<string, unknown> = {};
  try {
    if (typeof window !== 'undefined') {
      const human = getSignals();
      const scanner = detectScanner(human);
      const result = scoreSession(human, scanner);
      confidenceFields = {
        intent_level: result.intent_level,
        confidence_score: result.confidence_score,
        confidence_reasoning: result.confidence_reasoning,
        scanner_signals: {
          ua_scanner_pattern: scanner.ua_scanner_pattern,
          ua_pattern_matched: scanner.ua_pattern_matched,
          instant_fire: scanner.instant_fire,
          no_human_signals: scanner.no_human_signals,
          no_mobile_inertia: scanner.no_mobile_inertia,
          uniform_scroll_pattern: scanner.uniform_scroll_pattern,
          suspiciously_fast_commercial: scanner.suspiciously_fast_commercial,
          session_age_ms: scanner.session_age_ms,
        },
        human_signals: {
          first_mouse_move_ms: human.first_mouse_move_ms,
          first_scroll_ms: human.first_scroll_ms,
          first_click_ms: human.first_click_ms,
          first_touch_ms: human.first_touch_ms,
          manual_click_count: human.manual_click_count,
          cta_hover_count: human.cta_hover_count,
          active_visible_ms: human.active_visible_ms,
          visibility_changes: human.visibility_changes,
          tap_count: human.tap_count,
          swipe_count: human.swipe_count,
          inertial_scroll_detected: human.inertial_scroll_detected,
          keyboard_focus_count: human.keyboard_focus_count,
          input_characters_typed: human.input_characters_typed,
          natural_scroll_variance: human.natural_scroll_variance,
        },
        timing_signals: {
          session_start_ms: human.session_start_ms,
          first_input_ms: human.first_input_ms,
          first_commercial_interaction_ms: human.first_commercial_interaction_ms,
          first_cta_click_ms: human.first_cta_click_ms,
          thinking_time_to_first_input_ms: human.thinking_time_to_first_input_ms,
          thinking_time_first_input_to_cta_ms: human.thinking_time_first_input_to_cta_ms,
          thinking_time_first_scroll_to_pricing_ms: human.thinking_time_first_scroll_to_pricing_ms,
          thinking_time_activation_view_to_cta_ms: human.thinking_time_activation_view_to_cta_ms,
        },
      };
    }
  } catch {
    // confidence enrichment failure is never fatal
  }

  const enrichedPayload = { ...payload, ...confidenceFields };
  const body = JSON.stringify(enrichedPayload);

  const headers = {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
  };

  fetch(url, { method: 'POST', headers, body, keepalive: true })
    .catch(() => {
      return fetch(url, { method: 'POST', headers, body });
    })
    .catch(() => {
      if (typeof navigator !== 'undefined' && navigator.sendBeacon) {
        try {
          const sent = navigator.sendBeacon(url, new Blob([body], { type: 'application/json' }));
          if (sent) return;
        } catch {
          // beacon also failed — fall through to warning
        }
      }
      console.warn(`[tracking] "${label}" all delivery attempts failed`);
    });
}
