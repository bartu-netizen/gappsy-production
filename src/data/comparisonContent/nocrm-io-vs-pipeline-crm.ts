import type { ToolComparisonContent } from './types';

const nocrmIoVsPipelineCrmContent: ToolComparisonContent = {
  "verdict": "noCRM.io and Pipeline CRM both serve action-oriented sales teams, but they specialize differently. noCRM.io (headquartered in Hem, France) is built around multi-channel lead capture — email, forms, WhatsApp, phone, and business cards — with call tracking and VoIP built in, though it doesn't publish exact pricing on its site. Pipeline CRM (founded 2006) is built around Kanban pipelines with native eSignature, an AI email assistant, and mobile route planning, with transparent published pricing from $25/user/month.",
  "bestForToolA": "Telesales and field teams that capture leads from many channels at once (WhatsApp, phone, forms, business cards) and want built-in call tracking, VoIP, and quote/invoice generation without extra tools.",
  "bestForToolB": "Field and office sales teams that need native contract eSignature, an AI email assistant, and mobile route planning with map views, and want transparent published pricing before signing up.",
  "whoNeedsBoth": "A sales organization with both inbound multi-channel lead intake and field reps closing contracts on the road might pair noCRM.io's capture workflow with Pipeline CRM's eSign and route-planning tools, though most teams should evaluate which capability is the actual bottleneck first.",
  "keyDifferences": [
    {
      "title": "Multi-channel lead capture",
      "toolA": "Imports leads from email, forms, WhatsApp, phone, and business cards into one pipeline as a core feature.",
      "toolB": "Does not document multi-channel lead capture beyond standard pipeline entry.",
      "whyItMatters": "Teams sourcing leads from many inbound channels get a purpose-built capture workflow with noCRM.io.",
      "benefitsWho": "Telesales and inbound sales teams juggling multiple lead sources."
    },
    {
      "title": "Contract eSignature",
      "toolA": "Does not document native eSignature; instead generates quotes and invoices directly from a lead's record.",
      "toolB": "Includes native e-signature support for closing deals.",
      "whyItMatters": "Teams that need signed contracts within the CRM, rather than a separate eSign tool, get that built in with Pipeline CRM.",
      "benefitsWho": "Field sales teams closing contracts on the spot."
    },
    {
      "title": "AI email assistant",
      "toolA": "Does not document an AI feature.",
      "toolB": "Includes an AI email assistant that helps compose sales emails and bulk campaigns.",
      "whyItMatters": "Teams wanting AI help drafting outreach emails get that capability with Pipeline CRM.",
      "benefitsWho": "Reps who write high volumes of outbound email."
    },
    {
      "title": "Call tracking and VoIP",
      "toolA": "Includes built-in call tracking, recording, and VoIP integration for telesales teams.",
      "toolB": "Does not document call tracking or VoIP; offers data enrichment and email validation as paid add-ons instead.",
      "whyItMatters": "Telesales-heavy teams get native calling infrastructure with noCRM.io rather than needing a separate phone system.",
      "benefitsWho": "Inside sales and telesales teams making high call volumes."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Does not publish exact plan pricing on the site — pricing requires the live calculator.",
      "toolB": "Publishes exact prices for all tiers ($25-$49/user/month, annual, plus custom Enterprise).",
      "whyItMatters": "Buyers wanting to compare costs upfront without engaging sales have a clearer answer from Pipeline CRM.",
      "benefitsWho": "Budget-conscious buyers comparison-shopping."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Multi-channel lead capture (WhatsApp/forms/phone/cards)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native eSignature for contracts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Quotes and invoices generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Commission tracking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI email assistant",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Call tracking and VoIP",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Published tier pricing on site",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "noCRM.io requires the live pricing calculator."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "noCRM.io: 15-day, extendable to 30. Pipeline CRM: 14-day, full Grow plan."
        },
        {
          "feature": "Free (non-trial) plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Field Sales Tools",
      "rows": [
        {
          "feature": "Mobile app offline functionality",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Route planning / map views",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Data enrichment / email validation",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Pipeline CRM offers these as paid add-ons."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does noCRM.io publish its pricing?",
      "answer": "No, exact plan pricing is not published on the site; it requires visiting the live pricing calculator. Three tiers are offered: Starter, Expert, and Dream."
    },
    {
      "question": "How much does Pipeline CRM cost?",
      "answer": "Plans range from $25/user/month (Start, annual) to $49/user/month (Grow, annual), with custom Enterprise pricing."
    },
    {
      "question": "Can I capture leads from WhatsApp with noCRM.io?",
      "answer": "Yes, noCRM.io syncs WhatsApp conversations into the lead pipeline."
    },
    {
      "question": "Does Pipeline CRM have eSignature?",
      "answer": "Yes, native e-signature support is built into contract management for closing deals."
    },
    {
      "question": "Does Pipeline CRM have AI features?",
      "answer": "Yes, an AI email assistant helps compose sales emails and bulk email campaigns."
    },
    {
      "question": "Does noCRM.io have mobile apps?",
      "answer": "Yes, iOS and Android apps with offline functionality for field and telesales reps."
    }
  ]
};

export default nocrmIoVsPipelineCrmContent;
