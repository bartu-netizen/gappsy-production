import { useState, useEffect } from 'react';
import { Save, AlertCircle, CheckCircle, Mail } from 'lucide-react';
import { getSenderIdentitySettings, updateSenderIdentitySettings } from '../../lib/senderIdentityApi';

export function SenderIdentitySettings() {
  const [fromName, setFromName] = useState('Gappsy');
  const [fromEmail, setFromEmail] = useState('noreply@gappsy.com');
  const [replyTo, setReplyTo] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    loadSettings();
  }, []);

  async function loadSettings() {
    try {
      setLoading(true);
      const settings = await getSenderIdentitySettings();
      setFromName(settings.fromName);
      setFromEmail(settings.fromEmail);
      setReplyTo(settings.replyTo || '');
    } catch (err) {
      console.error('Error loading settings:', err);
      setError(err instanceof Error ? err.message : 'Failed to load settings');
    } finally {
      setLoading(false);
    }
  }

  async function handleSave() {
    setError(null);
    setSaved(false);

    if (!fromName.trim()) {
      setError('From name is required');
      return;
    }

    if (!fromEmail.trim()) {
      setError('From email is required');
      return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(fromEmail.trim())) {
      setError('From email must be valid');
      return;
    }

    if (replyTo.trim() && !emailRegex.test(replyTo.trim())) {
      setError('Reply-to email must be valid');
      return;
    }

    setSaving(true);

    try {
      await updateSenderIdentitySettings({
        fromName: fromName.trim(),
        fromEmail: fromEmail.trim(),
        replyTo: replyTo.trim() || undefined,
      });
      setSaved(true);
      setTimeout(() => setSaved(false), 3000);
    } catch (err) {
      console.error('Error saving settings:', err);
      setError(err instanceof Error ? err.message : 'Failed to save settings');
    } finally {
      setSaving(false);
    }
  }

  if (loading) {
    return (
      <div className="bg-white rounded-xl border border-slate-200 p-6">
        <div className="animate-pulse space-y-4">
          <div className="h-4 bg-slate-200 rounded w-1/3"></div>
          <div className="h-10 bg-slate-200 rounded"></div>
        </div>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-xl border border-slate-200 shadow-sm">
      <div className="px-6 py-4 border-b border-slate-100 flex items-center gap-3">
        <Mail className="w-5 h-5 text-slate-600" />
        <h3 className="text-base font-semibold text-slate-900">Sender Identity</h3>
      </div>

      <div className="p-6 space-y-5">
        {error && (
          <div className="flex items-start gap-2 px-4 py-3 bg-red-50 border border-red-200 rounded-xl text-sm text-red-700">
            <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
            <span>{error}</span>
          </div>
        )}

        {saved && (
          <div className="flex items-start gap-2 px-4 py-3 bg-emerald-50 border border-emerald-200 rounded-xl text-sm text-emerald-700">
            <CheckCircle className="w-4 h-4 shrink-0 mt-0.5" />
            <span>Sender identity updated successfully</span>
          </div>
        )}

        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1.5">
            From Name *
          </label>
          <input
            type="text"
            value={fromName}
            onChange={(e) => setFromName(e.target.value)}
            placeholder="e.g., Gappsy Team"
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-sky-500 focus:border-transparent"
          />
          <p className="text-xs text-slate-500 mt-1">
            This name appears in recipients' inboxes
          </p>
        </div>

        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1.5">
            From Email *
          </label>
          <input
            type="email"
            value={fromEmail}
            onChange={(e) => setFromEmail(e.target.value)}
            placeholder="noreply@gappsy.com"
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-sky-500 focus:border-transparent"
          />
          <p className="text-xs text-slate-500 mt-1">
            Must be verified with your email provider
          </p>
        </div>

        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1.5">
            Reply-To Email (Optional)
          </label>
          <input
            type="email"
            value={replyTo}
            onChange={(e) => setReplyTo(e.target.value)}
            placeholder="support@gappsy.com"
            className="w-full px-3 py-2.5 border border-slate-300 rounded-lg text-sm focus:ring-2 focus:ring-sky-500 focus:border-transparent"
          />
          <p className="text-xs text-slate-500 mt-1">
            Replies will go to this email. Defaults to From Email if empty.
          </p>
        </div>

        <div className="p-3 bg-sky-50 border border-sky-200 rounded-lg">
          <p className="text-xs font-medium text-sky-900 mb-1.5">Preview</p>
          <p className="text-xs text-sky-800 font-mono">
            From: {fromName} &lt;{fromEmail}&gt;
          </p>
          {replyTo && (
            <p className="text-xs text-sky-800 font-mono">
              Reply-To: {replyTo}
            </p>
          )}
        </div>

        <div className="flex gap-3">
          <button
            onClick={handleSave}
            disabled={saving}
            className="flex items-center gap-2 px-4 py-2.5 bg-sky-600 hover:bg-sky-700 disabled:bg-slate-400 text-white text-sm font-medium rounded-lg transition-colors"
          >
            <Save className="w-4 h-4" />
            {saving ? 'Saving...' : 'Save Changes'}
          </button>
        </div>

        <div className="p-3 bg-amber-50 border border-amber-200 rounded-lg">
          <p className="text-xs text-amber-900">
            <strong>Note:</strong> These sender defaults apply to Quick Sends, Campaigns, and all internal notifications. Some features may allow per-send overrides.
          </p>
        </div>
      </div>
    </div>
  );
}
