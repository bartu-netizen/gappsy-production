import type { GroupComparisonContent } from './types';

const nitroPdfProVsPdfExpertVsSejdaPdfContent: GroupComparisonContent = {
  "verdict": "Nitro PDF Pro, PDF Expert, and Sejda PDF all cover the core PDF editing job, but they optimize for different platforms and buying habits. Nitro PDF Pro is the pick for Windows users who want a one-time license instead of a subscription, PDF Expert leans into native Mac and iOS design plus an AI assistant, and Sejda PDF is the only option that runs entirely in a browser with no install. None is a universal winner; the right choice depends more on operating system and licensing preference than on raw feature depth.",
  "bestFor": {
    "nitro-pdf-pro": "Windows users who want a one-time, roughly $250 software purchase instead of a recurring subscription, with a familiar Office-style ribbon interface.",
    "pdf-expert": "Mac, iPad, and iPhone users who want a native Apple-first PDF editor with a built-in PDF Copilot AI assistant and Apple Pencil support.",
    "sejda-pdf": "Cross-platform teams and occasional users who want a lightweight, no-install browser editor with affordable short-term or annual passes."
  },
  "highlights": [
    {
      "title": "Windows-first, one-time purchase",
      "description": "Nitro PDF Pro is sold as a roughly $250 one-time (or multi-year) license for Windows, letting buyers avoid Nitro's own subscription plans entirely.",
      "toolSlugs": [
        "nitro-pdf-pro"
      ]
    },
    {
      "title": "Native Apple experience with AI built in",
      "description": "PDF Expert is designed specifically for Mac, iPad, and iPhone and includes PDF Copilot, an AI assistant that can summarize documents and answer questions about their content.",
      "toolSlugs": [
        "pdf-expert"
      ]
    },
    {
      "title": "Only truly browser-based, no-install option",
      "description": "Sejda Web runs entirely in a browser on any operating system, while Sejda Desktop adds offline use on Windows, macOS, and Linux, something neither competitor offers as a browser-first product.",
      "toolSlugs": [
        "sejda-pdf"
      ]
    },
    {
      "title": "Free entry points, but with real limits",
      "description": "PDF Expert offers a free viewing and basic-annotation tier, and Sejda offers a free tier capped at around three tasks per day, while Nitro PDF Pro has no free tier at all.",
      "toolSlugs": [
        "pdf-expert",
        "sejda-pdf"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "Native Windows desktop app",
          "statuses": {
            "nitro-pdf-pro": "available",
            "pdf-expert": "unavailable",
            "sejda-pdf": "available"
          },
          "note": "Sejda Desktop supports Windows, macOS, and Linux."
        },
        {
          "feature": "Native Mac app",
          "statuses": {
            "nitro-pdf-pro": "unavailable",
            "pdf-expert": "available",
            "sejda-pdf": "available"
          },
          "note": "Nitro PDF Pro is Windows-only; Nitro's separate subscription plans support Mac."
        },
        {
          "feature": "Browser-based, no-install access",
          "statuses": {
            "nitro-pdf-pro": "unavailable",
            "pdf-expert": "unavailable",
            "sejda-pdf": "available"
          }
        }
      ]
    },
    {
      "group": "Core PDF Tools",
      "rows": [
        {
          "feature": "OCR for scanned documents",
          "statuses": {
            "nitro-pdf-pro": "available",
            "pdf-expert": "available",
            "sejda-pdf": "available"
          },
          "note": "Sejda caps OCR at 100 pages per task even on paid plans."
        },
        {
          "feature": "E-signature and form filling",
          "statuses": {
            "nitro-pdf-pro": "available",
            "pdf-expert": "available",
            "sejda-pdf": "available"
          }
        },
        {
          "feature": "Batch processing",
          "statuses": {
            "nitro-pdf-pro": "available",
            "pdf-expert": "not-documented",
            "sejda-pdf": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Licensing",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "nitro-pdf-pro": "unavailable",
            "pdf-expert": "available",
            "sejda-pdf": "not-documented"
          },
          "note": "PDF Copilot is PDF Expert's AI feature; Nitro's AI tools are limited to its subscription tiers, not Nitro PDF Pro."
        },
        {
          "feature": "One-time purchase licensing option",
          "statuses": {
            "nitro-pdf-pro": "available",
            "pdf-expert": "limited",
            "sejda-pdf": "limited"
          },
          "note": "PDF Expert's Lifetime license is Mac-only; Sejda's Week Pass is a non-recurring 7-day pass, not a perpetual license."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Nitro PDF Pro work on Mac?",
      "answer": "No. Nitro PDF Pro, the one-time-purchase desktop product, is Windows-exclusive. Mac support is only available through Nitro's separate subscription plans (Nitro PDF Standard and Plus)."
    },
    {
      "question": "Which of these three has a built-in AI assistant?",
      "answer": "PDF Expert, through its PDF Copilot feature, which can summarize documents, answer questions about content, and help with translation and conversion."
    },
    {
      "question": "Can I use any of these tools without installing software?",
      "answer": "Yes, Sejda Web is fully browser-based and works on any operating system without installation. Nitro PDF Pro and PDF Expert both require installing a native app."
    },
    {
      "question": "Which is the cheapest option for occasional use?",
      "answer": "Sejda PDF, which offers a free tier with a small daily task cap and a low-cost 7-day Web Week Pass, is generally the cheapest way to handle occasional PDF edits without a full subscription."
    },
    {
      "question": "Is there a one-time-purchase option for Mac users?",
      "answer": "PDF Expert offers a Lifetime license restricted to the Mac version. Nitro PDF Pro's one-time license only covers Windows."
    },
    {
      "question": "Do all three support OCR and e-signatures?",
      "answer": "Yes, Nitro PDF Pro, PDF Expert, and Sejda PDF all include OCR for scanned documents and electronic signature support, though Sejda caps OCR at 100 pages per task."
    }
  ]
};

export default nitroPdfProVsPdfExpertVsSejdaPdfContent;
