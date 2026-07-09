import { useEffect, useState } from 'react';
import { Plus, Trash2, Edit2, Filter, Users, RefreshCw, AlertCircle, X, ChevronDown } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmSegment } from '../../hooks/useEmailMarketing';

const FIELD_OPTIONS = [
  { value: 'lead_status', label: 'Lead Status' },
  { value: 'source_type', label: 'Source Type' },
  { value: 'payment_status', label: 'Payment Status' },
  { value: 'checkout_status', label: 'Checkout Status' },
  { value: 'state_name', label: 'State' },
  { value: 'created_at', label: 'Created At' },
  { value: 'last_action_at', label: 'Last Action' },
];

const OPERATOR_OPTIONS: Record<string, { value: string; label: string }[]> = {
  default: [
    { value: 'eq', label: 'equals' },
    { value: 'neq', label: 'does not equal' },
    { value: 'contains', label: 'contains' },
    { value: 'is_null', label: 'is empty' },
  ],
  date: [
    { value: 'gt', label: 'after' },
    { value: 'lt', label: 'before' },
    { value: 'is_null', label: 'is empty' },
  ],
};

function RuleRow({ rule, onChange, onRemove }: { rule: any; onChange: (r: any) => void; onRemove: () => void }) {
  const isDate = rule.field === 'created_at' || rule.field === 'last_action_at';
  const ops = isDate ? OPERATOR_OPTIONS.date : OPERATOR_OPTIONS.default;
  return (
    <div className="flex items-center gap-2 flex-wrap">
      <select value={rule.field} onChange={e => onChange({ ...rule, field: e.target.value })} className="text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 bg-white focus:ring-2 focus:ring-sky-500">
        {FIELD_OPTIONS.map(f => <option key={f.value} value={f.value}>{f.label}</option>)}
      </select>
      <select value={rule.operator} onChange={e => onChange({ ...rule, operator: e.target.value })} className="text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 bg-white focus:ring-2 focus:ring-sky-500">
        {ops.map(o => <option key={o.value} value={o.value}>{o.label}</option>)}
      </select>
      {rule.operator !== 'is_null' && (
        <input type={isDate ? 'date' : 'text'} value={rule.value} onChange={e => onChange({ ...rule, value: e.target.value })} placeholder="Value" className="text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 focus:ring-2 focus:ring-sky-500 min-w-28" />
      )}
      <button onClick={onRemove} className="p-1.5 rounded-lg text-red-400 hover:bg-red-50 transition-colors"><X className="w-3.5 h-3.5" /></button>
    </div>
  );
}

function SegmentModal({ segment, onClose, onSaved }: { segment?: EmSegment | null; onClose: () => void; onSaved: () => void }) {
  const [name, setName] = useState(segment?.name ?? '');
  const [desc, setDesc] = useState(segment?.description ?? '');
  const [groups, setGroups] = useState<any[]>(segment?.rules_json?.groups ?? [{ operator: 'AND', rules: [{ field: 'lead_status', operator: 'eq', value: 'new' }] }]);
  const [rootOp, setRootOp] = useState(segment?.rules_json?.operator ?? 'AND');
  const [saving, setSaving] = useState(false);
  const [estimating, setEstimating] = useState(false);
  const [estimate, setEstimate] = useState<number | null>(null);

  const addGroup = () => setGroups(g => [...g, { operator: 'AND', rules: [{ field: 'lead_status', operator: 'eq', value: 'new' }] }]);
  const removeGroup = (gi: number) => setGroups(g => g.filter((_, i) => i !== gi));
  const addRule = (gi: number) => setGroups(g => g.map((grp, i) => i === gi ? { ...grp, rules: [...grp.rules, { field: 'lead_status', operator: 'eq', value: 'new' }] } : grp));
  const removeRule = (gi: number, ri: number) => setGroups(g => g.map((grp, i) => i === gi ? { ...grp, rules: grp.rules.filter((_: any, j: number) => j !== ri) } : grp));
  const updateRule = (gi: number, ri: number, rule: any) => setGroups(g => g.map((grp, i) => i === gi ? { ...grp, rules: grp.rules.map((r: any, j: number) => j === ri ? rule : r) } : grp));

  const getRulesJson = () => ({ operator: rootOp, groups });

  const handleEstimate = async () => {
    if (!segment?.id) return;
    setEstimating(true);
    try {
      const res = await emApi.get(`segments/${segment.id}/estimate`);
      setEstimate(res.count);
    } catch { } finally { setEstimating(false); }
  };

  const handleSave = async () => {
    if (!name) return;
    setSaving(true);
    try {
      const payload = { name, description: desc, rules_json: getRulesJson() };
      if (segment?.id) await emApi.put(`segments/${segment.id}`, payload);
      else await emApi.post('segments', payload);
      onSaved();
      onClose();
    } catch (e: any) { alert(e.message); } finally { setSaving(false); }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
          <h3 className="text-base font-semibold text-slate-900">{segment ? 'Edit Segment' : 'New Segment'}</h3>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
        </div>

        <div className="flex-1 overflow-y-auto p-6 space-y-5">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Name *</label>
              <input value={name} onChange={e => setName(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500" />
            </div>
            <div>
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Description</label>
              <input value={desc} onChange={e => setDesc(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500" />
            </div>
          </div>

          <div>
            <div className="flex items-center gap-2 mb-3">
              <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Contacts match</label>
              <select value={rootOp} onChange={e => setRootOp(e.target.value)} className="text-sm border border-slate-200 rounded-lg px-2.5 py-1 bg-white font-semibold text-sky-600">
                <option value="AND">ALL</option>
                <option value="OR">ANY</option>
              </select>
              <span className="text-xs text-slate-500">of the following groups</span>
            </div>

            <div className="space-y-3">
              {groups.map((grp, gi) => (
                <div key={gi} className="bg-slate-50 rounded-xl p-4 border border-slate-200">
                  <div className="flex items-center justify-between mb-3">
                    <div className="flex items-center gap-2">
                      <span className="text-xs font-semibold text-slate-500">Group {gi + 1} — match</span>
                      <select value={grp.operator} onChange={e => setGroups(g => g.map((gr, i) => i === gi ? { ...gr, operator: e.target.value } : gr))} className="text-xs border border-slate-200 rounded px-2 py-0.5 bg-white font-semibold text-sky-600">
                        <option value="AND">ALL</option>
                        <option value="OR">ANY</option>
                      </select>
                    </div>
                    {groups.length > 1 && <button onClick={() => removeGroup(gi)} className="text-red-400 hover:text-red-600 text-xs">Remove group</button>}
                  </div>
                  <div className="space-y-2">
                    {grp.rules.map((rule: any, ri: number) => (
                      <RuleRow key={ri} rule={rule} onChange={r => updateRule(gi, ri, r)} onRemove={() => removeRule(gi, ri)} />
                    ))}
                  </div>
                  <button onClick={() => addRule(gi)} className="mt-2 text-xs text-sky-600 hover:text-sky-700 font-medium">+ Add rule</button>
                </div>
              ))}
            </div>
            <button onClick={addGroup} className="mt-3 text-xs text-slate-500 hover:text-slate-700 border border-dashed border-slate-300 rounded-lg px-3 py-2 w-full hover:bg-slate-50 transition-colors">+ Add group</button>
          </div>

          {segment?.id && (
            <div className="flex items-center gap-3 p-3 bg-sky-50 rounded-lg border border-sky-200">
              <button onClick={handleEstimate} disabled={estimating} className="text-xs text-sky-700 font-medium hover:text-sky-900 flex items-center gap-1">
                <Users className="w-3.5 h-3.5" />{estimating ? 'Estimating...' : 'Estimate count'}
              </button>
              {estimate !== null && <span className="text-xs font-bold text-sky-700">{estimate.toLocaleString()} contacts match</span>}
            </div>
          )}
        </div>

        <div className="flex gap-2 px-6 py-4 border-t border-slate-100">
          <button onClick={handleSave} disabled={saving || !name} className="flex-1 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">{saving ? 'Saving...' : segment ? 'Save Changes' : 'Create Segment'}</button>
          <button onClick={onClose} className="px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
        </div>
      </div>
    </div>
  );
}

export default function EmSegmentsPage() {
  const [segments, setSegments] = useState<EmSegment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [modal, setModal] = useState<'create' | EmSegment | null>(null);
  const [deleteId, setDeleteId] = useState<string | null>(null);

  const load = async () => {
    setLoading(true);
    setError(null);
    try {
      const res = await emApi.get('segments');
      setSegments(res.segments ?? []);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  const handleDelete = async (id: string) => {
    try {
      await emApi.delete(`segments/${id}`);
      setDeleteId(null);
      load();
    } catch (e: any) { alert(e.message); }
  };

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Segments">
      {modal && <SegmentModal segment={modal === 'create' ? null : modal} onClose={() => setModal(null)} onSaved={load} />}

      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setDeleteId(null)} />
          <div className="relative bg-white rounded-2xl p-6 shadow-2xl w-full max-w-sm">
            <h3 className="font-semibold text-slate-900 mb-2">Delete segment?</h3>
            <p className="text-sm text-slate-500 mb-4">This will not affect existing campaigns that used this segment.</p>
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
          <button onClick={() => setModal('create')} className="flex items-center gap-1.5 px-3 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 transition-colors">
            <Plus className="w-3.5 h-3.5" /> New Segment
          </button>
        </div>

        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">{[...Array(4)].map((_, i) => <div key={i} className="h-28 bg-white border border-slate-200 rounded-xl animate-pulse" />)}</div>
        ) : !segments.length ? (
          <div className="text-center py-16 bg-white rounded-xl border border-slate-200">
            <Filter className="w-8 h-8 mx-auto mb-2 text-slate-300" />
            <p className="text-sm font-medium text-slate-600 mb-1">No segments yet</p>
            <p className="text-xs text-slate-400 mb-4">Create segments to target specific audiences</p>
            <button onClick={() => setModal('create')} className="px-4 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">Create First Segment</button>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {segments.map(seg => (
              <div key={seg.id} className="bg-white rounded-xl border border-slate-200 p-5 hover:border-sky-200 transition-colors group">
                <div className="flex items-start justify-between">
                  <div className="flex-1 min-w-0">
                    <h3 className="text-sm font-semibold text-slate-900 truncate">{seg.name}</h3>
                    {seg.description && <p className="text-xs text-slate-400 mt-0.5 truncate">{seg.description}</p>}
                  </div>
                  <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                    <button onClick={() => setModal(seg)} className="p-1.5 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600"><Edit2 className="w-3.5 h-3.5" /></button>
                    <button onClick={() => setDeleteId(seg.id)} className="p-1.5 rounded-lg hover:bg-red-50 text-slate-400 hover:text-red-500"><Trash2 className="w-3.5 h-3.5" /></button>
                  </div>
                </div>
                <div className="flex items-center gap-3 mt-3 pt-3 border-t border-slate-50">
                  <div className="flex items-center gap-1.5 text-xs text-slate-500">
                    <Users className="w-3.5 h-3.5 text-slate-400" />
                    <span className="font-semibold text-slate-700">{(seg.estimated_count ?? 0).toLocaleString()}</span> contacts
                  </div>
                  <span className="text-slate-200">|</span>
                  <span className="text-xs text-slate-400">{(seg.rules_json?.groups?.length ?? 0)} group{seg.rules_json?.groups?.length !== 1 ? 's' : ''}</span>
                  {seg.estimated_count_updated_at && <span className="text-xs text-slate-300 ml-auto">Est. {new Date(seg.estimated_count_updated_at).toLocaleDateString()}</span>}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </EmailModuleLayout>
  );
}
