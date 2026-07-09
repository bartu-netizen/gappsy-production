import { adminFetch } from '../utils/adminFetch';

export interface SenderIdentity {
  fromName: string;
  fromEmail: string;
  replyTo?: string;
}

export async function getSenderIdentitySettings(): Promise<SenderIdentity> {
  try {
    const res = await adminFetch('email-marketing-api?path=settings/sender');
    const data = await res.json();
    if (!res.ok || data.ok === false) {
      throw new Error(data.message || `HTTP ${res.status}`);
    }
    return {
      fromName: data.sender?.from_name || 'Gappsy',
      fromEmail: data.sender?.from_email || 'noreply@gappsy.com',
      replyTo: data.sender?.reply_to || undefined,
    };
  } catch (err) {
    console.error('Error fetching sender identity:', err);
    return { fromName: 'Gappsy', fromEmail: 'noreply@gappsy.com' };
  }
}

export async function updateSenderIdentitySettings(identity: SenderIdentity): Promise<void> {
  const res = await adminFetch('email-marketing-api?path=settings/sender', {
    method: 'PUT',
    body: JSON.stringify({
      from_name: identity.fromName,
      from_email: identity.fromEmail,
      reply_to: identity.replyTo || '',
    }),
  });
  const data = await res.json();
  if (!res.ok || data.ok === false) {
    throw new Error(data.message || `Failed to save sender identity: HTTP ${res.status}`);
  }
}
