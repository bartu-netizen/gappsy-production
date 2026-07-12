// Discovery provider registry — mirrors _shared/enrichmentProviders/
// registry.ts's pattern. Adding a new source means writing one file that
// implements DiscoveryProvider (see ./types.ts) and adding one line here;
// the migration seed row (supabase/migrations/..._discovery_provider_
// architecture.sql) registers it in the database. Nothing else changes.

import { githubAwesomeListsProvider } from "./githubAwesomeListsProvider.ts";
import { productHuntProvider } from "./productHuntProvider.ts";
import { makeStubProvider } from "./stubProvider.ts";
import { DiscoveryProvider, ProviderNotImplementedError } from "./types.ts";

const SCRAPER_STUB_REASON = "No confirmed public API — pending a ToS review before a scraper is built.";

const PROVIDERS: Record<string, DiscoveryProvider> = {
  github_awesome_lists: githubAwesomeListsProvider,
  product_hunt: productHuntProvider,
  peerlist: makeStubProvider("peerlist", "Peerlist", SCRAPER_STUB_REASON),
  futuretools: makeStubProvider("futuretools", "FutureTools", SCRAPER_STUB_REASON),
  alternativeto: makeStubProvider("alternativeto", "AlternativeTo", SCRAPER_STUB_REASON),
  saashub: makeStubProvider("saashub", "SaaSHub", SCRAPER_STUB_REASON),
};

export function getProvider(key: string): DiscoveryProvider {
  const provider = PROVIDERS[key];
  if (!provider) throw new ProviderNotImplementedError(key, "no provider module registered for this key");
  return provider;
}

export function listProviders(): DiscoveryProvider[] {
  return Object.values(PROVIDERS);
}
