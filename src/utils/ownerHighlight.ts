let activeHighlightedElement: HTMLElement | null = null;
let activeHighlightedAgencyId: string | null = null;
let highlightTimeoutId: ReturnType<typeof setTimeout> | null = null;

interface ScrollRetryOptions {
  maxRetries?: number;
  retryIntervalMs?: number;
  containerId?: string;
  onFound?: (el: HTMLElement) => void;
}

const SAFE_TOP_PADDING = 16;
const SAFE_BOTTOM_PADDING = 16;
const BOTTOM_CUSHION = 6;

function getBannerBottom(): number {
  const banner = document.getElementById('owner-preview-banner');
  return banner ? banner.getBoundingClientRect().bottom : 96;
}

function getSafeBounds(): { safeTop: number; safeBottom: number } {
  const safeTop = getBannerBottom() + SAFE_TOP_PADDING;
  const safeBottom = window.innerHeight - SAFE_BOTTOM_PADDING;
  return { safeTop, safeBottom };
}

function getOwnerOffset(): number {
  const banner = document.getElementById('owner-preview-banner');
  const bannerH = banner?.getBoundingClientRect().height ?? 96;
  return bannerH + 48;
}

function isElementVisibleForOwnerPreview(el: HTMLElement): boolean {
  if (!el.isConnected) return false;

  const rect = el.getBoundingClientRect();
  if (rect.height <= 0) return false;

  const { safeTop, safeBottom } = getSafeBounds();
  const safeAreaHeight = safeBottom - safeTop;

  if (rect.height <= safeAreaHeight) {
    if (rect.top < safeTop) return false;
    if (rect.bottom > safeBottom) return false;
    return true;
  }

  if (rect.top < safeTop - 2) return false;
  if (rect.top > safeTop + 24) return false;

  const visibleTop = Math.max(rect.top, safeTop);
  const visibleBottom = Math.min(rect.bottom, safeBottom);
  const visiblePortion = visibleBottom - visibleTop;
  if (visiblePortion < safeAreaHeight * 0.9) return false;

  return true;
}

function findScrollableParent(el: HTMLElement): HTMLElement {
  let cur: HTMLElement | null = el.parentElement;

  while (cur && cur !== document.body && cur !== document.documentElement) {
    const style = window.getComputedStyle(cur);
    const overflowY = style.overflowY;
    const isScrollable =
      (overflowY === 'auto' || overflowY === 'scroll') &&
      cur.scrollHeight > cur.clientHeight;

    if (isScrollable) return cur;
    cur = cur.parentElement;
  }

  return (document.scrollingElement as HTMLElement) || document.documentElement;
}

function findAgencyEl(idRaw: string, container?: HTMLElement | null): HTMLElement | null {
  const id = String(idRaw ?? '').trim().toLowerCase();
  const root: Document | HTMLElement = container ?? document;

  const byDomId = document.getElementById(`agency-${idRaw}`) as HTMLElement | null;
  if (byDomId) return byDomId;

  const exact =
    (root.querySelector?.(`[data-owner-agency-id="${idRaw}"]`) as HTMLElement | null) ||
    (root.querySelector?.(`[data-agency-id="${idRaw}"]`) as HTMLElement | null) ||
    (root.querySelector?.(`#agency-${idRaw}`) as HTMLElement | null);

  if (exact) return exact;

  const candidates = Array.from(
    root.querySelectorAll?.('[data-owner-agency-id], [data-agency-id], [id^="agency-"]') ?? []
  ) as HTMLElement[];

  for (const el of candidates) {
    const owner = String(el.getAttribute('data-owner-agency-id') ?? '').trim().toLowerCase();
    const aid = String(el.getAttribute('data-agency-id') ?? '').trim().toLowerCase();
    const dom = String(el.id?.startsWith('agency-') ? el.id.replace(/^agency-/, '') : '').trim().toLowerCase();
    if (owner === id || aid === id || dom === id) return el;
  }

  return null;
}

function isValidElement(el: HTMLElement): boolean {
  if (!el.isConnected) return false;
  const rect = el.getBoundingClientRect();
  return rect.height > 0;
}

function scrollElementIntoView(el: HTMLElement): void {
  const offset = getOwnerOffset();
  const parent = findScrollableParent(el);

  const isDocScroller =
    parent === document.documentElement ||
    parent === document.body ||
    parent === (document.scrollingElement as HTMLElement | null);

  if (isDocScroller) {
    el.scrollIntoView({ block: 'start', behavior: 'auto' });
    window.scrollBy(0, -offset);
    return;
  }

  const parentRect = parent.getBoundingClientRect();
  const elRect = el.getBoundingClientRect();
  const topWithinParent = (elRect.top - parentRect.top) + parent.scrollTop;
  const targetY = Math.max(0, topWithinParent - offset);

  parent.scrollTop = targetY;

  requestAnimationFrame(() => {
    const newParentRect = parent.getBoundingClientRect();
    const newElRect = el.getBoundingClientRect();
    const newTopWithin = (newElRect.top - newParentRect.top) + parent.scrollTop;
    const recalcTarget = Math.max(0, newTopWithin - offset);
    if (Math.abs(parent.scrollTop - recalcTarget) > 8) {
      parent.scrollTop = recalcTarget;
    }
  });
}

function correctScrollDelta(el: HTMLElement): void {
  const rect = el.getBoundingClientRect();
  const { safeTop, safeBottom } = getSafeBounds();
  const safeAreaHeight = safeBottom - safeTop;

  let delta = 0;

  if (rect.height <= safeAreaHeight) {
    if (rect.top < safeTop) {
      delta = rect.top - safeTop;
    } else if (rect.bottom > safeBottom - BOTTOM_CUSHION) {
      delta = rect.bottom - (safeBottom - BOTTOM_CUSHION);
    }
  } else {
    delta = rect.top - safeTop;
  }

  if (Math.abs(delta) <= 2) return;

  const parent = findScrollableParent(el);
  const isDocScroller =
    parent === document.documentElement ||
    parent === document.body ||
    parent === (document.scrollingElement as HTMLElement | null);

  if (isDocScroller) {
    window.scrollBy(0, delta);
  } else {
    parent.scrollTop += delta;
  }
}

function settleAndVerify(
  el: HTMLElement,
  onSettled: () => void,
  onFail: () => void,
  correctionAttempt = 0
): void {
  const MAX_CORRECTIONS = 3;

  requestAnimationFrame(() => {
    setTimeout(() => {
      if (isElementVisibleForOwnerPreview(el)) {
        onSettled();
        return;
      }

      if (correctionAttempt >= MAX_CORRECTIONS) {
        onFail();
        return;
      }

      correctScrollDelta(el);

      settleAndVerify(el, onSettled, onFail, correctionAttempt + 1);
    }, 120);
  });
}

export function scrollToAgencyWithRetry(
  agencyId: string,
  options: ScrollRetryOptions = {}
): boolean {
  const { maxRetries = 60, retryIntervalMs = 150, containerId, onFound } = options;
  let retries = 0;

  const attemptScroll = () => {
    const container = containerId ? document.getElementById(containerId) : null;

    const el =
      findAgencyEl(agencyId, container) ||
      findAgencyEl(agencyId, null);

    if (el && isValidElement(el)) {
      scrollElementIntoView(el);

      settleAndVerify(
        el,
        () => { onFound?.(el); },
        () => {
          retries++;
          if (retries < maxRetries) {
            setTimeout(attemptScroll, retryIntervalMs);
          } else {
            console.warn(`[OwnerScroll] Element found but not positioned correctly for agency ${agencyId} after ${maxRetries} retries`);
          }
        }
      );

      return true;
    }

    retries++;
    if (retries < maxRetries) {
      setTimeout(attemptScroll, retryIntervalMs);
    } else {
      console.warn(`[OwnerScroll] Could not find element for agency ${agencyId} after ${maxRetries} retries`);
    }
    return false;
  };

  return attemptScroll();
}

// Native scroll for the owner-preview "Scroll to my listing" action.
// Uses element.scrollIntoView with CSS scroll-margin-top for sticky-banner
// offset — no manual math, no retry loops for positioning. The only retry
// here is existence-only: wait for the target card to mount, then scroll.
export function scrollToOwnerCardNative(
  agencyId: string,
  options: { onFound?: (el: HTMLElement) => void; maxAttempts?: number; intervalMs?: number } = {}
): void {
  const { onFound, maxAttempts = 40, intervalMs = 100 } = options;
  let attempt = 0;

  const tryScroll = () => {
    const el = findAgencyEl(agencyId, null);
    if (el && el.isConnected && el.getBoundingClientRect().height > 0) {
      el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      onFound?.(el);
      return;
    }
    attempt++;
    if (attempt < maxAttempts) setTimeout(tryScroll, intervalMs);
  };

  tryScroll();
}

export function applyOwnerHighlight(
  agencyId: string,
  options?: { persist?: boolean }
): boolean {
  clearOwnerHighlight();

  const el = findAgencyEl(agencyId, null);

  if (!el) {
    console.warn(`[OwnerHighlight] Element not found for agency: ${agencyId}`);
    return false;
  }

  activeHighlightedElement = el;
  activeHighlightedAgencyId = agencyId;
  window.__GAPPSY_OWNER_HIGHLIGHT_ID = agencyId;

  if (!isElementVisibleForOwnerPreview(el)) {
    correctScrollDelta(el);
  }

  highlightTimeoutId = setTimeout(() => {
    if (activeHighlightedElement) {
      activeHighlightedElement.classList.add(
        'owner-highlight',
        'owner-highlight--pulse',
        'owner-highlight--bounce'
      );

      setTimeout(() => {
        if (activeHighlightedElement) {
          activeHighlightedElement.classList.remove('owner-highlight--bounce');
        }
      }, 650);
    }
  }, 450);

  return true;
}

export function clearOwnerHighlight(): void {
  if (highlightTimeoutId) {
    clearTimeout(highlightTimeoutId);
    highlightTimeoutId = null;
  }

  window.__GAPPSY_OWNER_HIGHLIGHT_ID = null;

  if (activeHighlightedElement) {
    activeHighlightedElement.classList.remove(
      'owner-highlight',
      'owner-highlight--pulse',
      'owner-highlight--bounce'
    );
    activeHighlightedElement = null;
    activeHighlightedAgencyId = null;
  }
}

declare global {
  interface Window {
    __GAPPSY_OWNER_HIGHLIGHT_ID: string | null;
  }
}

window.__GAPPSY_OWNER_HIGHLIGHT_ID = null;
