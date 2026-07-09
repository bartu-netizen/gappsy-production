import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { Filter, Download, ExternalLink, Mail, Phone, Calendar, Tag } from 'lucide-react';

interface Application {
  id: string;
  created_at: string;
  state_name: string;
  state_slug: string;
  agency_name: string;
  contact_name: string;
  contact_email: string;
  website_url: string;
  description: string;
  services: string[];
  claimed_rank_number: number | null;
  claimed_at: string | null;
  status: string;
  ip_address: string;
  notes: string | null;
}

interface StateSummary {
  state_name: string;
  state_slug: string;
  total_submissions: number;
  claimed_count: number;
  pending_count: number;
  last_submission_at: string;
}

export default function Top25ApplicationsPage() {
  const navigate = useNavigate();
  const [applications, setApplications] = useState<Application[]>([]);
  const [summary, setSummary] = useState<StateSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedState, setSelectedState] = useState<string>('all');
  const [selectedStatus, setSelectedStatus] = useState<string>('all');
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  useEffect(() => {
    document.title = 'Top-25 Applications | Gappsy Admin';
    checkAuth();
  }, []);

  useEffect(() => {
    if (isAuthenticated) {
      fetchApplications();
    }
  }, [isAuthenticated, selectedState, selectedStatus]);

  const checkAuth = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      navigate('/login');
      return;
    }
    setIsAuthenticated(true);
  };

  const fetchApplications = async () => {
    try {
      setLoading(true);
      setError(null);

      const { data: { session } } = await supabase.auth.getSession();
      if (!session) {
        navigate('/login');
        return;
      }

      const url = new URL(`${import.meta.env.VITE_SUPABASE_URL}/functions/v1/top25-applications-list`);
      if (selectedState !== 'all') {
        url.searchParams.set('state_slug', selectedState);
      }
      if (selectedStatus !== 'all') {
        url.searchParams.set('status', selectedStatus);
      }

      const response = await fetch(url.toString(), {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error('Failed to fetch applications');
      }

      const result = await response.json();
      setApplications(result.data || []);
      setSummary(result.summary || []);
    } catch (err) {
      console.error('Error fetching applications:', err);
      setError('Failed to load applications. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending':
        return 'bg-yellow-100 text-yellow-800';
      case 'claimed':
        return 'bg-indigo-50 text-indigo-600';
      case 'approved':
        return 'bg-green-100 text-green-800';
      case 'rejected':
        return 'bg-red-100 text-red-800';
      default:
        return 'bg-gray-100 text-gray-800';
    }
  };

  const exportToCSV = () => {
    const headers = ['Date', 'State', 'Agency Name', 'Contact', 'Email', 'Website', 'Status', 'Claimed Rank'];
    const rows = applications.map(app => [
      formatDate(app.created_at),
      app.state_name,
      app.agency_name,
      app.contact_name,
      app.contact_email,
      app.website_url,
      app.status,
      app.claimed_rank_number || 'N/A'
    ]);

    const csv = [headers, ...rows].map(row => row.join(',')).join('\n');
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `top25-applications-${new Date().toISOString().split('T')[0]}.csv`;
    a.click();
  };

  if (loading && applications.length === 0) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading applications...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">Top-25 Applications</h1>
              <p className="mt-1 text-sm text-gray-500">
                Manage and review agency submissions across all states
              </p>
            </div>
            <button
              onClick={exportToCSV}
              className="inline-flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors"
            >
              <Download className="w-4 h-4" />
              Export CSV
            </button>
          </div>
        </div>
      </div>

      {/* Summary Cards */}
      {summary.length > 0 && (
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
              <div className="text-sm font-medium text-gray-600 mb-1">Total Submissions</div>
              <div className="text-3xl font-bold text-gray-900">
                {summary.reduce((acc, s) => acc + s.total_submissions, 0)}
              </div>
            </div>
            <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
              <div className="text-sm font-medium text-gray-600 mb-1">Claimed</div>
              <div className="text-3xl font-bold text-indigo-600">
                {summary.reduce((acc, s) => acc + s.claimed_count, 0)}
              </div>
            </div>
            <div className="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
              <div className="text-sm font-medium text-gray-600 mb-1">Pending</div>
              <div className="text-3xl font-bold text-yellow-600">
                {summary.reduce((acc, s) => acc + s.pending_count, 0)}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Filters */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
        <div className="bg-white rounded-lg shadow-sm p-4 border border-gray-200">
          <div className="flex items-center gap-4">
            <Filter className="w-5 h-5 text-gray-400" />

            <div className="flex-1">
              <label className="block text-xs font-medium text-gray-600 mb-1">State</label>
              <select
                value={selectedState}
                onChange={(e) => setSelectedState(e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
              >
                <option value="all">All States</option>
                {summary.map((s) => (
                  <option key={s.state_slug} value={s.state_slug}>
                    {s.state_name} ({s.total_submissions})
                  </option>
                ))}
              </select>
            </div>

            <div className="flex-1">
              <label className="block text-xs font-medium text-gray-600 mb-1">Status</label>
              <select
                value={selectedStatus}
                onChange={(e) => setSelectedStatus(e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
              >
                <option value="all">All Statuses</option>
                <option value="pending">Pending</option>
                <option value="claimed">Claimed</option>
                <option value="approved">Approved</option>
                <option value="rejected">Rejected</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      {/* Applications List */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-12">
        {error && (
          <div className="mb-4 p-4 bg-red-50 border border-red-200 rounded-lg text-red-800">
            {error}
          </div>
        )}

        {applications.length === 0 && !loading ? (
          <div className="bg-white rounded-lg shadow-sm p-12 text-center border border-gray-200">
            <p className="text-gray-500">No applications found matching your filters.</p>
          </div>
        ) : (
          <div className="space-y-4">
            {applications.map((app) => (
              <div
                key={app.id}
                className="bg-white rounded-lg shadow-sm p-6 border border-gray-200 hover:shadow-md transition-shadow"
              >
                <div className="flex items-start justify-between mb-4">
                  <div className="flex-1">
                    <div className="flex items-center gap-3 mb-2">
                      <h3 className="text-lg font-bold text-gray-900">{app.agency_name}</h3>
                      <span className={`px-2 py-1 rounded-full text-xs font-medium ${getStatusColor(app.status)}`}>
                        {app.status}
                      </span>
                      {app.claimed_rank_number && (
                        <span className="px-2 py-1 rounded-full text-xs font-medium bg-purple-100 text-purple-800">
                          Rank #{app.claimed_rank_number}
                        </span>
                      )}
                    </div>
                    <div className="flex items-center gap-4 text-sm text-gray-600 mb-3">
                      <div className="flex items-center gap-1">
                        <Calendar className="w-4 h-4" />
                        {formatDate(app.created_at)}
                      </div>
                      <div className="flex items-center gap-1">
                        <Tag className="w-4 h-4" />
                        {app.state_name}
                      </div>
                    </div>
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                  <div>
                    <div className="text-xs font-medium text-gray-500 mb-1">Contact Person</div>
                    <div className="text-sm text-gray-900">{app.contact_name}</div>
                  </div>
                  <div>
                    <div className="text-xs font-medium text-gray-500 mb-1">Email</div>
                    <a href={`mailto:${app.contact_email}`} className="text-sm text-indigo-600 hover:underline flex items-center gap-1">
                      <Mail className="w-3 h-3" />
                      {app.contact_email}
                    </a>
                  </div>
                  <div>
                    <div className="text-xs font-medium text-gray-500 mb-1">Website</div>
                    <a
                      href={app.website_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-sm text-indigo-600 hover:underline flex items-center gap-1"
                    >
                      <ExternalLink className="w-3 h-3" />
                      {app.website_url}
                    </a>
                  </div>
                  <div>
                    <div className="text-xs font-medium text-gray-500 mb-1">Services</div>
                    <div className="flex flex-wrap gap-1">
                      {app.services?.map((service, idx) => (
                        <span key={idx} className="px-2 py-0.5 bg-gray-100 text-gray-700 rounded text-xs">
                          {service}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>

                {app.description && (
                  <div className="mb-4">
                    <div className="text-xs font-medium text-gray-500 mb-1">Description</div>
                    <p className="text-sm text-gray-700 leading-relaxed">{app.description}</p>
                  </div>
                )}

                {app.notes && (
                  <div className="mt-4 p-3 bg-gray-50 rounded-lg">
                    <div className="text-xs font-medium text-gray-500 mb-1">Admin Notes</div>
                    <p className="text-sm text-gray-700">{app.notes}</p>
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
