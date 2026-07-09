import { useEffect, useState } from 'react';
import { Plus, Trash2, Edit2, Zap, X, ChevronDown, ChevronUp, AlertCircle, Users, CheckCircle, Clock, Play, Pause } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmAutomation, AutomationStep, EmTemplate, TRIGGER_TYPES, STATUS_COLORS } from '../../hooks/useEmailMarketing';

function generateId() { return Math.random().toString(36).slice(2, 10); }

function defaultStep(type: AutomationStep['type']): AutomationStep {
  const id = generateId();
  switch (type) {
    case 'delay': return { id, type: 'delay', delay_value: 1, delay_unit: 'days' };
    case 'send_email': return { id, type: 'send_email', template_id: '' };
    case 'condition': return { id, type: 'condition', condition_field: 'lead_status', condition_op: 'eq', condition_value: '' };
    case 'tag': return { id, type: 'tag', tag_name: '' };
  }
}

const STEP_TYPES: { type: AutomationStep['type']; label: string; color: string; desc: string }[] = [
  { type: 'delay', label: 'Wait', color: 'bg-amber-100 text-amber-700 border-amber-200', desc: 'Wait before next step' },
  { type: 'send_email', label: 'Send Email', color: 'bg-sky-100 text-sky-700 border-sky-200', desc: 'Send a template' },
  { type: 'condition', label: 'Condition', color: 'bg-violet-100 text-violet-700 border-violet-200', desc: 'Branch on a condition' },
  { type: 'tag', label: 'Add Tag', color: 'bg-emerald-100 text-emerald-700 border-emerald-200', desc: 'Tag the contact' },
];

function StepCard({ step, idx, total, templates, onChange, onRemove, onMove }: {
  step: AutomationStep;
  idx: number;
  total: number;
  templates: EmTemplate[];
  onChange: (s: AutomationStep) => void;
  onRemove: () => void;
  onMove: (dir: -1 | 1) => void;
}) {
  const [expanded, setExpanded] = useState(true);
  const meta = STEP_TYPES.find(t => t.type === step.type)!;
  const inputCls = 'text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent bg-white';

  return (
    <div className="flex gap-3">
      <div className="flex flex-col items-center">
        <div className={`w-8 h-8 rounded-full border-2 flex items-center justify-center text-xs font-bold ${meta.color}`}>{idx + 1}</div>
        {idx < total - 1 && <div className="w-0.5 flex-1 bg-slate-200 mt-1" />}
      </div>
      <div className={`flex-1 mb-3 bg-white rounded-xl border ${meta.color.includes('border') ? meta.color.split(' ').find(c => c.startsWith('border-')) ?? 'border-slate-200' : 'border-slate-200'} shadow-sm`}>
        <div className="flex items-center justify-between px-4 py-3 cursor-pointer" onClick={() => setExpanded(e => !e)}>
          <div className="flex items-center gap-2">
            <span className={`text-xs font-semibold px-2 py-0.5 rounded-full border ${meta.color}`}>{meta.label}</span>
            <span className="text-xs text-slate-500">{meta.desc}</span>
          </div>
          <div className="flex items-center gap-1">
            <button onClick={e => { e.stopPropagation(); onMove(-1); }} disabled={idx === 0} className="p-1 rounded text-slate-300 hover:text-slate-500 disabled:opacity-20"><ChevronUp className="w-3 h-3" /></button>
            <button onClick={e => { e.stopPropagation(); onMove(1); }} disabled={idx === total - 1} className="p-1 rounded text-slate-300 hover:text-slate-500 disabled:opacity-20"><ChevronDown className="w-3 h-3" /></button>
            <button onClick={e => { e.stopPropagation(); onRemove(); }} className="p-1 rounded text-slate-300 hover:text-red-500"><X className="w-3 h-3" /></button>
            {expanded ? <ChevronUp className="w-3.5 h-3.5 text-slate-400 ml-1" /> : <ChevronDown className="w-3.5 h-3.5 text-slate-400 ml-1" />}
          </div>
        </div>

        {expanded && (
          <div className="px-4 pb-4 border-t border-slate-50 pt-3">
            {step.type === 'delay' && (
              <div className="flex items-center gap-2">
                <span className="text-sm text-slate-500">Wait</span>
                <input type="number" value={step.delay_value ?? 1} onChange={e => onChange({ ...step, delay_value: +e.target.value })} className={`${inputCls} w-20`} min={1} />
                <select value={step.delay_unit ?? 'days'} onChange={e => onChange({ ...step, delay_unit: e.target.value as any })} className={inputCls}>
                  <option value="minutes">minutes</option>
                  <option value="hours">hours</option>
                  <option value="days">days</option>
                </select>
                <span className="text-sm text-slate-500">before next step</span>
              </div>
            )}
            {step.type === 'send_email' && (
              <div>
                <label className="text-xs font-semibold text-slate-500 mb-1 block">Template</label>
                <select value={step.template_id ?? ''} onChange={e => onChange({ ...step, template_id: e.target.value })} className={`${inputCls} w-full`}>
                  <option value="">— Select template —</option>
                  {templates.map(t => <option key={t.id} value={t.id}>{t.name}</option>)}
                </select>
              </div>
            )}
            {step.type === 'condition' && (
              <div className="flex items-center gap-2 flex-wrap">
                <select value={step.condition_field ?? 'lead_status'} onChange={e => onChange({ ...step, condition_field: e.target.value })} className={inputCls}>
                  <option value="lead_status">Lead Status</option>
                  <option value="payment_status">Payment Status</option>
                  <option value="source_type">Source Type</option>
                </select>
                <select value={step.condition_op ?? 'eq'} onChange={e => onChange({ ...step, condition_op: e.target.value })} className={inputCls}>
                  <option value="eq">equals</option>
                  <option value="neq">does not equal</option>
                </select>
                <input value={step.condition_value ?? ''} onChange={e => onChange({ ...step, condition_value: e.target.value })} placeholder="Value" className={`${inputCls} min-w-24`} />
              </div>
            )}
            {step.type === 'tag' && (
              <div>
                <label className="text-xs font-semibold text-slate-500 mb-1 block">Tag Name</label>
                <input value={step.tag_name ?? ''} onChange={e => onChange({ ...step, tag_name: e.target.value })} className={`${inputCls} w-full`} placeholder="e.g. engaged-2026" />
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

function AutomationModal({ automation, templates, onClose, onSaved }: {
  automation?: EmAutomation | null;
  templates: EmTemplate[];
  onClose: () => void;
  onSaved: () => void;
}) {
  const [name, setName] = useState(automation?.name ?? '');
  const [trigger, setTrigger] = useState(automation?.trigger_type ?? 'form_submitted');
  const [steps, setSteps] = useState<AutomationStep[]>(automation?.flow_json?.steps ?? [defaultStep('delay'), defaultStep('send_email')]);
  const [saving, setSaving] = useState(false);

  const addStep = (type: AutomationStep['type']) => setSteps(s => [...s, defaultStep(type)]);
  const removeStep = (id: string) => setSteps(s => s.filter(x => x.id !== id));
  const updateStep = (s: AutomationStep) => setSteps(prev => prev.map(x => x.id === s.id ? s : x));
  const moveStep = (id: string, dir: -1 | 1) => setSteps(prev => {
    const idx = prev.findIndex(x => x.id === id);
    if (idx < 0) return prev;
    const next = idx + dir;
    if (next < 0 || next >= prev.length) return prev;
    const arr = [...prev];
    [arr[idx], arr[next]] = [arr[next], arr[idx]];
    return arr;
  });

  const handleSave = async () => {
    if (!name) return;
    setSaving(true);
    try {
      const payload = { name, trigger_type: trigger, flow_json: { steps } };
      if (automation?.id) await emApi.put(`automations/${automation.id}`, payload);
      else await emApi.post('automations', payload);
      onSaved(); onClose();
    } catch (e: any) { alert(e.message); } finally { setSaving(false); }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
          <h3 className="text-base font-semibold text-slate-900">{automation ? 'Edit Automation' : 'New Automation'}</h3>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
        </div>

        <div className="flex-1 overflow-y-auto p-6 space-y-5">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Automation Name *</label>
              <input value={name} onChange={e => setName(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500" />
            </div>
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Trigger</label>
              <select value={trigger} onChange={e => setTrigger(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white">
                {TRIGGER_TYPES.map(t => <option key={t.value} value={t.value}>{t.label}</option>)}
              </select>
            </div>
          </div>

          <div>
            <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-4">Flow Steps</p>
            <div>
              {steps.map((step, idx) => (
                <StepCard key={step.id} step={step} idx={idx} total={steps.length} templates={templates}
                  onChange={updateStep} onRemove={() => removeStep(step.id)} onMove={dir => moveStep(step.id, dir)} />
              ))}
            </div>
            <div className="flex gap-2 mt-2 flex-wrap">
              {STEP_TYPES.map(({ type, label, color }) => (
                <button key={type} onClick={() => addStep(type)} className={`text-xs font-medium px-3 py-1.5 rounded-lg border ${color} hover:opacity-80 transition-opacity`}>
                  + {label}
                </button>
              ))}
            </div>
          </div>
        </div>

        <div className="flex gap-2 px-6 py-4 border-t border-slate-100">
          <button onClick={handleSave} disabled={saving || !name} className="flex-1 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">
            {saving ? 'Saving...' : automation ? 'Save Changes' : 'Create Automation'}
          </button>
          <button onClick={onClose} className="px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
        </div>
      </div>
    </div>
  );
}

export default function EmAutomationsPage() {
  const [automations, setAutomations] = useState<EmAutomation[]>([]);
  const [templates, setTemplates] = useState<EmTemplate[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [modal, setModal] = useState<'create' | EmAutomation | null>(null);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  const load = async () => {
    setLoading(true); setError(null);
    try {
      const [aRes, tRes] = await Promise.all([emApi.get('automations'), emApi.get('templates')]);
      setAutomations(aRes.automations ?? []);
      setTemplates(tRes.templates ?? []);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  const handleDelete = async (id: string) => {
    try { await emApi.delete(`automations/${id}`); setDeleteId(null); load(); }
    catch (e: any) { alert(e.message); }
  };

  const toggleStatus = async (a: EmAutomation) => {
    const newStatus = a.status === 'active' ? 'paused' : 'active';
    try { await emApi.put(`automations/${a.id}`, { status: newStatus }); load(); }
    catch (e: any) { alert(e.message); }
  };

  const triggerLabel = (t: string) => TRIGGER_TYPES.find(x => x.value === t)?.label ?? t;

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Automations">
      {modal && <AutomationModal automation={modal === 'create' ? null : modal} templates={templates} onClose={() => setModal(null)} onSaved={load} />}

      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setDeleteId(null)} />
          <div className="relative bg-white rounded-2xl p-6 shadow-2xl w-full max-w-sm">
            <h3 className="font-semibold text-slate-900 mb-2">Delete automation?</h3>
            <p className="text-sm text-slate-500 mb-4">Active enrollments will stop processing.</p>
            <div className="flex gap-2">
              <button onClick={() => handleDelete(deleteId)} className="flex-1 py-2 bg-red-600 text-white text-sm font-medium rounded-lg hover:bg-red-700">Delete</button>
              <button onClick={() => setDeleteId(null)} className="px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
            </div>
          </div>
        </div>
      )}

      <div className="space-y-4">
        <div className="flex items-center justify-between">
          <div />
          <button onClick={() => setModal('create')} className="flex items-center gap-1.5 px-3 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">
            <Plus className="w-3.5 h-3.5" /> New Automation
          </button>
        </div>

        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}

        {loading ? (
          <div className="space-y-3">{[...Array(3)].map((_, i) => <div key={i} className="h-28 bg-white border border-slate-200 rounded-xl animate-pulse" />)}</div>
        ) : !automations.length ? (
          <div className="text-center py-16 bg-white rounded-xl border border-slate-200">
            <Zap className="w-8 h-8 mx-auto mb-2 text-slate-300" />
            <p className="text-sm font-medium text-slate-600 mb-1">No automations yet</p>
            <p className="text-xs text-slate-400 mb-4">Build drip sequences that run on autopilot</p>
            <button onClick={() => setModal('create')} className="px-4 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">Create First Automation</button>
          </div>
        ) : (
          <div className="space-y-3">
            {automations.map(a => (
              <div key={a.id} className="bg-white rounded-xl border border-slate-200 p-5 hover:border-sky-200 transition-colors group">
                <div className="flex items-start justify-between">
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 flex-wrap">
                      <h3 className="text-sm font-semibold text-slate-900">{a.name}</h3>
                      <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[a.status] ?? 'bg-slate-100 text-slate-600'}`}>{a.status}</span>
                    </div>
                    <p className="text-xs text-slate-400 mt-0.5">Trigger: {triggerLabel(a.trigger_type)}</p>
                  </div>
                  <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                    <button onClick={() => toggleStatus(a)} className={`p-1.5 rounded-lg transition-colors ${a.status === 'active' ? 'hover:bg-amber-50 text-amber-500' : 'hover:bg-emerald-50 text-emerald-500'}`} title={a.status === 'active' ? 'Pause' : 'Activate'}>
                      {a.status === 'active' ? <Pause className="w-3.5 h-3.5" /> : <Play className="w-3.5 h-3.5" />}
                    </button>
                    <button onClick={() => setModal(a)} className="p-1.5 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600"><Edit2 className="w-3.5 h-3.5" /></button>
                    <button onClick={() => setDeleteId(a.id)} className="p-1.5 rounded-lg hover:bg-red-50 text-slate-400 hover:text-red-500"><Trash2 className="w-3.5 h-3.5" /></button>
                  </div>
                </div>
                <div className="flex items-center gap-4 mt-3 pt-3 border-t border-slate-50">
                  <div className="flex items-center gap-1.5 text-xs text-slate-500">
                    <Users className="w-3.5 h-3.5 text-slate-400" />
                    <span className="font-semibold text-slate-700">{a.enrolled_count.toLocaleString()}</span> enrolled
                  </div>
                  <div className="flex items-center gap-1.5 text-xs text-slate-500">
                    <CheckCircle className="w-3.5 h-3.5 text-emerald-400" />
                    <span className="font-semibold text-slate-700">{a.completed_count.toLocaleString()}</span> completed
                  </div>
                  <div className="flex items-center gap-1.5 text-xs text-slate-500 ml-auto">
                    <Clock className="w-3.5 h-3.5 text-slate-300" />
                    {(a.flow_json?.steps?.length ?? 0)} steps
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
