import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface HealthStatus {
  status: "healthy" | "warning" | "error";
  checks: {
    name: string;
    status: "pass" | "fail" | "warn";
    message: string;
    details?: Record<string, any>;
  }[];
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  if (req.method !== "GET") {
    return new Response(
      JSON.stringify({ error: "Method not allowed" }),
      {
        status: 405,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL");
    const supabaseServiceRole = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
    const debug = new URL(req.url).searchParams.get("debug") === "1";

    const checks: HealthStatus["checks"] = [];

    // Check configuration
    if (!supabaseUrl || !supabaseServiceRole) {
      checks.push({
        name: "Supabase Configuration",
        status: "fail",
        message: "Missing Supabase environment variables",
      });
    } else {
      checks.push({
        name: "Supabase Configuration",
        status: "pass",
        message: "Supabase credentials configured",
        details: debug ? { url: supabaseUrl } : undefined,
      });

      const supabase = createClient(supabaseUrl, supabaseServiceRole);

      // Check database connectivity
      try {
        const { error } = await supabase
          .from("email_messages")
          .select("count")
          .limit(1);

        if (error) {
          checks.push({
            name: "Database Connectivity",
            status: "fail",
            message: `Failed to connect to database: ${error.message}`,
          });
        } else {
          checks.push({
            name: "Database Connectivity",
            status: "pass",
            message: "Database connection successful",
          });
        }
      } catch (err) {
        checks.push({
          name: "Database Connectivity",
          status: "fail",
          message: `Database error: ${err instanceof Error ? err.message : "Unknown error"}`,
        });
      }

      // Check email_messages table
      try {
        const { count, error } = await supabase
          .from("email_messages")
          .select("*", { count: "exact", head: true });

        if (error) {
          checks.push({
            name: "email_messages Table",
            status: "fail",
            message: `Failed to query table: ${error.message}`,
          });
        } else {
          checks.push({
            name: "email_messages Table",
            status: "pass",
            message: `Table accessible (${count} records)`,
            details: debug ? { count } : undefined,
          });
        }
      } catch (err) {
        checks.push({
          name: "email_messages Table",
          status: "fail",
          message: `Table error: ${err instanceof Error ? err.message : "Unknown error"}`,
        });
      }

      // Check email_events table
      try {
        const { count, error } = await supabase
          .from("email_events")
          .select("*", { count: "exact", head: true });

        if (error) {
          checks.push({
            name: "email_events Table",
            status: "fail",
            message: `Failed to query table: ${error.message}`,
          });
        } else {
          checks.push({
            name: "email_events Table",
            status: "pass",
            message: `Table accessible (${count} records)`,
            details: debug ? { count } : undefined,
          });
        }
      } catch (err) {
        checks.push({
          name: "email_events Table",
          status: "fail",
          message: `Table error: ${err instanceof Error ? err.message : "Unknown error"}`,
        });
      }

      // Check SMTP configuration
      const smtpHost = Deno.env.get("SMTP_HOST")?.trim();
      const smtpPort = Deno.env.get("SMTP_PORT")?.trim();
      const smtpUser = Deno.env.get("SMTP_USERNAME")?.trim();
      const smtpPass = Deno.env.get("SMTP_PASSWORD")?.trim();

      if (!smtpHost || !smtpPort || !smtpUser || !smtpPass) {
        checks.push({
          name: "SMTP Configuration",
          status: "fail",
          message: "SMTP configuration incomplete or missing",
        });
      } else {
        checks.push({
          name: "SMTP Configuration",
          status: "pass",
          message: "SMTP credentials configured",
          details: debug ? { host: smtpHost, port: smtpPort } : undefined,
        });
      }
    }

    // Determine overall health
    const hasFailures = checks.some((c) => c.status === "fail");
    const hasWarnings = checks.some((c) => c.status === "warn");
    const overallStatus: HealthStatus["status"] = hasFailures
      ? "error"
      : hasWarnings
      ? "warning"
      : "healthy";

    const response: HealthStatus = {
      status: overallStatus,
      checks,
    };

    return new Response(JSON.stringify(response), {
      status: overallStatus === "error" ? 500 : 200,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Health check error:", error);
    return new Response(
      JSON.stringify({
        status: "error",
        checks: [
          {
            name: "Health Check",
            status: "fail",
            message: error instanceof Error ? error.message : "Unknown error",
          },
        ],
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
