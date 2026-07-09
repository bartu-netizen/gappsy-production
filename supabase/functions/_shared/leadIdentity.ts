/**
 * Lead Identity & Signature Utilities
 *
 * Provides deterministic lead identification and link signing for smart routing.
 * Ensures links cannot be easily forged and lead identity is consistent.
 */

import { createHmac } from 'node:crypto';

const SIGNATURE_SECRET = Deno.env.get('SMART_LINK_SECRET') || 'default-smart-link-secret-change-in-production';

/**
 * Generate a deterministic lead key from email
 * Uses HMAC-SHA256 to create a stable, non-reversible identifier
 */
export function computeLeadKey(email: string): string {
  const normalized = email.toLowerCase().trim();
  const hmac = createHmac('sha256', SIGNATURE_SECRET);
  hmac.update(normalized);
  return hmac.digest('hex').substring(0, 32);
}

/**
 * Sign parameters for smart link
 * Returns a signature that can be verified on the server
 */
export function signLeadParams(params: {
  agency_id: string;
  lead_key: string;
  timestamp?: number;
  campaign_id?: string;
}): string {
  const timestamp = params.timestamp || Date.now();
  const payload = [
    params.agency_id,
    params.lead_key,
    timestamp.toString(),
    params.campaign_id || '',
  ].join('|');

  const hmac = createHmac('sha256', SIGNATURE_SECRET);
  hmac.update(payload);
  return hmac.digest('hex').substring(0, 16);
}

/**
 * Verify signed smart link parameters
 * Returns true if signature is valid and not expired
 */
export function verifyLeadSignature(params: {
  agency_id: string;
  lead_key: string;
  timestamp: number;
  campaign_id?: string;
  sig: string;
}, maxAgeMs: number = 30 * 24 * 60 * 60 * 1000): boolean {
  // Check timestamp age
  const age = Date.now() - params.timestamp;
  if (age > maxAgeMs || age < 0) {
    return false;
  }

  // Recompute signature
  const expectedSig = signLeadParams({
    agency_id: params.agency_id,
    lead_key: params.lead_key,
    timestamp: params.timestamp,
    campaign_id: params.campaign_id,
  });

  return expectedSig === params.sig;
}

/**
 * Build a signed smart link URL
 */
export function buildSmartLink(
  baseUrl: string,
  agencySlug: string,
  params: {
    agency_id: string;
    lead_email?: string;
    lead_key?: string;
    campaign_id?: string;
    campaign_name?: string;
    sequence_name?: string;
    email_step?: string;
  }
): string {
  const leadKey = params.lead_key || (params.lead_email ? computeLeadKey(params.lead_email) : '');
  const timestamp = Date.now();

  const sig = signLeadParams({
    agency_id: params.agency_id,
    lead_key: leadKey,
    timestamp,
    campaign_id: params.campaign_id,
  });

  const url = new URL(`${baseUrl}/continue/${agencySlug}`);
  url.searchParams.set('aid', params.agency_id);
  url.searchParams.set('lid', leadKey);
  url.searchParams.set('ts', timestamp.toString());
  url.searchParams.set('sig', sig);

  if (params.campaign_id) url.searchParams.set('cid', params.campaign_id);
  if (params.campaign_name) url.searchParams.set('cn', encodeURIComponent(params.campaign_name));
  if (params.sequence_name) url.searchParams.set('sn', encodeURIComponent(params.sequence_name));
  if (params.email_step) url.searchParams.set('es', params.email_step);

  return url.toString();
}

/**
 * Generate a cryptographically random compact token for a smart link.
 * Produces 16 lowercase hex characters (64 bits of entropy).
 * Safe for use as a public URL parameter.
 */
export function generateSmartToken(): string {
  const bytes = new Uint8Array(8);
  crypto.getRandomValues(bytes);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('');
}

/**
 * Parse and verify smart link parameters from URL
 */
export function parseSmartLinkParams(url: URL): {
  valid: boolean;
  agency_id: string | null;
  lead_key: string | null;
  campaign_id: string | null;
  campaign_name: string | null;
  sequence_name: string | null;
  email_step: string | null;
  timestamp: number | null;
} {
  const aid = url.searchParams.get('aid');
  const lid = url.searchParams.get('lid');
  const ts = url.searchParams.get('ts');
  const sig = url.searchParams.get('sig');
  const cid = url.searchParams.get('cid');
  const cn = url.searchParams.get('cn');
  const sn = url.searchParams.get('sn');
  const es = url.searchParams.get('es');

  if (!aid || !lid || !ts || !sig) {
    return {
      valid: false,
      agency_id: aid,
      lead_key: lid,
      campaign_id: cid,
      campaign_name: cn,
      sequence_name: sn,
      email_step: es,
      timestamp: ts ? parseInt(ts, 10) : null,
    };
  }

  const timestamp = parseInt(ts, 10);
  const valid = verifyLeadSignature({
    agency_id: aid,
    lead_key: lid,
    timestamp,
    campaign_id: cid || undefined,
    sig,
  });

  return {
    valid,
    agency_id: aid,
    lead_key: lid,
    campaign_id: cid,
    campaign_name: cn ? decodeURIComponent(cn) : null,
    sequence_name: sn ? decodeURIComponent(sn) : null,
    email_step: es,
    timestamp,
  };
}
