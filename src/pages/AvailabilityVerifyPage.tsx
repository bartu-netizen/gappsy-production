import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { Shield, Globe, Briefcase, Mail } from 'lucide-react';
import { useOwnerListingEdit } from '../contexts/OwnerListingEditContext';
import { supabase } from '../lib/supabase';
import { trackFunnelEvent } from '../utils/funnelTracking';
import { submitForm, getUtmParams } from '../lib/forms/submit';

export default function AvailabilityVerifyPage() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const agencyId = searchParams.get('agencyId');
  const stateSlug = searchParams.get('state');
  const isPlaceholder = searchParams.get('placeholder') === '1';
  const { setEditedData } = useOwnerListingEdit();

  const [formData, setFormData] = useState({
    websiteUrl: '',
    role: '',
    email: ''
  });
  const [error, setError] = useState<string>('');

  useEffect(() => {
    document.title = 'Confirm Agency Connection | Gappsy';
  }, []);

  useEffect(() => {
    if (import.meta.env.DEV) {
      console.log('[Verify] agencyId:', agencyId, 'stateSlug:', stateSlug);
    }
    if (!agencyId || !stateSlug) {
      if (import.meta.env.DEV) {
        console.log('[Verify] Missing params - showing error instead of redirect');
      }
      setError('Missing listing information. Please reopen this page from your agency card.');
    }
  }, [agencyId, stateSlug]);

  // Ultra-permissive URL validation
  const isValidUrl = (input: string): boolean => {
    if (!input || !input.trim()) return false;

    const trimmed = input.trim();

    // Must contain at least one letter or digit
    if (!/[a-zA-Z0-9]/.test(trimmed)) return false;

    // Accept if it contains a dot (domain-like)
    if (trimmed.includes('.')) return true;

    // Try to parse as URL after adding https://
    try {
      new URL(trimmed.startsWith('http://') || trimmed.startsWith('https://') ? trimmed : `https://${trimmed}`);
      return true;
    } catch {
      return false;
    }
  };

  // Auto-normalize URL by adding https:// if needed
  const normalizeUrl = (input: string): string => {
    const trimmed = input.trim();
    if (!trimmed) return '';

    // If already has protocol, return as-is
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }

    // Otherwise add https://
    return `https://${trimmed}`;
  };

  const [submitting, setSubmitting] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!agencyId || !stateSlug) {
      setError('Missing listing information. Please reopen this page from your agency card.');
      return;
    }

    if (!formData.websiteUrl.trim() || !formData.role) {
      setError('Please fill in all required fields.');
      return;
    }

    const normalizedUrl = normalizeUrl(formData.websiteUrl);

    if (!isValidUrl(formData.websiteUrl)) {
      setError('Please enter a valid website URL.');
      return;
    }

    setSubmitting(true);
    setError('');

    // Fire-and-forget log via edge function (service role bypasses RLS)
    supabase.functions.invoke('owner-demo-log', {
      body: {
        event: 'confirm_connection',
        state_slug: stateSlug,
        agency: {
          id: agencyId,
          website: normalizedUrl,
        },
        person: {
          email: formData.email.trim() || null,
          role: formData.role || null,
        },
        context: {
          page_url: window.location.href,
          referrer: document.referrer || null,
          flow: 'verify',
          step: 'confirm_connection',
        },
      },
    }).catch(() => {});

    submitForm({
      form_type: 'confirm_connection',
      state_slug: stateSlug || undefined,
      contact: { email: formData.email.trim() || undefined },
      payload: {
        agency_id: agencyId || undefined,
        contact_email: formData.email.trim() || undefined,
        website: normalizedUrl,
        role: formData.role,
      },
      utm: getUtmParams(),
    })
      .then((r) => { if (!r.ok) console.error('[confirm_connection] submit-and-notify failed:', r.error); })
      .catch((e) => console.error('[confirm_connection] submit-and-notify network error:', e));

    trackFunnelEvent({
      funnelType: 'demo',
      stateSlug: stateSlug || undefined,
      agencyId: agencyId || undefined,
      leadEmail: formData.email.trim() || undefined,
      eventName: 'confirm_connection_submit',
      eventStage: 'offer',
      metadata: { role: formData.role, websiteUrl: normalizedUrl },
    });

    // Save contact info to context for next step
    setEditedData({
      intro: '',
      services: [],
      contactEmail: formData.email.trim() || undefined,
      websiteUrl: normalizedUrl
    });

    setSubmitting(false);

    const placeholderParam = isPlaceholder ? '&placeholder=1' : '';
    navigate(`/availability/owner/edit-listing?agencyId=${agencyId}&state=${stateSlug}${placeholderParam}`);
  };

  return (
    <div className="min-h-screen flex items-center justify-center px-4 py-6 bg-gradient-to-br from-indigo-50 to-slate-100">
      <div className="w-full max-w-md rounded-2xl bg-white shadow-lg p-6 sm:p-8">
        <div className="flex items-center justify-center">
          <div className="w-10 h-10 rounded-full bg-indigo-100 flex items-center justify-center">
            <Shield className="w-5 h-5 text-indigo-600" />
          </div>
        </div>

        <div className="mt-3 text-center">
          <h1 className="text-2xl md:text-3xl font-semibold text-slate-900">
            Confirm your agency connection
          </h1>
          <p className="mt-1 text-sm text-slate-600 max-w-md mx-auto">
            This quick step confirms you're allowed to manage this listing.
            Potential clients will <span className="font-medium">not</span> see this page.
          </p>
        </div>

        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-3 text-sm text-red-800">
            {error}
          </div>
        )}

        <form onSubmit={handleSubmit} className="mt-5 space-y-3 sm:space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1.5">
              What is the website URL of your agency? <span className="text-rose-500">*</span>
            </label>
            <div className="relative">
              <Globe className="absolute left-3 top-1/2 transform -translate-y-1/2 text-slate-400 w-4 h-4" />
              <input
                type="text"
                required
                value={formData.websiteUrl}
                onChange={(e) => setFormData({ ...formData, websiteUrl: e.target.value })}
                className="w-full pl-10 pr-4 py-2.5 border border-slate-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all text-sm"
                placeholder="example.com"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1.5">
              Your role at this agency <span className="text-rose-500">*</span>
            </label>
            <div className="relative">
              <Briefcase className="absolute left-3 top-1/2 transform -translate-y-1/2 text-slate-400 w-4 h-4" />
              <select
                required
                value={formData.role}
                onChange={(e) => setFormData({ ...formData, role: e.target.value })}
                className="w-full pl-10 pr-9 py-2.5 border border-slate-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all bg-white text-slate-900 text-sm appearance-none"
                style={{ backgroundImage: "url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e')", backgroundRepeat: 'no-repeat', backgroundPosition: 'right 0.75rem center', backgroundSize: '1rem' }}
              >
                <option value="">Select your role...</option>
                <option value="Owner / Founder">Owner / Founder</option>
                <option value="Director">Director</option>
                <option value="Marketing Manager">Marketing Manager</option>
                <option value="Team Member">Team Member</option>
                <option value="Other">Other</option>
              </select>
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1.5">
              Work email (optional)
            </label>
            <div className="relative">
              <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-slate-400 w-4 h-4" />
              <input
                type="email"
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                className="w-full pl-10 pr-4 py-2.5 border border-slate-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all text-sm"
                placeholder="yourname@agencydomain.com"
              />
            </div>
            <p className="mt-1 text-xs text-slate-500">
              A work email helps us confirm your connection faster.
            </p>
          </div>

          <div className="pt-1">
            <button
              type="submit"
              disabled={submitting}
              className="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 transition-colors shadow-sm hover:shadow-md disabled:opacity-60 disabled:cursor-not-allowed"
            >
              {submitting ? 'Confirming...' : 'Continue'}
            </button>
          </div>
        </form>

        <div className="pt-4 border-t border-slate-200">
          <button
            onClick={() => navigate(-1)}
            className="text-sm text-slate-500 hover:text-slate-700 transition-colors"
          >
            ← Go back
          </button>
        </div>
      </div>
    </div>
  );
}
