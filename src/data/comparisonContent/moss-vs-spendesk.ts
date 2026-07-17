import type { ToolComparisonContent } from './types';

const mossVsSpendeskContent: ToolComparisonContent = {
  "verdict": "Moss offers a genuine free tier for small teams (up to 3 users, 20 invoices/month) before moving to custom quote-based pricing, while Spendesk skips the free tier entirely and is quote-based from the first plan (Foundations) but bundles unlimited cards and users plus a free CFO Connect Pro membership. Both are AI-assisted, European spend management platforms — the difference is where in the buying journey pricing transparency disappears.",
  "bestForToolA": "Small teams (up to 3 users) in Germany or the wider DACH region who want to try spend management for free — with BaFin-regulated banking and DATEV integration — before committing to a paid plan.",
  "bestForToolB": "Larger finance teams that want unlimited cards and users from day one, need SAP integration, and are willing to go through custom quoting in exchange for a bundled CFO Connect Pro membership (normally €625).",
  "whoNeedsBoth": "A multi-entity company with a German-regulated subsidiary (fitting Moss's BaFin oversight and DATEV integration) alongside a larger parent entity running SAP may end up running Moss and Spendesk side by side for different legal entities.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "Free plan for up to 3 users with unlimited cards and up to 20 invoices/month.",
      "toolB": "No free plan or free trial advertised — pricing_model is Custom/Enterprise from the start.",
      "whyItMatters": "Teams wanting to test spend management without a sales conversation can only do so with Moss.",
      "benefitsWho": "Small businesses and startups evaluating spend management tools on a budget."
    },
    {
      "title": "Bundled perks",
      "toolA": "No bundled membership perk is mentioned in the facts.",
      "toolB": "Includes a free CFO Connect Pro membership (normally €625) for customers.",
      "whyItMatters": "This is a concrete monetary perk that offsets Spendesk's lack of a free tier.",
      "benefitsWho": "Finance leaders who value community/network access alongside the software."
    },
    {
      "title": "AI automation approach",
      "toolA": "AI Pre-Accounting Agent automates expense coding and invoice processing, offered as an add-on on paid plans.",
      "toolB": "Spendesk AI Connect reads documents, suggests bookkeeping entries, and flags duplicates and anomalies, included as part of the Foundations platform.",
      "whyItMatters": "Whether AI accounting automation is bundled into the base plan or sold as an add-on affects total cost.",
      "benefitsWho": "Finance teams comparing all-in cost of AI-assisted bookkeeping."
    },
    {
      "title": "Regulatory framing",
      "toolA": "Operated by Nufin GmbH and regulated by BaFin (Germany's financial supervisory authority) as an e-money institution.",
      "toolB": "Described as \"built, regulated, and profitable in Europe\" without naming a specific regulator or headquarters city.",
      "whyItMatters": "Companies with compliance requirements tied to a specific regulator may need the named oversight Moss provides.",
      "benefitsWho": "Compliance and finance teams needing to document a vendor's regulatory status."
    },
    {
      "title": "ERP/accounting integration depth",
      "toolA": "40+ integrations including Xero, NetSuite, Dynamics, DATEV, Deel, Personio, and Workday.",
      "toolB": "Integrates with Sage, Xero, NetSuite, SAP, and Datev.",
      "whyItMatters": "SAP support is unique to Spendesk in these facts, which matters for larger enterprises already on SAP.",
      "benefitsWho": "Enterprises with existing SAP or HR-system investments (Personio, Workday) choosing based on their stack."
    }
  ],
  "featureMatrix": [
    {
      "group": "Plans & Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Moss free plan capped at 3 users, 20 invoices/month"
        },
        {
          "feature": "Custom/quote-based paid pricing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Core Spend Management",
      "rows": [
        {
          "feature": "Corporate cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Invoice / receipt OCR automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-entity workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO / SAML",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Integrations",
      "rows": [
        {
          "feature": "AI accounting automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Moss's AI is a paid add-on; Spendesk's AI Connect is part of Foundations"
        },
        {
          "feature": "ERP integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Moss: 40+ incl. DATEV; Spendesk: Sage, Xero, NetSuite, SAP, Datev"
        },
        {
          "feature": "Multi-currency payments",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Moss supports 70+ currencies"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Moss have a free plan?",
      "answer": "Yes, Moss offers a free plan for up to 3 users with unlimited cards and up to 20 invoices per month."
    },
    {
      "question": "Does Spendesk have a free plan?",
      "answer": "No, Spendesk doesn't publish fixed prices or a free plan — it uses a fixed platform fee plus variable fees based on transaction volume, available only via a custom quote."
    },
    {
      "question": "What does Moss's AI do?",
      "answer": "Moss uses an AI-powered pre-accounting agent to automate invoice coding and expense processing."
    },
    {
      "question": "Does Spendesk use AI?",
      "answer": "Yes, Spendesk uses AI to read documents, suggest bookkeeping entries, detect duplicates, and flag anomalies, plus a Spendesk AI Connect integration."
    },
    {
      "question": "Who regulates Moss?",
      "answer": "Moss is operated by Nufin GmbH and regulated by BaFin, Germany's financial supervisory authority, as an e-money institution."
    },
    {
      "question": "What's included in Spendesk's Foundations plan?",
      "answer": "Foundations includes unlimited physical and virtual cards, unlimited users, receipt OCR automation, expense tracking, budget monitoring, and API access."
    }
  ]
};

export default mossVsSpendeskContent;
