import { createClient, type SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";

// Vendor-dashboard auth: distinct from admin's requireAdminSession (shared
// secret + opaque token) — this validates a REAL Supabase Auth access token
// (the anon client-side session, not the anon/service key) and resolves it
// to the tool the caller actually owns via tools.owner_user_id. Every vendor
// edge function must call this before touching any tool data.

export interface VendorSession {
  userId: string;
  email: string;
  toolId: string;
  toolSlug: string;
}

export class VendorAuthError extends Error {
  status: number;
  constructor(message: string, status = 401) {
    super(message);
    this.status = status;
  }
}

function extractBearerToken(req: Request): string | null {
  const header = req.headers.get("authorization") || req.headers.get("Authorization");
  if (!header?.startsWith("Bearer ")) return null;
  const token = header.slice(7).trim();
  return token || null;
}

export async function requireVendorSession(req: Request, supabase: SupabaseClient): Promise<VendorSession> {
  const token = extractBearerToken(req);
  if (!token) throw new VendorAuthError("Missing Authorization bearer token", 401);

  const { data: userData, error: userError } = await supabase.auth.getUser(token);
  if (userError || !userData?.user) throw new VendorAuthError("Invalid or expired session", 401);

  const { data: tool, error: toolError } = await supabase
    .from("tools")
    .select("id, slug")
    .eq("owner_user_id", userData.user.id)
    .maybeSingle();
  if (toolError) throw new VendorAuthError("Failed to resolve owned listing", 500);
  if (!tool) throw new VendorAuthError("No listing is linked to this account", 403);

  return {
    userId: userData.user.id,
    email: userData.user.email || "",
    toolId: tool.id,
    toolSlug: tool.slug,
  };
}

export function createServiceClient(): SupabaseClient {
  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
  return createClient(supabaseUrl, serviceRoleKey);
}
