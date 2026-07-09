import {
  formatAdminTimestampWithAgo,
  formatFullTooltip,
} from '../../utils/adminTimestamp';

export function AdminTimestamp({
  iso,
  className = '',
}: {
  iso: string | null | undefined;
  className?: string;
}) {
  const display = formatAdminTimestampWithAgo(iso);
  const tooltip = formatFullTooltip(iso);

  return (
    <span className={className} title={tooltip}>
      {display}
    </span>
  );
}

export function TimezoneLabel({ className = '' }: { className?: string }) {
  const tz = Intl.DateTimeFormat().resolvedOptions().timeZone;
  return (
    <span className={`text-[10px] text-slate-400 ${className}`}>
      Times shown in your timezone: {tz}
    </span>
  );
}
