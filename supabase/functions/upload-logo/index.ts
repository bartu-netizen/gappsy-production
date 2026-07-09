import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

const MAX_FILE_SIZE = 2 * 1024 * 1024;
const ALLOWED_TYPES = ["image/png", "image/jpeg", "image/jpg", "image/webp", "image/svg+xml"];

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const contentType = req.headers.get("content-type") || "";
    if (!contentType.includes("multipart/form-data")) {
      return new Response(
        JSON.stringify({ error: "Content-Type must be multipart/form-data" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const formData = await req.formData();
    const file = formData.get("logo") as File;
    const agencyId = formData.get("agencyId") as string;
    const top25SlotId = formData.get("top25SlotId") as string | null;
    const stateSlug = formData.get("stateSlug") as string | null;
    const rankRaw = formData.get("rank") as string | null;
    const rank = rankRaw ? parseInt(rankRaw) : null;

    if (!file) {
      return new Response(
        JSON.stringify({ error: "No file provided" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (!agencyId) {
      return new Response(
        JSON.stringify({ error: "Missing agencyId" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (!ALLOWED_TYPES.includes(file.type)) {
      return new Response(
        JSON.stringify({ error: "Invalid file type", details: "Allowed types: PNG, JPG, WebP, SVG" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (file.size > MAX_FILE_SIZE) {
      return new Response(
        JSON.stringify({ error: "File too large", details: "Maximum file size is 2MB" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    console.log("[upload-logo] Starting upload", { agencyId, top25SlotId, stateSlug, rank, fileType: file.type, fileSize: file.size });

    // --- Storage upload ---
    const fileExt = file.name.split(".").pop();
    const fileName = `${agencyId}/logo-${Date.now()}.${fileExt}`;
    const filePath = `logos/${fileName}`;

    const arrayBuffer = await file.arrayBuffer();
    const { error: uploadError } = await supabase.storage
      .from("agency-logos")
      .upload(filePath, new Uint8Array(arrayBuffer), { contentType: file.type, upsert: true });

    if (uploadError) {
      console.error("[upload-logo] Storage upload failed:", uploadError);
      return new Response(
        JSON.stringify({ error: "Failed to upload file", details: uploadError.message }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const { data: urlData } = supabase.storage.from("agency-logos").getPublicUrl(filePath);
    const logoUrl = urlData.publicUrl;
    console.log("[upload-logo] Storage upload success:", logoUrl);

    const dbErrors: string[] = [];
    const dbUpdates: Record<string, string> = {};

    // --- 1. Update other_agencies (canonical for all listing types) ---
    const { error: agencyErr } = await supabase
      .from("other_agencies")
      .update({ logo_url: logoUrl })
      .eq("id", agencyId);

    if (agencyErr) {
      const msg = `other_agencies update failed: ${agencyErr.message}`;
      console.error("[upload-logo]", msg);
      dbErrors.push(msg);
    } else {
      dbUpdates["other_agencies"] = "success";
      console.log("[upload-logo] other_agencies.logo_url updated for agency", agencyId);
    }

    // --- 2. Update top25_slots ---
    // Priority: top25SlotId > (state_slug + rank) > (agency_id + state_slug + is_paid)
    if (top25SlotId) {
      const { error: slotErr } = await supabase
        .from("top25_slots")
        .update({ logo_url: logoUrl, updated_at: new Date().toISOString() })
        .eq("id", top25SlotId);

      if (slotErr) {
        const msg = `top25_slots update by id failed: ${slotErr.message}`;
        console.error("[upload-logo]", msg);
        dbErrors.push(msg);
      } else {
        dbUpdates["top25_slots"] = `success (by slot id: ${top25SlotId})`;
        console.log("[upload-logo] top25_slots.logo_url updated for slot", top25SlotId);
      }
    } else if (stateSlug && rank != null && !isNaN(rank)) {
      // Unambiguous: paid slot identified by (state_slug, rank)
      const { error: slotErr } = await supabase
        .from("top25_slots")
        .update({ logo_url: logoUrl, updated_at: new Date().toISOString() })
        .eq("state_slug", stateSlug)
        .eq("rank", rank)
        .eq("is_paid", true);

      if (slotErr) {
        const msg = `top25_slots update by (state,rank) failed: ${slotErr.message}`;
        console.error("[upload-logo]", msg);
        dbErrors.push(msg);
      } else {
        dbUpdates["top25_slots"] = `success (by state=${stateSlug} rank=${rank})`;
        console.log("[upload-logo] top25_slots.logo_url updated for", stateSlug, "rank", rank);
      }
    } else if (stateSlug) {
      // Fallback: agency_id + state_slug, paid slots only
      const { error: slotErr } = await supabase
        .from("top25_slots")
        .update({ logo_url: logoUrl, updated_at: new Date().toISOString() })
        .eq("agency_id", agencyId)
        .eq("state_slug", stateSlug)
        .eq("is_paid", true);

      if (slotErr) {
        const msg = `top25_slots fallback update failed: ${slotErr.message}`;
        console.error("[upload-logo]", msg);
        dbErrors.push(msg);
      } else {
        dbUpdates["top25_slots"] = `success (by agency_id + state fallback)`;
        console.log("[upload-logo] top25_slots.logo_url updated via fallback for state", stateSlug);
      }
    } else {
      dbUpdates["top25_slots"] = "skipped (no slot identifier provided)";
      console.log("[upload-logo] No top25_slots identifier — skipping top25_slots update");
    }

    console.log("[upload-logo] DB update summary:", dbUpdates);
    if (dbErrors.length) {
      console.warn("[upload-logo] DB errors:", dbErrors);
    }

    return new Response(
      JSON.stringify({
        success: true,
        logoUrl,
        dbUpdates,
        dbErrors: dbErrors.length ? dbErrors : undefined,
      }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[upload-logo] Unhandled error:", error);
    return new Response(
      JSON.stringify({ error: "Failed to process logo upload", details: error instanceof Error ? error.message : "Unknown error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
