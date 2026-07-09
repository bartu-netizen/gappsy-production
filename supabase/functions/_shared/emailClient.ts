import nodemailer from 'npm:nodemailer@6.9.7';
import { createClient } from 'npm:@supabase/supabase-js@2';

export type SendEmailOptions = {
  to: string | string[];
  subject: string;
  html?: string;
  text?: string;
  from?: string;
  replyTo?: string;
};

export function createSmtpTransport() {
  const host = Deno.env.get('SMTP_HOST')?.trim() ?? '';
  const port = Number(Deno.env.get('SMTP_PORT') || 2525);
  const user = Deno.env.get('SMTP_USERNAME')?.trim() ?? '';
  const pass = Deno.env.get('SMTP_PASSWORD')?.trim() ?? '';

  if (!host || !user || !pass) {
    throw new Error('SMTP config missing: SMTP_HOST, SMTP_USERNAME, and SMTP_PASSWORD are required');
  }

  const is465 = port === 465;

  return nodemailer.createTransport({
    host,
    port,
    secure: is465,
    requireTLS: false,
    ignoreTLS: !is465,
    auth: { user, pass },
  });
}

async function getDefaultSenderIdentity(): Promise<{ from: string; replyTo?: string }> {
  try {
    const supabaseUrl = Deno.env.get('SUPABASE_URL');
    const serviceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
    if (!supabaseUrl || !serviceKey) {
      return { from: Deno.env.get('SMTP_FROM_SUPPORT') || 'Gappsy <noreply@gappsy.com>' };
    }
    const supabase = createClient(supabaseUrl, serviceKey);
    const { data } = await supabase
      .from('email_sender_settings')
      .select('default_from_name, default_from_email, default_reply_to')
      .order('created_at', { ascending: true })
      .limit(1)
      .maybeSingle();
    if (data?.default_from_email) {
      const name = data.default_from_name || 'Gappsy';
      return {
        from: `${name} <${data.default_from_email}>`,
        replyTo: data.default_reply_to || undefined,
      };
    }
  } catch (err) {
    console.error('[emailClient] Failed to load sender identity:', err);
  }
  return { from: Deno.env.get('SMTP_FROM_SUPPORT') || 'Gappsy <noreply@gappsy.com>' };
}

export async function sendEmail(
  options: SendEmailOptions
): Promise<{ success: boolean; error?: string }> {
  let transporter: ReturnType<typeof nodemailer.createTransport>;
  try {
    transporter = createSmtpTransport();
  } catch (err: any) {
    console.error('[emailClient] Failed to create SMTP transport:', err.message);
    return { success: false, error: err.message };
  }

  const identity = options.from ? null : await getDefaultSenderIdentity();

  const mailOptions: Record<string, any> = {
    from: options.from || identity?.from || 'Gappsy <noreply@gappsy.com>',
    to: options.to,
    subject: options.subject,
    html: options.html,
    text: options.text,
  };

  if (options.replyTo) {
    mailOptions.replyTo = options.replyTo;
  } else if (identity?.replyTo) {
    mailOptions.replyTo = identity.replyTo;
  }

  try {
    await transporter.sendMail(mailOptions);
    console.log('[emailClient] Email sent successfully to:', options.to);
    return { success: true };
  } catch (err: any) {
    console.error('[emailClient] Error sending email:', err);
    return { success: false, error: err?.message || 'Unknown error' };
  }
}
