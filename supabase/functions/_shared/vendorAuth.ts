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

export interface VendorToolSummary {
  id: string;
  slug: string;
  name: string;
}

export class VendorAuthError extends Error {
  status: number;
  constructor(message: string, status = 401) {
    super(message);
    this.status = status;
  }
}

// Thrown instead of VendorAuthError when the account owns 2+ tools and no
// tool_id was given to disambiguate — carries the real owned-tools list so
// the caller can render a picker instead of just failing.
export class VendorMultipleToolsError extends VendorAuthError {
  tools: VendorToolSummary[];
  constructor(tools: VendorToolSummary[]) {
    super("Multiple listings are linked to this account — tool_id is required", 409);
    this.tools = tools;
  }
}

function extractBearerToken(req: Request): string | null {
  const header = req.headers.get("authorization") || req.headers.get("Authorization");
  if (!header?.startsWith("Bearer ")) return null;
  const token = header.slice(7).trim();
  return token || null;
}

async function resolveAuthUser(req: Request, supabase: SupabaseClient) {
  const token = extractBearerToken(req);
  if (!token) throw new VendorAuthError("Missing Authorization bearer token", 401);
  const { data: userData, error: userError } = await supabase.auth.getUser(token);
  if (userError || !userData?.user) throw new VendorAuthError("Invalid or expired session", 401);
  return userData.user;
}

// A given auth user can now own more than one tool (idx_tools_owner_user_id
// was a UNIQUE index until 20260724 — dropped once a real vendor got stuck
// unable to link a second paid listing under the same email). Callers that
// already know which tool (a stored tool_id, e.g. from a frontend
// tool-switcher) should pass it — this validates real ownership of THAT
// specific tool. Callers with no tool_id get the old single-tool behavior
// automatically when the account owns exactly one, and a
// VendorMultipleToolsError (with the real owned-tools list) when it owns
// more than one, so the frontend knows to ask instead of guessing.
export async function requireVendorSession(req: Request, supabase: SupabaseClient, toolId?: string | null): Promise<VendorSession> {
  const user = await resolveAuthUser(req, supabase);

  if (toolId) {
    const { data: tool, error: toolError } = await supabase
      .from("tools")
      .select("id, slug")
      .eq("owner_user_id", user.id)
      .eq("id", toolId)
      .maybeSingle();
    if (toolError) throw new VendorAuthError("Failed to resolve owned listing", 500);
    if (!tool) throw new VendorAuthError("This listing isn't linked to this account", 403);
    return { userId: user.id, email: user.email || "", toolId: tool.id, toolSlug: tool.slug };
  }

  const { data: ownedTools, error: toolsError } = await supabase
    .from("tools")
    .select("id, slug, name")
    .eq("owner_user_id", user.id)
    .order("created_at", { ascending: true });
  if (toolsError) throw new VendorAuthError("Failed to resolve owned listing", 500);
  if (!ownedTools || ownedTools.length === 0) throw new VendorAuthError("No listing is linked to this account", 403);
  if (ownedTools.length > 1) throw new VendorMultipleToolsError(ownedTools as VendorToolSummary[]);

  const tool = ownedTools[0];
  return { userId: user.id, email: user.email || "", toolId: tool.id, toolSlug: tool.slug };
}

// Used by the frontend's tool-switcher — lists every tool this account
// owns, independent of the single-tool resolution above (which would throw
// VendorMultipleToolsError before the picker could ever be shown).
export async function listVendorTools(req: Request, supabase: SupabaseClient): Promise<VendorToolSummary[]> {
  const user = await resolveAuthUser(req, supabase);
  const { data, error } = await supabase
    .from("tools")
    .select("id, slug, name")
    .eq("owner_user_id", user.id)
    .order("created_at", { ascending: true });
  if (error) throw new VendorAuthError("Failed to resolve owned listings", 500);
  return (data || []) as VendorToolSummary[];
}

export function createServiceClient(): SupabaseClient {
  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !serviceRoleKey) throw new Error("Missing Supabase credentials");
  return createClient(supabaseUrl, serviceRoleKey);
}
