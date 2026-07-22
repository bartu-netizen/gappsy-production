import type { GroupComparisonContent } from './types';

const docspellVsOpenkmVsTeedyContent: GroupComparisonContent = {
  "verdict": "Docspell and Teedy are lightweight, developer-friendly self-hosted document organizers best suited to individuals and small teams, while OpenKM is a more full-featured enterprise content management platform with records management and workflow automation, backed by a commercial company that also sells paid Professional and Cloud tiers. Choosing between them mostly comes down to whether you need formal records management and vendor support, or a simpler, purely community-run tool.",
  "bestFor": {
    "docspell": "Privacy-conscious individuals and small groups who want machine-learning-assisted auto-tagging of scanned paperwork",
    "openkm": "Organizations needing enterprise records management, regulatory compliance, and workflow automation, with the option of paid vendor support",
    "teedy": "Small teams wanting a lightweight self-hosted document management system with an optional hosted cloud alternative"
  },
  "highlights": [
    {
      "title": "OpenKM adds formal records management",
      "description": "OpenKM includes purpose-built records management features for regulatory and compliance use cases, plus a jBPM-based workflow and business process automation engine, capabilities not documented for Docspell or Teedy.",
      "toolSlugs": [
        "openkm"
      ]
    },
    {
      "title": "Docspell learns your filing habits",
      "description": "Docspell uses OCR plus natural language processing to suggest correspondents, tags, and dates, and organizes documents around shared 'collectives' for households or small teams.",
      "toolSlugs": [
        "docspell"
      ]
    },
    {
      "title": "Teedy runs almost anywhere",
      "description": "Teedy can be deployed on hardware from a Raspberry Pi to Kubernetes clusters and offers an optional hosted cloud version at teedy.io for teams that would rather not self-host.",
      "toolSlugs": [
        "teedy"
      ]
    },
    {
      "title": "OpenKM is the only vendor-backed option",
      "description": "OpenKM is developed by a Spanish software company with regional offices across multiple countries, offering paid Professional and Cloud editions with vendor support, unlike the purely community-maintained Docspell and Teedy open-source editions.",
      "toolSlugs": [
        "openkm"
      ]
    },
    {
      "title": "All three provide a genuinely free, self-hostable core",
      "description": "Docspell, OpenKM's Community Edition, and Teedy's self-hosted edition are all free to deploy with no per-user licensing fee for their open-source tier.",
      "toolSlugs": [
        "docspell",
        "openkm",
        "teedy"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Document Management",
      "rows": [
        {
          "feature": "Free self-hosted/open-source tier",
          "statuses": {
            "docspell": "available",
            "openkm": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "OCR text extraction",
          "statuses": {
            "docspell": "available",
            "openkm": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "Full-text search",
          "statuses": {
            "docspell": "available",
            "openkm": "available",
            "teedy": "available"
          }
        },
        {
          "feature": "REST API",
          "statuses": {
            "docspell": "available",
            "openkm": "available",
            "teedy": "available"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Compliance",
      "rows": [
        {
          "feature": "Formal records management (retention/regulatory)",
          "statuses": {
            "docspell": "not-documented",
            "openkm": "available",
            "teedy": "not-documented"
          }
        },
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "docspell": "not-documented",
            "openkm": "available",
            "teedy": "limited"
          },
          "note": "OpenKM uses jBPM for full business process automation; Teedy has basic workflow/approval tools"
        },
        {
          "feature": "Paid vendor support option",
          "statuses": {
            "docspell": "not-documented",
            "openkm": "available",
            "teedy": "available"
          },
          "note": "OpenKM offers Professional/Cloud editions; Teedy offers the optional Teedy Cloud"
        }
      ]
    },
    {
      "group": "Access",
      "rows": [
        {
          "feature": "Native mobile app",
          "statuses": {
            "docspell": "available",
            "openkm": "available",
            "teedy": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between OpenKM and the other two tools?",
      "answer": "OpenKM is developed and supported by a commercial company with paid Professional and Cloud editions, formal records management, and jBPM-based workflow automation, while Docspell and Teedy are purely community-maintained open-source projects without a company or paid support option behind their self-hosted editions."
    },
    {
      "question": "Is OpenKM's Community Edition really free?",
      "answer": "Yes, OpenKM's Community Edition is released under an open-source license and is free to self-host, though it comes with community forum support only, unlike the paid Professional and Cloud editions, which add vendor support and pricing starting around $30 per user per month by third-party estimates."
    },
    {
      "question": "Which of these has formal records management for regulatory compliance?",
      "answer": "OpenKM, which includes dedicated records management (RM) features for retention schedules and regulatory compliance, a capability not documented for Docspell or Teedy."
    },
    {
      "question": "Can I get paid vendor support for any of these?",
      "answer": "OpenKM offers paid Professional and Cloud editions with vendor support, and Teedy offers an optional hosted Teedy Cloud version from Sismics. Docspell has no official commercial support option since it is maintained by an individual developer and community contributors."
    },
    {
      "question": "Which is lightest-weight for a small personal archive?",
      "answer": "Teedy and Docspell are both aimed at individuals and small groups and are lighter-weight than OpenKM's enterprise-oriented feature set; Teedy in particular has been reported to run on hardware as small as a Raspberry Pi."
    },
    {
      "question": "Do all three expose a REST API for integrations?",
      "answer": "Yes, Docspell, OpenKM, and Teedy each document a REST API that can be used to automate or integrate document workflows with other systems."
    }
  ]
};

export default docspellVsOpenkmVsTeedyContent;
