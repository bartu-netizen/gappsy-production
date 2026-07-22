import { assertEquals } from "jsr:@std/assert@1";
import { formatVscodeCursor, mapExtensionToCandidate, parseVscodeCursor } from "./vscodeMarketplaceProvider.ts";

// fetchCandidates makes real network calls; only the pure cursor/mapping
// functions are unit-tested here, same convention as the other providers.

Deno.test("mapExtensionToCandidate: prefers a genuine homepage property when present", () => {
  const candidate = mapExtensionToCandidate({
    extensionName: "my-ext",
    displayName: "My Extension",
    shortDescription: "Does things.",
    publisher: { publisherName: "acme" },
    versions: [{ properties: [{ key: "Microsoft.VisualStudio.Services.Links.Homepage", value: "https://acme.dev/my-ext" }] }],
    tags: ["formatting"],
    categories: ["Formatters"],
  });
  assertEquals(candidate?.name, "My Extension");
  assertEquals(candidate?.official_website, "https://acme.dev/my-ext");
  assertEquals(candidate?.category_hint, "Formatters");
});

Deno.test("mapExtensionToCandidate: falls back to the marketplace listing page when no homepage property exists", () => {
  const candidate = mapExtensionToCandidate({
    extensionName: "no-homepage-ext",
    publisher: { publisherName: "acme" },
    versions: [{ properties: [] }],
  });
  assertEquals(candidate?.official_website, "https://marketplace.visualstudio.com/items?itemName=acme.no-homepage-ext");
});

Deno.test("mapExtensionToCandidate: returns null when publisher or extension name is missing", () => {
  assertEquals(mapExtensionToCandidate({ extensionName: "x" }), null);
  assertEquals(mapExtensionToCandidate({ publisher: { publisherName: "acme" } }), null);
});

Deno.test("mapExtensionToCandidate: uses extensionName as the display name when displayName is absent", () => {
  const candidate = mapExtensionToCandidate({ extensionName: "raw-name", publisher: { publisherName: "acme" } });
  assertEquals(candidate?.name, "raw-name");
});

Deno.test("parseVscodeCursor: null cursor starts at category 0, page 1", () => {
  assertEquals(parseVscodeCursor(null, 3), { categoryIndex: 0, pageNumber: 1 });
});

Deno.test("parseVscodeCursor/formatVscodeCursor round-trip", () => {
  const formatted = formatVscodeCursor(2, 5);
  assertEquals(formatted, "2:5");
  assertEquals(parseVscodeCursor(formatted, 3), { categoryIndex: 2, pageNumber: 5 });
});

Deno.test("parseVscodeCursor: falls back to the start for an out-of-range category index", () => {
  assertEquals(parseVscodeCursor("9:1", 3), { categoryIndex: 0, pageNumber: 1 });
});

Deno.test("parseVscodeCursor: falls back to the start for a malformed cursor", () => {
  assertEquals(parseVscodeCursor("nonsense", 3), { categoryIndex: 0, pageNumber: 1 });
});
