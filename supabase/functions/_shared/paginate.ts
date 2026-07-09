import type { SupabaseClient } from "npm:@supabase/supabase-js@2";

export interface PaginateResult<T> {
  rows: T[];
  pages: number;
  totalFetched: number;
}

export async function fetchAllRows<T>(
  supabase: SupabaseClient,
  table: string,
  columns: string,
  chunkSize = 1000
): Promise<PaginateResult<T>> {
  const allRows: T[] = [];
  let page = 0;
  let done = false;

  while (!done) {
    const from = page * chunkSize;
    const to = from + chunkSize - 1;

    const { data, error } = await supabase
      .from(table)
      .select(columns)
      .order("state_slug", { ascending: true })
      .order("rank", { ascending: true })
      .order("id", { ascending: true })
      .range(from, to);

    if (error) throw new Error(`fetchAllRows(${table}) page ${page}: ${error.message}`);

    const chunk = (data ?? []) as T[];
    allRows.push(...chunk);
    page++;

    if (chunk.length < chunkSize) done = true;
  }

  return { rows: allRows, pages: page, totalFetched: allRows.length };
}
