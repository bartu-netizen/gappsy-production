import type { GroupComparisonContent } from './types';

const basecampVsProofhubVsWorkfrontContent: GroupComparisonContent = {
  "verdict": "Basecamp and ProofHub serve small and mid-sized teams with predictable, flat-rate pricing and a lighter feature set, while Workfront is a considerably heavier, custom-priced enterprise platform built for large marketing and creative operations that need portfolio-level resource management, governance controls, and deep Adobe Creative Cloud integration. The three sit at genuinely different scales, so the choice usually comes down to whether an organization needs a simple shared workspace or enterprise-grade work management.",
  "bestFor": {
    "basecamp": "Small teams that want a simple, flat-rate hub for tasks and communication without enterprise overhead.",
    "proofhub": "Agencies that want flat-rate proofing and multiple project views without committing to enterprise-scale software.",
    "workfront": "Large marketing and creative organizations that need enterprise-grade portfolio, resource, and governance management."
  },
  "highlights": [
    {
      "title": "Flat-rate small-team pricing versus custom enterprise contracts",
      "description": "Basecamp and ProofHub both publish flat monthly rates for unlimited users, while Workfront is sold through custom, quote-based enterprise contracts.",
      "toolSlugs": [
        "basecamp",
        "proofhub",
        "workfront"
      ]
    },
    {
      "title": "Built-in proofing at two different scales",
      "description": "ProofHub and Workfront both include native file proofing and approval tools, but Workfront's version is built for portfolio-scale creative review cycles.",
      "toolSlugs": [
        "proofhub",
        "workfront"
      ]
    },
    {
      "title": "Enterprise resource and portfolio management",
      "description": "Workfront offers capacity planning, request queues, and portfolio-level reporting aimed at large, multi-team marketing operations.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Deep Adobe Creative Cloud integration",
      "description": "As an Adobe product, Workfront connects tightly with Adobe Experience Manager, Creative Cloud, and its own Fusion automation layer.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Simplicity for small teams",
      "description": "Basecamp keeps its feature set intentionally minimal, centered on to-do lists, message boards, and chat rather than portfolio-level governance.",
      "toolSlugs": [
        "basecamp"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Project Views and Planning",
      "rows": [
        {
          "feature": "Gantt or timeline views",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "available",
            "workfront": "available"
          }
        },
        {
          "feature": "Resource and capacity management",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "not-documented",
            "workfront": "available"
          }
        }
      ]
    },
    {
      "group": "Review and Approval",
      "rows": [
        {
          "feature": "File proofing and annotation",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "available",
            "workfront": "available"
          }
        },
        {
          "feature": "Custom approval workflows",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "available",
            "workfront": "available"
          }
        }
      ]
    },
    {
      "group": "Administration and Scale",
      "rows": [
        {
          "feature": "Enterprise security and governance controls",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "not-documented",
            "workfront": "available"
          }
        },
        {
          "feature": "No-code automation platform",
          "statuses": {
            "basecamp": "not-documented",
            "proofhub": "not-documented",
            "workfront": "available"
          },
          "note": "Workfront Fusion connects the platform to hundreds of external systems, including the broader Adobe Experience Cloud."
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Flat-rate unlimited-user pricing",
          "statuses": {
            "basecamp": "available",
            "proofhub": "available",
            "workfront": "unavailable"
          }
        },
        {
          "feature": "Published starting price",
          "statuses": {
            "basecamp": "available",
            "proofhub": "available",
            "workfront": "unavailable"
          },
          "note": "Workfront pricing is quote-based; third-party estimates place it around $49 to $99 per user per month."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Workfront overkill for a small team?",
      "answer": "For most small teams, yes. Workfront is priced and built for large, multi-team marketing and creative organizations, while Basecamp and ProofHub are designed for simpler, flat-rate team collaboration."
    },
    {
      "question": "Do Basecamp and ProofHub include file proofing?",
      "answer": "ProofHub includes built-in proofing and approval tools; Basecamp does not document a native proofing feature and focuses instead on lists, boards, and chat."
    },
    {
      "question": "How much does Workfront cost?",
      "answer": "Adobe does not publish list prices for Workfront; it is sold through custom contracts, with third-party estimates suggesting roughly $49 to $99 per user per month plus implementation fees."
    },
    {
      "question": "Which of the three integrates with Adobe Creative Cloud?",
      "answer": "Workfront, as an Adobe product, has native integration with Adobe Creative Cloud and the wider Adobe Experience Cloud; Basecamp and ProofHub do not document this integration."
    },
    {
      "question": "Can small agencies get flat-rate pricing among these three?",
      "answer": "Yes, both Basecamp and ProofHub offer flat-rate plans covering unlimited users, while Workfront requires a custom, quote-based enterprise contract."
    },
    {
      "question": "Which is best for large enterprise marketing teams?",
      "answer": "Workfront, since it is purpose-built for portfolio-level planning, resource management, and governance at a scale that Basecamp and ProofHub do not target."
    }
  ]
};

export default basecampVsProofhubVsWorkfrontContent;
