import type { GroupComparisonContent } from './types';

const dochubVsFoxitPdfEditorVsPdfExpertContent: GroupComparisonContent = {
  "verdict": "DocHub, Foxit PDF Editor and PDF Expert all edit and sign PDFs, but they are built around different platform bets that matter more than any single feature. DocHub is the only fully browser-based option and bundles e-signature into its core plans, Foxit is the broadest cross-platform suite once you pay for its higher tier, and PDF Expert is an Apple-only native app with a rare one-time purchase option. Which one wins depends on whether platform coverage, install-free convenience, or a non-subscription price matters most to you.",
  "bestFor": {
    "dochub": "Gmail and Google Drive-centric small teams that want cheap, unlimited e-signature bundled into the same browser-based subscription as PDF editing.",
    "foxit-pdf-editor": "Windows, Mac and mobile teams that want an Adobe Acrobat-level feature set, including OCR and AI-powered redaction, at a lower price, and are fine buying e-signature as a separate line item when needed.",
    "pdf-expert": "Mac, iPad and iPhone users who want a fast, native Apple-platform editor and prefer a one-time Lifetime purchase over an ongoing subscription."
  },
  "highlights": [
    {
      "title": "PDF Expert is the only one with a one-time purchase option",
      "description": "PDF Expert offers a Lifetime license for around EUR 149.99, restricted to the Mac version, as an alternative to its weekly or annual subscription. DocHub and Foxit PDF Editor are subscription-only.",
      "toolSlugs": [
        "pdf-expert"
      ]
    },
    {
      "title": "DocHub folds e-signature into its core plans; Foxit sells it separately",
      "description": "DocHub's Pro plan includes unlimited e-signature requests as part of the same subscription as editing. Foxit instead sells Foxit eSign as a distinct product with its own pricing, starting at $120 per year per user.",
      "toolSlugs": [
        "dochub",
        "foxit-pdf-editor"
      ]
    },
    {
      "title": "Foxit is the broadest cross-platform suite once you buy Editor+",
      "description": "Foxit PDF Editor+ covers Windows and macOS desktop, a web app, and iOS and Android mobile apps under one subscription, more platform coverage than DocHub's browser-only design or PDF Expert's Apple-only apps.",
      "toolSlugs": [
        "foxit-pdf-editor"
      ]
    },
    {
      "title": "All three now ship a built-in AI assistant",
      "description": "DocHub Intelligence, Foxit's AI Assistant, and Readdle's PDF Copilot each offer AI-assisted document summarization, search, or question-answering within their respective apps.",
      "toolSlugs": [
        "dochub",
        "foxit-pdf-editor",
        "pdf-expert"
      ]
    },
    {
      "title": "PDF Expert is Apple-only; DocHub needs zero install",
      "description": "PDF Expert has no native Windows or Android app, while DocHub runs entirely in the browser and works consistently across Windows, macOS, Chromebooks and mobile browsers without installing anything.",
      "toolSlugs": [
        "pdf-expert",
        "dochub"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Coverage",
      "rows": [
        {
          "feature": "Native desktop app (Windows and/or Mac)",
          "statuses": {
            "dochub": "unavailable",
            "foxit-pdf-editor": "available",
            "pdf-expert": "available"
          },
          "note": "PDF Expert's native desktop app covers Mac only, with no Windows version; Foxit covers both Windows and macOS."
        },
        {
          "feature": "Native mobile app (iOS and/or Android)",
          "statuses": {
            "dochub": "unavailable",
            "foxit-pdf-editor": "available",
            "pdf-expert": "available"
          },
          "note": "Foxit's mobile apps cover iOS and Android on the PDF Editor+ tier; PDF Expert's mobile apps cover iPad and iPhone only, with no Android app."
        }
      ]
    },
    {
      "group": "Editing and Document Tools",
      "rows": [
        {
          "feature": "OCR for scanned documents",
          "statuses": {
            "dochub": "not-documented",
            "foxit-pdf-editor": "available",
            "pdf-expert": "available"
          }
        },
        {
          "feature": "Redaction of sensitive content",
          "statuses": {
            "dochub": "not-documented",
            "foxit-pdf-editor": "available",
            "pdf-expert": "available"
          },
          "note": "Foxit's AI Smart Redact automatically identifies sensitive data such as Social Security and credit card numbers."
        }
      ]
    },
    {
      "group": "AI Assistant",
      "rows": [
        {
          "feature": "Built-in AI document assistant",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "available",
            "pdf-expert": "available"
          },
          "note": "DocHub Intelligence, Foxit's AI Assistant, and Readdle's PDF Copilot each support summarization and document Q and A."
        }
      ]
    },
    {
      "group": "Pricing and E-Signature",
      "rows": [
        {
          "feature": "E-signature included in core subscription, not a separate paid product",
          "statuses": {
            "dochub": "available",
            "foxit-pdf-editor": "limited",
            "pdf-expert": "available"
          },
          "note": "Foxit eSign is billed as a separate subscription from Foxit PDF Editor rather than bundled in."
        },
        {
          "feature": "One-time or lifetime purchase option",
          "statuses": {
            "dochub": "unavailable",
            "foxit-pdf-editor": "unavailable",
            "pdf-expert": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these can I use entirely for free?",
      "answer": "DocHub's Free plan and PDF Expert's Free tier both offer basic editing and viewing at no cost. Foxit's free offering is its separate standalone PDF Reader app, not free editing within Foxit PDF Editor itself."
    },
    {
      "question": "Does e-signature cost extra?",
      "answer": "With Foxit, yes: Foxit eSign is a separate subscription starting at $120 per year per user. DocHub and PDF Expert both include signature requests as part of their core editing plans."
    },
    {
      "question": "Is there a version for Windows?",
      "answer": "Foxit PDF Editor runs natively on Windows and macOS. DocHub works in any browser regardless of operating system. PDF Expert has no native Windows app, only Mac, iPad and iPhone apps."
    },
    {
      "question": "Can I avoid an ongoing subscription entirely?",
      "answer": "PDF Expert is the only one offering a one-time Lifetime purchase, and it is limited to the Mac version. DocHub and Foxit PDF Editor are both subscription-only products."
    },
    {
      "question": "Which one has native mobile apps?",
      "answer": "Foxit PDF Editor+ includes iOS and Android apps, and PDF Expert includes iPad and iPhone apps. DocHub has no dedicated mobile app and is used through a mobile browser instead."
    },
    {
      "question": "Which is cheapest for a solo user who mostly needs editing, not signing?",
      "answer": "Based on published pricing, DocHub's Basic plan starts around $8 per user per month, Foxit's base PDF Editor plan starts at $10.99 per month, and PDF Expert's Premium plan runs about EUR 84.99 per year. The best fit depends on whether you need Foxit's OCR and redaction, DocHub's Google Workspace integration, or PDF Expert's native Apple experience."
    }
  ]
};

export default dochubVsFoxitPdfEditorVsPdfExpertContent;
