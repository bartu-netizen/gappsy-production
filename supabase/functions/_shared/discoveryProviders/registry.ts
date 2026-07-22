// Discovery provider registry — mirrors _shared/enrichmentProviders/
// registry.ts's pattern. Adding a new source means writing one file that
// implements DiscoveryProvider (see ./types.ts) and adding one line here;
// the migration seed row (supabase/migrations/..._discovery_provider_
// architecture.sql) registers it in the database. Nothing else changes.

import { githubAwesomeListsProvider } from "./githubAwesomeListsProvider.ts";
import { productHuntProvider } from "./productHuntProvider.ts";
import { npmRegistryProvider } from "./npmRegistryProvider.ts";
import { pypiProvider } from "./pypiProvider.ts";
import { vscodeMarketplaceProvider } from "./vscodeMarketplaceProvider.ts";
import { wordpressPluginProvider } from "./wordpressPluginProvider.ts";
import { githubTopicsProvider } from "./githubTopicsProvider.ts";
import { saashubProvider } from "./saashubProvider.ts";
import { makeStubProvider } from "./stubProvider.ts";
import { DiscoveryProvider, ProviderNotImplementedError } from "./types.ts";

const SCRAPER_STUB_REASON = "No confirmed public API — pending a ToS review before a scraper is built.";

const PROVIDERS: Record<string, DiscoveryProvider> = {
  github_awesome_lists: githubAwesomeListsProvider,
  product_hunt: productHuntProvider,
  npm_registry: npmRegistryProvider,
  pypi: pypiProvider,
  vscode_marketplace: vscodeMarketplaceProvider,
  wordpress_plugins: wordpressPluginProvider,
  github_topics: githubTopicsProvider,
  saashub: saashubProvider,
  peerlist: makeStubProvider("peerlist", "Peerlist", SCRAPER_STUB_REASON),
  futuretools: makeStubProvider("futuretools", "FutureTools", SCRAPER_STUB_REASON),
  alternativeto: makeStubProvider("alternativeto", "AlternativeTo", SCRAPER_STUB_REASON),
  // Deliberately deferred, not "not yet built" — verified (July 2026) that
  // neither has an appropriate public discovery mechanism:
  chrome_web_store: makeStubProvider(
    "chrome_web_store",
    "Chrome Web Store",
    "The Chrome Web Store API (v1/v2) is a PUBLISHER-management API — it lets a developer manage items THEY own, authenticated via a Google service account. It has no public search/browse/list-all-extensions endpoint for discovery. Activation would require either (a) Google introducing a public discovery API, or (b) a verified, explicitly-permitted alternative (e.g. a licensed data partnership) — not scraping the storefront.",
  ),
  stackshare: makeStubProvider(
    "stackshare",
    "StackShare",
    "StackShare's public API was discontinued for general developer use (confirmed July 2026 — docs.stackshare.io exists but is not generally accessible; no current self-serve API access). Activation requires StackShare shipping a new public API or granting an explicit partnership/permitted-integration agreement — not scraping stackshare.io.",
  ),
};

export function getProvider(key: string): DiscoveryProvider {
  const provider = PROVIDERS[key];
  if (!provider) throw new ProviderNotImplementedError(key, "no provider module registered for this key");
  return provider;
}

export function listProviders(): DiscoveryProvider[] {
  return Object.values(PROVIDERS);
}
