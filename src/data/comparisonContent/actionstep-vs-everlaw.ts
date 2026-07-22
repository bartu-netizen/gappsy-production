import type { ToolComparisonContent } from './types';

const actionstepVsEverlawContent: ToolComparisonContent = {
  "verdict": "Actionstep and Everlaw serve different stages of legal work. Actionstep is a day-to-day practice-management platform - matter management, billing, trust accounting, CRM - for running a midsize firm, while Everlaw is a specialized eDiscovery platform for document review, litigation, and investigations, priced by data volume with unlimited users rather than per seat.",
  "bestForToolA": "Midsize law firms needing ongoing case and matter management, client intake, billing, and trust accounting across 5,000+ firms worldwide, with AI automation for time capture and client intake.",
  "bestForToolB": "Litigation teams, corporate legal departments, and government agencies handling large-scale document review and investigations, especially those needing Deep Dive analysis on datasets exceeding 10 million documents without per-user licensing fees.",
  "whoNeedsBoth": "A litigation-heavy midsize firm plausibly needs both - Actionstep to manage the underlying matter, billing, and client relationship day-to-day, and Everlaw specifically when a matter involves large-scale document review or an investigation requiring AI-assisted eDiscovery, since Everlaw itself is used by law firms, corporate legal departments, and government agencies for exactly this purpose.",
  "keyDifferences": [
    {
      "title": "Core Use Case",
      "toolA": "Actionstep covers general practice management - matters, billing, CRM, document automation - for ongoing firm operations.",
      "toolB": "Everlaw is specialized eDiscovery for document review, litigation, and investigations, with features like Deep Dive and Storybuilder built specifically for that workflow.",
      "whyItMatters": "Choosing the right tool depends on whether the need is day-to-day firm operations or large-scale document review for a specific matter.",
      "benefitsWho": "Benefits firms clarifying whether they need an operational system (Actionstep) or a litigation-support tool (Everlaw)."
    },
    {
      "title": "Pricing Model",
      "toolA": "Actionstep is priced per user plus implementation fees, varying by region.",
      "toolB": "Everlaw uses usage-based pricing tied to the amount of data managed, with no per-user fees and unlimited user licenses included, offered as case-based or annual subscriptions.",
      "whyItMatters": "Per-user pricing scales with headcount while usage-based, data-volume pricing scales with the size of document sets under review - very different cost profiles.",
      "benefitsWho": "Benefits firms with many staff needing document access but limited data volume (Everlaw's unlimited-user model) versus firms wanting predictable per-seat costs (Actionstep)."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Actionstep applies AI to time capture, client intake assistance, and administrative tasks.",
      "toolB": "Everlaw applies AI to document review acceleration: Deep Dive analysis with direct citations, Coding Suggestions for automated first-pass categorization, and a Writing Assistant for synthesizing evidence and case strategy.",
      "whyItMatters": "The two platforms apply AI to entirely different problems - administrative efficiency versus document review speed and accuracy.",
      "benefitsWho": "Benefits firms wanting AI to reduce administrative overhead (Actionstep) versus litigation teams wanting AI to accelerate review of large document sets (Everlaw)."
    },
    {
      "title": "Trial / Evaluation Path",
      "toolA": "No free trial or free plan is mentioned for Actionstep.",
      "toolB": "No free trial or free plan is mentioned for Everlaw either; pricing requires scheduling a meeting or phone call.",
      "whyItMatters": "Neither platform allows self-serve evaluation, so buyers should budget time for a sales or demo process with both vendors.",
      "benefitsWho": "Benefits procurement teams planning evaluation timelines that include vendor demo calls for both tools."
    },
    {
      "title": "Billing Granularity for AI Features",
      "toolA": "Actionstep does not break out separate AI feature billing beyond its general per-user-plus-implementation model.",
      "toolB": "Everlaw includes single-document AI actions and the Writing Assistant in the base subscription, but batch AI actions require separately purchased credits, and unused committed credits can expire.",
      "whyItMatters": "Understanding which AI actions are bundled versus metered separately, and whether unused credits expire, affects total cost of ownership for AI-heavy workflows.",
      "benefitsWho": "Benefits firms budgeting for high-volume, AI-assisted document review where batch-processing costs could add up."
    }
  ],
  "featureMatrix": [
    {
      "group": "Practice Area Focus",
      "rows": [
        {
          "feature": "Matter / case management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Everlaw is document/evidence-centric, not general matter management"
        },
        {
          "feature": "Document review for eDiscovery",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Coding Suggestions, Predictive Coding and Clustering"
        },
        {
          "feature": "Trial preparation tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Everlaw's Storybuilder"
        },
        {
          "feature": "Billing & trust accounting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI for administrative / intake tasks",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI large-dataset analysis",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Everlaw's Deep Dive, used on 10M+ document datasets"
        },
        {
          "feature": "AI writing / case-strategy assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Everlaw's Writing Assistant"
        },
        {
          "feature": "Communication data analytics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Everlaw's Communication Visualizer"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free trial / free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Per-user pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Everlaw has no per-user fees; unlimited users"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a quote or demo"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Actionstep: iOS and Android"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Actionstep and Everlaw compete directly?",
      "answer": "Not really - Actionstep is general legal practice management, while Everlaw is specialized eDiscovery for document review and investigations, so they typically serve different needs within a firm rather than competing head-to-head."
    },
    {
      "question": "How is Everlaw priced compared to Actionstep?",
      "answer": "Everlaw uses usage-based pricing tied to data volume with no per-user fees and unlimited users; Actionstep is priced per user plus implementation fees, varying by region."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "No, neither Actionstep nor Everlaw mentions a free trial or free plan; both require a sales conversation for pricing."
    },
    {
      "question": "What kind of AI does Everlaw offer?",
      "answer": "Everlaw's AI includes Deep Dive (analysis of datasets exceeding 10 million documents with direct citations), Coding Suggestions for automated first-pass review, and a Writing Assistant for evidence synthesis and case strategy."
    },
    {
      "question": "Are Everlaw's AI features included in the subscription?",
      "answer": "Single-document AI actions and the Writing Assistant are included at no extra cost; batch AI actions require separately purchased credits, which can expire if unused."
    },
    {
      "question": "Who typically uses each platform?",
      "answer": "Actionstep is used by 5,000+ law firms worldwide for day-to-day practice management; Everlaw is used by law firms, corporate legal departments, and government agencies for litigation, investigations, and FOIA requests."
    }
  ]
};

export default actionstepVsEverlawContent;
