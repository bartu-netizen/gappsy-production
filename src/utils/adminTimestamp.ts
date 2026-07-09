const adminTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;

export function getAdminTimezone(): string {
  return adminTimezone;
}

function toLocalDate(utcIso: string): Date {
  return new Date(utcIso);
}

function isToday(d: Date): boolean {
  const now = new Date();
  return (
    d.getFullYear() === now.getFullYear() &&
    d.getMonth() === now.getMonth() &&
    d.getDate() === now.getDate()
  );
}

function isYesterday(d: Date): boolean {
  const y = new Date();
  y.setDate(y.getDate() - 1);
  return (
    d.getFullYear() === y.getFullYear() &&
    d.getMonth() === y.getMonth() &&
    d.getDate() === y.getDate()
  );
}

function pad2(n: number): string {
  return n.toString().padStart(2, '0');
}

function localHHmm(d: Date): string {
  return `${pad2(d.getHours())}:${pad2(d.getMinutes())}`;
}

export function formatAdminLocalTime(utcIso: string | null | undefined): string {
  if (!utcIso) return '\u2014';
  const d = toLocalDate(utcIso);
  if (isNaN(d.getTime())) return '\u2014';

  if (isToday(d)) {
    return localHHmm(d);
  }
  if (isYesterday(d)) {
    return `Yesterday, ${localHHmm(d)}`;
  }
  const month = d.toLocaleString('en-US', { month: 'short' });
  return `${month} ${d.getDate()}, ${localHHmm(d)}`;
}

export function formatTimeAgo(utcIso: string | null | undefined): string {
  if (!utcIso) return '\u2014';
  const d = toLocalDate(utcIso);
  if (isNaN(d.getTime())) return '\u2014';

  const diffMs = Date.now() - d.getTime();
  if (diffMs < 0) return 'just now';

  const mins = Math.floor(diffMs / 60_000);
  if (mins < 1) return 'just now';
  if (mins < 60) return `${mins} min ago`;

  const hrs = Math.floor(mins / 60);
  const remMins = mins % 60;
  if (hrs < 48) {
    return remMins > 0 ? `${hrs}h ${remMins}m ago` : `${hrs}h ago`;
  }

  const days = Math.max(2, Math.round(hrs / 24));
  return `${days} days ago`;
}

export function formatAdminTimestampWithAgo(utcIso: string | null | undefined): string {
  if (!utcIso) return '\u2014';
  const d = toLocalDate(utcIso);
  if (isNaN(d.getTime())) return '\u2014';

  return `${formatAdminLocalTime(utcIso)} \u00B7 ${formatTimeAgo(utcIso)}`;
}

export function formatFullTooltip(utcIso: string | null | undefined): string {
  if (!utcIso) return '';
  const d = toLocalDate(utcIso);
  if (isNaN(d.getTime())) return '';

  const day = d.getDate();
  const month = d.toLocaleString('en-US', { month: 'short' });
  const year = d.getFullYear();
  const time = `${pad2(d.getHours())}:${pad2(d.getMinutes())}:${pad2(d.getSeconds())}`;
  return `${day} ${month} ${year}, ${time} ${adminTimezone}`;
}
