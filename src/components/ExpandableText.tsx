import { useState } from 'react';

interface ExpandableTextProps {
  shortText: string;
  fullText: string;
  className?: string;
}

function normalize(text: string): string {
  return text
    .trim()
    .replace(/\s+/g, ' ')
    .toLowerCase();
}

function isFullDescription(shortText: string, fullText: string): boolean {
  const normalizedShort = normalize(shortText);
  const normalizedFull = normalize(fullText);

  if (normalizedFull === normalizedShort) return false;

  const shortWords = normalizedShort.split(' ').length;
  const fullWords = normalizedFull.split(' ').length;
  const wordDifference = fullWords - shortWords;

  return (
    normalizedFull.startsWith(normalizedShort) &&
    wordDifference > 10
  );
}

export default function ExpandableText({ shortText, fullText, className = '' }: ExpandableTextProps) {
  const [isExpanded, setIsExpanded] = useState(false);

  const shortContent = shortText || '';
  const fullContent = fullText || '';
  const normalizedShort = normalize(shortContent);
  const normalizedFull = normalize(fullContent);

  if (!shortContent && !fullContent) return null;

  const isFull = isFullDescription(shortContent, fullContent);
  const hasRelevantMore =
    normalizedFull &&
    normalizedFull !== normalizedShort &&
    (isFull || normalizedFull.length > normalizedShort.length + 50);

  if (!hasRelevantMore) {
    return (
      <div className={className} data-nosnippet>
        <p
          style={{
            fontSize: '14px',
            color: '#475569',
            lineHeight: '1.6',
            margin: 0,
            whiteSpace: 'pre-wrap'
          }}
        >
          {shortContent}
        </p>
      </div>
    );
  }

  return (
    <div className={className} data-nosnippet>
      {!isExpanded || !isFull ? (
        <p
          style={{
            fontSize: '14px',
            color: '#475569',
            lineHeight: '1.6',
            margin: 0,
            whiteSpace: 'pre-wrap'
          }}
        >
          {shortContent}
        </p>
      ) : null}

      {isExpanded && (
        <p
          style={{
            fontSize: '14px',
            color: '#475569',
            lineHeight: '1.6',
            margin: !isFull && shortContent ? '8px 0 0 0' : 0,
            whiteSpace: 'pre-wrap'
          }}
        >
          {fullContent}
        </p>
      )}

      <button
        type="button"
        onClick={() => setIsExpanded(prev => !prev)}
        className="read-more-link"
      >
        {isExpanded ? 'Read less' : 'Read more'}
      </button>
    </div>
  );
}
