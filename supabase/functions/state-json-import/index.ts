import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";
import { authenticateAdmin, writeAuditLog, getRequestMeta, hashPayload } from "../_shared/adminAuth.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey, x-admin-token, x-admin-secret",
};

const FORBIDDEN_KEYWORDS = [
  'casino', 'gambling', 'slots', 'free spins', 'slot machine',
  'online casino', 'casino zonder', 'betspins', 'betway',
  '888casino', 'jackpot', 'pokies', 'wagering'
];

const VALID_STATE_SLUGS = new Set([
  'alabama','alaska','arizona','arkansas','california','colorado','connecticut',
  'delaware','district-of-columbia','florida','georgia','hawaii','idaho',
  'illinois','indiana','iowa','kansas','kentucky','louisiana','maine',
  'maryland','massachusetts','michigan','minnesota','mississippi','missouri',
  'montana','nebraska','nevada','new-hampshire','new-jersey','new-mexico',
  'new-york','north-carolina','north-dakota','ohio','oklahoma','oregon',
  'pennsylvania','puerto-rico','rhode-island','south-carolina','south-dakota',
  'tennessee','texas','utah','vermont','virginia','washington',
  'west-virginia','wisconsin','wyoming'
]);

function scanForForbiddenKeywords(fields: (string | null | undefined)[]): string[] {
  const combined = fields.filter(Boolean).join(' ').toLowerCase();
  return FORBIDDEN_KEYWORDS.filter(kw => combined.includes(kw.toLowerCase()));
}

interface Agency {
  rank: number;
  name: string;
  city: string;
  state: string;
  pricing: string;
  websiteUrl: string;
  logo?: {
    localPath?: string;
    altText?: string;
    width?: number;
    height?: number;
    boltUrl?: string | null;
  };
  shortDescription?: string;
  fullDescription?: string;
  services?: string[];
}

interface StateContent {
  hero_intro?: string;
  hero_intro_short?: string;
  state_intro_short?: string;
  state_intro_full?: string;
  lastUpdated?: string;
  last_updated?: string;
  state_description_full?: string;
}

interface StateFAQ {
  question: string;
  answer: string;
}

interface ImportRequest {
  stateSlug: string;
  stateName: string;
  agencies: Agency[];
  otherAgencies: Agency[];
  options: {
    markAsPlaceholders: boolean;
    overrideExisting: boolean;
  };
  canonicalUrl?: string;
  fullCanonicalUrl?: string;
  stateContent?: StateContent;
  faqs?: StateFAQ[];
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  const { ip, userAgent } = getRequestMeta(req);

  // TEST AUTH HANDLER: GET /state-json-import?testAuth=1
  if (req.method === "GET") {
    const url = new URL(req.url);
    if (url.searchParams.get('testAuth') === '1') {
      const authResult = await authenticateAdmin(req);
      return new Response(
        JSON.stringify({ ok: authResult.success, sessionType: authResult.sessionType }),
        {
          status: authResult.success ? 200 : 401,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      );
    }
  }

  try {
    // STEP 1: Authenticate before reading body
    const authResult = await authenticateAdmin(req);
    if (!authResult.success) {
      await writeAuditLog({
        actor_session_type: 'unknown',
        action: 'state_json_import',
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: authResult.error?.code,
      });
      return new Response(
        JSON.stringify({ error: authResult.error?.code, message: authResult.error?.message }),
        { status: authResult.error?.code === 'NO_CREDENTIALS' ? 401 : 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    const supabaseAdmin = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    const body: ImportRequest = await req.json();
    const { stateSlug, agencies, otherAgencies, options, stateName, canonicalUrl, fullCanonicalUrl, stateContent, faqs } = body;

    const payloadHash = await hashPayload(body);

    // STEP 2: Validate state slug against allowlist
    if (!stateSlug || !VALID_STATE_SLUGS.has(stateSlug)) {
      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? 'unknown',
        action: 'state_json_import',
        state_slug: stateSlug,
        payload_hash: payloadHash,
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: 'INVALID_STATE_SLUG',
      });
      return new Response(
        JSON.stringify({ code: 'INVALID_STATE_SLUG', message: `"${stateSlug}" is not a valid state slug.` }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // STEP 3: Required field validation
    const validationErrors: string[] = [];
    if (!stateContent || !stateContent.hero_intro) {
      validationErrors.push("Missing required field: stateContent.hero_intro");
    }
    if (!faqs || faqs.length === 0) {
      validationErrors.push("Missing required field: faqs[] (must have at least 1 FAQ)");
    }

    if (validationErrors.length > 0) {
      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? 'unknown',
        action: 'state_json_import',
        state_slug: stateSlug,
        payload_hash: payloadHash,
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: 'VALIDATION_ERROR: ' + validationErrors.join('; '),
      });
      return new Response(
        JSON.stringify({ code: "VALIDATION_ERROR", message: "Required fields missing.", errors: validationErrors }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // STEP 4: Content safety scan (forbidden keywords)
    if (stateContent) {
      const foundKeywords = scanForForbiddenKeywords([
        stateContent.hero_intro,
        stateContent.hero_intro_short,
        stateContent.state_intro_short,
        stateContent.state_intro_full,
        stateContent.state_description_full,
      ]);

      if (foundKeywords.length > 0) {
        console.error(`[state-json-import] CONTENT_SAFETY: forbidden keywords in ${stateSlug}: ${foundKeywords.join(', ')}`);
        await writeAuditLog({
          actor_session_type: authResult.sessionType ?? 'unknown',
          action: 'state_json_import',
          state_slug: stateSlug,
          payload_hash: payloadHash,
          ip,
          user_agent: userAgent,
          status: 'rejected',
          rejection_reason: `CONTENT_SAFETY_VIOLATION: ${foundKeywords.join(', ')}`,
        });
        return new Response(
          JSON.stringify({
            code: "CONTENT_SAFETY_VIOLATION",
            message: `Import rejected: intro content contains forbidden keywords.`,
            foundKeywords,
          }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
    }

    // STEP 5: Also scan agency descriptions for forbidden content
    const allAgencyText = [...(agencies || []), ...(otherAgencies || [])]
      .flatMap(a => [a.shortDescription, a.fullDescription]);
    const agencyForbidden = scanForForbiddenKeywords(allAgencyText);
    if (agencyForbidden.length > 0) {
      await writeAuditLog({
        actor_session_type: authResult.sessionType ?? 'unknown',
        action: 'state_json_import',
        state_slug: stateSlug,
        payload_hash: payloadHash,
        ip,
        user_agent: userAgent,
        status: 'rejected',
        rejection_reason: `CONTENT_SAFETY_VIOLATION in agency descriptions: ${agencyForbidden.join(', ')}`,
      });
      return new Response(
        JSON.stringify({ code: "CONTENT_SAFETY_VIOLATION", message: "Agency descriptions contain forbidden keywords.", foundKeywords: agencyForbidden }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const results = {
      top25Created: 0, top25Errors: 0,
      otherAgenciesCreated: 0, otherAgenciesErrors: 0,
      firstDbError: null as any, firstFailedRank: null as number | null,
      stateContentInserted: false, intro_length: 0, intro_preview: '',
      faqs_inserted: 0, first_faq_question: '',
      raw_json_hash: '', override_mode: options.overrideExisting,
      stateContentSaved: false, faqsImported: 0,
      firstFaqQuestion: '', validationWarnings: [] as string[]
    };

    if (canonicalUrl && fullCanonicalUrl) {
      const { error: statePageError } = await supabaseAdmin
        .from("state_pages")
        .upsert({
          state_slug: stateSlug, state_name: stateName,
          canonical_url: canonicalUrl, full_canonical_url: fullCanonicalUrl,
          is_active: true, updated_at: new Date().toISOString()
        }, { onConflict: "state_slug" });
      if (statePageError) {
        console.error(`[state-json-import] Failed to upsert state_pages for ${stateSlug}:`, statePageError);
      }
    }

    if (stateContent) {
      const contentHash = await hashPayload(stateContent);

      if (options.overrideExisting) {
        await supabaseAdmin.from("state_content").delete().eq("state_slug", stateSlug);
      }

      const contentRow = {
        state_slug: stateSlug,
        hero_intro: stateContent.hero_intro || '',
        hero_intro_short: stateContent.hero_intro_short || null,
        state_intro_short: stateContent.state_intro_short || null,
        state_intro_full: stateContent.state_intro_full || null,
        state_description_full: stateContent.state_description_full || null,
        last_updated: stateContent.lastUpdated || stateContent.last_updated || null,
        raw_json_hash: contentHash,
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
      };

      const { error: contentError } = options.overrideExisting
        ? await supabaseAdmin.from("state_content").insert(contentRow)
        : await supabaseAdmin.from("state_content").upsert(contentRow, { onConflict: "state_slug" });

      if (contentError) {
        console.error(`[state-json-import] Failed to save state_content for ${stateSlug}:`, contentError);
        await writeAuditLog({
          actor_session_type: authResult.sessionType ?? 'unknown',
          action: 'state_json_import',
          target_table: 'state_content',
          state_slug: stateSlug,
          payload_hash: payloadHash,
          ip,
          user_agent: userAgent,
          status: 'error',
          rejection_reason: contentError.message,
        });
        return new Response(
          JSON.stringify({ code: "DATABASE_ERROR", message: `Failed to save state content for ${stateSlug}`, error: contentError.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      results.stateContentInserted = true;
      results.stateContentSaved = true;
      results.intro_length = stateContent.hero_intro?.length || 0;
      results.intro_preview = stateContent.hero_intro?.substring(0, 80) || '';
      results.raw_json_hash = contentHash;
    }

    if (faqs && faqs.length > 0) {
      const sanitizedFaqs = faqs.filter(faq => {
        if (!faq.question?.trim() || !faq.answer?.trim()) return false;
        if (/click to expand/i.test(faq.question) || /click to expand/i.test(faq.answer)) return false;
        const answerLines = faq.answer.split('\n').filter(l => l.trim().length > 0);
        const linkListLines = answerLines.filter(l => /^[\d\.\-\*\s]*Marketing Agencies in/i.test(l));
        if (answerLines.length > 5 && linkListLines.length > 3) return false;
        if (faq.answer.trim().length < 50) return false;
        return true;
      });

      if (sanitizedFaqs.length === 0) {
        return new Response(
          JSON.stringify({ code: "VALIDATION_ERROR", message: `All FAQs were filtered out during sanitization for ${stateSlug}.` }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      await supabaseAdmin.from("state_faqs").delete().eq("state_slug", stateSlug);

      const { error: faqError } = await supabaseAdmin.from("state_faqs").insert(
        sanitizedFaqs.map((faq, index) => ({
          state_slug: stateSlug,
          position: index + 1,
          question: faq.question.trim(),
          answer: faq.answer.trim()
        }))
      );

      if (!faqError) {
        results.faqsImported = sanitizedFaqs.length;
        results.faqs_inserted = sanitizedFaqs.length;
        results.firstFaqQuestion = sanitizedFaqs[0]?.question || '';
        results.first_faq_question = sanitizedFaqs[0]?.question || '';
        if (faqs.length - sanitizedFaqs.length > 0) {
          results.validationWarnings.push(`Filtered ${faqs.length - sanitizedFaqs.length} invalid FAQ(s)`);
        }
      }
    }

    if (options.overrideExisting) {
      await supabaseAdmin.from("top25_slots").delete().eq("state_slug", stateSlug);
    }

    const { data: canonicalVazagency } = await supabaseAdmin
      .from("other_agencies").select("id").eq("slug", "vazagency-global").maybeSingle();
    const canonicalVazagencyId = canonicalVazagency?.id || null;
    if (!canonicalVazagencyId) {
      console.warn("[state-json-import] Canonical Vazagency not found.");
    }

    for (const agency of agencies) {
      try {
        const rank = Number(agency.rank);
        if (isNaN(rank) || rank < 1 || rank > 25) {
          return new Response(
            JSON.stringify({ code: "INVALID_RANK", message: `Invalid rank: ${agency.rank}. Must be 1-25.` }),
            { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
          );
        }
        if (rank === 1) { results.top25Created++; continue; }

        const { error } = await supabaseAdmin.from("top25_slots").upsert({
          state_slug: stateSlug, rank,
          agency_name: agency.name,
          website: agency.websiteUrl || "",
          logo_url: agency.logo?.localPath ?? agency.logo?.boltUrl ?? null,
          description: agency.fullDescription ?? agency.description ?? null,
          short_description: agency.shortDescription ?? agency.description ?? null,
          services: Array.isArray(agency.services) ? agency.services : [],
          is_paid: !options.markAsPlaceholders,
        }, { onConflict: "state_slug,rank" });

        if (error) {
          results.top25Errors++;
          if (!results.firstDbError) {
            results.firstDbError = { code: error.code, message: error.message, record: { state_slug: stateSlug, rank, agency_name: agency.name } };
            results.firstFailedRank = rank;
          }
        } else {
          results.top25Created++;
        }
      } catch (err: any) {
        results.top25Errors++;
      }
    }

    if (otherAgencies.length > 0 && options.overrideExisting) {
      await supabaseAdmin.from("other_agencies").delete().eq("state_slug", stateSlug);
    }

    for (const agency of otherAgencies) {
      try {
        const slug = agency.name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
        const { error } = await supabaseAdmin.from("other_agencies").insert({
          state_slug: stateSlug, name: agency.name, slug,
          website_url: agency.websiteUrl || "",
          logo_url: agency.logo?.localPath ?? agency.logo?.boltUrl ?? null,
          city: agency.city || "", state: agency.state || stateName,
          short_description: agency.shortDescription ?? agency.description ?? null,
          full_description: agency.fullDescription ?? agency.description ?? null,
          services: Array.isArray(agency.services) ? agency.services : [],
          featured: false, verified: false,
        });
        if (error) results.otherAgenciesErrors++;
        else results.otherAgenciesCreated++;
      } catch { results.otherAgenciesErrors++; }
    }

    // Write success audit log
    await writeAuditLog({
      actor_session_type: authResult.sessionType ?? 'unknown',
      action: 'state_json_import',
      target_table: 'state_content,top25_slots,other_agencies,state_faqs',
      state_slug: stateSlug,
      payload_hash: payloadHash,
      ip,
      user_agent: userAgent,
      status: 'success',
    });

    return new Response(JSON.stringify(results), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error: any) {
    console.error("Error in state-json-import:", error);
    return new Response(
      JSON.stringify({ code: "INTERNAL_ERROR", error: error.message || "Internal server error" }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
