import type { ToolComparisonContent } from './types';

const activepiecesVsStackstormContent: ToolComparisonContent = {
  "verdict": "activepieces is a paid business process automation platform, starting at $5/active flow/month, that connects everyday apps across HR, finance, marketing, and sales, with both cloud and self-hosted deployment. StackStorm is a free, community/donation-supported open-source event-driven automation platform built specifically for IT/DevOps, using sensors, triggers, rules, and workflows to react to events. The core split is cost model and domain: a paid cross-department workflow tool versus a free, IT-operations-focused event automation engine.",
  "bestForToolA": "Teams across HR, finance, marketing, and sales that want to automate workflows connecting everyday business apps like Gmail, with predictable per-flow pricing and either cloud or self-hosted deployment, fit activepieces best.",
  "bestForToolB": "IT/DevOps teams that need event-driven automation — sensors detecting events, rules triggering actions, and workflows handling incident response — at no licensing cost fit StackStorm best.",
  "whoNeedsBoth": "An IT/DevOps team could rely on StackStorm for event-driven infrastructure automation, such as alert-triggered remediation, while other departments in the same company use activepieces to automate their own non-technical workflows like HR onboarding or marketing campaigns.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "activepieces is a paid product, with the Standard plan starting at $5/active flow/month and $0 per execution, plus custom Ultimate annual contracts.",
      "toolB": "StackStorm is entirely free and open source, supported by its community and donations, with no paid tiers documented.",
      "whyItMatters": "Licensing cost is often the first filter for teams choosing an automation platform, especially at scale.",
      "benefitsWho": "Cost-sensitive IT teams benefit from StackStorm's zero licensing cost; teams wanting a supported commercial product may prefer activepieces despite the cost."
    },
    {
      "title": "Target Domain",
      "toolA": "activepieces targets broad, cross-department business automation spanning HR, finance, marketing, and sales, alongside IT.",
      "toolB": "StackStorm is purpose-built for IT/DevOps event-driven automation, using sensors, triggers, actions, rules, and workflows.",
      "whyItMatters": "A domain-specific tool is often deeper for its use case, while a general tool covers more ground across departments.",
      "benefitsWho": "IT/DevOps engineers benefit from StackStorm's specialized event architecture; multi-department operations teams benefit from activepieces' broader scope."
    },
    {
      "title": "Automation Architecture",
      "toolA": "activepieces is organized around flows and a large integrations library ('pieces') like Gmail, rather than an explicit sensor/rule/event model.",
      "toolB": "StackStorm's architecture is explicitly event-driven: sensors detect events, rules evaluate conditions, and actions/workflows respond — framed as a 'Robust If This, Then That Platform' for IT operations.",
      "whyItMatters": "Event-driven architectures are often better suited to real-time infrastructure response than flow-based business automation.",
      "benefitsWho": "DevOps/SRE teams needing real-time, event-triggered responses benefit from StackStorm's sensor/rule model."
    },
    {
      "title": "Deployment & Cost Predictability",
      "toolA": "activepieces offers both cloud and self-hosted deployment with usage-based per-active-flow pricing and $0 per execution once on a plan.",
      "toolB": "As free/open-source software, StackStorm has no licensing cost to predict at all, regardless of deployment scale.",
      "whyItMatters": "Cost predictability at scale differs significantly between a per-flow paid model and a licensing-free open-source model.",
      "benefitsWho": "Teams automating at very large scale with tight budgets benefit from StackStorm's zero-cost licensing."
    },
    {
      "title": "Enterprise Governance",
      "toolA": "activepieces documents enterprise governance controls aimed at larger organizations.",
      "toolB": "StackStorm's documented differentiators are published real-world case studies and published security practices, rather than dedicated enterprise governance tooling.",
      "whyItMatters": "Larger organizations often require explicit governance features for compliance and administration.",
      "benefitsWho": "Larger enterprises needing formal governance controls benefit from activepieces' documented enterprise features."
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation Architecture",
      "rows": [
        {
          "feature": "Event-driven sensors/triggers",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Flow-based automation with app integrations",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Rules engine",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Workflow automation",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free / open source",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Paid plans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "activepieces Standard $5/active flow/month"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cloud-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Enterprise Readiness",
      "rows": [
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published security practices",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published case studies",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Target domain breadth (IT + business functions)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "StackStorm is IT/DevOps-focused only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is StackStorm free to use?",
      "answer": "Yes, it's a community/donation-supported open-source automation platform with no paid tiers documented."
    },
    {
      "question": "How does activepieces pricing compare to StackStorm's?",
      "answer": "activepieces starts at $5/active flow/month (Standard plan) plus custom Ultimate contracts. StackStorm has no licensing cost since it's free and open source."
    },
    {
      "question": "Which tool is built specifically for IT/DevOps?",
      "answer": "StackStorm, with its sensors, triggers, rules, and workflows purpose-built for event-driven IT automation."
    },
    {
      "question": "Does activepieces serve non-IT teams?",
      "answer": "Yes, its stated purpose covers HR, finance, marketing, and sales in addition to IT."
    },
    {
      "question": "Does StackStorm publish real-world case studies?",
      "answer": "Yes, it publishes case studies from production deployments as part of its documented track record."
    },
    {
      "question": "Which tool documents enterprise governance controls?",
      "answer": "activepieces documents enterprise governance controls for larger organizations; this is not documented as a StackStorm feature."
    }
  ]
};

export default activepiecesVsStackstormContent;
