import type { ToolComparisonContent } from './types';

const automatischVsZapierContent: ToolComparisonContent = {
  "verdict": "automatisch and Zapier both automate workflows between apps, but they serve different buyers making different tradeoffs. automatisch is an open-source, self-hostable automation platform built for teams that want full control over their automation infrastructure and want to avoid ongoing subscription costs or vendor lock-in tied to a closed SaaS product. It ships with a documented set of app integrations and no listed pricing plans, reflecting its free and open-source model, though that also means it currently has no documented AI agent or chatbot capabilities. Zapier is a hosted, no-code automation platform built around thousands of app integrations, with three distinct product lines: Zaps for classic trigger-and-action workflows, Zapier Agents for autonomous multi-step AI tasks, and Zapier Chatbots for embeddable AI assistants. Its free plan includes 100 real tasks per month, enough to test an automation before committing to a paid tier, but Agents and Chatbots are billed separately from core Zaps, which adds complexity when estimating total monthly spend. Teams that want a zero-cost, self-hosted foundation for straightforward automations with full ownership of the stack are better served by automatisch. Teams that need broad integration coverage, a hosted experience with no infrastructure to manage, and purpose-built AI agent or chatbot products are better served by Zapier, provided they are comfortable managing multiple pricing lines as usage grows.",
  "bestForToolA": "automatisch fits teams that want a free, self-hosted, open-source automation platform and are willing to manage their own infrastructure to avoid recurring SaaS fees and vendor lock-in.",
  "bestForToolB": "Zapier fits teams that want a hosted, no-code platform with broad app integration coverage plus dedicated AI agent and chatbot products, and who are comfortable managing multiple separate pricing lines as usage grows.",
  "whoNeedsBoth": "Organizations that want a free self-hosted option for core internal workflows but also need Zapier specific AI Agents, Chatbots, or its broader hosted integration catalog for customer-facing automations may end up running both tools side by side.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Free and open source, with no listed pricing plans",
      "toolB": "Freemium, with a free plan plus paid Professional, Team, and Enterprise tiers",
      "whyItMatters": "It determines whether cost scales with usage or stays fixed at zero regardless of scale",
      "benefitsWho": "Budget-constrained teams and self-hosters benefit from automatisch; teams that want a supported, tiered upgrade path benefit from Zapier"
    },
    {
      "title": "Deployment model",
      "toolA": "Self-hostable, so the platform runs on infrastructure the user controls",
      "toolB": "A hosted SaaS product with no documented self-hosting option",
      "whyItMatters": "Self-hosting affects data control, compliance posture, and ongoing maintenance responsibility",
      "benefitsWho": "Teams with infrastructure resources and data control requirements benefit from automatisch; teams that want zero maintenance benefit from Zapier"
    },
    {
      "title": "Source code openness",
      "toolA": "Open source",
      "toolB": "Closed source, positioned by automatisch as the type of SaaS it offers an alternative to",
      "whyItMatters": "Open source allows inspection, customization, and avoids dependency on a single vendor continuing to operate the product",
      "benefitsWho": "Developers and organizations wary of vendor lock-in benefit from automatisch"
    },
    {
      "title": "Product scope",
      "toolA": "A single open-source workflow automation product",
      "toolB": "Three distinct product lines: Zaps, Zapier Agents, and Zapier Chatbots",
      "whyItMatters": "A broader product lineup can cover more use cases but also means more separate things to learn, configure, and pay for",
      "benefitsWho": "Teams needing only core automation benefit from automatisch simplicity; teams needing AI agents or chatbots benefit from Zapier breadth"
    },
    {
      "title": "AI capabilities",
      "toolA": "No documented AI agent or chatbot features",
      "toolB": "Zapier Agents for autonomous multi-step tasks and Zapier Chatbots for embeddable AI chatbots, each priced separately",
      "whyItMatters": "Teams wanting built-in AI automation without adopting a separate tool need this covered by their automation platform",
      "benefitsWho": "Teams wanting AI agents or chatbots benefit from Zapier; teams with no AI requirement are unaffected by automatisch not having it"
    },
    {
      "title": "Cost predictability",
      "toolA": "One free, open-source product with no documented add-on pricing",
      "toolB": "Agents and Chatbots are priced as separate products from core Zaps, adding complexity to estimating total monthly cost",
      "whyItMatters": "Multiple pricing lines make budgeting harder as AI usage scales alongside core automation usage",
      "benefitsWho": "Teams wanting simple, predictable costs benefit from automatisch; teams needing Zapier AI products must budget for them separately"
    },
    {
      "title": "Free-tier usability",
      "toolA": "Free and open source with no cost to start, since there are no listed paid plans",
      "toolB": "Free plan includes 100 real tasks per month, enough to validate an automation before paying",
      "whyItMatters": "It affects how easily a team can test the platform before committing budget",
      "benefitsWho": "Cost-sensitive teams benefit from automatisch having no cost floor; teams wanting a hosted trial benefit from Zapier's free task allowance"
    },
    {
      "title": "Integration breadth documentation",
      "toolA": "A documented list of available app integrations, with no specific count stated",
      "toolB": "Thousands of app integrations connected via Zaps",
      "whyItMatters": "The number and range of supported apps directly affects whether a team's existing tool stack can be automated",
      "benefitsWho": "Teams needing very broad third-party app coverage benefit from Zapier's documented scale"
    },
    {
      "title": "Enterprise and team plans",
      "toolA": "No enterprise or team-tier plan documented",
      "toolB": "Team plan starting at $69 per month and an Enterprise plan with custom pricing",
      "whyItMatters": "Larger organizations often need dedicated support, seats, or admin controls bundled into a formal plan",
      "benefitsWho": "Larger organizations needing formal enterprise contracts benefit from Zapier; smaller self-managed teams are unaffected by automatisch lacking this tier"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Automation Capabilities",
      "rows": [
        {
          "feature": "Trigger-and-action workflow automation",
          "toolA": "available",
          "toolB": "available",
          "note": "automatisch is a general workflow automation platform; Zapier calls this feature Zaps"
        },
        {
          "feature": "App integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "automatisch offers a documented list of integrations with no specific count stated; Zapier documents thousands of app integrations"
        }
      ]
    },
    {
      "group": "AI Product Lines",
      "rows": [
        {
          "feature": "Autonomous AI agents for multi-step tasks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Agents, priced separately by activity volume"
        },
        {
          "feature": "Embeddable AI chatbots",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Chatbots, priced by number deployed"
        }
      ]
    },
    {
      "group": "Deployment and Source Model",
      "rows": [
        {
          "feature": "Self-hosting support",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zapier is a hosted cloud SaaS with no documented self-hosting option"
        },
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "automatisch is positioned as the open-source alternative to closed SaaS tools like Zapier"
        }
      ]
    },
    {
      "group": "Free and Entry-Level Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "automatisch is free and open source with no paid tiers documented; Zapier's Free plan is $0 per month"
        },
        {
          "feature": "Entry-level paid tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zapier Professional starts at $19.99 per month; automatisch has no pricing plans documented"
        }
      ]
    },
    {
      "group": "Team and Enterprise Pricing",
      "rows": [
        {
          "feature": "Team plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Team starts at $69 per month"
        },
        {
          "feature": "Enterprise or custom pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zapier Enterprise uses custom pricing"
        }
      ]
    },
    {
      "group": "Cost Predictability",
      "rows": [
        {
          "feature": "Single unified price covering all product features",
          "toolA": "available",
          "toolB": "limited",
          "note": "Zapier Agents and Chatbots are priced separately from core Zaps"
        },
        {
          "feature": "Free-tier usable before financial commitment",
          "toolA": "available",
          "toolB": "available",
          "note": "automatisch has no cost to start; Zapier's free plan includes 100 real tasks per month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is automatisch or Zapier cheaper?",
      "answer": "automatisch is cheaper on paper because it is free and open source with no documented paid plans, while Zapier is freemium with a free plan capped at 100 real tasks per month and paid tiers starting at $19.99 per month for Professional and $69 per month for Team, plus custom Enterprise pricing."
    },
    {
      "question": "Can automatisch do what Zapier does?",
      "answer": "automatisch covers the same core trigger-and-action workflow automation as Zapier through its own documented app integrations, but it does not have documented equivalents to Zapier Agents or Zapier Chatbots."
    },
    {
      "question": "Is automatisch open source?",
      "answer": "Yes, automatisch is an open-source, self-hostable workflow automation tool according to its own documentation."
    },
    {
      "question": "Does Zapier offer AI features?",
      "answer": "Yes, Zapier offers two AI-specific product lines beyond its core Zaps automation, Zapier Agents for autonomous multi-step tasks and Zapier Chatbots for embeddable AI chatbots, both priced separately from Zaps."
    },
    {
      "question": "Is Zapier good for testing an automation before paying?",
      "answer": "Yes, Zapier's free plan includes 100 real tasks per month, which is documented as enough to validate an automation before committing to a paid subscription."
    },
    {
      "question": "Can I self-host Zapier or automatisch?",
      "answer": "automatisch is built to be self-hosted, while Zapier is a hosted SaaS product with no documented self-hosting option."
    }
  ]
};

export default automatischVsZapierContent;
