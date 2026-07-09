import { useState, useRef } from 'react';
import { Upload, CheckCircle2, Loader2, X } from 'lucide-react';

interface CompactLogoUploadFieldProps {
  agencyId?: string;
  stateSlug?: string;
  onUpload: (logoUrl: string) => void;
  className?: string;
  helperText?: string;
}

export default function CompactLogoUploadField({
  agencyId,
  stateSlug,
  onUpload,
  className = '',
  helperText,
}: CompactLogoUploadFieldProps) {
  const [preview, setPreview] = useState<string | null>(null);
  const [uploading, setUploading] = useState(false);
  const [uploadedUrl, setUploadedUrl] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const handleChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (file.size > 2 * 1024 * 1024) {
      setError('File must be under 2 MB');
      return;
    }
    const allowed = ['image/png', 'image/jpeg', 'image/jpg', 'image/webp', 'image/svg+xml'];
    if (!allowed.includes(file.type)) {
      setError('Use PNG, JPG, WebP, or SVG');
      return;
    }

    setError(null);
    const reader = new FileReader();
    reader.onload = (ev) => setPreview(ev.target?.result as string);
    reader.readAsDataURL(file);

    setUploading(true);
    try {
      const formData = new FormData();
      formData.append('logo', file);
      formData.append('agencyId', agencyId || `temp-${Date.now()}`);
      if (stateSlug) formData.append('stateSlug', stateSlug);

      const res = await fetch(
        `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/upload-logo`,
        {
          method: 'POST',
          headers: { Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}` },
          body: formData,
        }
      );
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Upload failed');
      setUploadedUrl(data.logoUrl);
      onUpload(data.logoUrl);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Upload failed');
      setPreview(null);
    } finally {
      setUploading(false);
    }
  };

  const handleClear = () => {
    setPreview(null);
    setUploadedUrl(null);
    setError(null);
    if (inputRef.current) inputRef.current.value = '';
  };

  const inputId = `compact-logo-upload-${Math.random().toString(36).slice(2, 7)}`;

  return (
    <div className={className}>
      <div className="flex items-center gap-2">
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-1.5">
            <span className="text-xs font-medium text-gray-700">Agency logo</span>
            <span className="text-[10px] text-gray-400 font-normal">Optional</span>
            {uploadedUrl && !error && (
              <span className="text-[10px] text-green-600 font-medium flex items-center gap-0.5 ml-1">
                <CheckCircle2 size={10} />
                Saved
              </span>
            )}
            {error && (
              <span className="text-[10px] text-red-600 ml-1">{error}</span>
            )}
          </div>
          {helperText && !uploadedUrl && (
            <p className="text-[10px] text-gray-400 leading-tight mt-0.5">{helperText}</p>
          )}
        </div>

        <div className="flex items-center gap-1.5 flex-shrink-0">
          {preview && (
            <div className="relative flex-shrink-0">
              <img
                src={preview}
                alt="Logo preview"
                className="w-7 h-7 object-contain border border-gray-200 rounded bg-white p-px"
              />
              {!uploading && (
                <button
                  type="button"
                  onClick={handleClear}
                  className="absolute -top-1 -right-1 bg-gray-500 rounded-full w-3 h-3 flex items-center justify-center"
                  title="Remove"
                >
                  <X size={8} color="#fff" />
                </button>
              )}
            </div>
          )}

          <label
            htmlFor={inputId}
            className="inline-flex items-center gap-1 px-2 py-1 border border-dashed border-blue-400 rounded cursor-pointer text-[11px] font-medium text-blue-600 bg-blue-50 hover:bg-blue-100 transition-colors select-none"
            style={{ opacity: uploading ? 0.6 : 1, cursor: uploading ? 'not-allowed' : 'pointer' }}
          >
            {uploading ? (
              <><Loader2 size={11} className="animate-spin" />Uploading</>
            ) : uploadedUrl ? (
              <><Upload size={11} />Change</>
            ) : (
              <><Upload size={11} />Upload</>
            )}
          </label>
          <input
            ref={inputRef}
            id={inputId}
            type="file"
            accept="image/png,image/jpeg,image/jpg,image/webp,image/svg+xml"
            className="hidden"
            onChange={handleChange}
            disabled={uploading}
          />
        </div>
      </div>
    </div>
  );
}
