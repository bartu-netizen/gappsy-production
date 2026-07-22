import type { ToolComparisonContent } from './types';

const deskproVsGlpiContent: ToolComparisonContent = {
  "verdict": "Deskpro is a multi-channel help desk built around AI (chatbot, agent-assist co-pilot, and workflow automations) with flexible cloud, private-cloud, or self-hosted deployment starting at $39/agent/month, while GLPI is an open-source ITSM and asset/CMDB platform that's free to self-host and adds paid GLPI Network Cloud or plugin tiers for managed hosting and advanced features. Deskpro leans toward AI-assisted customer/agent-facing support, while GLPI leans toward IT asset and infrastructure management with ticketing as one part of a broader ITSM suite.",
  "bestForToolA": "Support teams wanting AI-assisted ticketing (chatbot, agent-assist co-pilot, automated routing) across email, chat, voice, SMS, WhatsApp, and social in one unified inbox, with SOC II, ISO 27001, and HIPAA certifications and flexible deployment down to on-premise.",
  "bestForToolB": "IT teams needing a free, self-hostable ITSM platform that combines helpdesk ticketing with asset inventory, a CMDB, and agentless cloud inventory, or that want managed cloud hosting via GLPI Network Cloud starting at €19/month per IT agent.",
  "whoNeedsBoth": "An organization might run GLPI internally for IT asset and CMDB tracking with infrastructure ticketing, while using Deskpro as the external customer-facing help desk with its AI chatbot and omnichannel inbox — GLPI managing internal IT assets, Deskpro handling multi-channel customer support.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Deskpro's cloud pricing starts at $39/agent/month for Team (minimum 5 agents), rising to $59/agent/month for Professional (minimum 10 agents) and $99/agent/month for Enterprise (minimum 25 agents).",
      "toolB": "GLPI's core is free to self-host; GLPI Network Public Cloud starts at €19/month per IT agent and Private Cloud at €21/month per IT agent (minimum 25 agents), plus self-hosted plugin add-ons from €100/month (Basic) to €1,000/month (Advanced).",
      "whyItMatters": "The entry cost and minimum seat requirements differ significantly between the two.",
      "benefitsWho": "Small teams or budget-conscious IT departments comparing total cost of ownership."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Deskpro bundles Deskpro AI — a chatbot, an agent-assist co-pilot that drafts replies and summarizes tickets, and AI workflow automations that route by intent, sentiment, and language — though gated to the Professional plan and above.",
      "toolB": "GLPI's documented features don't include AI capabilities.",
      "whyItMatters": "AI-assisted resolution can materially cut agent workload for high-volume support teams.",
      "benefitsWho": "Support teams wanting to automate first response and ticket triage."
    },
    {
      "title": "Asset & Infrastructure Management",
      "toolA": "Deskpro's documented features are support/ticketing-focused (unified inbox, self-service help center) without asset or CMDB functionality.",
      "toolB": "GLPI includes a CMDB, asset and inventory management, and agentless cloud inventory scanning as core platform features.",
      "whyItMatters": "GLPI covers IT asset lifecycle tracking that a pure help desk tool doesn't address.",
      "benefitsWho": "IT operations teams needing infrastructure and asset visibility alongside ticketing."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Deskpro offers cloud, private cloud, self-hosted, on-premise, and sovereign data center options, with Enterprise supporting 22 AWS regions for data residency.",
      "toolB": "GLPI offers a free self-hosted open-source core plus managed GLPI Network Cloud, with a 45-day free trial for the cloud offering.",
      "whyItMatters": "Deployment flexibility affects data residency and compliance requirements for regulated industries.",
      "benefitsWho": "Enterprises with strict data-residency or on-premise requirements."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Deskpro is SOC II, ISO 27001, and HIPAA certified, with HIPAA-compliant hosting available on the Enterprise plan.",
      "toolB": "GLPI's documented facts don't list specific compliance certifications.",
      "whyItMatters": "Formal compliance certifications matter for regulated industries like healthcare or finance.",
      "benefitsWho": "Support teams in regulated industries needing documented compliance attestations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Deskpro offers a free trial, not a free self-hosted tier"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro: $39/agent/mo (min 5 agents); GLPI: €19/mo per IT agent"
        },
        {
          "feature": "Minimum seats/agents required",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro Team: min 5 agents; GLPI Private Cloud: min 25 agents"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro: length unspecified; GLPI: 45 days"
        }
      ]
    },
    {
      "group": "Support & Ticketing",
      "rows": [
        {
          "feature": "Unified multi-channel inbox (email/chat/voice/SMS/WhatsApp/social)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-service help center / knowledge base",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI chatbot",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI agent-assist / co-pilot",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Workflow automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro: AI-based routing; GLPI: general IT workflow automation"
        }
      ]
    },
    {
      "group": "IT Asset & Infrastructure Management",
      "rows": [
        {
          "feature": "CMDB",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Asset / inventory management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Agentless cloud inventory",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "GLPI: iOS and Android"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Deskpro or GLPI?",
      "answer": "GLPI's core is free to self-host, with managed cloud starting at €19/month per IT agent. Deskpro starts at $39/agent/month for a minimum of 5 agents, so GLPI is generally the lower-cost entry point, especially self-hosted."
    },
    {
      "question": "Does GLPI include AI features?",
      "answer": "Not per the documented facts — GLPI's features focus on ticketing, asset management, CMDB, and workflow automation without AI capabilities."
    },
    {
      "question": "Does Deskpro include asset management or a CMDB?",
      "answer": "No. Deskpro's documented features are support/ticketing-focused (unified inbox, self-service help center, AI tools) without CMDB or asset inventory."
    },
    {
      "question": "Can either tool be self-hosted?",
      "answer": "Yes. GLPI's open-source core is free to self-host (GPL-3.0), and Deskpro supports self-hosted, private cloud, and on-premise deployment alongside its cloud plans."
    },
    {
      "question": "Is Deskpro's AI included in every plan?",
      "answer": "No. Deskpro AI (chatbot, agent assist, automations) is gated to the Professional plan and above."
    },
    {
      "question": "Does GLPI offer a free trial for its cloud plans?",
      "answer": "Yes, a 45-day free trial is available for GLPI's cloud offering."
    }
  ]
};

export default deskproVsGlpiContent;
