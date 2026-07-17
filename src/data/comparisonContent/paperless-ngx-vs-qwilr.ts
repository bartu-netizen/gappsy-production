import type { ToolComparisonContent } from './types';

const paperlessNgxVsQwilrContent: ToolComparisonContent = {
  "verdict": "Paperless-ngx and Qwilr both touch business documents but at different stages of their lifecycle: Paperless-ngx is a free, self-hosted archive that OCRs and indexes documents you already have, while Qwilr is a paid tool for creating new interactive proposals, quotes, and contracts as web pages with built-in e-signature and payment collection. One is an archival system for the past; the other is a sales-document creation tool for the present.",
  "bestForToolA": "Paperless-ngx fits individuals or teams who want a free, self-hosted system to scan, OCR, tag, and full-text-search existing paperwork like receipts, invoices, and contracts, deployed via Docker Compose.",
  "bestForToolB": "Qwilr fits sales and agency teams who want to build proposals and quotes as interactive, on-brand web pages with e-signature, QwilrPay payment collection, and engagement analytics, starting at $35/user/month on the Starter plan.",
  "whoNeedsBoth": "An agency could use Qwilr to build, send, and get signed proposals paid, then archive the resulting signed contracts and invoices in a self-hosted Paperless-ngx instance for OCR-indexed long-term record keeping — genuinely complementary stages of the same document lifecycle.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Paperless-ngx ingests, OCRs, tags, and full-text-searches documents that already exist, functioning as a searchable archive.",
      "toolB": "Qwilr creates new interactive proposal, quote, and contract pages with a block-based editor, functioning as a document creation and sales-closing tool.",
      "whyItMatters": "The two products don't compete for the same job; one organizes the past, the other produces new sales documents.",
      "benefitsWho": "Buyers scoping exactly which workflow stage each tool addresses."
    },
    {
      "title": "Pricing",
      "toolA": "Paperless-ngx is completely free and open source under GPL-3.0, with no listed pricing plans.",
      "toolB": "Qwilr has no free plan and is priced per seat, starting at $35/user/month (Starter, billed annually), rising to $55/user/month (Growth, 5-seat minimum) and $75/user/month (Scale, 10-seat minimum), with a 14-day free trial requiring no credit card.",
      "whyItMatters": "Paperless-ngx has zero licensing cost but requires self-hosting effort, while Qwilr is a recurring per-seat SaaS cost that scales with team size.",
      "benefitsWho": "Budget-conscious individuals and small teams (Paperless-ngx) versus sales and agency teams willing to pay per seat for a polished proposal tool (Qwilr)."
    },
    {
      "title": "E-Signature and Payments",
      "toolA": "Paperless-ngx does not document any e-signature or payment collection capability; it is purely an archive.",
      "toolB": "Qwilr includes built-in e-signature so buyers can accept documents directly on the page, plus QwilrPay for collecting payment in the same flow.",
      "whyItMatters": "Only Qwilr can close a deal end-to-end (view, sign, pay); Paperless-ngx would need the signed document handed to it afterward.",
      "benefitsWho": "Sales teams that want proposal acceptance and payment collection in one buyer-facing flow."
    },
    {
      "title": "API Access",
      "toolA": "Paperless-ngx's documented facts do not describe a public API for integrations.",
      "toolB": "Qwilr provides API access on every plan, including its entry-level Starter tier, for teams building custom workflows.",
      "whyItMatters": "Developers needing to programmatically create or track sales documents have a documented path only with Qwilr.",
      "benefitsWho": "Revenue-operations teams automating proposal generation from CRM data."
    },
    {
      "title": "Deployment & Data Location",
      "toolA": "Paperless-ngx is self-hosted only via Docker Compose, with documents stored unencrypted, so the project warns against running it on an untrusted host.",
      "toolB": "Qwilr is a cloud SaaS product with no self-hosting option documented.",
      "whyItMatters": "Organizations with strict data-residency needs must weigh Paperless-ngx's self-host control against its unencrypted-storage caveat.",
      "benefitsWho": "IT-conscious teams deciding where sensitive archived documents should physically live."
    }
  ],
  "featureMatrix": [
    {
      "group": "Document Creation vs. Archival",
      "rows": [
        {
          "feature": "OCR ingestion of existing documents",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Full-text search across archived documents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Interactive proposal/quote page builder",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Reusable proposal templates",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Signing & Payment",
      "rows": [
        {
          "feature": "Built-in e-signature",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Payment collection at acceptance",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Qwilr: QwilrPay."
        },
        {
          "feature": "Engagement/view analytics",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Qwilr starts at $35/user/month with no free plan."
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Qwilr: API on every plan."
        },
        {
          "feature": "CRM integrations (HubSpot, Salesforce, etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Paperless-ngx and Qwilr do the same thing?",
      "answer": "No. Paperless-ngx archives and OCR-indexes documents you already have, while Qwilr creates new interactive proposals, quotes, and contracts that buyers can view, sign, and pay for online."
    },
    {
      "question": "Is Paperless-ngx free?",
      "answer": "Yes, Paperless-ngx is fully free and open source under the GPL-3.0 license, with no listed pricing plans."
    },
    {
      "question": "How much does Qwilr cost?",
      "answer": "Qwilr's Starter plan starts at $35 per user per month billed annually, with Growth ($55/user/month, 5-seat minimum) and Scale ($75/user/month, 10-seat minimum) tiers priced higher."
    },
    {
      "question": "Does Qwilr have a free plan?",
      "answer": "No, Qwilr does not offer a permanent free plan. It offers a 14-day free trial on the Starter tier that does not require a credit card."
    },
    {
      "question": "Can Paperless-ngx handle e-signatures like Qwilr?",
      "answer": "No, Paperless-ngx does not document any e-signature capability. It is an OCR and archival tool, not a document-signing or proposal-creation tool."
    },
    {
      "question": "Is Paperless-ngx safe for storing signed contracts from Qwilr?",
      "answer": "The developers advise against running Paperless-ngx on an untrusted host since documents are stored unencrypted; local, backed-up self-hosted deployments are recommended for sensitive records like signed contracts."
    }
  ]
};

export default paperlessNgxVsQwilrContent;
