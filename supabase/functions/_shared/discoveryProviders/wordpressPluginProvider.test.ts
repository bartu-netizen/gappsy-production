import { assertEquals } from "jsr:@std/assert@1";
import { cleanWpDescription, mapPluginToCandidate } from "./wordpressPluginProvider.ts";

// fetchCandidates makes real network calls; only the pure mapping/cleaning
// functions are unit-tested here, same convention as the other providers.

Deno.test("cleanWpDescription: strips HTML tags and decodes common entities", () => {
  assertEquals(cleanWpDescription("<p>A tool &#8211; for doing things &amp; more.</p>"), "A tool - for doing things & more.");
});

Deno.test("cleanWpDescription: collapses whitespace produced by tag stripping", () => {
  assertEquals(cleanWpDescription("<strong>Bold</strong>   <em>text</em>"), "Bold text");
});

Deno.test("cleanWpDescription: returns null for null/empty input", () => {
  assertEquals(cleanWpDescription(null), null);
  assertEquals(cleanWpDescription(undefined), null);
  assertEquals(cleanWpDescription("   "), null);
});

Deno.test("mapPluginToCandidate: uses the declared homepage when present", () => {
  const candidate = mapPluginToCandidate({
    name: "Acme Forms",
    slug: "acme-forms",
    homepage: "https://acmeforms.com",
    short_description: "Build forms fast.",
    tags: { forms: "Forms", contact: "Contact" },
  });
  assertEquals(candidate?.name, "Acme Forms");
  assertEquals(candidate?.official_website, "https://acmeforms.com");
  assertEquals(candidate?.category_hint, "Forms");
  assertEquals(candidate?.tags_hint, ["Forms", "Contact"]);
});

Deno.test("mapPluginToCandidate: falls back to the wordpress.org directory listing when no homepage is set", () => {
  const candidate = mapPluginToCandidate({ name: "No Homepage Plugin", slug: "no-homepage-plugin" });
  assertEquals(candidate?.official_website, "https://wordpress.org/plugins/no-homepage-plugin/");
  assertEquals(candidate?.source_url, "https://wordpress.org/plugins/no-homepage-plugin/");
});

Deno.test("mapPluginToCandidate: returns null when slug or name is missing", () => {
  assertEquals(mapPluginToCandidate({ name: "x" }), null);
  assertEquals(mapPluginToCandidate({ slug: "x" }), null);
});
