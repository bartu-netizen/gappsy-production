interface SkeletonShimmerProps {
  className?: string;
  width?: string;
  height?: string;
}

export function SkeletonShimmer({
  className = '',
  width = 'w-full',
  height = 'h-4',
}: SkeletonShimmerProps) {
  return (
    <div
      className={`${width} ${height} ${className} bg-white/8 rounded-md overflow-hidden relative skeleton-shimmer`}
    />
  );
}
