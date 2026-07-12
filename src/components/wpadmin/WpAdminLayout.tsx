import { useState, useEffect, useLayoutEffect, useCallback, useMemo, useRef, memo } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Menu, X, Search, LogOut, ChevronRight, LayoutDashboard, CreditCard as Edit2, FileJson, Image, Star, LayoutGrid, CreditCard, Inbox, Mail, AlertTriangle, Settings, Shield, Activity, BarChart2, Users, Filter, LayoutGrid as Layout, Send, Zap, ClipboardList, SlidersHorizontal, Upload, Bell, Link2, TrendingUp, Building2, Flame, Wrench, FolderTree, Tag, GitCompare, Rocket, ListChecks, FileEdit, History, Gauge, Workflow, Globe2, Archive, Compass, PlusCircle, GitMerge, ShieldCheck, Plug } from 'lucide-react';
import AdminCommandPalette from './AdminCommandPalette';
import { ADMIN_TOOLS, ADMIN_VIEWS, TOOL_GROUPS, isToolVisibleInView, inferScopeForPath, type AdminScope, type AdminTool } from './adminTools';
import { useAdminSession } from '../../contexts/AdminSessionContext';
import { useAdminViewState } from '../../contexts/AdminViewContext';

const DESKTOP_SCROLL_KEY = 'wpAdminSidebarScroll:desktop';
const MOBILE_SCROLL_KEY = 'wpAdminSidebarScroll:mobile';

// The 3 sections whose visibility the view switcher actually controls.
// Overview (Dashboard) and Shared render in every view regardless — see
// isToolVisibleInView in adminTools.ts for why.
const FILTERABLE_SECTIONS: { scope: AdminScope; label: string }[] = [
  { scope: 'agency', label: 'Agencies' },
  { scope: 'software', label: 'Software' },
  { scope: 'shared', label: 'Shared / Global' },
];

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
  Shield: <Shield className="w-4 h-4" />,
  BarChart2: <BarChart2 className="w-4 h-4" />,
  Users: <Users className="w-4 h-4" />,
  Filter: <Filter className="w-4 h-4" />,
  Layout: <Layout className="w-4 h-4" />,
  Send: <Send className="w-4 h-4" />,
  Zap: <Zap className="w-4 h-4" />,
  ClipboardList: <ClipboardList className="w-4 h-4" />,
  SlidersHorizontal: <SlidersHorizontal className="w-4 h-4" />,
  Activity: <Activity className="w-4 h-4" />,
  Upload: <Upload className="w-4 h-4" />,
  Bell: <Bell className="w-4 h-4" />,
  Link2: <Link2 className="w-4 h-4" />,
  TrendingUp: <TrendingUp className="w-4 h-4" />,
  Building2: <Building2 className="w-4 h-4" />,
  Flame: <Flame className="w-4 h-4" />,
  Wrench: <Wrench className="w-4 h-4" />,
  FolderTree: <FolderTree className="w-4 h-4" />,
  Tag: <Tag className="w-4 h-4" />,
  GitCompare: <GitCompare className="w-4 h-4" />,
  Rocket: <Rocket className="w-4 h-4" />,
  ListChecks: <ListChecks className="w-4 h-4" />,
  FileEdit: <FileEdit className="w-4 h-4" />,
  History: <History className="w-4 h-4" />,
  Gauge: <Gauge className="w-4 h-4" />,
  Workflow: <Workflow className="w-4 h-4" />,
  Globe2: <Globe2 className="w-4 h-4" />,
  Archive: <Archive className="w-4 h-4" />,
  LayoutDashboard: <LayoutDashboard className="w-4 h-4" />,
  Compass: <Compass className="w-4 h-4" />,
  PlusCircle: <PlusCircle className="w-4 h-4" />,
  GitMerge: <GitMerge className="w-4 h-4" />,
  ShieldCheck: <ShieldCheck className="w-4 h-4" />,
  Plug: <Plug className="w-4 h-4" />,
};

const GROUP_COLORS: Record<string, string> = {
  Overview: 'text-blue-500',
  Discovery: 'text-teal-500',
  Publishing: 'text-rose-500',
  Software: 'text-indigo-500',
  Taxonomy: 'text-violet-500',
  Editorial: 'text-fuchsia-500',
  Content: 'text-blue-500',
  Monetization: 'text-emerald-500',
  Email: 'text-sky-500',
  Ops: 'text-slate-400',
};

interface NavProps {
  pathname: string;
  onNavigate: (href: string) => void;
  onLogout: () => void;
  storageKey: string;
  view: AdminScope | 'all';
  onViewChange: (view: AdminScope | 'all') => void;
}

// Compact segmented control for the All/Agencies/Software/Shared switcher.
// Plain buttons in a `role="tablist"` — arrow-key and Tab navigation both
// work for free via native focus order, and each button's pressed state is
// exposed via aria-pressed for screen readers.
function ViewSwitcher({ view, onViewChange }: { view: AdminScope | 'all'; onViewChange: (view: AdminScope | 'all') => void }) {
  return (
    <div role="tablist" aria-label="Admin view" className="grid grid-cols-4 gap-1 p-1 bg-slate-100 rounded-lg">
      {ADMIN_VIEWS.map((v) => (
        <button
          key={v.value}
          role="tab"
          type="button"
          aria-selected={view === v.value}
          aria-pressed={view === v.value}
          onClick={() => onViewChange(v.value)}
          className={`px-2 py-1.5 rounded-md text-[11px] font-semibold transition-colors truncate ${
            view === v.value ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500 hover:text-slate-700'
          }`}
        >
          {v.label}
        </button>
      ))}
    </div>
  );
}

const SidebarNav = memo(function SidebarNav({ pathname, onNavigate, onLogout, storageKey, view, onViewChange }: NavProps) {
  const navRef = useRef<HTMLElement>(null);

  const isActive = (href: string) => pathname === href || pathname.startsWith(href + '/');

  useLayoutEffect(() => {
    const saved = sessionStorage.getItem(storageKey);
    if (saved != null && navRef.current) {
      navRef.current.scrollTop = Number(saved);
    }
  }, []);

  const handleScroll = useCallback(() => {
    if (navRef.current) {
      sessionStorage.setItem(storageKey, String(navRef.current.scrollTop));
    }
  }, [storageKey]);

  // Sections whose top-level visibility the switcher controls. Overview
  // (Dashboard, rendered separately above) and Shared/Global are pinned —
  // see isToolVisibleInView in adminTools.ts.
  const sections = useMemo(
    () =>
      FILTERABLE_SECTIONS.filter((s) => isToolVisibleInView({ scopes: [s.scope] } as AdminTool, view)).map((s) => {
        const items = ADMIN_TOOLS.filter((t) => t.scopes.includes(s.scope));
        const subGroups = TOOL_GROUPS.filter((g) => items.some((t) => t.group === g)).map((g) => ({
          group: g,
          tools: items.filter((t) => t.group === g),
        }));
        return { ...s, subGroups };
      }),
    [view]
  );

  function renderTool(tool: AdminTool) {
    return (
      <button
        key={tool.id}
        onClick={() => onNavigate(tool.href)}
        className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors ${
          isActive(tool.href)
            ? 'bg-blue-50 text-blue-700'
            : 'text-slate-600 hover:bg-slate-100 hover:text-slate-900'
        }`}
      >
        <span className={`shrink-0 ${isActive(tool.href) ? 'text-blue-600' : GROUP_COLORS[tool.group]}`}>
          {ICON_MAP[tool.iconName] ?? <Settings className="w-4 h-4" />}
        </span>
        <span className="truncate">{tool.label}</span>
        {isActive(tool.href) && <ChevronRight className="w-3 h-3 ml-auto shrink-0 text-blue-400" />}
      </button>
    );
  }

  return (
    <>
      <div className="px-3 pt-3">
        <ViewSwitcher view={view} onViewChange={onViewChange} />
      </div>

      <nav
        ref={navRef as React.RefObject<HTMLElement>}
        onScroll={handleScroll}
        className="flex-1 overflow-y-auto px-3 py-4 space-y-0.5"
      >
        <button
          onClick={() => onNavigate('/wp-admin/dashboard')}
          className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium transition-colors ${
            isActive('/wp-admin/dashboard')
              ? 'bg-blue-50 text-blue-700'
              : 'text-slate-600 hover:bg-slate-100 hover:text-slate-900'
          }`}
        >
          <LayoutDashboard className="w-4 h-4 shrink-0" />
          Dashboard
        </button>

        {sections.map(({ scope, label, subGroups }) => (
          <div key={scope} className="pt-4">
            <p className="px-3 pb-1.5 text-[11px] font-bold text-slate-500 uppercase tracking-widest border-t border-slate-100 pt-3">{label}</p>
            {subGroups.map(({ group, tools }) => (
              <div key={group} className="pt-2">
                <p className="px-3 pb-1 text-[10px] font-bold text-slate-400 uppercase tracking-widest">{group}</p>
                {tools.map(renderTool)}
              </div>
            ))}
          </div>
        ))}
      </nav>

      <div className="px-3 py-4 border-t border-slate-100">
        <button
          onClick={onLogout}
          className="w-full flex items-center gap-3 px-3 py-2.5 rounded-lg text-sm font-medium text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors"
        >
          <LogOut className="w-4 h-4 shrink-0" />
          Logout
        </button>
      </div>
    </>
  );
});

interface Props {
  title: string;
  subtitle?: string;
  fullHeight?: boolean;
  children: React.ReactNode;
}

export default function WpAdminLayout({ title, subtitle, fullHeight = false, children }: Props) {
  const navigate = useNavigate();
  const location = useLocation();
  const { status, logout } = useAdminSession();
  const [mobileOpen, setMobileOpen] = useState(false);
  const [paletteOpen, setPaletteOpen] = useState(false);
  const [view, setView] = useAdminViewState();

  useEffect(() => {
    if (status === 'invalid') navigate('/wp-admin');
  }, [status, navigate]);

  useEffect(() => { setMobileOpen(false); }, [location.pathname]);

  const handleViewChange = useCallback((next: AdminScope | 'all') => {
    setView(next);
  }, [setView]);

  // Direct navigation / deep links must never land on a hidden route: if the
  // current page's scope isn't visible under the currently-selected view,
  // switch to whichever view does show it (falling back to 'all' when the
  // route can't be matched to a scope at all) — this never changes the URL,
  // only which section of the sidebar is expanded.
  useEffect(() => {
    const routeTool = ADMIN_TOOLS.find((t) => location.pathname === t.href || location.pathname.startsWith(`${t.href}/`));
    const scope = routeTool?.scopes[0] ?? inferScopeForPath(location.pathname);
    if (!scope) return;
    if (!isToolVisibleInView({ scopes: [scope] } as AdminTool, view)) {
      handleViewChange(scope === 'overview' ? 'all' : scope);
    }
    // Only re-run on navigation — intentionally excludes `view`/handleViewChange
    // so this doesn't fight a manual switcher click on the same route.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [location.pathname]);

  const handleLogout = useCallback(() => {
    logout();
    navigate('/wp-admin');
  }, [logout, navigate]);

  const handleNavigate = useCallback((href: string) => {
    navigate(href);
  }, [navigate]);

  const openPalette = useCallback(() => setPaletteOpen(true), []);
  const closePalette = useCallback(() => setPaletteOpen(false), []);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
        e.preventDefault();
        setPaletteOpen(p => !p);
      }
    };
    window.addEventListener('keydown', handler);
    return () => window.removeEventListener('keydown', handler);
  }, []);

  if (status === 'loading') {
    return (
      <div className="min-h-screen bg-slate-100 flex items-center justify-center">
        <div className="w-6 h-6 border-2 border-blue-600 border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className={fullHeight ? 'h-screen overflow-hidden flex bg-slate-100' : 'min-h-screen bg-slate-100 flex'}>
      <AdminCommandPalette open={paletteOpen} onClose={closePalette} />

      {/* Desktop Sidebar */}
      <aside className="hidden lg:flex flex-col w-60 shrink-0 bg-white border-r border-slate-200 sticky top-0 h-screen">
        <div className="px-5 py-5 border-b border-slate-100">
          <div className="flex items-center gap-2.5">
            <div className="w-7 h-7 bg-slate-900 rounded-lg flex items-center justify-center">
              <LayoutDashboard className="w-4 h-4 text-white" />
            </div>
            <div>
              <p className="text-sm font-bold text-slate-900 leading-none">Gappsy Admin</p>
              <p className="text-[10px] text-slate-400 mt-0.5">Management Portal</p>
            </div>
          </div>
        </div>
        <SidebarNav
          pathname={location.pathname}
          onNavigate={handleNavigate}
          onLogout={handleLogout}
          storageKey={DESKTOP_SCROLL_KEY}
          view={view}
          onViewChange={handleViewChange}
        />
      </aside>

      {/* Mobile Sidebar Drawer */}
      {mobileOpen && (
        <div className="fixed inset-0 z-50 flex lg:hidden">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setMobileOpen(false)} />
          <aside className="relative flex flex-col w-72 bg-white shadow-2xl h-full overflow-hidden">
            <div className="px-5 py-5 border-b border-slate-100 flex items-center justify-between">
              <div className="flex items-center gap-2.5">
                <div className="w-7 h-7 bg-slate-900 rounded-lg flex items-center justify-center">
                  <LayoutDashboard className="w-4 h-4 text-white" />
                </div>
                <div>
                  <p className="text-sm font-bold text-slate-900 leading-none">Gappsy Admin</p>
                  <p className="text-[10px] text-slate-400 mt-0.5">Management Portal</p>
                </div>
              </div>
              <button onClick={() => setMobileOpen(false)} className="text-slate-400 hover:text-slate-600 p-1">
                <X className="w-5 h-5" />
              </button>
            </div>
            <SidebarNav
              pathname={location.pathname}
              onNavigate={handleNavigate}
              onLogout={handleLogout}
              storageKey={MOBILE_SCROLL_KEY}
              view={view}
              onViewChange={handleViewChange}
            />
          </aside>
        </div>
      )}

      {/* Main area */}
      <div className={`flex-1 flex flex-col min-w-0${fullHeight ? ' overflow-hidden' : ''}`}>
        <header className="sticky top-0 z-30 bg-white border-b border-slate-100 px-4 sm:px-6 h-14 flex items-center gap-3">
          <button
            onClick={() => setMobileOpen(true)}
            className="lg:hidden flex items-center justify-center w-9 h-9 rounded-lg text-slate-500 hover:bg-slate-100 transition-colors"
          >
            <Menu className="w-5 h-5" />
          </button>

          <div className="flex-1 min-w-0">
            <h1 className="text-sm font-semibold text-slate-900 truncate">{title}</h1>
            {subtitle && <p className="text-xs text-slate-400 truncate hidden sm:block">{subtitle}</p>}
          </div>

          <button
            onClick={openPalette}
            className="hidden sm:flex items-center gap-2 px-3 py-1.5 bg-slate-100 hover:bg-slate-200 rounded-lg text-sm text-slate-500 transition-colors min-w-40"
          >
            <Search className="w-3.5 h-3.5" />
            <span className="flex-1 text-left">Search tools...</span>
            <kbd className="text-[10px] px-1.5 py-0.5 bg-white rounded border border-slate-200 text-slate-400">⌘K</kbd>
          </button>
          <button
            onClick={openPalette}
            className="sm:hidden flex items-center justify-center w-9 h-9 rounded-lg text-slate-500 hover:bg-slate-100 transition-colors"
          >
            <Search className="w-5 h-5" />
          </button>

          <button
            onClick={handleLogout}
            className="hidden sm:flex items-center gap-1.5 px-3 py-1.5 text-sm text-slate-500 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors"
          >
            <LogOut className="w-4 h-4" />
            <span className="hidden md:inline">Logout</span>
          </button>
        </header>

        {fullHeight ? (
          <main className="flex-1 flex flex-col min-h-0 overflow-hidden">
            {children}
          </main>
        ) : (
          <>
            <main className="flex-1 px-4 sm:px-6 py-6 max-w-6xl w-full mx-auto">
              {children}
            </main>
            <footer className="px-6 py-4 text-center text-xs text-slate-400 border-t border-slate-100">
              Gappsy Admin Panel &copy; {new Date().getFullYear()}
            </footer>
          </>
        )}
      </div>
    </div>
  );
}
