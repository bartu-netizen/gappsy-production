import { createClient } from "npm:@supabase/supabase-js@2";
import { verifySessionToken, extractToken } from "./adminSession.ts";

export interface AuthResult {
  success: boolean;
  sessionType?: "session_token" | "admin_secret";
  error?: { code: string; message: string; diagnostics?: Record<string, unknown> };
}

export interface AuditLogEntry {
  actor_session_type: string;
  actor_email?: string;
  action: string;
  target_table?: string;
  target_id?: string;
  state_slug?: string;
  payload_hash?: string;
  ip?: string;
  user_agent?: string;
  status: "success" | "rejected" | "error";
  rejection_reason?: string;
}

export async function authenticateAdmin(req: Request): Promise<AuthResult> {
  try {
    const token = extractToken(req);
    const xAdminSecret = req.headers.get("x-admin-secret")?.trim() || "";

    if (!token && !xAdminSecret) {
      return { success: false, error: { code: "NO_CREDENTIALS", message: "Missing authentication credentials" } };
    }

    if (token) {
      const result = await verifySessionToken(token);
      if (result.ok) return { success: true, sessionType: "session_token" };
      const expiredMsg = "Admin session expired — please login again";
      const invalidMsg = "Invalid or expired admin session";
      const msg = result.error === "expired" ? expiredMsg : invalidMsg;
      console.log(`[authenticateAdmin] token present but invalid: error=${result.error}`);
      return { success: false, error: { code: "UNAUTHORIZED", message: msg } };
    }

    if (xAdminSecret) {
      const supabaseUrl = Deno.env.get("SUPABASE_URL");
      const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
      if (!supabaseUrl || !supabaseServiceKey) {
        return { success: false, error: { code: "SERVER_CONFIG_ERROR", message: "Server configuration error" } };
      }
      const supabase = createClient(supabaseUrl, supabaseServiceKey, {
        auth: { autoRefreshToken: false, persistSession: false },
      });
      const { data: secretData, error: secretError } = await supabase
        .from("admin_secrets")
        .select("value")
        .eq("key", "ADMIN_IMPORT_SECRET")
        .maybeSingle();
      if (secretError || !secretData?.value) {
        return { success: false, error: { code: "ADMIN_IMPORT_SECRET_NOT_CONFIGURED", message: "Admin secret not configured" } };
      }
      if (xAdminSecret === secretData.value.trim()) return { success: true, sessionType: "admin_secret" };
    }

    return { success: false, error: { code: "UNAUTHORIZED", message: "Invalid credentials" } };
  } catch (error) {
    return { success: false, error: { code: "AUTH_ERROR", message: error instanceof Error ? error.message : "Unknown error" } };
  }
}

export function createAuthErrorResponse(authResult: AuthResult, corsHeaders: Record<string, string>): Response {
  if (authResult.success) throw new Error("Cannot create error response for successful auth");
  const statusMap: Record<string, number> = {
    NO_CREDENTIALS: 401, UNAUTHORIZED: 401,
    ADMIN_IMPORT_SECRET_NOT_CONFIGURED: 500, SERVER_CONFIG_ERROR: 500, AUTH_ERROR: 500,
  };
  const status = statusMap[authResult.error!.code] || 500;
  return new Response(
    JSON.stringify({ error: authResult.error!.code, message: authResult.error!.message }),
    { status, headers: { ...corsHeaders, "Content-Type": "application/json" } }
  );
}

export async function writeAuditLog(entry: AuditLogEntry): Promise<void> {
  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !supabaseServiceKey) return;
    const supabase = createClient(supabaseUrl, supabaseServiceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });
    await supabase.from("admin_audit_log").insert(entry);
  } catch { /* audit log failures must never crash main operation */ }
}

export function getRequestMeta(req: Request): { ip: string; userAgent: string } {
  const ip = req.headers.get("cf-connecting-ip") ||
    req.headers.get("x-forwarded-for")?.split(",")[0].trim() || "unknown";
  const userAgent = req.headers.get("user-agent") || "unknown";
  return { ip, userAgent };
}

export async function hashPayload(payload: unknown): Promise<string> {
  try {
    const data = typeof payload === "string" ? payload : JSON.stringify(payload);
    const buf = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(data));
    return Array.from(new Uint8Array(buf)).map((b) => b.toString(16).padStart(2, "0")).join("");
  } catch { return "hash_failed"; }
}
