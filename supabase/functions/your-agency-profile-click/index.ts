import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { sendEmail } from "../_shared/emailClient.ts";
import {
  resolveAdminContext,
  buildAdminActivityEmail,
  buildAgencyAdminUrl,
  stateNameFromSlug,
} from "../_shared/adminEmailContext.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

function escHtml(s: unknown): string {
  return String(s ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

// ─── Detect source from body + meta ──────────────────────────────────────────

function detectFinalSource(
  declaredSource: string,
  meta: Record<string, unknown>
): { source: string; isColdEmail: boolean; isManageListing: boolean } {
  // Explicit manage-listing attribution — never override with cold email classification
  if (
    declaredSource === "manage_listing_to_your_agency" ||
    String(meta.entry_type ?? "") === "manage_listing" ||
    String(meta.source ?? "") === "manage_listing" ||
    String(meta.origin_page ?? "") === "/manage-listing" ||
    String(meta.entry_path ?? "") === "manage_listing_to_your_agency"
  ) {
    return { source: "manage_listing_to_your_agency", isColdEmail: false, isManageListing: true };
  }

  if (declaredSource === "cold_email_click") {
    return { source: "cold_email_click", isColdEmail: true, isManageListing: false };
  }

  const utmSource  = String(meta.utm_source  ?? "").toLowerCase();
  const utmMedium  = String(meta.utm_medium  ?? "").toLowerCase();
  const emailParam = String(meta.email       ?? "");
  const clickId    = String(meta.click_id    ?? "");

  const isColdEmail =
    utmSource === "cold_email" ||
    utmMedium === "email" ||
    utmMedium === "cold_email" ||
    !!emailParam ||
    !!clickId;

  if (isColdEmail) return { source: "cold_email_click", isColdEmail: true, isManageListing: false };

  return { source: declaredSource || "direct_profile_visit", isColdEmail: false, isManageListing: false };
}

// ─── Canonical agency identity ────────────────────────────────────────────────

interface CanonicalIdentity {
  otherAgencyId:     string | null;
  canonicalSlug:     string | null;
  canonicalStateSlug: string | null;
  canonicalDomain:   string | null;
  resolvedVia:       string;
}

function buildIdentity(
  row: Record<string, unknown>,
  fallbackSlug: string | null | undefined,
  resolvedVia: string,
): CanonicalIdentity {
  return {
    otherAgencyId:      String(row.id),
    canonicalSlug:      row.slug ? String(row.slug) : (fallbackSlug ?? null),
    canonicalStateSlug: row.state_slug ? String(row.state_slug) : null,
    canonicalDomain:    row.domain_normalized ? String(row.domain_normalized) : null,
    resolvedVia,
  };
}

async function resolveCanonicalIdentity(
  supabase: ReturnType<typeof createClient>,
  opts: {
    agency_id:   string | null | undefined;
    agency_slug: string | null | undefined;
    agency_name: string;
  }
): Promise<CanonicalIdentity> {
  const { agency_id, agency_slug, agency_name } = opts;
  const SELECT_FIELDS = "id, slug, state_slug, domain_normalized, name, is_active";

  // ── Phase 1: Gather ALL candidate other_agencies rows ─────────────────────
  // We collect up to 5 candidates per identifier to handle multi-state agencies
  // where the same agency may appear in multiple rows with the same slug.
  const candidateMap = new Map<string, Record<string, unknown>>();

  // 1a. Slug match — fetch up to 5 (handles multi-state duplicates)
  if (agency_slug) {
    const { data: slugRows } = await supabase
      .from("other_agencies")
      .select(SELECT_FIELDS)
      .eq("slug", agency_slug)
      .limit(5);
    if (slugRows) for (const r of slugRows) candidateMap.set(String(r.id), r);
  }

  // 1b. Direct agency_id match — add if not already captured by slug
  if (agency_id) {
    if (!candidateMap.has(String(agency_id))) {
      const { data: idRow } = await supabase
        .from("other_agencies")
        .select(SELECT_FIELDS)
        .eq("id", agency_id)
        .maybeSingle();
      if (idRow) candidateMap.set(String(idRow.id), idRow);
    }
  }

  // 1c. Name fallback — only when no candidates found yet
  if (candidateMap.size === 0 && agency_name && agency_name.length > 2) {
    const { data: nameRows } = await supabase
      .from("other_agencies")
      .select(SELECT_FIELDS)
      .ilike("name", agency_name)
      .eq("is_active", true)
      .limit(3);
    if (nameRows) for (const r of nameRows) candidateMap.set(String(r.id), r);
    if (nameRows && nameRows.length > 1) {
      console.log(`[your-agency-profile-click] name fallback: ${nameRows.length} matches for "${agency_name}" — will rank by emails`);
    }
  }

  const candidates = Array.from(candidateMap.values());

  if (candidates.length === 0) {
    console.log(`[your-agency-profile-click] identity unresolved for slug=${agency_slug} id=${agency_id}`);
    return {
      otherAgencyId:      null,
      canonicalSlug:      agency_slug ?? null,
      canonicalStateSlug: null,
      canonicalDomain:    null,
      resolvedVia:        "unresolved",
    };
  }

  // Fast path: single candidate — no email-ranking needed
  if (candidates.length === 1) {
    const row = candidates[0];
    console.log(`[your-agency-profile-click] single candidate: id=${row.id} slug=${row.slug} state=${row.state_slug} active=${row.is_active}`);
    return buildIdentity(row, agency_slug, "single_match");
  }

  // ── Phase 2: Multiple candidates — rank by linked email availability ─────
  // This mirrors the Agency Reply Helper's approach of preferring the row that
  // actually owns the linked emails rather than just picking the first active row.
  const candidateIds = candidates.map((r) => String(r.id));
  console.log(
    `[your-agency-profile-click] ${candidates.length} candidates for slug=${agency_slug} — ranking by email availability`
  );

  const { data: emailCountRows } = await supabase
    .from("other_agency_emails")
    .select("agency_id")
    .in("agency_id", candidateIds)
    .neq("validation_status", "invalid")
    .neq("validation_status", "disposable")
    .eq("is_placeholder_email", false)
    .limit(100);

  const emailCountByAgency: Record<string, number> = {};
  for (const id of candidateIds) emailCountByAgency[id] = 0;
  if (emailCountRows) {
    for (const row of emailCountRows) {
      const key = String(row.agency_id);
      emailCountByAgency[key] = (emailCountByAgency[key] ?? 0) + 1;
    }
  }

  for (const r of candidates) {
    const id = String(r.id);
    console.log(
      `[your-agency-profile-click] candidate: id=${id} slug=${r.slug} ` +
      `state=${r.state_slug} active=${r.is_active} emails=${emailCountByAgency[id] ?? 0}`
    );
  }

  // Sort: most usable emails first; ties broken by is_active, then insertion order
  const ranked = [...candidates].sort((a, b) => {
    const ea = emailCountByAgency[String(a.id)] ?? 0;
    const eb = emailCountByAgency[String(b.id)] ?? 0;
    if (eb !== ea) return eb - ea;
    if (a.is_active && !b.is_active) return -1;
    if (!a.is_active && b.is_active) return 1;
    return 0;
  });

  const best = ranked[0];
  const bestEmailCount = emailCountByAgency[String(best.id)] ?? 0;
  console.log(
    `[your-agency-profile-click] selected canonical: id=${best.id} slug=${best.slug} ` +
    `state=${best.state_slug} emails=${bestEmailCount}`
  );
  return buildIdentity(
    best,
    agency_slug,
    bestEmailCount > 0 ? "email_ranked_best" : "email_ranked_fallback",
  );
}

// ─── Fetch emails for a confirmed other_agencies.id ─────────────────────────

async function fetchEmailsForDbId(
  supabase: ReturnType<typeof createClient>,
  dbId: string
): Promise<{ importedEmail: string | null; importedEmailCount: number; importedEmails: string[] }> {
  const { data: emails, error: fetchErr } = await supabase
    .from("other_agency_emails")
    .select("email_raw, email_normalized, is_primary, validation_status, exclude_from_agency_lookup, is_placeholder_email")
    .eq("agency_id", dbId)
    .order("is_primary", { ascending: false })
    .order("created_at",  { ascending: true })
    .limit(20);

  console.log(
    `[your-agency-profile-click] fetchEmailsForDbId id=${dbId} ` +
    `rows=${emails?.length ?? 0} fetchErr=${fetchErr?.message ?? "none"}`
  );

  if (!emails || emails.length === 0) {
    return { importedEmail: null, importedEmailCount: 0, importedEmails: [] };
  }

  const clean: string[] = [];
  for (const e of emails as Record<string, unknown>[]) {
    const display = (e.email_raw ? String(e.email_raw) : String(e.email_normalized ?? "")).trim();
    if (!display) { console.log(`  skip id=${dbId}: empty email_raw+email_normalized`); continue; }

    if (e.validation_status === "invalid") {
      console.log(`  skip ${display}: validation_status=invalid`);
      continue;
    }
    if (e.validation_status === "disposable") {
      console.log(`  skip ${display}: validation_status=disposable`);
      continue;
    }
    if (e.exclude_from_agency_lookup === true) {
      console.log(`  skip ${display}: exclude_from_agency_lookup=true`);
      continue;
    }
    if (e.is_placeholder_email === true) {
      console.log(`  skip ${display}: is_placeholder_email=true`);
      continue;
    }
    clean.push(display);
  }

  const chosen = clean[0] ?? null;
  console.log(
    `[your-agency-profile-click] fetchEmailsForDbId result: ` +
    `usable=${clean.length} chosen=${chosen ?? "none"} all=[${clean.join(", ")}]`
  );

  return {
    importedEmails:     clean,
    importedEmailCount: clean.length,
    importedEmail:      chosen,
  };
}

async function resolveAgencyEmails(
  supabase: ReturnType<typeof createClient>,
  canonicalIdentity: CanonicalIdentity
): Promise<{ importedEmail: string | null; importedEmailCount: number; importedEmails: string[] }> {
  // Use the canonical resolved other_agencies.id as the primary lookup key
  if (canonicalIdentity.otherAgencyId) {
    const result = await fetchEmailsForDbId(supabase, canonicalIdentity.otherAgencyId);
    console.log(
      `[your-agency-profile-click] email lookup via ${canonicalIdentity.resolvedVia}: ` +
      `id=${canonicalIdentity.otherAgencyId} found=${result.importedEmailCount} primary=${result.importedEmail ?? "none"}`
    );
    return result;
  }

  console.log("[your-agency-profile-click] email lookup skipped: no canonical other_agencies.id resolved");
  return { importedEmail: null, importedEmailCount: 0, importedEmails: [] };
}

// ─── Main handler ─────────────────────────────────────────────────────────────

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") return new Response(null, { status: 200, headers: corsHeaders });

  try {
    const supabaseUrl   = Deno.env.get("SUPABASE_URL")!;
    const serviceKey    = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const internalEmail = Deno.env.get("SMTP_INTERNAL_EMAIL") ?? Deno.env.get("SMTP_FROM_SUPPORT") ?? "";

    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const body = await req.json();
    const {
      agency_id,
      agency_slug,
      agency_name   = "",
      profile_url   = "",
      search_query,
      source        = "your_agency_searchbar",
      visitor_session_id,
      visitor_token,
      state_slug:   clientStateSlug,
      meta          = {},
      request_id,
    } = body;

    if (!agency_name && !agency_slug && !agency_id) {
      return json({ error: "Missing agency identifier" }, 400);
    }

    console.log(
      `[your-agency-profile-click] incoming: agency_id=${agency_id} ` +
      `agency_slug=${agency_slug} client_state_slug=${clientStateSlug ?? "none"}`
    );

    // Detect final source (manage-listing attribution takes priority, then cold email)
    const { source: finalSource, isColdEmail, isManageListing } = detectFinalSource(source, meta as Record<string, unknown>);

    // Every click gets its own row — no deduplication by session, timing, or agency.
    // The dedupe_key is stored for audit purposes only and never used to skip inserts.
    const nowTs     = Math.floor(Date.now() / (5 * 60 * 1000));
    const dedupeKey = [
      agency_slug ?? agency_id ?? agency_name,
      search_query ?? "",
      visitor_session_id ?? "",
      String(nowTs),
    ].join("|");

    // Resolve canonical agency identity (one shared resolver for state + email)
    const canonicalIdentity = await resolveCanonicalIdentity(supabase, {
      agency_id,
      agency_slug,
      agency_name,
    });

    // Determine final state_slug: prefer client-sent value, fall back to canonical resolved
    const state_slug = (clientStateSlug && String(clientStateSlug).trim())
      ? String(clientStateSlug).trim()
      : (canonicalIdentity.canonicalStateSlug ?? null);

    console.log(
      `[your-agency-profile-click] canonical: id=${canonicalIdentity.otherAgencyId} ` +
      `slug=${canonicalIdentity.canonicalSlug} state_slug=${state_slug ?? "none"} ` +
      `resolvedVia=${canonicalIdentity.resolvedVia}`
    );

    // Resolve imported emails using canonical identity
    const { importedEmail, importedEmailCount, importedEmails } =
      await resolveAgencyEmails(supabase, canonicalIdentity);

    console.log(
      `[your-agency-profile-click] result: emails=${importedEmailCount} ` +
      `selected=${importedEmail ?? "none"} source=${finalSource} cold=${isColdEmail}`
    );

    // Insert click record
    const { data: clickRow, error: insertErr } = await supabase
      .from("your_agency_profile_clicks")
      .insert({
        agency_id:                    agency_id   ?? null,
        agency_slug:                  agency_slug ?? null,
        agency_name,
        profile_url,
        search_query:                 search_query       ?? null,
        source:                       finalSource,
        visitor_session_id:           visitor_session_id ?? null,
        visitor_token:                visitor_token      ?? null,
        state_slug:                   state_slug         ?? null,
        imported_agency_email:        importedEmail,
        imported_agency_email_count:  importedEmailCount,
        imported_agency_emails:       importedEmails,
        email_notification_sent:      false,
        dedupe_key:                   dedupeKey,
        meta,
      })
      .select("id")
      .single();

    if (insertErr) {
      console.error("[your-agency-profile-click] Insert failed:", insertErr.message);
      return json({ error: insertErr.message }, 500);
    }

    const clickId = clickRow?.id;

    // Send enriched internal email (non-blocking)
    const sendInternalEmail = async () => {
      const EMERGENCY_FALLBACK = "bartu@gappsy.com";

      let recipients:     string[] = [];
      let recipientSource = "none";
      let subjectTemplate = "/your-agency profile clicked: {{agency}}";
      let customBodyHtml: string | null = null;

      const { data: setting } = await supabase
        .from("email_notification_settings")
        .select("is_enabled, recipient_emails, subject_template, body_html")
        .eq("notification_type", "your_agency_profile_click")
        .maybeSingle();

      if (setting && !setting.is_enabled) {
        console.log("[your-agency-profile-click] Notification disabled, skipping");
        return;
      }

      if (setting?.recipient_emails) {
        recipients = setting.recipient_emails.split(",").map((r: string) => r.trim()).filter(Boolean);
        if (recipients.length > 0) recipientSource = "settings";
      }
      if (recipients.length === 0 && internalEmail) {
        recipients      = [internalEmail];
        recipientSource = "smtp_internal_email";
      }
      if (recipients.length === 0) {
        recipients      = [EMERGENCY_FALLBACK];
        recipientSource = "emergency_hardcoded_fallback";
        console.warn("[your-agency-profile-click] EMERGENCY FALLBACK to hardcoded recipient");
      }

      if (setting?.subject_template) subjectTemplate = setting.subject_template;
      if (setting?.body_html)        customBodyHtml  = setting.body_html;

      const displayAgency = agency_name || agency_slug || "Unknown";
      const metaObj       = (meta ?? {}) as Record<string, unknown>;
      const utmCampaign   = String(metaObj.utm_campaign ?? "");
      const clickedEmail  = String(metaObj.email        ?? "");

      const coldSuffix = isColdEmail ? " [Cold Email]" : "";
      const subject = (subjectTemplate
        .replace("{{agency}}",       displayAgency)
        .replace("{{agency_slug}}",  agency_slug ?? "")
        .replace("{{search_query}}", search_query ?? ""))
        + coldSuffix;

      const adminUrl = buildAgencyAdminUrl({ agency_id, agency_slug });
      const funnelAnalyticsUrl = `https://www.gappsy.com/wp-admin/analytics/agency-funnel`;

      let emailHtml: string;

      if (customBodyHtml) {
        emailHtml = customBodyHtml
          .replace(/\{\{agency\}\}/g,                      escHtml(agency_name))
          .replace(/\{\{agency_slug\}\}/g,                 escHtml(agency_slug ?? ""))
          .replace(/\{\{profile_url\}\}/g,                 escHtml(profile_url))
          .replace(/\{\{search_query\}\}/g,                escHtml(search_query ?? ""))
          .replace(/\{\{email\}\}/g,                       escHtml(importedEmail ?? ""))
          .replace(/\{\{imported_agency_email_count\}\}/g, String(importedEmailCount))
          .replace(/\{\{submission_url\}\}/g,              escHtml(adminUrl))
          .replace(/\{\{page_url\}\}/g,                    escHtml(profile_url));
      } else {
        const ctx = await resolveAdminContext(supabase, {
          agency_id,
          agency_slug,
          agency_name,
          state_slug,
          days: 30,
        });

        console.log(
          `[your-agency-profile-click] admin email: stateName=${ctx.stateName} ` +
          `state_slug=${state_slug ?? "none"} rankLabel=${ctx.rankLabel}`
        );

        const stateName = stateNameFromSlug(state_slug);

        // Build extra rows for manage-listing / cold email / campaign context
        const extraRows: Array<{ label: string; value: string; highlight?: boolean }> = [];

        if (isManageListing) {
          extraRows.push({
            label:     "Traffic Source",
            value:     `<span style="color:#0369a1;font-weight:700;font-size:14px">Manage Listing \u2192 /your-agency</span>`,
            highlight: true,
          });
          const metaObj2 = (meta ?? {}) as Record<string, unknown>;
          const originPage = String(metaObj2.origin_page ?? "/manage-listing");
          extraRows.push({ label: "Origin Page", value: escHtml(originPage) });
        } else if (isColdEmail) {
          extraRows.push({
            label:     "Traffic Source",
            value:     `<span style="color:#ef4444;font-weight:700;font-size:14px">Cold Email Click</span>`,
            highlight: true,
          });
        }

        if (utmCampaign) {
          extraRows.push({ label: "Campaign", value: escHtml(utmCampaign), highlight: isColdEmail });
        }

        if (clickedEmail) {
          extraRows.push({
            label: "Clicked Email",
            value: `<a href="mailto:${escHtml(clickedEmail)}" style="color:#1d4ed8;text-decoration:none;font-weight:600">${escHtml(clickedEmail)}</a>`,
          });
        }

        if (metaObj.utm_source && !isColdEmail) {
          extraRows.push({ label: "UTM Source", value: escHtml(String(metaObj.utm_source)) });
        }
        if (metaObj.utm_medium && !isColdEmail) {
          extraRows.push({ label: "UTM Medium", value: escHtml(String(metaObj.utm_medium)) });
        }
        if (metaObj.utm_content) {
          extraRows.push({ label: "UTM Content", value: escHtml(String(metaObj.utm_content)) });
        }

        emailHtml = buildAdminActivityEmail({
          eventTitle:         "/your-agency Profile Clicked",
          eventSubtitle:      `${stateName} · ${isManageListing ? "Via Manage Listing — " : isColdEmail ? "Cold Email Click — " : ""}Someone viewed this agency profile`,
          accentColor:        isManageListing ? "#0369a1" : isColdEmail ? "#ef4444" : "#38bdf8",
          agencyName:         displayAgency,
          agencySlug:         agency_slug,
          profileUrl:         profile_url,
          searchQuery:        search_query ?? null,
          source:             finalSource,
          importedEmail,
          importedEmails,
          importedEmailCount,
          adminUrl,
          funnelAnalyticsUrl,
          context:            ctx,
          extraRows,
        });
      }

      const result = await sendEmail({
        to:      recipients.length === 1 ? recipients[0] : recipients,
        subject,
        html:    emailHtml,
      });

      if (result.success && clickId) {
        await supabase
          .from("your_agency_profile_clicks")
          .update({ email_notification_sent: true })
          .eq("id", clickId);
      }

      try {
        await supabase.from("email_notification_logs").insert({
          notification_type: "your_agency_profile_click",
          is_test:           false,
          to_emails:         recipients.join(", "),
          subject,
          status:            result.success ? "sent" : "failed",
          provider:          "smtp",
          error_message:     result.error ?? null,
          payload: {
            agency:                      agency_name,
            agency_slug:                 agency_slug  ?? "",
            profile_url,
            search_query:                search_query ?? "",
            source:                      finalSource,
            is_cold_email:               isColdEmail,
            is_manage_listing:           isManageListing,
            utm_campaign:                utmCampaign  || null,
            clicked_email:               clickedEmail || null,
            email:                       importedEmail          ?? "",
            imported_agency_email_count: String(importedEmailCount),
            submission_url:              adminUrl,
            recipient_source:            recipientSource,
            canonical_identity_via:      canonicalIdentity.resolvedVia,
            resolved_state_slug:         state_slug ?? "",
            funnel_session_id:           visitor_session_id ?? "",
            entry_path:                  String((meta as Record<string, unknown>).entry_path ?? ""),
            origin_page:                 isManageListing ? "/manage-listing" : null,
          },
        });
      } catch (logErr) {
        console.error("[your-agency-profile-click] Log insert failed:", logErr);
      }
    };

    EdgeRuntime.waitUntil(sendInternalEmail());

    return json({ ok: true, id: clickId, imported_email_count: importedEmailCount });
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error("[your-agency-profile-click] Error:", msg);
    return json({ error: msg }, 500);
  }
});
