import { useState, useRef, useEffect } from 'react';
import { AlertCircle, Loader2, Upload, CheckCircle2, Zap, Star } from 'lucide-react';
import { validateIntroText, sanitizeIntroText, validateWebsiteUrl } from '../lib/introTextValidation';
import type { FinalizationListingType } from './ListingPreviewCard';

const SERVICE_OPTIONS = [
  'SEO',
  'Web Design',
  'PPC',
  'Social Media Marketing',
  'Branding',
  'Content Marketing',
  'CRO',
  'Email Marketing',
  'Performance Marketing',
];

const MAX_INTRO_LENGTH = 600;

export interface PostPaymentEditorProps {
  agencyId: string;
  agencyName: string;
  stateSlug: string;
  stateName: string;
  listingType: FinalizationListingType;
  rankNumber?: number | null;
  hasCardVisualUpgrade?: boolean;
  logoUrl?: string | null;
  initialAgencyName?: string;
  initialIntro: string;
  initialServices: string[];
  initialWebsiteUrl?: string;
  onAgencyNameChange?: (name: string) => void;
  onFieldChange?: (fields: { intro: string; services: string[]; websiteUrl: string }) => void;
  onLogoUpload?: (file: File) => Promise<void>;
  onSaveAndActivate: (data: { intro: string; services: string[]; websiteUrl: string }) => Promise<void>;
  isLoading?: boolean;
}

export default function PostPaymentEditor({
  agencyId,
  agencyName: agencyNameProp,
  stateSlug,
  stateName,
  listingType,
  rankNumber,
  hasCardVisualUpgrade = false,
  logoUrl,
  initialAgencyName,
  initialIntro,
  initialServices,
  initialWebsiteUrl = '',
  onAgencyNameChange,
  onFieldChange,
  onLogoUpload,
  onSaveAndActivate,
  isLoading = false,
}: PostPaymentEditorProps) {
  const [agencyName, setAgencyName] = useState(initialAgencyName || agencyNameProp || '');
  const [intro, setIntro] = useState(initialIntro || '');
  const [selectedServices, setSelectedServices] = useState<string[]>(initialServices || []);
  const [websiteUrl, setWebsiteUrl] = useState(initialWebsiteUrl || '');
  const [charCount, setCharCount] = useState((initialIntro || '').length);
  const [error, setError] = useState<string | null>(null);
  const [isSaving, setIsSaving] = useState(false);
  const [uploadingLogo, setUploadingLogo] = useState(false);
  const [logoUploadError, setLogoUploadError] = useState<string | null>(null);
  const [logoUploaded, setLogoUploaded] = useState(false);
  const mountedRef = useRef(true);

  useEffect(() => {
    mountedRef.current = true;
    return () => { mountedRef.current = false; };
  }, []);

  const notifyChange = (newIntro: string, newServices: string[], newWebsite: string) => {
    onFieldChange?.({ intro: newIntro, services: newServices, websiteUrl: newWebsite });
  };

  const handleAgencyNameChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setAgencyName(value);
    setError(null);
    onAgencyNameChange?.(value);
  };

  const handleIntroChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    const value = e.target.value;
    if (value.length <= MAX_INTRO_LENGTH) {
      setIntro(value);
      setCharCount(value.length);
      setError(null);
      notifyChange(value, selectedServices, websiteUrl);
    }
  };

  const handleServiceToggle = (service: string) => {
    setSelectedServices(prev => {
      const next = prev.includes(service) ? prev.filter(s => s !== service) : [...prev, service];
      notifyChange(intro, next, websiteUrl);
      return next;
    });
  };

  const handleWebsiteUrlChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    setWebsiteUrl(value);
    setError(null);
    notifyChange(intro, selectedServices, value);
  };

  const handleLogoFileChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file || !onLogoUpload) return;

    if (file.size > 2 * 1024 * 1024) {
      setLogoUploadError('File must be under 2 MB');
      return;
    }
    const allowed = ['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/svg+xml'];
    if (!allowed.includes(file.type)) {
      setLogoUploadError('Please upload a PNG, JPG, WebP, or SVG file');
      return;
    }

    setUploadingLogo(true);
    setLogoUploadError(null);
    setLogoUploaded(false);
    try {
      await onLogoUpload(file);
      if (mountedRef.current) {
        setLogoUploaded(true);
        setTimeout(() => { if (mountedRef.current) setLogoUploaded(false); }, 4000);
      }
    } catch (err) {
      if (mountedRef.current) {
        setLogoUploadError(err instanceof Error ? err.message : 'Upload failed');
      }
    } finally {
      if (mountedRef.current) setUploadingLogo(false);
    }
  };

  const handleSaveAndActivate = async () => {
    setError(null);

    if (!agencyName.trim()) {
      setError('Agency name is required.');
      return;
    }

    const validation = validateIntroText(intro);
    if (!validation.valid) {
      setError(validation.error || 'Please fix the errors and try again.');
      return;
    }

    const websiteValidation = validateWebsiteUrl(websiteUrl);
    if (!websiteValidation.valid) {
      setError(websiteValidation.error || 'Please fix the errors and try again.');
      return;
    }

    if (selectedServices.length === 0) {
      setError('Please select at least one service.');
      return;
    }

    setIsSaving(true);
    try {
      const sanitized = sanitizeIntroText(intro);
      await onSaveAndActivate({ intro: sanitized, services: selectedServices, websiteUrl: websiteUrl.trim() });
    } catch (err) {
      if (mountedRef.current) {
        setError(err instanceof Error ? err.message : 'Failed to save and activate listing');
      }
    } finally {
      if (mountedRef.current) setIsSaving(false);
    }
  };

  const isTop25 = listingType === 'top25_rank' || listingType === 'top25';
  const isSpotlight = listingType === 'spotlight';

  return (
    <div className="space-y-6">
      <div>
        <h2 className="text-xl font-bold text-gray-900 mb-1">
          Review your listing
        </h2>
        <p className="text-sm text-gray-500">
          {isTop25 && rankNumber
            ? `Top 25 #${rankNumber} · ${stateName}`
            : isTop25
            ? `Top 25 · ${stateName}`
            : isSpotlight
            ? `Spotlight · ${stateName}`
            : `Standard listing · ${stateName}`
          }
        </p>
      </div>

      {(isTop25 || hasCardVisualUpgrade) && (
        <div className="flex flex-wrap gap-2">
          {isTop25 && (
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold" style={{ background: '#eff6ff', color: '#1d4ed8', border: '1px solid #bfdbfe' }}>
              <Star className="w-3 h-3 fill-current" />
              Top 25 Listing
            </div>
          )}
          {hasCardVisualUpgrade && (
            <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold" style={{ background: '#fefce8', color: '#a16207', border: '1px solid #fde68a' }}>
              <Zap className="w-3 h-3 fill-current" />
              Card Visual Upgrade
            </div>
          )}
        </div>
      )}

      {error && (
        <div className="flex gap-3 p-4 bg-red-50 border border-red-200 rounded-lg">
          <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0 mt-0.5" />
          <div>
            <p className="font-medium text-red-900 text-sm">Cannot activate listing</p>
            <p className="text-sm text-red-800 mt-0.5">{error}</p>
          </div>
        </div>
      )}

      <div>
        <label htmlFor={`agency-name-${agencyId}`} className="block text-sm font-semibold text-gray-900 mb-2">
          Agency name <span className="text-red-500">*</span>
        </label>
        <input
          id={`agency-name-${agencyId}`}
          type="text"
          value={agencyName}
          onChange={handleAgencyNameChange}
          placeholder="e.g., Acme Marketing Agency"
          className="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
        />
      </div>

      {onLogoUpload && (
        <div>
          <label className="block text-sm font-semibold text-gray-900 mb-2">
            Agency logo {!logoUrl && <span className="font-normal text-gray-500">(recommended)</span>}
          </label>

          <div className="flex items-center gap-4">
            {logoUrl && (
              <div className="flex-shrink-0 w-16 h-12 rounded-lg bg-white border border-gray-200 overflow-hidden flex items-center justify-center p-1.5">
                <img src={logoUrl} alt="Logo preview" className="w-full h-full object-contain" />
              </div>
            )}

            <label
              htmlFor={`logo-upload-${agencyId}`}
              className={`flex-1 flex items-center justify-center gap-2 px-4 py-2.5 border-2 border-dashed rounded-lg cursor-pointer transition-colors text-sm font-medium ${
                uploadingLogo
                  ? 'border-gray-200 bg-gray-50 text-gray-400 cursor-not-allowed'
                  : 'border-blue-400 hover:border-blue-500 hover:bg-blue-50 text-blue-600'
              }`}
            >
              {uploadingLogo ? (
                <><Loader2 className="w-4 h-4 animate-spin" />Uploading...</>
              ) : (
                <><Upload className="w-4 h-4" />{logoUrl ? 'Change logo' : 'Upload logo'}</>
              )}
            </label>
            <input
              id={`logo-upload-${agencyId}`}
              type="file"
              accept="image/png,image/jpeg,image/jpg,image/webp,image/svg+xml"
              className="hidden"
              onChange={handleLogoFileChange}
              disabled={uploadingLogo}
            />
          </div>

          {logoUploadError && (
            <p className="mt-2 text-xs text-red-600">{logoUploadError}</p>
          )}
          {logoUploaded && (
            <div className="mt-2 flex items-center gap-1.5 text-green-700 text-xs">
              <CheckCircle2 className="w-3.5 h-3.5" />
              Logo saved successfully
            </div>
          )}
          <p className="mt-1.5 text-xs text-gray-500">PNG, JPG, WebP or SVG · max 2 MB</p>
        </div>
      )}

      <div>
        <label htmlFor={`website-url-${agencyId}`} className="block text-sm font-semibold text-gray-900 mb-2">
          Agency website
          {!websiteUrl && <span className="ml-1 text-xs font-normal text-gray-500">(optional)</span>}
        </label>
        <input
          id={`website-url-${agencyId}`}
          type="text"
          value={websiteUrl}
          onChange={handleWebsiteUrlChange}
          placeholder="e.g., https://youragency.com"
          className="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
        />
      </div>

      <div>
        <label htmlFor={`intro-${agencyId}`} className="block text-sm font-semibold text-gray-900 mb-2">
          Listing description <span className="text-red-500">*</span>
          {!intro && (
            <span className="ml-1 text-xs font-normal text-amber-600">Missing — required before publishing</span>
          )}
        </label>
        <textarea
          id={`intro-${agencyId}`}
          value={intro}
          onChange={handleIntroChange}
          rows={5}
          maxLength={MAX_INTRO_LENGTH}
          placeholder="Describe your agency, services, and what makes you unique. Do not include URLs or links."
          className={`w-full px-4 py-3 border rounded-lg text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all resize-none ${
            error && error.includes('intro') ? 'border-red-300 bg-red-50' : 'border-gray-300'
          }`}
        />
        <div className="flex justify-between items-center mt-1">
          <p className="text-xs text-gray-400">No URLs or links allowed</p>
          <p className={`text-xs ${charCount > MAX_INTRO_LENGTH * 0.9 ? 'text-amber-600' : 'text-gray-400'}`}>
            {charCount}/{MAX_INTRO_LENGTH}
          </p>
        </div>
      </div>

      <div>
        <label className="block text-sm font-semibold text-gray-900 mb-3">
          Services offered <span className="text-red-500">*</span>
          {selectedServices.length === 0 && (
            <span className="ml-1 text-xs font-normal text-amber-600">Select at least one</span>
          )}
        </label>
        <div className="grid grid-cols-2 gap-y-2 gap-x-4">
          {SERVICE_OPTIONS.map(service => (
            <label key={service} className="flex items-center gap-2 cursor-pointer group py-0.5">
              <input
                type="checkbox"
                checked={selectedServices.includes(service)}
                onChange={() => handleServiceToggle(service)}
                className="w-4 h-4 rounded text-blue-600 border-gray-300 focus:ring-blue-500"
              />
              <span className="text-sm text-gray-700 group-hover:text-gray-900">{service}</span>
            </label>
          ))}
        </div>
      </div>

      <div className="pt-2">
        <button
          onClick={handleSaveAndActivate}
          disabled={isSaving || isLoading}
          className="w-full px-6 py-3.5 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 active:bg-blue-800 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2 text-base shadow-sm"
        >
          {isSaving || isLoading ? (
            <><Loader2 className="w-5 h-5 animate-spin" />Publishing listing...</>
          ) : (
            'Publish Listing'
          )}
        </button>
        <p className="text-xs text-center text-gray-400 mt-2">
          Your listing will be saved and activated immediately after publishing.
        </p>
      </div>
    </div>
  );
}
