// Tests drainCrawlQueue's loop-termination and job-claiming logic with a
// minimal in-memory fake Supabase client — no real network/DB. The heavier
// executeCrawlJob/runAutomaticCrawlPipeline paths (real gateway HTTP calls,
// real admin-tools calls) are integration-level and verified live in
// production instead (see the pipeline verification step).
//
// Claiming itself goes through the claim_crawl_jobs() Postgres RPC (see
// 20260713140000/20260713150000 — atomic FOR UPDATE SKIP LOCKED claiming,
// one row per call, capacity-aware), not a plain crawl_jobs select/update
// chain. The fake client's rpc() below reimplements just enough of that
// RPC's real SQL semantics (one queued row per call, ordered by
// created_at, respecting a single active-job cap) to drive drainCrawlQueue
// end-to-end deterministically, without a real Postgres connection.

// deno-lint-ignore-file no-explicit-any
/* eslint-disable @typescript-eslint/no-explicit-any -- untyped fake Supabase query-builder chain */
import { assertEquals } from "jsr:@std/assert@1";
import { drainCrawlQueue } from "./crawlRunner.ts";

interface FakeCrawlJob {
  id: string;
  discovery_candidate_id: string;
  requested_url: string;
  status: string;
  started_at: string;
  created_at: string;
  normalized_extraction: unknown;
  completed_at: string | null;
}

// A tiny stand-in for the Supabase query builder covering only the chain
// shapes drainCrawlQueue/executeCrawlJob actually use: select/eq/in/order/
// limit/maybeSingle/update, resolved against an in-memory `crawl_jobs`
// table. Any candidate whose requested_url starts with "https://localhost"
// is rejected by the REAL isBlockedHostname() check inside
// executeCrawlJob's validateCrawlUrl call before any network fetch happens
// — deterministic and hermetic, same trick used in discoveryProviderRunner's
// tests.
// Matches crawl_settings.max_concurrent_crawls' real production default
// (20260713140000) — the fake RPC below enforces this same cap so
// capacity-limit tests reflect the actual configured default, not the
// old pre-bottleneck-#1 hardcoded MAX_ACTIVE_JOBS=1.
const FAKE_MAX_CONCURRENT_CRAWLS = 2;
const IN_FLIGHT_STATUSES = ["starting", "crawling", "extracting"];

function makeFakeClient(jobs: FakeCrawlJob[]) {
  const table = { crawl_jobs: jobs };

  function crawlJobsBuilder() {
    let rows = [...table.crawl_jobs];
    const filters: Array<(r: FakeCrawlJob) => boolean> = [];
    let orderKey: string | null = null;
    let ascending = true;
    let limitN: number | null = null;
    let updatePayload: Partial<FakeCrawlJob> | null = null;
    let expectedStatusForUpdate: string | null = null;
    let countHead = false;

    const builder: any = {
      select(_cols: string, opts?: { count?: string; head?: boolean }) {
        if (opts?.head) countHead = true;
        return builder;
      },
      eq(key: string, value: unknown) {
        if (updatePayload && key === "status") expectedStatusForUpdate = value as string;
        filters.push((r: any) => r[key] === value);
        return builder;
      },
      in(key: string, values: unknown[]) {
        filters.push((r: any) => values.includes((r as any)[key]));
        return builder;
      },
      order(key: string, opts?: { ascending?: boolean }) {
        orderKey = key;
        ascending = opts?.ascending !== false;
        return builder;
      },
      limit(n: number) {
        limitN = n;
        return builder;
      },
      update(payload: Partial<FakeCrawlJob>) {
        updatePayload = payload;
        return builder;
      },
      async maybeSingle() {
        rows = table.crawl_jobs.filter((r) => filters.every((f) => f(r)));
        if (orderKey) {
          rows.sort((a: any, b: any) => (a[orderKey!] > b[orderKey!] ? 1 : -1) * (ascending ? 1 : -1));
        }
        if (limitN) rows = rows.slice(0, limitN);
        const match = rows[0];
        if (updatePayload) {
          if (!match) return { data: null, error: null };
          if (expectedStatusForUpdate && match.status !== expectedStatusForUpdate) return { data: null, error: null }; // lost the claim race
          Object.assign(match, updatePayload);
          return { data: { ...match }, error: null };
        }
        return { data: match || null, error: null };
      },
      // Simplified for test purposes: real Supabase errors on 0/>1 rows,
      // this fake just behaves like maybeSingle (sufficient for these
      // fixtures, which always target exactly one row by id).
      single() {
        return builder.maybeSingle();
      },
      async then(resolve: (v: any) => void) {
        // count-only head query path used by the active-jobs check.
        rows = table.crawl_jobs.filter((r) => filters.every((f) => f(r)));
        resolve({ data: countHead ? null : rows, error: null, count: rows.length });
      },
    };
    return builder;
  }

  return {
    from(tableName: string) {
      if (tableName === "crawl_jobs") return crawlJobsBuilder();
      throw new Error(`FakeClient: unexpected table ${tableName}`);
    },
    // Reimplements just enough of claim_crawl_jobs()'s real SQL semantics
    // (see 20260713150000): claims at most ONE queued row per call,
    // ordered oldest-first, only while under FAKE_MAX_CONCURRENT_CRAWLS
    // in-flight jobs — matching the real RPC now claiming exactly one row
    // per call so N independent worker loops each get their own job
    // rather than one loop grabbing every free slot.
    rpc(name: string, params: Record<string, unknown>) {
      if (name === "claim_crawl_jobs") {
        return {
          then(resolve: (v: any) => void) {
            const activeCount = table.crawl_jobs.filter((j) => IN_FLIGHT_STATUSES.includes(j.status)).length;
            if (activeCount >= FAKE_MAX_CONCURRENT_CRAWLS) {
              resolve({ data: [], error: null });
              return;
            }
            const queued = table.crawl_jobs
              .filter((j) => j.status === "queued")
              .sort((a, b) => (a.created_at > b.created_at ? 1 : -1));
            if (queued.length === 0) {
              resolve({ data: [], error: null });
              return;
            }
            const claimed = queued[0] as any;
            claimed.status = "starting";
            claimed.worker_id = params.p_worker_id;
            resolve({ data: [{ ...claimed }], error: null });
          },
        };
      }
      if (name === "heartbeat_crawl_job") {
        return { then(resolve: (v: any) => void) { resolve({ data: [], error: null }); } };
      }
      throw new Error(`FakeClient: unexpected rpc ${name}`);
    },
  };
}

Deno.test("drainCrawlQueue stops immediately when there are no queued jobs", async () => {
  const client = makeFakeClient([]);
  const summary = await drainCrawlQueue(client as any, "https://supabase.example", "anon-key");
  assertEquals(summary.processed, 0);
  assertEquals(summary.results, []);
});

Deno.test("drainCrawlQueue does not process a job when the active-job limit is already reached", async () => {
  const jobs: FakeCrawlJob[] = [
    // Two already-active jobs = FAKE_MAX_CONCURRENT_CRAWLS (matching the
    // real crawl_settings.max_concurrent_crawls default of 2) — no
    // capacity left for the queued job below.
    { id: "active-1", discovery_candidate_id: "c1", requested_url: "https://real-site.example", status: "crawling", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:00Z", normalized_extraction: null, completed_at: null },
    { id: "active-2", discovery_candidate_id: "c2", requested_url: "https://real-site.example", status: "starting", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:00Z", normalized_extraction: null, completed_at: null },
    { id: "queued-1", discovery_candidate_id: "c3", requested_url: "https://real-site.example", status: "queued", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:01Z", normalized_extraction: null, completed_at: null },
  ];
  const client = makeFakeClient(jobs);
  const summary = await drainCrawlQueue(client as any, "https://supabase.example", "anon-key");
  assertEquals(summary.processed, 0);
  // The queued job must be left untouched — still queued, not claimed.
  assertEquals(jobs.find((j) => j.id === "queued-1")?.status, "queued");
});

Deno.test("drainCrawlQueue claims a queued job (queued -> starting) before attempting to run it, even if the run itself fails validation", async () => {
  const jobs: FakeCrawlJob[] = [
    { id: "queued-1", discovery_candidate_id: "c1", requested_url: "not a valid url", status: "queued", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:00Z", normalized_extraction: null, completed_at: null },
  ];
  const client = makeFakeClient(jobs);
  const summary = await drainCrawlQueue(client as any, "https://supabase.example", "anon-key");
  assertEquals(summary.processed, 1);
  assertEquals(summary.results[0].job_id, "queued-1");
  // Invalid URL -> executeCrawlJob's own validateCrawlUrl fails it -> status 'failed', not left at 'starting'.
  assertEquals(jobs[0].status, "failed");
  assertEquals(summary.results[0].result.crawl.ok, false);
  assertEquals(summary.results[0].result.enrichment_enqueued, false);
});

Deno.test("drainCrawlQueue processes multiple queued jobs sequentially until the queue is empty", async () => {
  const jobs: FakeCrawlJob[] = [
    { id: "queued-1", discovery_candidate_id: "c1", requested_url: "not a valid url", status: "queued", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:00Z", normalized_extraction: null, completed_at: null },
    { id: "queued-2", discovery_candidate_id: "c2", requested_url: "also not valid", status: "queued", started_at: "2026-01-01T00:00:00Z", created_at: "2026-01-01T00:00:01Z", normalized_extraction: null, completed_at: null },
  ];
  const client = makeFakeClient(jobs);
  const summary = await drainCrawlQueue(client as any, "https://supabase.example", "anon-key");
  assertEquals(summary.processed, 2);
  assertEquals(jobs.every((j) => j.status === "failed"), true);
});
