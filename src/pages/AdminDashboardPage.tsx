import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { FileText, Users, Mail, Building2, TrendingUp, Calendar } from 'lucide-react';

interface DashboardStats {
  top25Applications: number;
  spotlightApplications: number;
  matchedLeads: number;
  contactMessages: number;
  otherListingApplications: number;
  availabilityRequests: number;
}

export default function AdminDashboardPage() {
  const navigate = useNavigate();
  const [stats, setStats] = useState<DashboardStats>({
    top25Applications: 0,
    spotlightApplications: 0,
    matchedLeads: 0,
    contactMessages: 0,
    otherListingApplications: 0,
    availabilityRequests: 0
  });
  const [loading, setLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  useEffect(() => {
    document.title = 'Admin Dashboard | Gappsy';
    checkAuth();
  }, []);

  useEffect(() => {
    if (isAuthenticated) {
      fetchStats();
    }
  }, [isAuthenticated]);

  const checkAuth = async () => {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      navigate('/login');
      return;
    }
    setIsAuthenticated(true);
  };

  const fetchStats = async () => {
    try {
      setLoading(true);

      const [top25, spotlight, leads, contacts, otherListings, availability] = await Promise.all([
        supabase.from('top25_applications').select('id', { count: 'exact', head: true }),
        supabase.from('spotlight_applications').select('id', { count: 'exact', head: true }),
        supabase.from('matched_leads').select('id', { count: 'exact', head: true }),
        supabase.from('contact_messages').select('id', { count: 'exact', head: true }),
        supabase.from('other_listing_applications').select('id', { count: 'exact', head: true }),
        supabase.from('agency_availability_requests').select('id', { count: 'exact', head: true })
      ]);

      setStats({
        top25Applications: top25.count || 0,
        spotlightApplications: spotlight.count || 0,
        matchedLeads: leads.count || 0,
        contactMessages: contacts.count || 0,
        otherListingApplications: otherListings.count || 0,
        availabilityRequests: availability.count || 0
      });
    } catch (err) {
      console.error('Error fetching stats:', err);
    } finally {
      setLoading(false);
    }
  };

  const cards = [
    {
      title: 'Top-25 Applications',
      count: stats.top25Applications,
      icon: <TrendingUp className="w-8 h-8" />,
      color: 'bg-indigo-600',
      route: '/owner/top25-applications',
      description: 'Agencies applying for Top-25 rankings'
    },
    {
      title: 'Spotlight Applications',
      count: stats.spotlightApplications,
      icon: <Building2 className="w-8 h-8" />,
      color: 'bg-purple-500',
      route: '/owner/spotlight-applications',
      description: 'Premium spotlight placement requests'
    },
    {
      title: 'Get Matched Leads',
      count: stats.matchedLeads,
      icon: <Users className="w-8 h-8" />,
      color: 'bg-green-500',
      route: '/owner/matched-leads',
      description: 'Client leads from matching form'
    },
    {
      title: 'Contact Messages',
      count: stats.contactMessages,
      icon: <Mail className="w-8 h-8" />,
      color: 'bg-yellow-500',
      route: '/owner/contact-messages',
      description: 'Messages from contact form'
    },
    {
      title: 'Other Listing Submissions',
      count: stats.otherListingApplications,
      icon: <FileText className="w-8 h-8" />,
      color: 'bg-orange-500',
      route: '/owner/other-listing-applications',
      description: 'Other agencies listing submissions'
    },
    {
      title: 'Availability Requests',
      count: stats.availabilityRequests,
      icon: <Calendar className="w-8 h-8" />,
      color: 'bg-indigo-500',
      route: '/owner/availability-requests',
      description: 'Client inquiries via Check Availability'
    }
  ];

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading dashboard...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Admin Dashboard</h1>
            <p className="mt-1 text-sm text-gray-500">
              Overview of all form submissions and applications
            </p>
          </div>
        </div>
      </div>

      {/* Stats Cards */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Total Count */}
        <div className="mb-8 bg-gradient-to-r from-indigo-600 to-indigo-700 rounded-lg shadow-lg p-8 text-white">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-indigo-100 uppercase tracking-wide">Total Submissions</p>
              <p className="mt-2 text-4xl font-bold">
                {Object.values(stats).reduce((acc, val) => acc + val, 0).toLocaleString()}
              </p>
              <p className="mt-1 text-sm text-indigo-100">Across all forms and applications</p>
            </div>
            <div className="hidden sm:block">
              <FileText className="w-16 h-16 text-[#E8ECFA] opacity-50" />
            </div>
          </div>
        </div>

        {/* Individual Cards */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {cards.map((card) => (
            <button
              key={card.title}
              onClick={() => navigate(card.route)}
              className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow text-left w-full"
            >
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <div className={`${card.color} text-white w-12 h-12 rounded-lg flex items-center justify-center mb-4`}>
                    {card.icon}
                  </div>
                  <h3 className="text-lg font-semibold text-gray-900 mb-1">{card.title}</h3>
                  <p className="text-sm text-gray-500 mb-3">{card.description}</p>
                  <div className="flex items-baseline gap-2">
                    <span className="text-3xl font-bold text-gray-900">{card.count.toLocaleString()}</span>
                    <span className="text-sm text-gray-500">submissions</span>
                  </div>
                </div>
              </div>
              <div className="mt-4 pt-4 border-t border-gray-100">
                <span className="text-sm font-medium text-indigo-600 hover:text-indigo-700">
                  View all →
                </span>
              </div>
            </button>
          ))}
        </div>

        {/* Quick Actions */}
        <div className="mt-8 bg-white rounded-lg shadow-sm border border-gray-200 p-6">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Quick Actions</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <button
              onClick={() => navigate('/owner/top25-applications')}
              className="px-4 py-3 bg-[#F4F6FB] hover:bg-[#E8ECFA] rounded-lg text-left transition-colors"
            >
              <p className="font-medium text-blue-900">Review Top-25 Apps</p>
              <p className="text-sm text-indigo-600 mt-1">Manage agency rankings</p>
            </button>
            <button
              onClick={() => navigate('/owner/contact-messages')}
              className="px-4 py-3 bg-yellow-50 hover:bg-yellow-100 rounded-lg text-left transition-colors"
            >
              <p className="font-medium text-yellow-900">Check Messages</p>
              <p className="text-sm text-yellow-600 mt-1">Respond to inquiries</p>
            </button>
            <button
              onClick={() => navigate('/owner/matched-leads')}
              className="px-4 py-3 bg-green-50 hover:bg-green-100 rounded-lg text-left transition-colors"
            >
              <p className="font-medium text-green-900">Follow Up Leads</p>
              <p className="text-sm text-green-600 mt-1">Convert inquiries</p>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
