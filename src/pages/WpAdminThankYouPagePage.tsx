import { useState } from 'react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';
import AdminRoute from '../components/wpadmin/AdminRoute';
import { ThankYouPageTestControls } from '../components/admin/ThankYouPageTestControls';
import { ThankYouPagePreview } from '../components/admin/ThankYouPagePreview';
import { SmokeTestResults } from '../components/admin/SmokeTestResults';
import type { ThankYouTestData } from '../utils/thankYouPageTestData';
import { createDefaultTestData } from '../utils/thankYouPageTestData';

interface DryRunResponse {
  valid: boolean;
  errors?: Record<string, string>;
}

interface SmokeTestResult {
  success: boolean;
  passed: boolean;
  errors?: Record<string, string>;
  warnings?: string[];
  testResults?: {
    validationPassed: boolean;
    validationErrors?: Record<string, string>;
    dbWriteResult?: string;
    listingId?: string;
    timestamp: string;
    testAgencyId: string;
  };
}

export default function WpAdminThankYouPagePage() {
  const [testData, setTestData] = useState<ThankYouTestData>(createDefaultTestData());
  const [selectedVariant, setSelectedVariant] = useState<string>('default');
  const [validationMode, setValidationMode] = useState<'ui-only' | 'dry-run' | 'live'>(
    'dry-run'
  );
  const [showPreview, setShowPreview] = useState(false);
  const [isValidating, setIsValidating] = useState(false);
  const [dryRunResponse, setDryRunResponse] = useState<DryRunResponse | null>(null);
  const [isSmokeTestRunning, setIsSmokeTestRunning] = useState(false);
  const [smokeTestResult, setSmokeTestResult] = useState<SmokeTestResult | null>(null);
  const [showSmokeTestResult, setShowSmokeTestResult] = useState(false);

  const handleRunSmokeTest = async () => {
    setIsSmokeTestRunning(true);
    setSmokeTestResult(null);
    setShowSmokeTestResult(true);

    try {
      const response = await fetch(
        `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/listing-smoke-test`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`
          },
          body: JSON.stringify({
            intro: testData.intro,
            websiteUrl: testData.websiteUrl,
            services: testData.services,
            listingType: testData.listingType
          })
        }
      );

      const result = await response.json();
      setSmokeTestResult(result);
    } catch (error) {
      console.error('Smoke test error:', error);
      setSmokeTestResult({
        success: false,
        passed: false,
        errors: {
          network: `Failed to reach smoke test service: ${error instanceof Error ? error.message : 'Unknown error'}`
        }
      });
    } finally {
      setIsSmokeTestRunning(false);
    }
  };

  const handlePreviewClick = async () => {
    setIsValidating(true);
    setDryRunResponse(null);

    if (validationMode === 'dry-run') {
      try {
        const response = await fetch(
          `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/listing-validate-dry-run`,
          {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              Authorization: `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`
            },
            body: JSON.stringify({
              intro: testData.intro,
              websiteUrl: testData.websiteUrl,
              services: testData.services
            })
          }
        );

        if (response.ok) {
          const result = await response.json();
          setDryRunResponse(result);
        } else {
          console.error('Dry-run validation failed');
          setDryRunResponse({
            valid: false,
            errors: { server: 'Validation service unavailable' }
          });
        }
      } catch (error) {
        console.error('Dry-run error:', error);
        setDryRunResponse({
          valid: false,
          errors: { network: 'Failed to reach validation service' }
        });
      }
    }

    setIsValidating(false);
    setShowPreview(true);
  };

  return (
    <AdminRoute>
      <WpAdminLayout
        pageTitle="Thank-you Page"
        pageSubtitle="Test and preview thank-you page states without Stripe"
      >
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          <div className="lg:col-span-1">
            <ThankYouPageTestControls
              testData={testData}
              onTestDataChange={setTestData}
              onPreviewClick={handlePreviewClick}
              validationMode={validationMode}
              onValidationModeChange={setValidationMode}
              selectedVariant={selectedVariant}
              onVariantChange={setSelectedVariant}
              isValidating={isValidating}
              onRunSmokeTest={handleRunSmokeTest}
              isSmokeTestRunning={isSmokeTestRunning}
            />
          </div>

          <div className="lg:col-span-2">
            <div className="bg-white rounded-lg border border-slate-200 p-6">
              <h3 className="text-lg font-semibold text-slate-900 mb-4">About this Tool</h3>

              <div className="space-y-4 text-sm text-slate-700">
                <div>
                  <h4 className="font-semibold text-slate-900 mb-1">Purpose</h4>
                  <p>
                    This QA tool lets you preview and test the thank-you page flow without
                    processing a real Stripe payment. Use it to verify:
                  </p>
                  <ul className="list-disc pl-5 mt-2 space-y-1">
                    <li>Thank-you page rendering (paid/pending/failed states)</li>
                    <li>Post-payment editor form behavior</li>
                    <li>Website URL validation</li>
                    <li>Intro text validation (blocked keywords, URLs, etc.)</li>
                    <li>Different thank-you page variants</li>
                  </ul>
                </div>

                <div className="border-t border-slate-200 pt-4">
                  <h4 className="font-semibold text-slate-900 mb-1">Validation Modes</h4>
                  <div className="space-y-2">
                    <div>
                      <span className="font-medium text-slate-900">UI-Only:</span> Client-side
                      validation only. Useful for testing form UX.
                    </div>
                    <div>
                      <span className="font-medium text-slate-900">Dry-run:</span> Backend
                      validation without creating listings. Recommended for most testing.
                    </div>
                    <div>
                      <span className="font-medium text-slate-900">Live:</span> Full activation
                      (admin confirmation required). Use with caution.
                    </div>
                  </div>
                </div>

                <div className="border-t border-slate-200 pt-4">
                  <h4 className="font-semibold text-slate-900 mb-1">Variant System</h4>
                  <p>
                    The thank-you page supports multiple variants for A/B testing and
                    product-specific optimization. Currently available:
                  </p>
                  <ul className="list-disc pl-5 mt-2 space-y-1">
                    <li>
                      <span className="font-medium">Default:</span> Standard thank-you flow
                    </li>
                    <li>
                      <span className="font-medium">V2+:</span> Future variants (not yet active)
                    </li>
                  </ul>
                  <p className="mt-2 text-slate-600">
                    Future variants can be activated for campaign-specific or product-specific
                    thank-you experiences.
                  </p>
                </div>

                <div className="border-t border-slate-200 pt-4">
                  <h4 className="font-semibold text-slate-900 mb-1">Smoke Test (NEW)</h4>
                  <p>
                    The <strong>Live Activation Smoke Test</strong> verifies the real activation flow works:
                  </p>
                  <ul className="list-disc pl-5 mt-2 space-y-1">
                    <li>Uses the same validators as live activation</li>
                    <li>Tests database write path (no Stripe required)</li>
                    <li>Shows field-level validation errors</li>
                    <li>Confirms your data passes production validation</li>
                    <li>Admin-only test records marked as test source</li>
                  </ul>
                </div>

                <div className="border-t border-slate-200 pt-4 bg-blue-50 p-3 rounded">
                  <p className="text-xs text-blue-900">
                    <span className="font-semibold">Security Note:</span> This tool is internal
                    only (wp-admin). The public /order/complete route remains strictly
                    payment-gated by server-side confirmation.
                  </p>
                </div>
              </div>
            </div>

            {showSmokeTestResult && (
              <div className="mt-6">
                <SmokeTestResults
                  result={smokeTestResult}
                  isLoading={isSmokeTestRunning}
                  onClose={() => setShowSmokeTestResult(false)}
                />
              </div>
            )}

            <div className="mt-6 bg-slate-50 rounded-lg border border-slate-200 p-6">
              <h3 className="text-lg font-semibold text-slate-900 mb-4">Presets Explained</h3>

              <div className="space-y-3 text-sm text-slate-700">
                <div>
                  <span className="font-medium text-slate-900">Valid Top 25 (Paid):</span> A
                  complete, valid Top 25 listing with all required fields and confirmed payment.
                </div>
                <div>
                  <span className="font-medium text-slate-900">Valid Spotlight (Paid):</span> A
                  complete Spotlight placement with confirmed payment.
                </div>
                <div>
                  <span className="font-medium text-slate-900">Intro with URL (Blocked):</span> An
                  intro containing a website URL. This should fail validation.
                </div>
                <div>
                  <span className="font-medium text-slate-900">Intro with Gambling (Blocked):</span>{' '}
                  An intro with prohibited keywords. This should fail validation.
                </div>
                <div>
                  <span className="font-medium text-slate-900">Invalid Website URL:</span> A
                  malformed website URL. This should fail validation.
                </div>
                <div>
                  <span className="font-medium text-slate-900">Payment Pending:</span> Simulate a
                  pending payment state (shows spinner).
                </div>
                <div>
                  <span className="font-medium text-slate-900">Payment Failed:</span> Simulate a
                  failed payment state (shows error).
                </div>
              </div>
            </div>
          </div>
        </div>

        {showPreview && (
          <ThankYouPagePreview
            testData={testData}
            selectedVariant={selectedVariant}
            validationMode={validationMode}
            onClose={() => setShowPreview(false)}
            isValidating={isValidating}
            dryRunResponse={dryRunResponse || undefined}
          />
        )}
      </WpAdminLayout>
    </AdminRoute>
  );
}
