import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    // Also accept token passed in JSON body (for backwards compat with callCheck)
    let enrichedReq = req;
    if (req.method === "POST") {
      const cloned = req.clone();
      try {
        const body = await cloned.json();
        if (body?.token && !req.headers.get("x-admin-token") && !req.headers.get("Authorization")?.replace(/^Bearer\s+/i, "").trim()) {
          // Rebuild request with token in header
          const headers = new Headers(req.headers);
          headers.set("x-admin-token", body.token);
          enrichedReq = new Request(req.url, { method: req.method, headers, body: null });
        }
      } catch {
        // Body not JSON — proceed with original request
      }
    }

    const result = await requireAdminSession(enrichedReq);

    return new Response(JSON.stringify({ ok: true, valid: true, exp: result.exp }), {
      status: 200,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  } catch (e) {
    const msg = e instanceof Error ? e.message : String(e);
    return new Response(JSON.stringify({ ok: false, error: msg }), {
      status: 500,
      headers: { ...CORS_HEADERS, "Content-Type": "application/json" },
    });
  }
});
