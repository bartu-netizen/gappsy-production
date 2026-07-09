import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const GIF_PIXEL = new Uint8Array([
  0x47, 0x49, 0x46, 0x38, 0x39, 0x61, 0x01, 0x00, 0x01, 0x00, 0x80,
  0x00, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x21, 0xf9, 0x04,
  0x01, 0x0a, 0x00, 0x01, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x00, 0x01,
  0x00, 0x01, 0x00, 0x00, 0x02, 0x02, 0x44, 0x01, 0x00, 0x3b,
]);

const NO_CACHE_HEADERS = {
  "Content-Type": "image/gif",
  "Cache-Control": "no-store, no-cache, must-revalidate, max-age=0",
  "Pragma": "no-cache",
  "Expires": "0",
};

const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function pixelResponse(): Response {
  return new Response(GIF_PIXEL, {
    status: 200,
    headers: { ...CORS_HEADERS, ...NO_CACHE_HEADERS },
  });
}

async function sha256Hex(text: string): Promise<string> {
  const data = new TextEncoder().encode(text);
  const hashBuf = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(hashBuf))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

function normalizeUA(ua: string): string {
  return ua
    .toLowerCase()
    .trim()
    .replace(/\b\d{2,}\.\d[\d.]*\b/g, "VER")
    .replace(/\s+/g, " ")
    .substring(0, 200);
}

function ipPrefix(rawIp: string): string {
  const first = rawIp.split(",")[0].trim();
  const parts = first.split(".");
  if (parts.length === 4) {
    return parts.slice(0, 3).join(".");
  }
  return first.substring(0, 16);
}

async function buildDedupeKey(
  messageId: string,
  ua: string,
  rawIp: string
): Promise<string> {
  const uaNorm = normalizeUA(ua);
  const prefix = ipPrefix(rawIp);
  const bucket = Math.floor(Date.now() / 60000);
  return sha256Hex(`${messageId}|${uaNorm}|${prefix}|${bucket}`);
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const url = new URL(req.url);
    const messageId = url.searchParams.get("mid");
    const sendId = url.searchParams.get("sid");

    if (!messageId && !sendId) {
      return pixelResponse();
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceRole) {
      return pixelResponse();
    }

    const supabase = createClient(supabaseUrl, supabaseServiceRole, {
      auth: { persistSession: false },
    });

    const userAgent = req.headers.get("user-agent") || "";
    const rawIp = req.headers.get("x-forwarded-for") || req.headers.get("x-real-ip") || "unknown";

    if (messageId) {
      const { data: msgRow } = await supabase
        .from("email_messages")
        .select("id")
        .eq("id", messageId)
        .maybeSingle();

      if (msgRow) {
        const dedupeKey = await buildDedupeKey(messageId, userAgent, rawIp);

        const { error: insertErr } = await supabase
          .from("email_events")
          .insert({
            email_message_id: messageId,
            event_type: "open",
            user_agent: userAgent,
            ip_hash: ipPrefix(rawIp),
            dedupe_key: dedupeKey,
          })
          .select("id")
          .maybeSingle();

        if (insertErr) {
          if (
            insertErr.code === "23505" ||
            (insertErr.message && insertErr.message.includes("duplicate"))
          ) {
            console.log(`[email-track-open] dedupe hit for message=${messageId} key=${dedupeKey.substring(0, 8)}`);
          } else {
            console.error("[email-track-open] insert error:", insertErr);
          }
        } else {
          console.log(`[email-track-open] open recorded message=${messageId}`);
        }
      }
    }

    if (sendId) {
      const { data: sendRow } = await supabase
        .from("em_sends")
        .select("id")
        .eq("id", sendId)
        .maybeSingle();

      if (sendRow) {
        await supabase.from("em_open_events").insert({
          send_id: sendId,
          ua: userAgent,
          ip_hash: ipPrefix(rawIp),
        });
      }
    }

    return pixelResponse();
  } catch (error) {
    console.error("[email-track-open] error:", error);
    return pixelResponse();
  }
});
