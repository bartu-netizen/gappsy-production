import { useEffect, useRef, useState } from 'react';
import { Sparkles, Send, Loader2, AlertCircle } from 'lucide-react';

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
  suggestedQuestions: string[];
  placeholder?: string;
  /** Caps the message-thread height so the surrounding layout (inline hero
   * card or floating bubble panel) stays a predictable size — the thread
   * scrolls internally once it grows past this. */
  threadMaxHeightClass?: string;
}

// Shared chat engine used both inline in the tool-detail hero and in the
// homepage's floating bubble. Talks directly to the ask-gappsy edge
// function's streaming response (plain UTF-8 text chunks, not raw OpenAI
// SSE — the edge function already unwraps that) so this component just
// reads the stream and appends, no SSE parsing needed here.
export default function AskGappsyChat({ toolSlug, toolName, suggestedQuestions, placeholder, threadMaxHeightClass = 'max-h-[360px]' }: AskGappsyChatProps) {
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
        body: JSON.stringify({ session_id: sessionIdRef.current, tool_slug: toolSlug, messages: nextMessages }),
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
      <div className="flex items-center gap-2.5 px-4 sm:px-5 py-3.5 border-b border-slate-100 shrink-0">
        <div className="w-8 h-8 rounded-lg bg-[#0A1735] flex items-center justify-center shrink-0">
          <Sparkles className="w-4 h-4 text-white" aria-hidden="true" />
        </div>
        <div className="min-w-0">
          <p className="font-bold text-[#0B1221] text-sm leading-tight">Ask Gappsy{toolName ? ` about ${toolName}` : ''}</p>
          <p className="text-[11.5px] text-slate-400 leading-tight">AI answers, grounded in real listing data</p>
        </div>
      </div>

      {messages.length === 0 ? (
        <div className="px-4 sm:px-5 py-4 flex-1 overflow-y-auto">
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
        <div ref={threadRef} className={`flex-1 overflow-y-auto px-4 sm:px-5 py-4 space-y-3 ${threadMaxHeightClass}`}>
          {messages.map((m, i) => (
            <div key={i} className={`flex ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}>
              <div
                className={`max-w-[85%] rounded-2xl px-3.5 py-2.5 text-[13.5px] leading-relaxed whitespace-pre-wrap ${
                  m.role === 'user' ? 'bg-[#4F47E6] text-white' : 'bg-slate-50 text-[#0B1221]'
                }`}
              >
                {m.content || (streaming && i === messages.length - 1 ? <Loader2 className="w-3.5 h-3.5 animate-spin text-slate-400" /> : '')}
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
          placeholder={placeholder || (toolName ? `Ask anything about ${toolName}...` : 'Ask about any tool on Gappsy...')}
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
