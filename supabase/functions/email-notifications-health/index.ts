import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface HealthCheckResult {
  notification_type: string;
  settings_exist: boolean;
  is_enabled: boolean;
  recipients_configured: boolean;
  recipient_emails: string;
  recent_logs_count: number;
  recent_sent_count: number;
  recent_failed_count: number;
  last_sent_at: string | null;
  last_failed_at: string | null;
  smtp_env_configured: boolean;
  emergency_fallback_available: boolean;
  health_status: "healthy" | "warning" | "critical";
  issues: string[];
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
    const smtpInternalEmail = Deno.env.get("SMTP_INTERNAL_EMAIL") ?? "";
    const smtpHost = Deno.env.get("SMTP_HOST") ?? "";
    const smtpUser = Deno.env.get("SMTP_USERNAME") ?? "";
    const smtpPassword = Deno.env.get("SMTP_PASSWORD") ?? "";

    const supabase = createClient(supabaseUrl, serviceKey, {
      auth: { autoRefreshToken: false, persistSession: false },
    });

    const CRITICAL_NOTIFICATION_TYPES = [
      "your_agency_profile_click",
      "availability_check",
    ];

    const results: HealthCheckResult[] = [];

    for (const notificationType of CRITICAL_NOTIFICATION_TYPES) {
      const issues: string[] = [];
      let healthStatus: "healthy" | "warning" | "critical" = "healthy";

      // Check if settings row exists
      const { data: setting } = await supabase
        .from("email_notification_settings")
        .select("is_enabled, recipient_emails")
        .eq("notification_type", notificationType)
        .maybeSingle();

      const settingsExist = !!setting;
      const isEnabled = setting?.is_enabled ?? false;
      const recipientEmails = setting?.recipient_emails ?? "";
      const recipientsConfigured = recipientEmails.trim().length > 0;

      if (!settingsExist) {
        issues.push("Settings row missing in email_notification_settings table");
        healthStatus = "critical";
      }

      if (!isEnabled) {
        issues.push("Notification type is disabled");
        healthStatus = "warning";
      }

      if (!recipientsConfigured && !smtpInternalEmail) {
        issues.push("No recipients configured and no SMTP_INTERNAL_EMAIL fallback");
        healthStatus = "critical";
      }

      // Check recent logs (last 7 days)
      const sevenDaysAgo = new Date();
      sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

      const { data: recentLogs, count: recentLogsCount } = await supabase
        .from("email_notification_logs")
        .select("status, created_at", { count: "exact" })
        .eq("notification_type", notificationType)
        .gte("created_at", sevenDaysAgo.toISOString());

      const recentSentCount = recentLogs?.filter(log => log.status === "sent").length ?? 0;
      const recentFailedCount = recentLogs?.filter(log => log.status === "failed").length ?? 0;

      const lastSentLog = recentLogs
        ?.filter(log => log.status === "sent")
        .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())[0];

      const lastFailedLog = recentLogs
        ?.filter(log => log.status === "failed")
        .sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())[0];

      if (recentFailedCount > 0 && recentSentCount === 0) {
        issues.push(`All ${recentFailedCount} recent notifications failed`);
        healthStatus = "critical";
      } else if (recentFailedCount > recentSentCount) {
        issues.push(`${recentFailedCount} failed vs ${recentSentCount} sent in last 7 days`);
        if (healthStatus !== "critical") healthStatus = "warning";
      }

      results.push({
        notification_type: notificationType,
        settings_exist: settingsExist,
        is_enabled: isEnabled,
        recipients_configured: recipientsConfigured,
        recipient_emails: recipientEmails,
        recent_logs_count: recentLogsCount ?? 0,
        recent_sent_count: recentSentCount,
        recent_failed_count: recentFailedCount,
        last_sent_at: lastSentLog?.created_at ?? null,
        last_failed_at: lastFailedLog?.created_at ?? null,
        smtp_env_configured: !!(smtpHost && smtpUser && smtpPassword),
        emergency_fallback_available: true, // hardcoded bartu@gappsy.com always available
        health_status: healthStatus,
        issues,
      });
    }

    const overallHealth = results.some(r => r.health_status === "critical")
      ? "critical"
      : results.some(r => r.health_status === "warning")
      ? "warning"
      : "healthy";

    return new Response(
      JSON.stringify({
        overall_health: overallHealth,
        checked_at: new Date().toISOString(),
        smtp_host_configured: !!smtpHost,
        smtp_internal_email_configured: !!smtpInternalEmail,
        notifications: results,
      }),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (err: unknown) {
    console.error("[email-notifications-health] Error:", err);
    return new Response(
      JSON.stringify({
        error: err instanceof Error ? err.message : String(err),
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
