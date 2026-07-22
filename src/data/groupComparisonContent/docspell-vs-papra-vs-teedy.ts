import type { GroupComparisonContent } from './types';

const docspellVsPapraVsTeedyContent: GroupComparisonContent = {
  "verdict": "All three are open-source, self-hostable document organizers rather than SaaS-only products, but they diverge on maturity and extras. Docspell leans hardest into ML-assisted correspondent and tag suggestions with its household-style 'collectives' model, but has no official managed cloud. Papra is the newest and lightest to deploy, with a cheap official EU cloud fallback, while Teedy is the only one with built-in AES-256 encryption and a track record scaling to roughly a million documents. There is no universal winner; the right pick depends on whether encryption, ML-assisted tagging, or ease of deployment matters most.",
  "bestFor": {
    "docspell": "Privacy-conscious households or small groups who want ML-assisted auto-tagging and a shared 'collective' document pool, and are comfortable running it with no official managed cloud option.",
    "papra": "Self-hosters who want the lightest, quickest Docker deployment plus an optional low-cost, GDPR-compliant EU cloud fallback for less technical users.",
    "teedy": "Organizations that specifically need built-in AES-256 document encryption or a system proven at larger document volumes, with an official hosted cloud alternative at teedy.io."
  },
  "highlights": [
    {
      "title": "Docspell pairs OCR with machine-learning tag suggestions",
      "description": "Docspell applies Stanford CoreNLP-based NLP on top of Tesseract OCR to suggest correspondents, tags, and dates, learning from user corrections over time, which the other two do not document to the same depth.",
      "toolSlugs": [
        "docspell"
      ]
    },
    {
      "title": "Papra is the newest and lightest to self-host",
      "description": "Started in 2025, Papra ships as a Docker image under 200MB and offers automatic tagging rules, email ingestion, and an API/SDK/webhook layer, plus an optional EU-hosted cloud plan starting around $7.50/month billed annually.",
      "toolSlugs": [
        "papra"
      ]
    },
    {
      "title": "Teedy is the only one with built-in document encryption",
      "description": "Teedy encrypts stored documents with 256-bit AES and has been reported to scale to roughly one million documents in production, differentiating it on both security and proven scale.",
      "toolSlugs": [
        "teedy"
      ]
    },
    {
      "title": "Only Papra and Teedy offer an official managed cloud",
      "description": "Docspell has no official hosted version from its maintainer, while Papra and Teedy both sell optional managed cloud plans for users who do not want to self-host.",
      "toolSlugs": [
        "papra",
        "teedy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Document Processing",
      "rows": [
        {
          "feature": "OCR text extraction",
          "statuses": {
            "docspell": "available",
            "papra": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "ML/NLP-assisted tag and correspondent suggestions",
          "statuses": {
            "docspell": "available",
            "papra": "limited",
            "teedy": "not-documented"
          },
          "note": "Papra uses configurable rule-based auto-tagging rather than Docspell's NLP-based suggestion engine."
        },
        {
          "feature": "Full-text search",
          "statuses": {
            "docspell": "available",
            "papra": "available",
            "teedy": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Access",
      "rows": [
        {
          "feature": "Free, self-hosted open-source core",
          "statuses": {
            "docspell": "available",
            "papra": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "docspell": "unavailable",
            "papra": "available",
            "teedy": "available"
          },
          "note": "Docspell has no official managed cloud; Papra's cloud is EU-hosted, Teedy's is at teedy.io."
        },
        {
          "feature": "Multi-user shared workspace (collectives/organizations/groups)",
          "statuses": {
            "docspell": "available",
            "papra": "available",
            "teedy": "available"
          }
        }
      ]
    },
    {
      "group": "Integration and Mobile Access",
      "rows": [
        {
          "feature": "REST/HTTP API",
          "statuses": {
            "docspell": "available",
            "papra": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "Native mobile app",
          "statuses": {
            "docspell": "available",
            "papra": "not-documented",
            "teedy": "available"
          },
          "note": "Docspell and Teedy both ship native Android apps; no native mobile app is documented for Papra."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three offers an official managed cloud hosting option?",
      "answer": "Papra and Teedy both sell an official managed cloud version (Papra's cloud is EU-hosted from about $7.50/month billed annually, Teedy Cloud starts around EUR 19 per user per month). Docspell has no official managed cloud, only community third-party hosting options."
    },
    {
      "question": "Does any of these tools encrypt documents by default?",
      "answer": "Teedy is the only one of the three with documented built-in encryption, using 256-bit AES on stored documents. Docspell and Papra do not document built-in document encryption."
    },
    {
      "question": "Which tool is best for a family or small group sharing one document pool?",
      "answer": "Docspell's 'collectives' model is purpose-built for this, letting multiple users share a document pool while keeping individual accounts. Papra's organizations and Teedy's group permissions cover similar ground but with a less household-specific framing."
    },
    {
      "question": "Can any of these automatically capture documents forwarded by email?",
      "answer": "Docspell and Papra both support email-based ingestion, importing documents forwarded to a dedicated address. This is not documented as a feature for Teedy."
    },
    {
      "question": "Are any of these backed by venture capital?",
      "answer": "No. Docspell is a volunteer-maintained open-source project with no company behind it, Papra is bootstrapped and explicitly built without venture funding, and Teedy is developed by Sismics, a small independent software company."
    },
    {
      "question": "Which is the newest and most actively evolving of the three?",
      "answer": "Papra, which started as a side project in January 2025, is the newest. Its feature set and integrations are correspondingly less mature than Docspell's or Teedy's longer-running codebases."
    }
  ]
};

export default docspellVsPapraVsTeedyContent;
