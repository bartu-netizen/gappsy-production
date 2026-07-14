import { lazy, Suspense } from "react";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";

// ─── EAGER: Pages that must be available instantly (SEO-critical or main funnel entry) ───
import HomePage from "./pages/HomePage";
import StatePageTemplate from "./pages/StatePageTemplate";
import DatabaseRoutedPage from "./pages/DatabaseRoutedPage";
import MarketingAgenciesHub from "./pages/MarketingAgenciesHub";
import ScrollManager from "./components/ScrollManager";
import ErrorBoundary from "./components/ErrorBoundary";
import GoogleAnalytics from "./components/GoogleAnalytics";
import AvailabilityScrollReset from "./components/AvailabilityScrollReset";
import { AdminSessionProvider } from "./contexts/AdminSessionContext";
import AdminRoute from "./components/wpadmin/AdminRoute";

// ─── LAZY: All other pages split into async chunks ───────────────────────────────────────

// Public / content pages
const USAHub = lazy(() => import("./USAHub"));
const GappsyProofPage = lazy(() => import("./pages/GappsyProofPage"));
const AnalyticsPage = lazy(() => import("./pages/AnalyticsPage"));
const AppbuilderPage = lazy(() => import("./pages/AppbuilderPage"));
const PublishServicePage = lazy(() => import("./pages/PublishServicePage"));
const DoneForYouAppCreationPage = lazy(() => import("./pages/DoneForYouAppCreationPage"));
const LoginAppsPage = lazy(() => import("./pages/LoginAppsPage"));
const AboutPage = lazy(() => import("./pages/AboutPage"));
const ContactPage = lazy(() => import("./pages/ContactPage"));
const EditorialPolicyPage = lazy(() => import("./pages/EditorialPolicyPage"));
const TermsPage = lazy(() => import("./pages/TermsPage"));
const PrivacyPage = lazy(() => import("./pages/PrivacyPage"));
const RefundPage = lazy(() => import("./pages/RefundPage"));
const AgencyReviewPage = lazy(() => import("./pages/AgencyReviewPage"));
const ToolsIndexPage = lazy(() => import("./pages/ToolsIndexPage"));
const ToolDetailPage = lazy(() => import("./pages/ToolDetailPage"));
const ToolCategoriesIndexPage = lazy(() => import("./pages/ToolCategoriesIndexPage"));
const ToolCategoryDetailPage = lazy(() => import("./pages/ToolCategoryDetailPage"));
const ToolTagDetailPage = lazy(() => import("./pages/ToolTagDetailPage"));
const ComparePage = lazy(() => import("./pages/ComparePage"));
const CompareDetailPage = lazy(() => import("./pages/CompareDetailPage"));
const FeatureMyProductPage = lazy(() => import("./pages/FeatureMyProductPage"));
const EmailPreferencesPage = lazy(() => import("./pages/EmailPreferencesPage"));

// Your Agency funnel
const YourAgencySearchPage = lazy(() => import("./pages/YourAgencySearchPage"));
const YourAgencyProfilePage = lazy(() => import("./pages/YourAgencyProfilePage"));
const YourAgencyTokenPage = lazy(() => import("./pages/YourAgencyTokenPage"));
const YourAgencyNotFoundPage = lazy(() => import("./pages/YourAgencyNotFoundPage"));

// Smart Routing
const SmartContinuePage = lazy(() => import("./pages/SmartContinuePage"));
const ManageListingPage = lazy(() => import("./pages/ManageListingPage"));
const RequestReplayPage = lazy(() => import("./pages/RequestReplayPage"));
const RequestComparePage = lazy(() => import("./pages/RequestComparePage"));

// Availability funnel
const AvailabilityStartPage = lazy(() => import("./pages/AvailabilityStartPage"));
const AvailabilityClientPage = lazy(() => import("./pages/AvailabilityClientPage"));
const AvailabilityVerifyPage = lazy(() => import("./pages/AvailabilityVerifyPage"));
const AvailabilityOwnerEditListingPage = lazy(() => import("./pages/AvailabilityOwnerEditListingPage"));
const AvailabilityOwnerDemoPage = lazy(() => import("./pages/AvailabilityOwnerDemoPage"));
const AvailabilityOwnerPreviewPage = lazy(() => import("./pages/AvailabilityOwnerPreviewPage"));
const AvailabilityOwnerSimulatePage = lazy(() => import("./pages/AvailabilityOwnerSimulatePage"));
const AvailabilityOwnerDashboardPage = lazy(() => import("./pages/AvailabilityOwnerDashboardPage"));

// Activation / checkout
const ExistingListingGatePage = lazy(() => import("./pages/ExistingListingGatePage"));
const OfferRedirectPage = lazy(() => import("./pages/OfferRedirectPage"));
const ActivationUpgradePage = lazy(() => import("./pages/ActivationUpgradePage"));
const StandardUpgradeOfferPage = lazy(() => import("./pages/StandardUpgradeOfferPage"));
const SpotlightConfirmPage = lazy(() => import("./pages/SpotlightConfirmPage"));
const Top25ConfirmPage = lazy(() => import("./pages/Top25ConfirmPage"));
const Top25UpgradeLandingPage = lazy(() => import("./pages/Top25UpgradeLandingPage"));
const Top25ClaimConfirmPage = lazy(() => import("./pages/Top25ClaimConfirmPage"));
const OrderCompletePage = lazy(() => import("./pages/OrderCompletePage"));

// WP Admin — single heavy chunk via shared import group
const WpAdminLoginPage = lazy(() => import("./pages/WpAdminLoginPage"));
const WpAdminDashboardPage = lazy(() => import("./pages/WpAdminDashboardPage"));
const WpAdminTop25EditorPage = lazy(() => import("./pages/WpAdminTop25EditorPage"));
const WpAdminSettingsPage = lazy(() => import("./pages/WpAdminSettingsPage"));
const WpAdminSubmissionsPage = lazy(() => import("./pages/WpAdminSubmissionsPage"));
const WpAdminStripePage = lazy(() => import("./pages/WpAdminStripePage"));
const WpAdminAuditLogPage = lazy(() => import("./pages/WpAdminAuditLogPage"));
const WpAdminRevenueHealthPage = lazy(() => import("./pages/WpAdminRevenueHealthPage"));
const WpAdminThankYouPagePage = lazy(() => import("./pages/WpAdminThankYouPagePage"));
const WpAdminEmailNotificationsPage = lazy(() => import("./pages/WpAdminEmailNotificationsPage"));
const WpAdminCustomerSuppressionPage = lazy(() => import("./pages/WpAdminCustomerSuppressionPage"));
const WpAdminAgencyEmailAutomationsPage = lazy(() => import("./pages/WpAdminAgencyEmailAutomationsPage"));
const WpAdminAvailabilityAnalyticsPage = lazy(() => import("./pages/WpAdminAvailabilityAnalyticsPage"));
const WpAdminClaimLinksPage = lazy(() => import("./pages/WpAdminClaimLinksPage"));
const WpAdminIntentCenterPage = lazy(() => import("./pages/WpAdminIntentCenterPage"));
const WpAdminActivityFeedPage = lazy(() => import("./pages/WpAdminActivityFeedPage"));
const AdminSidebarAdsPage = lazy(() => import("./pages/AdminSidebarAdsPage"));
const AdminAgencyReviewsPage = lazy(() => import("./pages/AdminAgencyReviewsPage"));
const AdminAgencyReviewsImportPage = lazy(() => import("./pages/AdminAgencyReviewsImportPage"));
const AdminAgencyReviewEditorPage = lazy(() => import("./pages/AdminAgencyReviewEditorPage"));
const WpAdminDiscoveryDashboardPage = lazy(() => import("./pages/WpAdminDiscoveryDashboardPage"));
const WpAdminDiscoveryQueuePage = lazy(() => import("./pages/WpAdminDiscoveryQueuePage"));
const WpAdminCrawlQueuePage = lazy(() => import("./pages/WpAdminCrawlQueuePage"));
const WpAdminSchedulerPage = lazy(() => import("./pages/WpAdminSchedulerPage"));
const WpAdminEditorialDashboardPage = lazy(() => import("./pages/WpAdminEditorialDashboardPage"));
const WpAdminReviewWorkspacePage = lazy(() => import("./pages/WpAdminReviewWorkspacePage"));
const WpAdminEditorialMetricsPage = lazy(() => import("./pages/WpAdminEditorialMetricsPage"));
const WpAdminPublishingRulesPage = lazy(() => import("./pages/WpAdminPublishingRulesPage"));
const WpAdminDiscoveryImportPage = lazy(() => import("./pages/WpAdminDiscoveryImportPage"));
const WpAdminDiscoveryImportHistoryPage = lazy(() => import("./pages/WpAdminDiscoveryImportHistoryPage"));
const WpAdminDiscoveryDuplicatesPage = lazy(() => import("./pages/WpAdminDiscoveryDuplicatesPage"));
const WpAdminDiscoveryValidationPage = lazy(() => import("./pages/WpAdminDiscoveryValidationPage"));
const WpAdminDiscoveryProvidersPage = lazy(() => import("./pages/WpAdminDiscoveryProvidersPage"));
const WpAdminCrawlReviewPage = lazy(() => import("./pages/WpAdminCrawlReviewPage"));
const WpAdminAiEnrichmentDashboardPage = lazy(() => import("./pages/WpAdminAiEnrichmentDashboardPage"));
const WpAdminAiEnrichmentQueuePage = lazy(() => import("./pages/WpAdminAiEnrichmentQueuePage"));
const WpAdminAiEnrichmentBatchPage = lazy(() => import("./pages/WpAdminAiEnrichmentBatchPage"));
const WpAdminAiEnrichmentJobsListPage = lazy(() => import("./pages/WpAdminAiEnrichmentJobsListPage"));
const WpAdminAiEnrichmentReviewPage = lazy(() => import("./pages/WpAdminAiEnrichmentReviewPage"));
const WpAdminAiEnrichmentPromptVersionsPage = lazy(() => import("./pages/WpAdminAiEnrichmentPromptVersionsPage"));
const WpAdminAiEnrichmentSettingsPage = lazy(() => import("./pages/WpAdminAiEnrichmentSettingsPage"));
const WpAdminToolsPage = lazy(() => import("./pages/WpAdminToolsPage"));
const WpAdminToolEditorPage = lazy(() => import("./pages/WpAdminToolEditorPage"));
const WpAdminToolPreviewPage = lazy(() => import("./pages/WpAdminToolPreviewPage"));
const WpAdminNewSoftwareWizardPage = lazy(() => import("./pages/WpAdminNewSoftwareWizardPage"));
const WpAdminPublishingQueuePage = lazy(() => import("./pages/WpAdminPublishingQueuePage"));
const WpAdminImportHistoryPage = lazy(() => import("./pages/WpAdminImportHistoryPage"));
const WpAdminMediaLibraryPage = lazy(() => import("./pages/WpAdminMediaLibraryPage"));
const WpAdminSeoHealthPage = lazy(() => import("./pages/WpAdminSeoHealthPage"));
const WpAdminPublishingDashboardPage = lazy(() => import("./pages/WpAdminPublishingDashboardPage"));
const WpAdminImportQueuePage = lazy(() => import("./pages/WpAdminImportQueuePage"));
const WpAdminToolCategoriesPage = lazy(() => import("./pages/WpAdminToolCategoriesPage"));
const WpAdminToolCategoryEditorPage = lazy(() => import("./pages/WpAdminToolCategoryEditorPage"));
const WpAdminToolTagsPage = lazy(() => import("./pages/WpAdminToolTagsPage"));
const WpAdminToolTagEditorPage = lazy(() => import("./pages/WpAdminToolTagEditorPage"));
const WpAdminToolComparisonsPage = lazy(() => import("./pages/WpAdminToolComparisonsPage"));
const WpAdminToolComparisonEditorPage = lazy(() => import("./pages/WpAdminToolComparisonEditorPage"));
const AdminBulkStateImport = lazy(() => import("./pages/AdminBulkStateImport"));
const BulkLogoUploadPage = lazy(() => import("./pages/BulkLogoUploadPage"));
const WpAdminFunnelAnalyticsPage = lazy(() => import("./pages/WpAdminFunnelAnalyticsPage"));
const WpAdminProductFunnelPage = lazy(() => import("./pages/WpAdminProductFunnelPage"));
const AdminContentScanPage = lazy(() => import("./pages/AdminContentScanPage"));
const AdminSEODebugPage = lazy(() => import("./pages/AdminSEODebugPage"));
const AdminProductionHTMLFetcherPage = lazy(() => import("./pages/AdminProductionHTMLFetcherPage"));
const AdminSEOAuditPage = lazy(() => import("./pages/AdminSEOAuditPage"));
const AdminOtherAgenciesImportPage = lazy(() => import("./pages/AdminOtherAgenciesImportPage"));
const AdminOtherAgenciesImportV2Page = lazy(() => import("./pages/AdminOtherAgenciesImportV2Page"));
const WpAdminOtherAgenciesManagerPage = lazy(() => import("./pages/WpAdminOtherAgenciesManagerPage"));
const AdminEmailCleaningExportPage = lazy(() => import("./pages/AdminEmailCleaningExportPage"));
const WpAdminSmartleadPage = lazy(() => import("./pages/WpAdminSmartleadPage"));
const WpAdminSmartleadCampaignsPage = lazy(() => import("./pages/WpAdminSmartleadCampaignsPage"));
const WpAdminSmartleadInboxPage = lazy(() => import("./pages/WpAdminSmartleadInboxPage"));
const WpAdminContactInboxPage = lazy(() => import("./pages/WpAdminContactInboxPage"));
const WpAdminAgencyFunnelPage = lazy(() => import("./pages/WpAdminAgencyFunnelPage"));

// Email module (admin-only, heavy)
const EmOverviewPage = lazy(() => import("./pages/em/EmOverviewPage"));
const EmAudiencePage = lazy(() => import("./pages/em/EmAudiencePage"));
const EmSegmentsPage = lazy(() => import("./pages/em/EmSegmentsPage"));
const EmTemplatesPage = lazy(() => import("./pages/em/EmTemplatesPage"));
const EmCampaignsPage = lazy(() => import("./pages/em/EmCampaignsPage"));
const EmAutomationsPage = lazy(() => import("./pages/em/EmAutomationsPage"));
const EmLogsPage = lazy(() => import("./pages/em/EmLogsPage"));
const EmSettingsPage = lazy(() => import("./pages/em/EmSettingsPage"));
const EmSmtpPage = lazy(() => import("./pages/em/EmSmtpPage"));
const QuickSendsPage = lazy(() => import("./pages/em/QuickSendsPage"));
const QuickSendTrackingPage = lazy(() => import("./pages/em/QuickSendTrackingPage"));
const WpAdminAgencyReplyHelperPage = lazy(() => import("./pages/WpAdminAgencyReplyHelperPage"));
const WpAdminManageRemovalsPage = lazy(() => import("./pages/WpAdminManageRemovalsPage"));
const WpAdminAgencyDedupeRepairPage = lazy(() => import("./pages/WpAdminAgencyDedupeRepairPage"));

function PageLoader() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-white">
      <div className="w-6 h-6 border-2 border-blue-500 border-t-transparent rounded-full animate-spin" />
    </div>
  );
}

export default function App() {
  return (
    <BrowserRouter>
      <AdminSessionProvider>
      <ErrorBoundary>
        <ScrollManager />
        <AvailabilityScrollReset />
        <GoogleAnalytics />
        <Suspense fallback={<PageLoader />}>
        <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/marketing-agencies" element={<MarketingAgenciesHub />} />
        <Route path="/marketing-agencies/usa" element={<USAHub />} />

        {/* CRITICAL: Direct state page routes for SEO Boost prerendering */}
        {/* Both with and without trailing slash — prevents chips from hitting the async DB catch-all */}
        <Route path="/marketing-agencies-in-:stateSlug-united-states" element={<StatePageTemplate />} />
        <Route path="/marketing-agencies-in-:stateSlug-united-states/" element={<StatePageTemplate />} />

        <Route path="/proof" element={<GappsyProofPage />} />
        <Route path="/analytics" element={<AnalyticsPage />} />
        <Route path="/appbuilder" element={<AppbuilderPage />} />
        <Route path="/publish-service" element={<PublishServicePage />} />
        <Route path="/done-for-you-app-creation" element={<DoneForYouAppCreationPage />} />
        <Route path="/login/apps" element={<LoginAppsPage />} />

        {/* Informational Pages */}
        <Route path="/about" element={<AboutPage />} />
        <Route path="/contact" element={<ContactPage />} />
        <Route path="/editorial-policy" element={<EditorialPolicyPage />} />
        <Route path="/terms" element={<TermsPage />} />
        <Route path="/privacy" element={<PrivacyPage />} />
        <Route path="/refunds" element={<RefundPage />} />

        {/* WP Admin Routes — canonical /wp-admin/* prefix for ALL admin features */}
        <Route path="/wp-admin" element={<WpAdminLoginPage />} />
        <Route path="/wp-admin/login" element={<WpAdminLoginPage />} />
        <Route path="/wp-admin/dashboard" element={<AdminRoute><WpAdminDashboardPage /></AdminRoute>} />
        <Route path="/wp-admin/top25-editor" element={<AdminRoute><WpAdminTop25EditorPage /></AdminRoute>} />
        <Route path="/wp-admin/settings" element={<AdminRoute><WpAdminSettingsPage /></AdminRoute>} />
        <Route path="/wp-admin/submissions" element={<AdminRoute><WpAdminSubmissionsPage /></AdminRoute>} />
        <Route path="/wp-admin/stripe" element={<Navigate to="/wp-admin/revenue" replace />} />
        <Route path="/wp-admin/revenue" element={<AdminRoute><WpAdminStripePage /></AdminRoute>} />
        <Route path="/wp-admin/sidebar-ads" element={<AdminRoute><AdminSidebarAdsPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-reviews" element={<AdminRoute><AdminAgencyReviewsPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-reviews/import" element={<AdminRoute><AdminAgencyReviewsImportPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-reviews/new" element={<AdminRoute><AdminAgencyReviewEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-reviews/edit/:id" element={<AdminRoute><AdminAgencyReviewEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools" element={<AdminRoute><WpAdminToolsPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/new" element={<AdminRoute><WpAdminToolEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/categories" element={<AdminRoute><WpAdminToolCategoriesPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/categories/new" element={<AdminRoute><WpAdminToolCategoryEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/categories/:id/edit" element={<AdminRoute><WpAdminToolCategoryEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/tags" element={<AdminRoute><WpAdminToolTagsPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/tags/new" element={<AdminRoute><WpAdminToolTagEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/tags/:id/edit" element={<AdminRoute><WpAdminToolTagEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/:id/edit" element={<AdminRoute><WpAdminToolEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tools/:id/preview" element={<AdminRoute><WpAdminToolPreviewPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery" element={<AdminRoute><WpAdminDiscoveryDashboardPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/queue" element={<AdminRoute><WpAdminDiscoveryQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/import" element={<AdminRoute><WpAdminDiscoveryImportPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/import-history" element={<AdminRoute><WpAdminDiscoveryImportHistoryPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/duplicates" element={<AdminRoute><WpAdminDiscoveryDuplicatesPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/validation" element={<AdminRoute><WpAdminDiscoveryValidationPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/providers" element={<AdminRoute><WpAdminDiscoveryProvidersPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/crawl-queue" element={<AdminRoute><WpAdminCrawlQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/scheduler" element={<AdminRoute><WpAdminSchedulerPage /></AdminRoute>} />
        <Route path="/wp-admin/editorial" element={<AdminRoute><WpAdminEditorialDashboardPage /></AdminRoute>} />
        <Route path="/wp-admin/editorial/review/:toolId" element={<AdminRoute><WpAdminReviewWorkspacePage /></AdminRoute>} />
        <Route path="/wp-admin/editorial/metrics" element={<AdminRoute><WpAdminEditorialMetricsPage /></AdminRoute>} />
        <Route path="/wp-admin/editorial/publishing-rules" element={<AdminRoute><WpAdminPublishingRulesPage /></AdminRoute>} />
        <Route path="/wp-admin/discovery/crawl/:jobId" element={<AdminRoute><WpAdminCrawlReviewPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment" element={<AdminRoute><WpAdminAiEnrichmentDashboardPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/queue" element={<AdminRoute><WpAdminAiEnrichmentQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/batches/:id" element={<AdminRoute><WpAdminAiEnrichmentBatchPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/needs-review" element={<AdminRoute><WpAdminAiEnrichmentJobsListPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/completed" element={<AdminRoute><WpAdminAiEnrichmentJobsListPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/failed" element={<AdminRoute><WpAdminAiEnrichmentJobsListPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/history" element={<AdminRoute><WpAdminAiEnrichmentJobsListPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/jobs/:id" element={<AdminRoute><WpAdminAiEnrichmentReviewPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/prompts" element={<AdminRoute><WpAdminAiEnrichmentPromptVersionsPage /></AdminRoute>} />
        <Route path="/wp-admin/ai-enrichment/settings" element={<AdminRoute><WpAdminAiEnrichmentSettingsPage /></AdminRoute>} />
        <Route path="/wp-admin/publishing" element={<AdminRoute><WpAdminPublishingDashboardPage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/new" element={<AdminRoute><WpAdminNewSoftwareWizardPage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/queue" element={<AdminRoute><WpAdminPublishingQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/import-queue" element={<AdminRoute><WpAdminImportQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/drafts" element={<AdminRoute><WpAdminPublishingQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/published" element={<AdminRoute><WpAdminPublishingQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/archive" element={<AdminRoute><WpAdminPublishingQueuePage /></AdminRoute>} />
        <Route path="/wp-admin/publishing/imports" element={<AdminRoute><WpAdminImportHistoryPage /></AdminRoute>} />
        <Route path="/wp-admin/media" element={<AdminRoute><WpAdminMediaLibraryPage /></AdminRoute>} />
        <Route path="/wp-admin/seo-health" element={<AdminRoute><WpAdminSeoHealthPage /></AdminRoute>} />
        <Route path="/wp-admin/tool-comparisons" element={<AdminRoute><WpAdminToolComparisonsPage /></AdminRoute>} />
        <Route path="/wp-admin/tool-comparisons/new" element={<AdminRoute><WpAdminToolComparisonEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/tool-comparisons/:id/edit" element={<AdminRoute><WpAdminToolComparisonEditorPage /></AdminRoute>} />
        <Route path="/wp-admin/json-import" element={<AdminRoute><AdminBulkStateImport /></AdminRoute>} />
        <Route path="/wp-admin/logo-upload" element={<AdminRoute><BulkLogoUploadPage /></AdminRoute>} />
        <Route path="/wp-admin/content-scanner" element={<AdminRoute><AdminContentScanPage /></AdminRoute>} />
        <Route path="/wp-admin/seo-debug" element={<AdminRoute><AdminSEODebugPage /></AdminRoute>} />
        <Route path="/wp-admin/production-test" element={<AdminRoute><AdminProductionHTMLFetcherPage /></AdminRoute>} />
        <Route path="/wp-admin/seo-audit" element={<AdminRoute><AdminSEOAuditPage /></AdminRoute>} />
        <Route path="/wp-admin/security/audit-log" element={<AdminRoute><WpAdminAuditLogPage /></AdminRoute>} />
        <Route path="/wp-admin/revenue-health" element={<AdminRoute><WpAdminRevenueHealthPage /></AdminRoute>} />
        <Route path="/wp-admin/thank-you-page" element={<AdminRoute><WpAdminThankYouPagePage /></AdminRoute>} />
        <Route path="/wp-admin/email-notifications" element={<AdminRoute><WpAdminEmailNotificationsPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-email-automations" element={<AdminRoute><WpAdminAgencyEmailAutomationsPage /></AdminRoute>} />
        <Route path="/wp-admin/other-agencies-import" element={<AdminRoute><AdminOtherAgenciesImportPage /></AdminRoute>} />
        <Route path="/wp-admin/other-agencies-import-v2" element={<AdminRoute><AdminOtherAgenciesImportV2Page /></AdminRoute>} />
        <Route path="/wp-admin/other-agencies-manager" element={<AdminRoute><WpAdminOtherAgenciesManagerPage /></AdminRoute>} />
        <Route path="/wp-admin/email-cleaning" element={<AdminRoute><AdminEmailCleaningExportPage /></AdminRoute>} />
        <Route path="/wp-admin/availability-analytics" element={<AdminRoute><WpAdminAvailabilityAnalyticsPage /></AdminRoute>} />
        <Route path="/wp-admin/availability-analytics/agency/:agencyId" element={<AdminRoute><WpAdminAvailabilityAnalyticsPage /></AdminRoute>} />

        {/* Email Module — unified /wp-admin/email/* routes */}
        <Route path="/wp-admin/email" element={<Navigate to="/wp-admin/email/overview" replace />} />
        <Route path="/wp-admin/email/overview" element={<AdminRoute><EmOverviewPage /></AdminRoute>} />
        <Route path="/wp-admin/email/audience" element={<AdminRoute><EmAudiencePage /></AdminRoute>} />
        <Route path="/wp-admin/email/segments" element={<AdminRoute><EmSegmentsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/templates" element={<AdminRoute><EmTemplatesPage /></AdminRoute>} />
        <Route path="/wp-admin/email/campaigns" element={<AdminRoute><EmCampaignsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/automations" element={<AdminRoute><EmAutomationsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/logs" element={<AdminRoute><EmLogsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/settings" element={<AdminRoute><EmSettingsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/smtp" element={<AdminRoute><EmSmtpPage /></AdminRoute>} />
        <Route path="/wp-admin/email/quick-sends" element={<AdminRoute><QuickSendsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/quick-send/:id" element={<AdminRoute><QuickSendTrackingPage /></AdminRoute>} />
        <Route path="/wp-admin/email/smartlead" element={<AdminRoute><WpAdminSmartleadPage /></AdminRoute>} />
        <Route path="/wp-admin/email/smartlead/campaigns" element={<AdminRoute><WpAdminSmartleadCampaignsPage /></AdminRoute>} />
        <Route path="/wp-admin/email/smartlead/inbox" element={<AdminRoute><WpAdminSmartleadInboxPage /></AdminRoute>} />
        <Route path="/wp-admin/contact-inbox" element={<AdminRoute><WpAdminContactInboxPage /></AdminRoute>} />
        <Route path="/wp-admin/email/agency-lookup" element={<AdminRoute><WpAdminAgencyReplyHelperPage /></AdminRoute>} />
        <Route path="/wp-admin/customer-suppression" element={<AdminRoute><WpAdminCustomerSuppressionPage /></AdminRoute>} />
        <Route path="/wp-admin/manage-removals" element={<AdminRoute><WpAdminManageRemovalsPage /></AdminRoute>} />

        {/* Legacy redirects — backward compatibility */}
        <Route path="/wp-admin/email-center" element={<Navigate to="/wp-admin/email/smtp" replace />} />
        <Route path="/wp-admin/email-marketing/overview" element={<Navigate to="/wp-admin/email/overview" replace />} />
        <Route path="/wp-admin/email-marketing/audience" element={<Navigate to="/wp-admin/email/audience" replace />} />
        <Route path="/wp-admin/email-marketing/segments" element={<Navigate to="/wp-admin/email/segments" replace />} />
        <Route path="/wp-admin/email-marketing/templates" element={<Navigate to="/wp-admin/email/templates" replace />} />
        <Route path="/wp-admin/email-marketing/campaigns" element={<Navigate to="/wp-admin/email/campaigns" replace />} />
        <Route path="/wp-admin/email-marketing/automations" element={<Navigate to="/wp-admin/email/automations" replace />} />
        <Route path="/wp-admin/email-marketing/logs" element={<Navigate to="/wp-admin/email/logs" replace />} />
        <Route path="/wp-admin/email-marketing/settings" element={<Navigate to="/wp-admin/email/settings" replace />} />

        {/* Legacy redirects — backward compatibility */}
        <Route path="/wp-admin/smartlead" element={<Navigate to="/wp-admin/email/smartlead" replace />} />

        {/* Legacy /admin/* redirects — backward compatibility */}
        <Route path="/admin/sidebar-ads" element={<Navigate to="/wp-admin/sidebar-ads" replace />} />
        <Route path="/admin/agency-reviews" element={<Navigate to="/wp-admin/agency-reviews" replace />} />
        <Route path="/admin/json-import" element={<Navigate to="/wp-admin/json-import" replace />} />
        <Route path="/admin/logo-upload" element={<Navigate to="/wp-admin/logo-upload" replace />} />
        <Route path="/admin/content-scan" element={<Navigate to="/wp-admin/content-scanner" replace />} />
        <Route path="/admin/seo-debug" element={<Navigate to="/wp-admin/seo-debug" replace />} />
        <Route path="/admin/production-test" element={<Navigate to="/wp-admin/production-test" replace />} />
        <Route path="/admin/seo-audit" element={<Navigate to="/wp-admin/seo-audit" replace />} />

        {/* Other Agencies Availability Funnel Routes */}
        <Route path="/availability/start" element={<AvailabilityStartPage />} />
        <Route path="/availability/client" element={<AvailabilityClientPage />} />
        <Route path="/availability/verify" element={<AvailabilityVerifyPage />} />
        <Route path="/availability/owner/edit-listing" element={<AvailabilityOwnerEditListingPage />} />
        <Route path="/availability/owner-demo" element={<AvailabilityOwnerDemoPage />} />
        <Route path="/availability/owner-preview" element={<AvailabilityOwnerPreviewPage />} />
        <Route path="/availability/owner-simulate" element={<AvailabilityOwnerSimulatePage />} />
        <Route path="/availability/owner-dashboard" element={<AvailabilityOwnerDashboardPage />} />

        {/* Existing Agency Detection Route */}
        <Route path="/existing-listing" element={<ExistingListingGatePage />} />

        {/* Short discount offer link — resolves token and redirects to activation */}
        <Route path="/offer/:token" element={<OfferRedirectPage />} />

        {/* Activation & Checkout Routes */}
        <Route path="/activation/upgrade" element={<ActivationUpgradePage />} />
        <Route path="/standard/upgrade-offer" element={<StandardUpgradeOfferPage />} />
        <Route path="/spotlight/confirm" element={<SpotlightConfirmPage />} />
        <Route path="/top-25/confirm" element={<Top25ConfirmPage />} />
        <Route path="/top25/upgrade" element={<Top25UpgradeLandingPage />} />
        <Route path="/top-25/claim-confirm" element={<Top25ClaimConfirmPage />} />
        <Route path="/order/complete" element={<OrderCompletePage />} />

        {/* Agency Review Routes */}
        <Route path="/agency-reviews/:agencySlug" element={<AgencyReviewPage />} />
        <Route path="/tools" element={<ToolsIndexPage />} />
        <Route path="/tools/:toolSlug" element={<ToolDetailPage />} />
        <Route path="/tool-categories" element={<ToolCategoriesIndexPage />} />
        <Route path="/tool-categories/:categorySlug" element={<ToolCategoryDetailPage />} />
        <Route path="/tool-tags/:tagSlug" element={<ToolTagDetailPage />} />
        <Route path="/compare" element={<ComparePage />} />
        <Route path="/compare/:comparisonSlug" element={<CompareDetailPage />} />
        <Route path="/feature-my-product" element={<FeatureMyProductPage />} />

        {/* Email Preferences */}
        <Route path="/email-preferences" element={<EmailPreferencesPage />} />

        {/* Smart Routing — MUST be before /your-agency to match first */}
        <Route path="/continue/:agencySlug" element={<SmartContinuePage />} />
        <Route path="/manage-listing/:agencySlug" element={<ManageListingPage />} />
        <Route path="/request-replay/:agencySlug" element={<RequestReplayPage />} />
        <Route path="/request-compare/:agencySlug" element={<RequestComparePage />} />

        {/* Your Agency funnel — MUST be before the DB catch-all */}
        <Route path="/your-agency" element={<YourAgencySearchPage />} />
        <Route path="/your-agency/not-found" element={<YourAgencyNotFoundPage />} />
        <Route path="/your-agency/t/:token" element={<YourAgencyTokenPage />} />
        <Route path="/your-agency/:agencySlug" element={<YourAgencyProfilePage />} />

        {/* Admin: Claim Links */}
        <Route path="/wp-admin/claim-links" element={<AdminRoute><WpAdminClaimLinksPage /></AdminRoute>} />
        <Route path="/wp-admin/intent-center" element={<AdminRoute><WpAdminIntentCenterPage /></AdminRoute>} />
        <Route path="/wp-admin/activity-feed" element={<AdminRoute><WpAdminActivityFeedPage /></AdminRoute>} />
        <Route path="/wp-admin/analytics/funnels" element={<AdminRoute><WpAdminFunnelAnalyticsPage /></AdminRoute>} />
        <Route path="/wp-admin/analytics/product-funnel" element={<AdminRoute><WpAdminProductFunnelPage /></AdminRoute>} />
        <Route path="/wp-admin/analytics/agency-funnel" element={<AdminRoute><WpAdminAgencyFunnelPage /></AdminRoute>} />
        <Route path="/wp-admin/agency-dedup" element={<AdminRoute><WpAdminAgencyDedupeRepairPage /></AdminRoute>} />

        {/* Database-driven catch-all route - MUST be before NotFound */}
        {/* This handles all state pages and any other DB-routed content */}
        <Route path="*" element={<DatabaseRoutedPage />} />
      </Routes>
      </Suspense>
      </ErrorBoundary>
      </AdminSessionProvider>
    </BrowserRouter>
  );
}
