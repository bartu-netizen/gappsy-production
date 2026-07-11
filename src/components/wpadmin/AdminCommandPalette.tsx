import { useState, useEffect, useRef, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
import { Search, X, ArrowRight, CreditCard as Edit2, FileJson, Image, Star, LayoutGrid, CreditCard, Inbox, Mail, AlertTriangle, Settings, GitMerge, Upload, UploadCloud, Building2, MailOpen, Send, Activity, CheckCircle, MessageSquare, UserSearch, TrendingUp, Target, EyeOff, BarChart2, Bell, Zap, Shield, Link2, Wrench, FolderTree, Tag, GitCompare, Flame, Rocket, ListChecks, FileEdit, History, Gauge, Workflow, Globe2, Archive, LayoutDashboard } from 'lucide-react';
import { ADMIN_TOOLS, TOOL_GROUPS, AdminTool } from './adminTools';

const ICON_MAP: Record<string, JSX.Element> = {
  Edit2: <Edit2 className="w-4 h-4" />,
  FileJson: <FileJson className="w-4 h-4" />,
  Image: <Image className="w-4 h-4" />,
  Star: <Star className="w-4 h-4" />,
  LayoutGrid: <LayoutGrid className="w-4 h-4" />,
  CreditCard: <CreditCard className="w-4 h-4" />,
  Inbox: <Inbox className="w-4 h-4" />,
  Mail: <Mail className="w-4 h-4" />,
  AlertTriangle: <AlertTriangle className="w-4 h-4" />,
  Settings: <Settings className="w-4 h-4" />,
  GitMerge: <GitMerge className="w-4 h-4" />,
  Upload: <Upload className="w-4 h-4" />,
  UploadCloud: <UploadCloud className="w-4 h-4" />,
  Building2: <Building2 className="w-4 h-4" />,
  MailOpen: <MailOpen className="w-4 h-4" />,
  Send: <Send className="w-4 h-4" />,
  Activity: <Activity className="w-4 h-4" />,
  CheckCircle: <CheckCircle className="w-4 h-4" />,
  MessageSquare: <MessageSquare className="w-4 h-4" />,
  UserSearch: <UserSearch className="w-4 h-4" />,
  TrendingUp: <TrendingUp className="w-4 h-4" />,
  Target: <Target className="w-4 h-4" />,
  EyeOff: <EyeOff className="w-4 h-4" />,
  BarChart2: <BarChart2 className="w-4 h-4" />,
  Bell: <Bell className="w-4 h-4" />,
  Zap: <Zap className="w-4 h-4" />,
  Shield: <Shield className="w-4 h-4" />,
  Link2: <Link2 className="w-4 h-4" />,
  Wrench: <Wrench className="w-4 h-4" />,
  FolderTree: <FolderTree className="w-4 h-4" />,
  Tag: <Tag className="w-4 h-4" />,
  GitCompare: <GitCompare className="w-4 h-4" />,
  Flame: <Flame className="w-4 h-4" />,
  Rocket: <Rocket className="w-4 h-4" />,
  ListChecks: <ListChecks className="w-4 h-4" />,
  FileEdit: <FileEdit className="w-4 h-4" />,
  History: <History className="w-4 h-4" />,
  Gauge: <Gauge className="w-4 h-4" />,
  Workflow: <Workflow className="w-4 h-4" />,
  Globe2: <Globe2 className="w-4 h-4" />,
  Archive: <Archive className="w-4 h-4" />,
  LayoutDashboard: <LayoutDashboard className="w-4 h-4" />,
};

const GROUP_COLORS: Record<string, string> = {
  Overview: 'text-blue-600 bg-blue-50',
  Publishing: 'text-rose-600 bg-rose-50',
  Software: 'text-indigo-600 bg-indigo-50',
  Taxonomy: 'text-violet-600 bg-violet-50',
  Editorial: 'text-fuchsia-600 bg-fuchsia-50',
  Content: 'text-blue-600 bg-blue-50',
  Monetization: 'text-emerald-600 bg-emerald-50',
  Email: 'text-sky-600 bg-sky-50',
  Ops: 'text-slate-600 bg-slate-100',
};

interface Props {
  open: boolean;
  onClose: () => void;
}

export default function AdminCommandPalette({ open, onClose }: Props) {
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [activeIndex, setActiveIndex] = useState(0);
  const inputRef = useRef<HTMLInputElement>(null);
  const listRef = useRef<HTMLDivElement>(null);

  const filtered = query.trim()
    ? ADMIN_TOOLS.filter(t => {
        const q = query.toLowerCase();
        return (
          t.label.toLowerCase().includes(q) ||
          t.description.toLowerCase().includes(q) ||
          t.keywords.some(k => k.includes(q))
        );
      })
    : ADMIN_TOOLS;

  const groupedResults = query.trim()
    ? [{ group: null, tools: filtered }]
    : TOOL_GROUPS.map(g => ({ group: g, tools: ADMIN_TOOLS.filter(t => t.group === g) })).filter(g => g.tools.length > 0);

  const flatFiltered = groupedResults.flatMap(g => g.tools);

  useEffect(() => {
    if (open) {
      setQuery('');
      setActiveIndex(0);
      setTimeout(() => inputRef.current?.focus(), 50);
    }
  }, [open]);

  useEffect(() => { setActiveIndex(0); }, [query]);

  const go = useCallback((tool: AdminTool) => {
    onClose();
    navigate(tool.href);
  }, [navigate, onClose]);

  const handleKey = (e: React.KeyboardEvent) => {
    if (e.key === 'ArrowDown') {
      e.preventDefault();
      setActiveIndex(i => Math.min(i + 1, flatFiltered.length - 1));
    } else if (e.key === 'ArrowUp') {
      e.preventDefault();
      setActiveIndex(i => Math.max(i - 1, 0));
    } else if (e.key === 'Enter') {
      e.preventDefault();
      if (flatFiltered[activeIndex]) go(flatFiltered[activeIndex]);
    } else if (e.key === 'Escape') {
      onClose();
    }
  };

  useEffect(() => {
    const el = listRef.current?.querySelector(`[data-idx="${activeIndex}"]`) as HTMLElement | null;
    el?.scrollIntoView({ block: 'nearest' });
  }, [activeIndex]);

  if (!open) return null;

  let flatIdx = 0;

  return (
    <div
      className="fixed inset-0 z-[100] flex items-start justify-center pt-[10vh] px-4"
      onMouseDown={(e) => { if (e.target === e.currentTarget) onClose(); }}
    >
      <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <div className="relative w-full max-w-xl bg-white rounded-2xl shadow-2xl border border-gray-100 overflow-hidden flex flex-col max-h-[70vh]">
        {/* Search input */}
        <div className="flex items-center gap-3 px-4 py-3.5 border-b border-gray-100">
          <Search className="w-5 h-5 text-gray-400 shrink-0" />
          <input
            ref={inputRef}
            type="text"
            placeholder="Search admin tools..."
            value={query}
            onChange={e => setQuery(e.target.value)}
            onKeyDown={handleKey}
            className="flex-1 text-base bg-transparent outline-none text-gray-900 placeholder-gray-400"
          />
          {query && (
            <button onClick={() => setQuery('')} className="text-gray-400 hover:text-gray-600">
              <X className="w-4 h-4" />
            </button>
          )}
          <kbd className="hidden sm:flex items-center gap-0.5 px-1.5 py-0.5 text-xs text-gray-400 bg-gray-100 rounded border border-gray-200">
            ESC
          </kbd>
        </div>

        {/* Results */}
        <div ref={listRef} className="overflow-y-auto flex-1 py-2">
          {flatFiltered.length === 0 && (
            <div className="px-4 py-8 text-center text-sm text-gray-400">No tools match "{query}"</div>
          )}
          {groupedResults.map(({ group, tools }) => (
            <div key={group ?? 'results'}>
              {group && (
                <div className="px-4 py-1.5 text-[11px] font-semibold text-gray-400 uppercase tracking-wider">
                  {group}
                </div>
              )}
              {tools.map(tool => {
                const idx = flatIdx++;
                const isActive = idx === activeIndex;
                return (
                  <button
                    key={tool.id}
                    data-idx={idx}
                    onClick={() => go(tool)}
                    onMouseEnter={() => setActiveIndex(idx)}
                    className={`w-full flex items-center gap-3 px-4 py-3 text-left transition-colors ${
                      isActive ? 'bg-blue-50' : 'hover:bg-gray-50'
                    }`}
                  >
                    <div className={`shrink-0 flex items-center justify-center w-8 h-8 rounded-lg ${GROUP_COLORS[tool.group]}`}>
                      {ICON_MAP[tool.iconName]}
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <span className={`text-sm font-medium ${isActive ? 'text-blue-700' : 'text-gray-900'}`}>
                          {tool.label}
                        </span>
                        {!query && (
                          <span className={`text-[10px] px-1.5 py-0.5 rounded font-medium ${GROUP_COLORS[tool.group]}`}>
                            {tool.group}
                          </span>
                        )}
                      </div>
                      <p className="text-xs text-gray-500 truncate mt-0.5">{tool.description}</p>
                    </div>
                    <ArrowRight className={`w-4 h-4 shrink-0 transition-opacity ${isActive ? 'text-blue-500 opacity-100' : 'text-gray-300 opacity-0'}`} />
                  </button>
                );
              })}
            </div>
          ))}
        </div>

        {/* Footer hint */}
        <div className="px-4 py-2.5 border-t border-gray-100 flex items-center gap-4 text-xs text-gray-400">
          <span className="flex items-center gap-1"><kbd className="px-1 py-0.5 bg-gray-100 rounded border border-gray-200">↑↓</kbd> navigate</span>
          <span className="flex items-center gap-1"><kbd className="px-1 py-0.5 bg-gray-100 rounded border border-gray-200">↵</kbd> open</span>
          <span className="flex items-center gap-1"><kbd className="px-1 py-0.5 bg-gray-100 rounded border border-gray-200">esc</kbd> close</span>
        </div>
      </div>
    </div>
  );
}
