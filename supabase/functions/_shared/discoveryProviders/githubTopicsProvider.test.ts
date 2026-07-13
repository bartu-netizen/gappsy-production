import { assertEquals } from "jsr:@std/assert@1";
import { formatGithubTopicsCursor, mapRepoToCandidate, parseGithubTopicsCursor } from "./githubTopicsProvider.ts";

// fetchCandidates makes real network calls; only the pure cursor/mapping
// functions are unit-tested here, same convention as the other providers.

Deno.test("mapRepoToCandidate: prefers the repo's declared homepage", () => {
  const candidate = mapRepoToCandidate({
    name: "acme-tool", full_name: "acme/acme-tool", html_url: "https://github.com/acme/acme-tool",
    homepage: "https://acmetool.dev", description: "A tool.", topics: ["cli", "devtools"],
  });
  assertEquals(candidate?.name, "acme-tool");
  assertEquals(candidate?.official_website, "https://acmetool.dev");
  assertEquals(candidate?.source_url, "https://github.com/acme/acme-tool");
  assertEquals(candidate?.category_hint, "cli");
});

Deno.test("mapRepoToCandidate: falls back to the repo page when there is no homepage", () => {
  const candidate = mapRepoToCandidate({ name: "x", full_name: "acme/x", html_url: "https://github.com/acme/x" });
  assertEquals(candidate?.official_website, "https://github.com/acme/x");
});

Deno.test("mapRepoToCandidate: returns null when full_name or html_url is missing", () => {
  assertEquals(mapRepoToCandidate({ name: "x" }), null);
  assertEquals(mapRepoToCandidate({ full_name: "acme/x" }), null);
});

Deno.test("parseGithubTopicsCursor/formatGithubTopicsCursor round-trip", () => {
  const formatted = formatGithubTopicsCursor(1, 3);
  assertEquals(formatted, "1:3");
  assertEquals(parseGithubTopicsCursor(formatted, 3), { topicIndex: 1, page: 3 });
});

Deno.test("parseGithubTopicsCursor: null/malformed/out-of-range cursor falls back to the start", () => {
  assertEquals(parseGithubTopicsCursor(null, 3), { topicIndex: 0, page: 1 });
  assertEquals(parseGithubTopicsCursor("garbage", 3), { topicIndex: 0, page: 1 });
  assertEquals(parseGithubTopicsCursor("9:1", 3), { topicIndex: 0, page: 1 });
});
