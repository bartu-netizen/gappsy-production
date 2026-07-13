// Tests for discoveryProviderRunner.ts.
//
// Mocking-vs-pure-function tradeoff: runProvider's DB touchpoints go through
// discoveryIngest.ts's normalizeCandidate/uniqueSlug/findDuplicate/ingestOne
// (owned elsewhere, not reimplemented here) as well as the runner's own
// discovery_provider_runs / discovery_providers writes. A real Supabase
// query builder is thenable at any point in its chain (you can `await` right
// after `.eq()` without ever calling `.single()`), so a faithful-enough fake
// needs the same shape rather than a handful of jest-style mock functions.
// FakeQueryBuilder below implements exactly the chain surface actually
// exercised by this file + discoveryIngest.ts (select/insert/update, eq,
// ilike, limit, single, maybeSingle, and `.then()`), backed by a plain
// in-memory array per table. That was enough to drive runProvider
// end-to-end for real (not just smoke-tested) against a controllable fake
// DiscoveryProvider, so the heavier mock route was worth it over only
// testing the extracted pure function.
//
// One real wrinkle: discoveryIngest.ts's ingestOne calls
// discoveryValidation.ts's validateWebsite(), which does real network
// fetches for reachable hosts. To keep these tests hermetic and fast, test
// candidates use blocked/local hostnames (e.g. "https://localhost") —
// isBlockedHostname() makes validateWebsite() return immediately with a
// deterministic "cannot be checked" result and no network I/O, while still
// exercising the real validation/scoring/insert code path.
//
// summarizeRunOutcome (the pure status/counter decision function) is also
// unit-tested directly and thoroughly, since it's the part of this file
// with the most branching to get right.

import { assertEquals, assertMatch } from "https://deno.land/std@0.224.0/assert/mod.ts";
import type { SupabaseClient } from "npm:@supabase/supabase-js@2.57.4";
import type { DiscoveryProvider, FetchResult, RawDiscoveryCandidate } from "./discoveryProviders/types.ts";
import { ProviderConfigError, ProviderNotImplementedError } from "./discoveryProviders/types.ts";
import { decideCursorUpdate, runProvider, summarizeRunOutcome, type DiscoveryProviderRow } from "./discoveryProviderRunner.ts";

// ---------------------------------------------------------------------------
// Minimal fake Supabase client — see file-header comment for rationale.
// ---------------------------------------------------------------------------

type Row = Record<string, unknown>;
type QueryResult = { data: unknown; error: { message: string } | null };

class FakeQueryBuilder implements PromiseLike<QueryResult> {
  private mode: "select" | "insert" | "update" = "select";
  private filters: Array<(row: Row) => boolean> = [];
  private limitN: number | null = null;
  private singleMode: "single" | "maybeSingle" | null = null;
  private insertRow: Row | null = null;
  private updatePatch: Row | null = null;

  constructor(private table: string, private db: Record<string, Row[]>) {
    if (!this.db[table]) this.db[table] = [];
  }

  // Column list is irrelevant to this in-memory fake — every fake row
  // already carries every field callers might select.
  select(): this {
    return this;
  }

  insert(row: Row): this {
    this.mode = "insert";
    this.insertRow = { id: (row.id as string | undefined) ?? crypto.randomUUID(), ...row };
    return this;
  }

  update(patch: Row): this {
    this.mode = "update";
    this.updatePatch = patch;
    return this;
  }

  eq(column: string, value: unknown): this {
    this.filters.push((row) => row[column] === value);
    return this;
  }

  ilike(column: string, pattern: string): this {
    const needle = String(pattern).replace(/%/g, "").toLowerCase();
    this.filters.push((row) => {
      const value = row[column];
      return typeof value === "string" && value.toLowerCase().includes(needle);
    });
    return this;
  }

  limit(n: number): this {
    this.limitN = n;
    return this;
  }

  single(): this {
    this.singleMode = "single";
    return this;
  }

  maybeSingle(): this {
    this.singleMode = "maybeSingle";
    return this;
  }

  private execute(): QueryResult {
    const table = this.db[this.table];

    if (this.mode === "insert" && this.insertRow) {
      table.push(this.insertRow);
      return { data: this.insertRow, error: null };
    }

    if (this.mode === "update") {
      const matches = table.filter((row) => this.filters.every((f) => f(row)));
      for (const row of matches) Object.assign(row, this.updatePatch);
      return { data: this.singleMode ? matches[0] ?? null : matches, error: null };
    }

    let rows = table.filter((row) => this.filters.every((f) => f(row)));
    if (this.limitN != null) rows = rows.slice(0, this.limitN);
    if (this.singleMode === "single") {
      return rows[0] ? { data: rows[0], error: null } : { data: null, error: { message: "no rows found" } };
    }
    if (this.singleMode === "maybeSingle") {
      return { data: rows[0] ?? null, error: null };
    }
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
  from(table: string): FakeQueryBuilder {
    return new FakeQueryBuilder(table, this.db);
  }
}

function fakeSupabase(): SupabaseClient {
  return new FakeSupabaseClient() as unknown as SupabaseClient;
}

function makeProviderRow(overrides: Partial<DiscoveryProviderRow> = {}): DiscoveryProviderRow {
  return {
    id: crypto.randomUUID(),
    key: "test-provider",
    config: {},
    rate_limit_per_run: 50,
    last_cursor: null,
    ...overrides,
  };
}

function candidate(overrides: Partial<RawDiscoveryCandidate> = {}): RawDiscoveryCandidate {
  return {
    name: "Test Tool",
    official_website: "https://localhost", // blocked hostname -> no real network I/O
    ...overrides,
  };
}

// ---------------------------------------------------------------------------
// summarizeRunOutcome — pure function, thoroughly tested
// ---------------------------------------------------------------------------

Deno.test("summarizeRunOutcome: zero candidates, no warnings -> completed", () => {
  const result = summarizeRunOutcome(0, [], []);
  assertEquals(result, {
    status: "completed",
    candidates_created: 0,
    candidates_duplicate: 0,
    candidates_rejected: 0,
  });
});

Deno.test("summarizeRunOutcome: all created, no rejections/warnings -> completed", () => {
  const result = summarizeRunOutcome(2, [{ status: "created" }, { status: "created" }], []);
  assertEquals(result.status, "completed");
  assertEquals(result.candidates_created, 2);
  assertEquals(result.candidates_rejected, 0);
});

Deno.test("summarizeRunOutcome: duplicate is a sub-count of created, not additive", () => {
  const result = summarizeRunOutcome(1, [{ status: "duplicate" }], []);
  assertEquals(result.candidates_created, 1);
  assertEquals(result.candidates_duplicate, 1);
  assertEquals(result.status, "completed");
});

Deno.test("summarizeRunOutcome: any rejection -> partial, even alongside successes", () => {
  const result = summarizeRunOutcome(3, [{ status: "created" }, { status: "rejected" }, { status: "duplicate" }], []);
  assertEquals(result.status, "partial");
  assertEquals(result.candidates_created, 2);
  assertEquals(result.candidates_duplicate, 1);
  assertEquals(result.candidates_rejected, 1);
});

Deno.test("summarizeRunOutcome: total wipeout (all rejected) is partial, never failed", () => {
  const result = summarizeRunOutcome(2, [{ status: "rejected" }, { status: "rejected" }], []);
  assertEquals(result.status, "partial");
  assertEquals(result.candidates_created, 0);
  assertEquals(result.candidates_rejected, 2);
});

Deno.test("summarizeRunOutcome: fetch-level warnings alone force partial", () => {
  const result = summarizeRunOutcome(1, [{ status: "created" }], ["upstream returned a stale page"]);
  assertEquals(result.status, "partial");
  assertEquals(result.candidates_created, 1);
  assertEquals(result.candidates_rejected, 0);
});

// ---------------------------------------------------------------------------
// decideCursorUpdate — pure function, the exact "don't advance on hard
// failure" decision Phase 1 of the Discovery scale work needs to be right.
// ---------------------------------------------------------------------------

Deno.test("decideCursorUpdate: failed run never advances, regardless of cursorOut", () => {
  assertEquals(decideCursorUpdate("failed", "some-cursor"), { shouldUpdate: false, value: null });
  assertEquals(decideCursorUpdate("failed", null), { shouldUpdate: false, value: null });
});

Deno.test("decideCursorUpdate: completed run advances to the new cursor value", () => {
  assertEquals(decideCursorUpdate("completed", "cursor-123"), { shouldUpdate: true, value: "cursor-123" });
});

Deno.test("decideCursorUpdate: partial run still advances (partial means ingest-level rejections, not a fetch failure)", () => {
  assertEquals(decideCursorUpdate("partial", "cursor-456"), { shouldUpdate: true, value: "cursor-456" });
});

Deno.test("decideCursorUpdate: a provider with no cursor concept advancing to null is a valid, idempotent update", () => {
  assertEquals(decideCursorUpdate("completed", null), { shouldUpdate: true, value: null });
});

// ---------------------------------------------------------------------------
// runProvider — end-to-end against the fake Supabase client
// ---------------------------------------------------------------------------

function makeProvider(fetchCandidates: DiscoveryProvider["fetchCandidates"]): DiscoveryProvider {
  return {
    key: "test-provider",
    name: "Test Provider",
    description: "A fake provider for tests.",
    implemented: true,
    defaultPriority: 0,
    defaultRateLimitPerRun: 50,
    defaultScheduleFrequency: "manual",
    fetchCandidates,
  };
}

Deno.test("runProvider: happy path with 3 valid candidates -> completed, run + provider rows updated", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow();
  // Seed the discovery_providers row runProvider updates in place (an
  // UPDATE only mutates existing rows — it never inserts one).
  (supabase as unknown as FakeSupabaseClient).db.discovery_providers = [{ id: providerRow.id, key: providerRow.key }];
  const provider = makeProvider(() =>
    Promise.resolve<FetchResult>({
      candidates: [candidate({ name: "Tool One" }), candidate({ name: "Tool Two" }), candidate({ name: "Tool Three" })],
      rate_limit_remaining: 47,
      cursor_out: "cursor-abc",
    })
  );

  const summary = await runProvider(supabase, provider, providerRow, "manual", "bartu@gappsy.com");

  assertEquals(summary.status, "completed");
  assertEquals(summary.candidates_found, 3);
  assertEquals(summary.candidates_created, 3);
  assertEquals(summary.candidates_rejected, 0);
  assertEquals(summary.error_message, null);
  assertEquals(summary.cursor_out, "cursor-abc");
  assertEquals(summary.rate_limit_remaining, 47);

  const db = (supabase as unknown as FakeSupabaseClient).db;
  assertEquals(db.discovered_tools.length, 3);

  const runRow = db.discovery_provider_runs.find((r) => r.id === summary.run_id);
  assertEquals(runRow?.status, "completed");
  assertEquals(runRow?.candidates_created, 3);
  assertEquals(runRow?.completed_at !== undefined && runRow?.completed_at !== null, true);

  const providerRowAfter = db.discovery_providers.find((r) => r.id === providerRow.id);
  assertEquals(providerRowAfter?.last_run_status, "completed");
});

Deno.test("runProvider: fetchCandidates throws ProviderConfigError -> failed, never throws out", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow();
  (supabase as unknown as FakeSupabaseClient).db.discovery_providers = [{ id: providerRow.id, key: providerRow.key }];
  const provider = makeProvider(() => {
    throw new ProviderConfigError("test-provider", "missing API key");
  });

  const summary = await runProvider(supabase, provider, providerRow, "manual", null);

  assertEquals(summary.status, "failed");
  assertEquals(summary.candidates_found, 0);
  assertMatch(summary.error_message ?? "", /missing API key/);

  const db = (supabase as unknown as FakeSupabaseClient).db;
  const runRow = db.discovery_provider_runs.find((r) => r.id === summary.run_id);
  assertEquals(runRow?.status, "failed");
  assertEquals(runRow?.error_code, "ProviderConfigError");

  const providerRowAfter = db.discovery_providers.find((r) => r.id === providerRow.id);
  assertEquals(providerRowAfter?.last_run_status, "failed");
});

Deno.test("runProvider: fetchCandidates throws ProviderNotImplementedError -> failed with matching error_code", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow();
  const provider = makeProvider(() => {
    throw new ProviderNotImplementedError("test-provider");
  });

  const summary = await runProvider(supabase, provider, providerRow, "scheduled", null);

  assertEquals(summary.status, "failed");
  const db = (supabase as unknown as FakeSupabaseClient).db;
  const runRow = db.discovery_provider_runs.find((r) => r.id === summary.run_id);
  assertEquals(runRow?.error_code, "ProviderNotImplementedError");
});

Deno.test("runProvider: candidate missing official_website is rejected without aborting the batch", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow();
  const provider = makeProvider(() =>
    Promise.resolve<FetchResult>({
      candidates: [
        candidate({ name: "Good Tool" }),
        { name: "Bad Tool", official_website: "" }, // normalizeCandidate rejects this
      ],
    })
  );

  const summary = await runProvider(supabase, provider, providerRow, "manual", null);

  assertEquals(summary.status, "partial");
  assertEquals(summary.candidates_found, 2);
  assertEquals(summary.candidates_created, 1);
  assertEquals(summary.candidates_rejected, 1);
  assertEquals(summary.warnings.some((w) => w.includes("Bad Tool") && w.includes("official_website")), true);

  const db = (supabase as unknown as FakeSupabaseClient).db;
  assertEquals(db.discovered_tools.length, 1);
});

Deno.test("runProvider: fetch succeeds with zero candidates -> completed, not failed", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow();
  const provider = makeProvider(() => Promise.resolve<FetchResult>({ candidates: [] }));

  const summary = await runProvider(supabase, provider, providerRow, "manual", null);

  assertEquals(summary.status, "completed");
  assertEquals(summary.candidates_found, 0);
  assertEquals(summary.candidates_created, 0);
});

Deno.test("runProvider: passes providerRow.last_cursor through as cursorIn, and persists cursor_out on success (Product Hunt pagination contract)", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow({ last_cursor: "endCursor-page-1" });
  (supabase as unknown as FakeSupabaseClient).db.discovery_providers = [{ id: providerRow.id, key: providerRow.key }];

  let receivedCursorIn: string | null = "not-called";
  const provider = makeProvider((_config, cursorIn) => {
    receivedCursorIn = cursorIn;
    return Promise.resolve<FetchResult>({
      candidates: [candidate({ name: "Page 2 Tool" })],
      cursor_out: "endCursor-page-2", // mirrors Product Hunt's pageInfo.endCursor
    });
  });

  const summary = await runProvider(supabase, provider, providerRow, "scheduled", null);

  assertEquals(receivedCursorIn, "endCursor-page-1");
  assertEquals(summary.cursor_out, "endCursor-page-2");

  const db = (supabase as unknown as FakeSupabaseClient).db;
  const providerRowAfter = db.discovery_providers.find((r) => r.id === providerRow.id);
  assertEquals(providerRowAfter?.last_cursor, "endCursor-page-2");
  assertEquals(typeof providerRowAfter?.cursor_updated_at, "string");
});

Deno.test("runProvider: a failed run leaves the previously-persisted cursor untouched (never regresses/clears on failure)", async () => {
  const supabase = fakeSupabase();
  const providerRow = makeProviderRow({ last_cursor: "endCursor-page-5" });
  // Simulate the DB already holding a previously-advanced cursor.
  (supabase as unknown as FakeSupabaseClient).db.discovery_providers = [
    { id: providerRow.id, key: providerRow.key, last_cursor: "endCursor-page-5" },
  ];
  const provider = makeProvider(() => {
    throw new Error("upstream API is down");
  });

  await runProvider(supabase, provider, providerRow, "scheduled", null);

  const db = (supabase as unknown as FakeSupabaseClient).db;
  const providerRowAfter = db.discovery_providers.find((r) => r.id === providerRow.id);
  // The failure-path update only sets last_run_at/last_run_status/updated_at
  // — no cursor keys at all, so the field the fake DB already held survives.
  assertEquals(providerRowAfter?.last_cursor, "endCursor-page-5");
});

Deno.test("runProvider: duplicate candidate is counted as both created and duplicate", async () => {
  const supabase = fakeSupabase();
  const db = (supabase as unknown as FakeSupabaseClient).db;
  db.discovered_tools = [{ id: crypto.randomUUID(), slug: "test-tool", hostname: "localhost" }];

  const providerRow = makeProviderRow();
  const provider = makeProvider(() =>
    Promise.resolve<FetchResult>({ candidates: [candidate({ name: "Test Tool" })] })
  );

  const summary = await runProvider(supabase, provider, providerRow, "manual", "bartu@gappsy.com");

  assertEquals(summary.status, "completed"); // duplicate is still a successful ingest, not a rejection
  assertEquals(summary.candidates_created, 1);
  assertEquals(summary.candidates_duplicate, 1);
  assertEquals(summary.candidates_rejected, 0);
});
