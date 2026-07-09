export interface SmtpConfig {
  host: string;
  port: number;
  username: string;
  password: string;
  fromSupport: string;
  internalEmail: string;
}

export interface SmtpConfigResult {
  ok: boolean;
  config?: SmtpConfig;
  missing: string[];
  error?: string;
}

export function getSmtpConfig(): SmtpConfigResult {
  const host = Deno.env.get("SMTP_HOST")?.trim() ?? "";
  const portStr = Deno.env.get("SMTP_PORT")?.trim() ?? "";
  const username = Deno.env.get("SMTP_USERNAME")?.trim() ?? "";
  const password = Deno.env.get("SMTP_PASSWORD")?.trim() ?? "";
  const fromSupport = Deno.env.get("SMTP_FROM_SUPPORT")?.trim() ?? "";
  const internalEmail = Deno.env.get("SMTP_INTERNAL_EMAIL")?.trim() ?? "";

  const missing: string[] = [];
  if (!host) missing.push("SMTP_HOST");
  if (!portStr) missing.push("SMTP_PORT");
  if (!username) missing.push("SMTP_USERNAME");
  if (!password) missing.push("SMTP_PASSWORD");
  if (!fromSupport) missing.push("SMTP_FROM_SUPPORT");
  if (!internalEmail) missing.push("SMTP_INTERNAL_EMAIL");

  if (missing.length > 0) {
    return { ok: false, missing, error: `Missing required SMTP secrets: ${missing.join(", ")}` };
  }

  const port = parseInt(portStr, 10);
  if (isNaN(port) || port < 1 || port > 65535) {
    return { ok: false, missing: [], error: `SMTP_PORT "${portStr}" is not a valid port number` };
  }

  return {
    ok: true,
    missing: [],
    config: { host, port, username, password, fromSupport, internalEmail },
  };
}
