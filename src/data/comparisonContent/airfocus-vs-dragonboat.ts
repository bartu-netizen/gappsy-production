import type { ToolComparisonContent } from './types';

const airfocusVsDragonboatContent: ToolComparisonContent = {
  "verdict": "airfocus and Dragonboat both target product portfolio management for larger organizations, but they emphasize different things: airfocus leans on AI-assisted prioritization and an MCP server that plugs into external AI tools like Claude and Copilot, while Dragonboat frames itself as a 'portfolio operating system' with its own Ambient Agent and a headless API/MCP layer for connecting AI agents directly to portfolio data. Neither publishes pricing, and both require a sales conversation to evaluate cost.",
  "bestForToolA": "Product teams inside larger organizations (airfocus is backed by Lucid Software) that want AI-assisted prioritization, portfolio roadmaps with dependency tracking, and the option to work through Claude or Copilot via airfocus's MCP server.",
  "bestForToolB": "Enterprise product organizations that want a live semantic source of truth connecting strategy, intake, planning, and delivery tools, with SOC 2 certification and free read-only access for up to 100 users on the Starter plan.",
  "whoNeedsBoth": "There is no realistic scenario for using both together — they are direct competitors covering the same portfolio management and prioritization job, so a team would choose one, not run both in parallel.",
  "keyDifferences": [
    {
      "title": "AI Agent Architecture",
      "toolA": "airfocus includes an AI agent for feedback triage, an insights agent on the Enterprise plan, and an MCP server that lets external tools like Claude and Copilot work with airfocus data.",
      "toolB": "Dragonboat provides its own Ambient Agent that automatically tracks and reports across the product development lifecycle, plus a headless API and MCP access so AI agents can read and act on portfolio data directly.",
      "whyItMatters": "The direction of AI integration differs: airfocus is built to be used by external AI assistants, while Dragonboat's Ambient Agent actively works inside the product lifecycle on its own.",
      "benefitsWho": "Teams already standardized on Claude or Copilot workflows may prefer airfocus's MCP approach; teams wanting automated cross-tool reporting may prefer Dragonboat's Ambient Agent."
    },
    {
      "title": "Free / Entry-Level Access",
      "toolA": "airfocus offers no free trial; evaluating the product requires booking a demo, and both the Professional and Enterprise plans are priced on request.",
      "toolB": "Dragonboat's Starter plan includes free read-only and requestor access for up to 100 users, with paid access reserved for editors.",
      "whyItMatters": "Free read-only access lowers the barrier for stakeholders across a large organization to view portfolio data without a full paid seat.",
      "benefitsWho": "Large organizations that need many viewers/requestors (executives, cross-functional stakeholders) but only a smaller number of paid editors."
    },
    {
      "title": "Security & Compliance Disclosure",
      "toolA": "airfocus's security certifications are not documented in its public materials, though it does offer an EU-based hosting option.",
      "toolB": "Dragonboat states it is SOC 2 certified and explicitly states customer data is not used for external model training.",
      "whyItMatters": "Explicit SOC 2 certification and a stated AI training policy matter for enterprise security reviews and procurement.",
      "benefitsWho": "Security and IT teams running vendor risk assessments before rolling out a portfolio tool org-wide."
    },
    {
      "title": "Portfolio & Prioritization Scope",
      "toolA": "airfocus covers OKRs, portfolio roadmaps with dependency tracking, customer feedback with a branded portal, and risk/drift detection.",
      "toolB": "Dragonboat covers Strategies and Outcomes connecting OKRs to roadmaps, real-time impact analysis for ripple effects and risk, and centralized customer insights.",
      "whyItMatters": "Both cover similar ground (OKRs, roadmaps, risk detection, customer insight), so the differentiator becomes execution details like AI depth and access model rather than feature checklist coverage.",
      "benefitsWho": "Product operations leaders comparing near-identical feature sets need to weigh secondary factors like pricing structure and integration depth."
    },
    {
      "title": "Enterprise-Only Gating",
      "toolA": "airfocus reserves Jira Server, Azure DevOps Server, and Salesforce integrations, plus SSO/SCIM and portal SSO, for its Enterprise tier only.",
      "toolB": "Dragonboat reserves two-factor authentication, SSO, and a dedicated Customer Success Manager for its Enterprise tier only, while Starter includes core integrations with Jira, Azure DevOps, Asana, and Slack.",
      "whyItMatters": "Knowing which security and integration features require the top tier avoids surprises during procurement.",
      "benefitsWho": "IT and security teams who require SSO as a baseline requirement before rollout."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-powered prioritization/insights agent",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dedicated autonomous agent (lifecycle tracking)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Dragonboat's Ambient Agent"
        },
        {
          "feature": "MCP server for external AI tools",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Headless API for AI agent access",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Portfolio & Planning",
      "rows": [
        {
          "feature": "OKRs and objectives tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Cross-product roadmaps with dependencies",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time risk/impact detection",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Customer feedback portal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "airfocus offers a branded customer portal"
        }
      ]
    },
    {
      "group": "Pricing, Access & Compliance",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both are contact-sales only"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither offers a free trial; airfocus offers a demo"
        },
        {
          "feature": "Free read-only/viewer access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Dragonboat Starter: up to 100 free viewers"
        },
        {
          "feature": "SOC 2 certification stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO/SCIM",
          "toolA": "available",
          "toolB": "available",
          "note": "Both reserve this for Enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do airfocus and Dragonboat publish pricing?",
      "answer": "No, neither publishes pricing. Both airfocus's Professional/Enterprise plans and Dragonboat's Starter/Enterprise plans require contacting sales."
    },
    {
      "question": "Can I try either tool for free?",
      "answer": "Neither offers a traditional free trial. airfocus requires booking a demo. Dragonboat doesn't mention a free trial, but its Starter plan does include free read-only and requestor access for up to 100 users."
    },
    {
      "question": "Which tool has more mature AI agent support?",
      "answer": "Both offer MCP servers for connecting external AI tools like Claude and Copilot. Dragonboat additionally has its own Ambient Agent that autonomously tracks and reports across the product development lifecycle, plus a headless API specifically built for AI agent access."
    },
    {
      "question": "Is either tool SOC 2 certified?",
      "answer": "Dragonboat states it is SOC 2 certified and does not use customer data to train external models. SOC 2 status is not documented for airfocus, though it does offer an EU-based hosting option."
    },
    {
      "question": "Who owns airfocus and Dragonboat?",
      "answer": "airfocus is part of Lucid Software, a larger visual collaboration company. Dragonboat's ownership structure is not detailed in its public materials."
    },
    {
      "question": "Which tool is better for organizations with many casual viewers?",
      "answer": "Dragonboat's Starter plan explicitly includes free read-only and requestor access for up to 100 users, which suits organizations with many stakeholders who only need to view portfolio data. airfocus does not document an equivalent free viewer tier."
    }
  ]
};

export default airfocusVsDragonboatContent;
