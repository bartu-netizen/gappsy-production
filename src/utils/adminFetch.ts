const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

function getToken(): string {
  return localStorage.getItem('gappsy_admin_token') ?? '';
}

export interface AdminFetchOptions extends RequestInit {
  json?: unknown;
}

export async function adminFetch(functionPath: string, options: AdminFetchOptions = {}): Promise<Response> {
  const { json, headers: extraHeaders, ...rest } = options;
  const token = getToken();

  const headers: Record<string, string> = {
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
    'Content-Type': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
    ...(extraHeaders as Record<string, string> ?? {}),
  };

  const res = await fetch(`${SUPABASE_URL}/functions/v1/${functionPath}`, {
    ...rest,
    headers,
    ...(json !== undefined ? { body: JSON.stringify(json) } : {}),
  });

  if (res.status === 401) {
    localStorage.removeItem('gappsy_admin_token');
    localStorage.removeItem('gappsy_admin_expiresAt');
    window.location.href = '/wp-admin?reason=session_expired';
  }

  return res;
}
