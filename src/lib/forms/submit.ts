const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export type FormType =
  | 'get_matched'
  | 'sponsored_spotlight'
  | 'top25_submission'
  | 'availability_check'
  | 'confirm_connection';

export interface SubmitFormOptions {
  form_type: FormType;
  payload: Record<string, unknown>;
  contact?: {
    name?: string;
    first_name?: string;
    last_name?: string;
    email?: string;
    phone?: string;
    company?: string;
  };
  state_slug?: string;
  page_path?: string;
  utm?: Record<string, string>;
  meta?: Record<string, unknown>;
  client_submission_id?: string;
}

export interface SubmitFormResult {
  ok: boolean;
  row_id?: string;
  notify_status?: 'sent' | 'failed' | 'skipped';
  error?: string;
}

export async function submitForm(options: SubmitFormOptions): Promise<SubmitFormResult> {
  const apiUrl = `${SUPABASE_URL}/functions/v1/submit-and-notify`;

  try {
    const res = await fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
        'apikey': SUPABASE_ANON_KEY,
      },
      body: JSON.stringify({
        ...options,
        submitted_at: new Date().toISOString(),
        page_path: options.page_path ?? window.location.pathname,
      }),
    });

    let data: SubmitFormResult;
    try {
      data = await res.json();
    } catch {
      return { ok: false, error: `HTTP ${res.status}: non-JSON response` };
    }

    if (!res.ok) {
      return { ok: false, error: data?.error ?? `HTTP ${res.status}` };
    }

    return data;
  } catch (err: unknown) {
    return {
      ok: false,
      error: err instanceof Error ? err.message : 'Network error',
    };
  }
}

export function getUtmParams(): Record<string, string> {
  const params = new URLSearchParams(window.location.search);
  const utm: Record<string, string> = {};
  for (const key of ['utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']) {
    const val = params.get(key);
    if (val) utm[key] = val;
  }
  return utm;
}
