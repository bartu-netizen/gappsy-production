import { useEffect, useState, useCallback } from 'react';
import { Plus, Trash2, Edit2, Eye, Copy, X, Layout, Monitor, Smartphone, ChevronUp, ChevronDown, AlignLeft, Type, MousePointer, Minus, Maximize2, Image, Share2, Columns, Clock, AlertCircle } from 'lucide-react';
import EmailModuleLayout from '../../components/wpadmin/EmailModuleLayout';
import { emApi, EmTemplate, TemplateBlock } from '../../hooks/useEmailMarketing';

const BLOCK_TYPES = [
  { type: 'header', label: 'Header', icon: Type },
  { type: 'text', label: 'Text', icon: AlignLeft },
  { type: 'button', label: 'Button', icon: MousePointer },
  { type: 'image', label: 'Image', icon: Image },
  { type: 'divider', label: 'Divider', icon: Minus },
  { type: 'spacer', label: 'Spacer', icon: Maximize2 },
  { type: 'footer', label: 'Footer', icon: Layout },
];

const VARIABLES = ['{{first_name}}', '{{last_name}}', '{{email}}', '{{company_name}}', '{{state_name}}', '{{unsubscribe_url}}'];

function generateId() {
  return Math.random().toString(36).slice(2, 10);
}

function defaultBlock(type: string): TemplateBlock {
  const id = generateId();
  switch (type) {
    case 'header': return { id, type: 'header', content: 'Your Headline Here' };
    case 'text': return { id, type: 'text', content: 'Write your message here. Use {{first_name}} for personalization.' };
    case 'button': return { id, type: 'button', label: 'Click Here', url: 'https://' };
    case 'image': return { id, type: 'image', src: '', alt: '' };
    case 'divider': return { id, type: 'divider' };
    case 'spacer': return { id, type: 'spacer', height: 24 };
    case 'footer': return { id, type: 'footer', content: '© 2026 Gappsy. You are receiving this because you opted in.\n{{unsubscribe_url}}' };
    default: return { id, type: type as any, content: '' };
  }
}

function renderBlockPreview(block: TemplateBlock, vars: Record<string, string> = {}): string {
  const sub = (s: string) => s.replace(/\{\{(\w+)\}\}/g, (_, k) => vars[k] ?? `{{${k}}}`);
  switch (block.type) {
    case 'header': return `<h1 style="font-family:sans-serif;font-size:24px;font-weight:700;color:#0f172a;margin:0 0 8px">${sub(block.content ?? '')}</h1>`;
    case 'text': return `<p style="font-family:sans-serif;font-size:15px;color:#334155;line-height:1.6;margin:0 0 16px;white-space:pre-line">${sub(block.content ?? '')}</p>`;
    case 'button': return `<div style="text-align:center;margin:20px 0"><a href="${block.url}" style="display:inline-block;background:#0ea5e9;color:#fff;font-family:sans-serif;font-size:14px;font-weight:600;padding:12px 28px;border-radius:8px;text-decoration:none">${sub(block.label ?? 'Click Here')}</a></div>`;
    case 'image': return block.src ? `<img src="${block.src}" alt="${block.alt ?? ''}" style="max-width:100%;height:auto;border-radius:8px;display:block;margin:0 auto 16px" />` : `<div style="background:#f1f5f9;border:2px dashed #cbd5e1;border-radius:8px;height:120px;display:flex;align-items:center;justify-content:center;color:#94a3b8;font-family:sans-serif;font-size:13px;margin-bottom:16px">Image placeholder</div>`;
    case 'divider': return `<hr style="border:none;border-top:1px solid #e2e8f0;margin:20px 0" />`;
    case 'spacer': return `<div style="height:${block.height ?? 24}px"></div>`;
    case 'footer': return `<p style="font-family:sans-serif;font-size:12px;color:#94a3b8;text-align:center;line-height:1.6;margin:0;white-space:pre-line">${sub(block.content ?? '')}</p>`;
    default: return '';
  }
}

function buildHtmlPreview(blocks: TemplateBlock[], subject: string): string {
  const blocksHtml = blocks.map(b => renderBlockPreview(b, { first_name: 'Alex', last_name: 'Johnson', email: 'alex@example.com', company_name: 'Acme Co', state_name: 'New Jersey', unsubscribe_url: '#unsubscribe' })).join('');
  return `<!DOCTYPE html><html><head><meta charset="utf-8"><title>${subject}</title></head><body style="margin:0;padding:0;background:#f8fafc"><div style="max-width:600px;margin:0 auto;background:#fff;padding:32px 40px;border-radius:12px;margin-top:24px;margin-bottom:24px">${blocksHtml}</div></body></html>`;
}

function BlockEditor({ block, onChange }: { block: TemplateBlock; onChange: (b: TemplateBlock) => void }) {
  const inputCls = 'w-full text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 focus:border-transparent';
  const labelCls = 'block text-xs font-semibold text-slate-500 uppercase tracking-wide mb-1';

  if (block.type === 'divider') return <p className="text-xs text-slate-400 italic">No settings for divider</p>;
  if (block.type === 'spacer') return (
    <div>
      <label className={labelCls}>Height (px)</label>
      <input type="number" value={block.height ?? 24} onChange={e => onChange({ ...block, height: +e.target.value })} className={inputCls} min={4} max={120} />
    </div>
  );
  if (block.type === 'button') return (
    <div className="space-y-3">
      <div><label className={labelCls}>Label</label><input value={block.label ?? ''} onChange={e => onChange({ ...block, label: e.target.value })} className={inputCls} /></div>
      <div><label className={labelCls}>URL</label><input value={block.url ?? ''} onChange={e => onChange({ ...block, url: e.target.value })} className={inputCls} /></div>
    </div>
  );
  if (block.type === 'image') return (
    <div className="space-y-3">
      <div><label className={labelCls}>Image URL</label><input value={block.src ?? ''} onChange={e => onChange({ ...block, src: e.target.value })} className={inputCls} placeholder="https://..." /></div>
      <div><label className={labelCls}>Alt text</label><input value={block.alt ?? ''} onChange={e => onChange({ ...block, alt: e.target.value })} className={inputCls} /></div>
    </div>
  );
  return (
    <div>
      <label className={labelCls}>Content</label>
      <textarea value={block.content ?? ''} onChange={e => onChange({ ...block, content: e.target.value })} className={`${inputCls} resize-none`} rows={block.type === 'footer' ? 4 : 6} />
    </div>
  );
}

function TemplateEditorModal({ template, onClose, onSaved }: { template?: EmTemplate | null; onClose: () => void; onSaved: () => void }) {
  const [name, setName] = useState(template?.name ?? '');
  const [subject, setSubject] = useState(template?.subject_template ?? '');
  const [preheader, setPreheader] = useState(template?.preheader_template ?? '');
  const [blocks, setBlocks] = useState<TemplateBlock[]>(template?.body_json?.blocks ?? [defaultBlock('header'), defaultBlock('text'), defaultBlock('button'), defaultBlock('footer')]);
  const [selected, setSelected] = useState<string | null>(null);
  const [preview, setPreview] = useState<'desktop' | 'mobile' | null>(null);
  const [saving, setSaving] = useState(false);

  const selectedBlock = blocks.find(b => b.id === selected) ?? null;

  const addBlock = (type: string) => {
    const b = defaultBlock(type);
    setBlocks(prev => [...prev, b]);
    setSelected(b.id);
  };

  const removeBlock = (id: string) => {
    setBlocks(prev => prev.filter(b => b.id !== id));
    if (selected === id) setSelected(null);
  };

  const moveBlock = (id: string, dir: -1 | 1) => {
    setBlocks(prev => {
      const idx = prev.findIndex(b => b.id === id);
      if (idx < 0) return prev;
      const next = idx + dir;
      if (next < 0 || next >= prev.length) return prev;
      const arr = [...prev];
      [arr[idx], arr[next]] = [arr[next], arr[idx]];
      return arr;
    });
  };

  const updateBlock = useCallback((b: TemplateBlock) => {
    setBlocks(prev => prev.map(x => x.id === b.id ? b : x));
  }, []);

  const handleSave = async () => {
    if (!name || !subject) return;
    setSaving(true);
    try {
      const payload = { name, subject_template: subject, preheader_template: preheader, body_json: { blocks } };
      if (template?.id) await emApi.put(`templates/${template.id}`, payload);
      else await emApi.post('templates', payload);
      onSaved();
      onClose();
    } catch (e: any) { alert(e.message); } finally { setSaving(false); }
  };

  const previewHtml = buildHtmlPreview(blocks, subject || 'Preview');

  return (
    <div className="fixed inset-0 z-50 flex items-stretch">
      <div className="absolute inset-0 bg-black/60" onClick={onClose} />
      <div className="relative flex w-full max-w-6xl mx-auto my-4 bg-white rounded-2xl shadow-2xl overflow-hidden flex-col">
        <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100 bg-white z-10">
          <h3 className="text-base font-semibold text-slate-900">{template ? 'Edit Template' : 'New Template'}</h3>
          <div className="flex items-center gap-2">
            <button onClick={() => setPreview(p => p === 'desktop' ? null : 'desktop')} className={`flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg border transition-colors ${preview === 'desktop' ? 'bg-sky-50 border-sky-200 text-sky-700' : 'border-slate-200 text-slate-500 hover:bg-slate-50'}`}>
              <Monitor className="w-3.5 h-3.5" /> Desktop
            </button>
            <button onClick={() => setPreview(p => p === 'mobile' ? null : 'mobile')} className={`flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium rounded-lg border transition-colors ${preview === 'mobile' ? 'bg-sky-50 border-sky-200 text-sky-700' : 'border-slate-200 text-slate-500 hover:bg-slate-50'}`}>
              <Smartphone className="w-3.5 h-3.5" /> Mobile
            </button>
            <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
          </div>
        </div>

        <div className="flex flex-1 overflow-hidden">
          <div className="w-64 border-r border-slate-100 bg-slate-50 flex flex-col overflow-y-auto">
            <div className="p-4 space-y-3 border-b border-slate-100">
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Template Name *</label>
                <input value={name} onChange={e => setName(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white" />
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Subject Line *</label>
                <input value={subject} onChange={e => setSubject(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white" />
              </div>
              <div>
                <label className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Preheader</label>
                <input value={preheader} onChange={e => setPreheader(e.target.value)} className="w-full mt-1 text-sm border border-slate-200 rounded-lg px-3 py-2 focus:ring-2 focus:ring-sky-500 bg-white" placeholder="Preview text..." />
              </div>
            </div>

            <div className="p-4 border-b border-slate-100">
              <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2">Add Block</p>
              <div className="grid grid-cols-2 gap-1.5">
                {BLOCK_TYPES.map(({ type, label, icon: Icon }) => (
                  <button key={type} onClick={() => addBlock(type)} className="flex flex-col items-center gap-1 p-2 bg-white border border-slate-200 rounded-lg hover:border-sky-300 hover:bg-sky-50 text-slate-600 hover:text-sky-700 transition-colors">
                    <Icon className="w-4 h-4" />
                    <span className="text-xs">{label}</span>
                  </button>
                ))}
              </div>
            </div>

            <div className="p-4 border-b border-slate-100">
              <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-2">Variables</p>
              <div className="flex flex-col gap-1">
                {VARIABLES.map(v => (
                  <button key={v} onClick={() => navigator.clipboard?.writeText(v)} className="text-left text-xs text-sky-600 font-mono hover:bg-sky-50 px-2 py-1 rounded" title="Click to copy">
                    {v}
                  </button>
                ))}
              </div>
            </div>

            {selectedBlock && (
              <div className="p-4">
                <p className="text-xs font-semibold text-slate-500 uppercase tracking-wide mb-3">Edit: {selectedBlock.type}</p>
                <BlockEditor block={selectedBlock} onChange={updateBlock} />
              </div>
            )}
          </div>

          <div className="flex-1 flex flex-col overflow-hidden">
            {preview ? (
              <div className={`flex-1 overflow-auto bg-slate-100 p-6 flex justify-center`}>
                <div className={preview === 'mobile' ? 'w-80' : 'w-full max-w-2xl'}>
                  <iframe srcDoc={previewHtml} className="w-full border-0 rounded-xl shadow-lg bg-white" style={{ minHeight: 600 }} title="Email preview" />
                </div>
              </div>
            ) : (
              <div className="flex-1 overflow-y-auto p-6 space-y-2">
                {blocks.map((block, idx) => (
                  <div key={block.id} onClick={() => setSelected(block.id)} className={`group relative rounded-xl border-2 transition-all cursor-pointer ${selected === block.id ? 'border-sky-400 bg-sky-50/30' : 'border-transparent hover:border-slate-200 bg-white'}`}>
                    <div className="absolute right-2 top-2 flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity z-10">
                      <button onClick={e => { e.stopPropagation(); moveBlock(block.id, -1); }} disabled={idx === 0} className="p-1 rounded bg-white border border-slate-200 text-slate-400 hover:text-slate-600 disabled:opacity-30"><ChevronUp className="w-3 h-3" /></button>
                      <button onClick={e => { e.stopPropagation(); moveBlock(block.id, 1); }} disabled={idx === blocks.length - 1} className="p-1 rounded bg-white border border-slate-200 text-slate-400 hover:text-slate-600 disabled:opacity-30"><ChevronDown className="w-3 h-3" /></button>
                      <button onClick={e => { e.stopPropagation(); removeBlock(block.id); }} className="p-1 rounded bg-white border border-slate-200 text-red-400 hover:text-red-600"><X className="w-3 h-3" /></button>
                    </div>
                    <div className="px-6 py-4 pointer-events-none" dangerouslySetInnerHTML={{ __html: renderBlockPreview(block, { first_name: 'Alex', last_name: 'Johnson', email: 'alex@example.com', company_name: 'Acme Co', state_name: 'New Jersey', unsubscribe_url: '#' }) }} />
                    {selected === block.id && <div className="absolute top-2 left-2 bg-sky-500 text-white text-xs px-2 py-0.5 rounded-full font-medium">{block.type}</div>}
                  </div>
                ))}
                {!blocks.length && (
                  <div className="text-center py-20 text-slate-400">
                    <Layout className="w-8 h-8 mx-auto mb-2 opacity-40" />
                    <p className="text-sm">Add blocks from the left panel</p>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>

        <div className="flex gap-2 px-6 py-4 border-t border-slate-100 bg-white">
          <button onClick={handleSave} disabled={saving || !name || !subject} className="flex-1 py-2.5 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800 disabled:opacity-50">
            {saving ? 'Saving...' : template ? 'Save Changes' : 'Create Template'}
          </button>
          <button onClick={onClose} className="px-4 py-2.5 text-sm text-slate-600 border border-slate-200 rounded-lg hover:bg-slate-50">Cancel</button>
        </div>
      </div>
    </div>
  );
}

export default function EmTemplatesPage() {
  const [templates, setTemplates] = useState<EmTemplate[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [modal, setModal] = useState<'create' | EmTemplate | null>(null);
  const [deleteId, setDeleteId] = useState<string | null>(null);
  const [previewTemplate, setPreviewTemplate] = useState<EmTemplate | null>(null);

  const load = async () => {
    setLoading(true); setError(null);
    try {
      const res = await emApi.get('templates');
      setTemplates(res.templates ?? []);
    } catch (e: any) { setError(e.message); } finally { setLoading(false); }
  };

  useEffect(() => { load(); }, []);

  const handleDelete = async (id: string) => {
    try {
      await emApi.delete(`templates/${id}`);
      setDeleteId(null); load();
    } catch (e: any) { alert(e.message); }
  };

  const handleDuplicate = async (t: EmTemplate) => {
    try {
      await emApi.post('templates', {
        name: `${t.name} (copy)`,
        subject_template: t.subject_template,
        preheader_template: t.preheader_template,
        body_json: t.body_json,
      });
      load();
    } catch (e: any) { alert(e.message); }
  };

  return (
    <EmailModuleLayout title="Email Marketing" subtitle="Templates">
      {modal && <TemplateEditorModal template={modal === 'create' ? null : modal} onClose={() => setModal(null)} onSaved={load} />}

      {previewTemplate && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-6">
          <div className="absolute inset-0 bg-black/60" onClick={() => setPreviewTemplate(null)} />
          <div className="relative bg-white rounded-2xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col">
            <div className="flex items-center justify-between px-6 py-4 border-b border-slate-100">
              <div>
                <p className="font-semibold text-slate-900 text-sm">{previewTemplate.name}</p>
                <p className="text-xs text-slate-400">Subject: {previewTemplate.subject_template}</p>
              </div>
              <button onClick={() => setPreviewTemplate(null)} className="p-2 rounded-lg hover:bg-slate-100 text-slate-400"><X className="w-4 h-4" /></button>
            </div>
            <div className="flex-1 overflow-auto p-4">
              <iframe srcDoc={buildHtmlPreview(previewTemplate.body_json?.blocks ?? [], previewTemplate.subject_template)} className="w-full border-0 rounded-lg" style={{ minHeight: 500 }} title="Template preview" />
            </div>
          </div>
        </div>
      )}

      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center">
          <div className="absolute inset-0 bg-black/40 backdrop-blur-sm" onClick={() => setDeleteId(null)} />
          <div className="relative bg-white rounded-2xl p-6 shadow-2xl w-full max-w-sm">
            <h3 className="font-semibold text-slate-900 mb-2">Delete template?</h3>
            <p className="text-sm text-slate-500 mb-4">Campaigns using this template won't be affected.</p>
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
            <Plus className="w-3.5 h-3.5" /> New Template
          </button>
        </div>

        {error && <div className="flex items-center gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-lg text-sm text-red-700"><AlertCircle className="w-4 h-4 shrink-0" />{error}</div>}

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">{[...Array(6)].map((_, i) => <div key={i} className="h-40 bg-white border border-slate-200 rounded-xl animate-pulse" />)}</div>
        ) : !templates.length ? (
          <div className="text-center py-16 bg-white rounded-xl border border-slate-200">
            <Layout className="w-8 h-8 mx-auto mb-2 text-slate-300" />
            <p className="text-sm font-medium text-slate-600 mb-1">No templates yet</p>
            <p className="text-xs text-slate-400 mb-4">Build reusable email templates for your campaigns</p>
            <button onClick={() => setModal('create')} className="px-4 py-2 bg-slate-900 text-white text-sm font-medium rounded-lg hover:bg-slate-800">Create First Template</button>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {templates.map(t => (
              <div key={t.id} className="bg-white rounded-xl border border-slate-200 overflow-hidden hover:border-sky-200 transition-colors group">
                <div className="h-32 bg-slate-50 border-b border-slate-100 overflow-hidden relative">
                  <iframe srcDoc={buildHtmlPreview(t.body_json?.blocks ?? [], t.subject_template)} className="w-full h-full border-0 pointer-events-none" style={{ transform: 'scale(0.5)', transformOrigin: 'top left', width: '200%', height: '200%' }} title={t.name} />
                  <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity bg-black/20 flex items-center justify-center">
                    <button onClick={() => setPreviewTemplate(t)} className="bg-white text-slate-700 text-xs font-medium px-3 py-1.5 rounded-lg shadow flex items-center gap-1.5">
                      <Eye className="w-3.5 h-3.5" /> Preview
                    </button>
                  </div>
                </div>
                <div className="p-4">
                  <div className="flex items-start justify-between">
                    <div className="flex-1 min-w-0">
                      <h3 className="text-sm font-semibold text-slate-900 truncate">{t.name}</h3>
                      <p className="text-xs text-slate-400 mt-0.5 truncate">{t.subject_template}</p>
                    </div>
                    <div className="flex items-center gap-1 opacity-0 group-hover:opacity-100 transition-opacity ml-2">
                      <button onClick={() => setModal(t)} className="p-1.5 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600"><Edit2 className="w-3.5 h-3.5" /></button>
                      <button onClick={() => handleDuplicate(t)} className="p-1.5 rounded-lg hover:bg-slate-100 text-slate-400 hover:text-slate-600"><Copy className="w-3.5 h-3.5" /></button>
                      <button onClick={() => setDeleteId(t.id)} className="p-1.5 rounded-lg hover:bg-red-50 text-slate-400 hover:text-red-500"><Trash2 className="w-3.5 h-3.5" /></button>
                    </div>
                  </div>
                  <div className="flex items-center gap-3 mt-3 pt-3 border-t border-slate-50">
                    <span className="text-xs text-slate-400">{(t.body_json?.blocks?.length ?? 0)} blocks</span>
                    <span className="text-slate-200">|</span>
                    <span className="text-xs text-slate-400 flex items-center gap-1"><Clock className="w-3 h-3" />{new Date(t.updated_at).toLocaleDateString()}</span>
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
