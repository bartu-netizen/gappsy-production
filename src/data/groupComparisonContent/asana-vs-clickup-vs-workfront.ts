import type { GroupComparisonContent } from './types';

const asanaVsClickupVsWorkfrontContent: GroupComparisonContent = {
  "verdict": "Asana and ClickUp both publish transparent, self-serve pricing and target teams of nearly any size, while Adobe Workfront is a heavier, quote-only enterprise platform built for large marketing and creative operations that already live inside the Adobe ecosystem. Workfront trades accessibility for deep portfolio governance, resource management, and creative proofing workflows tied to Adobe Creative Cloud, whereas Asana and ClickUp let smaller teams get started immediately without a sales conversation.",
  "bestFor": {
    "asana": "Cross-functional teams wanting self-serve pricing, AI Teammates, and strong third-party integrations without a lengthy sales process.",
    "clickup": "Teams wanting an all-in-one, budget-friendly workspace combining tasks, docs, chat, and whiteboards.",
    "workfront": "Large marketing and creative operations teams already inside the Adobe ecosystem that need enterprise-grade portfolio governance and proofing workflows."
  },
  "highlights": [
    {
      "title": "Adobe Ecosystem Integration",
      "description": "Workfront is sold as part of Adobe's Digital Experience Business Group and integrates tightly with Adobe Experience Manager, Creative Cloud, and Workfront Fusion automation.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Self-Serve, Transparent Pricing",
      "description": "Asana and ClickUp both publish per-user pricing that teams can buy directly online, unlike Workfront's quote-only Select, Prime, and Ultimate tiers.",
      "toolSlugs": [
        "asana",
        "clickup"
      ]
    },
    {
      "title": "All-in-One Workspace",
      "description": "ClickUp bundles Docs, Whiteboards, Chat, Goals, and Dashboards alongside tasks in a single configurable workspace.",
      "toolSlugs": [
        "clickup"
      ]
    },
    {
      "title": "Creative Proofing and Approval Workflows",
      "description": "Workfront's built-in markup, versioning, and approval tools are purpose-built for marketing and creative review cycles at enterprise scale.",
      "toolSlugs": [
        "workfront"
      ]
    },
    {
      "title": "Enterprise Portfolio Governance",
      "description": "Asana's Enterprise+ tier and Workfront's Prime and Ultimate tiers both add advanced portfolio planning, security, and compliance controls for large organizations.",
      "toolSlugs": [
        "asana",
        "workfront"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "workfront": "unavailable"
          },
          "note": "Workfront pricing is custom and quote-based; third-party estimates place it around $49 to $99 per user per month billed annually."
        },
        {
          "feature": "Free plan",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "workfront": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Creative and Approval Workflows",
      "rows": [
        {
          "feature": "Proofing and digital asset review",
          "statuses": {
            "asana": "not-documented",
            "clickup": "not-documented",
            "workfront": "available"
          }
        },
        {
          "feature": "Configurable approval chains",
          "statuses": {
            "asana": "not-documented",
            "clickup": "available",
            "workfront": "available"
          },
          "note": "ClickUp supports rule-based automations for status changes; Workfront offers dedicated multi-stage approval workflows."
        }
      ]
    },
    {
      "group": "Resourcing and Portfolio",
      "rows": [
        {
          "feature": "Resource or capacity management",
          "statuses": {
            "asana": "available",
            "clickup": "not-documented",
            "workfront": "available"
          },
          "note": "Asana's workload tracking is available on its Advanced plan and above."
        },
        {
          "feature": "Portfolio-level reporting",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "workfront": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "workfront": "not-documented"
          },
          "note": "ClickUp Brain is priced as an add-on rather than bundled into base plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does Adobe Workfront cost?",
      "answer": "Adobe does not publish list prices for Workfront; it is sold on custom, quote-based contracts across Select, Prime, and Ultimate tiers. Third-party analyses estimate typical costs around $49 to $99 per user per month billed annually, plus potentially significant implementation and onboarding fees."
    },
    {
      "question": "Is there a free version of Workfront?",
      "answer": "No. Workfront has no documented free plan; all three of its tiers are quote-based annual contracts, unlike Asana and ClickUp, which both offer permanent free plans."
    },
    {
      "question": "Which is best for creative review and approval workflows?",
      "answer": "Workfront, with built-in proofing, markup, and versioning tools purpose-built for marketing and creative review cycles. ClickUp offers configurable automations that can support approval-style workflows, but neither Asana nor ClickUp document dedicated proofing tools."
    },
    {
      "question": "Which is cheaper for a small team, Asana, ClickUp, or Workfront?",
      "answer": "Asana and ClickUp are both far cheaper entry points, with free plans and self-serve paid tiers starting around $7 to $11 per user per month. Workfront is aimed at mid-market and enterprise organizations and is not priced for small teams."
    },
    {
      "question": "Does Workfront integrate with Adobe Creative Cloud?",
      "answer": "Yes. Workfront is part of Adobe's Digital Experience Business Group and is commonly bundled or integrated with Adobe Experience Manager, Adobe Creative Cloud, and Workfront Fusion, its automation and integration layer."
    },
    {
      "question": "Which of the three has AI features built in?",
      "answer": "Asana includes AI Teammates and AI Studio, and ClickUp offers ClickUp Brain as a paid add-on. A built-in AI assistant is not documented in Workfront's feature set."
    }
  ]
};

export default asanaVsClickupVsWorkfrontContent;
