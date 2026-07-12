// Regression test for a real bug caught in production verification: two
// unrelated GitHub-hosted projects (github.com/ownerA/projA vs
// github.com/ownerB/projB) were flagged as duplicates of each other purely
// because both normalize to the bare hostname "github.com". Only the pure,
// network-free helpers are tested here — validateWebsite makes live HTTP
// calls and is integration-level.
import { assertEquals } from "jsr:@std/assert@1";
import { isMultiTenantHost, normalizeFullUrl, normalizeHostname } from "./discoveryValidation.ts";

Deno.test("normalizeHostname strips www and lowercases", () => {
  assertEquals(normalizeHostname("https://WWW.Example.com/path"), "example.com");
  assertEquals(normalizeHostname("example.com"), "example.com");
  assertEquals(normalizeHostname("not a url"), null);
});

Deno.test("isMultiTenantHost recognizes known code-hosting/registry domains, case-insensitively", () => {
  assertEquals(isMultiTenantHost("github.com"), true);
  assertEquals(isMultiTenantHost("GitHub.com"), true);
  assertEquals(isMultiTenantHost("gitlab.com"), true);
  assertEquals(isMultiTenantHost("bitbucket.org"), true);
  assertEquals(isMultiTenantHost("sourceforge.net"), true);
  assertEquals(isMultiTenantHost("codeberg.org"), true);
  assertEquals(isMultiTenantHost("npmjs.com"), true);
  assertEquals(isMultiTenantHost("pypi.org"), true);
  assertEquals(isMultiTenantHost("example.com"), false);
  assertEquals(isMultiTenantHost("druid.apache.org"), false);
});

Deno.test("normalizeFullUrl keeps host+path distinct for two different repos on the same multi-tenant host", () => {
  const a = normalizeFullUrl("https://github.com/orangecoloured/analog");
  const b = normalizeFullUrl("https://github.com/jortilles/EDA");
  // The exact bug: both would collide if compared by hostname alone.
  assertEquals(normalizeHostname("https://github.com/orangecoloured/analog"), "github.com");
  assertEquals(normalizeHostname("https://github.com/jortilles/EDA"), "github.com");
  // But normalizeFullUrl must tell them apart.
  assertEquals(a === b, false);
  assertEquals(a, "github.com/orangecoloured/analog");
  assertEquals(b, "github.com/jortilles/eda");
});

Deno.test("normalizeFullUrl treats a genuinely repeated repo URL as identical regardless of trailing slash/case", () => {
  const a = normalizeFullUrl("https://github.com/sindresorhus/awesome");
  const b = normalizeFullUrl("https://github.com/Sindresorhus/Awesome/");
  assertEquals(a, b);
});

Deno.test("normalizeFullUrl returns null for an invalid URL", () => {
  assertEquals(normalizeFullUrl("not a url"), null);
});
