import { useParams, Link } from 'react-router-dom';
import { ArrowLeft } from 'lucide-react';
import ToolDetailPage from './ToolDetailPage';

// Admin-only preview: renders the exact public ToolDetailPage component
// tree (no duplicated rendering logic) fed by an admin-authenticated,
// any-status data path instead of the public published-only query — see
// ToolDetailPage's `previewToolId` prop. AdminRoute in App.tsx gates this
// route; ToolDetailPage itself forces noindex whenever previewToolId is set.
export default function WpAdminToolPreviewPage() {
  const { id } = useParams<{ id: string }>();

  if (!id) return null;

  return (
    <div className="relative">
      <Link
        to={`/wp-admin/tools/${id}/edit`}
        className="fixed bottom-5 right-5 z-50 inline-flex items-center gap-1.5 bg-gray-900 text-white px-4 py-2.5 rounded-full shadow-lg text-sm font-medium hover:bg-gray-800 transition"
      >
        <ArrowLeft className="w-4 h-4" />
        Back to editor
      </Link>
      <ToolDetailPage previewToolId={id} />
    </div>
  );
}
