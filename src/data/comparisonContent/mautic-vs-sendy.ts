import type { ToolComparisonContent } from './types';

const mauticVsSendyContent: ToolComparisonContent = {
  "verdict": "Mautic and Sendy both let you self-host your email sending, but they target very different scopes. Mautic is a full open-source marketing automation platform covering email, landing pages, lead scoring, and omnichannel messaging (email, SMS, WhatsApp) that's free to self-host or available via managed hosting from €247.50/month. Sendy is a much narrower, single-purpose newsletter-sending script sold for a one-time $69 per-domain fee, built to route mail through Amazon SES cheaply rather than to run multi-step nurture campaigns.",
  "bestForToolA": "Marketing teams running multi-step lead-nurturing campaigns across email, SMS, WhatsApp, and landing pages who want a self-hosted automation platform with lead scoring, and who are willing to manage their own server (or pay €247.50+/month for Dropsolid-managed hosting).",
  "bestForToolB": "Cost-sensitive senders who just need to send newsletters cheaply — Sendy's one-time $69 fee and roughly $1-per-10,000-emails SES routing suit simple broadcast sending rather than automated nurture flows.",
  "whoNeedsBoth": "A growth team could run Mautic for complex multi-channel lead-nurturing campaigns while using Sendy for a separate, high-volume simple newsletter, such as a public blog digest, where Mautic's automation overhead isn't needed and Sendy's flat per-email SES cost is cheaper at scale.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "Mautic is a full marketing automation platform covering email, landing pages, and lead nurturing, with a drag-and-drop campaign builder for multi-step automation.",
      "toolB": "Sendy is described as an email newsletter script focused on sending, with no landing-page builder or lead-scoring feature documented.",
      "whyItMatters": "The two tools solve very different problems: orchestrated multi-step campaigns vs. simple broadcast sending.",
      "benefitsWho": "Marketing teams needing behavioral automation (Mautic) versus teams that just need to send newsletters (Sendy)."
    },
    {
      "title": "Channels Supported",
      "toolA": "Mautic documents omnichannel messaging across email, SMS, WhatsApp, and notification channels.",
      "toolB": "Sendy's documented features are email-only, sent via Amazon SES or similar providers.",
      "whyItMatters": "Multi-channel reach matters for teams running coordinated campaigns beyond email.",
      "benefitsWho": "Marketing teams that need SMS or WhatsApp touchpoints alongside email."
    },
    {
      "title": "Lead Scoring & Nurturing",
      "toolA": "Mautic documents lead scoring and segmentation based on behavior and data specifically for nurture campaigns.",
      "toolB": "Sendy documents list segmentation and autoresponders (drip sequences) but no lead-scoring capability.",
      "whyItMatters": "Lead scoring lets sales and marketing prioritize which contacts are most sales-ready.",
      "benefitsWho": "B2B marketing and sales teams running qualification-based nurture flows."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Mautic's core software is free and open source to self-host, with official managed hosting via Dropsolid starting at €247.50/month (Essential) up to €1,237/month (Professional).",
      "toolB": "Sendy charges a one-time $69 fee per domain with no recurring subscription option, plus optional $79 installation and $39 AI add-on.",
      "whyItMatters": "Mautic's managed tier is priced for organizations with marketing budgets, while Sendy's one-time fee suits solo operators or small businesses.",
      "benefitsWho": "Enterprise marketing teams (Mautic managed hosting) versus small businesses and solo senders wanting minimal ongoing cost (Sendy)."
    },
    {
      "title": "Scale/Community",
      "toolA": "Mautic states it is used by 200,000+ companies with 40,000+ participating in its community.",
      "toolB": "Sendy's documented facts don't include a comparable user-count figure.",
      "whyItMatters": "Community size affects the availability of plugins, documentation, and third-party support.",
      "benefitsWho": "Teams wanting a large ecosystem of integrations and community troubleshooting resources."
    }
  ],
  "featureMatrix": [
    {
      "group": "Campaign Capabilities",
      "rows": [
        {
          "feature": "Multi-step campaign automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Landing page builder",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Lead scoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Autoresponders/drip sequences",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Channels & Sending",
      "rows": [
        {
          "feature": "Email sending",
          "toolA": "available",
          "toolB": "available",
          "note": "Sendy via Amazon SES, ~$1/10,000 emails"
        },
        {
          "feature": "SMS/WhatsApp messaging",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Mautic free; Sendy $69 one-time per domain"
        },
        {
          "feature": "Managed hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Mautic via Dropsolid from €247.50/month"
        },
        {
          "feature": "White-labeled client management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Mautic more powerful than Sendy?",
      "answer": "Mautic covers more ground. It's a full marketing automation platform with campaign automation, landing pages, and lead scoring, while Sendy is focused specifically on newsletter sending via Amazon SES."
    },
    {
      "question": "Which is cheaper to run?",
      "answer": "Sendy's one-time $69-per-domain fee plus roughly $1-per-10,000-email SES costs is typically cheaper than Mautic's managed hosting, which starts at €247.50/month; Mautic's self-hosted Community Edition is free but requires you to manage the server yourself."
    },
    {
      "question": "Does Sendy support SMS or WhatsApp?",
      "answer": "No, Sendy's documented features are email-focused. Mautic documents omnichannel messaging across email, SMS, WhatsApp, and notifications."
    },
    {
      "question": "Can I self-host both?",
      "answer": "Yes. Mautic's Community Edition is free and self-hosted, and Sendy is inherently self-hosted (a PHP/MySQL script) after paying the one-time license fee."
    },
    {
      "question": "Which is better for lead nurturing?",
      "answer": "Mautic, since it documents lead scoring and behavior-based segmentation specifically built for nurture campaigns; Sendy offers simpler autoresponders and list segmentation without lead scoring."
    },
    {
      "question": "Does either include an AI assistant?",
      "answer": "Sendy offers an optional paid AI Assistant add-on ($39) for generating newsletters and subject lines. Mautic's documented features don't include an AI writing tool."
    }
  ]
};

export default mauticVsSendyContent;
