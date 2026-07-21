import { useNavigate } from 'react-router-dom';
import { ArrowRight, CreditCard as Edit2, FileJson, Image, Star, LayoutGrid, CreditCard, Inbox, Mail, AlertTriangle, Settings, Shield, ShieldOff, BarChart2, Users, Filter, LayoutGrid as Layout, Send, Zap, ClipboardList, SlidersHorizontal, GitMerge, GitCompare, Upload, UploadCloud, Building2, MailOpen, Activity, CheckCircle, MessageSquare, UserSearch, TrendingUp, Target, EyeOff, Bell, Link2, Compass, PlusCircle, ShieldCheck, Plug, PlayCircle, UserCog, MousePointerClick } from 'lucide-react';
import { AdminTool } from './adminTools';

const ICON_MAP: Record<string, JSX.Element> = {
  PlayCircle: <PlayCircle className="w-5 h-5" />,
  UserCog: <UserCog className="w-5 h-5" />,
  GitCompare: <GitCompare className="w-5 h-5" />,
  MousePointerClick: <MousePointerClick className="w-5 h-5" />,
  Edit2: <Edit2 className="w-5 h-5" />,
  FileJson: <FileJson className="w-5 h-5" />,
  Image: <Image className="w-5 h-5" />,
  Star: <Star className="w-5 h-5" />,
  LayoutGrid: <LayoutGrid className="w-5 h-5" />,
  CreditCard: <CreditCard className="w-5 h-5" />,
  Inbox: <Inbox className="w-5 h-5" />,
  Mail: <Mail className="w-5 h-5" />,
  AlertTriangle: <AlertTriangle className="w-5 h-5" />,
  Settings: <Settings className="w-5 h-5" />,
  Shield: <Shield className="w-5 h-5" />,
  ShieldOff: <ShieldOff className="w-5 h-5" />,
  BarChart2: <BarChart2 className="w-5 h-5" />,
  Users: <Users className="w-5 h-5" />,
  Filter: <Filter className="w-5 h-5" />,
  Layout: <Layout className="w-5 h-5" />,
  Send: <Send className="w-5 h-5" />,
  Zap: <Zap className="w-5 h-5" />,
  ClipboardList: <ClipboardList className="w-5 h-5" />,
  SlidersHorizontal: <SlidersHorizontal className="w-5 h-5" />,
  GitMerge: <GitMerge className="w-5 h-5" />,
  Upload: <Upload className="w-5 h-5" />,
  UploadCloud: <UploadCloud className="w-5 h-5" />,
  Building2: <Building2 className="w-5 h-5" />,
  MailOpen: <MailOpen className="w-5 h-5" />,
  Activity: <Activity className="w-5 h-5" />,
  CheckCircle: <CheckCircle className="w-5 h-5" />,
  MessageSquare: <MessageSquare className="w-5 h-5" />,
  UserSearch: <UserSearch className="w-5 h-5" />,
  TrendingUp: <TrendingUp className="w-5 h-5" />,
  Target: <Target className="w-5 h-5" />,
  EyeOff: <EyeOff className="w-5 h-5" />,
  Bell: <Bell className="w-5 h-5" />,
  Link2: <Link2 className="w-5 h-5" />,
  Compass: <Compass className="w-5 h-5" />,
  PlusCircle: <PlusCircle className="w-5 h-5" />,
  ShieldCheck: <ShieldCheck className="w-5 h-5" />,
  Plug: <Plug className="w-5 h-5" />,
};

const GROUP_STYLE: Record<string, { icon: string; badge: string }> = {
  Content: { icon: 'bg-blue-100 text-blue-600', badge: 'bg-blue-50 text-blue-600' },
  Monetization: { icon: 'bg-emerald-100 text-emerald-600', badge: 'bg-emerald-50 text-emerald-600' },
  Email: { icon: 'bg-sky-100 text-sky-600', badge: 'bg-sky-50 text-sky-600' },
  Ops: { icon: 'bg-slate-100 text-slate-600', badge: 'bg-slate-100 text-slate-500' },
};

const FALLBACK_STYLE = { icon: 'bg-slate-100 text-slate-600', badge: 'bg-slate-100 text-slate-500' };

interface Props {
  tool: AdminTool;
}

export default function AdminToolCard({ tool }: Props) {
  const navigate = useNavigate();
  const style = GROUP_STYLE[tool.group] ?? FALLBACK_STYLE;
  const icon = ICON_MAP[tool.iconName];

  return (
    <button
      onClick={() => navigate(tool.href)}
      className="group w-full text-left bg-white border border-slate-200 rounded-xl p-5 hover:border-blue-300 hover:shadow-md transition-all duration-200 flex items-start gap-4"
    >
      <div className={`shrink-0 flex items-center justify-center w-10 h-10 rounded-xl ${style.icon} group-hover:scale-105 transition-transform duration-200`}>
        {icon ?? <Settings className="w-5 h-5" />}
      </div>
      <div className="flex-1 min-w-0">
        <div className="flex items-start justify-between gap-2">
          <h3 className="text-sm font-semibold text-slate-900 group-hover:text-blue-700 transition-colors leading-snug">
            {tool.label}
          </h3>
          <ArrowRight className="w-4 h-4 text-slate-300 group-hover:text-blue-400 group-hover:translate-x-0.5 transition-all shrink-0 mt-0.5" />
        </div>
        <p className="mt-1 text-xs text-slate-500 leading-relaxed line-clamp-2">{tool.description}</p>
        <span className={`mt-2 inline-block text-[10px] font-semibold uppercase tracking-wide px-2 py-0.5 rounded-full ${style.badge}`}>
          {tool.group}
        </span>
      </div>
    </button>
  );
}
