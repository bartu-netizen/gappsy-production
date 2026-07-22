import { assertEquals } from "jsr:@std/assert@1";
import { packageNameFromTitle, parsePyPiRssFeed, pickHomepage } from "./pypiProvider.ts";

// fetchCandidates makes real network calls (RSS feed + per-package JSON
// lookups); only the pure parsing/mapping functions are unit-tested here.

// Matches the REAL "Newest Packages" feed's exact title format, verified
// against the live feed during Phase 7 testing ("code-analytics added to
// PyPI", not "package-name version" — that assumption was wrong in an
// earlier draft and caused every live candidate to fail its package-info
// lookup until this was caught and fixed).
const SAMPLE_FEED = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>PyPI newest packages</title>
    <item>
      <title>some-tool added to PyPI</title>
      <link>https://pypi.org/project/some-tool/</link>
      <description>A CLI &amp; library for doing things</description>
      <pubDate>Mon, 13 Jul 2026 12:00:00 GMT</pubDate>
    </item>
    <item>
      <title><![CDATA[cdata-tool added to PyPI]]></title>
      <link>https://pypi.org/project/cdata-tool/</link>
      <description><![CDATA[Uses CDATA <b>on purpose</b>]]></description>
      <pubDate>Mon, 13 Jul 2026 11:00:00 GMT</pubDate>
    </item>
  </channel>
</rss>`;

Deno.test("parsePyPiRssFeed: parses well-formed items, decoding entities", () => {
  const items = parsePyPiRssFeed(SAMPLE_FEED);
  assertEquals(items.length, 2);
  assertEquals(items[0].title, "some-tool added to PyPI");
  assertEquals(items[0].link, "https://pypi.org/project/some-tool/");
  assertEquals(items[0].description, "A CLI & library for doing things");
  assertEquals(items[0].pubDate, "Mon, 13 Jul 2026 12:00:00 GMT");
});

Deno.test("parsePyPiRssFeed: unwraps CDATA-wrapped fields", () => {
  const items = parsePyPiRssFeed(SAMPLE_FEED);
  assertEquals(items[1].title, "cdata-tool added to PyPI");
  assertEquals(items[1].description, "Uses CDATA <b>on purpose</b>");
});

Deno.test("parsePyPiRssFeed: empty/malformed input returns an empty array, never throws", () => {
  assertEquals(parsePyPiRssFeed(""), []);
  assertEquals(parsePyPiRssFeed("<rss><channel></channel></rss>"), []);
});

Deno.test("packageNameFromTitle: strips the ' added to PyPI' suffix (real feed format)", () => {
  assertEquals(packageNameFromTitle("code-analytics added to PyPI"), "code-analytics");
  assertEquals(packageNameFromTitle("some-tool added to PyPI"), "some-tool");
});

Deno.test("packageNameFromTitle: a title without the suffix is returned as-is rather than mangled", () => {
  assertEquals(packageNameFromTitle("just-a-name"), "just-a-name");
});

Deno.test("pickHomepage: prefers project_urls.Homepage over home_page", () => {
  const homepage = pickHomepage({ home_page: "https://old.example.com", project_urls: { Homepage: "https://new.example.com" } });
  assertEquals(homepage, "https://new.example.com");
});

Deno.test("pickHomepage: falls back to home_page when no project_urls match", () => {
  assertEquals(pickHomepage({ home_page: "https://example.com" }), "https://example.com");
});

Deno.test("pickHomepage: skips links that just point back to pypi.org/github.com", () => {
  assertEquals(pickHomepage({ home_page: "https://github.com/someone/repo", project_urls: { Homepage: "https://pypi.org/project/x/" } }), null);
});

Deno.test("pickHomepage: falls through to a non-conventional project_urls key if it's a distinct site", () => {
  const homepage = pickHomepage({ project_urls: { Documentation: "https://docs.example.com" } });
  assertEquals(homepage, "https://docs.example.com");
});

Deno.test("pickHomepage: returns null when info is missing or has no usable links", () => {
  assertEquals(pickHomepage(undefined), null);
  assertEquals(pickHomepage({}), null);
  assertEquals(pickHomepage({ home_page: "not a url" }), null);
});
