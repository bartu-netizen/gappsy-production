import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { ExternalLink, Upload, Download } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { isPaidSlot } from '../lib/top25Slots';

interface StateStats {
  spotlights: {
    total: number;
    paid: number;
    available: number;
    revenue: number;
  };
  top25: {
    total: number;
    paid: number;
    placeholders: number;
    revenue: number;
  };
  others: {
    total: number;
    featured: number;
    verified: number;
  };
  totalRevenue: number;
}

const US_STATES = [
  { slug: 'alabama', name: 'Alabama' },
  { slug: 'alaska', name: 'Alaska' },
  { slug: 'arizona', name: 'Arizona' },
  { slug: 'arkansas', name: 'Arkansas' },
  { slug: 'california', name: 'California' },
  { slug: 'colorado', name: 'Colorado' },
  { slug: 'connecticut', name: 'Connecticut' },
  { slug: 'delaware', name: 'Delaware' },
  { slug: 'florida', name: 'Florida' },
  { slug: 'georgia', name: 'Georgia' },
  { slug: 'hawaii', name: 'Hawaii' },
  { slug: 'idaho', name: 'Idaho' },
  { slug: 'illinois', name: 'Illinois' },
  { slug: 'indiana', name: 'Indiana' },
  { slug: 'iowa', name: 'Iowa' },
  { slug: 'kansas', name: 'Kansas' },
  { slug: 'kentucky', name: 'Kentucky' },
  { slug: 'louisiana', name: 'Louisiana' },
  { slug: 'maine', name: 'Maine' },
  { slug: 'maryland', name: 'Maryland' },
  { slug: 'massachusetts', name: 'Massachusetts' },
  { slug: 'michigan', name: 'Michigan' },
  { slug: 'minnesota', name: 'Minnesota' },
  { slug: 'mississippi', name: 'Mississippi' },
  { slug: 'missouri', name: 'Missouri' },
  { slug: 'montana', name: 'Montana' },
  { slug: 'nebraska', name: 'Nebraska' },
  { slug: 'nevada', name: 'Nevada' },
  { slug: 'new-hampshire', name: 'New Hampshire' },
  { slug: 'new-jersey', name: 'New Jersey' },
  { slug: 'new-mexico', name: 'New Mexico' },
  { slug: 'new-york', name: 'New York' },
  { slug: 'north-carolina', name: 'North Carolina' },
  { slug: 'north-dakota', name: 'North Dakota' },
  { slug: 'ohio', name: 'Ohio' },
  { slug: 'oklahoma', name: 'Oklahoma' },
  { slug: 'oregon', name: 'Oregon' },
  { slug: 'pennsylvania', name: 'Pennsylvania' },
  { slug: 'rhode-island', name: 'Rhode Island' },
  { slug: 'south-carolina', name: 'South Carolina' },
  { slug: 'south-dakota', name: 'South Dakota' },
  { slug: 'tennessee', name: 'Tennessee' },
  { slug: 'texas', name: 'Texas' },
  { slug: 'utah', name: 'Utah' },
  { slug: 'vermont', name: 'Vermont' },
  { slug: 'virginia', name: 'Virginia' },
  { slug: 'washington', name: 'Washington' },
  { slug: 'west-virginia', name: 'West Virginia' },
  { slug: 'wisconsin', name: 'Wisconsin' },
  { slug: 'wyoming', name: 'Wyoming' },
  { slug: 'district-of-columbia', name: 'District of Columbia' },
  { slug: 'puerto-rico', name: 'Puerto Rico' }
];

export default function AdminStateOverviewPage() {
  const [selectedState, setSelectedState] = useState('new-jersey');
  const [stats, setStats] = useState<StateStats | null>(null);
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    loadStateStats();
  }, [selectedState]);

  async function loadStateStats() {
    setLoading(true);
    try {
      const { data: spotlights } = await supabase
        .from('spotlight_placements')
        .select('*')
        .eq('state_slug', selectedState);

      const { data: top25 } = await supabase
        .from('top25_slots')
        .select('*')
        .eq('state_slug', selectedState);

      const { data: others, count: othersCount } = await supabase
        .from('other_agencies')
        .select('*', { count: 'exact', head: false })
        .eq('state_slug', selectedState);

      const spotlightRevenue = (spotlights || []).filter(s => s.is_paid).reduce((sum, s) => {
        return sum + (s.position === 1 ? 997 : 497);
      }, 0);

      const top25Revenue = (top25 || []).filter(t => isPaidSlot(t)).reduce((sum, t) => {
        return sum + (t.rank <= 10 ? 297 : 197);
      }, 0);

      setStats({
        spotlights: {
          total: spotlights?.length || 0,
          paid: spotlights?.filter(s => s.is_paid).length || 0,
          available: 3 - (spotlights?.length || 0),
          revenue: spotlightRevenue
        },
        top25: {
          total: top25?.length || 0,
          paid: top25?.filter(t => isPaidSlot(t)).length || 0,
          placeholders: top25?.filter(t => !isPaidSlot(t)).length || 0,
          revenue: top25Revenue
        },
        others: {
          total: othersCount || 0,
          featured: others?.filter(o => o.featured).length || 0,
          verified: others?.filter(o => o.verified).length || 0
        },
        totalRevenue: spotlightRevenue + top25Revenue
      });
    } catch (error) {
      console.error('Failed to load state stats:', error);
    } finally {
      setLoading(false);
    }
  }

  const selectedStateName = US_STATES.find(s => s.slug === selectedState)?.name || selectedState;

  return (
    <div className="min-h-screen bg-gray-50 py-8 px-4">
      <div className="max-w-6xl mx-auto">
        <div className="mb-8 flex items-center justify-between">
          <h1 className="text-3xl font-bold">State Overview</h1>
          <button
            onClick={() => navigate('/admin/bulk-import')}
            className="px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 flex items-center gap-2"
          >
            <Upload className="w-4 h-4" />
            Bulk Import
          </button>
        </div>

        <div className="bg-white rounded-lg shadow p-6 mb-6">
          <label className="block text-sm font-semibold mb-2">Select State</label>
          <select
            value={selectedState}
            onChange={e => setSelectedState(e.target.value)}
            className="w-full p-3 border rounded-lg"
          >
            {US_STATES.map(state => (
              <option key={state.slug} value={state.slug}>
                {state.name}
              </option>
            ))}
          </select>
        </div>

        {loading ? (
          <div className="text-center py-12 text-gray-500">Loading stats...</div>
        ) : stats && (
          <>
            <div className="bg-white rounded-lg shadow p-6 mb-6">
              <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                <span className="text-2xl">✨</span>
                Spotlight Placements
              </h2>
              <div className="grid grid-cols-3 gap-4 mb-4">
                <div>
                  <div className="text-gray-600 text-sm">Filled</div>
                  <div className="text-2xl font-bold">{stats.spotlights.total}/3</div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Paid</div>
                  <div className="text-2xl font-bold text-green-600">
                    {stats.spotlights.paid}
                  </div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Revenue</div>
                  <div className="text-2xl font-bold text-green-600">
                    ${stats.spotlights.revenue.toLocaleString()}/mo
                  </div>
                </div>
              </div>
              {stats.spotlights.available > 0 && (
                <div className="text-indigo-600 text-sm">
                  {stats.spotlights.available} spotlight position{stats.spotlights.available > 1 ? 's' : ''} available
                </div>
              )}
            </div>

            <div className="bg-white rounded-lg shadow p-6 mb-6">
              <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                <span className="text-2xl">🏆</span>
                Top 25 Listings
              </h2>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <div className="text-gray-600 text-sm">Total</div>
                  <div className="text-2xl font-bold">{stats.top25.total}/25</div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Paid</div>
                  <div className="text-2xl font-bold text-green-600">
                    {stats.top25.paid}
                  </div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Revenue</div>
                  <div className="text-2xl font-bold text-green-600">
                    ${stats.top25.revenue.toLocaleString()}/mo
                  </div>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-lg shadow p-6 mb-6">
              <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                <span className="text-2xl">📂</span>
                Other Agencies
              </h2>
              <div className="grid grid-cols-3 gap-4">
                <div>
                  <div className="text-gray-600 text-sm">Total</div>
                  <div className="text-2xl font-bold">{stats.others.total}</div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Featured</div>
                  <div className="text-2xl font-bold">{stats.others.featured}</div>
                </div>
                <div>
                  <div className="text-gray-600 text-sm">Verified</div>
                  <div className="text-2xl font-bold">{stats.others.verified}</div>
                </div>
              </div>
            </div>

            <div className="bg-green-50 border-2 border-green-500 rounded-lg p-6 mb-6">
              <div className="text-gray-600 mb-2">Total Monthly Revenue</div>
              <div className="text-4xl font-bold text-green-600">
                ${stats.totalRevenue.toLocaleString()}/month
              </div>
            </div>

            <div className="flex gap-4">
              <button
                onClick={() => navigate('/admin/bulk-import')}
                className="px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 flex items-center gap-2"
              >
                <Upload className="w-4 h-4" />
                Import More Agencies
              </button>
              <button
                onClick={() => window.location.href = `/states/${selectedState}`}
                className="px-6 py-3 bg-gray-200 rounded-lg hover:bg-gray-300 flex items-center gap-2"
              >
                <ExternalLink className="w-4 h-4" />
                View Public Page
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
