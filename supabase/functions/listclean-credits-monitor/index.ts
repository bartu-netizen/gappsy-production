import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.57.4";
import { listcleanGetCredits } from "../_shared/listcleanClient.ts";
import { sendEmail } from "../_shared/emailClient.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL");
const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
if (!supabaseUrl || !serviceRoleKey) {
  throw new Error("Missing Supabase credentials");
}

const supabase = createClient(supabaseUrl, serviceRoleKey);

interface MonitorState {
  id: string;
  last_credits_value: number | null;
  last_status: string | null;
  last_checked_at: string | null;
  last_alert_sent_at: string | null;
  last_alert_type_sent: string | null;
  queue_auto_paused: boolean;
  queue_auto_paused_at: string | null;
  queue_pause_reason: string | null;
  manual_pause: boolean;
  updated_at: string;
}

async function sendAlertEmail(
  alertType: "warning" | "critical" | "recovered",
  credits: number,
  warningThreshold: number,
  criticalThreshold: number,
  queuePaused: boolean
): Promise<boolean> {
  const recipient = "bartu@gappsy.com";

  let subject = "";
  let body = "";

  if (alertType === "warning") {
    subject = `[Gappsy] ListClean credits warning (${credits} left)`;
    body = `
ListClean Credits Alert - WARNING

Current Credits: ${credits}
Warning Threshold: ${warningThreshold}
Critical Threshold: ${criticalThreshold}

Your ListClean credits have dropped to the warning level.
Please consider adding more credits to avoid service interruption.

Queue Status: Running normally

Action: Review your ListClean account and add credits as needed.
Link: https://www.gappsy.com/wp-admin/email-cleaning

Timestamp: ${new Date().toISOString()}
    `.trim();
  } else if (alertType === "critical") {
    subject = `[Gappsy] ListClean credits CRITICAL (${credits} left) — Queue auto-paused`;
    body = `
ListClean Credits Alert - CRITICAL

Current Credits: ${credits}
Warning Threshold: ${warningThreshold}
Critical Threshold: ${criticalThreshold}

Your ListClean credits have hit the CRITICAL level.
The verification queue has been AUTOMATICALLY PAUSED to prevent service interruption.

Queue Status: AUTO-PAUSED (due to critical credits)

IMMEDIATE ACTION REQUIRED:
1. Add more credits to your ListClean account
2. Visit: https://www.gappsy.com/wp-admin/email-cleaning
3. Click "Refresh credits" to check status
4. Queue will automatically resume once credits recover above ${warningThreshold}

Alternatively, you can force-run the queue with manual override (use with caution).

Timestamp: ${new Date().toISOString()}
    `.trim();
  } else if (alertType === "recovered") {
    subject = `[Gappsy] ListClean credits recovered (${credits} left) — Queue resumed`;
    body = `
ListClean Credits Alert - RECOVERED

Current Credits: ${credits}
Warning Threshold: ${warningThreshold}

Your ListClean credits have recovered to a healthy level.
The verification queue has been AUTOMATICALLY RESUMED.

Queue Status: Running normally

No action required. Your email cleaning automation is back online.

Timestamp: ${new Date().toISOString()}
    `.trim();
  }

  const result = await sendEmail({ to: recipient, subject, text: body });
  if (!result.success) {
    console.error("[listclean-credits-monitor] Email send failed:", result.error);
  }
  return result.success;
}

async function updateMonitorState(updates: Partial<MonitorState>): Promise<void> {
  const { error } = await supabase
    .from("listclean_monitor_state")
    .update({ ...updates, updated_at: new Date().toISOString() })
    .eq("id", "default");

  if (error) {
    throw new Error(`Failed to update monitor state: ${error.message}`);
  }
}

Deno.serve(async () => {
  try {
    // Get thresholds from env or use defaults
    const warningThreshold = parseInt(Deno.env.get("LISTCLEAN_CREDITS_WARNING_THRESHOLD") || "5000");
    const criticalThreshold = parseInt(Deno.env.get("LISTCLEAN_CREDITS_CRITICAL_THRESHOLD") || "1000");
    const cooldownHours = parseInt(Deno.env.get("LISTCLEAN_CREDITS_ALERT_COOLDOWN_HOURS") || "12");

    // Fetch current credits
    const { credits } = await listcleanGetCredits();

    // Determine current status
    let currentStatus = "ok";
    if (credits <= criticalThreshold) {
      currentStatus = "critical";
    } else if (credits <= warningThreshold) {
      currentStatus = "warning";
    }

    // Get previous monitor state
    const { data: monitorState } = await supabase
      .from("listclean_monitor_state")
      .select("*")
      .eq("id", "default")
      .maybeSingle();

    if (!monitorState) {
      throw new Error("Monitor state row not found");
    }

    const previousStatus = monitorState.last_status || "unknown";
    const previousCredits = monitorState.last_credits_value || 0;
    const lastAlertSentAt = monitorState.last_alert_sent_at
      ? new Date(monitorState.last_alert_sent_at)
      : null;
    const lastAlertType = monitorState.last_alert_type_sent;

    // Check if enough time has passed for cooldown
    const now = new Date();
    const cooldownMs = cooldownHours * 60 * 60 * 1000;
    const canSendAlert =
      !lastAlertSentAt || now.getTime() - lastAlertSentAt.getTime() >= cooldownMs;

    // Determine what alerts to send
    let alertToSend: "warning" | "critical" | "recovered" | null = null;
    let shouldAutoUnpause = false;

    // Status transition: ok -> warning
    if (previousStatus !== "warning" && currentStatus === "warning" && canSendAlert) {
      alertToSend = "warning";
    }

    // Status transition: ok/warning -> critical
    if (previousStatus !== "critical" && currentStatus === "critical" && canSendAlert) {
      alertToSend = "critical";
    }

    // Status transition: warning/critical -> ok (recovery)
    if ((previousStatus === "warning" || previousStatus === "critical") && currentStatus === "ok" && canSendAlert) {
      alertToSend = "recovered";
      shouldAutoUnpause = true;
    }

    // Handle auto-pause on critical
    let queueAutoUnpaused = false;
    if (currentStatus === "critical" && !monitorState.queue_auto_paused) {
      // Auto-pause queue
      await updateMonitorState({
        queue_auto_paused: true,
        queue_auto_paused_at: new Date().toISOString(),
        queue_pause_reason: "critical_credits",
      });
    } else if (
      currentStatus === "ok" &&
      monitorState.queue_auto_paused &&
      monitorState.queue_pause_reason === "critical_credits" &&
      !monitorState.manual_pause &&
      shouldAutoUnpause
    ) {
      // Auto-unpause queue (credits recovered and no manual pause)
      await updateMonitorState({
        queue_auto_paused: false,
        queue_auto_paused_at: null,
        queue_pause_reason: null,
      });
      queueAutoUnpaused = true;
    }

    // Send alert if needed
    let alertSent = false;
    if (alertToSend) {
      alertSent = await sendAlertEmail(alertToSend, credits, warningThreshold, criticalThreshold, monitorState.queue_auto_paused);
    }

    // Update monitor state with current check
    await updateMonitorState({
      last_credits_value: credits,
      last_status: currentStatus,
      last_checked_at: new Date().toISOString(),
      ...(alertSent && {
        last_alert_sent_at: new Date().toISOString(),
        last_alert_type_sent: alertToSend,
      }),
    });

    return new Response(
      JSON.stringify({
        ok: true,
        credits,
        status: currentStatus,
        previous_status: previousStatus,
        alert_sent: alertSent ? alertToSend : null,
        queue_auto_paused: monitorState.queue_auto_paused,
        queue_auto_unpaused: queueAutoUnpaused,
        cooldown_hours: cooldownHours,
      }),
      { headers: { "Content-Type": "application/json" } }
    );
  } catch (err) {
    const message = err instanceof Error ? err.message : "Unknown error";
    console.error("[listclean-credits-monitor] Error:", err);

    return new Response(
      JSON.stringify({
        ok: false,
        error: message,
      }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    );
  }
});
