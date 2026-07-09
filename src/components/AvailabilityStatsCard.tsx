import { useState, useEffect, useRef, memo } from 'react';
import { normalizeDisplayedMissedCount } from '../utils/unifiedAgencyKpi';

interface AvailabilityStatsCardProps {
  missedCount: number;
  loading: boolean;
}

function AvailabilityStatsCardInner({
  missedCount,
  loading,
}: AvailabilityStatsCardProps) {
  const [displayValue, setDisplayValue] = useState(0);
  const animFrameRef = useRef<number | null>(null);
  const hasAnimatedRef = useRef(false);
  const mountedRef = useRef(true);

  useEffect(() => {
    mountedRef.current = true;
    return () => {
      mountedRef.current = false;
      if (animFrameRef.current) cancelAnimationFrame(animFrameRef.current);
    };
  }, []);

  const displayedTarget = normalizeDisplayedMissedCount(missedCount);

  useEffect(() => {
    if (loading) return;
    if (!mountedRef.current) return;

    if (!hasAnimatedRef.current) {
      hasAnimatedRef.current = true;
      const duration = 850;
      const startTime = performance.now();
      const step = (now: number) => {
        if (!mountedRef.current) return;
        const elapsed = now - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3);
        setDisplayValue(Math.round(displayedTarget * eased));
        if (progress < 1) {
          animFrameRef.current = requestAnimationFrame(step);
        } else {
          setDisplayValue(displayedTarget);
        }
      };
      animFrameRef.current = requestAnimationFrame(step);
    } else {
      setDisplayValue(displayedTarget);
    }
  }, [loading, displayedTarget]);

  return (
    <div className="bg-slate-800/40 backdrop-blur-sm border border-slate-700/50 rounded-2xl px-4 sm:px-5 py-4 sm:py-5 flex flex-col items-center justify-center text-center">
      <p className="text-[11px] font-semibold text-slate-300 uppercase tracking-wide leading-snug mb-0.5">
        Potential client requests
      </p>
      <p className="text-[11px] text-slate-500 mb-2">(last 30 days)</p>

      {loading && (
        <>
          <div
            className="rounded-lg bg-slate-700/40 animate-pulse my-2"
            style={{ width: '4ch', height: '3rem' }}
            aria-hidden="true"
          />
          <p className="text-xs text-slate-500 mt-1">Loading...</p>
        </>
      )}

      {!loading && (
        <>
          <p className="text-4xl sm:text-5xl font-extrabold tabular-nums leading-none mb-2 text-white">
            {displayValue}
          </p>

          <p className="text-sm font-bold text-red-400 leading-snug">
            You lost these clients
          </p>
          <p className="text-xs text-slate-500 mt-0.5 leading-snug max-w-[22ch]">
            Redirected to other agencies
          </p>
        </>
      )}
    </div>
  );
}

export const AvailabilityStatsCard = memo(AvailabilityStatsCardInner);
