// Factory for registered-but-unimplemented providers — sources with no
// confirmed public API (Peerlist, FutureTools, AlternativeTo, SaaSHub
// today). Registering them (rather than omitting them entirely) lets the
// admin UI show what's planned and why it isn't running yet, without ever
// pretending a fetch would work.

import { DiscoveryProvider, ProviderNotImplementedError } from "./types.ts";

export function makeStubProvider(key: string, name: string, reason: string): DiscoveryProvider {
  return {
    key,
    name,
    description: reason,
    implemented: false,
    defaultPriority: 100,
    defaultRateLimitPerRun: 50,
    defaultScheduleFrequency: "weekly",
    fetchCandidates() {
      throw new ProviderNotImplementedError(key, reason);
    },
  };
}
