import type { GroupComparisonContent } from './types';

const docspellVsMayanEdmsVsTeedyContent: GroupComparisonContent = {
  "verdict": "Docspell, Mayan EDMS, and Teedy are all free, open-source, self-hosted document management systems with OCR and REST APIs, but they scale very differently. Docspell focuses on machine-learning-assisted auto-tagging for households and small groups, Mayan EDMS is the most enterprise-scale and mature of the three with a full workflow automation engine, and Teedy is the lightest-weight option, able to run on hardware as small as a Raspberry Pi while also offering an optional paid cloud version. All three avoid per-user licensing fees entirely.",
  "bestFor": {
    "docspell": "Privacy-conscious individuals and families who want machine-learning-assisted auto-tagging of scanned paperwork shared across a household or small group",
    "mayan-edms": "Organizations needing enterprise-scale document management with workflow automation, versioning, and compliance-oriented features",
    "teedy": "Users wanting the lightest-weight self-hosted document management system, with an optional hosted cloud alternative if they later want to stop self-hosting"
  },
  "highlights": [
    {
      "title": "Mayan EDMS is built for enterprise scale",
      "description": "Mayan EDMS is designed to scale from small deployments to enterprise repositories handling hundreds of millions of documents, with distributed OCR processing and a full workflow automation engine.",
      "toolSlugs": [
        "mayan-edms"
      ]
    },
    {
      "title": "Docspell learns your filing habits",
      "description": "Docspell uses OCR plus natural language processing to suggest correspondents, tags, and dates, improving its suggestions over time as users confirm or correct them, and organizes documents around shared 'collectives' for households or small teams.",
      "toolSlugs": [
        "docspell"
      ]
    },
    {
      "title": "Teedy runs almost anywhere",
      "description": "Teedy has been reported to scale to roughly one million documents and can be deployed on hardware ranging from a Raspberry Pi to Kubernetes clusters, with an optional hosted cloud version at teedy.io for teams that would rather not self-host.",
      "toolSlugs": [
        "teedy"
      ]
    },
    {
      "title": "All three are fully free with no feature paywalls",
      "description": "Docspell, Mayan EDMS, and Teedy each offer their complete self-hosted feature set for free, funded by community or volunteer development rather than gated tiers.",
      "toolSlugs": [
        "docspell",
        "mayan-edms",
        "teedy"
      ]
    },
    {
      "title": "Licenses differ in ways that matter for redistribution",
      "description": "Docspell uses AGPLv3, Mayan EDMS uses the more permissive Apache 2.0, and Teedy uses GPL, which can matter for organizations planning to modify or redistribute the software.",
      "toolSlugs": [
        "docspell",
        "mayan-edms",
        "teedy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Document Management",
      "rows": [
        {
          "feature": "Free, open-source, self-hosted",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "OCR text extraction",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "Full-text search",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "REST/HTTP API",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "not-documented",
            "teedy": "available"
          },
          "note": "Mayan EDMS is API-driven internally but a public REST API is not detailed in the provided data"
        }
      ]
    },
    {
      "group": "Organization and Automation",
      "rows": [
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "docspell": "not-documented",
            "mayan-edms": "available",
            "teedy": "limited"
          },
          "note": "Teedy includes basic workflow/approval tools; Mayan EDMS has a dedicated workflow engine tracking document state"
        },
        {
          "feature": "Machine-learning-assisted auto-tagging",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "not-documented",
            "teedy": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Native mobile app",
          "statuses": {
            "docspell": "available",
            "mayan-edms": "not-documented",
            "teedy": "available"
          },
          "note": "Both Docspell and Teedy ship an Android app"
        },
        {
          "feature": "Optional managed/hosted cloud version",
          "statuses": {
            "docspell": "not-documented",
            "mayan-edms": "not-documented",
            "teedy": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are all three of these document management systems really free?",
      "answer": "Yes. Docspell (AGPLv3), Mayan EDMS (Apache 2.0), and Teedy (GPL, self-hosted edition) are all fully open source with no feature paywalls on the self-hosted version; the only real cost is the server and storage you provide."
    },
    {
      "question": "Which one scales best for large enterprise document volumes?",
      "answer": "Mayan EDMS, which is explicitly designed to handle repositories of hundreds of millions of documents and supports distributing OCR processing across multiple worker nodes."
    },
    {
      "question": "Which tool is easiest to run on lightweight hardware like a Raspberry Pi?",
      "answer": "Teedy, which has been reported to run on hardware ranging from a Raspberry Pi up to Kubernetes clusters, using an embedded H2 database for small deployments."
    },
    {
      "question": "Do any of these offer a managed cloud or hosted option if I don't want to self-host?",
      "answer": "Teedy is the only one of the three with an official hosted cloud version, at teedy.io, priced from about EUR 19 per user per month. Docspell and Mayan EDMS do not document an official managed cloud offering."
    },
    {
      "question": "Which has the strongest workflow automation for approvals?",
      "answer": "Mayan EDMS, which includes a dedicated workflow engine that tracks document state changes and can trigger automated actions as documents move through a business process."
    },
    {
      "question": "What license governs each project, and does that matter for my use case?",
      "answer": "Docspell uses AGPLv3, Mayan EDMS uses Apache 2.0, and Teedy's self-hosted edition uses GPL. This mainly matters if you plan to modify the source and redistribute a derivative product, since the licenses impose different obligations."
    }
  ]
};

export default docspellVsMayanEdmsVsTeedyContent;
