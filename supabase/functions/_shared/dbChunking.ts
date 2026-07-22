// deno-lint-ignore-file no-explicit-any
// PostgREST builds .in() as a query-string filter — once the id list grows
// into the hundreds (every tool with any analytics activity, every tool
// referenced across all comparisons, etc.), a single .in("id", ids) call
// can produce a URL long enough to trip an HTTP/2 protocol error before it
// ever reaches Postgres. Chunking sidesteps the URL-length ceiling
// entirely — same fix already used for this exact class of bug in the
// prerender build scripts (see scripts/prerender-tools.js's
// fetchAllPublishedTools/fetchInChunks).
export async function fetchInChunks<T>(
  ids: string[],
  queryFn: (chunk: string[]) => Promise<{ data: T[] | null; error: { message: string } | null }>,
  chunkSize = 100
): Promise<{ data: T[] | null; error: { message: string } | null }> {
  if (ids.length === 0) return { data: [], error: null };
  const chunks: string[][] = [];
  for (let i = 0; i < ids.length; i += chunkSize) chunks.push(ids.slice(i, i + chunkSize));
  const results = await Promise.all(chunks.map((chunk) => queryFn(chunk)));
  const failed = results.find((r) => r.error);
  if (failed?.error) return { data: null, error: failed.error };
  return { data: results.flatMap((r) => r.data || []), error: null };
}
