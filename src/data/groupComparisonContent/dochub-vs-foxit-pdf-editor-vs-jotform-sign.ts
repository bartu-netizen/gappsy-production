import type { GroupComparisonContent } from './types';

const dochubVsFoxitPdfEditorVsJotformSignContent: GroupComparisonContent = {
  "verdict": "All three tools let you edit and sign PDFs, but they come at the problem from different angles. DocHub is the lightest, browser-only option built around deep Gmail and Google Drive integration and inexpensive per-seat pricing. Foxit PDF Editor is the most complete standalone PDF suite, adding OCR, desktop and mobile apps, and AI-powered redaction, but its e-signature capability is a separate product, Foxit eSign, with its own pricing and a five-seat minimum on the higher tier. Jotform Sign is the most budget-friendly for signing specifically, since it is free and bundled into an existing Jotform account rather than sold as its own subscription, at the cost of less standalone PDF-editing depth than DocHub or Foxit.",
  "bestFor": {
    "dochub": "Individuals and small teams that live inside Gmail and Google Drive and want a cheap, no-install browser tool for occasional PDF edits and e-signature requests.",
    "foxit-pdf-editor": "Users and teams that need desktop-grade PDF editing with OCR, conversion, and AI-assisted redaction, and who want the option to add a dedicated, compliance-focused e-signature product without paying Adobe Acrobat's price.",
    "jotform-sign": "Teams already using Jotform's forms and tables who want free, template-rich e-signature bundled into their existing account rather than a separate e-signature subscription."
  },
  "highlights": [
    {
      "title": "DocHub trades editing depth for Google Workspace integration and price",
      "description": "DocHub edits and signs PDF attachments directly from Gmail, Google Drive, Google Classroom, and Dropbox without downloading files, and its per-user pricing on the Basic and Pro tiers is noticeably cheaper than DocuSign or Adobe Acrobat Sign, though it lacks OCR and a native desktop app.",
      "toolSlugs": [
        "dochub"
      ]
    },
    {
      "title": "Foxit is the only one of the three with OCR and a full desktop suite",
      "description": "Foxit PDF Editor supports optical character recognition for scanned documents, native Windows and macOS desktop apps, and an AI Smart Redact feature for automatically stripping sensitive data, capabilities that DocHub and Jotform Sign do not document.",
      "toolSlugs": [
        "foxit-pdf-editor"
      ]
    },
    {
      "title": "Jotform Sign has no standalone pricing page",
      "description": "Unlike DocHub and Foxit, which sell e-signature as a directly priced product or tier, Jotform Sign is free to use and its document limits scale with whichever Jotform account plan, from free Starter through Enterprise, a user is already on.",
      "toolSlugs": [
        "jotform-sign"
      ]
    },
    {
      "title": "HIPAA compliance is gated behind the top tier everywhere",
      "description": "All three tools require upgrading to their highest-priced plan to get HIPAA-compliant signing with a signed Business Associate Agreement: DocHub's Site License, Foxit eSign Business, and Jotform's Gold or Enterprise plan.",
      "toolSlugs": [
        "dochub",
        "foxit-pdf-editor",
        "jotform-sign"
      ]
    },
    {
      "title": "Foxit splits editing and signing into two separate products",
      "description": "Where DocHub and Jotform Sign build e-signature directly into their core product, Foxit sells PDF editing (PDF Editor / PDF Editor+) and e-signature (Foxit eSign Essentials / Business) as distinct subscriptions with their own separate pricing.",
      "toolSlugs": [
        "foxit-pdf-editor",
        "dochub",
        "jotform-sign"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core PDF Editing",
      "rows": [
        {
          "feature": "In-browser, no-install PDF editing",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "not-documented"
          },
          "note": "Foxit's web app is included with its PDF Editor plans; DocHub is browser-only by design."
        },
        {
          "feature": "OCR for scanned documents",
          "statuses": {
            "dochub": "not-documented",
            "foxit-pdf-editor": "available",
            "jotform-sign": "not-documented"
          }
        },
        {
          "feature": "Native desktop application",
          "statuses": {
            "dochub": "unavailable",
            "foxit-pdf-editor": "available",
            "jotform-sign": "not-documented"
          },
          "note": "DocHub is explicitly browser-based only, with no offline-first desktop app."
        }
      ]
    },
    {
      "group": "E-Signature Workflow",
      "rows": [
        {
          "feature": "Multi-signer / sequential signing order",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "available"
          }
        },
        {
          "feature": "Reusable signable templates",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "available"
          },
          "note": "Jotform Sign ships with 1,000+ ready-made templates."
        },
        {
          "feature": "HIPAA compliance with signed BAA",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "available"
          },
          "note": "Available on DocHub's Site License, Foxit eSign Business, and Jotform's Gold/Enterprise tier only."
        }
      ]
    },
    {
      "group": "AI and Pricing Structure",
      "rows": [
        {
          "feature": "Built-in AI assistant for document analysis",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "not-documented"
          },
          "note": "DocHub Intelligence is available on Pro and above; Foxit's AI Assistant ships 20 free credits per month on both tiers."
        },
        {
          "feature": "Standalone published pricing page for the product",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "jotform-sign": "unavailable"
          },
          "note": "Jotform Sign has no independent pricing page; its limits are tied to the parent Jotform account plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is genuinely free to use?",
      "answer": "Jotform Sign is free within a Jotform Starter account, and DocHub has a Free plan with basic editing and up to 5 e-signature requests per month. Foxit does not offer a free tier for PDF Editor, though it separately offers a free standalone PDF reader."
    },
    {
      "question": "Which tool has OCR for scanned documents?",
      "answer": "Only Foxit PDF Editor documents OCR support, letting it convert scanned paper documents into editable, searchable text."
    },
    {
      "question": "Which is cheapest for a small team that mainly needs e-signatures?",
      "answer": "Jotform Sign is free if bundled into an existing Jotform plan. DocHub Basic runs about $8 per user per month. Foxit eSign Essentials costs $120 per year per user with no seat minimum, while Foxit eSign Business requires a five-seat minimum at $300 per user per year."
    },
    {
      "question": "Do any of these include AI features?",
      "answer": "Yes. DocHub offers DocHub Intelligence for smart edits and document search on Pro and above, and Foxit includes an AI Assistant plus an AI Smart Redact feature for automatically removing sensitive information; Jotform Sign does not document AI capabilities."
    },
    {
      "question": "Which integrates most closely with Google Workspace?",
      "answer": "DocHub, which edits and signs PDF attachments directly from Gmail, Google Drive, and Google Classroom without downloading files first."
    },
    {
      "question": "Can any of these handle HIPAA-regulated documents?",
      "answer": "All three can, but only on their most expensive tier: DocHub's Site License, Foxit eSign Business, and Jotform's Gold or Enterprise plan all add HIPAA compliance with a signed Business Associate Agreement."
    }
  ]
};

export default dochubVsFoxitPdfEditorVsJotformSignContent;
