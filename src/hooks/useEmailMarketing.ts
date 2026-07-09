import { adminFetch } from '../utils/adminFetch';

const EM_FUNCTION = 'email-marketing-api';

async function emFetch(path: string, options: RequestInit = {}) {
  const res = await adminFetch(`${EM_FUNCTION}/${path}`, options);
  const data = await res.json();
  if (!res.ok || data.ok === false) {
    throw new Error(data.message ?? data.error ?? `HTTP ${res.status}`);
  }
  return data;
}

export const emApi = {
  get: (path: string) => emFetch(path),
  post: (path: string, body: unknown) => emFetch(path, { method: 'POST', body: JSON.stringify(body) }),
  put: (path: string, body: unknown) => emFetch(path, { method: 'PUT', body: JSON.stringify(body) }),
  delete: (path: string) => emFetch(path, { method: 'DELETE' }),
};

export type EmContact = {
  id: string;
  email: string;
  first_name: string | null;
  last_name: string | null;
  company_name: string | null;
  website: string | null;
  state_name: string | null;
  source_type: string;
  lead_status: string;
  payment_status: string;
  checkout_status: string;
  last_action_at: string | null;
  notes: string | null;
  created_at: string;
  updated_at: string;
};

export type EmSegment = {
  id: string;
  name: string;
  description: string | null;
  rules_json: any;
  estimated_count: number;
  estimated_count_updated_at: string | null;
  created_at: string;
  updated_at: string;
};

export type EmTemplate = {
  id: string;
  name: string;
  subject_template: string;
  preheader_template: string | null;
  body_json: { blocks: TemplateBlock[] };
  body_html: string;
  version: number;
  created_at: string;
  updated_at: string;
};

export type TemplateBlock = {
  id: string;
  type: 'header' | 'text' | 'button' | 'divider' | 'spacer' | 'image' | 'footer';
  content?: string;
  url?: string;
  label?: string;
  src?: string;
  alt?: string;
  height?: number;
};

export type EmCampaign = {
  id: string;
  name: string;
  status: string;
  segment_id: string | null;
  send_mode: string;
  scheduled_for: string | null;
  template_id: string | null;
  from_name: string;
  from_email: string;
  reply_to: string | null;
  subject_override: string | null;
  total_recipients: number;
  sent_count: number;
  open_count: number;
  click_count: number;
  bounce_count: number;
  complaint_count: number;
  unsubscribe_count: number;
  started_at: string | null;
  completed_at: string | null;
  created_at: string;
  updated_at: string;
};

export type EmAutomation = {
  id: string;
  name: string;
  status: string;
  trigger_type: string;
  trigger_filters: any;
  flow_json: { steps: AutomationStep[] };
  enrolled_count: number;
  completed_count: number;
  created_at: string;
  updated_at: string;
};

export type AutomationStep = {
  id: string;
  type: 'delay' | 'send_email' | 'condition' | 'tag';
  delay_unit?: 'minutes' | 'hours' | 'days';
  delay_value?: number;
  template_id?: string;
  condition_field?: string;
  condition_op?: string;
  condition_value?: string;
  tag_name?: string;
};

export type EmMessage = {
  id: string;
  to_email: string;
  subject_rendered: string;
  status: string;
  sent_at: string | null;
  created_at: string;
  campaign_id: string | null;
  automation_id: string | null;
};

export const LEAD_STATUSES = ['new', 'engaged', 'qualified', 'unqualified', 'customer'] as const;
export const SOURCE_TYPES = ['matched_lead', 'top25', 'spotlight', 'availability', 'contact', 'other'] as const;
export const PAYMENT_STATUSES = ['none', 'started', 'abandoned', 'paid', 'refunded'] as const;
export const TRIGGER_TYPES = [
  { value: 'form_submitted', label: 'Form Submitted' },
  { value: 'checkout_started', label: 'Checkout Started' },
  { value: 'checkout_abandoned', label: 'Checkout Abandoned' },
  { value: 'payment_succeeded', label: 'Payment Succeeded' },
  { value: 'inactive_7_days', label: 'Inactive 7 Days' },
  { value: 'inactive_14_days', label: 'Inactive 14 Days' },
  { value: 'inactive_30_days', label: 'Inactive 30 Days' },
  { value: 'tag_added', label: 'Tag Added' },
] as const;

export const STATUS_COLORS: Record<string, string> = {
  draft: 'bg-slate-100 text-slate-600',
  scheduled: 'bg-blue-100 text-blue-700',
  sending: 'bg-amber-100 text-amber-700',
  completed: 'bg-emerald-100 text-emerald-700',
  paused: 'bg-orange-100 text-orange-700',
  active: 'bg-emerald-100 text-emerald-700',
  queued: 'bg-blue-100 text-blue-700',
  sent: 'bg-emerald-100 text-emerald-700',
  failed: 'bg-red-100 text-red-700',
  bounced: 'bg-red-100 text-red-700',
  suppressed: 'bg-slate-100 text-slate-500',
  new: 'bg-blue-100 text-blue-700',
  engaged: 'bg-sky-100 text-sky-700',
  qualified: 'bg-emerald-100 text-emerald-700',
  unqualified: 'bg-slate-100 text-slate-600',
  customer: 'bg-violet-100 text-violet-700',
  paid: 'bg-emerald-100 text-emerald-700',
  none: 'bg-slate-100 text-slate-500',
};
