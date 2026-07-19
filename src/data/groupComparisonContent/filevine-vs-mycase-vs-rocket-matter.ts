import type { GroupComparisonContent } from './types';

const filevineVsMycaseVsRocketMatterContent: GroupComparisonContent = {
  "verdict": "Filevine takes a different approach from MyCase and Rocket Matter by wrapping its entire platform around the LOIS AI assistant and modules for intake, depositions, document assembly, and open API access, but it only offers custom quote-based pricing rather than published tiers. MyCase and Rocket Matter are more traditional, transparently priced legal practice management tools with native trust accounting, time tracking, and client portals built in. Firms that want deep AI and litigation-specific tooling and are comfortable with a sales process should look at Filevine, while firms that want predictable per-user pricing with strong compliance basics will find MyCase or Rocket Matter more straightforward to evaluate.",
  "bestFor": {
    "filevine": "Litigation-heavy firms and legal teams that want an AI assistant embedded across every matter along with intake and deposition modules, and are willing to go through a sales process for pricing",
    "mycase": "Firms that want transparent per-user pricing with trust accounting, a client portal, and an AI assistant available from the mid-tier Pro plan",
    "rocket-matter": "Firms that want a long-established, transparently priced platform with free data migration and unlimited support included on every plan"
  },
  "highlights": [
    {
      "title": "Filevine embeds AI across the whole matter lifecycle",
      "description": "Filevine's LOIS assistant is built into the platform rather than offered as an add-on chat tool, spanning intake through depositions, which is a deeper AI integration than the assistant features MyCase and Rocket Matter document.",
      "toolSlugs": [
        "filevine",
        "mycase",
        "rocket-matter"
      ]
    },
    {
      "title": "Pricing transparency favors MyCase and Rocket Matter",
      "description": "MyCase and Rocket Matter both publish per-user monthly pricing across clear tiers, while Filevine requires contacting sales for a custom quote, which can slow down evaluation for firms that want to compare costs quickly.",
      "toolSlugs": [
        "mycase",
        "rocket-matter",
        "filevine"
      ]
    },
    {
      "title": "Trust accounting is native to MyCase and Rocket Matter",
      "description": "MyCase and Rocket Matter both build IOLTA-compliant trust accounting directly into their billing modules, while Filevine's documented features center on accounting and billing integrations rather than a native trust accounting module.",
      "toolSlugs": [
        "mycase",
        "rocket-matter",
        "filevine"
      ]
    },
    {
      "title": "Filevine adds litigation-specific modules the other two do not document",
      "description": "Filevine includes dedicated intake and depositions modules plus document assembly and contract management, functionality that is not called out in MyCase's or Rocket Matter's feature sets.",
      "toolSlugs": [
        "filevine"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Case Management",
      "rows": [
        {
          "feature": "Case or matter management",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Client intake",
          "statuses": {
            "filevine": "available",
            "mycase": "not-documented",
            "rocket-matter": "not-documented"
          }
        },
        {
          "feature": "Client portal",
          "statuses": {
            "filevine": "not-documented",
            "mycase": "available",
            "rocket-matter": "available"
          }
        }
      ]
    },
    {
      "group": "Billing and Compliance",
      "rows": [
        {
          "feature": "Trust (IOLTA) accounting",
          "statuses": {
            "filevine": "not-documented",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Time tracking and billing",
          "statuses": {
            "filevine": "limited",
            "mycase": "available",
            "rocket-matter": "available"
          },
          "note": "Filevine documents accounting and billing integrations rather than a fully native billing module"
        }
      ]
    },
    {
      "group": "Advanced Technology",
      "rows": [
        {
          "feature": "AI assistant",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "rocket-matter": "not-documented"
          },
          "note": "Filevine's LOIS is platform-wide; MyCase's 8am IQ is available from the Pro tier up"
        },
        {
          "feature": "E-signatures",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Open API and integrations",
          "statuses": {
            "filevine": "available",
            "mycase": "available",
            "rocket-matter": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Filevine's pricing compare to MyCase and Rocket Matter?",
      "answer": "Filevine only offers custom, quote-based pricing that requires talking to sales, while MyCase and Rocket Matter both publish transparent per-user monthly tiers starting around $50 and $59 per user per month respectively when billed annually."
    },
    {
      "question": "Which of the three has the deepest AI features?",
      "answer": "Filevine's LOIS assistant is built across the entire platform from intake through depositions, which is a broader AI footprint than MyCase's 8am IQ assistant available on its Pro and Advanced tiers; Rocket Matter does not document a comparable AI feature."
    },
    {
      "question": "Do MyCase and Rocket Matter both include trust accounting?",
      "answer": "Yes, both MyCase and Rocket Matter build jurisdiction-aware trust or IOLTA accounting directly into their billing modules, while Filevine's documented features focus on accounting and billing integrations instead."
    },
    {
      "question": "Is Filevine a good fit for litigation-focused firms?",
      "answer": "Filevine includes dedicated intake and depositions modules plus document assembly and contract management, which makes it particularly relevant for litigation-heavy practices compared to MyCase or Rocket Matter."
    },
    {
      "question": "Which platform is easiest to evaluate for a solo or small firm on a budget?",
      "answer": "MyCase and Rocket Matter both have published entry-level pricing near $50 to $59 per user per month, making them easier to budget for upfront than Filevine's custom quote process."
    }
  ]
};

export default filevineVsMycaseVsRocketMatterContent;
