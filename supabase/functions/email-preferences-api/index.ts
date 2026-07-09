import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
  const supabase = createClient(supabaseUrl, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const url = new URL(req.url);
  const token = url.searchParams.get("token");

  try {
    // GET — load preferences by token
    if (req.method === "GET") {
      if (!token) {
        return json({ ok: false, error: "token required" }, 400);
      }

      const { data, error } = await supabase
        .from("agency_email_preferences")
        .select("agency_id, email, allow_lead_emails, allow_marketing_emails")
        .eq("unsub_token", token)
        .maybeSingle();

      if (error || !data) {
        return json({ ok: false, error: "Token not found" }, 404);
      }

      return json({ ok: true, preferences: data });
    }

    // POST — update preferences
    if (req.method === "POST") {
      if (!token) {
        return json({ ok: false, error: "token required" }, 400);
      }

      let body: any;
      try {
        body = await req.json();
      } catch {
        return json({ ok: false, error: "Invalid JSON" }, 400);
      }

      const { allow_lead_emails, allow_marketing_emails } = body;

      const { error } = await supabase
        .from("agency_email_preferences")
        .update({
          allow_lead_emails: allow_lead_emails ?? true,
          allow_marketing_emails: allow_marketing_emails ?? true,
          updated_at: new Date().toISOString(),
        })
        .eq("unsub_token", token);

      if (error) {
        return json({ ok: false, error: error.message }, 500);
      }

      return json({ ok: true });
    }

    return json({ ok: false, error: "Method not allowed" }, 405);
  } catch (e: unknown) {
    console.error("[email-preferences-api]", e);
    return json({ ok: false, error: "Internal server error" }, 500);
  }
});
