import type { GroupComparisonContent } from './types';

const hulyVsKanboardVsWrikeContent: GroupComparisonContent = {
  "verdict": "Huly and Kanboard are open-source, self-hostable tools aimed at teams that want to own their infrastructure, while Wrike is a mature commercial cloud platform with deep Gantt, dashboard, and resource-management capabilities plus more than 400 integrations that neither open-source option documents. The trade-off is straightforward: self-hosted control and zero licensing cost versus a polished managed SaaS product with far broader integration and reporting depth at per-user pricing on paid tiers.",
  "bestFor": {
    "huly": "Teams wanting a self-hosted, all-in-one alternative combining issue tracking, docs, chat, and video.",
    "kanboard": "Developers who want the lightest possible self-hosted kanban board at zero cost.",
    "wrike": "Cross-functional teams needing deep Gantt, dashboard, and resource management plus hundreds of integrations without managing their own servers."
  },
  "highlights": [
    {
      "title": "Open source and self-hostable",
      "description": "Huly and Kanboard can both be deployed on a team's own infrastructure at no licensing cost, an option Wrike does not offer.",
      "toolSlugs": [
        "huly",
        "kanboard"
      ]
    },
    {
      "title": "Free plan for unlimited users",
      "description": "Kanboard is entirely free to self-host with no user limits, and Wrike's cloud free plan also supports unlimited users on basic boards and tables.",
      "toolSlugs": [
        "kanboard",
        "wrike"
      ]
    },
    {
      "title": "Deep resource and workload management",
      "description": "Wrike offers dedicated resource management for visualizing team capacity and rebalancing assignments across concurrent projects, a module neither open-source tool documents.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Extensive third-party integrations",
      "description": "Wrike connects to more than 400 external tools, including Slack, Salesforce, Jira, and a deep Adobe Creative Cloud integration, far beyond what Huly or Kanboard document.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "All-in-one workspace",
      "description": "Huly bundles issue tracking with docs, chat, and video conferencing into one connected platform rather than requiring separate tools.",
      "toolSlugs": [
        "huly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "wrike": "unavailable"
          }
        },
        {
          "feature": "Official vendor-managed cloud",
          "statuses": {
            "huly": "available",
            "kanboard": "unavailable",
            "wrike": "available"
          },
          "note": "Kanboard has no official vendor cloud; third-party hosts sell managed Kanboard instances instead."
        }
      ]
    },
    {
      "group": "Planning and Visualization",
      "rows": [
        {
          "feature": "Gantt or timeline views with dependencies",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "limited",
            "wrike": "available"
          },
          "note": "Kanboard includes basic Gantt and calendar views, while Wrike offers full dependency tracking and automatic critical path recalculation."
        },
        {
          "feature": "Resource and workload management",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "wrike": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Built-in chat or video conferencing",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "wrike": "not-documented"
          }
        },
        {
          "feature": "Proofing and approval tools",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "wrike": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations and Pricing",
      "rows": [
        {
          "feature": "Broad third-party integration library",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "wrike": "available"
          },
          "note": "Huly documents integrations with GitHub, Gmail, and Google Calendar; Wrike documents more than 400 connected tools."
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "wrike": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Wrike be self-hosted like Huly and Kanboard?",
      "answer": "No. Wrike is a cloud-only SaaS platform, while Huly and Kanboard are both open source and can be deployed on a team's own infrastructure."
    },
    {
      "question": "Which of these three has the deepest resource management?",
      "answer": "Wrike, which includes dedicated workload and capacity management for balancing assignments across teams, a feature neither Huly nor Kanboard documents."
    },
    {
      "question": "Does Kanboard offer any integrations?",
      "answer": "Yes, through a REST or JSON-RPC API and a community plugin ecosystem, but it does not document anywhere near the 400-plus integrations Wrike offers."
    },
    {
      "question": "Is there a free plan for each of these tools?",
      "answer": "Yes. Kanboard is free to self-host, Huly offers a free hosted Common plan plus free self-hosting, and Wrike has a free cloud plan with unlimited users for basic use cases."
    },
    {
      "question": "Which tool includes native chat and video calls?",
      "answer": "Huly, through its built-in messaging and virtual office video rooms; Kanboard and Wrike do not document native chat or video conferencing."
    },
    {
      "question": "Which is better suited to marketing or creative teams needing proofing?",
      "answer": "Wrike, which includes dedicated proofing and approval tools for reviewing creative assets, a feature not documented in Huly or Kanboard."
    }
  ]
};

export default hulyVsKanboardVsWrikeContent;
