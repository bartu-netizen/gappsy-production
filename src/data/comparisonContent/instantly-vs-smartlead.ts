import type { ToolComparisonContent } from './types';

const instantlyVsSmartleadContent: ToolComparisonContent = {
  "verdict": "Instantly and Smartlead are both cold-email sales engagement platforms with AI agents and a free trial but no permanent free plan. Instantly bundles a 450M+ B2B lead database and website-visitor tracking directly into its plans, while Smartlead differentiates through dedicated sending infrastructure (SmartInfra), native iOS/Android apps, and a broader named integration list (HubSpot, Salesforce, Pipedrive, Clay, Zapier, Make, n8n) at a lower entry price. Neither publishes a free-forever tier, and both platforms have overlapping plan structures once add-ons are factored in.",
  "bestForToolA": "Teams that want a 450M+ B2B lead database and website-visitor identification bundled directly into outreach plans, scaling from a $47/month Growth tier up to Agency/Hypergrowth without needing a native mobile app.",
  "bestForToolB": "Teams that need to monitor campaigns from iOS/Android apps, want dedicated sending infrastructure (SmartInfra) for deliverability control, or need documented API/webhook access with named integrations like Clay, Zapier, Make, and n8n.",
  "whoNeedsBoth": "An agency managing outbound for multiple clients might use Smartlead's dedicated infrastructure and mobile apps for day-to-day monitoring while pulling from Instantly's larger stated lead database for prospecting volume that exceeds Smartlead's own SmartProspect credit limits.",
  "keyDifferences": [
    {
      "title": "Mobile app access",
      "toolA": "No iOS or Android app is documented; Instantly is positioned as a web-app platform.",
      "toolB": "Ships native iOS and Android apps alongside the web platform.",
      "whyItMatters": "Reps who need to check replies or campaign status away from a desktop depend on native mobile access.",
      "benefitsWho": "Field sales reps and founders who manage outreach from a phone."
    },
    {
      "title": "Stated lead database size",
      "toolA": "Access to a 450M+ B2B lead database with email verification is included in bundle plans.",
      "toolB": "SmartProspect delivers verified leads, but no total database size is stated in the facts.",
      "whyItMatters": "A disclosed database size lets buyers estimate how much prospecting volume they're actually getting for the price.",
      "benefitsWho": "Teams that rely on the vendor's own lead database rather than an external data source."
    },
    {
      "title": "Deliverability infrastructure",
      "toolA": "Uses AirMail infrastructure built for email deliverability, bundled into plans.",
      "toolB": "Offers SmartInfra, dedicated servers specifically for controlling deliverability, positioned as a differentiator.",
      "whyItMatters": "Dedicated sending infrastructure can matter for teams sending high email volumes who need more direct control over sender reputation.",
      "benefitsWho": "High-volume senders and agencies managing deliverability across many domains."
    },
    {
      "title": "Named CRM and workflow integrations",
      "toolA": "Includes a built-in CRM feature but does not list specific named third-party integrations in the facts.",
      "toolB": "Explicitly integrates with HubSpot, Salesforce, Pipedrive, Clay, Zapier, Make, and n8n.",
      "whyItMatters": "Named integrations reduce the risk of a tool not connecting to an existing sales stack.",
      "benefitsWho": "Teams with an established CRM or automation stack (Clay, Zapier, Make, n8n) they need the outreach tool to plug into."
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Growth (outreach-only) plan starts at $47/month.",
      "toolB": "Base plan starts at $39/month.",
      "whyItMatters": "A lower entry price matters for solo founders or small teams testing cold email before scaling spend.",
      "benefitsWho": "Budget-conscious solo founders and small teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Outreach Features",
      "rows": [
        {
          "feature": "AI agent for sending and reply handling",
          "toolA": "available",
          "toolB": "available",
          "note": "Instantly: AI Sales Agent & AI Reply Agent; Smartlead: SmartAssistant & SmartAgents"
        },
        {
          "feature": "Built-in lead database",
          "toolA": "available",
          "toolB": "available",
          "note": "Instantly states 450M+ contacts; Smartlead's SmartProspect size is not stated"
        },
        {
          "feature": "Website visitor tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Integrated CRM",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Integrations",
      "rows": [
        {
          "feature": "Native iOS/Android apps",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "API & webhooks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included from Smartlead's Unlimited Smart plan up"
        },
        {
          "feature": "Named CRM/automation integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HubSpot, Salesforce, Pipedrive, Clay, Zapier, Make, n8n"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry-level monthly price",
          "toolA": "available",
          "toolB": "available",
          "note": "Instantly $47/mo vs Smartlead $39/mo"
        },
        {
          "feature": "Free trial (no credit card)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Instantly have a free plan?",
      "answer": "No, every published tier is a paid subscription, though a trial is available with no credit card required."
    },
    {
      "question": "Does Smartlead have a free plan?",
      "answer": "No, Smartlead offers a free trial with no credit card required, but no permanent free tier."
    },
    {
      "question": "What's the cheapest plan for each tool?",
      "answer": "Instantly's Growth (outreach-only) plan starts at $47/month; Smartlead's Base plan starts at $39/month."
    },
    {
      "question": "Where is Smartlead based?",
      "answer": "Sydney, Australia, operated by 521 Products Pty Ltd. Instantly's headquarters is not disclosed."
    },
    {
      "question": "Does either tool have a mobile app?",
      "answer": "Smartlead offers iOS and Android apps; a mobile app is not documented for Instantly."
    },
    {
      "question": "What CRMs does Smartlead integrate with?",
      "answer": "HubSpot, Salesforce, and Pipedrive, among others, along with Clay, Zapier, Make, and n8n."
    }
  ]
};

export default instantlyVsSmartleadContent;
