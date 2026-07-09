import { useState } from 'react';

interface ListingDescriptionProps {
  fullText: string;
  limit?: number;
  forceCollapsed?: boolean;
  isPreviewPage?: boolean;
}

export default function ListingDescription({
  fullText,
  limit = 160,
  forceCollapsed = false,
  isPreviewPage = false
}: ListingDescriptionProps) {
  const [isExpanded, setIsExpanded] = useState(false);

  const needsTruncation = fullText.length > limit;
  const displayText = isExpanded ? fullText : fullText.slice(0, limit);
  const canExpand = !forceCollapsed && isPreviewPage && needsTruncation;

  const handleToggle = () => {
    if (canExpand) {
      setIsExpanded(!isExpanded);
    }
  };

  if (!needsTruncation) {
    return (
      <p className="text-xs md:text-sm text-slate-600 leading-relaxed">
        {fullText}
      </p>
    );
  }

  if (forceCollapsed) {
    return (
      <div className="relative max-h-[80px] overflow-hidden">
        <p className="text-xs md:text-sm text-slate-600 leading-relaxed">
          {displayText}
          {!isExpanded && needsTruncation && '...'}
        </p>
        <div className="absolute bottom-0 left-0 right-0 h-7 bg-gradient-to-b from-transparent to-white/95 pointer-events-none" />
        <button
          type="button"
          disabled
          className="text-xs text-indigo-600 font-medium mt-1 cursor-default"
        >
          Read more
        </button>
      </div>
    );
  }

  return (
    <div className="relative">
      <div
        className={`transition-all duration-200 ease-in-out ${
          isExpanded ? 'max-h-none' : 'max-h-[80px] overflow-hidden'
        }`}
      >
        <p className="text-xs md:text-sm text-slate-600 leading-relaxed">
          {displayText}
          {!isExpanded && needsTruncation && '...'}
        </p>
        {!isExpanded && (
          <div className="absolute bottom-0 left-0 right-0 h-7 bg-gradient-to-b from-transparent to-white/95 pointer-events-none" />
        )}
      </div>

      {canExpand && (
        <button
          type="button"
          onClick={handleToggle}
          className="text-xs text-indigo-600 hover:text-indigo-700 font-medium mt-1 underline transition-colors duration-200"
        >
          {isExpanded ? 'Show less' : 'Read more'}
        </button>
      )}
    </div>
  );
}
