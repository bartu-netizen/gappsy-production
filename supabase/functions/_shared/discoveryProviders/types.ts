// Provider-agnostic contract for the Discovery Engine's automated ingestion
// layer — mirrors _shared/enrichmentProviders/types.ts's pattern. Every
// caller (the manual "run now" edge function today, a future scheduler)
// talks only to this interface, never to a specific source's API/parser.
// Adding a new source means writing one file that implements
// DiscoveryProvider and registering it in registry.ts; nothing else changes.

// What a provider hands back per candidate — deliberately narrow and
// factual. `category_hint`/`tags_hint` are free-text suggestions resolved
// against the EXISTING tool_categories/tool_tags taxonomy elsewhere
// (discoveryIngest.ts); a provider never invents or writes taxonomy rows.
export interface RawDiscoveryCandidate {
  name: string;
  official_website: string;
  short_description?: string | null;
  logo_url?: string | null;
  source_url?: string | null;
  category_hint?: string | null;
  tags_hint?: string[];
  // Bounded, provider-specific payload kept for provenance/debugging only
  // (e.g. the raw GitHub list entry or Product Hunt post). Never rendered
  // as-is to end users; never a substitute for factual normalized fields.
  raw?: unknown;
}

export interface FetchResult {
  candidates: RawDiscoveryCandidate[];
  // Present when the source exposes rate-limit headers (e.g. GitHub) —
  // recorded on the run row for Provider Health, never enforced client-side
  // beyond the provider's own backoff.
  rate_limit_remaining?: number | null;
  // Opaque pagination/incremental-sync checkpoint a provider can hand back
  // and expect to receive again on its next run (e.g. "last seen post id").
  // Providers that fetch a bounded, non-paginated source may omit this.
  cursor_out?: string | null;
  warnings?: string[];
}

export type ScheduleFrequency = "hourly" | "daily" | "weekly" | "manual";

export interface DiscoveryProvider {
  readonly key: string;
  readonly name: string;
  readonly description: string;
  // false = a registered stub — fetchCandidates() throws
  // ProviderNotImplementedError; the DB row's disabled_reason explains why
  // (missing credential, pending ToS review, etc).
  readonly implemented: boolean;
  readonly defaultPriority: number;
  readonly defaultRateLimitPerRun: number;
  readonly defaultScheduleFrequency: ScheduleFrequency;

  /** Fetches up to `rateLimitPerRun` candidates. `config` is the
   *  provider's discovery_providers.config jsonb (repo lists, filters,
   *  etc); `cursorIn` is the previous run's cursor_out, or null on a first/
   *  manual run. Must never throw for "no new candidates" — return an
   *  empty array. Only throws for genuine failures (missing credential,
   *  upstream error, not-implemented). */
  fetchCandidates(config: Record<string, unknown>, cursorIn: string | null, rateLimitPerRun: number): Promise<FetchResult>;
}

export class ProviderNotImplementedError extends Error {
  constructor(providerKey: string, reason?: string) {
    super(reason ? `Provider "${providerKey}" is not implemented yet: ${reason}` : `Provider "${providerKey}" is not implemented yet.`);
    this.name = "ProviderNotImplementedError";
  }
}

export class ProviderConfigError extends Error {
  constructor(providerKey: string, reason: string) {
    super(`Provider "${providerKey}" cannot run: ${reason}`);
    this.name = "ProviderConfigError";
  }
}
