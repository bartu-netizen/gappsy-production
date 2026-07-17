import type { ToolComparisonContent } from './types';

const activepiecesVsZapierContent: ToolComparisonContent = {
  "verdict": "Activepieces and Zapier both automate workflows across apps, but they are built for different buying decisions. Activepieces is an open source automation platform that can be run in the cloud or self-hosted, with usage-based pricing per active flow starting at $5 and a custom Ultimate tier for larger deployments with enterprise governance controls. Zapier is a cloud-only platform built around Zaps, with a free tier covering 100 tasks per month and paid plans scaling from Professional to Team to a custom Enterprise plan, plus two separately priced product lines, Zapier Agents and Zapier Chatbots, for AI-driven use cases. Teams that want control over where automation runs, care about open source code, or want a single predictable per-flow cost at scale tend to lean toward activepieces. Teams that want to start free, need a very broad integration library documented at thousands of apps, or want packaged AI agent and chatbot products without building them from scratch tend to lean toward Zapier. Neither tool is a strict upgrade over the other; the right pick depends on whether deployment flexibility and cost predictability matter more, or whether breadth of integrations and ready-made AI products matter more.",
  "bestForToolA": "Activepieces fits teams that want open source, self-hostable automation with usage-based pricing per active flow rather than a flat per-seat fee, especially organizations with enterprise governance requirements.",
  "bestForToolB": "Zapier fits teams that want to start on a free plan, need access to a very large documented library of app integrations, and want dedicated AI Agents or Chatbots products alongside core workflow automation.",
  "whoNeedsBoth": "An organization that needs Zapier for its broad integration coverage and packaged AI Agents or Chatbots on some workflows, while also wanting a self-hosted, open source option under activepieces for cost-sensitive or high-volume flows, would reasonably run both.",
  "keyDifferences": [
    {
      "title": "Deployment flexibility",
      "toolA": "Activepieces documents both cloud and self-hosted deployment options",
      "toolB": "Zapier is documented only as a cloud platform with no self-hosted option mentioned",
      "whyItMatters": "Self-hosting affects data residency, compliance, and infrastructure control",
      "benefitsWho": "Teams with strict data control or compliance needs benefit from activepieces self-hosting"
    },
    {
      "title": "Open source availability",
      "toolA": "Activepieces lists Open Source as a documented feature",
      "toolB": "Zapier has no documented open source offering",
      "whyItMatters": "Open source code allows inspection, customization, and avoids vendor lock-in",
      "benefitsWho": "Engineering-led teams that want to audit or extend the platform benefit from activepieces"
    },
    {
      "title": "Pricing structure",
      "toolA": "Activepieces charges per active flow per month, starting at $5, with zero cost per execution",
      "toolB": "Zapier uses tiered monthly plans, Free, Professional at $19.99 starting, Team at $69 starting, and custom Enterprise",
      "whyItMatters": "Per-flow pricing scales differently than per-seat tiered pricing as usage grows",
      "benefitsWho": "High-volume automators benefit from activepieces flat per-flow cost regardless of execution count; smaller teams may prefer Zapier tiered per-month plans"
    },
    {
      "title": "Free tier availability",
      "toolA": "Activepieces has no documented free plan; its lowest listed price is $5 per active flow per month",
      "toolB": "Zapier documents a Free plan at $0 per month including 100 real tasks",
      "whyItMatters": "A free tier lets buyers validate an automation before committing budget",
      "benefitsWho": "Individuals and small teams testing automation for the first time benefit from Zapier Free"
    },
    {
      "title": "Product line complexity",
      "toolA": "Activepieces is documented as a single product with Standard and Ultimate pricing tiers",
      "toolB": "Zapier documents three separate product lines, Zaps, Zapier Agents, and Zapier Chatbots, each priced independently",
      "whyItMatters": "More separately priced products can make total monthly cost harder to estimate",
      "benefitsWho": "Buyers wanting one predictable line item benefit from activepieces simpler structure; buyers wanting modular AI add-ons benefit from Zapier separate products"
    },
    {
      "title": "Integration library breadth",
      "toolA": "Activepieces documents a large integrations library called pieces, with Gmail given as a prebuilt example",
      "toolB": "Zapier documents thousands of app integrations connected via Zaps",
      "whyItMatters": "Integration count determines how many existing tools can be connected without custom work",
      "benefitsWho": "Teams needing to connect many niche or long-tail apps benefit from Zapier documented breadth"
    },
    {
      "title": "AI agent and chatbot offerings",
      "toolA": "Activepieces provided facts do not document a dedicated AI agent or chatbot product",
      "toolB": "Zapier documents Zapier Agents for autonomous multi-step tasks and Zapier Chatbots for embeddable AI chatbots, both priced separately",
      "whyItMatters": "Dedicated AI agent and chatbot products reduce the need to build these capabilities from scratch",
      "benefitsWho": "Teams wanting ready-made AI agents or chatbots benefit from Zapier documented offerings"
    },
    {
      "title": "Enterprise governance controls",
      "toolA": "Activepieces documents enterprise governance and management features for larger organizations",
      "toolB": "Zapier offers a custom-priced Enterprise plan, but the provided facts do not document specific governance features",
      "whyItMatters": "Documented governance controls matter for larger organizations evaluating security and administration needs",
      "benefitsWho": "Larger organizations with formal governance requirements benefit from activepieces documented controls"
    },
    {
      "title": "Cost predictability at scale",
      "toolA": "Activepieces pricing is usage-based per active flow, which the provided facts note can be harder to predict at scale than a flat per-seat fee",
      "toolB": "Zapier uses flat tiered monthly plans by product line, which can add complexity across Zaps, Agents, and Chatbots combined",
      "whyItMatters": "Both models have documented tradeoffs for forecasting monthly automation spend",
      "benefitsWho": "Teams with stable, predictable flow counts benefit from activepieces model; teams wanting one flat plan per product benefit from Zapier tiered plans"
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zapier is documented and known as a cloud-only SaaS platform"
        },
        {
          "feature": "Cloud-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Open source codebase",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zapier is a proprietary platform"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zapier Free plan includes 100 real tasks per month; activepieces starts at $5 per active flow"
        },
        {
          "feature": "Usage-based execution pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Activepieces charges $0 per execution beyond the flat per-flow fee"
        },
        {
          "feature": "Custom Enterprise pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Activepieces Ultimate plan and Zapier Enterprise plan are both custom priced"
        }
      ]
    },
    {
      "group": "Core Automation",
      "rows": [
        {
          "feature": "Trigger and action workflow builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Activepieces uses flows and pieces; Zapier uses Zaps"
        },
        {
          "feature": "Documented integration library size",
          "toolA": "limited",
          "toolB": "available",
          "note": "Zapier documents thousands of apps; activepieces documents a large library with Gmail as an example, no total count given"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Dedicated AI agent product",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Agents, priced separately by activity volume"
        },
        {
          "feature": "Embeddable AI chatbot builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Chatbots, priced by number deployed"
        }
      ]
    },
    {
      "group": "Governance and Enterprise",
      "rows": [
        {
          "feature": "Enterprise governance and management controls",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented for activepieces; Zapier Enterprise plan exists but specific governance features are not documented"
        },
        {
          "feature": "Named enterprise-tier plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Ultimate for activepieces, Enterprise for Zapier"
        }
      ]
    },
    {
      "group": "Getting Started",
      "rows": [
        {
          "feature": "Free tier to test before paying",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zapier Free plan covers 100 real tasks per month"
        },
        {
          "feature": "Documented FAQ on deployment options",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Activepieces FAQ confirms self-hosted and cloud support"
        }
      ]
    },
    {
      "group": "Product Structure",
      "rows": [
        {
          "feature": "Single unified product line",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zapier splits Zaps, Agents, and Chatbots into separately priced products"
        },
        {
          "feature": "Separately priced AI add-on products",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Agents and Chatbots are priced apart from core Zaps"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, activepieces or Zapier?",
      "answer": "Zapier has a lower cost of entry with a $0 Free plan covering 100 real tasks per month, while activepieces starts at $5 per active flow per month with no free tier documented; at scale, activepieces usage-based per-flow pricing may be more predictable than combining Zapier tiered plans with its separately priced Agents and Chatbots products."
    },
    {
      "question": "Is activepieces open source?",
      "answer": "Yes, activepieces is documented as an open source platform that can be deployed either self-hosted or in the cloud."
    },
    {
      "question": "Does Zapier have AI agents?",
      "answer": "Yes, Zapier offers Zapier Agents, a product for autonomous multi-step tasks that is priced separately from its core Zaps automation and by activity volume."
    },
    {
      "question": "Can activepieces be self-hosted?",
      "answer": "Yes, activepieces documentation confirms it supports both self-hosted and cloud deployment, unlike Zapier which is documented only as a cloud platform."
    },
    {
      "question": "Is Zapier good for beginners?",
      "answer": "Zapier's Free plan, which includes 100 real tasks per month, makes it accessible for beginners to validate an automation before paying, whereas activepieces has no documented free tier and starts at $5 per active flow."
    },
    {
      "question": "Which tool has more integrations, activepieces or Zapier?",
      "answer": "Zapier documents a library of thousands of app integrations, a specific figure not matched in the available activepieces facts, which describe a large integrations library called pieces with Gmail given as an example but no total count."
    }
  ]
};

export default activepiecesVsZapierContent;
