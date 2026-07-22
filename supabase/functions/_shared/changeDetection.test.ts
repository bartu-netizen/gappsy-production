import { assert, assertEquals } from "jsr:@std/assert@1";
import {
  classifyChange,
  computeSetDiff,
  decideRecrawl,
  extractStructuredSignal,
  normalizeContent,
  sha256Hex,
} from "./changeDetection.ts";

// fetchPageSafely makes real network calls (and reuses crawlUrlSafety.ts's
// DNS resolution); only the pure functions are unit-tested here.

Deno.test("normalizeContent: strips scripts, styles, comments and tags", () => {
  const html = `<html><head><style>.a{color:red}</style><script>track()</script></head><body><!-- hi --><h1>Hello World</h1></body></html>`;
  const normalized = normalizeContent(html);
  assertEquals(normalized.includes("track()"), false);
  assertEquals(normalized.includes("color:red"), false);
  assertEquals(normalized.includes("hi"), false);
  assertEquals(normalized.includes("hello world"), true);
});

Deno.test("normalizeContent: collapses whitespace and lowercases", () => {
  assertEquals(normalizeContent("<p>Hello    \n\n  World</p>"), "hello world");
});

Deno.test("normalizeContent: two pages differing only by rotating nonce/token hash identically", () => {
  const a = `<html><body><form nonce="abc123def4567890abc123def4567890">Pricing: $10</form></body></html>`;
  const b = `<html><body><form nonce="zzz999yyy8888888888zzz999yyy8888">Pricing: $10</form></body></html>`;
  assertEquals(normalizeContent(a), normalizeContent(b));
});

Deno.test("normalizeContent: copyright year rotating alone does not change the hash", () => {
  const a = `<footer>&copy; 2025 Example Inc. All rights reserved.</footer>`;
  const b = `<footer>&copy; 2026 Example Inc. All rights reserved.</footer>`;
  assertEquals(normalizeContent(a), normalizeContent(b));
});

Deno.test("normalizeContent: real content change still produces a different string", () => {
  const a = `<h1>Starting at $10/mo</h1>`;
  const b = `<h1>Starting at $25/mo</h1>`;
  assert(normalizeContent(a) !== normalizeContent(b));
});

Deno.test("sha256Hex: deterministic for identical input", async () => {
  const h1 = await sha256Hex("hello world");
  const h2 = await sha256Hex("hello world");
  assertEquals(h1, h2);
  assertEquals(h1.length, 64);
});

Deno.test("sha256Hex: different input produces a different hash", async () => {
  const h1 = await sha256Hex("hello world");
  const h2 = await sha256Hex("hello world!");
  assert(h1 !== h2);
});

Deno.test("sha256Hex: accepts raw bytes (for favicon fingerprinting)", async () => {
  const hash = await sha256Hex(new Uint8Array([1, 2, 3]));
  assertEquals(hash.length, 64);
});

Deno.test("extractStructuredSignal: homepage pulls title, meta description, headings", () => {
  const html = `<html><head><title>Acme</title><meta name="description" content="Acme does things"></head><body><h1>Welcome</h1><h2>Features</h2></body></html>`;
  const signal = extractStructuredSignal("homepage", html);
  assertEquals(signal.title, "Acme");
  assertEquals(signal.meta_description, "Acme does things");
  assertEquals(signal.headings, ["Welcome", "Features"]);
});

Deno.test("extractStructuredSignal: pricing extracts distinct prices and plan headings", () => {
  const html = `<h2>Starter</h2><p>$10/mo</p><h2>Pro</h2><p>$25/mo</p>`;
  const signal = extractStructuredSignal("pricing", html);
  assertEquals(signal.prices, ["$10", "$25"]);
  assertEquals(signal.plan_names, ["Starter", "Pro"]);
});

Deno.test("extractStructuredSignal: robots counts disallow/allow and collects sitemap refs", () => {
  const robots = "User-agent: *\nDisallow: /admin\nDisallow: /private\nAllow: /public\nSitemap: https://example.com/sitemap.xml";
  const signal = extractStructuredSignal("robots", robots);
  assertEquals(signal.disallow_count, 2);
  assertEquals(signal.allow_count, 1);
  assertEquals(signal.sitemap_refs, ["https://example.com/sitemap.xml"]);
});

Deno.test("extractStructuredSignal: sitemap counts <loc> entries", () => {
  const sitemap = `<urlset><url><loc>https://a.com/1</loc></url><url><loc>https://a.com/2</loc></url></urlset>`;
  assertEquals(extractStructuredSignal("sitemap", sitemap).url_count, 2);
});

Deno.test("extractStructuredSignal: favicon returns an empty structured signal (byte hash is the only signal)", () => {
  assertEquals(extractStructuredSignal("favicon", ""), {});
});

Deno.test("computeSetDiff: detects array additions and removals", () => {
  const diff = computeSetDiff({ headings: ["A", "B"] }, { headings: ["B", "C"] });
  assertEquals(diff.changedCount, 1);
  assertEquals(diff.changedKeys, ["headings"]);
  assertEquals(diff.added, ["C"]);
  assertEquals(diff.removed, ["A"]);
});

Deno.test("computeSetDiff: identical arrays produce no diff", () => {
  const diff = computeSetDiff({ headings: ["A", "B"] }, { headings: ["B", "A"] });
  assertEquals(diff.changedCount, 0);
});

Deno.test("computeSetDiff: scalar field change counts as one changed item", () => {
  const diff = computeSetDiff({ title: "Old" }, { title: "New" });
  assertEquals(diff.changedCount, 1);
  assertEquals(diff.changedKeys, ["title"]);
});

Deno.test("computeSetDiff: multiple changed fields each count separately", () => {
  const diff = computeSetDiff({ title: "Old", prices: ["$10"] }, { title: "New", prices: ["$10", "$20"] });
  assertEquals(diff.changedCount, 2);
});

Deno.test("classifyChange: fetch failure is unavailable regardless of anything else", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: false, contentHashChanged: true,
    previousExtracted: {}, currentExtracted: {}, minChangedItemsForCritical: 1,
  });
  assertEquals(result.severity, "unavailable");
});

Deno.test("classifyChange: first snapshot is no_change (establishes baseline, not a change)", () => {
  const result = classifyChange({
    isFirstSnapshot: true, fetchOk: true, contentHashChanged: true,
    previousExtracted: null, currentExtracted: { title: "X" }, minChangedItemsForCritical: 1,
  });
  assertEquals(result.severity, "no_change");
});

Deno.test("classifyChange: unchanged content hash is no_change", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: true, contentHashChanged: false,
    previousExtracted: { title: "X" }, currentExtracted: { title: "X" }, minChangedItemsForCritical: 1,
  });
  assertEquals(result.severity, "no_change");
});

Deno.test("classifyChange: hash changed but structured extract identical is minor (pure noise)", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: true, contentHashChanged: true,
    previousExtracted: { title: "X" }, currentExtracted: { title: "X" }, minChangedItemsForCritical: 1,
  });
  assertEquals(result.severity, "minor");
});

Deno.test("classifyChange: one changed structured field at threshold 1 is critical (e.g. pricing)", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: true, contentHashChanged: true,
    previousExtracted: { prices: ["$10"] }, currentExtracted: { prices: ["$25"] }, minChangedItemsForCritical: 1,
  });
  assertEquals(result.severity, "critical");
});

Deno.test("classifyChange: changed fields below threshold is meaningful, not critical", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: true, contentHashChanged: true,
    previousExtracted: { headings: ["A"] }, currentExtracted: { headings: ["A", "B"] }, minChangedItemsForCritical: 3,
  });
  assertEquals(result.severity, "meaningful");
});

Deno.test("classifyChange: changed fields at/above threshold is critical", () => {
  const result = classifyChange({
    isFirstSnapshot: false, fetchOk: true, contentHashChanged: true,
    previousExtracted: { headings: [], plan_names: [] }, currentExtracted: { headings: ["A", "B"], plan_names: ["C"] }, minChangedItemsForCritical: 2,
  });
  assertEquals(result.severity, "critical");
});

Deno.test("decideRecrawl: critical honors recrawl_on_critical", () => {
  assertEquals(decideRecrawl("critical", { recrawl_on_meaningful: false, recrawl_on_critical: true }), true);
  assertEquals(decideRecrawl("critical", { recrawl_on_meaningful: false, recrawl_on_critical: false }), false);
});

Deno.test("decideRecrawl: meaningful honors recrawl_on_meaningful", () => {
  assertEquals(decideRecrawl("meaningful", { recrawl_on_meaningful: true, recrawl_on_critical: false }), true);
  assertEquals(decideRecrawl("meaningful", { recrawl_on_meaningful: false, recrawl_on_critical: true }), false);
});

Deno.test("decideRecrawl: no_change, minor, and unavailable never trigger a recrawl", () => {
  const rules = { recrawl_on_meaningful: true, recrawl_on_critical: true };
  assertEquals(decideRecrawl("no_change", rules), false);
  assertEquals(decideRecrawl("minor", rules), false);
  assertEquals(decideRecrawl("unavailable", rules), false);
});
