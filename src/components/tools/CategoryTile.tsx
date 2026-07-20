import { Link } from 'react-router-dom';
import {
  ArrowRight, FolderTree,
  BarChart3, Blocks, BookOpen, Bot, Briefcase, Calculator, Calendar, CalendarClock, Camera, CheckCircle2,
  ClipboardCheck, ClipboardList, Cloud, Code2, Compass, CreditCard, Database, FileText, Film, FolderOpen,
  GitBranch, GraduationCap, Headset, Image, Kanban, KeyRound, Landmark, Languages, LayoutTemplate, Library,
  LifeBuoy, LineChart, ListChecks, Mail, Megaphone, MessageCircle, MessageSquare, MessagesSquare, Mic,
  MonitorPlay, Newspaper, Palette, PenLine, PenTool, Plug, Puzzle, Receipt, Scale, Search, Server, Share2,
  Shield, ShoppingCart, Sparkles, Terminal, TrendingUp, UserPlus, Users, Users2, Video, Zap,
  FileSignature, Gamepad2, HeartPulse, Wifi, Music, Building2, Star, Store, Timer, HardHat,
  type LucideIcon,
} from 'lucide-react';

export interface CategoryTileData {
  slug: string;
  name: string;
  description: string | null;
  toolCount: number;
  icon?: string | null;
}

// tool_categories.icon stores a Lucide component name (e.g. "Calculator")
// picked when each category was created — this is the full set actually in
// use across the taxonomy. Falls back to FolderTree for the handful of
// categories with no icon assigned yet, or a name that doesn't match
// anything here.
const ICON_MAP: Record<string, LucideIcon> = {
  BarChart3, Blocks, BookOpen, Bot, Briefcase, Calculator, Calendar, CalendarClock, Camera, CheckCircle2,
  ClipboardCheck, ClipboardList, Cloud, Code2, Compass, CreditCard, Database, FileText, Film, FolderOpen,
  GitBranch, GraduationCap, Headset, Image, Kanban, KeyRound, Landmark, Languages, LayoutTemplate, Library,
  LifeBuoy, LineChart, ListChecks, Mail, Megaphone, MessageCircle, MessageSquare, MessagesSquare, Mic,
  MonitorPlay, Newspaper, Palette, PenLine, PenTool, Plug, Puzzle, Receipt, Scale, Search, Server, Share2,
  Shield, ShoppingCart, Sparkles, Terminal, TrendingUp, UserPlus, Users, Users2, Video, Zap,
  FileSignature, Gamepad2, HeartPulse, Wifi, Music, Building2, Star, Store, Timer, HardHat,
};

// A small curated accent palette (not random per-render — hashed from the
// slug so a given category always gets the same color) instead of every
// tile sharing one flat gray-on-white icon treatment.
const ACCENT_PALETTE: { bg: string; icon: string }[] = [
  { bg: '#EEF0FE', icon: '#4F47E6' }, // indigo (brand)
  { bg: '#E0F2FE', icon: '#0284C7' }, // sky
  { bg: '#D1FAE5', icon: '#059669' }, // emerald
  { bg: '#FEF3C7', icon: '#D97706' }, // amber
  { bg: '#FCE7F3', icon: '#DB2777' }, // pink
  { bg: '#EDE9FE', icon: '#7C3AED' }, // violet
  { bg: '#CFFAFE', icon: '#0891B2' }, // cyan
  { bg: '#FFEDD5', icon: '#EA580C' }, // orange
];

function hashSlug(slug: string): number {
  let hash = 0;
  for (let i = 0; i < slug.length; i++) hash = (hash * 31 + slug.charCodeAt(i)) >>> 0;
  return hash;
}

function getCategoryVisual(category: CategoryTileData): { Icon: LucideIcon; accent: { bg: string; icon: string } } {
  const Icon = (category.icon && ICON_MAP[category.icon]) || FolderTree;
  const accent = ACCENT_PALETTE[hashSlug(category.slug) % ACCENT_PALETTE.length];
  return { Icon, accent };
}

interface CategoryTileProps {
  category: CategoryTileData;
  size?: 'large' | 'compact';
}

// Shared between ToolsIndexPage (a curated 2–3 tile spread) and
// ToolCategoriesIndexPage (large tiles for the categories with the most tools, compact
// rows for the rest) — one component, two visual weights, so category browsing never
// collapses into one uniform N-up grid.
export default function CategoryTile({ category, size = 'large' }: CategoryTileProps) {
  const { Icon, accent } = getCategoryVisual(category);

  if (size === 'compact') {
    return (
      <Link
        to={`/tool-categories/${category.slug}`}
        className="group flex items-center gap-3 bg-white border border-[#eef0f3] rounded-xl px-4 py-3.5 transition-colors hover:border-[#C7CCF7] hover:bg-[#EEF0FE]/30"
      >
        <div className="w-8 h-8 rounded-lg flex items-center justify-center shrink-0" style={{ backgroundColor: accent.bg }}>
          <Icon className="w-4 h-4" style={{ color: accent.icon }} />
        </div>
        <span className="flex-1 min-w-0 text-sm font-medium text-[#0B1221] truncate group-hover:text-[#4F47E6] transition-colors">
          {category.name}
        </span>
        <span className="text-xs text-slate-400 shrink-0">{category.toolCount}</span>
      </Link>
    );
  }

  return (
    <Link
      to={`/tool-categories/${category.slug}`}
      className="group relative flex flex-col bg-white border border-[#eef0f3] rounded-[24px] p-7 sm:p-8 overflow-hidden transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_20px_40px_rgba(15,23,42,0.10)] hover:border-[#C7CCF7]"
    >
      <div
        className="absolute -top-10 -right-10 w-32 h-32 rounded-full opacity-[0.15] blur-2xl transition-opacity group-hover:opacity-30"
        style={{ backgroundColor: accent.icon }}
        aria-hidden="true"
      />
      <div className="relative w-12 h-12 rounded-2xl shadow-sm flex items-center justify-center mb-5" style={{ backgroundColor: accent.bg }}>
        <Icon className="w-5 h-5" style={{ color: accent.icon }} />
      </div>
      <h3 className="relative text-lg sm:text-xl font-bold text-[#0D172A] mb-2 leading-snug">{category.name}</h3>
      {category.description && (
        <p className="relative text-sm text-slate-500 leading-relaxed line-clamp-2 mb-5">{category.description}</p>
      )}
      <div className="relative mt-auto flex items-center justify-between pt-1">
        <span className="text-xs font-semibold px-2 py-1 rounded-full" style={{ backgroundColor: accent.bg, color: accent.icon }}>
          {category.toolCount} tool{category.toolCount === 1 ? '' : 's'}
        </span>
        <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-[#4F47E6] group-hover:translate-x-0.5 transition-all" />
      </div>
    </Link>
  );
}
