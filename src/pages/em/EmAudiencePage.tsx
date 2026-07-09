import { useEffect, useState, useCallback } from 'react';
import { Search, Plus, X, ChevronLeft, ChevronRight, Mail, MapPin, Clock, Tag, AlertCircle, ExternalLink, Upload, Send, CheckSquare, Square, Eye, MousePointer, UserX } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmContact, LEAD_STATUSES, SOURCE_TYPES, STATUS_COLORS } from '../../hooks/useEmailMarketing';
import ImportContactsModal from '../../components/em/ImportContactsModal';
import QuickSendModal from '../../components/em/QuickSendModal';

const PAGE_SIZE = 50;

const TIMELINE_ICONS: Record<string, React.ReactNode> = {
  email_sent:    <Mail className="w-3.5 h-3.5 text-sky-500" />,
  email_open:    <Eye className="w-3.5 h-3.5 text-sky-400" />,
  email_click:   <MousePointer className="w-3.5 h-3.5 text-emerald-500" />,
  unsubscribed:  <UserX className="w-3.5 h-3.5 text-red-400" />,
  form_submit:   <Send className="w-3.5 h-3.5 text-slate-400" />,
  open:          <Eye className="w-3.5 h-3.5 text-sky-400" />,
  click:         <MousePointer className="w-3.5 h-3.5 text-emerald-500" />,
  unsub:         <UserX className="w-3.5 h-3.5 text-red-400" />,
};

function ContactDrawer({ contact, onClose, onUpdate }: { contact: EmContact; onClose: () => void; onUpdate: () => void }) {
  const [detail, setDetail] = useState<any>(null);
  const [timeline, setTimeline] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState(false);
  const [form, setForm] = useState<Partial<EmContact>>({});
  const [saving, setSaving] = useState(false);
  const [tab, setTab] = useState<'profile' | 'timeline' | 'emails'>('profile');
  const [showQuickSend, setShowQuickSend] = useState(false);

  useEffect(() => {
    Promise.all([
      emApi.get(`contacts/${contact.id}`),
      emApi.get(`contacts/${contact.id}/timeline`),
    ]).then(([contactRes, tlRes]) => {
      setDetail(contactRes);
      setForm(contactRes.contact);
      setTimeline(tlRes.timeline ?? []);
    }).catch(() => {}).finally(() => setLoading(false));
  }, [contact.id]);

  const handleSave = async () => {
    setSaving(true);
    try {
      await emApi.put(`contacts/${contact.id}`, form);
      onUpdate();
      setEditing(false);
    } catch (e: any) {
      alert(e.message);
    } finally {
      setSaving(false);
    }
  };

  const formatDate = (iso: string | null) => iso ? new Date(iso).toLocaleString() : '—';

  return (
    <>
      {showQuickSend && (
        <QuickSendModal contacts={[contact]} onClose={() => setShowQuickSend(false)} />
      )}
      <div className="fixed inset-0 z-40 flex justify-end">
        <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={onClose} />
        <aside className="relative flex flex-col w-full max-w-lg bg-white shadow-2xl h-full overflow-hidden">
          <div className="flex items-center justify-between px-5 py-4 border-b border-slate-100">
            <div>
              <p className="font-semibold text-slate-900">
                {contact.first_name || contact.last_name
                  ? `${contact.first_name ?? ''} ${contact.last_name ?? ''}`.trim()
                  : contact.email}
              </p>
              <p className="text-xs text-slate-400">{contact.email}</p>
            </div>
            <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600">
              <X className="w-4 h-4" />
            </button>
          </div>

          <div className="flex border-b border-slate-100 px-5">
            {(['profile', 'timeline', 'emails'] as const).map(t => (
              <button
                key={t}
                onClick={() => setTab(t)}
                className={`py-2.5 px-1 mr-4 text-xs font-semibold capitalize border-b-2 transition-colors ${tab === t ? 'border-sky-500 text-sky-600' : 'border-transparent text-slate-500 hover:text-slate-700'}`}
              >
                {t === 'emails' ? 'Emails' : t === 'timeline' ? `Timeline${timeline.length ? ` (${timeline.length})` : ''}` : t}
              </button>
            ))}
          </div>

          <div className="flex-1 overflow-y-auto p-5">
            {loading ? (
              <div className="animate-pulse space-y-3">
                {[...Array(4)].map((_, i) => <div key={i} className="h-8 bg-slate-100 rounded" />)}
              </div>
            ) : (
              <>
                {tab === 'profile' && (
                  <div className="space-y-4">
                    <div className="grid grid-cols-2 gap-3">
                      {[
                        { label: 'Lead Status', key: 'lead_status', type: 'select', options: LEAD_STATUSES },
                        { label: 'Source', key: 'source_type', type: 'select', options: SOURCE_TYPES },
                        { label: 'First Name', key: 'first_name', type: 'text' },
                        { label: 'Last Name', key: 'last_name', type: 'text' },
                        { label: 'Company', key: 'company_name', type: 'text' },
                        { label: 'State', key: 'state_name', type: 'text' },
                      ].map(({ label, key, type, options }) => (
                        <div key={key}>
                          <label className="text-[10px] font-semibold text-slate-400 uppercase tracking-wide">{label}</label>
                          {editing ? (
                            type === 'select' ? (
                              <select
                                value={(form as any)[key] ?? ''}
                                onChange={e => setForm(f => ({ ...f, [key]: e.target.value }))}
                                className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
                              >
                                {(options as readonly string[]).map(o => <option key={o} value={o}>{o}</option>)}
                              </select>
                            ) : (
                              <input
                                type="text"
                                value={(form as any)[key] ?? ''}
                                onChange={e => setForm(f => ({ ...f, [key]: e.target.value }))}
                                className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-2.5 py-1.5 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
                              />
                            )
                          ) : (
                            <p className="text-sm text-slate-700 mt-1">
                              {(detail?.contact as any)?.[key]
                                ? <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[(detail?.contact as any)[key]] ?? 'bg-slate-100 text-slate-600'}`}>{(detail?.contact as any)[key]}</span>
                                : '—'}
                            </p>
                          )}
                        </div>
                      ))}
                    </div>

                    <div className="bg-slate-50 rounded-xl p-3 space-y-2 text-xs">
                      <div className="flex items-center gap-2 text-slate-600"><Mail className="w-3.5 h-3.5 text-slate-400" />{contact.email}</div>
                      {contact.state_name && <div className="flex items-center gap-2 text-slate-600"><MapPin className="w-3.5 h-3.5 text-slate-400" />{contact.state_name}</div>}
                      <div className="flex items-center gap-2 text-slate-600"><Clock className="w-3.5 h-3.5 text-slate-400" />Added {formatDate(contact.created_at)}</div>
                      {contact.last_action_at && <div className="flex items-center gap-2 text-slate-600"><Clock className="w-3.5 h-3.5 text-slate-400" />Last action {formatDate(contact.last_action_at)}</div>}
                    </div>

                    {editing && (
                      <div className="flex gap-2">
                        <button onClick={handleSave} disabled={saving} className="flex-1 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50 transition-colors">
                          {saving ? 'Saving...' : 'Save Changes'}
                        </button>
                        <button onClick={() => setEditing(false)} className="px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
                      </div>
                    )}
                  </div>
                )}

                {tab === 'timeline' && (
                  <div className="space-y-2">
                    {!timeline.length ? (
                      <p className="text-sm text-slate-400 text-center py-8">No activity yet</p>
                    ) : timeline.map((ev: any) => {
                      const icon = TIMELINE_ICONS[ev.type] ?? <div className="w-2 h-2 rounded-full bg-slate-300 mt-0.5 shrink-0" />;
                      const label = ev.type.replace(/_/g, ' ');
                      const meta = ev.meta ?? {};
                      return (
                        <div key={ev.id} className="flex items-start gap-3 p-3 bg-slate-50 rounded-lg">
                          <div className="shrink-0 mt-0.5">{icon}</div>
                          <div className="flex-1 min-w-0">
                            <p className="text-xs font-semibold text-slate-700 capitalize">{label}</p>
                            {ev.kind === 'funnel' && meta.subject && (
                              <p className="text-xs text-slate-400 truncate">{meta.subject}</p>
                            )}
                            {ev.kind === 'funnel' && meta.form_type && (
                              <p className="text-xs text-slate-400">{meta.form_type}{meta.state_name ? ` · ${meta.state_name}` : ''}</p>
                            )}
                            {ev.url && (
                              <p className="text-xs text-slate-400 truncate">{ev.url}</p>
                            )}
                            {ev.kind === 'funnel' && meta.status && (
                              <span className={`inline-flex items-center text-xs px-1.5 py-0.5 rounded-full mt-0.5 ${STATUS_COLORS[meta.status] ?? 'bg-slate-100 text-slate-600'}`}>{meta.status}</span>
                            )}
                            <p className="text-xs text-slate-400 mt-0.5">{formatDate(ev.created_at)}</p>
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}

                {tab === 'emails' && (
                  <div className="space-y-2">
                    {!detail?.messages?.length ? (
                      <p className="text-sm text-slate-400 text-center py-8">No emails sent yet</p>
                    ) : detail.messages.map((msg: any) => {
                      const msgEvents: any[] = detail.email_events?.filter((e: any) => e.message_id === msg.id) ?? [];
                      const opens = msgEvents.filter((e: any) => e.event_type === 'open').length;
                      const clicks = msgEvents.filter((e: any) => e.event_type === 'click').length;
                      return (
                        <div key={msg.id} className="p-3 bg-slate-50 rounded-lg">
                          <div className="flex items-center justify-between">
                            <p className="text-xs font-semibold text-slate-700 truncate">{msg.subject_rendered || '(no subject)'}</p>
                            <span className={`text-xs px-2 py-0.5 rounded-full ml-2 shrink-0 ${STATUS_COLORS[msg.status] ?? 'bg-slate-100 text-slate-600'}`}>{msg.status}</span>
                          </div>
                          <div className="flex items-center gap-3 mt-1.5">
                            <p className="text-xs text-slate-400">{msg.sent_at ? formatDate(msg.sent_at) : 'Not sent'}</p>
                            {opens > 0 && <span className="flex items-center gap-1 text-xs text-sky-600"><Eye className="w-3 h-3" />{opens}</span>}
                            {clicks > 0 && <span className="flex items-center gap-1 text-xs text-emerald-600"><MousePointer className="w-3 h-3" />{clicks}</span>}
                          </div>
                          {msg.error && <p className="text-xs text-red-500 mt-1 truncate">{msg.error}</p>}
                        </div>
                      );
                    })}
                  </div>
                )}
              </>
            )}
          </div>

          <div className="px-5 py-4 border-t border-slate-100 flex gap-2">
            {!editing && (
              <button onClick={() => setEditing(true)} className="flex-1 py-2 text-sm font-medium text-slate-700 border border-slate-200 rounded-lg hover:bg-slate-50 transition-colors">
                Edit
              </button>
            )}
            <button
              onClick={() => setShowQuickSend(true)}
              className="flex items-center gap-1.5 px-4 py-2 text-sm font-medium bg-sky-600 text-white rounded-lg hover:bg-sky-700 transition-colors"
            >
              <Send className="w-3.5 h-3.5" /> Quick Email
            </button>
            <button
              onClick={() => window.open(`mailto:${contact.email}`)}
              className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50"
            >
              <ExternalLink className="w-3.5 h-3.5" />
            </button>
          </div>
        </aside>
      </div>
    </>
  );
}

export default function EmAudiencePage() {
  const [contacts, setContacts] = useState<EmContact[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(0);
  const [search, setSearch] = useState('');
  const [leadStatus, setLeadStatus] = useState('');
  const [sourceType, setSourceType] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedContact, setSelectedContact] = useState<EmContact | null>(null);
  const [showAddModal, setShowAddModal] = useState(false);
  const [showImportModal, setShowImportModal] = useState(false);
  const [newEmail, setNewEmail] = useState('');
  const [newFirst, setNewFirst] = useState('');
  const [newLast, setNewLast] = useState('');
  const [adding, setAdding] = useState(false);
  const [selectedIds, setSelectedIds] = useState<Set<string>>(new Set());
  const [showBulkSend, setShowBulkSend] = useState(false);
  const [quickSendContact, setQuickSendContact] = useState<EmContact | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const params = new URLSearchParams({ limit: String(PAGE_SIZE), offset: String(page * PAGE_SIZE) });
      if (search) params.set('search', search);
      if (leadStatus) params.set('lead_status', leadStatus);
      if (sourceType) params.set('source_type', sourceType);
      const res = await emApi.get(`contacts?${params}`);
      setContacts(res.contacts ?? []);
      setTotal(res.total ?? 0);
    } catch (e: any) {
      const msg = e.message || '';
      if (msg.includes('AUTH_REQUIRED') || msg.includes('session_expired') || msg.includes('401')) {
        setError('Please log in again — your admin session has expired (AUTH_REQUIRED).');
      } else {
        setError(msg || 'Failed to load contacts');
      }
    } finally {
      setLoading(false);
    }
  }, [page, search, leadStatus, sourceType]);

  useEffect(() => { load(); }, [load]);
  useEffect(() => { setSelectedIds(new Set()); }, [page, search, leadStatus, sourceType]);

  const handleAdd = async () => {
    if (!newEmail) return;
    setAdding(true);
    try {
      await emApi.post('contacts', { email: newEmail, first_name: newFirst, last_name: newLast });
      setShowAddModal(false);
      setNewEmail(''); setNewFirst(''); setNewLast('');
      load();
    } catch (e: any) {
      alert(e.message);
    } finally {
      setAdding(false);
    }
  };

  const toggleSelect = (id: string, e: React.MouseEvent) => {
    e.stopPropagation();
    setSelectedIds(prev => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  const toggleSelectAll = (e: React.MouseEvent) => {
    e.stopPropagation();
    if (selectedIds.size === contacts.length) {
      setSelectedIds(new Set());
    } else {
      setSelectedIds(new Set(contacts.map(c => c.id)));
    }
  };

  const selectedContacts = contacts.filter(c => selectedIds.has(c.id));
  const allSelected = contacts.length > 0 && selectedIds.size === contacts.length;
  const totalPages = Math.ceil(total / PAGE_SIZE);

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Audience">
      {selectedContact && (
        <ContactDrawer
          contact={selectedContact}
          onClose={() => setSelectedContact(null)}
          onUpdate={() => { setSelectedContact(null); load(); }}
        />
      )}

      {showBulkSend && selectedContacts.length > 0 && (
        <QuickSendModal
          contacts={selectedContacts}
          onClose={() => setShowBulkSend(false)}
        />
      )}

      {quickSendContact && (
        <QuickSendModal
          contacts={[quickSendContact]}
          onClose={() => setQuickSendContact(null)}
        />
      )}

      {showImportModal && (
        <ImportContactsModal
          onClose={() => setShowImportModal(false)}
          onImported={() => { setShowImportModal(false); load(); }}
        />
      )}

      {showAddModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setShowAddModal(false)} />
          <div className="relative bg-white rounded-2xl shadow-2xl p-6 w-full max-w-sm">
            <h3 className="text-base font-semibold text-slate-900 mb-4">Add Contact</h3>
            <div className="space-y-3">
              <input
                placeholder="Email *"
                value={newEmail}
                onChange={e => setNewEmail(e.target.value)}
                className="w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent"
              />
              <div className="grid grid-cols-2 gap-2">
                <input placeholder="First name" value={newFirst} onChange={e => setNewFirst(e.target.value)} className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent" />
                <input placeholder="Last name" value={newLast} onChange={e => setNewLast(e.target.value)} className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent" />
              </div>
            </div>
            <div className="flex gap-2 mt-4">
              <button onClick={handleAdd} disabled={adding || !newEmail} className="flex-1 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">
                {adding ? 'Adding...' : 'Add Contact'}
              </button>
              <button onClick={() => setShowAddModal(false)} className="px-4 py-2 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
            </div>
          </div>
        </div>
      )}

      <div className="space-y-4">
        <div className="flex items-center gap-3 flex-wrap">
          <div className="relative flex-1 min-w-48">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400" />
            <input
              placeholder="Search by email, name, company..."
              value={search}
              onChange={e => { setSearch(e.target.value); setPage(0); }}
              className="w-full pl-9 pr-3 py-2 text-sm border border-slate-200 rounded-lg focus:ring-2 focus:ring-sky-500 focus:border-transparent"
            />
          </div>
          <select value={leadStatus} onChange={e => { setLeadStatus(e.target.value); setPage(0); }} className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white">
            <option value="">All Statuses</option>
            {LEAD_STATUSES.map(s => <option key={s} value={s}>{s}</option>)}
          </select>
          <select value={sourceType} onChange={e => { setSourceType(e.target.value); setPage(0); }} className="text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white">
            <option value="">All Sources</option>
            {SOURCE_TYPES.map(s => <option key={s} value={s}>{s}</option>)}
          </select>
          <div className="flex items-center gap-2">
            <button
              onClick={() => setShowImportModal(true)}
              className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-slate-700 border border-slate-200 rounded-lg hover:bg-slate-50 hover:border-slate-300 transition-colors"
            >
              <Upload className="w-3.5 h-3.5" /> Import
            </button>
            <button
              onClick={() => setShowAddModal(true)}
              className="flex items-center gap-1.5 px-3 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 transition-colors"
            >
              <Plus className="w-3.5 h-3.5" /> Add Contact
            </button>
          </div>
        </div>

        {selectedIds.size > 0 && (
          <div className="flex items-center gap-3 px-4 py-3 bg-sky-50 border border-sky-200 rounded-xl">
            <span className="text-sm font-medium text-sky-900">{selectedIds.size} selected</span>
            <div className="flex items-center gap-2 ml-auto">
              <button
                onClick={() => setShowBulkSend(true)}
                className="flex items-center gap-1.5 px-3 py-1.5 bg-sky-600 text-white text-sm font-medium rounded-lg hover:bg-sky-700 transition-colors"
              >
                <Send className="w-3.5 h-3.5" /> Quick Email ({selectedIds.size})
              </button>
              <button onClick={() => setSelectedIds(new Set())} className="p-1.5 rounded-lg hover:bg-sky-100 text-sky-600 transition-colors">
                <X className="w-3.5 h-3.5" />
              </button>
            </div>
          </div>
        )}

        {error && (
          <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700">
            <AlertCircle className="w-4 h-4 shrink-0" />{error}
          </div>
        )}

        <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="grid grid-cols-[40px_1fr_140px_120px_120px_100px_40px] gap-2 px-4 py-2.5 bg-slate-50 text-xs font-semibold text-slate-500 uppercase tracking-wide border-b border-slate-100">
            <div className="flex items-center">
              <button onClick={toggleSelectAll} className="text-slate-400 hover:text-slate-600 transition-colors">
                {allSelected ? <CheckSquare className="w-4 h-4 text-sky-600" /> : <Square className="w-4 h-4" />}
              </button>
            </div>
            <div>Contact</div>
            <div>Source</div>
            <div>Lead Status</div>
            <div>Payment</div>
            <div>Last Action</div>
            <div></div>
          </div>

          {loading && !contacts.length ? (
            <div className="divide-y divide-slate-50">
              {[...Array(8)].map((_, i) => (
                <div key={i} className="h-14 animate-pulse bg-slate-50/50 mx-4 my-1 rounded" />
              ))}
            </div>
          ) : !contacts.length ? (
            <div className="py-16 text-center text-slate-400">
              <Tag className="w-8 h-8 mx-auto mb-2 opacity-40" />
              <p className="text-sm font-medium">No contacts found</p>
              <p className="text-xs mt-1">Import a CSV or add contacts manually</p>
            </div>
          ) : (
            <div className="divide-y divide-slate-50">
              {contacts.map(c => {
                const isSelected = selectedIds.has(c.id);
                return (
                  <div
                    key={c.id}
                    onClick={() => setSelectedContact(c)}
                    className={`group grid grid-cols-[40px_1fr_140px_120px_120px_100px_40px] gap-2 px-4 py-3 hover:bg-slate-50 cursor-pointer transition-colors ${isSelected ? 'bg-sky-50/60' : ''}`}
                  >
                    <div className="flex items-center" onClick={e => toggleSelect(c.id, e)}>
                      {isSelected
                        ? <CheckSquare className="w-4 h-4 text-sky-600" />
                        : <Square className="w-4 h-4 text-slate-300 group-hover:text-slate-400 transition-colors" />
                      }
                    </div>
                    <div className="min-w-0">
                      <p className="text-sm font-medium text-slate-800 truncate">
                        {c.first_name || c.last_name
                          ? `${c.first_name ?? ''} ${c.last_name ?? ''}`.trim()
                          : c.email}
                      </p>
                      <p className="text-xs text-slate-400 truncate">{c.email}{c.company_name ? ` · ${c.company_name}` : ''}</p>
                    </div>
                    <div className="flex items-center">
                      <span className="text-xs text-slate-500 truncate">{c.source_type}</span>
                    </div>
                    <div className="flex items-center">
                      <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${STATUS_COLORS[c.lead_status] ?? 'bg-slate-100 text-slate-600'}`}>
                        {c.lead_status}
                      </span>
                    </div>
                    <div className="flex items-center">
                      <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${STATUS_COLORS[c.payment_status] ?? 'bg-slate-100 text-slate-600'}`}>
                        {c.payment_status}
                      </span>
                    </div>
                    <div className="flex items-center text-xs text-slate-400">
                      {c.last_action_at ? new Date(c.last_action_at).toLocaleDateString() : '—'}
                    </div>
                    <div className="flex items-center justify-center">
                      <button
                        onClick={e => { e.stopPropagation(); setQuickSendContact(c); }}
                        title="Quick Email"
                        className="opacity-0 group-hover:opacity-100 transition-opacity p-1.5 rounded-lg hover:bg-sky-100 text-slate-400 hover:text-sky-600"
                      >
                        <Mail className="w-3.5 h-3.5" />
                      </button>
                    </div>
                  </div>
                );
              })}
            </div>
          )}

          <div className="flex items-center justify-between px-4 py-3 border-t border-slate-100 bg-slate-50">
            <span className="text-xs text-slate-500">{total.toLocaleString()} contacts total</span>
            {totalPages > 1 && (
              <div className="flex items-center gap-2">
                <button onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40 hover:bg-white transition-colors">
                  <ChevronLeft className="w-4 h-4 text-slate-600" />
                </button>
                <span className="text-xs text-slate-600">Page {page + 1} of {totalPages}</span>
                <button onClick={() => setPage(p => Math.min(totalPages - 1, p + 1))} disabled={page >= totalPages - 1} className="p-1.5 rounded-lg border border-slate-200 disabled:opacity-40 hover:bg-white transition-colors">
                  <ChevronRight className="w-4 h-4 text-slate-600" />
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    </EmailModuleLayout>
  );
}
