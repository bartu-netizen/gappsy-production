import SoftwareHeader from '../components/SoftwareHeader';
import FooterWrapper from '../components/FooterWrapper';
import EntitySEOTags from '../components/EntitySEOTags';

// Route placeholder for the header's new "Feature My Product" CTA
// (previously a disabled "Submit Software" button with no destination).
// Noindexed since there's no real vendor-submission flow wired up yet —
// this intentionally does not touch the existing vendor/self-service
// logic used elsewhere (e.g. /your-agency).
export default function FeatureMyProductPage() {
  return (
    <div className="min-h-screen flex flex-col bg-white">
      <EntitySEOTags
        title="Feature My Product | Gappsy"
        description="List your software on Gappsy's software directory."
        path="/feature-my-product"
        noindex
      />
      <SoftwareHeader variant="premium" />
      <main className="flex-1 flex items-center justify-center px-6 py-24">
        <div className="max-w-lg text-center">
          <h1 className="text-3xl font-semibold text-[#0B1221] mb-3">Feature My Product</h1>
          <p className="text-slate-500 text-base leading-relaxed">
            We're building a self-service way for software vendors to get listed on Gappsy.
            Check back soon.
          </p>
        </div>
      </main>
      <FooterWrapper />
    </div>
  );
}
