import { useEffect, useState } from 'react';
import { useParams, useNavigate, Link } from 'react-router-dom';
import { Save, CheckCircle, X, Eye, AlertCircle } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import { ALL_STATES } from '../lib/agencyReviewImport';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch, type AdminApiError } from '../lib/adminApiFetch';
import { AdminErrorBanner, AdminLoadingState } from '../components/admin/AdminErrorBanner';

interface AgencyReviewFormData {
  agency_name: string;
  agency_slug: string;
  state_slug: string;
  state_name: string;
  city: string;
  review_type: 'positive' | 'negative' | '';
  is_top_25_ranked: boolean;
  is_published: boolean;
  website_url: string;
  services_offered: string;
  target_clients: string;
  geographic_reach: string;
  team_size_range: string;
  evaluation_status: string;
  about_description: string;
  strengths: string;
  concerns: string;
  risk_factors: string;
  fit_for: string;
  case_studies_status: string;
  pricing_transparency: string;
  team_information: string;
  independent_recognition: string;
  local_presence: string;
  entity_signals: string;
  uniqueness_score: number;
}

const EMPTY_FORM: AgencyReviewFormData = {
  agency_name: '',
  agency_slug: '',
  state_slug: '',
  state_name: '',
  city: '',
  review_type: '',
  is_top_25_ranked: false,
  is_published: false,
  website_url: '',
  services_offered: '',
  target_clients: '',
  geographic_reach: '',
  team_size_range: '',
  evaluation_status: '',
  about_description: '',
  strengths: '',
  concerns: '',
  risk_factors: '',
  fit_for: '',
  case_studies_status: '',
  pricing_transparency: '',
  team_information: '',
  independent_recognition: '',
  local_presence: '',
  entity_signals: '',
  uniqueness_score: 0,
};

function generateSlug(name: string, stateSlug: string): string {
  if (!name || !stateSlug) return '';
  const nameSlug = name
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '');
  return `${nameSlug}-${stateSlug}`;
}

type DataState = 'idle' | 'waiting_session' | 'loading' | 'success' | 'error';

export default function AdminAgencyReviewEditorPage() {
  const { id } = useParams<{ id?: string }>();
  const navigate = useNavigate();
  const isEditMode = !!id;
  const { isReady, isValid } = useAdminSession();

  const [formData, setFormData] = useState<AgencyReviewFormData>(EMPTY_FORM);
  const [dataState, setDataState] = useState<DataState>(isEditMode ? 'idle' : 'success');
  const [saving, setSaving] = useState(false);
  const [apiError, setApiError] = useState<AdminApiError | null>(null);
  const [slugError, setSlugError] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);
  const [autoSlug, setAutoSlug] = useState(true);

  useEffect(() => {
    if (isEditMode && id && isReady) {
      loadReview(id);
    }
  }, [id, isEditMode, isReady]);

  useEffect(() => {
    document.title = isEditMode ? 'Edit Agency Review | Admin' : 'New Agency Review | Admin';
  }, [isEditMode]);

  // Auto-generate slug when name or state changes (only if autoSlug is enabled)
  useEffect(() => {
    if (autoSlug && formData.agency_name && formData.state_slug) {
      const newSlug = generateSlug(formData.agency_name, formData.state_slug);
      if (newSlug !== formData.agency_slug) {
        setFormData(prev => ({ ...prev, agency_slug: newSlug }));
        setSlugError(null);
      }
    }
  }, [formData.agency_name, formData.state_slug, autoSlug]);

  // Auto-set state_name when state_slug changes
  useEffect(() => {
    if (formData.state_slug) {
      const state = ALL_STATES.find(s => s.slug === formData.state_slug);
      if (state && state.name !== formData.state_name) {
        setFormData(prev => ({ ...prev, state_name: state.name }));
      }
    }
  }, [formData.state_slug]);

  async function loadReview(reviewId: string) {
    if (!isReady) {
      setDataState('waiting_session');
      return;
    }
    if (!isValid) {
      setDataState('error');
      setApiError({
        code: 'no_session',
        message: 'Your admin session expired. Please log in again.',
        retryable: false,
      });
      return;
    }

    setDataState('loading');
    setApiError(null);

    const result = await adminApiFetch<{ ok: boolean; data: any; error?: string }>(
      `agency-reviews-admin?id=${reviewId}`
    );

    if (!result.ok) {
      setDataState('error');
      setApiError(result.error!);
      return;
    }

    const review = result.data.data;
    setFormData({
      agency_name: review.agency_name || '',
      agency_slug: review.agency_slug || '',
      state_slug: review.state_slug || '',
      state_name: review.state_name || '',
      city: review.city || '',
      review_type: review.review_type || '',
      is_top_25_ranked: review.is_top_25_ranked || false,
      is_published: review.is_published || false,
      website_url: review.website_url || '',
      services_offered: Array.isArray(review.services_offered) ? review.services_offered.join('\n') : '',
      target_clients: Array.isArray(review.target_clients) ? review.target_clients.join('\n') : '',
      geographic_reach: Array.isArray(review.geographic_reach) ? review.geographic_reach.join('\n') : '',
      team_size_range: review.team_size_range || '',
      evaluation_status: review.evaluation_status || '',
      about_description: review.about_description || '',
      strengths: Array.isArray(review.strengths) ? review.strengths.join('\n') : '',
      concerns: Array.isArray(review.concerns) ? review.concerns.join('\n') : '',
      risk_factors: Array.isArray(review.risk_factors) ? review.risk_factors.join('\n') : '',
      fit_for: Array.isArray(review.fit_for) ? review.fit_for.join('\n') : '',
      case_studies_status: review.case_studies_status || '',
      pricing_transparency: review.pricing_transparency || '',
      team_information: review.team_information || '',
      independent_recognition: review.independent_recognition || '',
      local_presence: review.local_presence || '',
      entity_signals: Array.isArray(review.entity_signals) ? review.entity_signals.join('\n') : '',
      uniqueness_score: review.uniqueness_score || 0,
    });
    setAutoSlug(false); // Disable auto-slug when editing existing review
    setDataState('success');
  }

  async function handleSave(publish: boolean) {
    setApiError(null);
    setSlugError(null);
    setSuccessMessage(null);

    // Validation
    if (!formData.agency_name.trim()) {
      setApiError({
        code: 'parse_error',
        message: 'Agency name is required',
        retryable: false,
      });
      return;
    }
    if (!formData.state_slug) {
      setApiError({
        code: 'parse_error',
        message: 'State is required',
        retryable: false,
      });
      return;
    }
    if (!formData.review_type) {
      setApiError({
        code: 'parse_error',
        message: 'Review type is required (positive or negative)',
        retryable: false,
      });
      return;
    }
    if (!formData.agency_slug.trim()) {
      setApiError({
        code: 'parse_error',
        message: 'Agency slug is required',
        retryable: false,
      });
      return;
    }
    if (!formData.about_description.trim()) {
      setApiError({
        code: 'parse_error',
        message: 'About description is required',
        retryable: false,
      });
      return;
    }

    if (!isReady) {
      setApiError({
        code: 'no_session',
        message: 'Session is not ready. Please wait...',
        retryable: false,
      });
      return;
    }
    if (!isValid) {
      setApiError({
        code: 'session_expired',
        message: 'Your admin session expired. Please log in again.',
        retryable: false,
      });
      return;
    }

    setSaving(true);

    // Convert textarea strings to arrays
    const payload = {
      agency_name: formData.agency_name.trim(),
      agency_slug: formData.agency_slug.trim(),
      state_slug: formData.state_slug,
      state_name: formData.state_name,
      city: formData.city.trim() || null,
      review_type: formData.review_type,
      is_top_25_ranked: formData.is_top_25_ranked,
      is_published: publish,
      website_url: formData.website_url.trim() || null,
      services_offered: formData.services_offered.split('\n').map(s => s.trim()).filter(Boolean),
      target_clients: formData.target_clients.split('\n').map(s => s.trim()).filter(Boolean),
      geographic_reach: formData.geographic_reach.split('\n').map(s => s.trim()).filter(Boolean),
      team_size_range: formData.team_size_range.trim() || null,
      evaluation_status: formData.evaluation_status.trim() || null,
      about_description: formData.about_description.trim(),
      strengths: formData.strengths.split('\n').map(s => s.trim()).filter(Boolean),
      concerns: formData.concerns.split('\n').map(s => s.trim()).filter(Boolean),
      risk_factors: formData.risk_factors.split('\n').map(s => s.trim()).filter(Boolean),
      fit_for: formData.fit_for.split('\n').map(s => s.trim()).filter(Boolean),
      case_studies_status: formData.case_studies_status.trim() || null,
      pricing_transparency: formData.pricing_transparency.trim() || null,
      team_information: formData.team_information.trim() || null,
      independent_recognition: formData.independent_recognition.trim() || null,
      local_presence: formData.local_presence.trim() || null,
      entity_signals: formData.entity_signals.split('\n').map(s => s.trim()).filter(Boolean),
      uniqueness_score: formData.uniqueness_score,
    };

    const endpoint = isEditMode
      ? `agency-reviews-admin?id=${id}`
      : `agency-reviews-admin`;

    const result = await adminApiFetch<{ ok: boolean; id?: string; agency_slug?: string; error?: string }>(
      endpoint,
      {
        method: isEditMode ? 'PUT' : 'POST',
        body: payload,
      }
    );

    setSaving(false);

    if (!result.ok) {
      const errorMsg = result.error?.message || 'Failed to save review';
      if (errorMsg.includes('unique') || errorMsg.includes('duplicate') || errorMsg.includes('already exists')) {
        setSlugError(`The slug "${formData.agency_slug}" is already in use. Please choose a different agency name or slug.`);
      } else {
        setApiError(result.error!);
      }
      return;
    }

    setSuccessMessage(publish ? 'Review published successfully!' : 'Review saved as draft!');

    // If creating new, redirect to edit page after 1 second
    if (!isEditMode && result.data.id) {
      setTimeout(() => {
        navigate(`/wp-admin/agency-reviews/edit/${result.data.id}`);
      }, 1000);
    } else {
      // Refresh the data in edit mode
      setTimeout(() => {
        setSuccessMessage(null);
      }, 3000);
    }
  }

  // Handle session waiting state
  if (dataState === 'waiting_session') {
    return (
      <WpAdminLayout title="Loading..." subtitle="">
        <div className="max-w-5xl mx-auto">
          <AdminLoadingState message="Waiting for admin session..." />
        </div>
      </WpAdminLayout>
    );
  }

  // Handle loading state
  if (dataState === 'loading') {
    return (
      <WpAdminLayout title={isEditMode ? 'Loading Review...' : 'New Review'} subtitle="">
        <div className="max-w-5xl mx-auto">
          <AdminLoadingState message="Loading review..." />
        </div>
      </WpAdminLayout>
    );
  }

  // Handle error state
  if (dataState === 'error' && apiError) {
    return (
      <WpAdminLayout title="Error" subtitle="">
        <div className="max-w-5xl mx-auto">
          <AdminErrorBanner
            error={apiError}
            onRetry={() => {
              if (isEditMode && id) {
                loadReview(id);
              }
            }}
            onLogin={() => navigate('/wp-admin?reason=session_expired')}
          />
          <div className="mt-6">
            <Link
              to="/wp-admin/agency-reviews"
              className="inline-flex items-center gap-2 px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition"
            >
              <X className="w-4 h-4" />
              Back to Reviews
            </Link>
          </div>
        </div>
      </WpAdminLayout>
    );
  }

  return (
    <WpAdminLayout
      title={isEditMode ? 'Edit Agency Review' : 'New Agency Review'}
      subtitle={isEditMode ? `Editing: ${formData.agency_name}` : 'Create a new agency review page'}
    >
      <div className="max-w-5xl mx-auto">
        {/* Success Banner */}
        {successMessage && (
          <div className="mb-6 bg-green-50 border border-green-200 rounded-lg p-4">
            <div className="flex items-start gap-3">
              <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
              <div className="flex-1">
                <p className="font-semibold text-green-900">{successMessage}</p>
                {isEditMode && formData.agency_slug && (
                  <Link
                    to={`/agency-reviews/${formData.agency_slug}`}
                    target="_blank"
                    className="text-sm text-green-700 hover:text-green-800 underline mt-1 inline-block"
                  >
                    View public page →
                  </Link>
                )}
              </div>
            </div>
          </div>
        )}

        {/* API Error Banner */}
        {apiError && (
          <div className="mb-6">
            <AdminErrorBanner error={apiError} compact />
          </div>
        )}

        {/* Slug Error */}
        {slugError && (
          <div className="mb-6 bg-amber-50 border border-amber-200 rounded-lg p-4">
            <div className="flex items-start gap-3">
              <AlertCircle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
              <div>
                <p className="font-semibold text-amber-900">Duplicate Slug</p>
                <p className="text-sm text-amber-700 mt-1">{slugError}</p>
              </div>
            </div>
          </div>
        )}

        {/* Form */}
        <div className="bg-white border border-gray-200 rounded-lg p-6 space-y-6">
          {/* Basic Info */}
          <div>
            <h2 className="text-lg font-bold text-gray-900 mb-4">Basic Information</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">
                  Agency Name <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.agency_name}
                  onChange={(e) => setFormData({ ...formData, agency_name: e.target.value })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="e.g. Hozio"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">
                  State <span className="text-red-500">*</span>
                </label>
                <select
                  value={formData.state_slug}
                  onChange={(e) => setFormData({ ...formData, state_slug: e.target.value })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="">Select state...</option>
                  {ALL_STATES.map((state) => (
                    <option key={state.slug} value={state.slug}>
                      {state.name}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">
                  Agency Slug <span className="text-red-500">*</span>
                </label>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={formData.agency_slug}
                    onChange={(e) => {
                      setFormData({ ...formData, agency_slug: e.target.value });
                      setAutoSlug(false);
                    }}
                    className="flex-1 px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                    placeholder="e.g. hozio-new-york"
                  />
                  <button
                    type="button"
                    onClick={() => setAutoSlug(true)}
                    className="px-3 py-2 text-xs bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
                    title="Re-enable auto-generation"
                  >
                    Auto
                  </button>
                </div>
                <p className="text-xs text-gray-500 mt-1">URL: /agency-reviews/{formData.agency_slug || '...'}</p>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">City</label>
                <input
                  type="text"
                  value={formData.city}
                  onChange={(e) => setFormData({ ...formData, city: e.target.value })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="e.g. New York"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">
                  Review Type <span className="text-red-500">*</span>
                </label>
                <select
                  value={formData.review_type}
                  onChange={(e) => setFormData({ ...formData, review_type: e.target.value as any })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                  <option value="">Select type...</option>
                  <option value="positive">Positive</option>
                  <option value="negative">Negative</option>
                </select>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">Website URL</label>
                <input
                  type="url"
                  value={formData.website_url}
                  onChange={(e) => setFormData({ ...formData, website_url: e.target.value })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="https://..."
                />
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mt-4">
              <div className="flex items-center">
                <input
                  type="checkbox"
                  id="is_top_25"
                  checked={formData.is_top_25_ranked}
                  onChange={(e) => setFormData({ ...formData, is_top_25_ranked: e.target.checked })}
                  className="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
                />
                <label htmlFor="is_top_25" className="ml-2 text-sm text-gray-700">
                  Top 25 Ranked
                </label>
              </div>

              <div className="flex items-center">
                <input
                  type="checkbox"
                  id="is_published"
                  checked={formData.is_published}
                  onChange={(e) => setFormData({ ...formData, is_published: e.target.checked })}
                  className="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
                />
                <label htmlFor="is_published" className="ml-2 text-sm text-gray-700">
                  Published (visible to public)
                </label>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1.5">Uniqueness Score</label>
                <input
                  type="number"
                  min="0"
                  max="100"
                  value={formData.uniqueness_score}
                  onChange={(e) => setFormData({ ...formData, uniqueness_score: parseInt(e.target.value) || 0 })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
              </div>
            </div>
          </div>

          {/* About Description */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1.5">
              About Description <span className="text-red-500">*</span>
            </label>
            <textarea
              value={formData.about_description}
              onChange={(e) => setFormData({ ...formData, about_description: e.target.value })}
              rows={6}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="Comprehensive description of the agency..."
            />
            <p className="text-xs text-gray-500 mt-1">{formData.about_description.length} characters</p>
          </div>

          {/* Array Fields */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Services Offered <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.services_offered}
                onChange={(e) => setFormData({ ...formData, services_offered: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="SEO&#10;PPC&#10;Web Design"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Target Clients <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.target_clients}
                onChange={(e) => setFormData({ ...formData, target_clients: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="Startups&#10;E-commerce&#10;B2B SaaS"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Strengths <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.strengths}
                onChange={(e) => setFormData({ ...formData, strengths: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="Strong technical SEO expertise&#10;Data-driven approach"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Concerns <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.concerns}
                onChange={(e) => setFormData({ ...formData, concerns: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="Limited case studies available&#10;Pricing not transparent"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Fit For <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.fit_for}
                onChange={(e) => setFormData({ ...formData, fit_for: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="B2B companies seeking technical SEO&#10;E-commerce brands"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Risk Factors <span className="text-gray-400">(one per line)</span>
              </label>
              <textarea
                value={formData.risk_factors}
                onChange={(e) => setFormData({ ...formData, risk_factors: e.target.value })}
                rows={6}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="No refund policy&#10;Long-term contracts required"
              />
            </div>
          </div>

          {/* Additional Fields */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Geographic Reach</label>
              <textarea
                value={formData.geographic_reach}
                onChange={(e) => setFormData({ ...formData, geographic_reach: e.target.value })}
                rows={3}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="National&#10;Northeastern US"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Entity Signals</label>
              <textarea
                value={formData.entity_signals}
                onChange={(e) => setFormData({ ...formData, entity_signals: e.target.value })}
                rows={3}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-mono text-sm"
                placeholder="LLC verified&#10;Business license active"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Team Size Range</label>
              <input
                type="text"
                value={formData.team_size_range}
                onChange={(e) => setFormData({ ...formData, team_size_range: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. 10-20 employees"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Evaluation Status</label>
              <input
                type="text"
                value={formData.evaluation_status}
                onChange={(e) => setFormData({ ...formData, evaluation_status: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Verified"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Case Studies Status</label>
              <input
                type="text"
                value={formData.case_studies_status}
                onChange={(e) => setFormData({ ...formData, case_studies_status: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Available"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Pricing Transparency</label>
              <input
                type="text"
                value={formData.pricing_transparency}
                onChange={(e) => setFormData({ ...formData, pricing_transparency: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Low"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Team Information</label>
              <input
                type="text"
                value={formData.team_information}
                onChange={(e) => setFormData({ ...formData, team_information: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Experienced team with 10+ years"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Independent Recognition</label>
              <input
                type="text"
                value={formData.independent_recognition}
                onChange={(e) => setFormData({ ...formData, independent_recognition: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Featured in industry publications"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">Local Presence</label>
              <input
                type="text"
                value={formData.local_presence}
                onChange={(e) => setFormData({ ...formData, local_presence: e.target.value })}
                className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                placeholder="e.g. Strong local presence"
              />
            </div>
          </div>
        </div>

        {/* Actions */}
        <div className="flex items-center justify-between gap-4 mt-6">
          <Link
            to="/wp-admin/agency-reviews"
            className="inline-flex items-center gap-2 px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition"
          >
            <X className="w-4 h-4" />
            Cancel
          </Link>

          <div className="flex gap-3">
            {isEditMode && formData.agency_slug && (
              <Link
                to={`/agency-reviews/${formData.agency_slug}`}
                target="_blank"
                className="inline-flex items-center gap-2 px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition"
              >
                <Eye className="w-4 h-4" />
                View Public Page
              </Link>
            )}
            <button
              onClick={() => handleSave(false)}
              disabled={saving}
              className="inline-flex items-center gap-2 px-5 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700 disabled:bg-gray-400 transition"
            >
              <Save className="w-4 h-4" />
              {saving ? 'Saving...' : 'Save Draft'}
            </button>
            <button
              onClick={() => handleSave(true)}
              disabled={saving}
              className="inline-flex items-center gap-2 px-5 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 disabled:bg-gray-400 transition font-semibold"
            >
              <CheckCircle className="w-4 h-4" />
              {saving ? 'Publishing...' : 'Save & Publish'}
            </button>
          </div>
        </div>
      </div>
    </WpAdminLayout>
  );
}
