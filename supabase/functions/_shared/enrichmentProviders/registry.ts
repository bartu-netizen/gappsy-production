import { claudeCodeBatchProvider } from "./claudeCodeBatchProvider.ts";
import { EnrichmentProvider, ProviderNotImplementedError } from "./types.ts";

const PROVIDERS: Record<string, EnrichmentProvider> = {
  claude_code_batch: claudeCodeBatchProvider,
};

// Reserved for future live-API providers — listed so Model Settings can show
// them as "coming soon" without implying they work.
export const RESERVED_PROVIDER_KEYS = ["openai", "anthropic", "gemini"];

export function getProvider(key: string): EnrichmentProvider {
  const provider = PROVIDERS[key];
  if (!provider) throw new ProviderNotImplementedError(key);
  return provider;
}

export function listAvailableProviders(): { key: string; label: string; mode: string; implemented: boolean }[] {
  return [
    ...Object.values(PROVIDERS).map((p) => ({ key: p.key, label: p.label, mode: p.mode, implemented: true })),
    ...RESERVED_PROVIDER_KEYS.map((key) => ({ key, label: key, mode: "live_api", implemented: false })),
  ];
}
