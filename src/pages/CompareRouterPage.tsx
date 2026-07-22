import { lazy, Suspense } from 'react';
import { useParams } from 'react-router-dom';

const CompareDetailPage = lazy(() => import('./CompareDetailPage'));
const GroupCompareDetailPage = lazy(() => import('./GroupCompareDetailPage'));

// A comparison slug is always built by joining member tool slugs with
// "-vs-" (see resolveCanonicalPair / resolveCanonicalMembers on the admin
// edge functions), so the tool count is fully determined by the slug
// itself — no database lookup needed to decide which page to render.
// "canva-vs-figma" -> 2 segments -> pairwise. "a-vs-b-vs-c" -> 3+
// segments -> group comparison. This keeps every comparison, 2-tool or
// 3+-tool, under the same flat /compare/:slug URL with zero added latency.
// Each page is still its own lazy-loaded chunk — only the one actually
// needed for this slug is fetched.
export default function CompareRouterPage() {
  const { comparisonSlug } = useParams<{ comparisonSlug: string }>();
  const segmentCount = (comparisonSlug || '').split('-vs-').length;

  return (
    <Suspense fallback={null}>
      {segmentCount >= 3 ? <GroupCompareDetailPage /> : <CompareDetailPage />}
    </Suspense>
  );
}
