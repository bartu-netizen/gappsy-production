import { useState, useRef, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Send, Sparkles, ArrowRight } from 'lucide-react';
import { searchAdminTools, AdminTool } from './adminTools';

// A chat-shaped quick-nav box: typed text is matched against ADMIN_TOOLS via
// the shared local scoring function (see searchAdminTools in adminTools.ts)
// and the best matches come back as clickable destinations — no LLM call,
// no API cost, purely a smarter front end for the same data ⌘K already
// searches.
interface ChatEntry {
  id: number;
  role: 'user' | 'assistant';
  text: string;
  matches?: AdminTool[];
}

let nextEntryId = 0;

export default function AdminQuickNavChat() {
  const navigate = useNavigate();
  const [input, setInput] = useState('');
  const [entries, setEntries] = useState<ChatEntry[]>([
    {
      id: nextEntryId++,
      role: 'assistant',
      text: 'Typ waar je heen wilt — bijv. "discovery queue" of "listclean" — dan stuur ik je er direct naartoe.',
    },
  ]);
  const scrollRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' });
  }, [entries]);

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const text = input.trim();
    if (!text) return;
    const matches = searchAdminTools(text, 5);
    setEntries((prev) => [
      ...prev,
      { id: nextEntryId++, role: 'user', text },
      matches.length > 0
        ? {
            id: nextEntryId++,
            role: 'assistant',
            text: matches.length === 1 ? 'Dit bedoel je vast:' : `${matches.length} mogelijke bestemmingen:`,
            matches,
          }
        : { id: nextEntryId++, role: 'assistant', text: `Geen match voor "${text}" — probeer een ander woord, of gebruik ⌘K.` },
    ]);
    setInput('');
  }

  return (
    <div className="bg-white border border-slate-200 rounded-xl overflow-hidden flex flex-col">
      <div className="px-4 py-3 border-b border-slate-100 flex items-center gap-2">
        <div className="w-6 h-6 rounded-md bg-gradient-to-br from-indigo-500 to-blue-500 flex items-center justify-center shrink-0">
          <Sparkles className="w-3.5 h-3.5 text-white" />
        </div>
        <p className="text-sm font-semibold text-slate-800">Quick Nav</p>
        <p className="text-[11px] text-slate-400 ml-auto">Lokale zoekfunctie, geen AI-kosten</p>
      </div>

      <div ref={scrollRef} className="max-h-64 overflow-y-auto px-4 py-3 space-y-3">
        {entries.map((entry) => (
          <div key={entry.id} className={entry.role === 'user' ? 'flex justify-end' : 'flex justify-start'}>
            <div
              className={`max-w-[85%] rounded-xl px-3 py-2 text-sm ${
                entry.role === 'user' ? 'bg-indigo-600 text-white' : 'bg-slate-100 text-slate-700'
              }`}
            >
              <p>{entry.text}</p>
              {entry.matches && (
                <div className="mt-2 flex flex-col gap-1">
                  {entry.matches.map((tool) => (
                    <button
                      key={tool.id}
                      type="button"
                      onClick={() => navigate(tool.href)}
                      className="flex items-center gap-2 px-2.5 py-1.5 bg-white border border-slate-200 rounded-lg text-left text-xs font-medium text-slate-700 hover:border-indigo-300 hover:text-indigo-700 transition-colors"
                    >
                      <span className="flex-1 truncate">{tool.label}</span>
                      <ArrowRight className="w-3 h-3 shrink-0 text-slate-300" />
                    </button>
                  ))}
                </div>
              )}
            </div>
          </div>
        ))}
      </div>

      <form onSubmit={handleSubmit} className="flex items-center gap-2 px-4 py-3 border-t border-slate-100">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="bijv. discovery queue, listclean, smartlead..."
          className="flex-1 text-sm bg-slate-50 border border-slate-200 rounded-lg px-3 py-2 outline-none focus:ring-2 focus:ring-indigo-500"
        />
        <button
          type="submit"
          disabled={!input.trim()}
          className="inline-flex items-center justify-center w-9 h-9 rounded-lg bg-indigo-600 text-white disabled:opacity-40 hover:bg-indigo-700 transition-colors shrink-0"
        >
          <Send className="w-4 h-4" />
        </button>
      </form>
    </div>
  );
}
