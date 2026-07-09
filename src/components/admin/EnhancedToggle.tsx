interface EnhancedToggleProps {
  title: string;
  description?: string;
  value: boolean;
  onChange: (next: boolean) => void;
  disabled?: boolean;
  size?: 'md' | 'lg';
  codeBadge?: string;
}

export default function EnhancedToggle({
  title,
  description,
  value,
  onChange,
  disabled = false,
  size = 'md',
  codeBadge,
}: EnhancedToggleProps) {
  const handleClick = () => {
    if (!disabled) onChange(!value);
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === ' ' || e.key === 'Enter') {
      e.preventDefault();
      if (!disabled) onChange(!value);
    }
  };

  const trackW = size === 'lg' ? 'w-14' : 'w-11';
  const trackH = size === 'lg' ? 'h-7' : 'h-6';
  const thumbSize = size === 'lg' ? 'w-5 h-5' : 'w-4 h-4';
  const thumbTranslate = size === 'lg'
    ? (value ? 'translate-x-7' : 'translate-x-1')
    : (value ? 'translate-x-5' : 'translate-x-1');

  return (
    <div
      role="switch"
      aria-checked={value}
      aria-disabled={disabled}
      tabIndex={disabled ? -1 : 0}
      onClick={handleClick}
      onKeyDown={handleKeyDown}
      className={`
        group flex items-center justify-between gap-4 w-full
        px-4 py-3.5 rounded-xl border transition-all duration-150
        ${disabled
          ? 'opacity-50 cursor-not-allowed border-gray-200 bg-gray-50'
          : value
            ? 'border-blue-200 bg-blue-50/40 hover:bg-blue-50/70 cursor-pointer'
            : 'border-gray-200 bg-white hover:bg-gray-50 cursor-pointer'
        }
        focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-1
      `}
    >
      {/* Left: text content */}
      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-2 flex-wrap">
          <span className={`font-semibold text-sm ${value ? 'text-gray-900' : 'text-gray-700'}`}>
            {title}
          </span>
          {codeBadge && (
            <code className="text-[11px] font-mono px-1.5 py-0.5 bg-gray-100 text-gray-500 rounded border border-gray-200">
              {codeBadge}
            </code>
          )}
        </div>
        {description && (
          <p className="text-xs text-gray-500 mt-0.5 leading-relaxed">{description}</p>
        )}
      </div>

      {/* Right: status badge + switch */}
      <div className="flex items-center gap-3 shrink-0">
        <span
          className={`
            text-xs font-semibold px-2.5 py-1 rounded-full transition-all duration-150
            ${value
              ? 'bg-emerald-100 text-emerald-700 ring-1 ring-emerald-200'
              : 'bg-gray-100 text-gray-500 ring-1 ring-gray-200'
            }
          `}
        >
          {value ? 'Enabled' : 'Disabled'}
        </span>

        {/* Switch track */}
        <div
          className={`
            relative ${trackW} ${trackH} rounded-full transition-all duration-200 shrink-0
            ${value ? 'bg-blue-600' : 'bg-gray-300'}
            ${!disabled && 'group-hover:ring-2 group-hover:ring-offset-1'}
            ${!disabled && value ? 'group-hover:ring-blue-300' : 'group-hover:ring-gray-300'}
          `}
        >
          <div
            className={`
              absolute top-1/2 -translate-y-1/2 ${thumbSize} bg-white rounded-full shadow-sm
              transition-transform duration-200 ease-in-out
              ${thumbTranslate}
            `}
          />
        </div>
      </div>
    </div>
  );
}
