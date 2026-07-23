const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

const SESSION_STORAGE_KEY = "fmp_onboarding_session_id";

export function getStoredSessionId(): string | null {
  try { return localStorage.getItem(SESSION_STORAGE_KEY); } catch { return null; }
}
export function setStoredSessionId(id: string): void {
  try { localStorage.setItem(SESSION_STORAGE_KEY, id); } catch { /* ignore */ }
}
export function clearStoredSessionId(): void {
  try { localStorage.removeItem(SESSION_STORAGE_KEY); } catch { /* ignore */ }
}

// Mirrors ContactPage.tsx's getUTMParams — first-party attribution only,
// never sent to a third-party analytics vendor.
export function getUtmContext(): { utm_source: string | null; utm_medium: string | null; utm_campaign: string | null; referrer: string | null; landing_page: string | null } {
  try {
    const p = new URLSearchParams(window.location.search);
    return {
      utm_source: p.get("utm_source"),
      utm_medium: p.get("utm_medium"),
      utm_campaign: p.get("utm_campaign"),
      referrer: document.referrer || null,
      landing_page: "/list-your-product",
    };
  } catch {
    return { utm_source: null, utm_medium: null, utm_campaign: null, referrer: null, landing_page: null };
  }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any -- response shape varies per action; callers destructure the fields they need
async function callFunction(name: string, body: Record<string, unknown>): Promise<any> {
  const res = await fetch(`${SUPABASE_URL}/functions/v1/${name}`, {
    method: "POST",
    headers: { "Content-Type": "application/json", Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
    body: JSON.stringify(body),
  });
  const data = await res.json().catch(() => ({ ok: false, error: "Invalid response" }));
  return data;
}

export const vendorOnboarding = {
  normalizeAndMatch: (rawUrl: string) => callFunction("vendor-onboarding", { action: "normalize_and_match", raw_url: rawUrl, ...getUtmContext() }),
  confirmNewProduct: (sessionId: string, productName: string, website: string, shortDescription?: string) =>
    callFunction("vendor-onboarding", { action: "confirm_new_product", session_id: sessionId, product_name: productName, website, short_description: shortDescription }),
  submitContact: (sessionId: string, email: string, name: string, ownershipConfirmed: boolean) =>
    callFunction("vendor-onboarding", { action: "submit_contact", session_id: sessionId, email, name, ownership_confirmed: ownershipConfirmed }),
  checkEmailAccount: (email: string) => callFunction("vendor-onboarding", { action: "check_email_account", email }),
  createCheckout: (sessionId: string, product: "claim" | "growth", billingInterval?: "month" | "year") =>
    callFunction("vendor-onboarding", { action: "create_checkout", session_id: sessionId, product, billing_interval: billingInterval }),
  sessionStatus: (params: { sessionId?: string; stripeSessionId?: string }) =>
    callFunction("vendor-onboarding", { action: "session_status", session_id: params.sessionId, stripe_session_id: params.stripeSessionId }),
  trackEvent: (sessionId: string, eventName: "checkout_abandoned" | "verification_started", metadata?: Record<string, unknown>) =>
    callFunction("vendor-onboarding", { action: "track_event", session_id: sessionId, event_name: eventName, metadata }).catch(() => {}),
};

export const vendorOwnershipVerify = {
  get: (token: string) => callFunction("vendor-ownership-verify", { action: "get", token }),
  check: (token: string, method: "html_meta_tag" | "dns_txt" | "html_file") => callFunction("vendor-ownership-verify", { action: "check", token, method }),
};
