import { Fragment } from 'react';
import { Check } from 'lucide-react';

// Deliberately not a full markdown library (react-markdown/remark) — the
// assistant is instructed (see RESPONSE_FORMATTING_INSTRUCTIONS in
// ask-gappsy/index.ts) to stick to a tiny, predictable subset: **bold**,
// "- " bullet lists, and blank-line-separated paragraphs. This renders
// exactly that subset with real spacing/lists/icons instead of the
// previous whitespace-pre-wrap plain-text block.

function renderInline(text: string, keyPrefix: string): React.ReactNode[] {
  const parts = text.split(/(\*\*[^*]+\*\*)/g);
  return parts.map((part, i) => {
    if (part.startsWith('**') && part.endsWith('**') && part.length > 4) {
      return <strong key={`${keyPrefix}-${i}`} className="font-semibold text-[#0B1221]">{part.slice(2, -2)}</strong>;
    }
    return <Fragment key={`${keyPrefix}-${i}`}>{part}</Fragment>;
  });
}

interface Block {
  type: 'paragraph' | 'list';
  lines: string[];
}

function parseBlocks(content: string): Block[] {
  const lines = content.split('\n');
  const blocks: Block[] = [];
  let current: Block | null = null;

  for (const rawLine of lines) {
    const line = rawLine.trim();
    const isBullet = /^[-*]\s+/.test(line);

    if (!line) {
      current = null;
      continue;
    }
    if (isBullet) {
      const text = line.replace(/^[-*]\s+/, '');
      if (current?.type === 'list') {
        current.lines.push(text);
      } else {
        current = { type: 'list', lines: [text] };
        blocks.push(current);
      }
    } else {
      if (current?.type === 'paragraph') {
        current.lines.push(line);
      } else {
        current = { type: 'paragraph', lines: [line] };
        blocks.push(current);
      }
    }
  }
  return blocks;
}

export default function ChatMarkdown({ content }: { content: string }) {
  const blocks = parseBlocks(content);
  return (
    <div className="space-y-2.5">
      {blocks.map((block, i) =>
        block.type === 'list' ? (
          <ul key={i} className="space-y-1.5">
            {block.lines.map((line, j) => (
              <li key={j} className="flex items-start gap-2">
                <Check className="w-3.5 h-3.5 text-[#4F47E6] shrink-0 mt-[3px]" aria-hidden="true" />
                <span>{renderInline(line, `${i}-${j}`)}</span>
              </li>
            ))}
          </ul>
        ) : (
          <p key={i}>{block.lines.map((line, j) => (
            <Fragment key={j}>
              {j > 0 && ' '}
              {renderInline(line, `${i}-${j}`)}
            </Fragment>
          ))}</p>
        )
      )}
    </div>
  );
}
