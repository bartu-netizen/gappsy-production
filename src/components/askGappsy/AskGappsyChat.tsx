import { useEffect, useRef, useState } from 'react';
import { Sparkles, Send, Loader2, AlertCircle } from 'lucide-react';
import ChatMarkdown from './ChatMarkdown';
import { getVisitorId } from '../../utils/funnelTracking';

const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL as string;
const SUPABASE_ANON_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY as string;
const SESSION_STORAGE_KEY = 'ask_gappsy_session_id';

interface ChatMessage {
  role: 'user' | 'assistant';
  content: string;
}

function getSessionId(): string {
  try {
    const existing = sessionStorage.getItem(SESSION_STORAGE_KEY);
    if (existing) return existing;
    const fresh = crypto.randomUUID();
    sessionStorage.setItem(SESSION_STORAGE_KEY, fresh);
    return fresh;
  } catch {
    return crypto.randomUUID();
  }
}

interface AskGappsyChatProps {
  toolSlug?: string;
  toolName?: string;
  /** Multi-tool scope for /compare pages (2 or 3 tools) — takes priority
   * over toolSlug/toolName when present. The edge function grounds the
   * assistant in all of these tools' real data at once instead of one. */
  toolSlugs?: string[];
  toolNames?: string[];
  /** Non-tool page context (currently only 'feature_my_product') — routes
   * the edge function to a static system prompt instead of DB-grounded
   * tool data. Ignored when toolSlug/toolSlugs is set. */
  page?: string;
  /** Header title/subtitle overrides for non-tool contexts — default
   * copy below assumes a tool-page/compare/homepage audience. */
  title?: string;
  subtitle?: string;
  suggestedQuestions: string[];
  placeholder?: string;
  /** Caps the message-thread height so the surrounding layout (inline hero
   * card or floating bubble panel) stays a predictable size — the thread
   * scrolls internally once it grows past this. */
  threadMaxHeightClass?: string;
  /** Fires once, the moment the very first message of the session is sent —
   * lets a parent (the tool-fit-check widget) know the "suggested
   * questions" view is about to be replaced by the thread, so it can show
   * a "← Back" affordance instead of only a close button. */
  onConversationStart?: () => void;
  /** Skips this component's own icon+title+subtitle header row entirely —
   * used by the tool-fit-check widget, which builds its own larger,
   * editorial-style header outside this panel instead. Every other
   * consumer (homepage bubble, inline tool/compare chat) omits this and
   * keeps the default compact header. */
  hideHeader?: boolean;
}

function joinNames(names: string[]): string {
  if (names.length <= 1) return names[0] || '';
  if (names.length === 2) return `${names[0]} and ${names[1]}`;
  return `${names.slice(0, -1).join(', ')}, and ${names[names.length - 1]}`;
}

// Shared chat engine used both inline in the tool-detail hero, inline on
// /compare pages (scoped to 2-3 tools via toolSlugs), and in the homepage's
// floating bubble. Talks directly to the ask-gappsy edge function's
// streaming response (plain UTF-8 text chunks, not raw OpenAI SSE — the
// edge function already unwraps that) so this component just reads the
// stream and appends, no SSE parsing needed here.
export default function AskGappsyChat({ toolSlug, toolName, toolSlugs, toolNames, page, title, subtitle, suggestedQuestions, placeholder, threadMaxHeightClass = 'max-h-[360px]', onConversationStart, hideHeader = false }: AskGappsyChatProps) {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [input, setInput] = useState('');
  const [streaming, setStreaming] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const threadRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const sessionIdRef = useRef<string>(getSessionId());

  useEffect(() => {
    if (threadRef.current) threadRef.current.scrollTop = threadRef.current.scrollHeight;
  }, [messages, streaming]);

  async function sendMessage(text: string) {
    const trimmed = text.trim();
    if (!trimmed || streaming) return;

    if (messages.length === 0) onConversationStart?.();
    const nextMessages: ChatMessage[] = [...messages, { role: 'user', content: trimmed }];
    setMessages(nextMessages);
    setInput('');
    setError(null);
    setStreaming(true);
    // Placeholder assistant bubble that fills in as chunks arrive.
    setMessages((prev) => [...prev, { role: 'assistant', content: '' }]);

    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/ask-gappsy`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${SUPABASE_ANON_KEY}` },
        body: JSON.stringify({
          session_id: sessionIdRef.current,
          visitor_id: getVisitorId(),
          ...(toolSlugs && toolSlugs.length > 0
            ? { tool_slugs: toolSlugs }
            : toolSlug
              ? { tool_slug: toolSlug, ...(page ? { page } : {}) }
              : page
                ? { page }
                : {}),
          messages: nextMessages,
        }),
      });

      if (!res.ok || !res.body) {
        const data = await res.json().catch(() => null);
        throw new Error(data?.error || 'The assistant is temporarily unavailable.');
      }

      const reader = res.body.getReader();
      const decoder = new TextDecoder();
      let accumulated = '';
      while (true) {
        const { done, value } = await reader.read();
        if (done) break;
        accumulated += decoder.decode(value, { stream: true });
        setMessages((prev) => {
          const copy = [...prev];
          copy[copy.length - 1] = { role: 'assistant', content: accumulated };
          return copy;
        });
      }
      if (!accumulated.trim()) {
        setMessages((prev) => prev.slice(0, -1));
        throw new Error("Didn't get a response — please try again.");
      }
    } catch (err) {
      setMessages((prev) => prev.slice(0, -1));
      setError(err instanceof Error ? err.message : 'Something went wrong. Please try again.');
    } finally {
      setStreaming(false);
    }
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    sendMessage(input);
  }

  // Tapping a suggested question is often the very first interaction with
  // this widget — on a tool page's mobile hero, the card can be tall enough
  // that the reply streams in below the fold. Scroll the whole card into
  // view so the conversation that's about to start is actually visible,
  // full width, rather than requiring a manual scroll to discover it.
  function handleSuggestedQuestion(q: string) {
    containerRef.current?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    sendMessage(q);
  }

  return (
    <div ref={containerRef} className="flex flex-col h-full">
      {!hideHeader && (
        <div className="flex items-center gap-2.5 px-4 sm:px-5 py-3.5 border-b border-slate-100 shrink-0">
          <div className="w-8 h-8 rounded-lg bg-[#0A1735] flex items-center justify-center shrink-0">
            <Sparkles className="w-4 h-4 text-white" aria-hidden="true" />
          </div>
          <div className="min-w-0">
            <p className="font-bold text-[#0B1221] text-sm leading-tight">
              {title || `Ask Gappsy${toolNames && toolNames.length > 0 ? ` about ${joinNames(toolNames)}` : toolName ? ` about ${toolName}` : ''}`}
            </p>
            <p className="text-[11.5px] text-slate-400 leading-tight">{subtitle || 'AI answers, grounded in real listing data'}</p>
          </div>
        </div>
      )}

      {messages.length === 0 ? (
        <div key="suggested" className="chat-step-in px-4 sm:px-5 py-4 flex-1 overflow-y-auto">
          <p className="text-[13px] text-slate-500 mb-3">Try asking:</p>
          <div className="flex flex-wrap gap-2">
            {suggestedQuestions.map((q) => (
              <button
                key={q}
                type="button"
                onClick={() => handleSuggestedQuestion(q)}
                className="text-left text-[12.5px] font-medium text-[#4F47E6] bg-[#EEF0FE] hover:bg-[#E0E3FC] px-3 py-2 rounded-xl transition-colors"
              >
                {q}
              </button>
            ))}
          </div>
        </div>
      ) : (
        <div key="thread" ref={threadRef} className={`chat-step-in flex-1 overflow-y-auto px-4 sm:px-5 py-4 space-y-3 ${threadMaxHeightClass}`}>
          {messages.map((m, i) => (
            <div key={i} className={`flex ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}>
              <div
                className={`max-w-[85%] rounded-2xl px-3.5 py-2.5 text-[13.5px] leading-relaxed ${
                  m.role === 'user' ? 'bg-[#4F47E6] text-white whitespace-pre-wrap' : 'bg-slate-50 text-[#0B1221]'
                }`}
              >
                {m.content ? (
                  m.role === 'assistant' ? <ChatMarkdown content={m.content} /> : m.content
                ) : (
                  streaming && i === messages.length - 1 ? <Loader2 className="w-3.5 h-3.5 animate-spin text-slate-400" /> : ''
                )}
              </div>
            </div>
          ))}
        </div>
      )}

      {error && (
        <div className="mx-4 sm:mx-5 mb-2 flex items-start gap-1.5 text-[12.5px] text-rose-600 bg-rose-50 border border-rose-100 rounded-lg px-3 py-2">
          <AlertCircle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
          {error}
        </div>
      )}

      <form onSubmit={handleSubmit} className="flex items-center gap-2 px-4 sm:px-5 py-3.5 border-t border-slate-100 shrink-0">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder={
            placeholder ||
            (toolNames && toolNames.length > 0
              ? `Ask anything about ${joinNames(toolNames)}...`
              : toolName
                ? `Ask anything about ${toolName}...`
                : 'Ask about any tool on Gappsy...')
          }
          disabled={streaming}
          className="flex-1 h-10 min-w-0 rounded-full border border-slate-200 px-4 text-sm placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-[#4F47E6]/20 focus:border-[#A8AEF0] transition-shadow disabled:opacity-60"
        />
        <button
          type="submit"
          disabled={streaming || !input.trim()}
          aria-label="Send"
          className="w-10 h-10 shrink-0 rounded-full bg-[#4F47E6] hover:bg-[#4338CA] text-white flex items-center justify-center transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
        >
          {streaming ? <Loader2 className="w-4 h-4 animate-spin" /> : <Send className="w-4 h-4" />}
        </button>
      </form>
    </div>
  );
}
