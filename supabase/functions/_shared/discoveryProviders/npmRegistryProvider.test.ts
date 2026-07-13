import { assertEquals } from "jsr:@std/assert@1";
import { formatNpmCursor, mapPackageToCandidate, parseNpmCursor } from "./npmRegistryProvider.ts";

// fetchCandidates makes real network calls; only the pure cursor/mapping
// functions are unit-tested here, same convention as the other providers.

Deno.test("mapPackageToCandidate: qualifies a package with a distinct homepage", () => {
  const candidate = mapPackageToCandidate({
    name: "some-cli",
    description: "A CLI tool.",
    keywords: ["cli", "tool"],
    links: { npm: "https://www.npmjs.com/package/some-cli", homepage: "https://some-cli.dev" },
  });
  assertEquals(candidate?.name, "some-cli");
  assertEquals(candidate?.official_website, "https://some-cli.dev");
  assertEquals(candidate?.short_description, "A CLI tool.");
  assertEquals(candidate?.category_hint, "cli");
});

Deno.test("mapPackageToCandidate: returns null when there is no homepage link", () => {
  assertEquals(mapPackageToCandidate({ name: "some-lib", links: { npm: "https://www.npmjs.com/package/some-lib" } }), null);
});

Deno.test("mapPackageToCandidate: returns null when homepage just points back to npm/github, not a distinct site", () => {
  assertEquals(mapPackageToCandidate({ name: "a", links: { homepage: "https://www.npmjs.com/package/a" } }), null);
  assertEquals(mapPackageToCandidate({ name: "b", links: { homepage: "https://github.com/someone/b" } }), null);
});

Deno.test("mapPackageToCandidate: returns null for a malformed homepage URL rather than throwing", () => {
  assertEquals(mapPackageToCandidate({ name: "c", links: { homepage: "not a url" } }), null);
});

Deno.test("mapPackageToCandidate: falls back to the npmjs.com package URL as source_url when links.npm is absent", () => {
  const candidate = mapPackageToCandidate({ name: "d", links: { homepage: "https://d.dev" } });
  assertEquals(candidate?.source_url, "https://www.npmjs.com/package/d");
});

Deno.test("parseNpmCursor: null cursor starts at query 0, offset 0", () => {
  assertEquals(parseNpmCursor(null, 3), { queryIndex: 0, offset: 0 });
});

Deno.test("parseNpmCursor: parses a well-formed cursor", () => {
  assertEquals(parseNpmCursor("2:40", 3), { queryIndex: 2, offset: 40 });
});

Deno.test("parseNpmCursor: falls back to the start for a malformed cursor", () => {
  assertEquals(parseNpmCursor("garbage", 3), { queryIndex: 0, offset: 0 });
  assertEquals(parseNpmCursor("", 3), { queryIndex: 0, offset: 0 });
});

Deno.test("parseNpmCursor: falls back to the start when the query index is out of range (config changed since the cursor was saved)", () => {
  assertEquals(parseNpmCursor("5:0", 3), { queryIndex: 0, offset: 0 });
});

Deno.test("formatNpmCursor round-trips through parseNpmCursor", () => {
  const formatted = formatNpmCursor(1, 60);
  assertEquals(formatted, "1:60");
  assertEquals(parseNpmCursor(formatted, 3), { queryIndex: 1, offset: 60 });
});
