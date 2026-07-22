// Standard 5-field cron expression -> next-run calculator (minute hour
// day-of-month month day-of-week). Deliberately NOT used to drive pg_cron
// itself — pg_cron only has one permanent entry (the every-minute
// scheduler-tick). This is used by scheduler-tick to decide, in
// TypeScript, whether a given scheduled_jobs row with schedule_type='cron'
// is due, and to compute its next next_run_at after each run. Supports the
// common subset every real schedule needs: `*`, lists (`1,2,3`), ranges
// (`1-5`), and steps (`*/15` or `1-30/5`) — not Quartz-only extensions
// like `L`/`W`/`#`, which standard cron doesn't have either.

interface ParsedField {
  values: Set<number>;
}

function parseField(field: string, min: number, max: number): ParsedField {
  const values = new Set<number>();
  for (const part of field.split(",")) {
    const stepMatch = part.match(/^(\*|\d+-\d+|\d+)\/(\d+)$/);
    let range: [number, number];
    let step = 1;
    if (stepMatch) {
      step = Number(stepMatch[2]);
      range = stepMatch[1] === "*" ? [min, max] : parseRange(stepMatch[1]);
    } else if (part === "*") {
      range = [min, max];
    } else if (part.includes("-")) {
      range = parseRange(part);
    } else {
      const n = Number(part);
      if (!Number.isFinite(n)) throw new Error(`Invalid cron field value: "${part}"`);
      range = [n, n];
    }
    for (let v = range[0]; v <= range[1]; v += step) values.add(v);
  }
  for (const v of values) {
    if (v < min || v > max) throw new Error(`Cron field value ${v} out of range [${min}, ${max}]`);
  }
  return { values };
}

function parseRange(part: string): [number, number] {
  const [a, b] = part.split("-").map(Number);
  if (!Number.isFinite(a) || !Number.isFinite(b) || a > b) throw new Error(`Invalid cron range: "${part}"`);
  return [a, b];
}

export interface ParsedCron {
  minute: ParsedField;
  hour: ParsedField;
  dayOfMonth: ParsedField;
  month: ParsedField;
  dayOfWeek: ParsedField;
}

export function parseCronExpression(expression: string): ParsedCron {
  const parts = expression.trim().split(/\s+/);
  if (parts.length !== 5) {
    throw new Error(`Cron expression must have exactly 5 fields (minute hour day month weekday), got ${parts.length}: "${expression}"`);
  }
  const [minute, hour, dayOfMonth, month, dayOfWeek] = parts;
  return {
    minute: parseField(minute, 0, 59),
    hour: parseField(hour, 0, 23),
    dayOfMonth: parseField(dayOfMonth, 1, 31),
    month: parseField(month, 1, 12),
    dayOfWeek: parseField(dayOfWeek, 0, 6), // 0 = Sunday, matches JS Date#getUTCDay()
  };
}

const MAX_SEARCH_MINUTES = 60 * 24 * 366 * 2; // bounded search: up to 2 years ahead

// All cron math is done in UTC — scheduled_jobs.cron_expression is always
// interpreted as UTC, same as the existing pg_cron migration
// (20260513184303) documents doing for its own fixed schedule.
export function computeNextCronRun(expression: string, from: Date): Date {
  const cron = parseCronExpression(expression);
  const candidate = new Date(Date.UTC(
    from.getUTCFullYear(), from.getUTCMonth(), from.getUTCDate(),
    from.getUTCHours(), from.getUTCMinutes(), 0, 0,
  ));
  candidate.setUTCMinutes(candidate.getUTCMinutes() + 1); // next run is always strictly after `from`

  for (let i = 0; i < MAX_SEARCH_MINUTES; i++) {
    const minute = candidate.getUTCMinutes();
    const hour = candidate.getUTCHours();
    const dayOfMonth = candidate.getUTCDate();
    const month = candidate.getUTCMonth() + 1;
    const dayOfWeek = candidate.getUTCDay();

    if (
      cron.minute.values.has(minute) &&
      cron.hour.values.has(hour) &&
      cron.dayOfMonth.values.has(dayOfMonth) &&
      cron.month.values.has(month) &&
      cron.dayOfWeek.values.has(dayOfWeek)
    ) {
      return candidate;
    }
    candidate.setUTCMinutes(candidate.getUTCMinutes() + 1);
  }
  throw new Error(`No matching run time found for cron expression "${expression}" within the search bound.`);
}

export function computeNextIntervalRun(intervalSeconds: number, from: Date): Date {
  return new Date(from.getTime() + intervalSeconds * 1000);
}
