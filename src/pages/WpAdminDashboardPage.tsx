import { useState } from 'react';
import { Search } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import AdminToolCard from '../components/wpadmin/AdminToolCard';
import AdminCommandPalette from '../components/wpadmin/AdminCommandPalette';
import { ADMIN_TOOLS, TOOL_GROUPS } from '../components/wpadmin/adminTools';

export default function WpAdminDashboardPage() {
  const [paletteOpen, setPaletteOpen] = useState(false);

  return (
    <WpAdminLayout title="Dashboard" subtitle="Quick access to all admin tools">
      <AdminCommandPalette open={paletteOpen} onClose={() => setPaletteOpen(false)} />

      <div className="space-y-8">
        {/* Search bar */}
        <button
          onClick={() => setPaletteOpen(true)}
          className="w-full flex items-center gap-3 px-4 py-3 bg-white border border-slate-200 rounded-xl text-slate-400 hover:border-blue-300 hover:shadow-sm transition-all text-sm group"
        >
          <Search className="w-4 h-4 group-hover:text-blue-500 transition-colors" />
          <span className="flex-1 text-left group-hover:text-slate-500">Search tools by name or keyword...</span>
          <div className="hidden sm:flex items-center gap-1">
            <kbd className="text-xs px-1.5 py-0.5 bg-slate-100 rounded border border-slate-200 text-slate-400">⌘</kbd>
            <kbd className="text-xs px-1.5 py-0.5 bg-slate-100 rounded border border-slate-200 text-slate-400">K</kbd>
          </div>
        </button>

        {/* Tool groups */}
        {TOOL_GROUPS.map(group => (
          <div key={group}>
            <div className="flex items-center gap-3 mb-4">
              <h2 className="text-xs font-bold text-slate-400 uppercase tracking-widest">{group}</h2>
              <div className="flex-1 h-px bg-slate-100" />
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-3">
              {ADMIN_TOOLS.filter(t => t.group === group).map(tool => (
                <AdminToolCard key={tool.id} tool={tool} />
              ))}
            </div>
          </div>
        ))}
      </div>
    </WpAdminLayout>
  );
}
