import { useEffect, useState, useRef } from 'react';

interface ListingLoadingProgressProps {
  done?: {
    listing?: boolean;
    assets?: boolean;
    reviews?: boolean;
    finalize?: boolean;
  };
  isComplete?: boolean;
}

export function ListingLoadingProgress({
  done = {},
  isComplete = false,
}: ListingLoadingProgressProps) {
  const [displayPercent, setDisplayPercent] = useState(8);
  const animationFrameRef = useRef<number | null>(null);

  const stageTargets: Record<string, number> = {
    listing: 35,
    assets: 65,
    reviews: 85,
    finalize: 95,
  };

  const computeTargetPercent = () => {
    if (isComplete) return 100;

    let maxTarget = 8;
    if (done.listing) maxTarget = Math.max(maxTarget, stageTargets.listing);
    if (done.assets) maxTarget = Math.max(maxTarget, stageTargets.assets);
    if (done.reviews) maxTarget = Math.max(maxTarget, stageTargets.reviews);
    if (done.finalize) maxTarget = Math.max(maxTarget, stageTargets.finalize);

    if (!isComplete && maxTarget >= 85) {
      maxTarget = 85;
    }

    return maxTarget;
  };

  const getStageLabel = () => {
    if (isComplete) return 'Complete';
    if (done.finalize) return 'Finalizing…';
    if (done.reviews) return 'Loading reviews…';
    if (done.assets) return 'Loading assets…';
    if (done.listing) return 'Fetching listing…';
    return 'Loading…';
  };

  useEffect(() => {
    const targetPercent = computeTargetPercent();

    if (animationFrameRef.current) {
      cancelAnimationFrame(animationFrameRef.current);
    }

    const animate = () => {
      setDisplayPercent((current) => {
        if (current >= targetPercent) {
          return targetPercent;
        }

        const diff = targetPercent - current;
        const increment = Math.max(0.5, diff * 0.08);
        return Math.min(current + increment, targetPercent);
      });

      if (displayPercent < targetPercent) {
        animationFrameRef.current = requestAnimationFrame(animate);
      }
    };

    animationFrameRef.current = requestAnimationFrame(animate);

    return () => {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    };
  }, [done, isComplete, displayPercent]);

  const roundedPercent = Math.round(displayPercent);
  const stageLabel = getStageLabel();

  return (
    <div className="flex flex-col items-center gap-2 w-[360px] max-w-[85vw] mx-auto">
      <div className="flex items-center justify-between w-full text-xs">
        <span className="text-slate-300/70 font-medium">{stageLabel}</span>
        <span className="text-slate-300/70 font-semibold">{roundedPercent}%</span>
      </div>

      <div
        className="w-full h-2.5 rounded-full bg-white/10 overflow-hidden"
        role="progressbar"
        aria-valuemin={0}
        aria-valuemax={100}
        aria-valuenow={roundedPercent}
      >
        <div
          className="h-full bg-white/35 transition-all duration-300 ease-out rounded-full"
          style={{ width: `${roundedPercent}%` }}
        />
      </div>
    </div>
  );
}
