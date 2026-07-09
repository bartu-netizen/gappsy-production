import { createClient } from "npm:@supabase/supabase-js@2.57.4";

export interface SenderIdentity {
  fromName: string;
  fromEmail: string;
  replyTo?: string;
}

export async function getSenderIdentity(
  supabaseUrl?: string,
  supabaseServiceRole?: string,
  notificationType?: string
): Promise<SenderIdentity> {
  try {
    const supabase = createClient(
      supabaseUrl || Deno.env.get("SUPABASE_URL") || "",
      supabaseServiceRole || Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") || "",
      { auth: { autoRefreshToken: false, persistSession: false } }
    );

    let fromName = "Gappsy";
    let fromEmail = "noreply@gappsy.com";
    let replyTo: string | undefined;

    const { data: settings } = await supabase
      .from("em_settings")
      .select("key,value")
      .in("key", ["from_name", "from_email", "reply_to"]);

    if (settings) {
      const settingsMap: Record<string, string> = {};
      settings.forEach((row: any) => {
        settingsMap[row.key] = row.value;
      });
      fromName = settingsMap.from_name || "Gappsy";
      fromEmail = settingsMap.from_email || "noreply@gappsy.com";
      replyTo = settingsMap.reply_to || undefined;
    }

    return { fromName, fromEmail, replyTo };
  } catch (error) {
    console.error("getSenderIdentity error:", error);
    return {
      fromName: "Gappsy",
      fromEmail: "noreply@gappsy.com",
    };
  }
}
