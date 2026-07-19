import type { GroupComparisonContent } from './types';

const mayanEdmsVsOpenkmVsPapermergeContent: GroupComparisonContent = {
  "verdict": "For teams with very large document volumes who need multi-language OCR and are comfortable operating a Django and Docker deployment, Mayan EDMS is the most battle-tested option after more than a decade of continuous development. OpenKM is the better fit for compliance-heavy organizations that want dedicated records management and jBPM-driven approval workflows, with a paid Professional or Cloud edition available if community-only support is not enough. Papermerge is the lightest of the three, built on a modern Python, TypeScript, and PostgreSQL stack with an API-first design, making it a reasonable pick for smaller teams that do not need enterprise-scale workflow or records-management tooling. None of the three ships an official first-party managed cloud SaaS for its free, open-source edition apart from OpenKM's paid Cloud option, so self-hosting is the default expectation for all three.",
  "bestFor": {
    "mayan-edms": "Organizations with very large document repositories that need multi-language, distributed OCR processing and are comfortable running and maintaining a Django/Docker deployment themselves.",
    "openkm": "Compliance-heavy organizations that need dedicated records management and jBPM-based workflow automation, and want the option to pay for commercial support or a hosted Cloud edition rather than relying purely on community forums.",
    "papermerge": "Small teams or individual users who want a lightweight, modern, API-first document archive with multi-user permissions, without the setup complexity or enterprise scale ambitions of a full DMS."
  },
  "highlights": [
    {
      "title": "Mayan EDMS scales furthest but demands the most operational skill",
      "description": "Mayan EDMS's pros cite an architecture capable of handling hundreds of millions of documents with distributed, multi-language OCR processing, but it requires Django and Docker familiarity to deploy and maintain, and has no official managed cloud offering.",
      "toolSlugs": [
        "mayan-edms"
      ]
    },
    {
      "title": "OpenKM is the only one with a real paid support and cloud path",
      "description": "OpenKM sells Professional and Cloud editions on top of its free Community Edition, with jBPM-based workflow automation and purpose-built records management aimed at compliance-heavy industries, though pricing for the paid tiers requires a sales quote.",
      "toolSlugs": [
        "openkm"
      ]
    },
    {
      "title": "Papermerge is the lightest, most developer-friendly of the three",
      "description": "Papermerge's API-first design and modern Python/TypeScript/PostgreSQL stack make it easier to automate and integrate, but it has a much smaller community and slower feature velocity than more established alternatives, and no official commercial support or SLA.",
      "toolSlugs": [
        "papermerge"
      ]
    },
    {
      "title": "All three lean on self-hosting for their free tier",
      "description": "Mayan EDMS and Papermerge have no official managed SaaS at all, and OpenKM's Community Edition is also self-hosted with only forum support; a hosted option only appears once you pay for OpenKM's Cloud edition.",
      "toolSlugs": [
        "mayan-edms",
        "openkm",
        "papermerge"
      ]
    },
    {
      "title": "Workflow automation depth is not equal across the three",
      "description": "Mayan EDMS and OpenKM both list a dedicated workflow automation engine (Mayan's built-in engine and OpenKM's jBPM integration), while Papermerge's documented feature set does not include a comparable workflow automation capability.",
      "toolSlugs": [
        "mayan-edms",
        "openkm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Document Organization",
      "rows": [
        {
          "feature": "Document versioning",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papermerge": "available"
          }
        },
        {
          "feature": "Multi-user permissions",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "not-documented",
            "papermerge": "available"
          },
          "note": "Papermerge explicitly lists multi-user permissions; this is not confirmed one way or the other for Mayan EDMS or OpenKM in the provided data."
        }
      ]
    },
    {
      "group": "OCR and Search",
      "rows": [
        {
          "feature": "Built-in OCR text extraction",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papermerge": "available"
          }
        },
        {
          "feature": "Distributed, multi-language OCR at scale",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "not-documented",
            "papermerge": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Workflow, Compliance and Signatures",
      "rows": [
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papermerge": "not-documented"
          },
          "note": "OpenKM's workflow automation is built on jBPM; Papermerge's listed features do not include a dedicated workflow engine."
        },
        {
          "feature": "Records management / compliance-focused retention features",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "available",
            "papermerge": "not-documented"
          }
        }
      ]
    },
    {
      "group": "API, Deployment and Support",
      "rows": [
        {
          "feature": "REST API",
          "statuses": {
            "mayan-edms": "not-documented",
            "openkm": "available",
            "papermerge": "available"
          }
        },
        {
          "feature": "Official commercial support or paid SLA option",
          "statuses": {
            "mayan-edms": "available",
            "openkm": "available",
            "papermerge": "unavailable"
          },
          "note": "Papermerge's own documented cons state it has no official commercial support or SLA."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three document management systems is easiest to get running for a small team?",
      "answer": "Papermerge is the lightest option, built on a modern Python backend, TypeScript frontend, and PostgreSQL database with an API-first design, compared to Mayan EDMS's Django/Docker complexity and OpenKM's more dated admin interface and workflow learning curve."
    },
    {
      "question": "Do Mayan EDMS, OpenKM, or Papermerge offer a hosted cloud version, or do I have to self-host?",
      "answer": "OpenKM offers a paid Cloud Edition alongside its self-hosted Community Edition, but pricing requires a custom quote. Mayan EDMS and Papermerge have no official managed or SaaS offering, so their free editions require self-hosting."
    },
    {
      "question": "Which tool has the strongest workflow automation for approval processes?",
      "answer": "OpenKM's jBPM-based workflow automation and Mayan EDMS's built-in workflow automation engine are both explicitly documented features. Papermerge's listed feature set does not include a dedicated workflow automation engine."
    },
    {
      "question": "Is paid commercial support available if something breaks in a production deployment?",
      "answer": "Mayan EDMS offers optional, custom-priced commercial support, and OpenKM's paid Professional and Cloud editions include support. Papermerge's own documented cons state it has no official commercial support or SLA."
    },
    {
      "question": "Which is the most mature, longest-running project of the three?",
      "answer": "OpenKM was founded in 2005 and Mayan EDMS in 2010, giving both well over a decade of history; Mayan EDMS's pros specifically cite over a decade of continuous development and a large contributor base. Papermerge, founded in 2018, is the newest and has a smaller community by its own documented cons."
    },
    {
      "question": "Which tool is built to handle the largest document volumes?",
      "answer": "Mayan EDMS's pros cite an architecture capable of handling hundreds of millions of documents with distributed OCR processing, a scale claim that is not made in the provided data for OpenKM or Papermerge."
    }
  ]
};

export default mayanEdmsVsOpenkmVsPapermergeContent;
