// ============================================================================
// TYPE DEFINITIONS
// ============================================================================

export type AvailabilityRequestEmailData = {
  agencyName: string;
  stateName: string;
  clientName: string;
  clientEmail: string;
  service: string;
  budget: string;
  timeline: string;
  submittedAtIso: string;
  isPaidListing: boolean;
};

export type Top25SubmissionEmailData = {
  agencyName: string;
  contactName: string;
  contactEmail: string;
  websiteUrl: string;
  stateName: string;
  stateSlug: string;
  services: string[];
  description: string;
  submittedAtIso: string;
  ipAddress?: string;
  userAgent?: string;
};

export type SpotlightApplicationEmailData = {
  agencyName: string;
  contactName: string;
  contactEmail: string;
  websiteUrl: string;
  stateName: string;
  stateSlug: string;
  services: string[];
  description: string;
  budgetRange?: string;
  submittedAtIso: string;
  ipAddress?: string;
  userAgent?: string;
};

export type OtherListingActivationEmailData = {
  agencyName: string;
  contactName: string;
  contactEmail: string;
  websiteUrl: string;
  stateName: string;
  stateSlug: string;
  services: string[];
  description: string;
  budgetRange?: string;
  submittedAtIso: string;
};

// ============================================================================
// AVAILABILITY REQUEST EMAILS
// ============================================================================

export function buildAvailabilityRequestInternalEmail(
  data: AvailabilityRequestEmailData
): { subject: string; html: string; text: string } {
  const {
    agencyName,
    stateName,
    clientName,
    clientEmail,
    service,
    budget,
    timeline,
    submittedAtIso,
    isPaidListing,
  } = data;

  const subject = `New availability request – ${agencyName} (${stateName})`;

  const listingLabel = isPaidListing ? 'Paid listing' : 'Free listing';

  const text = `
New availability request for ${agencyName} (${stateName})

Listing type: ${listingLabel}

Client:
- Name: ${clientName || '—'}
- Email: ${clientEmail || '—'}

Project details:
- Service: ${service || '—'}
- Budget: ${budget || '—'}
- Timeline: ${timeline || '—'}

Submitted at: ${submittedAtIso}
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <div style="font-size: 14px; font-weight: 600; color: #0f766e; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 8px;">
        New availability request
      </div>
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 12px;">
        ${agencyName} (${stateName})
      </h1>
      <p style="font-size: 13px; color: #6b7280; margin: 0 0 16px;">
        Listing type: <span style="font-weight: 500; color: #374151;">${listingLabel}</span>
      </p>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Client</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Name:</strong> ${clientName || '—'}<br/>
          <strong style="font-weight: 600;">Email:</strong> ${clientEmail ? `<a href="mailto:${clientEmail}" style="color:#2563eb; text-decoration:none;">${clientEmail}</a>` : '—'}
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Project details</h2>
        <p style="font-size: 13px; color: #374151; margin: 0 0 4px;">
          <strong style="font-weight: 600;">Service:</strong> ${service || '—'}
        </p>
        <p style="font-size: 13px; color: #374151; margin: 0 0 4px;">
          <strong style="font-weight: 600;">Budget:</strong> ${budget || '—'}
        </p>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Timeline:</strong> ${timeline || '—'}
        </p>
      </div>

      <p style="font-size: 12px; color: #9ca3af; margin: 16px 0 0;">
        Submitted at: ${submittedAtIso}
      </p>
    </div>

    <p style="font-size: 11px; color: #9ca3af; margin: 12px auto 0; max-width: 560px; text-align: center;">
      You're receiving this notification because a visitor used the "Check Availability" form on your directory.
    </p>
  </div>
  `.trim();

  return { subject, html, text };
}

export function buildAvailabilityRequestOwnerEmail(
  data: AvailabilityRequestEmailData
): { subject: string; html: string; text: string } {
  const {
    agencyName,
    stateName,
    clientName,
    clientEmail,
    service,
    budget,
    timeline,
  } = data;

  const subject = `New Availability Request – ${clientName || 'Potential Client'}`;

  const text = `
Hi ${agencyName},

A new potential client has checked your availability.

Project details:
• Service needed: ${service || '—'}
• Budget: ${budget || '—'}
• Timeline: ${timeline || '—'}
• Client name: ${clientName || '—'}
• Client email: ${clientEmail || '—'}

This client was specifically routed to your agency because your listing is active in the ${stateName} directory.

You can reach out directly using the contact details above.

Thanks,
The Gappsy Team
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <div style="font-size: 14px; font-weight: 600; color: #0f766e; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 8px;">
        New Client Request
      </div>
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 12px;">
        ${clientName || 'Potential Client'} is interested
      </h1>
      <p style="font-size: 13px; color: #6b7280; margin: 0 0 16px;">
        A client checked your availability in the ${stateName} directory.
      </p>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Project details</h2>
        <p style="font-size: 13px; color: #374151; margin: 0 0 4px;">
          <strong style="font-weight: 600;">Service:</strong> ${service || '—'}
        </p>
        <p style="font-size: 13px; color: #374151; margin: 0 0 4px;">
          <strong style="font-weight: 600;">Budget:</strong> ${budget || '—'}
        </p>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Timeline:</strong> ${timeline || '—'}
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Contact information</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Name:</strong> ${clientName || '—'}<br/>
          <strong style="font-weight: 600;">Email:</strong> ${clientEmail ? `<a href="mailto:${clientEmail}" style="color:#2563eb; text-decoration:none;">${clientEmail}</a>` : '—'}
        </p>
      </div>

      <p style="font-size: 12px; color: #6b7280; margin: 16px 0 0; line-height: 1.5;">
        This client was routed to your agency through the Check Availability feature. You can reach out directly using the contact details above.
      </p>
    </div>

    <p style="font-size: 11px; color: #9ca3af; margin: 12px auto 0; max-width: 560px; text-align: center;">
      You're receiving this because your agency has an active listing in the ${stateName} directory.
    </p>
  </div>
  `.trim();

  return { subject, html, text };
}

// ============================================================================
// TOP-25 SUBMISSION EMAILS
// ============================================================================

export function buildTop25SubmissionInternalEmail(
  data: Top25SubmissionEmailData
): { subject: string; html: string; text: string } {
  const {
    agencyName,
    contactName,
    contactEmail,
    websiteUrl,
    stateName,
    services,
    description,
    submittedAtIso,
    ipAddress,
    userAgent,
  } = data;

  const subject = `New Top-25 Submission – ${agencyName} (${stateName})`;

  const text = `
New Top-25 Submission

Agency: ${agencyName}
State: ${stateName}

Contact Information:
- Name: ${contactName}
- Email: ${contactEmail}
- Website: ${websiteUrl}

Services: ${services.join(', ')}

Description:
${description}

Submitted at: ${submittedAtIso}
IP: ${ipAddress || 'unknown'}
User Agent: ${userAgent || 'unknown'}
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <div style="font-size: 14px; font-weight: 600; color: #7c3aed; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 8px;">
        New Top-25 Submission
      </div>
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 12px;">
        ${agencyName}
      </h1>
      <p style="font-size: 13px; color: #6b7280; margin: 0 0 16px;">
        State: <span style="font-weight: 500; color: #374151;">${stateName}</span>
      </p>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Contact</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Name:</strong> ${contactName}<br/>
          <strong style="font-weight: 600;">Email:</strong> <a href="mailto:${contactEmail}" style="color:#2563eb; text-decoration:none;">${contactEmail}</a><br/>
          <strong style="font-weight: 600;">Website:</strong> <a href="${websiteUrl}" style="color:#2563eb; text-decoration:none;">${websiteUrl}</a>
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Services</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          ${services.join(', ')}
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Description</h2>
        <p style="font-size: 13px; color: #374151; margin: 0; line-height: 1.5;">
          ${description}
        </p>
      </div>

      <p style="font-size: 12px; color: #9ca3af; margin: 16px 0 0;">
        Submitted at: ${submittedAtIso}<br/>
        ${ipAddress ? `IP: ${ipAddress}<br/>` : ''}
        ${userAgent ? `User Agent: ${userAgent}` : ''}
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}

export function buildTop25SubmissionApplicantEmail(
  data: Top25SubmissionEmailData
): { subject: string; html: string; text: string } {
  const { contactName, agencyName, stateName, stateSlug } = data;

  const subject = `Your Top-25 Submission – ${agencyName}`;

  const returnUrl = `https://www.gappsy.com/${stateSlug}/top-25/offer`;

  const text = `
Hi ${contactName},

We received your submission for the Top 25 ${stateName} rankings.

You haven't completed your upgrade yet — and Top-25 positions are claimed quickly. Once a spot is taken, it may be unavailable again for months.

Completing your upgrade now ensures your agency becomes eligible to receive availability requests and appear ahead of competing agencies in ${stateName}.

You can resume your application below:
${returnUrl}

Thanks,
The Gappsy Team
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 16px;">
        Hi ${contactName},
      </h1>
      <p style="font-size: 14px; color: #374151; margin: 0 0 12px; line-height: 1.6;">
        We received your submission for the <strong>Top 25 ${stateName} rankings</strong>.
      </p>
      <p style="font-size: 14px; color: #374151; margin: 0 0 12px; line-height: 1.6;">
        You haven't completed your upgrade yet — and Top-25 positions are claimed quickly. Once a spot is taken, it may be unavailable again for months.
      </p>
      <p style="font-size: 14px; color: #374151; margin: 0 0 20px; line-height: 1.6;">
        Completing your upgrade now ensures your agency becomes eligible to receive availability requests and appear ahead of competing agencies in ${stateName}.
      </p>

      <div style="text-align: center; margin: 24px 0;">
        <a href="${returnUrl}" style="display: inline-block; background: #2563eb; color: #ffffff; padding: 12px 32px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
          Continue Application
        </a>
      </div>

      <p style="font-size: 13px; color: #6b7280; margin: 20px 0 0; line-height: 1.5;">
        Thanks,<br/>
        The Gappsy Team
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}

// ============================================================================
// SPOTLIGHT APPLICATION EMAILS
// ============================================================================

export function buildSpotlightApplicationInternalEmail(
  data: SpotlightApplicationEmailData
): { subject: string; html: string; text: string } {
  const {
    agencyName,
    contactName,
    contactEmail,
    websiteUrl,
    stateName,
    services,
    description,
    budgetRange,
    submittedAtIso,
    ipAddress,
    userAgent,
  } = data;

  const subject = `New Spotlight Application – ${agencyName} (${stateName})`;

  const text = `
New Spotlight Application

Agency: ${agencyName}
State: ${stateName}

Contact Information:
- Name: ${contactName}
- Email: ${contactEmail}
- Website: ${websiteUrl}

Services: ${services.join(', ')}
${budgetRange ? `Budget Range: ${budgetRange}` : ''}

Description:
${description}

Submitted at: ${submittedAtIso}
IP: ${ipAddress || 'unknown'}
User Agent: ${userAgent || 'unknown'}
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <div style="font-size: 14px; font-weight: 600; color: #ea580c; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 8px;">
        New Spotlight Application
      </div>
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 12px;">
        ${agencyName}
      </h1>
      <p style="font-size: 13px; color: #6b7280; margin: 0 0 16px;">
        State: <span style="font-weight: 500; color: #374151;">${stateName}</span>
      </p>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Contact</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Name:</strong> ${contactName}<br/>
          <strong style="font-weight: 600;">Email:</strong> <a href="mailto:${contactEmail}" style="color:#2563eb; text-decoration:none;">${contactEmail}</a><br/>
          <strong style="font-weight: 600;">Website:</strong> <a href="${websiteUrl}" style="color:#2563eb; text-decoration:none;">${websiteUrl}</a>
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Services</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          ${services.join(', ')}
        </p>
        ${budgetRange ? `<p style="font-size: 13px; color: #374151; margin: 8px 0 0;"><strong style="font-weight: 600;">Budget Range:</strong> ${budgetRange}</p>` : ''}
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Description</h2>
        <p style="font-size: 13px; color: #374151; margin: 0; line-height: 1.5;">
          ${description}
        </p>
      </div>

      <p style="font-size: 12px; color: #9ca3af; margin: 16px 0 0;">
        Submitted at: ${submittedAtIso}<br/>
        ${ipAddress ? `IP: ${ipAddress}<br/>` : ''}
        ${userAgent ? `User Agent: ${userAgent}` : ''}
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}

export function buildSpotlightApplicationApplicantEmail(
  data: SpotlightApplicationEmailData
): { subject: string; html: string; text: string } {
  const { contactName, agencyName, stateName, stateSlug } = data;

  const subject = `Spotlight Application Received – ${agencyName}`;

  const returnUrl = `https://www.gappsy.com/${stateSlug}/spotlight/offer`;

  const text = `
Hi ${contactName},

We've received your Spotlight application for the ${stateName} directory.

Spotlight placements are limited and confirmed on a first-come, first-served basis.

If you haven't completed your upgrade yet, you can resume below.

Continue here:
${returnUrl}

Thanks,
The Gappsy Team
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 16px;">
        Hi ${contactName},
      </h1>
      <p style="font-size: 14px; color: #374151; margin: 0 0 12px; line-height: 1.6;">
        We've received your <strong>Spotlight application</strong> for the ${stateName} directory.
      </p>
      <p style="font-size: 14px; color: #374151; margin: 0 0 12px; line-height: 1.6;">
        Spotlight placements are limited and confirmed on a first-come, first-served basis.
      </p>
      <p style="font-size: 14px; color: #374151; margin: 0 0 20px; line-height: 1.6;">
        If you haven't completed your upgrade yet, you can resume below.
      </p>

      <div style="text-align: center; margin: 24px 0;">
        <a href="${returnUrl}" style="display: inline-block; background: #ea580c; color: #ffffff; padding: 12px 32px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
          Continue Upgrade
        </a>
      </div>

      <p style="font-size: 13px; color: #6b7280; margin: 20px 0 0; line-height: 1.5;">
        Thanks,<br/>
        The Gappsy Team
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}

// ============================================================================
// OTHER LISTING ACTIVATION EMAILS
// ============================================================================

export function buildOtherListingActivationInternalEmail(
  data: OtherListingActivationEmailData
): { subject: string; html: string; text: string } {
  const {
    agencyName,
    contactName,
    contactEmail,
    websiteUrl,
    stateName,
    services,
    description,
    budgetRange,
    submittedAtIso,
  } = data;

  const subject = `New Listing Activation – ${agencyName} (${stateName})`;

  const text = `
New Listing Activation Request

Agency: ${agencyName}
State: ${stateName}

Contact Information:
- Name: ${contactName}
- Email: ${contactEmail}
- Website: ${websiteUrl}

Services: ${services.join(', ')}
${budgetRange ? `Budget Range: ${budgetRange}` : ''}

Description:
${description}

Submitted at: ${submittedAtIso}
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <div style="font-size: 14px; font-weight: 600; color: #0891b2; text-transform: uppercase; letter-spacing: 0.08em; margin-bottom: 8px;">
        New Activation Request
      </div>
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 12px;">
        ${agencyName}
      </h1>
      <p style="font-size: 13px; color: #6b7280; margin: 0 0 16px;">
        State: <span style="font-weight: 500; color: #374151;">${stateName}</span>
      </p>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Contact</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          <strong style="font-weight: 600;">Name:</strong> ${contactName}<br/>
          <strong style="font-weight: 600;">Email:</strong> <a href="mailto:${contactEmail}" style="color:#2563eb; text-decoration:none;">${contactEmail}</a><br/>
          <strong style="font-weight: 600;">Website:</strong> <a href="${websiteUrl}" style="color:#2563eb; text-decoration:none;">${websiteUrl}</a>
        </p>
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Services</h2>
        <p style="font-size: 13px; color: #374151; margin: 0;">
          ${services.join(', ')}
        </p>
        ${budgetRange ? `<p style="font-size: 13px; color: #374151; margin: 8px 0 0;"><strong style="font-weight: 600;">Budget Range:</strong> ${budgetRange}</p>` : ''}
      </div>

      <div style="border-top: 1px solid #e5e7eb; margin: 16px 0; padding-top: 16px;">
        <h2 style="font-size: 14px; font-weight: 600; color: #111827; margin: 0 0 8px;">Description</h2>
        <p style="font-size: 13px; color: #374151; margin: 0; line-height: 1.5;">
          ${description}
        </p>
      </div>

      <p style="font-size: 12px; color: #9ca3af; margin: 16px 0 0;">
        Submitted at: ${submittedAtIso}
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}

export function buildOtherListingActivationApplicantEmail(
  data: OtherListingActivationEmailData
): { subject: string; html: string; text: string } {
  const { contactName, agencyName, stateName, stateSlug } = data;

  const subject = `Your Listing Activation Request – ${agencyName}`;

  const returnUrl = `https://www.gappsy.com/${stateSlug}/activation/upgrade`;

  const text = `
Hi ${contactName},

We've received your request to activate your listing in the ${stateName} directory.

Right now, clients using the Check Availability tool are being routed to other ${stateName} agencies. Once your activation is complete, we'll start sending these leads to your agency instead.

You can resume your activation below:
${returnUrl}

Thanks,
The Gappsy Team
`.trim();

  const html = `
  <div style="font-family: system-ui, -apple-system, BlinkMacSystemFont, 'SF Pro Text', sans-serif; background: #f9fafb; padding: 24px;">
    <div style="max-width: 560px; margin: 0 auto; background: #ffffff; border-radius: 16px; padding: 24px 24px 20px; box-shadow: 0 10px 30px rgba(15,23,42,0.08);">
      <h1 style="font-size: 18px; line-height: 1.4; color: #0f172a; margin: 0 0 16px;">
        Hi ${contactName},
      </h1>
      <p style="font-size: 14px; color: #374151; margin: 0 0 12px; line-height: 1.6;">
        We've received your request to activate your listing in the <strong>${stateName} directory</strong>.
      </p>
      <p style="font-size: 14px; color: #374151; margin: 0 0 20px; line-height: 1.6;">
        Right now, clients using the Check Availability tool are being routed to other ${stateName} agencies. Once your activation is complete, we'll start sending these leads to your agency instead.
      </p>

      <div style="text-align: center; margin: 24px 0;">
        <a href="${returnUrl}" style="display: inline-block; background: #0891b2; color: #ffffff; padding: 12px 32px; border-radius: 8px; text-decoration: none; font-weight: 600; font-size: 14px;">
          Complete Activation
        </a>
      </div>

      <p style="font-size: 13px; color: #6b7280; margin: 20px 0 0; line-height: 1.5;">
        Thanks,<br/>
        The Gappsy Team
      </p>
    </div>
  </div>
  `.trim();

  return { subject, html, text };
}
