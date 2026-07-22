import { supabase } from './supabase';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;

async function currentAccessToken(): Promise<string | null> {
  const { data } = await supabase.auth.getSession();
  return data.session?.access_token || null;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any -- response shape varies per action; callers destructure the fields they need
async function callVendorFunction(name: string, body: Record<string, unknown>, method: 'GET' | 'POST' = 'POST'): Promise<any> {
  const token = await currentAccessToken();
  if (!token) return { ok: false, error: 'Not signed in' };
  const url = method === 'GET' ? `${SUPABASE_URL}/functions/v1/${name}` : `${SUPABASE_URL}/functions/v1/${name}`;
  const res = await fetch(url, {
    method,
    headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${token}` },
    body: method === 'GET' ? undefined : JSON.stringify(body),
  });
  return res.json().catch(() => ({ ok: false, error: 'Invalid response' }));
}

export const vendorDashboard = {
  fetchAll: () => callVendorFunction('vendor-dashboard', {}, 'GET'),
  updateListing: (fields: Record<string, unknown>) => callVendorFunction('vendor-dashboard', { action: 'update_listing', fields }),
  setFeatures: (items: { title: string; description?: string }[]) => callVendorFunction('vendor-dashboard', { action: 'set_features', items }),
  setPros: (items: { text: string }[]) => callVendorFunction('vendor-dashboard', { action: 'set_pros', items }),
  setCons: (items: { text: string }[]) => callVendorFunction('vendor-dashboard', { action: 'set_cons', items }),
  setFaqs: (items: { question: string; answer: string }[]) => callVendorFunction('vendor-dashboard', { action: 'set_faqs', items }),
  respondToReview: (reviewId: string, response: string) => callVendorFunction('vendor-dashboard', { action: 'respond_to_review', review_id: reviewId, response }),
  removeReview: (reviewId: string) => callVendorFunction('vendor-dashboard', { action: 'remove_review', review_id: reviewId }),
  restoreReview: (reviewId: string) => callVendorFunction('vendor-dashboard', { action: 'restore_review', review_id: reviewId }),
  openBillingPortal: (returnUrl: string) => callVendorFunction('vendor-dashboard', { action: 'create_billing_portal_session', return_url: returnUrl }),
  requestComparison: (requestedToolSlug: string) => callVendorFunction('vendor-dashboard', { action: 'request_comparison', requested_tool_slug: requestedToolSlug }),
  // eslint-disable-next-line @typescript-eslint/no-explicit-any -- response shape mirrors callVendorFunction's
  uploadLogo: async (file: File): Promise<any> => {
    const token = await currentAccessToken();
    if (!token) return { ok: false, error: 'Not signed in' };
    const formData = new FormData();
    formData.append('file', file);
    const res = await fetch(`${SUPABASE_URL}/functions/v1/vendor-tool-media`, {
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
