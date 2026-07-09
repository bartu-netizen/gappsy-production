import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { requireAdminSession, CORS_HEADERS } from "../_shared/adminSession.ts";

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: CORS_HEADERS });
  }

  try {
    // Verify admin session using modern session token system
    await requireAdminSession(req);

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase credentials");
    }

    const supabase = createClient(supabaseUrl, serviceRoleKey);

    // GET - Fetch single review by id
    if (req.method === "GET") {
      const url = new URL(req.url);
      const id = url.searchParams.get("id");

      if (!id) {
        return new Response(
          JSON.stringify({ ok: false, error: "Review ID is required" }),
          { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      const { data, error } = await supabase
        .from("agency_reviews")
        .select("*")
        .eq("id", id)
        .maybeSingle();

      if (error) {
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      if (!data) {
        return new Response(
          JSON.stringify({ ok: false, error: "Review not found" }),
          { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, data }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // POST - Create new review
    if (req.method === "POST") {
      const payload = await req.json();

      // Validate required fields
      if (!payload.agency_name || !payload.agency_slug || !payload.state_slug || !payload.review_type) {
        return new Response(
          JSON.stringify({ ok: false, error: "Missing required fields: agency_name, agency_slug, state_slug, review_type" }),
          { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      // Check slug uniqueness
      const { data: existing } = await supabase
        .from("agency_reviews")
        .select("id")
        .eq("agency_slug", payload.agency_slug)
        .maybeSingle();

      if (existing) {
        return new Response(
          JSON.stringify({ ok: false, error: `A review with slug "${payload.agency_slug}" already exists` }),
          { status: 409, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      // Prepare row for insert
      const now = new Date();
      const todayString = now.toISOString().split('T')[0]; // YYYY-MM-DD format

      const row = {
        agency_name: payload.agency_name,
        agency_slug: payload.agency_slug,
        state_slug: payload.state_slug,
        state_name: payload.state_name,
        city: payload.city || null,
        review_type: payload.review_type,
        is_top_25_ranked: payload.is_top_25_ranked || false,
        is_published: payload.is_published || false,
        website_url: payload.website_url || null,
        services_offered: payload.services_offered || [],
        target_clients: payload.target_clients || [],
        geographic_reach: payload.geographic_reach || [],
        team_size_range: payload.team_size_range || null,
        evaluation_status: payload.evaluation_status || null,
        about_description: payload.about_description || "",
        strengths: payload.strengths || [],
        concerns: payload.concerns || [],
        risk_factors: payload.risk_factors || [],
        fit_for: payload.fit_for || [],
        case_studies_status: payload.case_studies_status || null,
        pricing_transparency: payload.pricing_transparency || null,
        team_information: payload.team_information || null,
        independent_recognition: payload.independent_recognition || null,
        local_presence: payload.local_presence || null,
        entity_signals: payload.entity_signals || [],
        uniqueness_score: payload.uniqueness_score || 0,
        last_updated: todayString,
        change_log: payload.change_log || [],
        created_at: now.toISOString(),
        updated_at: now.toISOString(),
      };

      const { data, error } = await supabase
        .from("agency_reviews")
        .insert(row)
        .select()
        .single();

      if (error) {
        console.error("[agency-reviews-admin] Insert error:", error);
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, id: data.id, agency_slug: data.agency_slug }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // PUT - Update existing review
    if (req.method === "PUT") {
      const url = new URL(req.url);
      const id = url.searchParams.get("id");

      if (!id) {
        return new Response(
          JSON.stringify({ ok: false, error: "Review ID is required" }),
          { status: 400, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      const payload = await req.json();

      // Check if review exists
      const { data: existing } = await supabase
        .from("agency_reviews")
        .select("id, agency_slug")
        .eq("id", id)
        .maybeSingle();

      if (!existing) {
        return new Response(
          JSON.stringify({ ok: false, error: "Review not found" }),
          { status: 404, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      // If slug is being changed, check uniqueness
      if (payload.agency_slug && payload.agency_slug !== existing.agency_slug) {
        const { data: slugExists } = await supabase
          .from("agency_reviews")
          .select("id")
          .eq("agency_slug", payload.agency_slug)
          .neq("id", id)
          .maybeSingle();

        if (slugExists) {
          return new Response(
            JSON.stringify({ ok: false, error: `A review with slug "${payload.agency_slug}" already exists` }),
            { status: 409, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
          );
        }
      }

      // Prepare update
      const now = new Date();
      const todayString = now.toISOString().split('T')[0]; // YYYY-MM-DD format

      const updates: Record<string, any> = {
        updated_at: now.toISOString(),
        last_updated: todayString,
      };

      // Only include fields that are present in payload
      const fields = [
        "agency_name", "agency_slug", "state_slug", "state_name", "city",
        "review_type", "is_top_25_ranked", "is_published", "website_url",
        "services_offered", "target_clients", "geographic_reach",
        "team_size_range", "evaluation_status", "about_description",
        "strengths", "concerns", "risk_factors", "fit_for",
        "case_studies_status", "pricing_transparency", "team_information",
        "independent_recognition", "local_presence", "entity_signals",
        "uniqueness_score", "change_log"
      ];

      for (const field of fields) {
        if (payload.hasOwnProperty(field)) {
          updates[field] = payload[field];
        }
      }

      const { data, error } = await supabase
        .from("agency_reviews")
        .update(updates)
        .eq("id", id)
        .select()
        .single();

      if (error) {
        console.error("[agency-reviews-admin] Update error:", error);
        return new Response(
          JSON.stringify({ ok: false, error: error.message }),
          { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
        );
      }

      return new Response(
        JSON.stringify({ ok: true, id: data.id, agency_slug: data.agency_slug }),
        { headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ ok: false, error: "Method not allowed" }),
      { status: 405, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[agency-reviews-admin] Error:", error);

    // Handle authentication/session errors
    const errorMessage = error instanceof Error ? error.message : "Unknown error";
    if (errorMessage.includes("session") || errorMessage.includes("token") || errorMessage.includes("Missing admin")) {
      return new Response(
        JSON.stringify({
          ok: false,
          error: "Invalid or expired admin session",
        }),
        { status: 401, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
      );
    }

    // Handle other server errors
    return new Response(
      JSON.stringify({
        ok: false,
        error: errorMessage,
      }),
      { status: 500, headers: { ...CORS_HEADERS, "Content-Type": "application/json" } }
    );
  }
});
