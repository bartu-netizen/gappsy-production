import { useEffect, useMemo, useRef, useState, type CSSProperties } from 'react';
import { MapPin } from 'lucide-react';
import type { CanonicalEntry } from '../utils/canonicalReplayData';

export const LEDGER_ROW_H = 60;
const COLS_DESKTOP =
  'minmax(0,1.6fr) minmax(0,1.2fr) minmax(0,0.9fr) minmax(0,0.85fr)';
const COLS_MOBILE = 'minmax(0,1.35fr) minmax(0,1.15fr) 86px';

export function useIsMobileLedger(): boolean {
  const [isMobile, setIsMobile] = useState<boolean>(() =>
    typeof window !== 'undefined'
      ? window.matchMedia('(max-width: 767px)').matches
      : false
  );
  useEffect(() => {
    if (typeof window === 'undefined') return;
    const mq = window.matchMedia('(max-width: 767px)');
    const handler = (e: MediaQueryListEvent) => setIsMobile(e.matches);
    setIsMobile(mq.matches);
    mq.addEventListener('change', handler);
    return () => mq.removeEventListener('change', handler);
  }, []);
  return isMobile;
}

export function ledgerTimeAgoLabel(absoluteMs: number): string {
  const min = Math.floor((Date.now() - absoluteMs) / 60_000);
  // Floor at 3h for public display credibility
  if (min < 180) return '3h ago';
  if (min < 72 * 60) return `${Math.floor(min / 60)}h ago`;
  const d = Math.floor(min / (24 * 60));
  if (d <= 30) return d === 1 ? '1 day ago' : `${d} days ago`;
  return '30 days ago';
}

export function ClientRequestLedgerHeader({ isMobile }: { isMobile: boolean }) {
  const cellBase: CSSProperties = {
    fontSize: 'clamp(9px, 0.9vw, 10px)',
    fontWeight: 700,
    color: 'rgba(255,255,255,0.42)',
    textTransform: 'uppercase',
    letterSpacing: '0.08em',
    whiteSpace: 'nowrap',
    overflow: 'hidden',
    textOverflow: 'ellipsis',
    minWidth: 0,
  };
  return (
    <div
      style={{
        display: 'grid',
        gridTemplateColumns: isMobile ? COLS_MOBILE : COLS_DESKTOP,
        alignItems: 'center',
        gap: 8,
        padding: '8px 12px',
        borderBottom: '1px solid rgba(255,255,255,0.08)',
        background: 'rgba(15,23,42,0.85)',
      }}
    >
      <span style={cellBase}>Request Location</span>
      {isMobile ? (
        <span style={cellBase}>Service &amp; Budget</span>
      ) : (
        <>
          <span style={cellBase}>Service</span>
          <span style={cellBase}>Budget</span>
        </>
      )}
      <span style={{ ...cellBase, textAlign: 'right' }}>Received</span>
    </div>
  );
}

export function ClientRequestLedgerRow({
  entry,
  isMobile,
  outerStyle,
}: {
  entry: CanonicalEntry;
  isMobile: boolean;
  outerStyle?: CSSProperties;
}) {
  return (
    <div
      data-ledger-row
      style={{
        height: LEDGER_ROW_H,
        display: 'grid',
        gridTemplateColumns: isMobile ? COLS_MOBILE : COLS_DESKTOP,
        alignItems: 'center',
        gap: 8,
        padding: '0 12px',
        borderBottom: '1px solid rgba(255,255,255,0.05)',
        minWidth: 0,
        ...outerStyle,
      }}
    >
      {/* REQUEST cell: forced vertical stack — Location on top, IP below */}
      <div
        style={{
          minWidth: 0,
          display: 'flex',
          alignItems: 'flex-start',
          gap: 6,
        }}
      >
        <MapPin
          style={{
            width: 11,
            height: 11,
            color: 'rgba(255,255,255,0.4)',
            flexShrink: 0,
            marginTop: 4,
          }}
        />
        <div
          style={{
            minWidth: 0,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'flex-start',
            gap: 2,
          }}
        >
          <span
            style={{
              fontSize: 'clamp(12px, 1.25vw, 14px)',
              fontWeight: 600,
              color: '#ffffff',
              letterSpacing: '-0.01em',
              lineHeight: 1.2,
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              maxWidth: '100%',
            }}
          >
            {entry.location}
          </span>
          <span
            style={{
              fontSize: isMobile ? '10.5px' : 'clamp(9px, 0.9vw, 10.5px)',
              color: 'rgba(255,255,255,0.6)',
              fontFamily: 'ui-monospace, monospace',
              letterSpacing: '0.02em',
              lineHeight: 1.2,
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              maxWidth: '100%',
            }}
          >
            {entry.maskedIp}
          </span>
        </div>
      </div>

      {isMobile ? (
        /* SERVICE & BUDGET combined cell (mobile) */
        <div
          style={{
            minWidth: 0,
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            gap: 4,
          }}
        >
          <span
            style={{
              fontSize: '12.5px',
              color: 'rgba(147,197,253,0.95)',
              fontWeight: 500,
              letterSpacing: '-0.005em',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              minWidth: 0,
            }}
          >
            {entry.service}
          </span>
          <span
            style={{
              fontSize: '12px',
              color: 'rgba(255,255,255,0.78)',
              fontWeight: 500,
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              minWidth: 0,
            }}
          >
            {entry.budget}
          </span>
        </div>
      ) : (
        <>
          {/* SERVICE */}
          <span
            style={{
              fontSize: 'clamp(11px, 1.15vw, 13px)',
              color: 'rgba(147,197,253,0.9)',
              fontWeight: 500,
              letterSpacing: '-0.005em',
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              minWidth: 0,
            }}
          >
            {entry.service}
          </span>

          {/* BUDGET */}
          <span
            style={{
              fontSize: 'clamp(11px, 1.1vw, 13px)',
              color: 'rgba(255,255,255,0.62)',
              fontWeight: 400,
              whiteSpace: 'nowrap',
              overflow: 'hidden',
              textOverflow: 'ellipsis',
              minWidth: 0,
            }}
          >
            {entry.budget}
          </span>
        </>
      )}

      {/* RECEIVED */}
      <span
        style={{
          fontSize: isMobile ? '12px' : 'clamp(11px, 1.1vw, 13px)',
          color: '#f87171',
          fontWeight: 600,
          textAlign: 'right',
          whiteSpace: 'nowrap',
          overflow: 'visible',
          minWidth: 0,
        }}
      >
        {ledgerTimeAgoLabel(entry.absoluteMs)}
      </span>
    </div>
  );
}

/**
 * Auto-scrolling looping ledger. Uses a CSS transform on a non-scrollable
 * inner track so wheel events pass through to the page (no scroll trapping).
 */
export function ClientRequestLedger({
  entries,
  heightPx,
}: {
  entries: CanonicalEntry[];
  heightPx: number;
}) {
  const trackRef = useRef<HTMLDivElement | null>(null);
  const rafRef = useRef<number>(0);
  const offsetRef = useRef(0);
  const lastTimeRef = useRef<number | null>(null);
  const isMobile = useIsMobileLedger();

  const doubled = useMemo(() => [...entries, ...entries], [entries]);

  useEffect(() => {
    if (entries.length === 0) return;
    const el = trackRef.current;
    if (!el) return;

    const loopHeight = entries.length * LEDGER_ROW_H;
    const speedPxPerSec = 20;

    const tick = (now: number) => {
      if (lastTimeRef.current === null) lastTimeRef.current = now;
      const dt = Math.min(now - lastTimeRef.current, 100);
      lastTimeRef.current = now;

      offsetRef.current += (speedPxPerSec * dt) / 1000;
      if (offsetRef.current >= loopHeight) {
        offsetRef.current -= loopHeight;
      }
      el.style.transform = `translate3d(0, ${-offsetRef.current}px, 0)`;
      rafRef.current = requestAnimationFrame(tick);
    };

    rafRef.current = requestAnimationFrame(tick);

    return () => {
      cancelAnimationFrame(rafRef.current);
    };
  }, [entries]);

  return (
    <div
      className="relative rounded-2xl border border-white/10 bg-slate-900/60 backdrop-blur-sm overflow-hidden w-full"
      style={{ maxWidth: '100%' }}
    >
      <ClientRequestLedgerHeader isMobile={isMobile} />
      <div
        style={{
          position: 'relative',
          height: heightPx,
          maxWidth: '100%',
          overflow: 'hidden',
        }}
      >
        <div
          ref={trackRef}
          style={{
            width: '100%',
            willChange: 'transform',
            transform: 'translate3d(0,0,0)',
          }}
        >
          {doubled.map((entry, i) => (
            <ClientRequestLedgerRow
              key={`${entry.absoluteMs}-${i}`}
              entry={entry}
              isMobile={isMobile}
            />
          ))}
        </div>
        <div className="pointer-events-none absolute top-0 left-0 right-0 h-5 bg-gradient-to-b from-slate-900/95 to-transparent" />
        <div className="pointer-events-none absolute bottom-0 left-0 right-0 h-6 bg-gradient-to-t from-slate-900/95 to-transparent" />
      </div>
    </div>
  );
}
