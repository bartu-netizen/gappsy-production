import { supabase } from './supabase';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

async function currentAccessToken(): Promise<string | null> {
  const { data } = await supabase.auth.getSession();
  return data.session?.access_token || null;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any -- response shape varies per action; callers destructure the fields they need
async function callVendorFunction(name: string, body: Record<string, unknown>, method: 'GET' | 'POST' = 'POST', toolId?: string | null): Promise<any> {
  const token = await currentAccessToken();
  if (!token) return { ok: false, error: 'Not signed in' };
  const url = toolId
    ? `${SUPABASE_URL}/functions/v1/${name}?tool_id=${encodeURIComponent(toolId)}`
    : `${SUPABASE_URL}/functions/v1/${name}`;
  const res = await fetch(url, {
    method,
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
    body: method === 'GET' ? undefined : JSON.stringify(body),
  });
  return res.json().catch(() => ({ ok: false, error: 'Invalid response' }));
}

export interface VendorToolSummary {
  id: string;
  slug: string;
  name: string;
}

async function listVendorTools(): Promise<{ ok: boolean; tools?: VendorToolSummary[]; error?: string }> {
  const token = await currentAccessToken();
  if (!token) return { ok: false, error: 'Not signed in' };
  const res = await fetch(`${SUPABASE_URL}/functions/v1/vendor-dashboard?list_tools=1`, {
    method: 'GET',
    headers: { Authorization: `Bearer ${token}` },
  });
  return res.json().catch(() => ({ ok: false, error: 'Invalid response' }));
}

export const vendorDashboard = {
  // Independent of the single-tool resolution the other calls rely on —
  // safe to call even when the account owns 2+ tools (which would otherwise
  // make every other call below fail with a "multiple_tools" error until a
  // specific toolId is supplied).
  listTools: listVendorTools,
  fetchAll: (toolId?: string | null) => callVendorFunction('vendor-dashboard', {}, 'GET', toolId),
  updateListing: (fields: Record<string, unknown>, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'update_listing', fields }, 'POST', toolId),
  setFeatures: (items: { title: string; description?: string }[], toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'set_features', items }, 'POST', toolId),
  setPros: (items: { text: string }[], toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'set_pros', items }, 'POST', toolId),
  setCons: (items: { text: string }[], toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'set_cons', items }, 'POST', toolId),
  setFaqs: (items: { question: string; answer: string }[], toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'set_faqs', items }, 'POST', toolId),
  respondToReview: (reviewId: string, response: string, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'respond_to_review', review_id: reviewId, response }, 'POST', toolId),
  removeReview: (reviewId: string, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'remove_review', review_id: reviewId }, 'POST', toolId),
  restoreReview: (reviewId: string, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'restore_review', review_id: reviewId }, 'POST', toolId),
  openBillingPortal: (returnUrl: string, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'create_billing_portal_session', return_url: returnUrl }, 'POST', toolId),
  requestComparison: (requestedToolSlug: string, toolId?: string | null) => callVendorFunction('vendor-dashboard', { action: 'request_comparison', requested_tool_slug: requestedToolSlug }, 'POST', toolId),
  // eslint-disable-next-line @typescript-eslint/no-explicit-any -- response shape mirrors callVendorFunction's
  uploadLogo: async (file: File, toolId?: string | null): Promise<any> => {
    const token = await currentAccessToken();
    if (!token) return { ok: false, error: 'Not signed in' };
    const formData = new FormData();
    formData.append('file', file);
    const url = toolId
      ? `${SUPABASE_URL}/functions/v1/vendor-tool-media?tool_id=${encodeURIComponent(toolId)}`
      : `${SUPABASE_URL}/functions/v1/vendor-tool-media`;
    const res = await fetch(url, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}` },
      body: formData,
    });
    return res.json().catch(() => ({ ok: false, error: 'Invalid response' }));
  },
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function callClaimFunction(body: Record<string, unknown>): Promise<any> {
  const res = await fetch(`${SUPABASE_URL}/functions/v1/vendor-claim-account`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}` },
    body: JSON.stringify(body),
  });
  return res.json().catch(() => ({ ok: false, error: 'Invalid response' }));
}

export const vendorClaim = {
  lookupToken: (token: string) => callClaimFunction({ action: 'lookup_token', token }),
  claim: (token: string, accessToken: string) => callClaimFunction({ action: 'claim', token, access_token: accessToken }),
};
