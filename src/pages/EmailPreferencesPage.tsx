import { useEffect, useState } from 'react';
import { useSearchParams, useNavigate } from 'react-router-dom';
import { CheckCircle, AlertTriangle, Mail, RefreshCw } from 'lucide-react';
import { supabase } from '../lib/supabase';
import { useNoindex } from '../components/NoindexMeta';

interface Preferences {
  agency_id: string;
  email: string;
  allow_lead_emails: boolean;
  allow_marketing_emails: boolean;
}

export default function EmailPreferencesPage() {
  useNoindex();
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [preferences, setPreferences] = useState<Preferences | null>(null);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  const token = searchParams.get('token');

  useEffect(() => {
    const loadPreferences = async () => {
      if (!token) {
        setError('No token provided');
        setLoading(false);
        return;
      }

      try {
        // Look up agency by unsub token (service role fetch)
        const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/email-preferences-api?token=${encodeURIComponent(token)}`, {
          headers: {
            'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
          },
        });

        const data = await response.json();
        if (!data.ok || !data.preferences) {
          setError('Invalid or expired token');
          setLoading(false);
          return;
        }

        setPreferences(data.preferences);
      } catch (e: unknown) {
        setError(e instanceof Error ? e.message : 'Error loading preferences');
      } finally {
        setLoading(false);
      }
    };

    loadPreferences();
  }, [token]);

  const handleToggle = (field: 'allow_lead_emails' | 'allow_marketing_emails') => {
    if (!preferences) return;
    setPreferences({
      ...preferences,
      [field]: !preferences[field],
    });
  };

  const handleSave = async () => {
    if (!preferences || !token) return;
    setSaving(true);
    setError('');

    try {
      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/email-preferences-api`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
        },
        body: JSON.stringify({
          token,
          allow_lead_emails: preferences.allow_lead_emails,
          allow_marketing_emails: preferences.allow_marketing_emails,
        }),
      });

      const data = await response.json();
      if (!data.ok) {
        setError(data.error || 'Failed to save preferences');
        return;
      }

      setSaved(true);
      setTimeout(() => setSaved(false), 3000);
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : 'Error saving preferences');
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-12 px-4">
      <div className="max-w-2xl mx-auto">

        {/* Header */}
        <div className="bg-white rounded-xl shadow-sm border border-slate-200 p-8 mb-6">
          <div className="flex items-start gap-4">
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center shrink-0">
              <Mail className="w-6 h-6 text-blue-600" />
            </div>
            <div>
              <h1 className="text-2xl font-bold text-slate-900">Email Preferences</h1>
              <p className="text-slate-500 mt-1">Manage how Gappsy communicates with you</p>
            </div>
          </div>
        </div>

        {/* Content */}
        {loading ? (
          <div className="bg-white rounded-xl shadow-sm border border-slate-200 p-12 text-center">
            <RefreshCw className="w-8 h-8 animate-spin text-slate-400 mx-auto mb-3" />
            <p className="text-slate-500">Loading your preferences...</p>
          </div>
        ) : error ? (
          <div className="bg-red-50 rounded-xl border border-red-200 p-6">
            <div className="flex items-start gap-3">
              <AlertTriangle className="w-5 h-5 text-red-600 mt-0.5 shrink-0" />
              <div>
                <h2 className="font-semibold text-red-900">Unable to load preferences</h2>
                <p className="text-red-700 text-sm mt-1">{error}</p>
                <p className="text-red-600 text-xs mt-3">
                  The link may be invalid or expired. Try visiting your email again and clicking the link.
                </p>
              </div>
            </div>
          </div>
        ) : preferences ? (
          <div className="bg-white rounded-xl shadow-sm border border-slate-200 overflow-hidden">

            {/* Email Display */}
            <div className="px-8 py-6 border-b border-slate-100 bg-slate-50">
              <p className="text-xs text-slate-500 uppercase tracking-wide font-semibold">Email</p>
              <p className="text-lg font-medium text-slate-900 mt-1">{preferences.email}</p>
            </div>

            {/* Preferences */}
            <div className="p-8 space-y-6">
              <div>
                <h2 className="text-sm font-semibold text-slate-700 mb-4">Email Communication</h2>
                <div className="space-y-4">

                  {/* Lead Emails */}
                  <label className="flex items-start gap-3 cursor-pointer group">
                    <input
                      type="checkbox"
                      checked={preferences.allow_lead_emails}
                      onChange={() => handleToggle('allow_lead_emails')}
                      className="w-5 h-5 rounded border-slate-300 text-blue-600 mt-0.5"
                    />
                    <div className="flex-1">
                      <p className="font-medium text-slate-900">Receive lead details</p>
                      <p className="text-sm text-slate-500 mt-0.5">
                        Get full contact information when someone checks your availability (for paid listings)
                      </p>
                    </div>
                  </label>

                  {/* Marketing Emails */}
                  <label className="flex items-start gap-3 cursor-pointer group">
                    <input
                      type="checkbox"
                      checked={preferences.allow_marketing_emails}
                      onChange={() => handleToggle('allow_marketing_emails')}
                      className="w-5 h-5 rounded border-slate-300 text-blue-600 mt-0.5"
                    />
                    <div className="flex-1">
                      <p className="font-medium text-slate-900">Receive marketing emails</p>
                      <p className="text-sm text-slate-500 mt-0.5">
                        Receive weekly digests and upgrade offers (for non-paid listings)
                      </p>
                    </div>
                  </label>

                </div>
              </div>

              {/* Status Messages */}
              {saved && (
                <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-4 flex items-start gap-3">
                  <CheckCircle className="w-5 h-5 text-emerald-600 mt-0.5 shrink-0" />
                  <div>
                    <p className="font-medium text-emerald-900">Preferences saved</p>
                    <p className="text-sm text-emerald-700 mt-1">Your email preferences have been updated.</p>
                  </div>
                </div>
              )}

              {/* Save Button */}
              <div className="flex gap-3 pt-4">
                <button
                  onClick={handleSave}
                  disabled={saving}
                  className="inline-flex items-center gap-2 px-6 py-2 bg-blue-600 hover:bg-blue-700 disabled:opacity-50 text-white font-medium rounded-lg transition-colors"
                >
                  {saving ? <RefreshCw className="w-4 h-4 animate-spin" /> : <CheckCircle className="w-4 h-4" />}
                  {saving ? 'Saving...' : 'Save preferences'}
                </button>
              </div>
            </div>

            {/* Info */}
            <div className="px-8 py-6 bg-slate-50 border-t border-slate-100">
              <p className="text-xs text-slate-500">
                Changes take effect immediately. You can update these preferences anytime by clicking the link in any email from Gappsy.
              </p>
            </div>
          </div>
        ) : null}
      </div>
    </div>
  );
}
