// Run with: deno test --allow-env supabase/functions/_shared/discoveryProviders/productHuntProvider.test.ts
// --allow-env is required because fetchCandidates() calls Deno.env.get() —
// without it, Deno denies the permission check itself (a "NotCapable"
// error) before the code ever reaches the intended ProviderConfigError.
import { assertEquals, assertRejects } from "jsr:@std/assert@1";
import { mapPostToCandidate, productHuntProvider } from "./productHuntProvider.ts";
import { ProviderConfigError } from "./types.ts";

Deno.test("fetchCandidates throws ProviderConfigError when PRODUCT_HUNT_API_TOKEN is unset", async () => {
  // Deno tests run without special env by default, so PRODUCT_HUNT_API_TOKEN
  // is naturally absent here — no need to unset anything.
  await assertRejects(
    () => productHuntProvider.fetchCandidates({}, null, 50),
    ProviderConfigError,
    'Provider "product_hunt" cannot run: PRODUCT_HUNT_API_TOKEN is not configured',
  );
});

Deno.test("mapPostToCandidate maps a full post node", () => {
  const post = {
    id: "1",
    name: "Acme Tool",
    tagline: "The best acme tool",
    description: "A much longer description of the acme tool.",
    url: "https://www.producthunt.com/posts/acme-tool",
    website: "https://acme.example.com",
    votesCount: 42,
    topics: {
      edges: [{ node: { name: "Productivity" } }, { node: { name: "Developer Tools" } }],
    },
    thumbnail: { url: "https://ph-files.example.com/thumb.png" },
  };

  const candidate = mapPostToCandidate(post);

  assertEquals(candidate.name, "Acme Tool");
  assertEquals(candidate.official_website, "https://acme.example.com");
  assertEquals(candidate.short_description, "The best acme tool");
  assertEquals(candidate.logo_url, "https://ph-files.example.com/thumb.png");
  assertEquals(candidate.source_url, "https://www.producthunt.com/posts/acme-tool");
  assertEquals(candidate.category_hint, "Productivity");
  assertEquals(candidate.tags_hint, ["Productivity", "Developer Tools"]);
  assertEquals(candidate.raw, post);
});

Deno.test("mapPostToCandidate falls back to description when tagline is missing/null, and to url when website is absent", () => {
  const post = {
    id: "2",
    name: "Beta Widget",
    tagline: null,
    description: "Beta Widget helps you widget better than ever before.",
    url: "https://www.producthunt.com/posts/beta-widget",
    website: null,
    votesCount: 5,
    topics: { edges: [{ node: { name: "Widgets" } }] },
    thumbnail: null,
  };

  const candidate = mapPostToCandidate(post);

  assertEquals(candidate.short_description, "Beta Widget helps you widget better than ever before.");
  assertEquals(candidate.official_website, "https://www.producthunt.com/posts/beta-widget");
  assertEquals(candidate.logo_url, null);
  assertEquals(candidate.category_hint, "Widgets");
});

Deno.test("mapPostToCandidate handles an empty topics array and truncates a very long description", () => {
  const longDescription = "x".repeat(400);
  const post = {
    id: "3",
    name: "Gamma Gadget",
    tagline: "",
    description: longDescription,
    url: "https://www.producthunt.com/posts/gamma-gadget",
    website: undefined,
    votesCount: 0,
    topics: { edges: [] },
    thumbnail: undefined,
  };

  const candidate = mapPostToCandidate(post);

  assertEquals(candidate.tags_hint, []);
  assertEquals(candidate.category_hint, null);
  assertEquals(candidate.short_description?.length, 300);
  assertEquals(candidate.short_description?.endsWith("…"), true);
});
