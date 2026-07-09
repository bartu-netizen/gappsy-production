import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAdminSession } from '../../contexts/AdminSessionContext';

interface Props {
  children: React.ReactNode;
}

export default function AdminRoute({ children }: Props) {
  const { status } = useAdminSession();
  const navigate = useNavigate();

  useEffect(() => {
    if (status === 'invalid') navigate('/wp-admin', { replace: true });
  }, [status, navigate]);

  if (status === 'loading') {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center">
        <div className="w-6 h-6 border-2 border-blue-600 border-t-transparent rounded-full animate-spin" />
      </div>
    );
  }

  if (status === 'invalid') return null;

  return <>{children}</>;
}
