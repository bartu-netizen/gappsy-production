import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createSessionToken, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    const { secret } = await req.json();

    if (!secret || typeof secret !== "string") {
      return new Response(JSON.stringify({ error: "MISSING_SECRET", message: "Secret is required" }), {
        status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    const expectedSecret = Deno.env.get("ADMIN_IMPORT_SECRET");

    if (!expectedSecret || expectedSecret.trim() === "") {
      return new Response(JSON.stringify({
        error: "ADMIN_IMPORT_SECRET_NOT_CONFIGURED",
        message: "ADMIN_IMPORT_SECRET is not configured in backend secrets",
      }), {
        status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    if (secret.trim() !== expectedSecret.trim()) {
      return new Response(JSON.stringify({ error: "UNAUTHORIZED", message: "Invalid admin secret" }), {
        status: 401, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    let token: string;
    let expiresAt: number;
    try {
      ({ token, expiresAt } = await createSessionToken());
    } catch (sessionErr) {
      const msg = sessionErr instanceof Error ? sessionErr.message : String(sessionErr);
      const isMissingTable = msg.includes("admin_sessions") || msg.includes("schema cache") || msg.includes("does not exist");
      return new Response(JSON.stringify({
        error: "SESSION_STORAGE_ERROR",
        message: isMissingTable
          ? "Admin session storage is not initialized. The admin_sessions table is missing."
          : `Failed to create session: ${msg}`,
      }), {
        status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ token, expiresAt }), {
      status: 200, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (e) {
    return new Response(JSON.stringify({ error: "SERVER_ERROR", message: e instanceof Error ? e.message : "Unknown error" }), {
      status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
