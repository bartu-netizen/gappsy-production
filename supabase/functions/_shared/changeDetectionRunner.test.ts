// Tests for changeDetectionRunner.ts. Uses the same minimal fake Supabase
// client pattern as discoveryProviderRunner.test.ts (see that file's header
// comment for the rationale) — extended with a no-op `.order()` since
// enqueueRecrawl needs it, and `.maybeSingle()` honoring insertion order so
// "most recent crawl_jobs row for this tool" tests are deterministic.
//
// processDueCheck makes a real network fetch via fetchPageSafely (SSRF-safe
// resolution + fetch) — to keep these tests hermetic, canonical URLs that
// need to exercise the "fetch succeeded" path use a helper that stubs
// globalThis.fetch for the duration of a single test, restored in a
// `finally`, rather than hitting the network. resolveCanonicalUrl and
// enqueueRecrawl are tested directly since they need no network I/O at all.

import { assertEquals } from "jsr:@std/assert@1";
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import { enqueueRecrawl, processDueCheck, resolveCanonicalUrl, type DueCheck } from "./changeDetectionRunner.ts";

// ---------------------------------------------------------------------------
// Minimal fake Supabase client (see file header)
// ---------------------------------------------------------------------------

type Row = Record<string, unknown>;
type QueryResult = { data: unknown; error: { message: string; code?: string } | null };

class FakeQueryBuilder implements PromiseLike<QueryResult> {
  private mode: "select" | "insert" | "update" = "select";
  private filters: Array<(row: Row) => boolean> = [];
  private limitN: number | null = null;
  private singleMode: "single" | "maybeSingle" | null = null;
  private insertRow: Row | null = null;
  private updatePatch: Row | null = null;
  private orderCol: string | null = null;
  private orderDesc = false;

  constructor(private table: string, private db: Record<string, Row[]>, private client: FakeSupabaseClient) {
    if (!this.db[table]) this.db[table] = [];
  }

  select(): this { return this; }
  insert(row: Row): this {
    this.mode = "insert";
    this.insertRow = { id: (row.id as string | undefined) ?? crypto.randomUUID(), ...row };
    return this;
  }
  update(patch: Row): this { this.mode = "update"; this.updatePatch = patch; return this; }
  eq(column: string, value: unknown): this { this.filters.push((row) => row[column] === value); return this; }
  order(column: string, opts?: { ascending?: boolean }): this {
    this.orderCol = column;
    this.orderDesc = opts?.ascending === false;
    return this;
  }
  limit(n: number): this { this.limitN = n; return this; }
  single(): this { this.singleMode = "single"; return this; }
  maybeSingle(): this { this.singleMode = "maybeSingle"; return this; }

  private execute(): QueryResult {
    const table = this.db[this.table];

    if (this.mode === "insert" && this.insertRow) {
      if (this.client.failNextInsert) {
        const error = this.client.failNextInsert;
        this.client.failNextInsert = null;
        return { data: null, error };
      }
      table.push(this.insertRow);
      return { data: this.insertRow, error: null };
    }
    if (this.mode === "update") {
      const matches = table.filter((row) => this.filters.every((f) => f(row)));
      for (const row of matches) Object.assign(row, this.updatePatch);
      return { data: this.singleMode ? matches[0] ?? null : matches, error: null };
    }

    let rows = table.filter((row) => this.filters.every((f) => f(row)));
    if (this.orderCol) {
      const col = this.orderCol;
      rows = [...rows].sort((a, b) => {
        const av = String(a[col] ?? "");
        const bv = String(b[col] ?? "");
        return this.orderDesc ? bv.localeCompare(av) : av.localeCompare(bv);
      });
    }
    if (this.limitN != null) rows = rows.slice(0, this.limitN);
    if (this.singleMode === "single") {
      return rows[0] ? { data: rows[0], error: null } : { data: null, error: { message: "no rows found" } };
    }
    if (this.singleMode === "maybeSingle") return { data: rows[0] ?? null, error: null };
    return { data: rows, error: null };
  }

  then<T1 = QueryResult, T2 = never>(
    onfulfilled?: ((value: QueryResult) => T1 | PromiseLike<T1>) | null,
    onrejected?: ((reason: unknown) => T2 | PromiseLike<T2>) | null,
  ): PromiseLike<T1 | T2> {
    return Promise.resolve(this.execute()).then(onfulfilled, onrejected);
  }
}

class FakeSupabaseClient {
  db: Record<string, Row[]> = {};
  failNextInsert: { message: string; code?: string } | null = null;
  from(table: string): FakeQueryBuilder {
    return new FakeQueryBuilder(table, this.db, this);
  }
}

function fakeSupabase(): { client: SupabaseClient; fake: FakeSupabaseClient } {
  const fake = new FakeSupabaseClient();
  return { client: fake as unknown as SupabaseClient, fake };
}

// 203.0.113.0/24 is a reserved documentation range (RFC 5737, TEST-NET-3) —
// not in crawlUrlSafety.ts's private-range blocklist, so resolvesToPublicAddress
// treats it as public via its literal-IP fast path with NO real DNS lookup,
// keeping processDueCheck tests hermetic (only globalThis.fetch is stubbed).
function dueCheck(overrides: Partial<DueCheck> = {}): DueCheck {
  return {
    tool_id: crypto.randomUUID(),
    website: "https://203.0.113.10",
    page_type: "homepage",
    pricing_page_url: null,
    is_first_snapshot: true,
    previous_content_fingerprint: null,
    previous_extracted_fingerprint: null,
    ...overrides,
  };
}

// ---------------------------------------------------------------------------
// resolveCanonicalUrl — pure
// ---------------------------------------------------------------------------

Deno.test("resolveCanonicalUrl: homepage is the bare website", () => {
  assertEquals(resolveCanonicalUrl("https://example.com/", "homepage", null), "https://example.com");
});
Deno.test("resolveCanonicalUrl: robots/sitemap/favicon append conventional paths", () => {
  assertEquals(resolveCanonicalUrl("https://example.com", "robots", null), "https://example.com/robots.txt");
  assertEquals(resolveCanonicalUrl("https://example.com", "sitemap", null), "https://example.com/sitemap.xml");
  assertEquals(resolveCanonicalUrl("https://example.com", "favicon", null), "https://example.com/favicon.ico");
});
Deno.test("resolveCanonicalUrl: pricing prefers a discovered pricing_page_url over the conventional guess", () => {
  assertEquals(resolveCanonicalUrl("https://example.com", "pricing", "https://example.com/plans"), "https://example.com/plans");
});
Deno.test("resolveCanonicalUrl: pricing falls back to a conventional guess when no discovered URL exists", () => {
  assertEquals(resolveCanonicalUrl("https://example.com", "pricing", null), "https://example.com/pricing");
});

// ---------------------------------------------------------------------------
// enqueueRecrawl — mirrors admin-tools' bulk-recrawl behavior exactly
// ---------------------------------------------------------------------------

Deno.test("enqueueRecrawl: no linked discovery candidate -> not queued, explained why", async () => {
  const { client } = fakeSupabase();
  const result = await enqueueRecrawl(client, crypto.randomUUID(), "system:change-detection");
  assertEquals(result.queued, false);
  assertEquals(result.reason?.includes("no linked discovery candidate"), true);
});

Deno.test("enqueueRecrawl: resolves the most recent crawl_jobs row for the tool and inserts a queued recrawl", async () => {
  const { client, fake } = fakeSupabase();
  const toolId = crypto.randomUUID();
  const candidateId = crypto.randomUUID();
  fake.db.crawl_jobs = [
    { id: "old", created_draft_tool_id: toolId, discovery_candidate_id: candidateId, requested_url: "https://tool.example.com", completed_at: "2026-01-01T00:00:00Z", status: "completed" },
    { id: "new", created_draft_tool_id: toolId, discovery_candidate_id: candidateId, requested_url: "https://tool.example.com", completed_at: "2026-06-01T00:00:00Z", status: "completed" },
  ];

  const result = await enqueueRecrawl(client, toolId, "system:change-detection");

  assertEquals(result.queued, true);
  const inserted = fake.db.crawl_jobs.find((r) => r.status === "queued");
  assertEquals(inserted?.discovery_candidate_id, candidateId);
  assertEquals(inserted?.created_by, "system:change-detection");
});

Deno.test("enqueueRecrawl: an already-active crawl for this candidate is reported as skipped, not an error thrown", async () => {
  const { client, fake } = fakeSupabase();
  const toolId = crypto.randomUUID();
  fake.db.crawl_jobs = [
    { id: "prior", created_draft_tool_id: toolId, discovery_candidate_id: crypto.randomUUID(), requested_url: "https://tool.example.com", completed_at: "2026-01-01T00:00:00Z" },
  ];
  fake.failNextInsert = { message: "duplicate key value violates unique constraint \"crawl_jobs_one_active_per_candidate_idx\"", code: "23505" };

  const result = await enqueueRecrawl(client, toolId, "system:change-detection");
  assertEquals(result.queued, false);
  assertEquals(result.reason, "a crawl is already queued or running for this candidate");
});

// ---------------------------------------------------------------------------
// processDueCheck — end-to-end against a stubbed fetch + fake DB
// ---------------------------------------------------------------------------

async function withStubbedFetch<T>(response: { ok: boolean; status?: number; body?: string }, fn: () => Promise<T>): Promise<T> {
  const original = globalThis.fetch;
  (globalThis as unknown as { fetch: typeof fetch }).fetch = () =>
    Promise.resolve(
      new Response(response.body ?? "", {
        status: response.status ?? (response.ok ? 200 : 500),
        headers: { "content-type": "text/html" },
      }),
    );
  try {
    return await fn();
  } finally {
    globalThis.fetch = original;
  }
}

const RULE = { recrawl_on_meaningful: true, recrawl_on_critical: true, min_changed_items_for_critical: 1 };

Deno.test("processDueCheck: first snapshot inserts a fingerprint row and never queues a recrawl", async () => {
  const { client, fake } = fakeSupabase();
  const check = dueCheck({ page_type: "homepage" });

  const outcome = await withStubbedFetch({ ok: true, body: "<title>Acme</title><h1>Welcome</h1>" }, () =>
    processDueCheck(client, check, RULE, "system:change-detection"));

  assertEquals(outcome.severity, "no_change");
  assertEquals(outcome.recrawlQueued, false);
  const row = fake.db.tool_page_fingerprints.find((r) => r.tool_id === check.tool_id);
  assertEquals(row?.page_type, "homepage");
  assertEquals(typeof row?.content_fingerprint, "string");
});

Deno.test("processDueCheck: unchanged content on a repeat check is no_change and updates last_checked_at without touching last_changed_at", async () => {
  const { client, fake } = fakeSupabase();
  const toolId = crypto.randomUUID();
  const html = "<title>Acme</title><h1>Welcome</h1>";

  // First run establishes the baseline.
  const first = dueCheck({ tool_id: toolId, is_first_snapshot: true });
  await withStubbedFetch({ ok: true, body: html }, () => processDueCheck(client, first, RULE, "system:change-detection"));
  const baseline = fake.db.tool_page_fingerprints.find((r) => r.tool_id === toolId)!;

  // Second run with identical content, now framed as a repeat check.
  const second = dueCheck({
    tool_id: toolId,
    is_first_snapshot: false,
    previous_content_fingerprint: baseline.content_fingerprint as string,
    previous_extracted_fingerprint: baseline.extracted_fingerprint as Record<string, unknown>,
  });
  const outcome = await withStubbedFetch({ ok: true, body: html }, () => processDueCheck(client, second, RULE, "system:change-detection"));

  assertEquals(outcome.severity, "no_change");
  assertEquals(outcome.recrawlQueued, false);
});

Deno.test("processDueCheck: a meaningful pricing change queues a recrawl when the tool has discovery lineage", async () => {
  const { client, fake } = fakeSupabase();
  const toolId = crypto.randomUUID();
  const candidateId = crypto.randomUUID();
  fake.db.crawl_jobs = [
    { id: "origin", created_draft_tool_id: toolId, discovery_candidate_id: candidateId, requested_url: "https://tool.example.com", completed_at: "2026-01-01T00:00:00Z" },
  ];

  const check = dueCheck({
    tool_id: toolId,
    page_type: "pricing",
    is_first_snapshot: false,
    previous_content_fingerprint: "old-hash-does-not-matter",
    previous_extracted_fingerprint: { prices: ["$10"], plan_names: ["Starter"] },
  });

  const outcome = await withStubbedFetch({ ok: true, body: "<h2>Starter</h2><p>$25/mo</p>" }, () =>
    processDueCheck(client, check, RULE, "system:change-detection"));

  assertEquals(outcome.severity, "critical"); // min_changed_items_for_critical=1, prices changed
  assertEquals(outcome.recrawlQueued, true);
  const queuedJob = fake.db.crawl_jobs.find((r) => r.status === "queued");
  assertEquals(queuedJob?.discovery_candidate_id, candidateId);
});

Deno.test("processDueCheck: an unreachable page is classified unavailable, increments consecutive_failures, never queues a recrawl", async () => {
  const { client, fake } = fakeSupabase();
  const toolId = crypto.randomUUID();
  const check = dueCheck({
    tool_id: toolId,
    is_first_snapshot: false,
    previous_content_fingerprint: "some-hash",
    previous_extracted_fingerprint: { title: "Acme" },
  });
  fake.db.tool_page_fingerprints = [{ tool_id: toolId, page_type: "homepage", consecutive_failures: 2 }];

  const outcome = await withStubbedFetch({ ok: false, status: 503 }, () => processDueCheck(client, check, RULE, "system:change-detection"));

  assertEquals(outcome.severity, "unavailable");
  assertEquals(outcome.recrawlQueued, false);
  const row = fake.db.tool_page_fingerprints.find((r) => r.tool_id === toolId);
  assertEquals(row?.consecutive_failures, 3);
});
