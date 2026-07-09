import { createContext, useContext, useState, useEffect, useCallback, ReactNode } from 'react';

const TOKEN_KEY = 'gappsy_admin_token';
const EXPIRES_KEY = 'gappsy_admin_expiresAt';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

export type SessionStatus = 'loading' | 'valid' | 'invalid';

interface AdminSessionCtx {
  token: string | null;
  expiresAt: number | null;
  status: SessionStatus;
  isReady: boolean;
  isValid: boolean;
  login: (secret: string) => Promise<{ ok: boolean; error?: string }>;
  logout: () => void;
  ensureValid: () => Promise<boolean>;
  waitForSession: () => Promise<boolean>;
}

const AdminSessionContext = createContext<AdminSessionCtx | null>(null);

export function AdminSessionProvider({ children }: { children: ReactNode }) {
  const [token, setToken] = useState<string | null>(null);
  const [expiresAt, setExpiresAt] = useState<number | null>(null);
  const [status, setStatus] = useState<SessionStatus>('loading');

  const persist = (t: string, exp: number) => {
    localStorage.setItem(TOKEN_KEY, t);
    localStorage.setItem(EXPIRES_KEY, String(exp));
    setToken(t);
    setExpiresAt(exp);
    setStatus('valid');
  };

  const clearSession = useCallback((clearLegacySecrets = false) => {
    localStorage.removeItem(TOKEN_KEY);
    localStorage.removeItem(EXPIRES_KEY);
    if (clearLegacySecrets) {
      localStorage.removeItem('admin_secret');
      localStorage.removeItem('admin_import_secret');
      localStorage.removeItem('admin_logo_upload_secret');
    }
    setToken(null);
    setExpiresAt(null);
    setStatus('invalid');
  }, []);

  const callLogin = async (secret: string): Promise<{ ok: boolean; token?: string; expiresAt?: number; error?: string }> => {
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-login`, {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${SUPABASE_ANON_KEY}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ secret }),
      });
      const data = await res.json();
      if (!res.ok) return { ok: false, error: data?.message ?? data?.error ?? `Error ${res.status}` };
      return { ok: true, token: data.token, expiresAt: data.expiresAt };
    } catch (e) {
      return { ok: false, error: e instanceof Error ? e.message : 'Network error' };
    }
  };

  const callCheck = async (t: string): Promise<{ ok: boolean; exp?: number }> => {
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/admin-auth-check`, {
        method: 'GET',
        headers: {
          'Authorization': `Bearer ${t}`,
          'apikey': SUPABASE_ANON_KEY,
          'x-admin-token': t,
        },
      });
      if (!res.ok) return { ok: false };
      const data = await res.json().catch(() => ({}));
      return { ok: true, exp: data?.exp };
    } catch {
      return { ok: false };
    }
  };

  useEffect(() => {
    (async () => {
      const storedToken = localStorage.getItem(TOKEN_KEY);
      const storedExp = localStorage.getItem(EXPIRES_KEY);

      if (storedToken && storedExp) {
        const exp = Number(storedExp);
        if (Date.now() < exp) {
          const check = await callCheck(storedToken);
          if (check.ok) {
            setToken(storedToken);
            // Use server-returned exp if available, otherwise keep stored value
            setExpiresAt(check.exp ?? exp);
            setStatus('valid');
            return;
          }
        }
        clearSession();
        return;
      }

      const legacySecret = localStorage.getItem('admin_secret') || localStorage.getItem('admin_import_secret');
      if (legacySecret) {
        const result = await callLogin(legacySecret);
        if (result.ok && result.token && result.expiresAt) {
          persist(result.token, result.expiresAt);
          localStorage.removeItem('admin_secret');
          localStorage.removeItem('admin_import_secret');
          localStorage.removeItem('admin_logo_upload_secret');
          return;
        }
        localStorage.removeItem('admin_secret');
        localStorage.removeItem('admin_import_secret');
        localStorage.removeItem('admin_logo_upload_secret');
      }

      setStatus('invalid');
    })();
  }, []);

  const login = useCallback(async (secret: string): Promise<{ ok: boolean; error?: string }> => {
    const result = await callLogin(secret);
    if (result.ok && result.token && result.expiresAt) {
      persist(result.token, result.expiresAt);
      return { ok: true };
    }
    return { ok: false, error: result.error };
  }, []);

  const logout = useCallback(() => {
    clearSession(true);
  }, [clearSession]);

  const ensureValid = useCallback(async (): Promise<boolean> => {
    if (!token) return false;
    if (expiresAt && Date.now() > expiresAt) { clearSession(); return false; }
    const check = await callCheck(token);
    if (!check.ok) { clearSession(); return false; }
    return true;
  }, [token, expiresAt, clearSession]);

  const waitForSession = useCallback(async (): Promise<boolean> => {
    if (status === 'valid') return true;
    if (status === 'invalid') return false;
    return new Promise((resolve) => {
      const checkInterval = setInterval(() => {
        const currentStatus = localStorage.getItem(TOKEN_KEY) ? 'valid' : 'invalid';
        if (currentStatus !== 'loading') {
          clearInterval(checkInterval);
          resolve(currentStatus === 'valid');
        }
      }, 50);
      setTimeout(() => {
        clearInterval(checkInterval);
        resolve(false);
      }, 5000);
    });
  }, [status]);

  const isReady = status !== 'loading';
  const isValid = status === 'valid';

  return (
    <AdminSessionContext.Provider value={{ token, expiresAt, status, isReady, isValid, login, logout, ensureValid, waitForSession }}>
      {children}
    </AdminSessionContext.Provider>
  );
}

export function useAdminSession() {
  const ctx = useContext(AdminSessionContext);
  if (!ctx) throw new Error('useAdminSession must be used within AdminSessionProvider');
  return ctx;
}
