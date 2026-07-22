import type { GroupComparisonContent } from './types';

const proofhubVsScoroVsWorkfrontContent: GroupComparisonContent = {
  "verdict": "ProofHub, Scoro, and Workfront all manage projects and tasks, but they serve very different buyers and pricing realities. ProofHub trades per-seat pricing for a flat monthly fee with unlimited users, Scoro fuses project management with quoting, invoicing, and profitability reporting for agencies and consultancies, and Workfront is a governance-heavy enterprise platform built for large marketing and creative operations inside the Adobe ecosystem. Team size, need for built-in billing, and appetite for enterprise-grade process controls should drive the choice more than any single feature.",
  "bestFor": {
    "proofhub": "agencies and SMBs that want unlimited users, including external clients, at one predictable flat monthly price",
    "scoro": "consultancies and agencies that need project management combined with quoting, invoicing, and profitability reporting in one system",
    "workfront": "large enterprise marketing and creative operations teams that need portfolio-level governance and native Adobe Creative Cloud integration"
  },
  "highlights": [
    {
      "title": "ProofHub charges a flat fee instead of per user",
      "description": "ProofHub's Essential and Ultimate Control plans both include unlimited users at one fixed monthly price, which can be significantly cheaper than Scoro's or Workfront's per-seat models for larger teams or agencies with many external collaborators.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Scoro is a project management and billing hybrid, not just a PM tool",
      "description": "Scoro layers quoting, invoicing, retainer management, role-based labor costing, and revenue forecasting on top of project management, functionally acting as professional services automation software rather than pure task tracking.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Workfront is built for enterprise governance and the Adobe ecosystem",
      "description": "Workfront adds request and intake queues, enterprise security and governance controls, and Workfront Fusion automation, and integrates natively with Adobe Creative Cloud and the broader Adobe Experience Cloud.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Creative proofing is a shared strength between two of the three",
      "description": "ProofHub and Workfront both include built-in proofing and approval tools for reviewing creative or content deliverables; Scoro does not document a comparable proofing feature.",
      "toolSlugs": [
        "proofhub",
        "workfront"
      ]
    },
    {
      "title": "Pricing transparency varies sharply",
      "description": "ProofHub publishes flat monthly rates, Scoro publishes per-user tier pricing with a five-seat minimum, and Workfront does not publish list prices at all, requiring a custom quote.",
      "toolSlugs": [
        "proofhub",
        "scoro",
        "workfront"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Project Planning",
      "rows": [
        {
          "feature": "Gantt or timeline views",
          "statuses": {
            "proofhub": "available",
            "scoro": "available",
            "workfront": "available"
          }
        },
        {
          "feature": "Custom workflows and statuses",
          "statuses": {
            "proofhub": "available",
            "scoro": "not-documented",
            "workfront": "available"
          }
        }
      ]
    },
    {
      "group": "Financial and Billing",
      "rows": [
        {
          "feature": "Native quoting and invoicing",
          "statuses": {
            "proofhub": "unavailable",
            "scoro": "available",
            "workfront": "unavailable"
          },
          "note": "Neither ProofHub nor Workfront document built-in quoting or invoicing tools."
        },
        {
          "feature": "Retainer and budget management",
          "statuses": {
            "proofhub": "unavailable",
            "scoro": "available",
            "workfront": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Creative Review and Intake",
      "rows": [
        {
          "feature": "Proofing and approval workflows",
          "statuses": {
            "proofhub": "available",
            "scoro": "unavailable",
            "workfront": "available"
          }
        },
        {
          "feature": "Request or intake queues",
          "statuses": {
            "proofhub": "not-documented",
            "scoro": "not-documented",
            "workfront": "available"
          }
        }
      ]
    },
    {
      "group": "Resourcing and Access",
      "rows": [
        {
          "feature": "Resource and capacity planning",
          "statuses": {
            "proofhub": "not-documented",
            "scoro": "available",
            "workfront": "available"
          },
          "note": "Scoro gates its resource planner and timesheets behind the Performance tier."
        },
        {
          "feature": "Flat-rate pricing with unlimited users",
          "statuses": {
            "proofhub": "available",
            "scoro": "unavailable",
            "workfront": "unavailable"
          },
          "note": "Scoro and Workfront are both priced per user rather than as a flat fee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools does not charge per user?",
      "answer": "ProofHub is the only one with flat-rate pricing that includes unlimited users at a single fixed monthly cost. Scoro charges per user with a five-seat minimum, and Workfront is priced through custom, quote-based contracts."
    },
    {
      "question": "Which tool combines project management with client invoicing?",
      "answer": "Scoro. It includes native quoting and invoicing, retainer management, role-based labor costing, and financial reporting alongside its project management tools, functioning more like professional services automation software than a pure PM tool."
    },
    {
      "question": "Which tool is built for large enterprise marketing and creative teams?",
      "answer": "Workfront, now sold as Adobe Workfront. It is designed for enterprise-scale portfolio governance and integrates natively with Adobe Creative Cloud and the broader Adobe Experience Cloud, positioning it above ProofHub and Scoro for large organizations."
    },
    {
      "question": "Do ProofHub and Scoro both offer creative proofing tools?",
      "answer": "No. ProofHub includes built-in proofing for reviewing and approving creative files like images and PDFs. Scoro does not document a comparable proofing feature, focusing instead on project, billing, and reporting workflows."
    },
    {
      "question": "Is Workfront's pricing published anywhere?",
      "answer": "No. Adobe does not publish list prices for Workfront; it is sold through custom, quote-based contracts, though third-party estimates place typical costs around 49 to 99 dollars per user per month billed annually, plus implementation fees."
    },
    {
      "question": "Which tool is most affordable for an agency serving many external clients?",
      "answer": "ProofHub is likely the most cost-predictable option for agencies with many client collaborators, since its flat monthly price covers unlimited users rather than charging per seat like Scoro or requiring a custom enterprise contract like Workfront."
    }
  ]
};

export default proofhubVsScoroVsWorkfrontContent;
