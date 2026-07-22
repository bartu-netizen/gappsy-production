import type { ToolComparisonContent } from './types';

const calComVsSavvycalContent: ToolComparisonContent = {
  "verdict": "Cal.com and SavvyCal are both freemium scheduling tools, but Cal.com is open-source with a broader integration and pricing ladder up to an Organizations tier with SSO/SAML, while SavvyCal differentiates on booking UX, a calendar overlay and week view, within a simpler two-tier, per-user pricing structure and no enterprise/SSO tier documented.",
  "bestForToolA": "Teams that want an open-source, self-hostable scheduling platform with 100+ app integrations, including two-way Salesforce and HubSpot sync, even on the free tier, and that may eventually need SSO/SAML/SCIM via the Organizations plan.",
  "bestForToolB": "Individuals or teams that prioritize a friendlier booking experience, where invitees see their own calendar overlaid on the host's availability in a full week view, and prefer a simple two-tier ($10/$17 per user) pricing structure.",
  "whoNeedsBoth": "An organization might use Cal.com for its API-heavy, open-source integration needs while individual reps or executives who want the calendar-overlay booking experience use SavvyCal for their own personal scheduling links, the two aren't mutually exclusive if booking UX and platform openness are both priorities.",
  "keyDifferences": [
    {
      "title": "Booking experience for invitees",
      "toolA": "Cal.com uses custom booking links (e.g., cal.com/username) with a standard date/time picker.",
      "toolB": "SavvyCal's calendar overlay shows recipients their own calendar events alongside the host's availability in a full week view, replacing the single day/time picker.",
      "whyItMatters": "SavvyCal's overlay is presented as a differentiator specifically meant to reduce back-and-forth for the person booking the meeting.",
      "benefitsWho": "External-facing users (sales reps, executives) who book with people outside their own calendar system frequently."
    },
    {
      "title": "Open source vs. closed platform",
      "toolA": "Cal.com's source code is available on GitHub for self-hosting or customization.",
      "toolB": "SavvyCal's facts do not mention an open-source option.",
      "whyItMatters": "Open-source availability matters for teams with data-residency requirements or a preference for self-hosting instead of a SaaS-only dependency.",
      "benefitsWho": "Engineering-led teams or companies with strict hosting/compliance requirements."
    },
    {
      "title": "AI features",
      "toolA": "Cal.com offers Cal.ai, an AI phone agent that handles automated scheduling calls.",
      "toolB": "SavvyCal's own cons explicitly state that no AI features are mentioned on the site.",
      "whyItMatters": "Teams wanting AI-assisted scheduling have a documented option only with Cal.com.",
      "benefitsWho": "Teams that want automated phone-based scheduling handled by AI."
    },
    {
      "title": "Enterprise/compliance tier",
      "toolA": "Cal.com's Organizations plan ($28/user/month annual) adds SAML SSO, SCIM, and compliance checks; Enterprise adds SLAs and dedicated onboarding.",
      "toolB": "SavvyCal's pricing tops out at Premium ($17/user/month) with custom domains and delegate-to-assistant access, no SSO/SAML or enterprise tier is documented.",
      "whyItMatters": "Organizations with IT/security requirements around SSO need a plan that supports it.",
      "benefitsWho": "Larger organizations with identity-management or compliance requirements."
    },
    {
      "title": "Payment collection availability by tier",
      "toolA": "Cal.com includes Stripe and PayPal payments on its Free plan.",
      "toolB": "SavvyCal requires the Premium plan ($17/user/month) for paid bookings.",
      "whyItMatters": "Solo users who want to charge for bookings from day one get that on Cal.com's free tier but must upgrade on SavvyCal.",
      "benefitsWho": "Freelancers and consultants monetizing bookings who want to avoid an upgrade just for payments."
    }
  ],
  "featureMatrix": [
    {
      "group": "Booking Experience",
      "rows": [
        {
          "feature": "Calendar overlay/week view",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom personalized booking links",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Branding customization",
          "toolA": "available",
          "toolB": "available",
          "note": "Cal.com: branding removal on Teams+; SavvyCal: custom colors/banner/avatar"
        },
        {
          "feature": "Meeting polls (invitee voting)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & AI",
      "rows": [
        {
          "feature": "Open-source / self-hostable",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI phone agent",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Built-in video conferencing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "100+ third-party app integrations",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Team Features",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Payments on free/basic tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Team scheduling modes",
          "toolA": "available",
          "toolB": "available",
          "note": "Cal.com: round-robin (Teams); SavvyCal: Collective/Round Robin/Group"
        },
        {
          "feature": "SSO/SAML/SCIM",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Cal.com or SavvyCal open source?",
      "answer": "Cal.com is open source, with its code available on GitHub for self-hosting or customization. SavvyCal's facts do not mention an open-source option."
    },
    {
      "question": "Which tool lets me collect payments on a free plan?",
      "answer": "Cal.com's Free plan includes Stripe and PayPal payments. SavvyCal requires the Premium plan ($17/user/month) for paid bookings."
    },
    {
      "question": "What makes SavvyCal's booking page different?",
      "answer": "SavvyCal shows the person booking their own calendar overlaid on your availability in a full week view, rather than a single day/time picker."
    },
    {
      "question": "Does either tool offer AI features?",
      "answer": "Cal.com offers Cal.ai, an AI phone agent for automated scheduling calls. SavvyCal's site does not mention any AI features."
    },
    {
      "question": "Which plan do I need for SSO on Cal.com?",
      "answer": "SSO, SAML, and SCIM require Cal.com's Organizations plan at $28/user/month, billed annually."
    },
    {
      "question": "How is each tool priced?",
      "answer": "Cal.com starts free for 1 user and scales to Teams ($12/user/month annual), Organizations ($28/user/month annual), and custom Enterprise. SavvyCal has a free tier plus two paid tiers: Basic ($10/user/month) and Premium ($17/user/month)."
    }
  ]
};

export default calComVsSavvycalContent;
