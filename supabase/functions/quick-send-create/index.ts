import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface CreateQuickSendPayload {
  toEmail: string;
  toName?: string;
  subject: string;
  htmlBody: string;
  textBody?: string;
}

interface CreateQuickSendResponse {
  id: string;
  status: string;
  toEmail: string;
  subject: string;
}

function validateEmail(email: string): boolean {
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return re.test(email);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ error: "Method not allowed" }),
      {
        status: 405,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }

  try {
    const payload: CreateQuickSendPayload = await req.json();

    if (!payload.toEmail || !payload.subject || !payload.htmlBody) {
      return new Response(
        JSON.stringify({ error: "Missing required fields: toEmail, subject, htmlBody" }),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    if (!validateEmail(payload.toEmail)) {
      return new Response(
        JSON.stringify({ error: "Invalid email address" }),
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

    const { data: msgRow, error: insertErr } = await supabase
      .from("email_messages")
      .insert({
        kind: "quick_send",
        to_email: payload.toEmail.trim(),
        to_name: payload.toName?.trim() || null,
        subject: payload.subject.trim(),
        html_body: payload.htmlBody,
        text_body: payload.textBody || null,
        from_name: "Gappsy",
        from_email: "noreply@gappsy.com",
        status: "queued",
      })
      .select("id, status, to_email, subject")
      .single();

    if (insertErr || !msgRow) {
      console.error("Insert error:", insertErr);
      return new Response(
        JSON.stringify({ error: insertErr?.message || "Failed to create message" }),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const response: CreateQuickSendResponse = {
      id: msgRow.id,
      status: msgRow.status,
      toEmail: msgRow.to_email,
      subject: msgRow.subject,
    };

    return new Response(JSON.stringify(response), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Quick send create error:", error);
    return new Response(
      JSON.stringify({
        error: error instanceof Error ? error.message : "Failed to create quick send",
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
