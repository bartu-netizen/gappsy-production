/**
 * Human Signal Collector
 *
 * Passively observes actual user input device signals. Never modifies the DOM,
 * never blocks event propagation, never throws, never affects funnel UX.
 *
 * Auto-starts on first import in a browser context.
 */

export interface HumanSignals {
  // Desktop input
  first_mouse_move_ms: number | null;
  first_scroll_ms: number | null;
  first_click_ms: number | null;
  first_pointer_ms: number | null;
  manual_click_count: number;
  cta_hover_count: number;
  active_visible_ms: number;
  visibility_changes: number;

  // Mobile input
  first_touch_ms: number | null;
  tap_count: number;
  tap_cadence_ms: number | null;
  swipe_count: number;
  swipe_velocity_px_ms: number | null;
  inertial_scroll_detected: boolean;
  keyboard_focus_count: number;
  input_characters_typed: number;
  natural_scroll_variance: number | null;

  // Timing / thinking-time
  session_start_ms: number;
  first_input_ms: number | null;
  first_commercial_interaction_ms: number | null;
  first_cta_click_ms: number | null;
  thinking_time_to_first_input_ms: number | null;
  thinking_time_first_input_to_cta_ms: number | null;
  thinking_time_first_scroll_to_pricing_ms: number | null;
  thinking_time_activation_view_to_cta_ms: number | null;
}

interface TapEntry {
  startX: number;
  startY: number;
  startMs: number;
}

const SESSION_START = Date.now();
const MAX_SCROLL_SAMPLES = 60;

// Captured once at module evaluation time — before any tracking utility can create a new FSID.
// Used by confidenceScorer to correctly detect return visits.
export const HAD_EXISTING_FSID_AT_PAGE_LOAD: boolean = (() => {
  try {
    return !!localStorage.getItem('gappsy_fsid');
  } catch {
    return false;
  }
})();
const TAP_MAX_DISPLACEMENT = 20; // px — above this = swipe
const SWIPE_MIN_DISPLACEMENT = 30; // px

let initialized = false;

// State
let firstMouseMoveMs: number | null = null;
let firstScrollMs: number | null = null;
let firstClickMs: number | null = null;
let firstPointerMs: number | null = null;
let manualClickCount = 0;
let ctaHoverCount = 0;
let visibilityChanges = 0;

// Mobile
let firstTouchMs: number | null = null;
let tapCount = 0;
const tapIntervals: number[] = [];
let lastTapMs: number | null = null;
let swipeCount = 0;
const swipeVelocities: number[] = [];
let inertialScrollDetected = false;
let keyboardFocusCount = 0;
let inputCharactersTyped = 0;
const scrollDeltas: number[] = [];

// Active visible time tracking
let activeVisibleMs = 0;
let lastActiveStart: number | null = null;
let isVisible = true;

// Timing
let firstInputMs: number | null = null;
let firstCommercialMs: number | null = null;
let firstCtaClickMs: number | null = null;
let activationViewMs: number | null = null;

// Pending touch
let pendingTouch: TapEntry | null = null;
let lastScrollMs: number | null = null;
let scrollEndTimer: ReturnType<typeof setTimeout> | null = null;

function markFirstInput(): void {
  if (firstInputMs === null) firstInputMs = Date.now();
}

function recordScrollDelta(delta: number): void {
  if (scrollDeltas.length < MAX_SCROLL_SAMPLES) scrollDeltas.push(Math.abs(delta));
}

function stdDev(values: number[]): number | null {
  if (values.length < 3) return null;
  const mean = values.reduce((a, b) => a + b, 0) / values.length;
  const variance = values.reduce((s, v) => s + (v - mean) ** 2, 0) / values.length;
  return Math.sqrt(variance);
}

function startActiveTimer(): void {
  if (lastActiveStart === null && isVisible) {
    lastActiveStart = Date.now();
  }
}

function pauseActiveTimer(): void {
  if (lastActiveStart !== null) {
    activeVisibleMs += Date.now() - lastActiveStart;
    lastActiveStart = null;
  }
}

function isCTAElement(target: EventTarget | null): boolean {
  if (!target || !(target instanceof Element)) return false;
  const el = target.closest('button, [data-cta], a[href]');
  if (!el) return false;
  const text = (el.textContent || '').toLowerCase();
  return (
    text.includes('activate') ||
    text.includes('claim') ||
    text.includes('checkout') ||
    text.includes('get started') ||
    text.includes('continue') ||
    text.includes('select') ||
    text.includes('upgrade') ||
    el.hasAttribute('data-cta')
  );
}

function onMouseMove(): void {
  if (firstMouseMoveMs === null) {
    firstMouseMoveMs = Date.now() - SESSION_START;
    markFirstInput();
  }
  startActiveTimer();
}

function onPointerMove(): void {
  if (firstPointerMs === null) {
    firstPointerMs = Date.now() - SESSION_START;
    markFirstInput();
  }
}

function onScroll(e: Event): void {
  const now = Date.now();
  if (firstScrollMs === null) {
    firstScrollMs = now - SESSION_START;
    markFirstInput();
  }
  lastScrollMs = now;
  startActiveTimer();

  if (e instanceof WheelEvent) {
    recordScrollDelta(e.deltaY);
  }

  // Reset inertia detection timer
  if (scrollEndTimer !== null) clearTimeout(scrollEndTimer);
  scrollEndTimer = setTimeout(() => {
    scrollEndTimer = null;
  }, 300);
}

function onTouchStart(e: TouchEvent): void {
  const now = Date.now();
  if (firstTouchMs === null) {
    firstTouchMs = now - SESSION_START;
    markFirstInput();
  }
  startActiveTimer();

  const touch = e.changedTouches[0];
  if (touch) {
    pendingTouch = { startX: touch.clientX, startY: touch.clientY, startMs: now };
  }
}

function onTouchEnd(e: TouchEvent): void {
  if (!pendingTouch) return;
  const touch = e.changedTouches[0];
  if (!touch) { pendingTouch = null; return; }

  const dx = touch.clientX - pendingTouch.startX;
  const dy = touch.clientY - pendingTouch.startY;
  const displacement = Math.sqrt(dx * dx + dy * dy);
  const durationMs = Date.now() - pendingTouch.startMs;

  if (displacement < TAP_MAX_DISPLACEMENT) {
    // Tap
    tapCount++;
    const now = Date.now();
    if (lastTapMs !== null) tapIntervals.push(now - lastTapMs);
    lastTapMs = now;
  } else if (displacement >= SWIPE_MIN_DISPLACEMENT && durationMs > 0) {
    // Swipe
    swipeCount++;
    const velocity = displacement / durationMs;
    swipeVelocities.push(velocity);
  }

  pendingTouch = null;
}

function onTouchMove(e: TouchEvent): void {
  const touch = e.changedTouches[0];
  if (touch) recordScrollDelta(Math.abs(touch.clientY - (pendingTouch?.startY ?? touch.clientY)));

  // Detect scroll continuing after a touch — inertia indicator
  const now = Date.now();
  if (pendingTouch && now - pendingTouch.startMs > 150) {
    inertialScrollDetected = true;
  }
}

function onScrollAfterTouchEnd(): void {
  // If scrolling continues after last touchend, mark inertial
  if (lastScrollMs !== null) {
    const now = Date.now();
    if (now - lastScrollMs < 500) {
      inertialScrollDetected = true;
    }
  }
}

function onClick(e: MouseEvent): void {
  manualClickCount++;
  const now = Date.now();
  if (firstClickMs === null) firstClickMs = now - SESSION_START;
  if (firstCtaClickMs === null && isCTAElement(e.target)) {
    firstCtaClickMs = now;
  }
  startActiveTimer();
}

function onPointerEnter(e: PointerEvent): void {
  if (isCTAElement(e.target)) ctaHoverCount++;
}

function onFocus(e: FocusEvent): void {
  const tag = (e.target as HTMLElement)?.tagName?.toLowerCase();
  if (tag === 'input' || tag === 'textarea' || tag === 'select') {
    keyboardFocusCount++;
    markFirstInput();
  }
}

function onKeyDown(e: KeyboardEvent): void {
  const tag = (e.target as HTMLElement)?.tagName?.toLowerCase();
  if (tag === 'input' || tag === 'textarea') {
    if (!e.ctrlKey && !e.metaKey && !e.altKey && e.key.length === 1) {
      inputCharactersTyped++;
    }
  }
}

function onVisibilityChange(): void {
  visibilityChanges++;
  if (document.hidden) {
    isVisible = false;
    pauseActiveTimer();
  } else {
    isVisible = true;
    startActiveTimer();
  }
}

export function init(): void {
  if (initialized || typeof window === 'undefined') return;
  initialized = true;

  isVisible = !document.hidden;
  if (isVisible) lastActiveStart = Date.now();

  window.addEventListener('mousemove', onMouseMove, { passive: true });
  window.addEventListener('pointermove', onPointerMove, { passive: true });
  window.addEventListener('scroll', onScroll, { passive: true, capture: true });
  window.addEventListener('wheel', onScroll as EventListener, { passive: true });
  window.addEventListener('touchstart', onTouchStart, { passive: true });
  window.addEventListener('touchend', onTouchEnd, { passive: true });
  window.addEventListener('touchmove', onTouchMove, { passive: true });
  window.addEventListener('click', onClick, { passive: true, capture: true });
  window.addEventListener('pointerenter', onPointerEnter as EventListener, { passive: true, capture: true });
  window.addEventListener('focus', onFocus, { passive: true, capture: true });
  window.addEventListener('keydown', onKeyDown, { passive: true, capture: true });
  document.addEventListener('visibilitychange', onVisibilityChange, { passive: true });

  // Detect scroll continuing after touchend (inertial scroll on mobile)
  document.addEventListener('scroll', onScrollAfterTouchEnd, { passive: true, capture: true });
}

export function markCommercialInteraction(type: string): void {
  if (firstCommercialMs === null) firstCommercialMs = Date.now();

  // Allow callers to also record activation view timestamp
  if (type === 'activation_page_viewed' && activationViewMs === null) {
    activationViewMs = Date.now();
  }

  // Forward to confidence scorer's commercial marker registry
  try {
    // Dynamic import avoided — use a simple in-module registry exposed via callback
    if (_commercialMarkerCallback) _commercialMarkerCallback(type);
  } catch {
    // never throw
  }
}

// Callback wired by confidenceScorer on import
let _commercialMarkerCallback: ((type: string) => void) | null = null;
export function setCommercialMarkerCallback(cb: (type: string) => void): void {
  _commercialMarkerCallback = cb;
}

export function markActivationPageView(): void {
  if (activationViewMs === null) activationViewMs = Date.now();
}

export function getSignals(): HumanSignals {
  // Snapshot active time
  const snapshotActiveMs = activeVisibleMs + (lastActiveStart !== null ? Date.now() - lastActiveStart : 0);

  const tapCadence =
    tapIntervals.length >= 2
      ? tapIntervals.reduce((a, b) => a + b, 0) / tapIntervals.length
      : null;

  const swipeVelocityAvg =
    swipeVelocities.length > 0
      ? swipeVelocities.reduce((a, b) => a + b, 0) / swipeVelocities.length
      : null;

  const now = Date.now();
  const thinkingToFirstInput =
    firstInputMs !== null ? firstInputMs - SESSION_START : null;

  const thinkingFirstInputToCta =
    firstInputMs !== null && firstCtaClickMs !== null
      ? firstCtaClickMs - firstInputMs
      : null;

  const thinkingFirstScrollToPricing =
    firstScrollMs !== null && firstCommercialMs !== null
      ? firstCommercialMs - (SESSION_START + firstScrollMs)
      : null;

  const thinkingActivationToCta =
    activationViewMs !== null && firstCtaClickMs !== null
      ? firstCtaClickMs - activationViewMs
      : null;

  return {
    first_mouse_move_ms: firstMouseMoveMs,
    first_scroll_ms: firstScrollMs,
    first_click_ms: firstClickMs,
    first_pointer_ms: firstPointerMs,
    manual_click_count: manualClickCount,
    cta_hover_count: ctaHoverCount,
    active_visible_ms: snapshotActiveMs,
    visibility_changes: visibilityChanges,

    first_touch_ms: firstTouchMs,
    tap_count: tapCount,
    tap_cadence_ms: tapCadence,
    swipe_count: swipeCount,
    swipe_velocity_px_ms: swipeVelocityAvg,
    inertial_scroll_detected: inertialScrollDetected,
    keyboard_focus_count: keyboardFocusCount,
    input_characters_typed: inputCharactersTyped,
    natural_scroll_variance: stdDev(scrollDeltas),

    session_start_ms: SESSION_START,
    first_input_ms: firstInputMs,
    first_commercial_interaction_ms: firstCommercialMs,
    first_cta_click_ms: firstCtaClickMs,
    thinking_time_to_first_input_ms: thinkingToFirstInput,
    thinking_time_first_input_to_cta_ms: thinkingFirstInputToCta,
    thinking_time_first_scroll_to_pricing_ms: thinkingFirstScrollToPricing,
    thinking_time_activation_view_to_cta_ms: thinkingActivationToCta,
  };
}

// Auto-start
init();
