import type { ToolComparisonContent } from './types';

const lindyVsStackAiContent: ToolComparisonContent = {
  "verdict": "Lindy and Stack AI are both built around AI agents but serve different jobs: Lindy is a ready-to-use personal work assistant for email, calendar, and CRM follow-ups, while Stack AI is a no-code platform for building custom, governed agent workflows that can deploy on-premise. The choice depends on whether you need a finished assistant or a builder for bespoke, compliance-heavy workflows.",
  "bestForToolA": "Individuals or small teams who want an assistant that manages email triage, meeting prep/notes, calendar coordination, and CRM (HubSpot/Salesforce) follow-ups out of the box, including delegation via text message.",
  "bestForToolB": "Organizations building custom agent workflows for specific industries (finance, legal, healthcare, customer service, IT) that need governance controls (audit logs, human-in-the-loop review) and flexible deployment including VPC or on-premise.",
  "whoNeedsBoth": "An operations team could use Lindy as a personal assistant for scheduling and inbox management while a technical team separately uses Stack AI to build and govern custom workflows for regulated business processes.",
  "keyDifferences": [
    {
      "title": "Ready-made assistant vs. workflow builder",
      "toolA": "Delivers a fixed set of assistant capabilities (email, calendar, meeting notes, follow-ups, CRM updates) usable immediately.",
      "toolB": "Provides a drag-and-drop, no-code builder plus industry-specific templates for assembling custom agent workflows.",
      "whyItMatters": "Teams that want a working assistant without configuration need a finished product; teams with specific or evolving workflows need a builder.",
      "benefitsWho": "Non-technical users benefit from Lindy's ready-made functions; teams with in-house workflow designers benefit from Stack AI's builder."
    },
    {
      "title": "Free access before paying",
      "toolA": "7-day free trial only — no free-forever plan.",
      "toolB": "Free plan with 500 runs/month, 2 projects, and 1 seat, usable on an ongoing basis.",
      "whyItMatters": "A time-limited trial forces a purchase decision quickly, while an ongoing free tier lets light users stay on the free plan indefinitely.",
      "benefitsWho": "Budget-constrained users testing longer-term benefit from Stack AI's persistent free plan."
    },
    {
      "title": "Deployment flexibility",
      "toolA": "Web app plus mobile task delegation via iMessage/SMS; no VPC or on-premise deployment mentioned.",
      "toolB": "Available as multi-tenant cloud, VPC, or on-premise installation.",
      "whyItMatters": "Regulated or security-sensitive organizations often require on-premise or VPC deployment that a purely cloud/web tool can't offer.",
      "benefitsWho": "Enterprises with data-residency or security requirements benefit from Stack AI's deployment options."
    },
    {
      "title": "Pricing tier structure",
      "toolA": "Multiple tiers scale by connected inboxes and usage: Plus $49.99/month, Pro $99.99/month, Max $199.99/month, Enterprise custom.",
      "toolB": "Only two published tiers: a 500-run Free plan and a custom-priced Enterprise plan, with no published mid-tier.",
      "whyItMatters": "A gap between free and enterprise pricing can force growing teams into a custom sales conversation earlier than a tiered vendor would.",
      "benefitsWho": "Growing teams that want predictable mid-tier pricing may prefer Lindy's tiered structure; teams comfortable negotiating custom pricing can use Stack AI."
    },
    {
      "title": "CRM and vertical templates",
      "toolA": "Direct CRM integration with HubSpot and Salesforce for updating records.",
      "toolB": "Pre-built workflow templates for finance, legal, healthcare, customer service, and IT verticals.",
      "whyItMatters": "Lindy's CRM focus suits sales/customer-facing follow-up work, while Stack AI's vertical templates suit building compliance-specific processes.",
      "benefitsWho": "Sales and account-management teams benefit from Lindy's CRM sync; regulated-industry ops teams benefit from Stack AI's vertical templates."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Email management/triage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Calendar/meeting scheduling & notes",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No-code agent/workflow builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Industry-specific workflow templates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mobile task delegation (SMS/iMessage)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "CRM integration (HubSpot/Salesforce)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Total integrations advertised",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stack AI states 100+ integrations; Lindy lists specific apps but no total count"
        },
        {
          "feature": "Named productivity app integrations (Gmail, Slack, Notion, etc.)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Governance",
      "rows": [
        {
          "feature": "On-premise/VPC deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SSO/SCIM",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Both gate SSO to their custom-priced Enterprise plan"
        },
        {
          "feature": "Audit logs / human-in-the-loop governance",
          "toolA": "limited",
          "toolB": "available",
          "note": "Lindy gates audit logs to Enterprise; Stack AI builds governance controls into workflows generally"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free ongoing plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Stack AI has an ongoing free plan instead of a time-limited trial"
        },
        {
          "feature": "Published mid-tier pricing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Lindy offer a free trial?",
      "answer": "Yes, a 7-day free trial is available before paid billing starts; there is no free-forever plan."
    },
    {
      "question": "Is there a free plan for Stack AI?",
      "answer": "Yes, a Free plan includes 500 runs/month, 2 projects, and 1 seat, usable on an ongoing basis rather than a time-limited trial."
    },
    {
      "question": "Can Stack AI be deployed on-premise?",
      "answer": "Yes, in addition to multi-tenant cloud, VPC and on-premise deployment options are available."
    },
    {
      "question": "What does Lindy integrate with?",
      "answer": "Gmail, Outlook, Google Calendar, Slack, Notion, HubSpot, Salesforce, Microsoft Teams, and Zoom."
    },
    {
      "question": "How much does Lindy cost?",
      "answer": "Plans start at $49.99/month (Plus), with Pro at $99.99/month and Max at $199.99/month; Enterprise is custom-priced."
    },
    {
      "question": "What compliance certifications does Stack AI have?",
      "answer": "SOC 2 Type II, HIPAA, GDPR, and ISO 27001."
    }
  ]
};

export default lindyVsStackAiContent;
