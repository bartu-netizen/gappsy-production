const OFFER_FLOW_CTX_KEY = 'gappsy_offer_flow';

// Agency-scoped storage key — prevents cross-agency leakage.
// Format: gappsy_discount_offer:{agencyId}:{stateSlug}
function scopedKey(agencyId: string, stateSlug: string): string {
  return `gappsy_discount_offer:${agencyId}:${stateSlug}`;
}

// Legacy broad keys that must be cleared on every read to prevent leakage.
const LEGACY_KEYS = ['gappsy_offer_token', 'gappsy_discount', 'activeOffer', 'discountOffer'];

export interface DiscountOffer {
  id: string;
  token: string;
  agency_id: string | null;
  agency_slug: string | null;
  agency_name?: string | null;
  state_slug: string | null;
  state_name?: string | null;
  agency_website?: string | null;
  agency_description?: string | null;
  discount_type: 'percentage' | 'fixed';
  discount_value: number;
  allowed_products: string[];
  uses_remaining: number | null;
  created_by: string | null;
  intent_score_at_creation: number | null;
  expires_at?: string | null;
  push_enabled?: boolean;
  scope_type?: string | null;
  scope_expires_at?: string | null;
}

export type DiscountFlowType = 'offer_redirect' | 'top25_landing';

export interface OfferFlowContext {
  token: string;
  flow: DiscountFlowType;
  startedAt: number;
  // Agency context stored alongside so session scope can be verified
  agency_id: string | null;
  state_slug: string | null;
  expires_at: number | null; // ms timestamp, null = no expiry
}

// Scoped storage marker stored in localStorage per agency+state
interface ScopedDiscountMarker {
  token: string;
  agency_id: string;
  state_slug: string;
  discount_percent: number;
  created_at: number;
  expires_at: number | null;
  scope_expires_at: number | null;
}

// ─── Session flow (sessionStorage) ───────────────────────────────────────────

export function setActiveOfferFlow(
  token: string,
  flow: DiscountFlowType,
  agencyId?: string | null,
  stateSlug?: string | null,
  expiresAt?: number | null,
): void {
  try {
    const ctx: OfferFlowContext = {
      token,
      flow,
      startedAt: Date.now(),
      agency_id: agencyId ?? null,
      state_slug: stateSlug ?? null,
      expires_at: expiresAt ?? null,
    };
    sessionStorage.setItem(OFFER_FLOW_CTX_KEY, JSON.stringify(ctx));
  } catch {
    // ignore
  }
}

export function getActiveOfferFlow(): OfferFlowContext | null {
  try {
    const raw = sessionStorage.getItem(OFFER_FLOW_CTX_KEY);
    if (!raw) return null;
    const ctx = JSON.parse(raw) as OfferFlowContext;
    // Check session expiry
    if (ctx.expires_at && Date.now() > ctx.expires_at) {
      sessionStorage.removeItem(OFFER_FLOW_CTX_KEY);
      return null;
    }
    return ctx;
  } catch {
    return null;
  }
}

export function clearActiveOfferFlow(): void {
  try {
    sessionStorage.removeItem(OFFER_FLOW_CTX_KEY);
  } catch {
    // ignore
  }
}

export function isOfferActiveForFlows(allowedFlows: DiscountFlowType[]): boolean {
  const ctx = getActiveOfferFlow();
  if (!ctx || !ctx.token) return false;
  return allowedFlows.includes(ctx.flow);
}

export function getOfferTokenIfFlow(allowedFlows: DiscountFlowType[]): string | null {
  const ctx = getActiveOfferFlow();
  if (!ctx || !ctx.token) return null;
  if (!allowedFlows.includes(ctx.flow)) return null;
  return ctx.token;
}

// Centralized synchronous resolver for scoped offer tokens.
// Priority: explicit URL/page token -> session flow token -> scoped localStorage marker.
// Safe to call from checkout payload builders — does not mutate state.
export function resolveActiveScopedOfferToken(options?: {
  explicitToken?: string | null;
  allowedFlows?: DiscountFlowType[];
  agencyId?: string | null;
  stateSlug?: string | null;
}): string | null {
  const explicit = options?.explicitToken;
  if (explicit) return explicit;

  const flows = options?.allowedFlows ?? ['offer_redirect', 'top25_landing'];
  const flowToken = getOfferTokenIfFlow(flows);
  if (flowToken) return flowToken;

  const { agencyId, stateSlug } = options ?? {};
  if (agencyId && stateSlug) {
    const marker = readScopedDiscountMarker(agencyId, stateSlug);
    if (marker?.token) return marker.token;
  }

  // Fallback: whatever flow token exists regardless of flow filter
  const anyFlow = getActiveOfferFlow();
  if (anyFlow?.token) return anyFlow.token;

  return null;
}

// ─── Agency-scoped localStorage marker ───────────────────────────────────────

function purgeLegacyKeys(): void {
  try {
    for (const k of LEGACY_KEYS) {
      localStorage.removeItem(k);
    }
  } catch {
    // ignore
  }
}

export function storeScopedDiscountMarker(
  agencyId: string,
  stateSlug: string,
  marker: Omit<ScopedDiscountMarker, 'agency_id' | 'state_slug'>,
): void {
  try {
    purgeLegacyKeys();
    const full: ScopedDiscountMarker = { ...marker, agency_id: agencyId, state_slug: stateSlug };
    localStorage.setItem(scopedKey(agencyId, stateSlug), JSON.stringify(full));
  } catch {
    // ignore storage errors
  }
}

export function readScopedDiscountMarker(
  agencyId: string,
  stateSlug: string,
): ScopedDiscountMarker | null {
  try {
    purgeLegacyKeys();
    const raw = localStorage.getItem(scopedKey(agencyId, stateSlug));
    if (!raw) return null;
    const marker = JSON.parse(raw) as ScopedDiscountMarker;
    // Agency/state guard
    if (marker.agency_id !== agencyId || marker.state_slug !== stateSlug) {
      localStorage.removeItem(scopedKey(agencyId, stateSlug));
      return null;
    }
    // scope_expires_at guard (max 24h from created_at as hard ceiling)
    const now = Date.now();
    const hardCeiling = marker.created_at + 24 * 60 * 60 * 1000;
    const scopeDeadline = marker.scope_expires_at ?? hardCeiling;
    const effective = Math.min(scopeDeadline, hardCeiling);
    if (now > effective) {
      localStorage.removeItem(scopedKey(agencyId, stateSlug));
      return null;
    }
    // expires_at (offer hard expiry)
    if (marker.expires_at && now > marker.expires_at) {
      localStorage.removeItem(scopedKey(agencyId, stateSlug));
      return null;
    }
    return marker;
  } catch {
    return null;
  }
}

export function clearScopedDiscountMarker(agencyId: string, stateSlug: string): void {
  try {
    localStorage.removeItem(scopedKey(agencyId, stateSlug));
  } catch {
    // ignore
  }
}

// Compatibility shim: store token so OfferRedirectPage and ActivationUpgradePage
// can continue using storeOfferToken for flow initialisation.
// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function storeOfferToken(_token: string, _agencyId?: string | null, _stateSlug?: string | null): void {
  // Shim: purges legacy broad keys. Use storeScopedDiscountMarker for new code.
  purgeLegacyKeys();
}

export function clearOfferToken(agencyId?: string | null, stateSlug?: string | null): void {
  try {
    purgeLegacyKeys();
    if (agencyId && stateSlug) {
      clearScopedDiscountMarker(agencyId, stateSlug);
    }
    sessionStorage.removeItem(OFFER_FLOW_CTX_KEY);
  } catch {
    // ignore
  }
}

// ─── resolveScopedDiscountForAgency ──────────────────────────────────────────

export interface ScopedDiscountParams {
  agencyId: string | null;
  stateSlug: string | null;
  agencySlug?: string | null;
  urlToken?: string | null;
  allowSessionScopedDiscount?: boolean;
  allowGlobalScopedDiscount?: boolean;
}

export interface ResolvedDiscount {
  token: string;
  discount_percent: number;
  offer: DiscountOffer;
  source: 'url_token' | 'session' | 'global_push';
}

const SUPABASE_URL = typeof window !== 'undefined'
  ? (import.meta.env.VITE_SUPABASE_URL as string)
  : '';
const SUPABASE_ANON_KEY = typeof window !== 'undefined'
  ? (import.meta.env.VITE_SUPABASE_ANON_KEY as string)
  : '';

async function callValidate(
  token: string,
  agencyId?: string | null,
  stateSlug?: string | null,
): Promise<{ valid: boolean; active: boolean; reason?: string; offer?: DiscountOffer; scope_valid?: boolean }> {
  try {
    const params = new URLSearchParams({ token });
    if (agencyId) params.set('agency_id', agencyId);
    if (stateSlug) params.set('state_slug', stateSlug);
    const res = await fetch(
      `${SUPABASE_URL}/functions/v1/discount-offer-validate?${params.toString()}`,
      { headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}`, 'Content-Type': 'application/json' } }
    );
    if (!res.ok) return { valid: false, active: false, reason: 'server_error' };
    return await res.json();
  } catch {
    return { valid: false, active: false, reason: 'network_error' };
  }
}

export async function resolveScopedDiscountForAgency(
  params: ScopedDiscountParams,
): Promise<ResolvedDiscount | null> {
  const { agencyId, stateSlug, urlToken, allowSessionScopedDiscount, allowGlobalScopedDiscount } = params;

  // 1. Explicit URL token — highest priority
  if (urlToken) {
    const result = await callValidate(urlToken, agencyId, stateSlug);
    if (result.valid && result.offer) {
      const offer = result.offer;
      const pct = offer.discount_type === 'percentage' ? Math.round(offer.discount_value) : 0;
      // Agency-scope guard: if offer has agency_id, it must match
      if (offer.agency_id && agencyId && offer.agency_id !== agencyId) {
        return null;
      }
      // State-scope guard
      if (offer.state_slug && stateSlug && offer.state_slug !== stateSlug) {
        return null;
      }
      // Store scoped marker for session carry-forward
      if (agencyId && stateSlug && pct > 0) {
        const scopeMs = offer.scope_expires_at ? new Date(offer.scope_expires_at).getTime() : null;
        const expiresMs = offer.expires_at ? new Date(offer.expires_at).getTime() : null;
        storeScopedDiscountMarker(agencyId, stateSlug, {
          token: urlToken,
          discount_percent: pct,
          created_at: Date.now(),
          expires_at: expiresMs,
          scope_expires_at: scopeMs,
        });
        // Also set session flow with expiry
        const sessionExpiry = scopeMs
          ? Math.min(scopeMs, Date.now() + 24 * 60 * 60 * 1000)
          : Date.now() + 24 * 60 * 60 * 1000;
        setActiveOfferFlow(urlToken, 'offer_redirect', agencyId, stateSlug, sessionExpiry);
      }
      return {
        token: urlToken,
        discount_percent: pct,
        offer,
        source: 'url_token',
      };
    }
    // URL token invalid — do not fall through to session/push for this agency
    return null;
  }

  // 2. Session-scoped token (only when allowed)
  if (allowSessionScopedDiscount && agencyId && stateSlug) {
    const marker = readScopedDiscountMarker(agencyId, stateSlug);
    if (marker) {
      // Revalidate server-side before applying to checkout
      const result = await callValidate(marker.token, agencyId, stateSlug);
      if (result.valid && result.offer) {
        const offer = result.offer;
        // Double-check agency/state match
        if (offer.agency_id && offer.agency_id !== agencyId) {
          clearScopedDiscountMarker(agencyId, stateSlug);
          return null;
        }
        if (offer.state_slug && offer.state_slug !== stateSlug) {
          clearScopedDiscountMarker(agencyId, stateSlug);
          return null;
        }
        const pct = offer.discount_type === 'percentage' ? Math.round(offer.discount_value) : 0;
        return {
          token: marker.token,
          discount_percent: pct,
          offer,
          source: 'session',
        };
      }
      // Marker stale — clean it up
      clearScopedDiscountMarker(agencyId, stateSlug);
    }
  }

  // 3. Global/admin push token (only when explicitly allowed)
  // Uses the safe public endpoint — does NOT require admin auth.
  if (allowGlobalScopedDiscount && agencyId) {
    try {
      const pushParams = new URLSearchParams({ agency_id: agencyId });
      if (stateSlug) pushParams.set('state_slug', stateSlug);
      const res = await fetch(
        `${SUPABASE_URL}/functions/v1/discount-offer-pushed-for-agency?${pushParams.toString()}`,
        { headers: { Authorization: `Bearer ${SUPABASE_ANON_KEY}`, 'Content-Type': 'application/json' } }
      );
      if (res.ok) {
        const data = await res.json();
        if (data.valid && data.offer) {
          const offer = data.offer as DiscountOffer;
          const pct = offer.discount_type === 'percentage' ? Math.round(offer.discount_value) : 0;
          return {
            token: data.token as string,
            discount_percent: pct,
            offer,
            source: 'global_push',
          };
        }
      }
    } catch {
      // non-fatal
    }
  }

  return null;
}

// ─── Formatting helpers ───────────────────────────────────────────────────────

export function formatDiscount(offer: Pick<DiscountOffer, 'discount_type' | 'discount_value'>): string {
  if (offer.discount_type === 'percentage') {
    return `${offer.discount_value}% off`;
  }
  return `$${offer.discount_value.toFixed(0)} off`;
}

// ─── Direct server validation (used by pages that have a token in hand) ───────

export async function validateOfferToken(
  token: string,
  agencyId?: string | null,
  stateSlug?: string | null,
): Promise<{ valid: boolean; offer?: DiscountOffer; reason?: string }> {
  const result = await callValidate(token, agencyId, stateSlug);
  return result;
}
