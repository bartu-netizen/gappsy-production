import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, x-admin-token, x-admin-secret",
};

interface MergeRequest {
  canonical_id: string;
  duplicate_ids: string[];
  dry_run?: boolean;
}

interface MergeResult {
  success: boolean;
  dry_run: boolean;
  canonical_id: string;
  canonical_slug: string;
  duplicates_processed: number;
  emails_moved: number;
  phones_moved: number;
  duplicates_deactivated: number;
  error?: string;
}

async function validateAdmin(token: string, secret: string): Promise<boolean> {
  if (!token || !secret) return false;
  const ADMIN_SECRET = Deno.env.get("ADMIN_SECRET");
  return secret === ADMIN_SECRET;
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), {
      status: 405,
      headers: corsHeaders,
    });
  }

  try {
    const adminToken = req.headers.get("x-admin-token") || "";
    const adminSecret = req.headers.get("x-admin-secret") || "";

    if (!(await validateAdmin(adminToken, adminSecret))) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), {
        status: 401,
        headers: corsHeaders,
      });
    }

    const body = (await req.json()) as MergeRequest;
    const { canonical_id, duplicate_ids, dry_run = false } = body;

    if (!canonical_id || !Array.isArray(duplicate_ids) || duplicate_ids.length === 0) {
      return new Response(
        JSON.stringify({ error: "Missing canonical_id or duplicate_ids" }),
        { status: 400, headers: corsHeaders }
      );
    }

    const SUPABASE_URL = Deno.env.get("SUPABASE_URL") as string;
    const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") as string;
    const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    console.log(`[agency-identity-merge] Starting merge (dry_run=${dry_run})`);
    console.log(`[agency-identity-merge] Canonical: ${canonical_id}`);
    console.log(`[agency-identity-merge] Duplicates: ${duplicate_ids.length}`);

    // Get canonical agency info
    const { data: canonicalData, error: canonicalErr } = await supabase
      .from("other_agencies")
      .select("id, slug, name")
      .eq("id", canonical_id)
      .maybeSingle();

    if (canonicalErr || !canonicalData) {
      return new Response(
        JSON.stringify({ error: `Canonical agency not found: ${canonicalErr?.message}` }),
        { status: 400, headers: corsHeaders }
      );
    }

    console.log(`[agency-identity-merge] Canonical agency: ${canonicalData.name} (${canonicalData.slug})`);

    let emailsMoved = 0;
    let phonesMoved = 0;
    let duplicatesDeactivated = 0;

    if (!dry_run) {
      // Process each duplicate
      for (const dupId of duplicate_ids) {
        console.log(`[agency-identity-merge] Processing duplicate: ${dupId}`);

        // Get duplicate agency info
        const { data: dupData } = await supabase
          .from("other_agencies")
          .select("id, slug, name")
          .eq("id", dupId)
          .maybeSingle();

        if (dupData) {
          console.log(`[agency-identity-merge] Duplicate: ${dupData.name} (${dupData.slug})`);
        }

        // Move emails to canonical (skip if already exist)
        const { data: emailsToMove } = await supabase
          .from("other_agency_emails")
          .select("email_normalized")
          .eq("agency_id", dupId);

        const canonicalEmails = new Set<string>();
        const { data: existingEmails } = await supabase
          .from("other_agency_emails")
          .select("email_normalized")
          .eq("agency_id", canonical_id);

        if (existingEmails) {
          existingEmails.forEach((e) => {
            canonicalEmails.add(e.email_normalized);
          });
        }

        const emailsToInsert = (emailsToMove || [])
          .filter((e) => !canonicalEmails.has(e.email_normalized))
          .map((e) => ({
            agency_id: canonical_id,
            email_normalized: e.email_normalized,
            validation_status: "pending" as const,
            verification_state: "queued" as const,
          }));

        if (emailsToInsert.length > 0) {
          const { error: insertErr } = await supabase.from("other_agency_emails").insert(emailsToInsert);
          if (!insertErr) {
            emailsMoved += emailsToInsert.length;
            console.log(`[agency-identity-merge] Moved ${emailsToInsert.length} emails from ${dupId}`);
          } else {
            console.error(`[agency-identity-merge] Email insert error: ${insertErr.message}`);
          }
        }

        // Delete duplicate emails
        await supabase.from("other_agency_emails").delete().eq("agency_id", dupId);

        // Move phones to canonical (skip if already exist)
        const { data: phonesToMove } = await supabase
          .from("other_agency_phones")
          .select("phone_normalized")
          .eq("agency_id", dupId);

        const canonicalPhones = new Set<string>();
        const { data: existingPhones } = await supabase
          .from("other_agency_phones")
          .select("phone_normalized")
          .eq("agency_id", canonical_id);

        if (existingPhones) {
          existingPhones.forEach((p) => {
            if (p.phone_normalized) {
              canonicalPhones.add(p.phone_normalized);
            }
          });
        }

        const phonesToInsert = (phonesToMove || [])
          .filter((p) => p.phone_normalized && !canonicalPhones.has(p.phone_normalized))
          .map((p) => ({
            agency_id: canonical_id,
            phone_normalized: p.phone_normalized,
          }));

        if (phonesToInsert.length > 0) {
          const { error: insertErr } = await supabase.from("other_agency_phones").insert(phonesToInsert);
          if (!insertErr) {
            phonesMoved += phonesToInsert.length;
            console.log(`[agency-identity-merge] Moved ${phonesToInsert.length} phones from ${dupId}`);
          } else {
            console.error(`[agency-identity-merge] Phone insert error: ${insertErr.message}`);
          }
        }

        // Delete duplicate phones
        await supabase.from("other_agency_phones").delete().eq("agency_id", dupId);

        // Soft-delete duplicate agency
        const { error: deactivateErr } = await supabase
          .from("other_agencies")
          .update({
            is_active: false,
            agency_dedupe_key: null,
            global_identity_key: null,
          })
          .eq("id", dupId);

        if (!deactivateErr) {
          duplicatesDeactivated++;
          console.log(`[agency-identity-merge] Deactivated duplicate: ${dupId}`);
        }
      }

      console.log(
        `[agency-identity-merge] Merge complete: ${emailsMoved} emails, ${phonesMoved} phones, ${duplicatesDeactivated} deactivated`
      );
    } else {
      console.log("[agency-identity-merge] DRY RUN - no changes made");
      // For dry run, simulate the counts
      for (const dupId of duplicate_ids) {
        const { data: dupEmails } = await supabase
          .from("other_agency_emails")
          .select("email_normalized")
          .eq("agency_id", dupId);

        const canonicalEmails = new Set<string>();
        const { data: existingEmails } = await supabase
          .from("other_agency_emails")
          .select("email_normalized")
          .eq("agency_id", canonical_id);

        if (existingEmails) {
          existingEmails.forEach((e) => {
            canonicalEmails.add(e.email_normalized);
          });
        }

        emailsMoved += (dupEmails || []).filter((e) => !canonicalEmails.has(e.email_normalized)).length;

        const { data: dupPhones } = await supabase
          .from("other_agency_phones")
          .select("phone_normalized")
          .eq("agency_id", dupId);

        const canonicalPhones = new Set<string>();
        const { data: existingPhones } = await supabase
          .from("other_agency_phones")
          .select("phone_normalized")
          .eq("agency_id", canonical_id);

        if (existingPhones) {
          existingPhones.forEach((p) => {
            if (p.phone_normalized) {
              canonicalPhones.add(p.phone_normalized);
            }
          });
        }

        phonesMoved += (dupPhones || []).filter((p) => p.phone_normalized && !canonicalPhones.has(p.phone_normalized))
          .length;

        duplicatesDeactivated++;
      }
    }

    const result: MergeResult = {
      success: true,
      dry_run,
      canonical_id,
      canonical_slug: canonicalData.slug,
      duplicates_processed: duplicate_ids.length,
      emails_moved: emailsMoved,
      phones_moved: phonesMoved,
      duplicates_deactivated: duplicatesDeactivated,
    };

    return new Response(JSON.stringify(result), {
      status: 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    console.error("[agency-identity-merge] Error:", err);
    return new Response(JSON.stringify({ error: String(err) }), {
      status: 500,
      headers: corsHeaders,
    });
  }
});
