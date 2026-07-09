import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { Download, Search, Filter, ChevronLeft, ChevronRight, Calendar, Mail, Briefcase, DollarSign, Clock, MapPin } from 'lucide-react';
import { formatStateName } from '../utils/formatLocation';

interface AvailabilityRequest {
  id: string;
  created_at: string;
  agency_id: string;
  state_slug: string;
  service: string;
  budget: string;
  timeline: string;
  client_email: string;
  client_name: string;
  additional_notes?: string;
  other_agencies?: {
    name: string;
    website_url: string;
    state_name: string;
    location: string;
  };
}

interface FilterOptions {
  states: string[];
  services: string[];
  budgets: string[];
  timelines: string[];
}

export default function AvailabilityRequestsPage() {
  const navigate = useNavigate();
  const [requests, setRequests] = useState<AvailabilityRequest[]>([]);
  const [loading, setLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [expandedRow, setExpandedRow] = useState<string | null>(null);
  const [exporting, setExporting] = useState(false);

  // Pagination
  const [page, setPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [totalCount, setTotalCount] = useState(0);
  const limit = 50;

  // Filters
  const [stateFilter, setStateFilter] = useState('all');
  const [serviceFilter, setServiceFilter] = useState('all');
  const [budgetFilter, setBudgetFilter] = useState('all');
  const [timelineFilter, setTimelineFilter] = useState('all');
  const [dateRange, setDateRange] = useState('30');
  const [searchTerm, setSearchTerm] = useState('');
  const [showFilters, setShowFilters] = useState(false);

  // Filter options
  const [filterOptions, setFilterOptions] = useState<FilterOptions>({
    states: [],
    services: [],
    budgets: [],
    timelines: []
  });

  useEffect(() => {
    document.title = 'Availability Requests | Gappsy Admin';
    checkAuth();
  }, []);

  useEffect(() => {
    if (isAuthenticated) {
      fetchRequests();
    }
  }, [isAuthenticated, page, stateFilter, serviceFilter, budgetFilter, timelineFilter, dateRange, searchTerm]);

  const checkAuth = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      navigate('/login');
      return;
    }
    setIsAuthenticated(true);
  };

  const getDateRange = () => {
    if (dateRange === 'all') return { start: null, end: null };

    const end = new Date();
    const start = new Date();

    if (dateRange === '7') {
      start.setDate(start.getDate() - 7);
    } else if (dateRange === '30') {
      start.setDate(start.getDate() - 30);
    } else if (dateRange === '90') {
      start.setDate(start.getDate() - 90);
    }

    return {
      start: start.toISOString().split('T')[0],
      end: end.toISOString().split('T')[0]
    };
  };

  const fetchRequests = async () => {
    try {
      setLoading(true);

      const { data: { session } } = await supabase.auth.getSession();
      if (!session) {
        navigate('/login');
        return;
      }

      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const apiUrl = `${supabaseUrl}/functions/v1/availability-requests-list`;

      const { start, end } = getDateRange();
      const params = new URLSearchParams({
        page: page.toString(),
        limit: limit.toString(),
      });

      if (stateFilter !== 'all') params.append('state_slug', stateFilter);
      if (serviceFilter !== 'all') params.append('service', serviceFilter);
      if (budgetFilter !== 'all') params.append('budget', budgetFilter);
      if (timelineFilter !== 'all') params.append('timeline', timelineFilter);
      if (start) params.append('start_date', start);
      if (end) params.append('end_date', end);
      if (searchTerm) params.append('search', searchTerm);

      const response = await fetch(`${apiUrl}?${params.toString()}`, {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error('Failed to fetch requests');
      }

      const result = await response.json();

      if (result.success) {
        setRequests(result.data || []);
        setTotalPages(result.pagination.totalPages);
        setTotalCount(result.pagination.total);
        setFilterOptions(result.filters);
      }
    } catch (err) {
      console.error('Error fetching availability requests:', err);
    } finally {
      setLoading(false);
    }
  };

  const handleExport = async () => {
    try {
      setExporting(true);

      const { data: { session } } = await supabase.auth.getSession();
      if (!session) return;

      const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
      const apiUrl = `${supabaseUrl}/functions/v1/availability-requests-list`;

      const { start, end } = getDateRange();
      const params = new URLSearchParams({
        export: 'csv',
      });

      if (stateFilter !== 'all') params.append('state_slug', stateFilter);
      if (serviceFilter !== 'all') params.append('service', serviceFilter);
      if (budgetFilter !== 'all') params.append('budget', budgetFilter);
      if (timelineFilter !== 'all') params.append('timeline', timelineFilter);
      if (start) params.append('start_date', start);
      if (end) params.append('end_date', end);
      if (searchTerm) params.append('search', searchTerm);

      const response = await fetch(`${apiUrl}?${params.toString()}`, {
        headers: {
          'Authorization': `Bearer ${session.access_token}`,
        },
      });

      if (!response.ok) {
        throw new Error('Failed to export data');
      }

      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `availability-requests-${new Date().toISOString().split('T')[0]}.csv`;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      window.URL.revokeObjectURL(url);
    } catch (err) {
      console.error('Error exporting data:', err);
      alert('Failed to export data. Please try again.');
    } finally {
      setExporting(false);
    }
  };

  const handleReset = () => {
    setStateFilter('all');
    setServiceFilter('all');
    setBudgetFilter('all');
    setTimelineFilter('all');
    setDateRange('30');
    setSearchTerm('');
    setPage(1);
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  if (loading && requests.length === 0) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading availability requests...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">Availability Requests</h1>
              <p className="mt-1 text-sm text-gray-500">
                {totalCount.toLocaleString()} total submissions
              </p>
            </div>
            <div className="flex gap-3">
              <button
                onClick={() => setShowFilters(!showFilters)}
                className="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 rounded-lg flex items-center gap-2 transition-colors"
              >
                <Filter className="w-4 h-4" />
                <span className="hidden sm:inline">Filters</span>
              </button>
              <button
                onClick={handleExport}
                disabled={exporting || requests.length === 0}
                className="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 disabled:bg-gray-400 text-white rounded-lg flex items-center gap-2 transition-colors"
              >
                <Download className="w-4 h-4" />
                <span className="hidden sm:inline">{exporting ? 'Exporting...' : 'Export CSV'}</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Filters */}
        {showFilters && (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 mb-6">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-4">
              {/* Search */}
              <div className="lg:col-span-3">
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Search
                </label>
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
                  <input
                    type="text"
                    value={searchTerm}
                    onChange={(e) => {
                      setSearchTerm(e.target.value);
                      setPage(1);
                    }}
                    placeholder="Search by client name, email, or agency..."
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                  />
                </div>
              </div>

              {/* State Filter */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  State
                </label>
                <select
                  value={stateFilter}
                  onChange={(e) => {
                    setStateFilter(e.target.value);
                    setPage(1);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                >
                  <option value="all">All States</option>
                  {filterOptions.states.map(state => (
                    <option key={state} value={state}>
                      {formatStateName(state)}
                    </option>
                  ))}
                </select>
              </div>

              {/* Service Filter */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Service
                </label>
                <select
                  value={serviceFilter}
                  onChange={(e) => {
                    setServiceFilter(e.target.value);
                    setPage(1);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                >
                  <option value="all">All Services</option>
                  {filterOptions.services.map(service => (
                    <option key={service} value={service}>{service}</option>
                  ))}
                </select>
              </div>

              {/* Budget Filter */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Budget
                </label>
                <select
                  value={budgetFilter}
                  onChange={(e) => {
                    setBudgetFilter(e.target.value);
                    setPage(1);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                >
                  <option value="all">All Budgets</option>
                  {filterOptions.budgets.map(budget => (
                    <option key={budget} value={budget}>{budget}</option>
                  ))}
                </select>
              </div>

              {/* Timeline Filter */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Timeline
                </label>
                <select
                  value={timelineFilter}
                  onChange={(e) => {
                    setTimelineFilter(e.target.value);
                    setPage(1);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                >
                  <option value="all">All Timelines</option>
                  {filterOptions.timelines.map(timeline => (
                    <option key={timeline} value={timeline}>{timeline}</option>
                  ))}
                </select>
              </div>

              {/* Date Range */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Date Range
                </label>
                <select
                  value={dateRange}
                  onChange={(e) => {
                    setDateRange(e.target.value);
                    setPage(1);
                  }}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent"
                >
                  <option value="7">Last 7 days</option>
                  <option value="30">Last 30 days</option>
                  <option value="90">Last 90 days</option>
                  <option value="all">All time</option>
                </select>
              </div>
            </div>

            <div className="flex justify-end">
              <button
                onClick={handleReset}
                className="px-4 py-2 text-sm text-gray-600 hover:text-gray-900 font-medium"
              >
                Reset Filters
              </button>
            </div>
          </div>
        )}

        {/* Results */}
        {requests.length === 0 ? (
          <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-12 text-center">
            <Calendar className="w-12 h-12 text-gray-400 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-gray-900 mb-2">No requests found</h3>
            <p className="text-gray-500">Try adjusting your filters or search terms</p>
          </div>
        ) : (
          <>
            {/* Desktop Table */}
            <div className="hidden md:block bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead className="bg-gray-50 border-b border-gray-200">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Agency</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Client</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Service</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Budget</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Timeline</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">State</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-200">
                    {requests.map((request) => (
                      <tr
                        key={request.id}
                        onClick={() => setExpandedRow(expandedRow === request.id ? null : request.id)}
                        className="hover:bg-gray-50 cursor-pointer transition-colors"
                      >
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          {formatDate(request.created_at)}
                        </td>
                        <td className="px-6 py-4 text-sm">
                          <div className="font-medium text-gray-900">{request.other_agencies?.name || 'Unknown'}</div>
                          <div className="text-gray-500 text-xs">{request.other_agencies?.location}</div>
                        </td>
                        <td className="px-6 py-4 text-sm">
                          <div className="font-medium text-gray-900">{request.client_name || 'N/A'}</div>
                          <div className="text-gray-500 text-xs">{request.client_email}</div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{request.service}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{request.budget}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">{request.timeline}</td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                          {request.other_agencies?.state_name || formatStateName(request.state_slug)}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>

            {/* Mobile Cards */}
            <div className="md:hidden space-y-4">
              {requests.map((request) => (
                <div
                  key={request.id}
                  onClick={() => setExpandedRow(expandedRow === request.id ? null : request.id)}
                  className="bg-white rounded-lg shadow-sm border border-gray-200 p-4"
                >
                  <div className="flex justify-between items-start mb-3">
                    <div>
                      <h3 className="font-semibold text-gray-900">{request.other_agencies?.name || 'Unknown'}</h3>
                      <p className="text-sm text-gray-500">{formatDate(request.created_at)}</p>
                    </div>
                    <span className="px-2 py-1 bg-indigo-50 text-indigo-600 text-xs rounded-full">
                      {request.other_agencies?.state_name || formatStateName(request.state_slug)}
                    </span>
                  </div>

                  <div className="space-y-2 text-sm">
                    <div className="flex items-center gap-2 text-gray-600">
                      <Mail className="w-4 h-4" />
                      <span>{request.client_name || 'N/A'}</span>
                    </div>
                    <div className="flex items-center gap-2 text-gray-600">
                      <Briefcase className="w-4 h-4" />
                      <span>{request.service}</span>
                    </div>
                    <div className="flex items-center gap-2 text-gray-600">
                      <DollarSign className="w-4 h-4" />
                      <span>{request.budget}</span>
                    </div>
                    <div className="flex items-center gap-2 text-gray-600">
                      <Clock className="w-4 h-4" />
                      <span>{request.timeline}</span>
                    </div>
                  </div>

                  {expandedRow === request.id && request.additional_notes && (
                    <div className="mt-3 pt-3 border-t border-gray-200">
                      <p className="text-sm text-gray-600">{request.additional_notes}</p>
                    </div>
                  )}
                </div>
              ))}
            </div>

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="mt-6 flex items-center justify-between bg-white rounded-lg shadow-sm border border-gray-200 px-4 py-3">
                <div className="text-sm text-gray-700">
                  Page {page} of {totalPages} ({totalCount.toLocaleString()} total)
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => setPage(p => Math.max(1, p - 1))}
                    disabled={page === 1}
                    className="px-3 py-1 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-1"
                  >
                    <ChevronLeft className="w-4 h-4" />
                    <span className="hidden sm:inline">Previous</span>
                  </button>
                  <button
                    onClick={() => setPage(p => Math.min(totalPages, p + 1))}
                    disabled={page === totalPages}
                    className="px-3 py-1 border border-gray-300 rounded-lg hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-1"
                  >
                    <span className="hidden sm:inline">Next</span>
                    <ChevronRight className="w-4 h-4" />
                  </button>
                </div>
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
