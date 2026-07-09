import { useState } from 'react';
import type { ThankYouTestData, PaymentState } from '../../utils/thankYouPageTestData';
import type { ProductType, ListingType } from '../../config/thankYouPageVariants';
import {
  getAvailableStates,
  getAvailableServices,
  getPresetsList,
  applyPreset
} from '../../utils/thankYouPageTestData';
import { getAllVariants } from '../../config/thankYouPageVariants';
import { formatStateName } from '../../utils/formatLocation';

interface ThankYouPageTestControlsProps {
  testData: ThankYouTestData;
  onTestDataChange: (data: ThankYouTestData) => void;
  onPreviewClick: () => void;
  validationMode: 'ui-only' | 'dry-run' | 'live';
  onValidationModeChange: (mode: 'ui-only' | 'dry-run' | 'live') => void;
  selectedVariant: string;
  onVariantChange: (variant: string) => void;
  isValidating?: boolean;
  onRunSmokeTest?: () => void;
  isSmokeTestRunning?: boolean;
}

export function ThankYouPageTestControls({
  testData,
  onTestDataChange,
  onPreviewClick,
  validationMode,
  onValidationModeChange,
  selectedVariant,
  onVariantChange,
  isValidating = false,
  onRunSmokeTest,
  isSmokeTestRunning = false
}: ThankYouPageTestControlsProps) {
  const [expandedSections, setExpandedSections] = useState<Record<string, boolean>>({
    basic: true,
    content: true,
    variant: false,
    validation: false
  });

  const toggleSection = (section: string) => {
    setExpandedSections((prev) => ({
      ...prev,
      [section]: !prev[section]
    }));
  };

  const handlePresetSelect = (presetKey: string) => {
    const newData = applyPreset(presetKey);
    onTestDataChange(newData);
  };

  const handleStateChange = (state: string) => {
    const stateSlug = state.toLowerCase().replace(/\s+/g, '-');
    onTestDataChange({
      ...testData,
      state,
      stateSlug
    });
  };

  const handleServiceToggle = (service: string) => {
    const newServices = testData.services.includes(service)
      ? testData.services.filter((s) => s !== service)
      : [...testData.services, service];
    onTestDataChange({
      ...testData,
      services: newServices
    });
  };

  const presets = getPresetsList();
  const states = getAvailableStates();
  const allServices = getAvailableServices();
  const variants = getAllVariants();

  return (
    <div className="space-y-4">
      <div className="bg-white rounded-lg border border-slate-200">
        <button
          onClick={() => toggleSection('basic')}
          className="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-50 transition-colors"
        >
          <h3 className="text-sm font-semibold text-slate-900">Basic Settings</h3>
          <span className="text-slate-400">{expandedSections.basic ? '−' : '+'}</span>
        </button>

        {expandedSections.basic && (
          <div className="border-t border-slate-200 px-4 py-4 space-y-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Payment State
              </label>
              <div className="grid grid-cols-3 gap-2">
                {(['confirmed', 'pending', 'failed'] as PaymentState[]).map((state) => (
                  <button
                    key={state}
                    onClick={() =>
                      onTestDataChange({
                        ...testData,
                        paymentState: state
                      })
                    }
                    className={`px-3 py-2 rounded text-xs font-medium transition-colors ${
                      testData.paymentState === state
                        ? 'bg-blue-500 text-white'
                        : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                    }`}
                  >
                    {state.charAt(0).toUpperCase() + state.slice(1)}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Product Type
              </label>
              <select
                value={testData.productType}
                onChange={(e) => {
                  let listingType: ListingType;
                  switch (e.target.value) {
                    case 'top25':
                      listingType = 'top25_rank';
                      break;
                    case 'spotlight':
                      listingType = 'spotlight';
                      break;
                    case 'activation':
                      listingType = 'existing_activation';
                      break;
                    default:
                      listingType = 'other_listing';
                  }
                  onTestDataChange({
                    ...testData,
                    productType: e.target.value as ProductType,
                    listingType
                  });
                }}
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                <option value="top25">Top 25</option>
                <option value="spotlight">Spotlight</option>
                <option value="other_listing">Other Listing</option>
                <option value="activation">Activation</option>
              </select>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Agency Name
              </label>
              <input
                type="text"
                value={testData.agencyName}
                onChange={(e) =>
                  onTestDataChange({
                    ...testData,
                    agencyName: e.target.value
                  })
                }
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="Enter agency name"
              />
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">State</label>
              <select
                value={testData.state}
                onChange={(e) => handleStateChange(e.target.value)}
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
              >
                {states.map((state) => (
                  <option key={state} value={state}>
                    {formatStateName(state)}
                  </option>
                ))}
              </select>
            </div>

            <div>
              <label className="flex items-center gap-2 text-xs font-semibold text-slate-700">
                <input
                  type="checkbox"
                  checked={testData.hasCardVisualUpgrade}
                  onChange={(e) =>
                    onTestDataChange({
                      ...testData,
                      hasCardVisualUpgrade: e.target.checked
                    })
                  }
                  className="rounded"
                />
                Has Card Visual Upgrade
              </label>
            </div>

            <div className="pt-2">
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Load Preset
              </label>
              <select
                onChange={(e) => {
                  if (e.target.value) {
                    handlePresetSelect(e.target.value);
                  }
                }}
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                defaultValue=""
              >
                <option value="">Select a preset...</option>
                {presets.map(({ key, preset }) => (
                  <option key={key} value={key}>
                    {preset.name}
                  </option>
                ))}
              </select>
              <p className="text-xs text-slate-500 mt-2">
                {testData.paymentState === 'confirmed'
                  ? '✓ Payment confirmed'
                  : testData.paymentState === 'pending'
                    ? '⏳ Payment pending'
                    : '✗ Payment failed'}
              </p>
            </div>
          </div>
        )}
      </div>

      <div className="bg-white rounded-lg border border-slate-200">
        <button
          onClick={() => toggleSection('content')}
          className="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-50 transition-colors"
        >
          <h3 className="text-sm font-semibold text-slate-900">Content</h3>
          <span className="text-slate-400">{expandedSections.content ? '−' : '+'}</span>
        </button>

        {expandedSections.content && (
          <div className="border-t border-slate-200 px-4 py-4 space-y-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Website URL
              </label>
              <input
                type="text"
                value={testData.websiteUrl}
                onChange={(e) =>
                  onTestDataChange({
                    ...testData,
                    websiteUrl: e.target.value
                  })
                }
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                placeholder="https://example.com"
              />
              <p className="text-xs text-slate-500 mt-1">Optional field</p>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Intro Text ({testData.intro.length}/600)
              </label>
              <textarea
                value={testData.intro}
                onChange={(e) =>
                  onTestDataChange({
                    ...testData,
                    intro: e.target.value.slice(0, 600)
                  })
                }
                className="w-full px-3 py-2 border border-slate-300 rounded text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                rows={4}
                placeholder="Describe your agency..."
              />
              <p className="text-xs text-slate-500 mt-1">
                Validates: no URLs, no gambling/adult keywords
              </p>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Main Services ({testData.services.length} selected)
              </label>
              <div className="grid grid-cols-2 gap-2">
                {allServices.map((service) => (
                  <label key={service} className="flex items-center gap-2 text-sm">
                    <input
                      type="checkbox"
                      checked={testData.services.includes(service)}
                      onChange={() => handleServiceToggle(service)}
                      className="rounded"
                    />
                    {service}
                  </label>
                ))}
              </div>
            </div>
          </div>
        )}
      </div>

      <div className="bg-white rounded-lg border border-slate-200">
        <button
          onClick={() => toggleSection('variant')}
          className="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-50 transition-colors"
        >
          <h3 className="text-sm font-semibold text-slate-900">Thank-you Page Variant</h3>
          <span className="text-slate-400">{expandedSections.variant ? '−' : '+'}</span>
        </button>

        {expandedSections.variant && (
          <div className="border-t border-slate-200 px-4 py-4 space-y-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-2">
                Version
              </label>
              <div className="space-y-2">
                {variants.map((variant) => (
                  <label
                    key={variant.id}
                    className={`flex items-start gap-3 p-3 border rounded cursor-pointer transition-colors ${
                      selectedVariant === variant.id
                        ? 'bg-blue-50 border-blue-300'
                        : 'bg-slate-50 border-slate-200 hover:border-slate-300'
                    }`}
                  >
                    <input
                      type="radio"
                      name="variant"
                      value={variant.id}
                      checked={selectedVariant === variant.id}
                      onChange={() => onVariantChange(variant.id)}
                      className="mt-1"
                    />
                    <div>
                      <div className="text-sm font-medium text-slate-900">{variant.name}</div>
                      <div className="text-xs text-slate-600">{variant.description}</div>
                      {!variant.isActive && (
                        <div className="text-xs text-slate-500 mt-1">(Not yet active)</div>
                      )}
                    </div>
                  </label>
                ))}
              </div>
            </div>

            <div className="text-xs text-slate-600 bg-slate-50 p-3 rounded">
              The variant selector allows manual testing of different thank-you page designs. Future
              versions can be activated for A/B testing or product-specific optimization.
            </div>
          </div>
        )}
      </div>

      <div className="bg-white rounded-lg border border-slate-200">
        <button
          onClick={() => toggleSection('validation')}
          className="w-full flex items-center justify-between px-4 py-3 hover:bg-slate-50 transition-colors"
        >
          <h3 className="text-sm font-semibold text-slate-900">Validation Mode</h3>
          <span className="text-slate-400">{expandedSections.validation ? '−' : '+'}</span>
        </button>

        {expandedSections.validation && (
          <div className="border-t border-slate-200 px-4 py-4 space-y-4">
            <div className="space-y-2">
              {(['ui-only', 'dry-run', 'live'] as const).map((mode) => (
                <label
                  key={mode}
                  className={`flex items-start gap-3 p-3 border rounded cursor-pointer transition-colors ${
                    validationMode === mode
                      ? 'bg-blue-50 border-blue-300'
                      : 'bg-slate-50 border-slate-200 hover:border-slate-300'
                  }`}
                >
                  <input
                    type="radio"
                    name="validation-mode"
                    value={mode}
                    checked={validationMode === mode}
                    onChange={() => onValidationModeChange(mode)}
                  />
                  <div>
                    <div className="text-sm font-medium text-slate-900">
                      {mode === 'ui-only' && 'UI-Only Validation'}
                      {mode === 'dry-run' && 'QA API Dry-run'}
                      {mode === 'live' && 'Live API (Admin Only)'}
                    </div>
                    <div className="text-xs text-slate-600">
                      {mode === 'ui-only' && 'Client-side validation only'}
                      {mode === 'dry-run' && 'Backend validation without activation (recommended)'}
                      {mode === 'live' && 'Full activation (use with caution)'}
                    </div>
                  </div>
                </label>
              ))}
            </div>

            <div className="text-xs text-slate-600 bg-blue-50 p-3 rounded border border-blue-200">
              DRY-RUN mode is recommended for testing. It validates your data without creating real
              listings or subscriptions.
            </div>
          </div>
        )}
      </div>

      <button
        onClick={onRunSmokeTest}
        disabled={isSmokeTestRunning || testData.services.length === 0}
        className={`w-full py-2.5 rounded font-medium transition-colors mb-2 border-2 ${
          isSmokeTestRunning || testData.services.length === 0
            ? 'bg-slate-100 border-slate-300 text-slate-600 cursor-not-allowed'
            : 'bg-green-50 border-green-300 text-green-700 hover:bg-green-100'
        }`}
      >
        {isSmokeTestRunning ? '⏳ Running Smoke Test...' : '🧪 Run Live Activation Smoke Test'}
      </button>

      <button
        onClick={onPreviewClick}
        disabled={isValidating}
        className={`w-full py-2.5 rounded font-medium transition-colors ${
          isValidating
            ? 'bg-slate-300 text-slate-600 cursor-not-allowed'
            : 'bg-blue-500 text-white hover:bg-blue-600'
        }`}
      >
        {isValidating ? '⏳ Loading...' : 'Open Thank-you Page Preview'}
      </button>
    </div>
  );
}
