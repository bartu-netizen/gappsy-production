import { Handler, HandlerEvent, HandlerContext } from "@netlify/functions";
import nodemailer from "nodemailer";

/**
 * SMTP Test Function - Direct SMTP testing without Supabase
 *
 * Required Environment Variables (Bolt Secrets):
 * - SMTP_HOST: SMTP server hostname
 * - SMTP_PORT: SMTP server port
 * - SMTP_USERNAME: SMTP username
 * - SMTP_PASSWORD: SMTP password
 * - SMTP_FROM_SUPPORT: From email address (e.g., support@gappsy.com)
 * - SMTP_INTERNAL_EMAIL: Default internal email for testing
 */

const ALLOWED_ORIGIN = "https://gappsy.com";

const handler: Handler = async (event: HandlerEvent, context: HandlerContext) => {
  const corsHeaders = {
    "Access-Control-Allow-Origin": ALLOWED_ORIGIN,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "content-type",
    "Content-Type": "application/json",
  };

  // Handle OPTIONS preflight
  if (event.httpMethod === "OPTIONS") {
    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({ ok: true }),
    };
  }

  // Only allow POST
  if (event.httpMethod !== "POST") {
    return {
      statusCode: 405,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        error: "Method not allowed. Use POST.",
      }),
    };
  }

  // Parse body
  let body;
  try {
    body = JSON.parse(event.body || "{}");
  } catch (e) {
    return {
      statusCode: 400,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: false,
        error: "Invalid JSON in request body",
      }),
    };
  }

  const action = body.action || "status";

  // ACTION: STATUS - Check which SMTP vars are configured
  if (action === "status") {
    const status = {
      ok: true,
      action: "status",
      smtp: {
        host: !!process.env.SMTP_HOST,
        port: !!process.env.SMTP_PORT,
        username: !!process.env.SMTP_USERNAME,
        password: !!process.env.SMTP_PASSWORD,
        fromSupport: !!process.env.SMTP_FROM_SUPPORT,
        internalEmail: !!process.env.SMTP_INTERNAL_EMAIL,
      },
      allConfigured:
        !!process.env.SMTP_HOST &&
        !!process.env.SMTP_PORT &&
        !!process.env.SMTP_USERNAME &&
        !!process.env.SMTP_PASSWORD &&
        !!process.env.SMTP_FROM_SUPPORT,
    };

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify(status),
    };
  }

  // ACTION: SEND TEST - Send a test email
  if (action === "sendTest") {
    // Check required env vars
    if (
      !process.env.SMTP_HOST ||
      !process.env.SMTP_PORT ||
      !process.env.SMTP_USERNAME ||
      !process.env.SMTP_PASSWORD ||
      !process.env.SMTP_FROM_SUPPORT
    ) {
      return {
        statusCode: 500,
        headers: corsHeaders,
        body: JSON.stringify({
          ok: false,
          error: "SMTP not configured. Missing environment variables.",
          required: [
            "SMTP_HOST",
            "SMTP_PORT",
            "SMTP_USERNAME",
            "SMTP_PASSWORD",
            "SMTP_FROM_SUPPORT",
          ],
        }),
      };
    }

    // Get email parameters from request
    const to = body.to || process.env.SMTP_INTERNAL_EMAIL || "bartu@gappsy.com";
    const subject = body.subject || "Gappsy SMTP Test";
    const text = body.text || "This is a test email from Gappsy Email Center.";
    const html =
      body.html ||
      `
      <div style="font-family: Arial, sans-serif; padding: 20px;">
        <h2 style="color: #4A5DFF;">Gappsy SMTP Test</h2>
        <p>This is a test email from Gappsy Email Center.</p>
        <p style="color: #666; font-size: 12px;">
          Sent at: ${new Date().toISOString()}
        </p>
      </div>
    `;

    // Create transporter
    try {
      const transporter = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: parseInt(process.env.SMTP_PORT, 10),
        secure: parseInt(process.env.SMTP_PORT, 10) === 465,
        auth: {
          user: process.env.SMTP_USERNAME,
          pass: process.env.SMTP_PASSWORD,
        },
      });

      // Send email
      const info = await transporter.sendMail({
        from: process.env.SMTP_FROM_SUPPORT,
        to,
        subject,
        text,
        html,
      });

      return {
        statusCode: 200,
        headers: corsHeaders,
        body: JSON.stringify({
          ok: true,
          action: "sendTest",
          messageId: info.messageId,
          accepted: info.accepted,
          to,
          subject,
        }),
      };
    } catch (error) {
      return {
        statusCode: 500,
        headers: corsHeaders,
        body: JSON.stringify({
          ok: false,
          error: "Failed to send email",
          details: error instanceof Error ? error.message : String(error),
        }),
      };
    }
  }

  // Unknown action
  return {
    statusCode: 400,
    headers: corsHeaders,
    body: JSON.stringify({
      ok: false,
      error: `Unknown action: ${action}`,
      validActions: ["status", "sendTest"],
    }),
  };
};

export { handler };
