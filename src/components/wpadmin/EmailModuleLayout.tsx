import { useNavigate, useLocation } from 'react-router-dom';
import WpAdminLayout from './WpAdminLayout';

const TABS = [
  { label: 'Overview',    href: '/wp-admin/email/overview' },
  { label: 'Audience',    href: '/wp-admin/email/audience' },
  { label: 'Segments',    href: '/wp-admin/email/segments' },
  { label: 'Templates',   href: '/wp-admin/email/templates' },
  { label: 'Campaigns',   href: '/wp-admin/email/campaigns' },
  { label: 'Automations', href: '/wp-admin/email/automations' },
  { label: 'Quick Sends', href: '/wp-admin/email/quick-sends' },
  { label: 'Cold Outreach', href: '/wp-admin/email/smartlead' },
  { label: 'Cold Outreach Campaigns', href: '/wp-admin/email/smartlead/campaigns' },
  { label: 'Cold Outreach Inbox', href: '/wp-admin/email/smartlead/inbox' },
  { label: 'Send Logs',   href: '/wp-admin/email/logs' },
  { label: 'Settings',    href: '/wp-admin/email/settings' },
  { label: 'SMTP',        href: '/wp-admin/email/smtp' },
];

interface Props {
  children: React.ReactNode;
  title?: string;
  subtitle?: string;
}

export default function EmailModuleLayout({ children, title = 'Email Marketing', subtitle }: Props) {
  const navigate = useNavigate();
  const location = useLocation();

  const activeTab = TABS.reduce<typeof TABS[0] | null>((best, tab) => {
    const matches = location.pathname === tab.href || location.pathname.startsWith(tab.href + '/');
    if (!matches) return best;
    if (!best || tab.href.length > best.href.length) return tab;
    return best;
  }, null);

  return (
    <WpAdminLayout title={title} subtitle={subtitle ?? activeTab?.label}>
      <div className="space-y-5">
        <div className="flex items-center gap-1 flex-wrap bg-white border border-slate-200 rounded-xl px-3 py-2 overflow-x-auto">
          {TABS.map(tab => {
            const isActive = activeTab?.href === tab.href;
            return (
              <button
                key={tab.href}
                onClick={() => navigate(tab.href)}
                className={`shrink-0 px-3.5 py-1.5 rounded-lg text-sm font-medium transition-colors whitespace-nowrap ${
                  isActive
                    ? 'bg-slate-900 text-white'
                    : 'text-slate-500 hover:text-slate-900 hover:bg-slate-100'
                }`}
              >
                {tab.label}
              </button>
            );
          })}
        </div>
        <div>{children}</div>
      </div>
    </WpAdminLayout>
  );
}
