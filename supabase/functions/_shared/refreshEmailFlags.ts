export interface FlagRefreshResult {
  ok: boolean;
  shared_email_patterns?: number;
  rows_newly_flagged?: number;
  rows_cleared?: number;
  ran_at?: string;
  error?: string;
}

export async function refreshEmailFlags(
  supabase: any,
  context?: string
): Promise<FlagRefreshResult> {
  const tag = context ? `[${context}]` : "[refreshEmailFlags]";
  try {
    const { data, error } = await supabase.rpc("refresh_shared_email_conflicts");
    if (error) {
      console.error(`${tag} refresh_shared_email_conflicts failed: ${error.message}`);
      return { ok: false, error: error.message };
    }
    const result = data as FlagRefreshResult;
    console.log(
      `${tag} Flags refreshed — shared patterns: ${result.shared_email_patterns ?? 0}, ` +
      `newly flagged: ${result.rows_newly_flagged ?? 0}, cleared: ${result.rows_cleared ?? 0}`
    );
    return { ok: true, ...result };
  } catch (err) {
    const msg = err instanceof Error ? err.message : String(err);
    console.error(`${tag} refreshEmailFlags threw: ${msg}`);
    return { ok: false, error: msg };
  }
}
