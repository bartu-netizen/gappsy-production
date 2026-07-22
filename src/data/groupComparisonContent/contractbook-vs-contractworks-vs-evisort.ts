import type { GroupComparisonContent } from './types';

const contractbookVsContractworksVsEvisortContent: GroupComparisonContent = {
  "verdict": "These three sit at different points on the CLM spectrum. Contractbook is the SMB-friendly, template-driven option with strong Nordic e-signature support. ContractWorks offers flat-rate, unlimited-user pricing aimed at organizations that want broad internal visibility without per-seat costs. Evisort has by far the deepest AI contract data extraction of the three, but since its 2024 acquisition by Workday it is being absorbed into Workday Contract Intelligence rather than sold as a fully independent product, which matters most to buyers not already invested in the Workday platform.",
  "bestFor": {
    "contractbook": "Small-to-mid-sized businesses, especially in Europe or the Nordics, that want an all-in-one drafting-to-signature-to-repository workflow with strong local digital ID support.",
    "contractworks": "Mid-sized organizations that want flat-rate, unlimited-user access to a contract repository with AI auto-tagging, without a long enterprise implementation process.",
    "evisort": "Large enterprises, particularly existing or prospective Workday customers, that need the deepest AI-driven contract data extraction integrated into a broader HR and finance platform."
  },
  "highlights": [
    {
      "title": "Evisort has the deepest AI extraction capability",
      "description": "Evisort's AI model is trained on roughly 11 million contracts and extracts more than 230 distinct data points with claimed above-90-percent accuracy, a scale and specificity not documented for Contractbook's AI assistant or ContractWorks' auto-tagging.",
      "toolSlugs": [
        "evisort"
      ]
    },
    {
      "title": "ContractWorks is the only flat-rate, unlimited-user option",
      "description": "ContractWorks charges a flat monthly rate starting around $600 that covers unlimited users, while Contractbook's named tiers cap the number of users and annual signed-contract volume per plan.",
      "toolSlugs": [
        "contractworks",
        "contractbook"
      ]
    },
    {
      "title": "Evisort is no longer sold as a fully standalone product",
      "description": "Following Workday's 2024 acquisition, Evisort's technology and brand are being progressively absorbed into Workday Contract Intelligence, which is a meaningful consideration for buyers who are not already using or evaluating Workday's HR and finance suite.",
      "toolSlugs": [
        "evisort"
      ]
    },
    {
      "title": "Contractbook's strongest differentiator is Nordic and European digital identity",
      "description": "Through its integration with Scrive, Contractbook supports Nordic digital ID schemes such as BankID and NemID/MitID for e-signature, a capability not documented for ContractWorks or Evisort.",
      "toolSlugs": [
        "contractbook"
      ]
    },
    {
      "title": "Pricing transparency differs sharply across all three",
      "description": "ContractWorks publishes a clear entry price of around $600 per month, Contractbook lists a starting price but its detailed plan pricing now mostly requires contacting sales, and Evisort is fully custom, quote-based pricing bundled increasingly with Workday licensing.",
      "toolSlugs": [
        "contractbook",
        "contractworks",
        "evisort"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI and Data Extraction",
      "rows": [
        {
          "feature": "AI-powered contract data extraction",
          "statuses": {
            "contractbook": "available",
            "contractworks": "available",
            "evisort": "available"
          },
          "note": "Evisort documents the deepest extraction, more than 230 data points from a training set of roughly 11 million contracts; ContractWorks focuses on auto-tagging fields like expiration dates and parties."
        },
        {
          "feature": "Risk scoring or contract analytics dashboards",
          "statuses": {
            "contractbook": "not-documented",
            "contractworks": "not-documented",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Drafting and Workflow",
      "rows": [
        {
          "feature": "Template-based contract drafting",
          "statuses": {
            "contractbook": "available",
            "contractworks": "unavailable",
            "evisort": "available"
          }
        },
        {
          "feature": "Approval workflow automation",
          "statuses": {
            "contractbook": "available",
            "contractworks": "not-documented",
            "evisort": "available"
          },
          "note": "Available on Contractbook's Accelerate tier and above."
        }
      ]
    },
    {
      "group": "Repository and Tracking",
      "rows": [
        {
          "feature": "Centralized, searchable contract repository",
          "statuses": {
            "contractbook": "available",
            "contractworks": "available",
            "evisort": "available"
          }
        },
        {
          "feature": "Renewal and obligation deadline tracking",
          "statuses": {
            "contractbook": "available",
            "contractworks": "available",
            "evisort": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Deployment",
      "rows": [
        {
          "feature": "Flat-rate, unlimited-user pricing",
          "statuses": {
            "contractbook": "unavailable",
            "contractworks": "available",
            "evisort": "unavailable"
          }
        },
        {
          "feature": "Published self-serve starting price",
          "statuses": {
            "contractbook": "limited",
            "contractworks": "available",
            "evisort": "unavailable"
          },
          "note": "Contractbook lists a starting price of $399/month but its detailed plan pricing now says to contact sales; ContractWorks publishes a clear $600/month entry price; Evisort is fully custom, quote-based pricing."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the strongest AI contract extraction?",
      "answer": "Evisort, whose AI model is trained on roughly 11 million contracts and extracts more than 230 distinct data points with claimed above-90-percent accuracy on standard clauses."
    },
    {
      "question": "Is Evisort still sold as a standalone CLM product?",
      "answer": "Not fully. Since Workday's 2024 acquisition, Evisort's technology and brand are being progressively absorbed into Workday Contract Intelligence rather than continuing as an independently marketed product."
    },
    {
      "question": "Which one offers flat-rate pricing regardless of how many users I add?",
      "answer": "ContractWorks, which charges one flat monthly rate starting around $600 for unlimited users, unlike Contractbook's tiered plans that cap users and contract volume per tier."
    },
    {
      "question": "Which is the best fit for a small or mid-sized business rather than a large enterprise?",
      "answer": "Contractbook or ContractWorks. Contractbook suits SMBs wanting an all-in-one drafting-to-signature workflow, especially in Europe, while ContractWorks suits mid-sized organizations wanting flat-rate access for many internal users. Evisort's AI depth and Workday integration are aimed more at large enterprises."
    },
    {
      "question": "Do any of these three publish transparent list pricing?",
      "answer": "ContractWorks publishes a clear entry price of about $600/month. Contractbook lists a starting price of $399/month, but its detailed plan features now mostly require contacting sales post-acquisition. Evisort is fully custom, quote-based pricing."
    },
    {
      "question": "Which is the best fit for a company already using Workday for HR and finance?",
      "answer": "Evisort, since its contract intelligence technology is increasingly bundled into Workday's own HR and finance modules as Workday Contract Intelligence rather than sold as a separate best-of-breed CLM tool."
    }
  ]
};

export default contractbookVsContractworksVsEvisortContent;
