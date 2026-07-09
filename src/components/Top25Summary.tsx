import { useState, useRef } from 'react';

type Top25SummaryProps = {
  stateName: string;
  agencies: { id?: string; slug?: string; name: string }[];
  onAgencyClick?: (anchorId: string, agency: { id?: string; slug?: string; name: string }) => void;
};

const Top25Summary: React.FC<Top25SummaryProps> = ({ stateName, agencies, onAgencyClick }) => {
  const [showScrollHint, setShowScrollHint] = useState(true);
  const scrollContainerRef = useRef<HTMLDivElement>(null);

  const anchorIdForAgency = (agency: { id?: string; slug?: string; name: string }) => {
    if (agency.id) return `agency-${agency.id}`;
    if (agency.slug) return `agency-${agency.slug}`;
    return (
      'agency-' +
      agency.name
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/^-+|-+$/g, '')
    );
  };

  const handleAgencyClick = (
    e: React.MouseEvent<HTMLAnchorElement>,
    anchorId: string,
    agency: { id?: string; slug?: string; name: string },
  ) => {
    e.preventDefault();
    onAgencyClick?.(anchorId, agency);
    if (!onAgencyClick) {
      const element = document.getElementById(anchorId);
      if (element) {
        element.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    }
  };

  const handleScroll = () => {
    const container = scrollContainerRef.current;
    if (!container) return;
    const { scrollTop, scrollHeight, clientHeight } = container;
    const isNearBottom = scrollTop + clientHeight >= scrollHeight - 40;
    setShowScrollHint(!isNearBottom);
  };

  const handleScrollHintClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.preventDefault();
    e.stopPropagation();
    const container = scrollContainerRef.current;
    if (container) {
      container.scrollBy({ top: container.clientHeight * 0.7, behavior: 'smooth' });
    }
  };

  const top25Agencies = agencies.slice(0, 25);
  const columnCount = 3;
  const itemsPerColumn = Math.ceil(top25Agencies.length / columnCount);

  const column1 = top25Agencies.slice(0, itemsPerColumn);
  const column2 = top25Agencies.slice(itemsPerColumn, 2 * itemsPerColumn);
  const column3 = top25Agencies.slice(2 * itemsPerColumn, 3 * itemsPerColumn);

  const renderAgencyLink = (
    agency: { id?: string; slug?: string; name: string },
    index: number,
    isMobile: boolean = false,
  ) => {
    const anchorId = anchorIdForAgency(agency);
    return (
      <a
        key={anchorId}
        href={`#${anchorId}`}
        onClick={(e) => handleAgencyClick(e, anchorId, agency)}
        className="flex items-center gap-2 group hover:text-slate-900 transition-colors"
      >
        <span
          className={`inline-flex h-6 w-6 flex-shrink-0 items-center justify-center rounded-full text-xs font-medium ${
            isMobile
              ? 'bg-gray-200 border border-gray-300 text-slate-800'
              : 'bg-white border border-gray-200 text-slate-700'
          }`}
        >
          {index + 1}
        </span>
        <span className="text-sm font-medium text-slate-700 truncate group-hover:underline group-hover:text-slate-900">
          {agency.name}
        </span>
      </a>
    );
  };

  return (
    <section className="mt-6 md:mt-8 mb-6" data-nosnippet aria-label={`Top 25 summary for ${stateName}`}>
      {/* Desktop / tablet version — unchanged */}
      <div className="hidden lg:block rounded-xl bg-[#f9fafb] border border-[#e5e7eb] shadow-sm px-8 py-6">
        <div className="flex flex-col sm:flex-row sm:items-baseline sm:justify-between gap-2 mb-5">
          <h3 className="text-xs font-semibold uppercase tracking-wider text-slate-600">
            TOP-25 SUMMARY — {stateName.toUpperCase()}
          </h3>
          <p className="text-xs text-slate-500">Click an agency name to jump to its full listing.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-x-10 gap-y-2">
          <div className="flex flex-col gap-y-2">
            {column1.map((agency, idx) => renderAgencyLink(agency, idx))}
          </div>
          <div className="flex flex-col gap-y-2">
            {column2.map((agency, idx) => renderAgencyLink(agency, itemsPerColumn + idx))}
          </div>
          <div className="flex flex-col gap-y-2">
            {column3.map((agency, idx) => renderAgencyLink(agency, 2 * itemsPerColumn + idx))}
          </div>
        </div>
      </div>

      {/* Phone version — always-open scrollable panel */}
      <div className="lg:hidden">
        <div className="rounded-xl bg-[#f9fafb] border border-[#e5e7eb] shadow-sm overflow-hidden">
          {/* Header — no toggle button, no chevron */}
          <div className="px-4 pt-3 pb-2">
            <p className="text-xs font-semibold uppercase tracking-wider text-slate-600">
              TOP-25 SUMMARY — {stateName.toUpperCase()}
            </p>
          </div>

          {/* Scrollable list — all 25 items, ~8 rows visible initially */}
          <div className="relative">
            <div
              ref={scrollContainerRef}
              onScroll={handleScroll}
              className="px-4 pb-4"
              style={{
                maxHeight: '17rem',
                overflowY: 'auto',
                WebkitOverflowScrolling: 'touch',
                overscrollBehavior: 'contain',
              }}
            >
              <div className="space-y-2 pb-8">
                {top25Agencies.map((agency, index) => renderAgencyLink(agency, index, true))}
              </div>
            </div>

            {/* Bottom fade gradient — scroll cue */}
            {showScrollHint && (
              <div
                className="pointer-events-none absolute bottom-0 left-0 right-0 h-12"
                style={{
                  background:
                    'linear-gradient(to bottom, transparent, rgba(249,250,251,0.95))',
                }}
              />
            )}

            {/* "Keep scrolling" pill */}
            {showScrollHint && (
              <button
                onClick={handleScrollHintClick}
                className="absolute flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-white border border-gray-200 shadow-sm text-xs font-medium text-slate-600 hover:bg-gray-50 active:bg-gray-100 transition-colors"
                style={{ bottom: '10px', right: '14px', zIndex: 10 }}
                aria-label="Scroll down to see more agencies"
              >
                <svg
                  className="w-3.5 h-3.5"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
                Keep scrolling
              </button>
            )}
          </div>
        </div>
      </div>
    </section>
  );
};

export default Top25Summary;
