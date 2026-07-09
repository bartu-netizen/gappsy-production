import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.49.1";
import { buildTop25SlotPayload } from "../_shared/top25PayloadBuilder.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const supabase = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
);

interface SmokeTestRequest {
  intro: string;
  services: string[];
  websiteUrl?: string;
  listingType?: "top25_rank" | "spotlight" | "other_listing";
}

interface SmokeTestResponse {
  success: boolean;
  passed: boolean;
  errors?: Record<string, string>;
  warnings?: string[];
  testResults?: {
    validationPassed: boolean;
    validationErrors?: Record<string, string>;
    dbWriteResult?: string;
    listingId?: string;
    timestamp: string;
    testAgencyId: string;
  };
}

const FORBIDDEN_WORDS = [
  "gok",
  "gokautomaat",
  "gambling",
  "porn",
  "pornography",
  "sex",
];

const URL_PATTERNS = [
  /https?:\/\/[^\s]+/gi,
  /www\.[^\s]+/gi,
  /[a-z0-9.-]+\.[a-z]{2,}(?:\/[^\s]*)?\b/gi,
];

function validateIntroText(text: string): { valid: boolean; error?: string } {
  if (!text || !text.trim()) {
    return { valid: false, error: "Intro text is required." };
  }

  const trimmed = text.trim().toLowerCase();

  for (const word of FORBIDDEN_WORDS) {
    if (trimmed.includes(word.toLowerCase())) {
      return {
        valid: false,
        error: `Your intro contains restricted words. Please update the text and try again.`,
      };
    }
  }

  for (const pattern of URL_PATTERNS) {
    if (pattern.test(text)) {
      return {
        valid: false,
        error: `Please remove website links from the intro text.`,
      };
    }
  }

  return { valid: true };
}

function validateWebsiteUrl(url: string): { valid: boolean; error?: string } {
  if (!url || !url.trim()) {
    return { valid: true };
  }

  const trimmed = url.trim();
  const urlPattern = /^(https?:\/\/)?(www\.)?[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z]{2,})+([\/\w\-._~:?#[\]@!$&'()*+,;=]*)?$/i;

  if (!urlPattern.test(trimmed)) {
    return {
      valid: false,
      error: "Please enter a valid website URL (e.g., example.com or https://example.com).",
    };
  }

  return { valid: true };
}

function validateServices(services: string[]): { valid: boolean; error?: string } {
  if (!services || services.length === 0) {
    return {
      valid: false,
      error: "At least one service must be selected.",
    };
  }
  return { valid: true };
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "POST") {
    return new Response(JSON.stringify({ error: "Method not allowed" }), {
      status: 405,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }

  try {
    const body: SmokeTestRequest = await req.json();
    const { intro, services, websiteUrl, listingType = "other_listing" } = body;

    console.log("[listing-smoke-test] Starting validation", {
      hasIntro: !!intro,
      servicesCount: services?.length ?? 0,
      hasWebsiteUrl: !!websiteUrl,
      listingType,
    });

    const errors: Record<string, string> = {};
    const warnings: string[] = [];

    // Validate intro text
    const introValidation = validateIntroText(intro || "");
    if (!introValidation.valid && introValidation.error) {
      errors.intro = introValidation.error;
    }

    // Validate website URL
    const urlValidation = validateWebsiteUrl(websiteUrl || "");
    if (!urlValidation.valid && urlValidation.error) {
      errors.website_url = urlValidation.error;
    }

    // Validate services
    const servicesValidation = validateServices(services || []);
    if (!servicesValidation.valid && servicesValidation.error) {
      errors.services = servicesValidation.error;
    }

    const validationPassed = Object.keys(errors).length === 0;

    console.log("[listing-smoke-test] Validation result:", {
      passed: validationPassed,
      errorCount: Object.keys(errors).length,
    });

    // If validation failed, return early
    if (!validationPassed) {
      return new Response(
        JSON.stringify({
          success: false,
          passed: false,
          errors,
          warnings,
        } as SmokeTestResponse),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    // Create test record with unique ID
    const testAgencyId = `smoke-test-${Date.now()}-${Math.random().toString(36).substring(7)}`;

    console.log("[listing-smoke-test] Attempting DB write with test agency:", testAgencyId);

    // Simulate DB write based on listing type
    let dbWriteResult;

    if (listingType === "top25_rank" || listingType === "top25") {
      // Save to top25_slots - only allowed columns
      // top25_slots schema: id, state_slug, rank, is_paid, claimed_at, created_at
      const top25Payload = buildTop25SlotPayload(
        {
          id: testAgencyId,
          state_slug: "smoke-test",
          rank: 1,
          is_paid: false,
          claimed_at: null,
        },
        true // enable debug logging
      );

      console.log("[listing-smoke-test] top25_slots payload:", {
        payload: top25Payload,
        note: "intro/services/website are not stored in top25_slots - this is correct",
      });

      dbWriteResult = await supabase
        .from("top25_slots")
        .upsert(top25Payload, { onConflict: "id" })
        .select();
    } else if (listingType === "spotlight") {
      // Save to spotlight_placements
      // Note: spotlight_placements uses 'description' and 'website_url'
      dbWriteResult = await supabase
        .from("spotlight_placements")
        .upsert(
          {
            id: testAgencyId,
            agency_id: testAgencyId,
            description: intro || null,
            services: services || [],
            website_url: websiteUrl?.trim() || null,
            source: "admin_smoke_test",
          },
          { onConflict: "id" }
        )
        .select();
    } else {
      // Default: other_agencies
      // Note: other_agencies uses 'intro' and 'website_url'
      dbWriteResult = await supabase
        .from("other_agencies")
        .upsert(
          {
            id: testAgencyId,
            intro: intro || null,
            services: services || [],
            website_url: websiteUrl?.trim() || null,
            source: "admin_smoke_test",
          },
          { onConflict: "id" }
        )
        .select();
    }

    if (dbWriteResult.error) {
      console.error("[listing-smoke-test] DB write failed:", dbWriteResult.error);
      return new Response(
        JSON.stringify({
          success: false,
          passed: false,
          errors: {
            database: `Failed to write test record: ${dbWriteResult.error.message}`,
          },
          warnings,
        } as SmokeTestResponse),
        {
          status: 500,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    console.log("[listing-smoke-test] Smoke test passed", {
      testAgencyId,
      listingType,
      dbRecordCount: dbWriteResult.data?.length ?? 0,
    });

    return new Response(
      JSON.stringify({
        success: true,
        passed: true,
        testResults: {
          validationPassed: true,
          dbWriteResult: "Success",
          listingId: testAgencyId,
          timestamp: new Date().toISOString(),
          testAgencyId,
        },
      } as SmokeTestResponse),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    console.error("[listing-smoke-test] Unhandled error:", error);
    return new Response(
      JSON.stringify({
        success: false,
        passed: false,
        errors: {
          server: `Unexpected error: ${error instanceof Error ? error.message : "Unknown error"}`,
        },
      } as SmokeTestResponse),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
