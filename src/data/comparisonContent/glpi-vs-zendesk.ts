import type { ToolComparisonContent } from './types';

const glpiVsZendeskContent: ToolComparisonContent = {
  "verdict": "GLPI is an open-source ITSM platform combining helpdesk ticketing with asset management and a CMDB, free to self-host with paid GLPI Network Cloud or plugin tiers for added capacity, while Zendesk is a paid, AI-driven customer service platform unifying ticketing, live chat, messaging, and voice, with built-in AI agents from the Suite Team plan upward. GLPI leans toward internal IT service management, while Zendesk leans toward customer-facing omnichannel support with AI-assisted resolution.",
  "bestForToolA": "IT departments wanting a free, self-hostable platform that unifies ticketing with asset and inventory tracking and a CMDB, or that prefer per-agent cloud pricing starting at €19/month.",
  "bestForToolB": "Customer support teams wanting an omnichannel platform (ticketing, live chat, messaging, voice) with built-in AI agents for automated first response, available from the Suite Team plan at €55/agent/month upward.",
  "whoNeedsBoth": "An organization could run GLPI internally to manage IT assets, infrastructure, and internal IT tickets while using Zendesk for external, customer-facing omnichannel support with AI agents — GLPI serving internal IT operations and Zendesk serving customer service, two different audiences within the same company.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "GLPI's core is free to self-host, with GLPI Network Public Cloud starting at €19/month per IT agent and self-hosted plugin add-ons from €100/month (Basic) to €1,000/month (Advanced).",
      "toolB": "Zendesk starts at €19/agent/month for the entry Support Team plan, rising to €55/agent/month for Suite Team, €115/agent/month for Suite Professional, and custom pricing for Suite Enterprise + Copilot.",
      "whyItMatters": "Both have a similar entry price point, but what that price unlocks differs substantially.",
      "benefitsWho": "Budget-conscious teams comparing what functionality comes at the entry tier."
    },
    {
      "title": "AI Capabilities",
      "toolA": "GLPI's documented features don't include AI capabilities.",
      "toolB": "Zendesk includes built-in AI agents for automated first-response handling from the Suite Team plan and above, plus separately-priced add-ons (Copilot, Workforce Engagement, Contact Center).",
      "whyItMatters": "AI-assisted resolution can significantly reduce response time and agent workload for customer-facing support.",
      "benefitsWho": "Customer support teams handling high ticket volumes."
    },
    {
      "title": "Omnichannel Support",
      "toolA": "GLPI's core support feature is helpdesk and ticket management alongside IT asset and infrastructure tracking, without documented live chat, messaging, or voice channels.",
      "toolB": "Zendesk unifies ticketing, live chat, messaging, and voice in one system across its Suite plans.",
      "whyItMatters": "Omnichannel coverage determines how many customer touchpoints a single platform can serve.",
      "benefitsWho": "Customer service teams supporting customers across multiple channels."
    },
    {
      "title": "IT Asset & Infrastructure Management",
      "toolA": "GLPI includes a CMDB, asset and inventory management, and agentless cloud inventory scanning as core platform features.",
      "toolB": "Zendesk's documented features are customer-support-channel focused without asset or CMDB functionality.",
      "whyItMatters": "GLPI covers IT asset lifecycle tracking that a pure customer-support platform doesn't address.",
      "benefitsWho": "IT departments needing infrastructure and asset visibility alongside ticketing."
    },
    {
      "title": "Entry-Tier Limitations",
      "toolA": "GLPI's free self-hosted core includes ticketing, asset management, CMDB, and workflow automation, though advanced plugin tiers (Standard, Advanced) require paid GLPI Network subscriptions starting at €100/month.",
      "toolB": "Zendesk's entry-level Support Team plan lacks the omnichannel and AI capabilities of the Suite tiers, requiring an upgrade to Suite Team (€55/agent/month) or above for full functionality.",
      "whyItMatters": "Both products gate their most valuable capabilities behind higher tiers, but the specific gates differ.",
      "benefitsWho": "Buyers who need to budget for the tier that actually includes the features they need."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Entry plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "GLPI: €19/mo per IT agent cloud; Zendesk: €19/agent/mo Support Team"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "GLPI: 45 days; Zendesk: 14 days"
        },
        {
          "feature": "Mid-tier plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "GLPI Private Cloud: €21/mo per IT agent (min 25 agents); Zendesk Suite Team: €55/agent/mo"
        }
      ]
    },
    {
      "group": "Support Channels",
      "rows": [
        {
          "feature": "Ticketing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live chat",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Voice support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in AI agents for first response",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Zendesk: from Suite Team plan"
        }
      ]
    },
    {
      "group": "IT Asset & Infrastructure Management",
      "rows": [
        {
          "feature": "CMDB",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Asset / inventory management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Agentless cloud inventory",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GLPI: iOS and Android"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, GLPI or Zendesk?",
      "answer": "GLPI's core is free to self-host with cloud plans from €19/month per IT agent. Zendesk's entry Support Team plan is also €19/agent/month but lacks omnichannel and AI features found in Suite plans starting at €55/agent/month."
    },
    {
      "question": "Does GLPI include AI agents like Zendesk?",
      "answer": "Not per the documented facts — GLPI's features focus on ticketing, asset management, CMDB, and workflow automation without AI capabilities, while Zendesk includes built-in AI agents from Suite Team upward."
    },
    {
      "question": "Does Zendesk include asset management or a CMDB?",
      "answer": "No. Zendesk's documented features are omnichannel support and AI agents, not asset or CMDB tracking."
    },
    {
      "question": "Can GLPI be self-hosted for free?",
      "answer": "Yes. GLPI's core platform is free and open source (GPL-3.0) to self-host."
    },
    {
      "question": "Does Zendesk offer a free trial?",
      "answer": "Yes, a 14-day free trial is available."
    },
    {
      "question": "Do all Zendesk plans include AI and omnichannel support?",
      "answer": "No. The entry-level Support Team plan lacks the omnichannel and AI capabilities present in the Suite tiers."
    }
  ]
};

export default glpiVsZendeskContent;
