import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const url = new URL(req.url);
    const messageId = url.searchParams.get("mid");
    const sendId = url.searchParams.get("sid");
    const originalUrl = url.searchParams.get("u");

    if ((!messageId && !sendId) || !originalUrl) {
      return new Response(
        JSON.stringify({ error: "Missing parameters" }),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceRole) {
      return new Response(
        JSON.stringify({ error: "Server configuration error" }),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRole);
    const userAgent = req.headers.get("user-agent") || "";
    const ipHash = req.headers.get("x-forwarded-for") || "unknown";
    const decodedUrl = decodeURIComponent(originalUrl);

    // Legacy: track on email_messages table
    if (messageId) {
      const messageCheck = await supabase
        .from("email_messages")
        .select("id")
        .eq("id", messageId)
        .maybeSingle();

      if (messageCheck.data) {
        await supabase.from("email_events").insert({
          email_message_id: messageId,
          event_type: "click",
          url: decodedUrl,
          user_agent: userAgent,
          ip_hash: ipHash,
        });
      }
    }

    // New: track on em_sends table
    if (sendId) {
      const sendCheck = await supabase
        .from("em_sends")
        .select("id")
        .eq("id", sendId)
        .maybeSingle();

      if (sendCheck.data) {
        await supabase.from("em_click_events").insert({
          send_id: sendId,
          url: decodedUrl,
          ua: userAgent,
          ip_hash: ipHash,
        });
      }
    }

    return new Response(null, {
      status: 302,
      headers: {
        ...corsHeaders,
        Location: decodedUrl,
        "Cache-Control": "no-store, no-cache, must-revalidate, max-age=0",
      },
    });
  } catch (error) {
    console.error("Click tracking error:", error);
    return new Response(
      JSON.stringify({ error: "Internal server error" }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
