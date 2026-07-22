import type { GroupComparisonContent } from './types';

const boldsignVsDochubVsJotformSignContent: GroupComparisonContent = {
  "verdict": "BoldSign, DocHub, and Jotform Sign all offer free-to-start e-signing with templates, but they are built for different workflows. BoldSign leans developer-first with an embeddable API and strong compliance coverage, DocHub pairs signing with full browser-based PDF editing tied to Gmail and Google Drive, and Jotform Sign is a free signing layer bundled into Jotform's broader forms and data platform. None is a strict upgrade over the others; the right pick depends on whether you need an API, a PDF editor, or a forms ecosystem.",
  "bestFor": {
    "boldsign": "Software teams and developers who want to embed e-signing directly into their own product via API with strong compliance coverage (HIPAA, SOC 2)",
    "dochub": "Individuals and small teams who want free, browser-based PDF editing plus light e-signing built into Gmail and Google Drive",
    "jotform-sign": "Teams already using Jotform forms and tables who want free signing bundled into their account with a large template library"
  },
  "highlights": [
    {
      "title": "BoldSign is built to be embedded",
      "description": "BoldSign ships a REST API and SDKs so developers can embed sending, signing, and webhooks directly into their own applications rather than redirecting users to a third-party page.",
      "toolSlugs": [
        "boldsign"
      ]
    },
    {
      "title": "DocHub doubles as a PDF editor",
      "description": "DocHub adds full in-browser PDF editing, annotation, and fillable form fields on top of signing, with native Gmail, Google Drive, and Dropbox integration.",
      "toolSlugs": [
        "dochub"
      ]
    },
    {
      "title": "Jotform Sign is free and template-heavy",
      "description": "Jotform Sign is bundled at no extra cost into a Jotform account and ships with over 1,000 ready-made signable templates plus multi-step approval routing.",
      "toolSlugs": [
        "jotform-sign"
      ]
    },
    {
      "title": "HIPAA support is gated differently on each",
      "description": "All three can support HIPAA-compliant signing, but only on higher tiers: BoldSign's Business plan, DocHub's custom-priced Site License, and Jotform's Gold or Enterprise plan.",
      "toolSlugs": [
        "boldsign",
        "dochub",
        "jotform-sign"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core E-Signing",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "jotform-sign": "available"
          }
        },
        {
          "feature": "Reusable templates",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "jotform-sign": "available"
          },
          "note": "Jotform Sign includes 1,000+ prebuilt templates versus a handful on BoldSign's free tier"
        },
        {
          "feature": "Bulk sending",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "jotform-sign": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and Integration",
      "rows": [
        {
          "feature": "Embeddable API for developers",
          "statuses": {
            "boldsign": "available",
            "dochub": "not-documented",
            "jotform-sign": "not-documented"
          }
        },
        {
          "feature": "Multi-step approval workflow",
          "statuses": {
            "boldsign": "not-documented",
            "dochub": "not-documented",
            "jotform-sign": "available"
          }
        }
      ]
    },
    {
      "group": "Compliance",
      "rows": [
        {
          "feature": "HIPAA compliance option",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "jotform-sign": "available"
          },
          "note": "Gated behind BoldSign Business, DocHub Site License, and Jotform Gold/Enterprise respectively"
        }
      ]
    },
    {
      "group": "Beyond Signing",
      "rows": [
        {
          "feature": "Full PDF editing",
          "statuses": {
            "boldsign": "unavailable",
            "dochub": "available",
            "jotform-sign": "limited"
          },
          "note": "Jotform Sign converts PDFs into signable forms but is not a general PDF editor"
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "boldsign": "available",
            "dochub": "available",
            "jotform-sign": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three e-signature tools has the best free plan?",
      "answer": "It depends on need: BoldSign's free Essential plan covers 25 envelopes a month with 2 templates, DocHub's free plan covers basic editing plus up to 5 e-signature requests a month, and Jotform Sign is bundled free into a Jotform account with template access, though document volume scales with the Jotform plan you are on."
    },
    {
      "question": "Is Jotform Sign really free to use?",
      "answer": "Yes, Jotform Sign has no separate pricing page and is included with a free Jotform account, though higher document volumes, removed branding, and HIPAA-compliant signing require upgrading to a paid Jotform plan like Bronze, Silver, Gold, or Enterprise."
    },
    {
      "question": "Can I embed e-signing directly into my own app with these tools?",
      "answer": "BoldSign is purpose-built for this, offering a REST API, SDKs, and an Enterprise API priced per envelope for embedded requesting, signing, and webhooks. DocHub and Jotform Sign do not document a comparable embeddable signing API."
    },
    {
      "question": "Which tool is best for teams already using Google Workspace?",
      "answer": "DocHub is the strongest fit, with deep native integration into Gmail, Google Drive, and Google Classroom that lets users edit and sign PDF attachments without downloading and re-uploading files."
    },
    {
      "question": "Do any of these support HIPAA-compliant signing?",
      "answer": "All three can, but the capability sits on a paid tier in each case: BoldSign's Business plan, DocHub's custom-priced Site License, and Jotform's Gold or Enterprise plan."
    },
    {
      "question": "Which tool offers the largest template library?",
      "answer": "Jotform Sign, with more than 1,000 ready-made signable templates covering contracts, waivers, consent forms, and NDAs, well beyond the 2 to 10 templates included on BoldSign's entry-level plans."
    }
  ]
};

export default boldsignVsDochubVsJotformSignContent;
