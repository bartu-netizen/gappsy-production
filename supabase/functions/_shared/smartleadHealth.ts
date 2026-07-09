// Smartlead runtime health diagnostics (server-side only)
// Detects whether secrets are visible in THIS Deno Edge Function runtime
// Does NOT expose secret values
// Canonical secret name: SMARTLEAD_API_KEY (do not use aliases like SMARTLEAD_KEY or SMARTLEAD_APIKEY)

export interface SmartleadHealth {
  api_key_configured: boolean;
  api_key_canonical_name: string;
  webhook_secret_configured: boolean;
  webhook_secret_optional: boolean;
  smartlead_base_url_configured: boolean;
  smartlead_base_url_effective: string;
  runtime_env: string;
  scope: "supabase_edge_function";
  bolt_managed_secrets_expected: boolean;
  tested_connectivity: boolean;
  smartlead_api_reachable: boolean | null;
  smartlead_api_test_error: string | null;
  checked_at: string;
}

export async function getSmartleadRuntimeHealth(options?: {
  testConnectivity?: boolean;
}): Promise<SmartleadHealth> {
  const testConnectivity = options?.testConnectivity ?? false;

  // Check canonical env variable only (no alias fallback)
  const apiKeyConfigured = !!Deno.env.get("SMARTLEAD_API_KEY");
  const apiKeyCanonicalName = "SMARTLEAD_API_KEY";

  const webhookSecretConfigured = !!Deno.env.get("SMARTLEAD_WEBHOOK_SECRET");
  const baseUrlConfigured = !!Deno.env.get("SMARTLEAD_BASE_URL");
  const baseUrlEffective = Deno.env.get("SMARTLEAD_BASE_URL") || "https://server.smartlead.ai/api/v1";

  const health: SmartleadHealth = {
    api_key_configured: apiKeyConfigured,
    api_key_canonical_name: apiKeyCanonicalName,
    webhook_secret_configured: webhookSecretConfigured,
    webhook_secret_optional: true,
    smartlead_base_url_configured: baseUrlConfigured,
    smartlead_base_url_effective: baseUrlEffective,
    runtime_env: "supabase_edge_function",
    scope: "supabase_edge_function",
    bolt_managed_secrets_expected: true,
    tested_connectivity: false,
    smartlead_api_reachable: null,
    smartlead_api_test_error: null,
    checked_at: new Date().toISOString(),
  };

  // Test connectivity if requested and key is configured
  if (testConnectivity && apiKeyConfigured) {
    try {
      const apiKey = Deno.env.get("SMARTLEAD_API_KEY");
      const url = new URL(`${baseUrlEffective}/campaigns`);
      url.searchParams.set("api_key", apiKey!);

      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 10000);

      const response = await fetch(url.toString(), {
        method: "GET",
        signal: controller.signal,
        headers: { "Content-Type": "application/json" },
      });

      clearTimeout(timeoutId);

      health.tested_connectivity = true;
      health.smartlead_api_reachable = response.ok || response.status === 401 || response.status === 403;

      if (!response.ok && response.status !== 401 && response.status !== 403) {
        health.smartlead_api_test_error = `HTTP ${response.status} from Smartlead API`;
      }
    } catch (error) {
      health.tested_connectivity = true;
      const msg = error instanceof Error ? error.message : String(error);

      // Sanitize error messages
      if (msg.includes("AbortError")) {
        health.smartlead_api_test_error = "Smartlead API timeout (10s)";
      } else if (msg.includes("Network")) {
        health.smartlead_api_test_error = "Network error reaching Smartlead API";
      } else {
        health.smartlead_api_test_error = "Smartlead API unreachable";
      }
      health.smartlead_api_reachable = false;
    }
  }

  return health;
}
