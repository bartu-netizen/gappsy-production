const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export type AdminErrorCode =
  | 'auth_error'
  | 'session_expired'
  | 'no_session'
  | 'network_error'
  | 'timeout_error'
  | 'cors_error'
  | 'backend_html_error'
  | 'server_error'
  | 'parse_error'
  | 'empty_response'
  | 'provider_error'
  | 'unknown_error';

export interface AdminApiError {
  code: AdminErrorCode;
  message: string;
  status?: number;
  raw?: string;
  retryable: boolean;
}

export interface AdminFetchResult<T> {
  ok: boolean;
  data?: T;
  error?: AdminApiError;
}

const ERROR_MESSAGES: Record<AdminErrorCode, string> = {
  auth_error: 'Authentication failed. Please check your credentials.',
  session_expired: 'Your admin session expired. Please log in again.',
  no_session: 'No admin session found. Please log in.',
  network_error: 'Could not reach the admin service. Please check your connection.',
  timeout_error: 'The request took too long. Please try again.',
  cors_error: 'Request blocked by security policy. Please contact support.',
  backend_html_error: 'The server returned an unexpected response.',
  server_error: 'The admin backend encountered an error.',
  parse_error: 'Could not process the server response.',
  empty_response: 'The server returned an empty response.',
  provider_error: 'An external service did not respond correctly.',
  unknown_error: 'An unexpected error occurred.',
};

function getToken(): string | null {
  return localStorage.getItem('gappsy_admin_token');
}

function getTokenExpiry(): number | null {
  const exp = localStorage.getItem('gappsy_admin_expiresAt');
  return exp ? Number(exp) : null;
}

function isSessionValid(): boolean {
  const token = getToken();
  const expiry = getTokenExpiry();
  if (!token) return false;
  if (expiry && Date.now() > expiry) return false;
  return true;
}

function clearSession(): void {
  localStorage.removeItem('gappsy_admin_token');
  localStorage.removeItem('gappsy_admin_expiresAt');
}

function classifyError(
  status: number,
  contentType: string | null,
  bodyText: string,
  isAbort: boolean,
  isNetworkError: boolean
): AdminApiError {
  if (isAbort) {
    return {
      code: 'timeout_error',
      message: ERROR_MESSAGES.timeout_error,
      retryable: true,
    };
  }

  if (isNetworkError) {
    const msg = bodyText.toLowerCase();
    if (msg.includes('cors') || msg.includes('blocked') || msg.includes('cross-origin')) {
      return {
        code: 'cors_error',
        message: ERROR_MESSAGES.cors_error,
        retryable: false,
      };
    }
    return {
      code: 'network_error',
      message: ERROR_MESSAGES.network_error,
      retryable: true,
    };
  }

  if (status === 401) {
    const lower = bodyText.toLowerCase();
    // Only clear the stored session when the backend EXPLICITLY confirms the session
    // itself is invalid or expired. Generic 401s from legacy endpoints (ADMIN_SECRET
    // mismatch, NO_CREDENTIALS on old tools) must NOT wipe the modern session.
    const isDefiniteSessionInvalid =
      lower.includes('missing admin token') ||
      lower.includes('invalid or expired admin session') ||
      lower.includes('admin session expired') ||
      lower.includes('session expired — please login') ||
      lower.includes('"session_expired"');

    if (isDefiniteSessionInvalid) {
      clearSession();
    }

    const isExpired = lower.includes('expired');
    return {
      code: isExpired ? 'session_expired' : 'auth_error',
      message: isExpired ? ERROR_MESSAGES.session_expired : ERROR_MESSAGES.auth_error,
      status,
      retryable: false,
    };
  }

  if (status === 403) {
    return {
      code: 'auth_error',
      message: 'Access denied. You may not have permission for this action.',
      status,
      retryable: false,
    };
  }

  const isHtml = contentType?.includes('text/html') ?? false;
  const looksLikeHtml = bodyText.trim().startsWith('<!') || bodyText.trim().startsWith('<html');

  if (isHtml || looksLikeHtml) {
    return {
      code: 'backend_html_error',
      message: ERROR_MESSAGES.backend_html_error,
      status,
      raw: bodyText.slice(0, 500),
      retryable: status >= 500,
    };
  }

  if (status >= 500) {
    return {
      code: 'server_error',
      message: ERROR_MESSAGES.server_error,
      status,
      raw: bodyText.slice(0, 300),
      retryable: true,
    };
  }

  if (status === 502 || status === 503 || status === 504) {
    return {
      code: 'provider_error',
      message: ERROR_MESSAGES.provider_error,
      status,
      retryable: true,
    };
  }

  return {
    code: 'server_error',
    message: bodyText || ERROR_MESSAGES.server_error,
    status,
    retryable: false,
  };
}

export interface AdminFetchOptions {
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE' | 'PATCH';
  body?: unknown;
  headers?: Record<string, string>;
  timeoutMs?: number;
  retries?: number;
  retryDelayMs?: number;
  requireSession?: boolean;
  skipSessionCheck?: boolean;
}

const DEFAULT_TIMEOUT_MS = 12000;
const DEFAULT_RETRIES = 1;
const DEFAULT_RETRY_DELAY_MS = 800;

export async function adminApiFetch<T = unknown>(
  functionPath: string,
  options: AdminFetchOptions = {}
): Promise<AdminFetchResult<T>> {
  const {
    method = 'GET',
    body,
    headers: extraHeaders = {},
    timeoutMs = DEFAULT_TIMEOUT_MS,
    retries = method === 'GET' ? DEFAULT_RETRIES : 0,
    retryDelayMs = DEFAULT_RETRY_DELAY_MS,
    requireSession = true,
    skipSessionCheck = false,
  } = options;

  if (requireSession && !skipSessionCheck) {
    if (!isSessionValid()) {
      const token = getToken();
      if (!token) {
        return {
          ok: false,
          error: {
            code: 'no_session',
            message: ERROR_MESSAGES.no_session,
            retryable: false,
          },
        };
      }
      clearSession();
      return {
        ok: false,
        error: {
          code: 'session_expired',
          message: ERROR_MESSAGES.session_expired,
          retryable: false,
        },
      };
    }
  }

  const token = getToken();
  const legacySecret = localStorage.getItem('admin_secret') ?? '';

  const requestHeaders: Record<string, string> = {
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
    'apikey': SUPABASE_ANON_KEY,
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    ...(token ? { 'x-admin-token': token } : {}),
    ...(legacySecret ? { 'x-admin-secret': legacySecret } : {}),
    ...extraHeaders,
  };

  const url = functionPath.startsWith('http')
    ? functionPath
    : `${SUPABASE_URL}/functions/v1/${functionPath}`;

  let lastError: AdminApiError | null = null;
  let attempt = 0;

  while (attempt <= retries) {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), timeoutMs);

    const requestId = `${Date.now()}-${Math.random().toString(36).slice(2, 8)}`;

    const hasAuth = !!requestHeaders['Authorization'];
    const hasApiKey = !!requestHeaders['apikey'];
    const hasAdminToken = !!requestHeaders['x-admin-token'];

    console.log(`[adminApiFetch] request=${requestId} attempt=${attempt} method=${method} path=${functionPath} url=${url} hasAuth=${hasAuth} hasApiKey=${hasApiKey} hasAdminToken=${hasAdminToken}`);

    try {
      const fetchOptions: RequestInit = {
        method,
        headers: requestHeaders,
        signal: controller.signal,
      };

      if (body !== undefined && method !== 'GET') {
        fetchOptions.body = JSON.stringify(body);
      }

      const res = await fetch(url, fetchOptions);
      clearTimeout(timeoutId);

      const contentType = res.headers.get('content-type');
      const bodyText = await res.text();

      const errorCode = !res.ok ? classifyError(res.status, contentType, bodyText, false, false).code : null;
      console.log(`[adminApiFetch] request=${requestId} status=${res.status} contentType=${contentType} bodyLen=${bodyText.length} errorCode=${errorCode}`);

      if (!res.ok) {
        let error = classifyError(res.status, contentType, bodyText, false, false);

        if (res.status === 401) {
          return { ok: false, error };
        }

        // For non-2xx JSON responses, extract the actual backend error message
        // instead of swallowing it with a generic classification string.
        const isJsonBody = (contentType?.includes('application/json') ?? false)
          || bodyText.trim().startsWith('{');
        if (isJsonBody && error.code === 'server_error') {
          try {
            const parsed = JSON.parse(bodyText) as Record<string, unknown>;
            const backendMsg =
              (typeof parsed.message === 'string' && parsed.message)
              || (typeof parsed.error === 'string' && parsed.error)
              || null;
            if (backendMsg) {
              error = { ...error, message: backendMsg };
            }
          } catch {
            /* leave error as-is if JSON parse fails */
          }
        }

        if (error.retryable && attempt < retries) {
          lastError = error;
          attempt++;
          console.log(`[adminApiFetch] request=${requestId} retryable error, retrying in ${retryDelayMs}ms`);
          await new Promise((r) => setTimeout(r, retryDelayMs * attempt));
          continue;
        }

        return { ok: false, error };
      }

      if (!bodyText.trim()) {
        return {
          ok: false,
          error: {
            code: 'empty_response',
            message: ERROR_MESSAGES.empty_response,
            status: res.status,
            retryable: false,
          },
        };
      }

      const isJson = contentType?.includes('application/json') ?? false;
      if (!isJson && !bodyText.trim().startsWith('{') && !bodyText.trim().startsWith('[')) {
        return {
          ok: false,
          error: {
            code: 'parse_error',
            message: 'Server returned non-JSON response',
            status: res.status,
            raw: bodyText.slice(0, 200),
            retryable: false,
          },
        };
      }

      let data: T;
      try {
        data = JSON.parse(bodyText);
      } catch {
        return {
          ok: false,
          error: {
            code: 'parse_error',
            message: 'Failed to parse JSON response',
            status: res.status,
            raw: bodyText.slice(0, 200),
            retryable: false,
          },
        };
      }

      const dataObj = data as Record<string, unknown>;
      if (dataObj && typeof dataObj === 'object' && 'error' in dataObj && dataObj.error) {
        const errorMsg = typeof dataObj.error === 'string'
          ? dataObj.error
          : (dataObj.message as string) || 'API returned an error';

        const lowerMsg = errorMsg.toLowerCase();
        // Only treat as a session-clearing auth error when the backend explicitly
        // signals that the admin *session* is invalid — not for generic credential errors
        // from legacy endpoints (ADMIN_SECRET mismatch, NO_CREDENTIALS, etc.).
        const isDefiniteSessionError =
          lowerMsg.includes('missing admin token') ||
          lowerMsg.includes('invalid or expired admin session') ||
          lowerMsg.includes('admin session expired') ||
          lowerMsg.includes('session expired — please login');

        if (isDefiniteSessionError) {
          clearSession();
          return {
            ok: false,
            error: {
              code: lowerMsg.includes('expired') ? 'session_expired' : 'auth_error',
              message: errorMsg,
              status: res.status,
              retryable: false,
            },
          };
        }

        // 401 from a legacy/misconfigured endpoint — report auth error but keep session alive
        const isGenericAuthError = lowerMsg.includes('unauthorized')
          || lowerMsg.includes('credentials')
          || (res.status === 401);

        if (isGenericAuthError) {
          return {
            ok: false,
            error: {
              code: 'auth_error',
              message: errorMsg,
              status: res.status,
              retryable: false,
            },
          };
        }

        return {
          ok: false,
          error: {
            code: 'server_error',
            message: errorMsg,
            status: res.status,
            retryable: false,
          },
        };
      }

      return { ok: true, data };

    } catch (err) {
      clearTimeout(timeoutId);

      const isAbort = err instanceof Error && err.name === 'AbortError';
      const isNetwork = err instanceof TypeError;
      const errMsg = err instanceof Error ? err.message : String(err);

      console.log(`[adminApiFetch] request=${requestId} caught error isAbort=${isAbort} isNetwork=${isNetwork} msg=${errMsg}`);

      const error = classifyError(0, null, errMsg, isAbort, isNetwork);

      if (error.retryable && attempt < retries) {
        lastError = error;
        attempt++;
        console.log(`[adminApiFetch] request=${requestId} exception retryable, retrying in ${retryDelayMs}ms`);
        await new Promise((r) => setTimeout(r, retryDelayMs * attempt));
        continue;
      }

      return { ok: false, error };
    }
  }

  return {
    ok: false,
    error: lastError || {
      code: 'unknown_error',
      message: ERROR_MESSAGES.unknown_error,
      retryable: false,
    },
  };
}

export function getErrorMessage(error: AdminApiError): string {
  return error.message || ERROR_MESSAGES[error.code] || ERROR_MESSAGES.unknown_error;
}

export function isRetryableError(error: AdminApiError): boolean {
  return error.retryable;
}

export function isAuthError(error: AdminApiError): boolean {
  return error.code === 'auth_error' || error.code === 'session_expired' || error.code === 'no_session';
}

export function shouldRedirectToLogin(error: AdminApiError): boolean {
  return error.code === 'session_expired' || error.code === 'no_session';
}
