import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { authenticateAdmin, createAuthErrorResponse } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const url = new URL(req.url);
    const pathname = url.pathname;

    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    if (!supabaseUrl || !serviceRoleKey) {
      throw new Error("Missing Supabase configuration");
    }

    // Authenticate admin first (will throw or return auth result)
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      return createAuthErrorResponse(authResult, corsHeaders);
    }

    // Use service-role client for admin operations
    const supabase = createClient(supabaseUrl, serviceRoleKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    // GET /other-agencies-admin/{id} - Get agency details
    if (req.method === "GET" && pathname.includes("/other-agencies-admin/")) {
      const id = pathname.split("/").pop();
      if (!id) {
        return new Response(
          JSON.stringify({ ok: false, error: "Missing agency ID" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const { data, error } = await supabase
        .from("other_agencies")
        .select("id, name, slug, state_slug, is_active, website_url, phone, city, description, services, primary_service, email, zip_code, full_address, maps_url, latitude, longitude, maps_position, keyword, facebook_url, instagram_url, twitter_url, youtube_url, linkedin_url")
        .eq("id", id)
        .maybeSingle();

      if (error) {
        throw error;
      }

      if (!data) {
        return new Response(
          JSON.stringify({ ok: false, error: "Agency not found" }),
          { status: 404, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      // Fetch emails from other_agency_emails table
      const { data: emailRows, error: emailError } = await supabase
        .from("other_agency_emails")
        .select("id, email_raw, email_normalized, validation_status, validation_provider, validation_reason, validation_checked_at, validation_score, is_primary")
        .eq("agency_id", id)
        .order("is_primary", { ascending: false })
        .order("created_at", { ascending: true });

      if (emailError) {
        console.error("Error fetching emails:", emailError);
      }

      // Auto-heal: split any comma/semicolon-joined emails in rows
      let emails = (emailRows || []).flatMap((emailRow: any) => {
        const normalized = (emailRow.email_normalized || '').trim();
        // Check if row contains delimiters (comma, semicolon, newline)
        if (normalized.includes(',') || normalized.includes(';') || normalized.includes('\n')) {
          // Split and normalize
          return normalized
            .split(/[,;\n]+/)
            .map((e: string) => e.trim().toLowerCase())
            .filter((e: string) => e && e.includes('@'))
            .map((e: string, idx: number) => ({
              ...emailRow,
              email_raw: e,
              email_normalized: e,
              is_primary: idx === 0, // First split becomes primary
            }));
        }
        return [emailRow];
      });

      // Dedupe by email_normalized (keep first occurrence's metadata)
      const seenEmails = new Set<string>();
      emails = emails.filter((e: any) => {
        const norm = (e.email_normalized || '').toLowerCase();
        if (seenEmails.has(norm)) {
          return false;
        }
        seenEmails.add(norm);
        return true;
      });

      // Ensure exactly one primary if any emails exist
      if (emails.length > 0) {
        const primaryIdx = emails.findIndex((e: any) => e.is_primary);
        emails = emails.map((e: any, idx: number) => ({
          ...e,
          is_primary: idx === (primaryIdx >= 0 ? primaryIdx : 0),
        }));
      }

      // Fallback: if no emails from other_agency_emails, try to split legacy email field
      if (emails.length === 0 && data.email) {
        // Try to parse legacy email (might be CSV or single)
        const legacyEmails = data.email
          .split(/[,;\n]+/)
          .map((e: string) => e.trim().toLowerCase())
          .filter((e: string) => e && e.includes('@'));

        emails = legacyEmails.map((e: string, idx: number) => ({
          id: `legacy-${idx}`,
          email_raw: e,
          email_normalized: e,
          validation_status: 'pending',
          validation_provider: null,
          validation_reason: null,
          validation_checked_at: null,
          validation_score: null,
          is_primary: idx === 0,
        }));
      }

      // Fetch phones from other_agency_phones table
      const { data: phoneRows, error: phoneError } = await supabase
        .from("other_agency_phones")
        .select("id, phone_raw, phone_normalized, is_primary, sms_opt_out, sms_verification_status, sms_verification_reason, line_type, country_code")
        .eq("agency_id", id)
        .order("is_primary", { ascending: false })
        .order("created_at", { ascending: true });

      if (phoneError) {
        console.error("Error fetching phones:", phoneError);
      }

      const phones = phoneRows || [];

      const agencyWithDetails = {
        ...data,
        emails,
        phones,
      };

      return new Response(
        JSON.stringify({ ok: true, agency: agencyWithDetails }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // PUT /other-agencies-admin/{id} - Update agency
    if (req.method === "PUT" && pathname.includes("/other-agencies-admin/")) {
      const id = pathname.split("/").pop();
      if (!id) {
        return new Response(
          JSON.stringify({ ok: false, error: "Missing agency ID" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const body = await req.json();

      const updateData: any = {
        name: body.name !== undefined ? body.name : undefined,
        website_url: body.website_url !== undefined ? body.website_url : undefined,
        phone: body.phone !== undefined ? body.phone : undefined,
        services: body.services !== undefined ? body.services : undefined,
        primary_service: body.primary_service !== undefined ? body.primary_service : undefined,
        is_active: body.is_active !== undefined ? body.is_active : undefined,
        zip_code: body.zip_code !== undefined ? body.zip_code : undefined,
        full_address: body.full_address !== undefined ? body.full_address : undefined,
        maps_url: body.maps_url !== undefined ? body.maps_url : undefined,
        latitude: body.latitude !== undefined ? body.latitude : undefined,
        longitude: body.longitude !== undefined ? body.longitude : undefined,
        maps_position: body.maps_position !== undefined ? body.maps_position : undefined,
        keyword: body.keyword !== undefined ? body.keyword : undefined,
        facebook_url: body.facebook_url !== undefined ? body.facebook_url : undefined,
        instagram_url: body.instagram_url !== undefined ? body.instagram_url : undefined,
        twitter_url: body.twitter_url !== undefined ? body.twitter_url : undefined,
        youtube_url: body.youtube_url !== undefined ? body.youtube_url : undefined,
        linkedin_url: body.linkedin_url !== undefined ? body.linkedin_url : undefined,
        updated_at: new Date().toISOString(),
      };

      // Remove undefined values
      Object.keys(updateData).forEach(
        key => updateData[key] === undefined && delete updateData[key]
      );

      const { data, error } = await supabase
        .from("other_agencies")
        .update(updateData)
        .eq("id", id)
        .select()
        .single();

      if (error) {
        throw error;
      }

      // Handle email sync if emails array provided
      if (Array.isArray(body.emails)) {
        // Defensively split each email input on [, ; \n] before normalizing
        const allEmails: string[] = [];
        body.emails.forEach((emailInput: string) => {
          const input = (emailInput || '').trim();
          // Split on comma, semicolon, or newline
          input.split(/[,;\n]+/).forEach((part: string) => {
            const trimmed = part.trim().toLowerCase();
            if (trimmed && trimmed.includes('@')) {
              allEmails.push(trimmed);
            }
          });
        });

        // Normalize and dedupe emails: trim, lowercase, filter empty/invalid, dedupe
        const normalizedEmails = allEmails
          .filter((e: string, i: number, arr: string[]) => arr.indexOf(e) === i);

        // Get existing emails for this agency
        const { data: existingEmails } = await supabase
          .from("other_agency_emails")
          .select("id, email_normalized, is_primary")
          .eq("agency_id", id);

        const existingMap = new Map((existingEmails || []).map(e => [e.email_normalized, e]));

        // Delete emails that are no longer in the submitted list
        const toDelete = (existingEmails || []).filter(
          e => !normalizedEmails.includes(e.email_normalized)
        );

        if (toDelete.length > 0) {
          await supabase
            .from("other_agency_emails")
            .delete()
            .in("id", toDelete.map(e => e.id));
        }

        // Upsert new emails and update primary flag
        for (let idx = 0; idx < normalizedEmails.length; idx++) {
          const email = normalizedEmails[idx];
          const isPrimary = idx === 0; // First email is always primary
          const existing = existingMap.get(email);

          if (existing) {
            // Email exists: update is_primary if needed
            if (existing.is_primary !== isPrimary) {
              await supabase
                .from("other_agency_emails")
                .update({ is_primary: isPrimary })
                .eq("id", existing.id);
            }
          } else {
            // New email: insert with primary flag
            await supabase
              .from("other_agency_emails")
              .insert({
                agency_id: id,
                email_raw: email,
                email_normalized: email,
                validation_status: 'pending',
                is_primary: isPrimary,
              });
          }
        }

        // Ensure exactly one primary: reset all to false, then set first to true
        if (normalizedEmails.length > 0) {
          await supabase
            .from("other_agency_emails")
            .update({ is_primary: false })
            .eq("agency_id", id);

          // Set first email as primary
          const { data: firstEmail } = await supabase
            .from("other_agency_emails")
            .select("id")
            .eq("agency_id", id)
            .eq("email_normalized", normalizedEmails[0])
            .maybeSingle();

          if (firstEmail) {
            await supabase
              .from("other_agency_emails")
              .update({ is_primary: true })
              .eq("id", firstEmail.id);
          }

          // Update main table with primary email (joined CSV of all unique normalized emails)
          await supabase
            .from("other_agencies")
            .update({ email: normalizedEmails.join(', ') })
            .eq("id", id);
        } else {
          // No emails: clear main table email
          await supabase
            .from("other_agencies")
            .update({ email: null })
            .eq("id", id);
        }
      }

      // Handle phone sync if phones array provided
      if (Array.isArray(body.phones)) {
        // Defensively split each phone input on [, ; \n] before normalizing
        const allPhones: string[] = [];
        body.phones.forEach((phoneInput: string) => {
          const input = (phoneInput || '').trim();
          // Split on comma, semicolon, or newline
          input.split(/[,;\n]+/).forEach((part: string) => {
            const trimmed = part.trim();
            if (trimmed && trimmed.length > 0) {
              allPhones.push(trimmed);
            }
          });
        });

        // Normalize phones (filter empty)
        const normalizedPhones = allPhones
          .filter((p: string, i: number, arr: string[]) => arr.indexOf(p) === i);

        // Get existing phones for this agency
        const { data: existingPhones } = await supabase
          .from("other_agency_phones")
          .select("id, phone_raw, phone_normalized, is_primary")
          .eq("agency_id", id);

        const existingMap = new Map((existingPhones || []).map(p => [p.phone_raw, p]));

        // Delete phones that are no longer in the submitted list
        const toDeletePhones = (existingPhones || []).filter(
          p => !normalizedPhones.includes(p.phone_raw)
        );

        if (toDeletePhones.length > 0) {
          await supabase
            .from("other_agency_phones")
            .delete()
            .in("id", toDeletePhones.map(p => p.id));
        }

        // Upsert new phones and update primary flag
        for (let idx = 0; idx < normalizedPhones.length; idx++) {
          const phone = normalizedPhones[idx];
          const isPrimary = idx === 0; // First phone is always primary
          const existing = existingMap.get(phone);

          if (existing) {
            // Phone exists: update is_primary if needed
            if (existing.is_primary !== isPrimary) {
              await supabase
                .from("other_agency_phones")
                .update({ is_primary: isPrimary })
                .eq("id", existing.id);
            }
          } else {
            // New phone: insert with primary flag
            await supabase
              .from("other_agency_phones")
              .insert({
                agency_id: id,
                phone_raw: phone,
                phone_normalized: phone,
                is_primary: isPrimary,
                source: 'admin',
              });
          }
        }

        // Ensure exactly one primary
        if (normalizedPhones.length > 0) {
          await supabase
            .from("other_agency_phones")
            .update({ is_primary: false })
            .eq("agency_id", id);

          // Set first phone as primary
          const { data: firstPhone } = await supabase
            .from("other_agency_phones")
            .select("id")
            .eq("agency_id", id)
            .eq("phone_raw", normalizedPhones[0])
            .maybeSingle();

          if (firstPhone) {
            await supabase
              .from("other_agency_phones")
              .update({ is_primary: true })
              .eq("id", firstPhone.id);
          }

          // Update main table with primary phone (first normalized phone)
          await supabase
            .from("other_agencies")
            .update({ phone: normalizedPhones[0] })
            .eq("id", id);
        } else {
          // No phones: clear main table phone
          await supabase
            .from("other_agencies")
            .update({ phone: null })
            .eq("id", id);
        }
      }

      // Sync to agency_listings_index for /your-agency search
      // This is CRITICAL: ensures every active other_agency is findable on /your-agency
      if (data) {
        const isActive = body.is_active !== undefined ? body.is_active : data.is_active;
        const agencyName = body.name !== undefined ? body.name : data.name;
        const agencySlug = data.slug || '';
        const stateSlug = data.state_slug || '';
        const agencyDomain = body.website_url !== undefined ? body.website_url : data.website_url;

        if (isActive && agencySlug && stateSlug && agencyName) {
          // Upsert active agency to index (always visible when active)
          const pagePath = `/explore/${stateSlug}?tab=other`;

          await supabase
            .from("agency_listings_index")
            .upsert(
              {
                agency_id: id,
                agency_slug: agencySlug,
                agency_name: agencyName,
                agency_domain: agencyDomain,
                state_slug: stateSlug,
                section: 'other',
                rank: null,
                other_position: 0,
                page_path: pagePath,
                is_visible: true,
                updated_at: new Date().toISOString(),
              },
              { onConflict: 'agency_id,state_slug,section' }
            );

          console.log(`[other-agencies-admin] Synced agency ${id} to index`);
        } else if (!isActive) {
          // Mark as invisible when deactivated (soft delete from search)
          await supabase
            .from("agency_listings_index")
            .update({ is_visible: false, updated_at: new Date().toISOString() })
            .eq("agency_id", id)
            .eq("section", "other");

          console.log(`[other-agencies-admin] Deactivated agency ${id} from index`);
        }
      }

      // Fetch updated agency with emails
      const { data: updatedAgency } = await supabase
        .from("other_agencies")
        .select("*")
        .eq("id", id)
        .maybeSingle();

      const { data: updatedEmails } = await supabase
        .from("other_agency_emails")
        .select("id, email_raw, email_normalized, validation_status, validation_provider, validation_reason, validation_checked_at, validation_score, is_primary")
        .eq("agency_id", id)
        .order("is_primary", { ascending: false })
        .order("created_at", { ascending: true });

      const agencyWithEmails = {
        ...updatedAgency,
        emails: updatedEmails || [],
      };

      return new Response(
        JSON.stringify({ ok: true, agency: agencyWithEmails }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // DELETE /other-agencies-admin/{id} - Deactivate agency (soft delete)
    if (req.method === "DELETE" && pathname.includes("/other-agencies-admin/")) {
      const id = pathname.split("/").pop();
      if (!id) {
        return new Response(
          JSON.stringify({ ok: false, error: "Missing agency ID" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      const { data, error } = await supabase
        .from("other_agencies")
        .update({ is_active: false, updated_at: new Date().toISOString() })
        .eq("id", id)
        .select()
        .single();

      if (error) {
        throw error;
      }

      // Deactivate in agency_listings_index
      if (data) {
        await supabase
          .from("agency_listings_index")
          .update({ is_active: false, updated_at: new Date().toISOString() })
          .eq("agency_id", id)
          .eq("section", "other");
      }

      return new Response(
        JSON.stringify({ ok: true, agency: data }),
        { headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    return new Response(
      JSON.stringify({ ok: false, error: "Not found" }),
      { status: 404, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    // Extract error message from various error types
    let message = "Unknown error";
    let details = "";

    if (error instanceof Error) {
      message = error.message;
    } else if (typeof error === "object" && error !== null) {
      // Handle Supabase/Postgrest error objects
      if ("message" in error) {
        message = String((error as any).message);
      }
      if ("details" in error) {
        details = String((error as any).details);
      }
      if ("hint" in error) {
        details = String((error as any).hint);
      }
    }

    console.error("Admin endpoint error:", { message, details, error });

    return new Response(
      JSON.stringify({
        ok: false,
        error: message,
        ...(details && { details }),
      }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
