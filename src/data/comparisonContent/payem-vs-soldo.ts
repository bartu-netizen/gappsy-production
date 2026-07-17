import type { ToolComparisonContent } from './types';

const payemVsSoldoContent: ToolComparisonContent = {
  "verdict": "PayEm and Soldo both fall under spend management, but PayEm centers on procurement, purchase orders, AI-driven invoice-to-PO matching, and ERP sync, while Soldo is card-and-transfer-focused spend control with published entry-level pricing and FCA regulation. PayEm suits finance teams running a formal procure-to-pay process; Soldo suits teams that primarily need controlled company cards and expense capture.",
  "bestForToolA": "Finance and procurement teams that need purchase-order creation, AI-powered OCR invoice-to-PO matching, and ERP synchronization (such as NetSuite) as part of a request-to-reconciliation workflow.",
  "bestForToolB": "Businesses wanting straightforward company cards, bank transfers, and OCR receipt capture with transparent entry pricing, £21/month + VAT for the Standard plan (3 users, 3 cards), and FCA-regulated Electronic Money Institution status.",
  "whoNeedsBoth": "Unlikely, since both cover overlapping spend-control ground including cards, approvals, and spend limits, so a company would typically pick one rather than run parallel spend platforms; the decision usually comes down to whether procurement/PO workflows or card-first spend management with published pricing matters more.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "PayEm has no public pricing and requires a sales conversation.",
      "toolB": "Soldo publishes tiered pricing: £21/month + VAT Standard, £33/month + VAT Plus, and custom Unlimited.",
      "whyItMatters": "Budgeting and procurement timelines differ significantly when pricing isn't published.",
      "benefitsWho": "Smaller businesses wanting to self-serve budget planning are better served by Soldo's published pricing."
    },
    {
      "title": "Procurement Depth",
      "toolA": "PayEm includes dedicated purchase-order creation with customizable request and approval workflows synced to the ERP, plus AI-powered OCR matching invoices to POs.",
      "toolB": "Soldo does not document a purchase-order or invoice-matching feature; it focuses on card spend and receipt capture.",
      "whyItMatters": "Companies running formal purchase-order-based procurement need dedicated PO workflow tooling.",
      "benefitsWho": "Finance teams with a formal PO process need PayEm; card-spend-only teams don't need this depth."
    },
    {
      "title": "Regulatory Status",
      "toolA": "No regulatory status is documented for PayEm on the pages reviewed.",
      "toolB": "Soldo is regulated as an Electronic Money Institution by the UK FCA, with additional entities in Italy and Ireland.",
      "whyItMatters": "Regulatory transparency matters for finance teams evaluating custodial risk over pooled funds.",
      "benefitsWho": "European finance and compliance teams wanting documented regulatory oversight benefit from Soldo's disclosed status."
    },
    {
      "title": "Vendor Card Specialization",
      "toolA": "PayEm issues dedicated vendor cards specifically for SaaS subscriptions.",
      "toolB": "Soldo issues physical and virtual cards generally, but doesn't document a SaaS-specific vendor card feature.",
      "whyItMatters": "Managing many recurring SaaS subscriptions benefits from per-vendor card control.",
      "benefitsWho": "Companies with a large SaaS subscription footprint benefit from PayEm's vendor cards."
    },
    {
      "title": "Approval Channels",
      "toolA": "PayEm routes requests and approvals through Slack and email in addition to its own platform.",
      "toolB": "Soldo has approval workflows, but Slack/email routing isn't documented.",
      "whyItMatters": "Approvals happening inside tools teams already use daily reduce friction and delay.",
      "benefitsWho": "Distributed teams that live in Slack benefit from PayEm's routed approvals."
    }
  ],
  "featureMatrix": [
    {
      "group": "Procurement & AP",
      "rows": [
        {
          "feature": "Purchase order creation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI/OCR invoice-to-PO matching",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Soldo instead offers OCR receipt capture, a different function"
        },
        {
          "feature": "ERP synchronization (e.g. NetSuite)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Soldo lists generic accounting integrations"
        },
        {
          "feature": "Approval workflows via Slack/email",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Cards & Payments",
      "rows": [
        {
          "feature": "Physical & virtual company cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dedicated vendor cards for SaaS",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Outbound bank transfers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 20-30/month depending on plan"
        },
        {
          "feature": "Multi-currency spending",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "From the Plus plan"
        },
        {
          "feature": "Multi-entity / wallet hierarchy",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust & Access",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "£21/month + VAT"
        },
        {
          "feature": "Regulatory status disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "FCA-regulated EMI"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "30-day trial"
        },
        {
          "feature": "Real-time spend reporting",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has published pricing?",
      "answer": "Soldo publishes tiered pricing starting at £21/month + VAT; PayEm requires contacting sales for a quote."
    },
    {
      "question": "Does PayEm support purchase orders?",
      "answer": "Yes, PayEm creates purchase orders synced with the ERP and uses AI-powered OCR to match incoming invoices to them."
    },
    {
      "question": "Is Soldo regulated?",
      "answer": "Yes, Soldo is regulated as an Electronic Money Institution by the UK's Financial Conduct Authority, with additional entities in Italy and Ireland."
    },
    {
      "question": "Can I try either tool for free?",
      "answer": "Soldo offers a 30-day free trial. PayEm doesn't document a free trial on the pages reviewed."
    },
    {
      "question": "Does Soldo support multiple currencies?",
      "answer": "Yes, multi-currency spending is included from the Plus plan (£33/month + VAT) upward."
    },
    {
      "question": "Which is more procurement-focused versus card-focused?",
      "answer": "PayEm centers on purchase-order creation and AP automation; Soldo centers on company cards, bank transfers, and receipt capture."
    }
  ]
};

export default payemVsSoldoContent;
