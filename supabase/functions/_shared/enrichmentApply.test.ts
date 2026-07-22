// Tests for the category/tag "no-op apply" fix: an approved
// category_suggestions/tag_suggestions suggestion that resolves to no new
// links must still be reported as resolved (changed: false + a clear
// no-op reason), never as an error, and must never duplicate an existing
// link. Run with: deno test supabase/functions/_shared/enrichmentApply.test.ts
import { assert, assertEquals } from "jsr:@std/assert@1";
import { resolveTaxonomySuggestion, type TaxonomyRow } from "./enrichmentApply.ts";

const TAXONOMY: TaxonomyRow[] = [
  { id: "cat-ai", slug: "ai", name: "AI" },
  { id: "cat-design", slug: "design", name: "Design" },
  { id: "cat-dev-tools", slug: "developer-tools", name: "Developer Tools" },
];

Deno.test("resolveTaxonomySuggestion — new value not yet linked: changed=true, merges without duplicating", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion("category_suggestions", ["ai"], TAXONOMY, ["cat-design"], skipped);

  assertEquals(result.changed, true);
  assertEquals(result.merged.sort(), ["cat-ai", "cat-design"].sort());
  assertEquals(skipped.length, 0);
});

Deno.test("resolveTaxonomySuggestion — all suggested values already linked: changed=false, no-op reason, no duplicates", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion("category_suggestions", ["ai", "AI"], TAXONOMY, ["cat-ai"], skipped);

  assertEquals(result.changed, false);
  assertEquals(result.merged, ["cat-ai"]); // no duplicate entries from the repeated "ai"/"AI" suggestion
  assert(result.noOpReason.includes("already linked"));
  assertEquals(skipped.length, 0);
});

Deno.test("resolveTaxonomySuggestion — empty suggestion list: changed=false, 'nothing to add' reason", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion("tag_suggestions", [], TAXONOMY, ["cat-design"], skipped);

  assertEquals(result.changed, false);
  assertEquals(result.merged, ["cat-design"]);
  assert(result.noOpReason.includes("nothing to add"));
  assertEquals(skipped.length, 0);
});

Deno.test("resolveTaxonomySuggestion — every suggestion invalid: changed=false, per-item skip reasons recorded, distinct no-op reason", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion("tag_suggestions", ["not-a-real-tag"], TAXONOMY, [], skipped);

  assertEquals(result.changed, false);
  assertEquals(result.merged, []);
  assert(result.noOpReason.includes("could be matched"));
  assertEquals(skipped.length, 1);
  assertEquals(skipped[0].field_key, "tag_suggestions");
  assert(skipped[0].reason.includes("not-a-real-tag"));
});

Deno.test("resolveTaxonomySuggestion — mix of new, already-linked, and invalid: changed=true, invalid one recorded, no duplicates", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion(
    "category_suggestions",
    ["design", "developer-tools", "bogus-category"],
    TAXONOMY,
    ["cat-design"],
    skipped,
  );

  assertEquals(result.changed, true);
  assertEquals(result.merged.sort(), ["cat-design", "cat-dev-tools"].sort());
  assertEquals(skipped.length, 1);
  assert(skipped[0].reason.includes("bogus-category"));
});

Deno.test("resolveTaxonomySuggestion — matches by raw id as well as slug/name", () => {
  const skipped: { field_key: string; reason: string }[] = [];
  const result = resolveTaxonomySuggestion("category_suggestions", ["cat-dev-tools"], TAXONOMY, [], skipped);

  assertEquals(result.changed, true);
  assertEquals(result.merged, ["cat-dev-tools"]);
  assertEquals(skipped.length, 0);
});
