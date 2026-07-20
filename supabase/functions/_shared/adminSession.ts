import { createClient } from "npm:@supabase/supabase-js@2";

export const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
  "Access-Control-Expose-Headers": "X-Excluded-Paid-Customer-Agency-Count, X-Future-Export-Protection",
};

export function extractToken(req: Request): string | null {
  const xToken = req.headers.get("x-admin-token") || "";
  if (xToken) return xToken.trim();
  const auth = req.headers.get("authorization") || req.headers.get("Authorization") || "";
  if (auth.startsWith("Bearer ")) {
    const token = auth.slice(7).trim();
    if (token && token !== (Deno.env.get("SUPABASE_ANON_KEY") ?? "")) return token;
  }
  return null;
}

export async function verifySessionToken(token: string): Promise<{ ok: boolean; error?: string; exp?: number }> {
  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !supabaseServiceKey) return { ok: false, error: "config" };

    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const { data, error } = await supabase
      .from("admin_sessions")
      .select("id, expires_at")
      .eq("token", token)
      .maybeSingle();

    if (error) {
      console.error("[verifySessionToken] DB error:", error.message);
      return { ok: false, error: "db_error" };
    }
    if (!data) return { ok: false, error: "invalid" };
    const expiresAt = new Date(data.expires_at);
    if (expiresAt < new Date()) return { ok: false, error: "expired" };
    return { ok: true, exp: expiresAt.getTime() };
  } catch (e) {
    console.error("[verifySessionToken] Exception:", e);
    return { ok: false, error: "exception" };
  }
}

export async function requireAdminSession(req: Request): Promise<{ exp: number }> {
  const token = extractToken(req);
  if (!token) throw new Error("Missing admin token");
  const result = await verifySessionToken(token);
  if (!result.ok) {
    if (result.error === "expired") throw new Error("Admin session expired — please login again");
    throw new Error("Invalid or expired admin session");
  }
  return { exp: result.exp ?? 0 };
}

export async function createSessionToken(): Promise<{ token: string; expiresAt: number }> {
  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !supabaseServiceKey) throw new Error("Supabase config missing");

  const supabase = createClient(supabaseUrl, supabaseServiceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const rawToken = Array.from(crypto.getRandomValues(new Uint8Array(32)))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");

  const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000);

  const { error } = await supabase.from("admin_sessions").insert({
    token: rawToken,
    expires_at: expiresAt.toISOString(),
    user_id: "admin",
    email: "admin@gappsy.com",
  });

  if (error) throw new Error(`Failed to create session: ${error.message}`);
  return { token: rawToken, expiresAt: expiresAt.getTime() };
}
