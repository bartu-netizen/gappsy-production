export default function LightningBadge() {
  return (
    <div className="absolute top-3 right-3 z-30">
      <div className="relative group inline-block">
        <div className="h-8 w-6 flex items-center justify-center cursor-pointer">
          <img
            src="/featured-agency-badge.svg"
            alt="Featured Agency"
            className="h-[22px] w-[22px]"
          />
        </div>
        <div className="pointer-events-none absolute top-[130%] right-0 whitespace-nowrap rounded-md bg-black px-3 py-1 text-xs text-white opacity-0 group-hover:opacity-100 transition-opacity shadow-lg z-50">
          Featured Agency
        </div>
      </div>
    </div>
  );
}
