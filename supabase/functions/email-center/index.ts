import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { sendEmail } from "../_shared/emailClient.ts";
import {
  buildAvailabilityRequestInternalEmail,
  buildAvailabilityRequestOwnerEmail,
  buildTop25SubmissionInternalEmail,
  buildTop25SubmissionApplicantEmail,
  buildSpotlightApplicationInternalEmail,
  buildSpotlightApplicationApplicantEmail,
  buildOtherListingActivationInternalEmail,
  buildOtherListingActivationApplicantEmail,
} from "../_shared/emailTemplates.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, x-admin-secret, accept, origin, referer, user-agent",
  "Access-Control-Max-Age": "86400",
};

type TemplateMetadata = {
  key: string;
  label: string;
  audience: string;
  implemented: boolean;
  defaultTo: string;
  notes: string;
  sourceFunction?: string;
};

type EventInfo = {
  event: string;
  templates: string[];
  recipients: string;
  implemented: boolean;
  notes: string;
  sourceFunction?: string;
};

const TEMPLATES: TemplateMetadata[] = [
  {
    key: "availability-internal",
    label: "Availability Request (Internal)",
    audience: "admin",
    implemented: true,
    defaultTo: "SMTP_INTERNAL_EMAIL",
    notes: "Sent when client checks agency availability",
    sourceFunction: "availability-notify",
  },
  {
    key: "availability-owner",
    label: "Availability Request (Owner)",
    audience: "agency",
    implemented: false,
    defaultTo: "agency_owner_email",
    notes: "Not yet connected - template exists",
    sourceFunction: "availability-notify (future)",
  },
  {
    key: "top25-internal",
    label: "Top-25 Submission (Internal)",
    audience: "admin",
    implemented: false,
    defaultTo: "SMTP_INTERNAL_EMAIL",
    notes: "Template exists, not yet triggered",
    sourceFunction: "top25-claim-intent (future)",
  },
  {
    key: "top25-applicant",
    label: "Top-25 Submission (Applicant)",
    audience: "agency",
    implemented: false,
    defaultTo: "applicant_email",
    notes: "Template exists, not yet triggered",
    sourceFunction: "top25-claim-intent (future)",
  },
  {
    key: "spotlight-internal",
    label: "Spotlight Application (Internal)",
    audience: "admin",
    implemented: false,
    defaultTo: "SMTP_INTERNAL_EMAIL",
    notes: "Template exists, not yet triggered",
    sourceFunction: "featured-spotlight (future)",
  },
  {
    key: "spotlight-applicant",
    label: "Spotlight Application (Applicant)",
    audience: "agency",
    implemented: false,
    defaultTo: "applicant_email",
    notes: "Template exists, not yet triggered",
    sourceFunction: "featured-spotlight (future)",
  },
  {
    key: "other-listing-internal",
    label: "Other Listing Activation (Internal)",
    audience: "admin",
    implemented: false,
    defaultTo: "SMTP_INTERNAL_EMAIL",
    notes: "Template exists, not yet triggered",
    sourceFunction: "other-listing-application (future)",
  },
  {
    key: "other-listing-applicant",
    label: "Other Listing Activation (Applicant)",
    audience: "agency",
    implemented: false,
    defaultTo: "applicant_email",
    notes: "Template exists, not yet triggered",
    sourceFunction: "other-listing-application (future)",
  },
  {
    key: "your-agency-profile-click-internal",
    label: "/your-agency Profile Click (Internal)",
    audience: "admin",
    implemented: true,
    defaultTo: "SMTP_INTERNAL_EMAIL",
    notes: "Sent when a visitor clicks an agency profile from the /your-agency searchbar. Includes imported agency emails.",
    sourceFunction: "your-agency-profile-click",
  },
];

const EVENTS_MATRIX: EventInfo[] = [
  {
    event: "Availability Request",
    templates: ["availability-internal", "availability-owner"],
    recipients: "Internal email + agency owner",
    implemented: true,
    notes: "Internal email working via availability-notify",
    sourceFunction: "availability-notify",
  },
  {
    event: "Top-25 Submission",
    templates: ["top25-internal", "top25-applicant"],
    recipients: "Internal email + applicant",
    implemented: false,
    notes: "Templates ready, awaiting integration",
    sourceFunction: "top25-claim-intent (future)",
  },
  {
    event: "Spotlight Application",
    templates: ["spotlight-internal", "spotlight-applicant"],
    recipients: "Internal email + applicant",
    implemented: false,
    notes: "Templates ready, awaiting integration",
    sourceFunction: "featured-spotlight (future)",
  },
  {
    event: "Other Listing Activation",
    templates: ["other-listing-internal", "other-listing-applicant"],
    recipients: "Internal email + applicant",
    implemented: false,
    notes: "Templates ready, awaiting integration",
    sourceFunction: "other-listing-application (future)",
  },
  {
    event: "Contact Form",
    templates: [],
    recipients: "Internal email",
    implemented: false,
    notes: "Currently only logged to DB, no email sent",
    sourceFunction: "contact-submit (logs only)",
  },
  {
    event: "/your-agency Profile Click",
    templates: ["your-agency-profile-click-internal"],
    recipients: "Internal email (SMTP_INTERNAL_EMAIL)",
    implemented: true,
    notes: "Internal email with agency name, profile URL, search query, imported emails",
    sourceFunction: "your-agency-profile-click",
  },
];

function getDummyData(templateKey: string) {
  const baseTimestamp = new Date().toISOString();

  if (templateKey === "availability-internal" || templateKey === "availability-owner") {
    return {
      agencyName: "VazAgency Marketing",
      stateName: "New Jersey",
      clientName: "John Smith",
      clientEmail: "john.smith@example.com",
      service: "SEO & Content Marketing",
      budget: "$5,000 - $10,000",
      timeline: "Within 2-3 months",
      submittedAtIso: baseTimestamp,
      isPaidListing: true,
    };
  }

  if (templateKey === "top25-internal" || templateKey === "top25-applicant") {
    return {
      agencyName: "Digital Marketing Pro",
      contactName: "Jane Doe",
      contactEmail: "jane@digitalpro.com",
      websiteUrl: "https://digitalpro.com",
      stateName: "California",
      stateSlug: "california",
      services: ["SEO", "PPC", "Social Media", "Content Marketing"],
      description: "We're a full-service digital marketing agency with 10+ years of experience helping businesses grow their online presence.",
      submittedAtIso: baseTimestamp,
      ipAddress: "192.0.2.1",
      userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    };
  }

  if (templateKey === "spotlight-internal" || templateKey === "spotlight-applicant") {
    return {
      agencyName: "Creative Spotlight Agency",
      contactName: "Mike Johnson",
      contactEmail: "mike@creativespotlight.com",
      websiteUrl: "https://creativespotlight.com",
      stateName: "Texas",
      stateSlug: "texas",
      services: ["Branding", "Web Design", "Social Media"],
      description: "Award-winning creative agency specializing in brand development and digital experiences.",
      budgetRange: "$10,000+",
      submittedAtIso: baseTimestamp,
      ipAddress: "198.51.100.1",
      userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    };
  }

  if (templateKey === "other-listing-internal" || templateKey === "other-listing-applicant") {
    return {
      agencyName: "Growth Marketing Co",
      contactName: "Sarah Williams",
      contactEmail: "sarah@growthmarketing.com",
      websiteUrl: "https://growthmarketing.com",
      stateName: "Florida",
      stateSlug: "florida",
      services: ["Email Marketing", "Marketing Automation", "Analytics"],
      description: "Data-driven marketing agency focused on measurable growth and ROI.",
      budgetRange: "$5,000 - $10,000",
      submittedAtIso: baseTimestamp,
    };
  }

  return {};
}

function buildTemplatePreview(templateKey: string) {
  const dummyData = getDummyData(templateKey);

  switch (templateKey) {
    case "availability-internal":
      return buildAvailabilityRequestInternalEmail(dummyData as any);
    case "availability-owner":
      return buildAvailabilityRequestOwnerEmail(dummyData as any);
    case "top25-internal":
      return buildTop25SubmissionInternalEmail(dummyData as any);
    case "top25-applicant":
      return buildTop25SubmissionApplicantEmail(dummyData as any);
    case "spotlight-internal":
      return buildSpotlightApplicationInternalEmail(dummyData as any);
    case "spotlight-applicant":
      return buildSpotlightApplicationApplicantEmail(dummyData as any);
    case "other-listing-internal":
      return buildOtherListingActivationInternalEmail(dummyData as any);
    case "other-listing-applicant":
      return buildOtherListingActivationApplicantEmail(dummyData as any);
    default:
      throw new Error(`Unknown template key: ${templateKey}`);
  }
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { status: 200, headers: corsHeaders });
  }

  if (req.method !== "POST") {
    return new Response(
      JSON.stringify({ error: "METHOD_NOT_ALLOWED" }),
      { status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!supabaseUrl || !supabaseServiceKey) {
      return new Response(
        JSON.stringify({ error: "SERVER_CONFIG_ERROR" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Authenticate via admin_secrets table
    const receivedSecret = req.headers.get("x-admin-secret")?.trim() || "";

    const { data: secretData, error: secretError } = await supabase
      .from("admin_secrets")
      .select("value")
      .eq("key", "ADMIN_IMPORT_SECRET")
      .eq("is_active", true)
      .maybeSingle();

    if (secretError) {
      console.error("[email-center] DB error fetching secret:", secretError);
      return new Response(
        JSON.stringify({ error: "DB_ERROR" }),
        { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    if (!secretData || secretData.value !== receivedSecret) {
      return new Response(
        JSON.stringify({ error: "UNAUTHORIZED" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Parse body
    const body = await req.json();
    const { action } = body;

    // ACTION: status
    if (action === "status") {
      const smtpHost = Deno.env.get("SMTP_HOST");
      const smtpPort = Deno.env.get("SMTP_PORT");
      const smtpUsername = Deno.env.get("SMTP_USERNAME");
      const smtpPassword = Deno.env.get("SMTP_PASSWORD");
      const smtpFrom = Deno.env.get("SMTP_FROM_SUPPORT");
      const internalEmail = Deno.env.get("SMTP_INTERNAL_EMAIL");

      return new Response(
        JSON.stringify({
          smtp: {
            hostSet: !!smtpHost,
            portSet: !!smtpPort,
            usernameSet: !!smtpUsername,
            passwordSet: !!smtpPassword,
            fromSet: !!smtpFrom,
            internalEmailSet: !!internalEmail,
            fromValue: smtpFrom || "",
            internalEmailValue: internalEmail || "",
          },
          templates: TEMPLATES,
          eventsMatrix: EVENTS_MATRIX,
        }),
        { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // ACTION: preview
    if (action === "preview") {
      const { templateKey } = body;

      if (!templateKey || typeof templateKey !== "string") {
        return new Response(
          JSON.stringify({ error: "INVALID_INPUT", message: "templateKey required" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      try {
        const preview = buildTemplatePreview(templateKey);
        return new Response(
          JSON.stringify(preview),
          { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      } catch (error) {
        return new Response(
          JSON.stringify({ error: "TEMPLATE_ERROR", message: error.message }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
    }

    // ACTION: sendTest
    if (action === "sendTest") {
      const { templateKey, to } = body;

      if (!templateKey || !to) {
        return new Response(
          JSON.stringify({ error: "INVALID_INPUT", message: "templateKey and to required" }),
          { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      // Check SMTP config
      const smtpHost = Deno.env.get("SMTP_HOST");
      const smtpPort = Deno.env.get("SMTP_PORT");
      const smtpUsername = Deno.env.get("SMTP_USERNAME");
      const smtpPassword = Deno.env.get("SMTP_PASSWORD");

      if (!smtpHost || !smtpPort || !smtpUsername || !smtpPassword) {
        return new Response(
          JSON.stringify({ success: false, error: "SMTP config missing" }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }

      try {
        const { subject, html, text } = buildTemplatePreview(templateKey);

        const result = await sendEmail({
          to,
          subject: `[TEST] ${subject}`,
          html,
          text,
        });

        return new Response(
          JSON.stringify(result),
          { status: result.success ? 200 : 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      } catch (error) {
        return new Response(
          JSON.stringify({ success: false, error: error.message }),
          { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
        );
      }
    }

    return new Response(
      JSON.stringify({ error: "UNKNOWN_ACTION", message: `Unknown action: ${action}` }),
      { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("[email-center] Unexpected error:", error);
    return new Response(
      JSON.stringify({ error: "INTERNAL_ERROR", message: error.message }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
