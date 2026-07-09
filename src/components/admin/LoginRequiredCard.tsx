import { useNavigate } from 'react-router-dom';
import { Lock } from 'lucide-react';

export default function LoginRequiredCard() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-2xl shadow-lg p-10 max-w-sm w-full text-center">
        <div className="inline-flex items-center justify-center w-14 h-14 bg-slate-900 rounded-xl mb-5">
          <Lock className="w-7 h-7 text-white" />
        </div>
        <h2 className="text-xl font-bold text-gray-900 mb-2">Admin login required</h2>
        <p className="text-sm text-gray-500 mb-7">
          Please login once via the admin panel to access all admin tools.
        </p>
        <button
          onClick={() => navigate('/wp-admin')}
          className="w-full bg-slate-900 text-white py-3 px-4 rounded-lg font-semibold hover:bg-slate-800 transition-colors text-sm"
        >
          Go to Admin Login
        </button>
      </div>
    </div>
  );
}
