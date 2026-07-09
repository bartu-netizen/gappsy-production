import { useEffect, useState, useRef } from 'react';
import { supabase } from '../lib/supabase';
import { useAdminSession } from '../contexts/AdminSessionContext';
import { adminApiFetch } from '../lib/adminApiFetch';
import { uploadAgencyLogo } from '../utils/logoUpload';
import { US_STATES } from '../lib/usStates';
import { Search, Save, ExternalLink, Zap, CheckCircle, AlertCircle, CreditCard as Edit2, X, Upload, Loader, Info, RefreshCw, Lock, Unlock, DollarSign, ShieldAlert, Clock, AlertTriangle, Wrench, Activity } from 'lucide-react';
import WpAdminLayout from '../components/wpadmin/WpAdminLayout';

type SlotStatus = 'available' | 'locked' | 'reserved' | 'sold';
type BillingStatus = 'active' | 'past_due' | 'canceled' | 'expired' | null;

interface Top25Slot {
  id: string;
  state_slug: string;
  rank: number;
  is_paid: boolean;
  slot_status: SlotStatus;
  claimed_at: string | null;
  status_reason: string | null;
  sale_source: string | null;
  agency_name: string | null;
  agency_id: string | null;
  website: string | null;
  logo_url: string | null;
  short_description: string | null;
  description: string | null;
  services: string[] | null;
  show_lightning: boolean;
  billing_status: BillingStatus;
  lock_expires_at: string | null;
  cancel_at_period_end: boolean | null;
  stripe_subscription_id: string | null;
}

interface SpotlightPlacement {
  id: string;
  state_slug: string;
  position: number;
  agency_name: string;
  website_url: string | null;
  logo_url: string | null;
  short_description: string | null;
  full_description: string | null;
}

export default function WpAdminTop25EditorPage() {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedState, setSelectedState] = useState<string | null>(null);
  const [top25Slots, setTop25Slots] = useState<Top25Slot[]>([]);
  const [spotlightPlacements, setSpotlightPlacements] = useState<SpotlightPlacement[]>([]);
  const [editingSlot, setEditingSlot] = useState<string | null>(null);
  const [editingSpotlight, setEditingSpotlight] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [seeding, setSeeding] = useState(false);
  const [syncing, setSyncing] = useState(false);
  const [syncResult, setSyncResult] = useState<string | null>(null);
  const [readyStates, setReadyStates] = useState<Set<string>>(new Set());
  const [saveStatus, setSaveStatus] = useState<{ type: 'success' | 'error', message: string, savedAt?: string } | null>(null);

  const CANONICAL_STATES = US_STATES.map(s => ({ slug: s.slug, name: s.name }));

  useEffect(() => {
    loadReadyStates();
  }, []);

  useEffect(() => {
    if (selectedState) {
      handleSelectState(selectedState);
    }
  }, [selectedState]);

  const loadReadyStates = async () => {
    try {
      const { data } = await supabase
        .from('top25_slots')
        .select('state_slug, agency_name')
        .not('agency_name', 'is', null);

      if (data) {
        const ready = new Set(data.map((r: any) => r.state_slug));
        setReadyStates(ready);
      }
    } catch (err) {
      console.error('Error loading ready states:', err);
    }
  };

  const handleSelectState = async (stateSlug: string) => {
    setLoading(true);
    setSeeding(false);
    setSaveStatus(null);

    try {
      const { data: existingSlots } = await supabase
        .from('top25_slots')
        .select('id')
        .eq('state_slug', stateSlug)
        .limit(1);

      if (!existingSlots || existingSlots.length === 0) {
        setSeeding(true);
        await adminApiFetch('top25-ensure-state', {
          method: 'POST',
          body: { state_slug: stateSlug },
        });
        setSeeding(false);
      }

      const [slotsRes, spotlightRes] = await Promise.all([
        supabase
          .from('top25_slots')
          .select('id,state_slug,rank,is_paid,slot_status,claimed_at,status_reason,sale_source,agency_name,agency_id,website,logo_url,short_description,description,services,show_lightning,billing_status,lock_expires_at,cancel_at_period_end,stripe_subscription_id')
          .eq('state_slug', stateSlug)
          .order('rank'),
        supabase
          .from('spotlight_placements')
          .select('*')
          .eq('state_slug', stateSlug)
          .order('position')
      ]);

      setTop25Slots(slotsRes.data || []);
      setSpotlightPlacements(spotlightRes.data || []);
    } catch (err) {
      console.error('Error loading state data:', err);
    } finally {
      setLoading(false);
      setSeeding(false);
    }
  };

  const handleSyncAllStates = async () => {
    setSyncing(true);
    setSyncResult(null);
    try {
      const result = await adminApiFetch<{ ok: boolean; states_seeded?: number; created_slots_total?: number; total?: number; error?: string }>(
        'top25-ensure-all-states',
        { method: 'POST' }
      );
      if (result.ok && result.data?.ok) {
        const d = result.data;
        setSyncResult(`Sync complete: ${d.states_seeded} states seeded, ${d.created_slots_total} new slots created across all ${d.total} states.`);
        await loadReadyStates();
      } else {
        const msg = result.error?.message || result.data?.error || 'Unknown error';
        setSyncResult(`Sync error: ${msg}`);
      }
    } catch (err: any) {
      setSyncResult(`Sync failed: ${err.message}`);
    } finally {
      setSyncing(false);
    }
  };

  const updateTop25Slot = async (
    slot: Top25Slot,
    updates: Partial<Top25Slot> & { markSoldManual?: boolean; action?: 'update' | 'lock' | 'unlock' | 'mark_sold'; lockReason?: string }
  ) => {
    const { markSoldManual, action, lockReason, ...contentFields } = updates;
    const resolvedAction = markSoldManual ? 'mark_sold' : (action ?? 'update');

    const isStateAction = resolvedAction !== 'update';

    try {
      const services = (contentFields.services as string[] | undefined) ?? (slot.services || []);

      const result = await adminApiFetch<{ success: boolean; message?: string; error?: string }>(
        'top25-admin-update',
        {
          method: 'POST',
          body: {
            action: resolvedAction,
            stateSlug: slot.state_slug,
            rank: slot.rank,
            agencyName: (contentFields.agency_name ?? slot.agency_name) || 'Agency',
            website: (contentFields.website ?? slot.website) || '',
            logoUrl: contentFields.logo_url ?? slot.logo_url,
            description: contentFields.description ?? slot.description,
            shortDescription: contentFields.short_description ?? slot.short_description,
            services,
            showLightning: contentFields.show_lightning ?? slot.show_lightning,
            ...(lockReason ? { lockReason } : {}),
          },
        }
      );

      if (!result.ok) {
        const errMsg = result.error?.message || result.data?.message || result.data?.error || 'Backend update failed';
        if (result.error?.code === 'no_session' || result.error?.code === 'session_expired' || result.error?.code === 'auth_error') {
          throw new Error('Admin session missing or expired. Please log in again.');
        }
        throw new Error(errMsg);
      }

      if (isStateAction) {
        const optimisticUpdate: Partial<Top25Slot> = {};
        if (resolvedAction === 'mark_sold') {
          optimisticUpdate.slot_status = 'sold';
          optimisticUpdate.is_paid = true;
        } else if (resolvedAction === 'lock') {
          optimisticUpdate.slot_status = 'locked';
        } else if (resolvedAction === 'unlock') {
          optimisticUpdate.slot_status = 'available';
        }
        setTop25Slots(prev => prev.map(s =>
          s.id === slot.id ? { ...s, ...contentFields, ...optimisticUpdate } : s
        ));
      } else {
        setTop25Slots(prev => prev.map(s =>
          s.id === slot.id ? { ...s, ...contentFields } : s
        ));
      }

      const msg = resolvedAction === 'lock' ? 'Slot locked' :
                  resolvedAction === 'unlock' ? 'Slot unlocked — now available for sale' :
                  resolvedAction === 'mark_sold' ? 'Slot marked as sold' :
                  'Content saved';
      setSaveStatus({ type: 'success', message: msg, savedAt: new Date().toLocaleTimeString() });
    } catch (err: any) {
      console.error('Error updating slot:', err);
      setSaveStatus({ type: 'error', message: err.message || 'Failed to update slot' });
    }
  };

  const updateSpotlightPlacement = async (placementId: string, updates: Partial<SpotlightPlacement>) => {
    try {
      const { error } = await supabase
        .from('spotlight_placements')
        .update(updates)
        .eq('id', placementId);

      if (error) throw error;

      setSpotlightPlacements(prev => prev.map(placement =>
        placement.id === placementId ? { ...placement, ...updates } : placement
      ));

      setSaveStatus({ type: 'success', message: 'Spotlight updated successfully', savedAt: new Date().toLocaleTimeString() });
    } catch (err) {
      console.error('Error updating spotlight:', err);
      setSaveStatus({ type: 'error', message: 'Failed to update spotlight' });
    }
  };

  const filteredStates = CANONICAL_STATES.filter(state =>
    state.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
    state.slug.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const selectedStateName = CANONICAL_STATES.find(s => s.slug === selectedState)?.name || '';

  return (
    <WpAdminLayout title="Edit Top-25 Pages" subtitle="Manage state page content, agencies, and spotlights">
      <div className="bg-white rounded-xl border border-slate-200 overflow-hidden">
          <div className="flex h-[calc(100vh-180px)]">
            <div className="w-80 border-r border-gray-200 overflow-y-auto flex flex-col">
              <div className="p-4 border-b border-gray-200 bg-gray-50 shrink-0">
                <div className="relative mb-3">
                  <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-4 h-4" />
                  <input
                    type="text"
                    placeholder="Search states..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent"
                  />
                </div>
                <button
                  onClick={handleSyncAllStates}
                  disabled={syncing}
                  className="w-full flex items-center justify-center gap-2 px-3 py-2 text-xs font-medium bg-slate-700 text-white rounded-lg hover:bg-slate-800 disabled:opacity-50 transition-colors"
                >
                  {syncing ? (
                    <Loader className="w-3.5 h-3.5 animate-spin" />
                  ) : (
                    <RefreshCw className="w-3.5 h-3.5" />
                  )}
                  {syncing ? 'Syncing...' : 'Sync Missing States'}
                </button>
                {syncResult && (
                  <p className="mt-2 text-xs text-green-700 bg-green-50 border border-green-200 rounded p-2">{syncResult}</p>
                )}
              </div>

              <div className="p-2 overflow-y-auto flex-1">
                <p className="px-3 py-2 text-xs font-semibold text-gray-500 uppercase">
                  All Top-25 Pages ({searchQuery ? filteredStates.length + ' of 52' : '52'})
                </p>
                {filteredStates.map(state => {
                  const isReady = readyStates.has(state.slug);
                  return (
                    <button
                      key={state.slug}
                      onClick={() => setSelectedState(state.slug)}
                      className={`w-full text-left px-3 py-2 rounded-lg mb-1 transition-colors flex items-center justify-between gap-2 ${
                        selectedState === state.slug
                          ? 'bg-blue-100 text-blue-900 font-medium'
                          : 'hover:bg-gray-100 text-gray-700'
                      }`}
                    >
                      <span className="truncate">{state.name}</span>
                      <span className={`shrink-0 text-[10px] font-semibold px-1.5 py-0.5 rounded-full ${
                        isReady
                          ? 'bg-green-100 text-green-700'
                          : 'bg-gray-100 text-gray-400'
                      }`}>
                        {isReady ? 'Ready' : 'Empty'}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>

            <div className="flex-1 overflow-y-auto p-8">
              {!selectedState ? (
                <div className="text-center py-20">
                  <p className="text-gray-500 text-lg">Select a state to begin editing</p>
                  <p className="text-gray-400 text-sm mt-2">All 52 states are available. States without data will be automatically seeded on first open.</p>
                </div>
              ) : loading ? (
                <div className="text-center py-20">
                  <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
                  <p className="mt-4 text-gray-600 font-medium">
                    {seeding ? 'Creating slots for new state...' : 'Loading state data...'}
                  </p>
                  {seeding && (
                    <p className="mt-2 text-sm text-gray-400">This state had no records — generating 25 empty slots now.</p>
                  )}
                </div>
              ) : (
                <>
                  <div className="flex items-center justify-between mb-6">
                    <div>
                      <h2 className="text-2xl font-bold text-gray-900">Edit State: {selectedStateName}</h2>
                      <p className="text-sm text-gray-500 mt-1">State slug: {selectedState}</p>
                    </div>
                    <a
                      href={`/marketing-agencies-in-${selectedState}-united-states/`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                    >
                      <ExternalLink className="w-4 h-4" />
                      Open Public Page
                    </a>
                  </div>

                  {selectedState === 'new-jersey' && (
                    <div className="mb-6 p-4 rounded-lg flex items-start gap-3 bg-amber-50 border border-amber-200 text-amber-800">
                      <Info className="w-5 h-5 shrink-0 mt-0.5 text-amber-600" />
                      <div className="text-sm">
                        <strong>New Jersey uses a legacy JSON file</strong> as its base data source. However, any field you edit here (name, website, descriptions, services, logo, paid status) will be stored in the database and will <strong>override the JSON</strong> on the live page immediately after saving. State intro text comes from the legacy JSON and cannot be changed here.
                      </div>
                    </div>
                  )}

                  {saveStatus && (
                    <div className={`mb-6 p-4 rounded-lg flex items-start justify-between gap-3 ${
                      saveStatus.type === 'success' ? 'bg-green-50 border border-green-200 text-green-800' : 'bg-red-50 border border-red-200 text-red-800'
                    }`}>
                      <div className="flex items-center gap-3">
                        {saveStatus.type === 'success' ? (
                          <CheckCircle className="w-5 h-5 shrink-0 text-green-600" />
                        ) : (
                          <AlertCircle className="w-5 h-5 shrink-0 text-red-600" />
                        )}
                        <div>
                          <span className="font-medium">{saveStatus.message}</span>
                          {saveStatus.savedAt && (
                            <span className="ml-2 text-sm opacity-70">Last saved at {saveStatus.savedAt}</span>
                          )}
                        </div>
                      </div>
                      {saveStatus.type === 'success' && selectedState && (
                        <a
                          href={`/marketing-agencies-in-${selectedState}-united-states/`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="shrink-0 flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium bg-green-700 text-white rounded-lg hover:bg-green-800 transition-colors"
                        >
                          <ExternalLink className="w-3.5 h-3.5" />
                          View live page
                        </a>
                      )}
                    </div>
                  )}

                  <div className="mb-8">
                    <h3 className="text-xl font-bold text-gray-900 mb-4">Top 25 Agencies</h3>
                    <div className="space-y-3">
                      {top25Slots.map(slot => (
                        <Top25SlotEditor
                          key={slot.id}
                          slot={slot}
                          isEditing={editingSlot === slot.id}
                          onEdit={() => setEditingSlot(slot.id)}
                          onCancel={() => setEditingSlot(null)}
                          onSave={(updates) => {
                            updateTop25Slot(slot, updates);
                            if (updates.action === 'update' || updates.markSoldManual) {
                              setEditingSlot(null);
                            }
                          }}
                          onLogoUpdate={(logoUrl) => {
                            setTop25Slots(prev => prev.map(s =>
                              s.id === slot.id ? { ...s, logo_url: logoUrl } : s
                            ));
                            setSaveStatus({ type: 'success', message: 'Logo updated' });
                            setTimeout(() => setSaveStatus(null), 3000);
                          }}
                        />
                      ))}
                    </div>
                  </div>

                  {spotlightPlacements.length > 0 && (
                    <div>
                      <h3 className="text-xl font-bold text-gray-900 mb-4">Spotlight Agencies (Ads)</h3>
                      <div className="space-y-3">
                        {spotlightPlacements.map(placement => (
                          <SpotlightEditor
                            key={placement.id}
                            placement={placement}
                            isEditing={editingSpotlight === placement.id}
                            onEdit={() => setEditingSpotlight(placement.id)}
                            onCancel={() => setEditingSpotlight(null)}
                            onSave={(updates) => {
                              updateSpotlightPlacement(placement.id, updates);
                              setEditingSpotlight(null);
                            }}
                          />
                        ))}
                      </div>
                    </div>
                  )}
                </>
              )}
            </div>
          </div>
      </div>
    </WpAdminLayout>
  );
}

function HealthDot({ ok, label }: { ok: boolean; label: string }) {
  return (
    <span className={`flex items-center gap-1 text-[10px] font-medium ${ok ? 'text-green-700' : 'text-red-600'}`}>
      <span className={`w-1.5 h-1.5 rounded-full ${ok ? 'bg-green-500' : 'bg-red-500'}`} />
      {label}
    </span>
  );
}

function DiagnosticCheck({ ok, label }: { ok: boolean; label: string }) {
  return (
    <div className={`flex items-center gap-1.5 px-2 py-1.5 rounded border text-xs font-medium ${
      ok ? 'bg-green-50 border-green-200 text-green-800' : 'bg-red-50 border-red-200 text-red-700'
    }`}>
      {ok
        ? <CheckCircle className="w-3 h-3 text-green-600 shrink-0" />
        : <AlertCircle className="w-3 h-3 text-red-500 shrink-0" />
      }
      {label}
    </div>
  );
}

function SlotStatusBadge({ slot }: { slot: Top25Slot }) {
  const { slot_status, is_paid, billing_status, lock_expires_at, cancel_at_period_end, agency_name, stripe_subscription_id } = slot;

  const now = new Date();
  const expiresAt = lock_expires_at ? new Date(lock_expires_at) : null;
  const daysUntilExpiry = expiresAt ? Math.ceil((expiresAt.getTime() - now.getTime()) / (1000 * 60 * 60 * 24)) : null;
  const expiringSoon = daysUntilExpiry !== null && daysUntilExpiry <= 14 && daysUntilExpiry > 0;

  if (slot_status === 'sold' || is_paid) {
    if (billing_status === 'past_due') {
      return (
        <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-orange-100 text-orange-800 text-xs font-medium rounded">
          <AlertTriangle className="w-3 h-3" /> Past Due
        </span>
      );
    }
    if (cancel_at_period_end) {
      return (
        <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-amber-100 text-amber-800 text-xs font-medium rounded">
          <Clock className="w-3 h-3" /> Canceling
        </span>
      );
    }
    if (expiringSoon && daysUntilExpiry !== null) {
      return (
        <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-yellow-100 text-yellow-800 text-xs font-medium rounded">
          <Clock className="w-3 h-3" /> Expires in {daysUntilExpiry}d
        </span>
      );
    }
    if (stripe_subscription_id) {
      return (
        <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-green-100 text-green-800 text-xs font-medium rounded">
          <DollarSign className="w-3 h-3" /> Sold (paid)
        </span>
      );
    }
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-green-100 text-green-800 text-xs font-medium rounded">
        <DollarSign className="w-3 h-3" /> Sold (manual)
      </span>
    );
  }
  if (slot_status === 'locked') {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-slate-100 text-slate-700 text-xs font-medium rounded">
        <Lock className="w-3 h-3" /> Locked (admin)
      </span>
    );
  }
  if (slot_status === 'reserved') {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-blue-100 text-blue-800 text-xs font-medium rounded">
        <ShieldAlert className="w-3 h-3" /> Reserved
      </span>
    );
  }
  // Available slot with agency content = placeholder (unpaid)
  if (agency_name) {
    return (
      <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-yellow-50 text-yellow-700 border border-yellow-200 text-xs font-medium rounded">
        <AlertTriangle className="w-3 h-3" /> Placeholder (unpaid)
      </span>
    );
  }
  return (
    <span className="inline-flex items-center gap-1 px-2 py-0.5 bg-gray-100 text-gray-600 text-xs font-medium rounded">
      <Unlock className="w-3 h-3" /> Available
    </span>
  );
}

function Top25SlotEditor({
  slot,
  isEditing,
  onEdit,
  onCancel,
  onSave,
  onLogoUpdate
}: {
  slot: Top25Slot;
  isEditing: boolean;
  onEdit: () => void;
  onCancel: () => void;
  onSave: (updates: Partial<Top25Slot> & { markSoldManual?: boolean; action?: 'update' | 'lock' | 'unlock' | 'mark_sold'; lockReason?: string }) => void;
  onLogoUpdate: (logoUrl: string) => void;
}) {
  const [formData, setFormData] = useState({
    agency_name: slot.agency_name || '',
    website: slot.website || '',
    logo_url: slot.logo_url || '',
    short_description: slot.short_description || '',
    description: slot.description || '',
    services_raw: (slot.services || []).join(', '),
    show_lightning: slot.show_lightning,
  });

  const [uploading, setUploading] = useState(false);
  const [uploadError, setUploadError] = useState<string | null>(null);
  const [showMarkSoldConfirm, setShowMarkSoldConfirm] = useState(false);
  const [repairLoading, setRepairLoading] = useState(false);
  const [repairResult, setRepairResult] = useState<{ ok: boolean; dryRun?: boolean; log: string[]; warn?: string[]; errors: string[]; result?: any; error?: string; message?: string } | null>(null);
  const [showDiagnostic, setShowDiagnostic] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const { token: adminToken } = useAdminSession();

  const handleRepair = async (dryRun = false) => {
    setRepairLoading(true);
    setRepairResult(null);
    try {
      const res = await fetch(
        `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/top25-listing-repair`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'x-admin-token': adminToken || '',
          },
          body: JSON.stringify({
            subscriptionId: slot.stripe_subscription_id,
            stateSlug: slot.state_slug,
            rank: slot.rank,
            dryRun,
          }),
        }
      );
      const json = await res.json();
      if (!res.ok && !json.log) {
        setRepairResult({ ok: false, log: [], errors: [json.message || json.error || `Server error ${res.status}`] });
      } else {
        setRepairResult(json);
      }
    } catch (err: any) {
      setRepairResult({ ok: false, log: [], errors: [`Network error: ${err.message}`] });
    } finally {
      setRepairLoading(false);
    }
  };

  const getContentFields = () => {
    const services = formData.services_raw.split(',').map(s => s.trim()).filter(Boolean);
    return {
      agency_name: formData.agency_name,
      website: formData.website,
      logo_url: formData.logo_url,
      short_description: formData.short_description,
      description: formData.description,
      show_lightning: formData.show_lightning,
      services,
    };
  };

  const handleSave = () => {
    onSave({ ...getContentFields(), action: 'update' });
  };

  const handleLock = () => {
    onSave({ ...getContentFields(), action: 'lock' });
  };

  const handleUnlock = () => {
    onSave({ ...getContentFields(), action: 'unlock' });
  };

  const handleMarkSold = () => {
    onSave({ ...getContentFields(), markSoldManual: true });
    setShowMarkSoldConfirm(false);
  };

  const isSold = slot.slot_status === 'sold' || slot.is_paid;
  const isLocked = slot.slot_status === 'locked' && !isSold;
  const isAvailable = slot.slot_status === 'available' && !isSold;

  const handleFileSelect = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setUploading(true);
    setUploadError(null);
    try {
      const result = await uploadAgencyLogo({ file, stateSlug: slot.state_slug, rank: slot.rank });
      if (result.success && result.logoUrl) {
        setFormData(prev => ({ ...prev, logo_url: result.logoUrl! }));
        onLogoUpdate(result.logoUrl);
      } else {
        setUploadError(result.error || 'Upload failed');
      }
    } catch (err) {
      setUploadError(err instanceof Error ? err.message : 'Upload failed');
    } finally {
      setUploading(false);
      if (fileInputRef.current) fileInputRef.current.value = '';
    }
  };

  if (!isEditing) {
    return (
      <div className="border border-gray-200 rounded-lg p-4 hover:border-gray-300 transition-colors">
        <div className="flex items-start gap-4">
          <div className="flex-shrink-0">
            <div className={`w-12 h-12 rounded-lg flex items-center justify-center font-bold text-sm ${
              slot.slot_status === 'sold' || slot.is_paid ? 'bg-green-100 text-green-700' :
              slot.slot_status === 'locked' ? 'bg-amber-100 text-amber-700' :
              'bg-blue-100 text-blue-600'
            }`}>
              #{slot.rank}
            </div>
          </div>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1 flex-wrap">
              <h4 className="font-semibold text-gray-900">
                {slot.agency_name || <span className="text-gray-400 italic">Empty slot</span>}
              </h4>
              <SlotStatusBadge slot={slot} />
              {slot.show_lightning && <Zap className="w-4 h-4 text-yellow-500 fill-yellow-500" />}
            </div>
            {slot.website && <p className="text-sm text-blue-600 mb-1 truncate">{slot.website}</p>}
            {slot.short_description && <p className="text-sm text-gray-600 line-clamp-1">{slot.short_description}</p>}
            {slot.status_reason && slot.slot_status !== 'available' && (
              <p className="text-xs text-gray-400 mt-0.5 line-clamp-1">{slot.status_reason}</p>
            )}
            {slot.lock_expires_at && slot.is_paid && (
              <p className="text-xs text-gray-400 mt-0.5">
                Subscription period ends: {new Date(slot.lock_expires_at).toLocaleDateString()}
              </p>
            )}
            {(slot.slot_status === 'sold' || slot.is_paid) && (
              <div className="flex items-center gap-3 mt-1.5 flex-wrap">
                <HealthDot ok={slot.is_paid} label="Paid" />
                <HealthDot ok={slot.slot_status === 'sold'} label="Claimed" />
                <HealthDot ok={!!slot.description} label="Content" />
                <HealthDot ok={!!slot.stripe_subscription_id} label="Sub linked" />
                <HealthDot ok={!!slot.agency_id} label="Agency ID" />
              </div>
            )}
          </div>
          <button onClick={onEdit} className="flex-shrink-0 p-2 text-gray-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors">
            <Edit2 className="w-4 h-4" />
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="border-2 border-blue-300 rounded-lg p-4 bg-blue-50">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <div className="w-10 h-10 bg-blue-600 text-white rounded-lg flex items-center justify-center font-bold text-sm">#{slot.rank}</div>
          <span className="font-semibold text-gray-900">Editing Rank {slot.rank}</span>
          <SlotStatusBadge slot={slot} />
        </div>
        <button onClick={onCancel} className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-lg transition-colors">
          <X className="w-4 h-4" />
        </button>
      </div>

      {slot.stripe_subscription_id && (
        <div className="mb-4 p-3 bg-white border border-slate-200 rounded-lg text-xs text-slate-600 flex items-start gap-2">
          <Info className="w-3.5 h-3.5 shrink-0 mt-0.5 text-slate-400" />
          <div>
            <strong>Stripe sub:</strong> {slot.stripe_subscription_id}
            {slot.lock_expires_at && (
              <span className="ml-2">— period ends {new Date(slot.lock_expires_at).toLocaleDateString()}</span>
            )}
            {slot.cancel_at_period_end && (
              <span className="ml-2 text-amber-600 font-semibold">— set to cancel at period end</span>
            )}
          </div>
        </div>
      )}

      {/* Paid Listing Diagnostics */}
      {(
        <div className="mb-4 border border-slate-200 rounded-lg overflow-hidden">
          <button
            type="button"
            onClick={() => setShowDiagnostic(v => !v)}
            className="w-full flex items-center justify-between px-3 py-2 bg-slate-50 hover:bg-slate-100 transition-colors text-xs font-semibold text-slate-700"
          >
            <span className="flex items-center gap-1.5">
              <Activity className="w-3.5 h-3.5 text-slate-500" />
              Paid Listing Diagnostics
            </span>
            <span className="text-slate-400">{showDiagnostic ? '▲' : '▼'}</span>
          </button>

          {showDiagnostic && (
            <div className="p-3 space-y-3 bg-white">
              <div className="grid grid-cols-2 gap-2 sm:grid-cols-3">
                <DiagnosticCheck ok={slot.is_paid} label="Paid flag set" />
                <DiagnosticCheck ok={slot.slot_status === 'sold'} label="Slot claimed" />
                <DiagnosticCheck ok={!!slot.stripe_subscription_id} label="Stripe sub linked" />
                <DiagnosticCheck ok={!!slot.agency_id} label="Agency ID resolved" />
                <DiagnosticCheck ok={!!slot.description} label="Description filled" />
                <DiagnosticCheck ok={!!(slot.services && slot.services.length > 0)} label="Services set" />
              </div>

              {(!slot.is_paid || !slot.agency_id || !slot.description) && (
                <div className="p-2 bg-amber-50 border border-amber-200 rounded text-xs text-amber-800 flex items-start gap-1.5">
                  <AlertTriangle className="w-3.5 h-3.5 shrink-0 mt-0.5" />
                  <span>One or more checks failed. Use the repair tool to auto-finalize this listing from Stripe data.</span>
                </div>
              )}

              <div className="flex flex-wrap gap-2 pt-1">
                <button
                  type="button"
                  onClick={() => handleRepair(true)}
                  disabled={repairLoading}
                  className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium border border-slate-300 rounded-lg hover:bg-slate-50 transition-colors disabled:opacity-50"
                >
                  {repairLoading ? <Loader className="w-3 h-3 animate-spin" /> : <Activity className="w-3 h-3" />}
                  Dry Run (preview)
                </button>
                <button
                  type="button"
                  onClick={() => handleRepair(false)}
                  disabled={repairLoading}
                  className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50"
                >
                  {repairLoading ? <Loader className="w-3 h-3 animate-spin" /> : <Wrench className="w-3 h-3" />}
                  {repairLoading ? 'Running...' : 'Run Repair'}
                </button>
              </div>

              {repairResult && (
                <div className={`p-3 rounded-lg border text-xs space-y-2 ${repairResult.ok ? 'bg-green-50 border-green-200' : 'bg-red-50 border-red-200'}`}>
                  <p className={`font-semibold ${repairResult.ok ? 'text-green-800' : 'text-red-800'}`}>
                    {repairResult.ok ? (repairResult.dryRun ? 'Dry run complete' : 'Repair succeeded') : 'Repair failed'}
                    {repairResult.result?.slot && !repairResult.dryRun && ` — slot is now ${repairResult.result.slot.slot_status}, is_paid=${repairResult.result.slot.is_paid}`}
                  </p>
                  {repairResult.log.length > 0 && (
                    <ul className="space-y-0.5 text-green-700">
                      {repairResult.log.map((l, i) => <li key={i} className="flex gap-1"><span className="text-green-500">✓</span>{l}</li>)}
                    </ul>
                  )}
                  {repairResult.errors.length > 0 && (
                    <ul className="space-y-0.5 text-red-700">
                      {repairResult.errors.map((e, i) => <li key={i} className="flex gap-1"><span className="text-red-500">✗</span>{e}</li>)}
                    </ul>
                  )}
                  {repairResult.ok && !repairResult.dryRun && (
                    <p className="text-green-700 font-medium">Reload this state to see updated slot data.</p>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      )}

      <div className="space-y-3">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Agency Name</label>
          <input type="text" value={formData.agency_name} onChange={(e) => setFormData({ ...formData, agency_name: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="Agency name" />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Website URL</label>
          <input type="url" value={formData.website} onChange={(e) => setFormData({ ...formData, website: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="https://example.com" />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">Logo</label>
          {formData.logo_url && (
            <div className="mb-3 flex items-center gap-3 p-3 bg-white border border-gray-200 rounded-lg">
              <img src={formData.logo_url} alt="Current logo" className="w-12 h-12 object-contain rounded border border-gray-200"
                onError={(e) => { (e.target as HTMLImageElement).style.display = 'none'; }} />
              <div className="flex-1 min-w-0">
                <p className="text-xs text-gray-500 truncate">Current logo</p>
                <a href={formData.logo_url} target="_blank" rel="noopener noreferrer" className="text-xs text-blue-600 hover:underline">Open in new tab</a>
              </div>
            </div>
          )}
          <div className="space-y-2">
            <input ref={fileInputRef} type="file" accept="image/*" onChange={handleFileSelect} className="hidden" disabled={uploading} />
            <button type="button" onClick={() => fileInputRef.current?.click()} disabled={uploading}
              className={`w-full flex items-center justify-center gap-2 px-4 py-2.5 border-2 border-dashed rounded-lg transition-colors ${uploading ? 'border-gray-300 bg-gray-50 cursor-not-allowed' : 'border-blue-300 bg-white hover:bg-blue-50 hover:border-blue-400'}`}>
              {uploading ? <><Loader className="w-4 h-4 animate-spin text-gray-400" /><span className="text-sm text-gray-600">Uploading...</span></> : <><Upload className="w-4 h-4 text-blue-600" /><span className="text-sm font-medium text-gray-700">Choose file to upload</span></>}
            </button>
            {uploadError && (
              <div className="flex items-center gap-2 text-xs text-red-600 bg-red-50 px-3 py-2 rounded">
                <AlertCircle className="w-3 h-3" /><span>{uploadError}</span>
              </div>
            )}
            <div className="pt-2 border-t border-gray-200">
              <label className="block text-xs font-medium text-gray-600 mb-1">Or paste image URL</label>
              <input type="url" value={formData.logo_url} onChange={(e) => setFormData({ ...formData, logo_url: e.target.value })}
                className="w-full px-3 py-1.5 text-sm border border-gray-300 rounded focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="https://example.com/logo.png" />
            </div>
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Short Description</label>
          <input type="text" value={formData.short_description} onChange={(e) => setFormData({ ...formData, short_description: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="Brief intro text" />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Long Description (Read more)</label>
          <textarea value={formData.description} onChange={(e) => setFormData({ ...formData, description: e.target.value })} rows={4}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="Full description shown when user clicks Read more" />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Services (comma-separated)</label>
          <input type="text" value={formData.services_raw} onChange={(e) => setFormData({ ...formData, services_raw: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent" placeholder="SEO, PPC, Web Design, Social Media" />
          <p className="mt-1 text-xs text-gray-500">Shown as service tags on the agency card. Separate each service with a comma.</p>
        </div>

        <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg">
          <div className="flex items-start gap-2">
            <Info className="w-4 h-4 text-blue-600 shrink-0 mt-0.5" />
            <p className="text-xs text-blue-800">
              <strong>Saving content does not change this slot's availability.</strong> Use the Lock / Unlock buttons below to control whether this slot appears in the sales funnel.
            </p>
          </div>
        </div>

        <div className="p-3 bg-white rounded-lg border border-gray-200">
          <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2">Availability Controls</p>
          {isSold ? (
            <p className="text-xs text-green-700 bg-green-50 px-3 py-2 rounded border border-green-200 flex items-center gap-2">
              <DollarSign className="w-3.5 h-3.5" />
              This slot is <strong>Active (paid)</strong>. Availability is managed by Stripe. Contact support if a refund occurred.
            </p>
          ) : (
            <div className="flex flex-wrap gap-2">
              <button type="button" onClick={handleUnlock} disabled={uploading || isAvailable}
                className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors ${
                  isAvailable
                    ? 'bg-emerald-600 text-white border-emerald-600 cursor-default'
                    : 'bg-white text-gray-600 border-gray-300 hover:bg-emerald-50 hover:border-emerald-400 hover:text-emerald-700 disabled:opacity-40'
                }`}>
                <Unlock className="w-3 h-3" />
                {isAvailable ? 'Currently Available for Sale' : 'Make Available for Sale'}
              </button>
              <button type="button" onClick={handleLock} disabled={uploading || isLocked}
                className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-medium border transition-colors ${
                  isLocked
                    ? 'bg-amber-500 text-white border-amber-500 cursor-default'
                    : 'bg-white text-gray-600 border-gray-300 hover:bg-amber-50 hover:border-amber-400 hover:text-amber-700 disabled:opacity-40'
                }`}>
                <Lock className="w-3 h-3" />
                {isLocked ? 'Currently Locked (not for sale)' : 'Lock (remove from sale)'}
              </button>
            </div>
          )}
          {isLocked && (
            <p className="mt-2 text-xs text-amber-700 bg-amber-50 px-2 py-1 rounded">
              Locked slots have content but won't appear in the sales funnel. is_paid remains false.
            </p>
          )}
          {isAvailable && (
            <p className="mt-2 text-xs text-emerald-700 bg-emerald-50 px-2 py-1 rounded">
              This slot is visible in the sales funnel. Buyers can purchase it.
            </p>
          )}
        </div>

        <div className="flex items-center gap-6">
          <label className="flex items-center gap-2 cursor-pointer">
            <input type="checkbox" checked={formData.show_lightning} onChange={(e) => setFormData({ ...formData, show_lightning: e.target.checked })}
              className="w-4 h-4 text-blue-600 rounded focus:ring-2 focus:ring-blue-600" />
            <Zap className="w-4 h-4 text-yellow-500 fill-yellow-500" />
            <span className="text-sm font-medium text-gray-700">Show Lightning Badge</span>
          </label>
        </div>

        <div className="flex flex-wrap gap-2 pt-2">
          <button onClick={handleSave} disabled={uploading}
            className={`flex items-center gap-2 px-4 py-2 rounded-lg transition-colors ${uploading ? 'bg-gray-400 cursor-not-allowed text-white' : 'bg-blue-600 hover:bg-blue-700 text-white'}`}>
            <Save className="w-4 h-4" />Save Content
          </button>
          <button onClick={onCancel} disabled={uploading}
            className="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors disabled:opacity-50 disabled:cursor-not-allowed">
            Cancel
          </button>
          {!isSold && (
            <button onClick={() => setShowMarkSoldConfirm(true)} type="button"
              className="flex items-center gap-2 px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg transition-colors ml-auto text-sm">
              <DollarSign className="w-4 h-4" />Mark as Sold (manual)
            </button>
          )}
        </div>

        {showMarkSoldConfirm && (
          <div className="p-4 bg-red-50 border border-red-200 rounded-lg">
            <p className="text-sm font-semibold text-red-800 mb-1">Confirm: Mark as Sold</p>
            <p className="text-xs text-red-700 mb-3">
              This sets <strong>is_paid=true</strong> and <strong>slot_status='sold'</strong>. Use this only when payment was confirmed outside of Stripe (e.g., bank transfer). This affects revenue reporting.
            </p>
            <div className="flex gap-2">
              <button onClick={handleMarkSold} className="px-3 py-1.5 bg-red-600 text-white text-sm rounded-lg hover:bg-red-700 transition-colors">
                Yes, mark as sold
              </button>
              <button onClick={() => setShowMarkSoldConfirm(false)} className="px-3 py-1.5 bg-gray-200 text-gray-700 text-sm rounded-lg hover:bg-gray-300 transition-colors">
                Cancel
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

function SpotlightEditor({
  placement,
  isEditing,
  onEdit,
  onCancel,
  onSave
}: {
  placement: SpotlightPlacement;
  isEditing: boolean;
  onEdit: () => void;
  onCancel: () => void;
  onSave: (updates: Partial<SpotlightPlacement>) => void;
}) {
  const [formData, setFormData] = useState({
    agency_name: placement.agency_name || '',
    website_url: placement.website_url || '',
    logo_url: placement.logo_url || '',
    short_description: placement.short_description || '',
    full_description: placement.full_description || ''
  });

  const handleSave = () => {
    onSave(formData);
  };

  if (!isEditing) {
    return (
      <div className="border border-yellow-200 bg-yellow-50 rounded-lg p-4 hover:border-yellow-300 transition-colors">
        <div className="flex items-start gap-4">
          <div className="flex-shrink-0">
            <div className="w-12 h-12 bg-yellow-500 text-white rounded-lg flex items-center justify-center font-bold">
              S{placement.position}
            </div>
          </div>
          <div className="flex-1 min-w-0">
            <h4 className="font-semibold text-gray-900 mb-1">{placement.agency_name}</h4>
            {placement.website_url && (
              <p className="text-sm text-blue-600 mb-1">{placement.website_url}</p>
            )}
            {placement.short_description && (
              <p className="text-sm text-gray-600 line-clamp-2">{placement.short_description}</p>
            )}
          </div>
          <button
            onClick={onEdit}
            className="flex-shrink-0 p-2 text-gray-400 hover:text-yellow-600 hover:bg-yellow-100 rounded-lg transition-colors"
          >
            <Edit2 className="w-4 h-4" />
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="border-2 border-yellow-400 rounded-lg p-4 bg-yellow-50">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-2">
          <div className="w-10 h-10 bg-yellow-500 text-white rounded-lg flex items-center justify-center font-bold text-sm">
            S{placement.position}
          </div>
          <span className="font-semibold text-gray-900">Editing Spotlight Position {placement.position}</span>
        </div>
        <button
          onClick={onCancel}
          className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-lg transition-colors"
        >
          <X className="w-4 h-4" />
        </button>
      </div>

      <div className="space-y-3">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Agency Name</label>
          <input
            type="text"
            value={formData.agency_name}
            onChange={(e) => setFormData({ ...formData, agency_name: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-transparent"
            placeholder="Agency name"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Website URL</label>
          <input
            type="url"
            value={formData.website_url}
            onChange={(e) => setFormData({ ...formData, website_url: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-transparent"
            placeholder="https://example.com"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Logo URL</label>
          <input
            type="url"
            value={formData.logo_url}
            onChange={(e) => setFormData({ ...formData, logo_url: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-transparent"
            placeholder="https://example.com/logo.png"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Short Description</label>
          <input
            type="text"
            value={formData.short_description}
            onChange={(e) => setFormData({ ...formData, short_description: e.target.value })}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-transparent"
            placeholder="Brief intro text"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Full Description</label>
          <textarea
            value={formData.full_description}
            onChange={(e) => setFormData({ ...formData, full_description: e.target.value })}
            rows={4}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-yellow-500 focus:border-transparent"
            placeholder="Full description"
          />
        </div>

        <div className="flex gap-2 pt-2">
          <button
            onClick={handleSave}
            className="flex items-center gap-2 px-4 py-2 bg-yellow-500 text-white rounded-lg hover:bg-yellow-600 transition-colors"
          >
            <Save className="w-4 h-4" />
            Save Changes
          </button>
          <button
            onClick={onCancel}
            className="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg hover:bg-gray-300 transition-colors"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
}
