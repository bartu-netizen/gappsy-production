import type { ToolComparisonContent } from './types';

const deskproVsLiveagentContent: ToolComparisonContent = {
  "verdict": "Deskpro and LiveAgent are both AI-enhanced help desks with free trials, but they prioritize different things. Deskpro stands out for flexible deployment (including self-hosted and on-premise options) and documented security certifications, while LiveAgent leads on a built-in call center with IVR and a broad, clearly priced feature and integration list. Cost floors also differ: Deskpro requires a minimum of 5 agents, while LiveAgent documents no minimum.",
  "bestForToolA": "Organizations with compliance or data-residency requirements that need self-hosted, private-cloud, or sovereign data center deployment, and that value SOC II/ISO 27001/HIPAA certification plus AI workflow automation based on intent and sentiment.",
  "bestForToolB": "Smaller teams or those without a minimum-agent requirement who want a built-in call center with IVR, broad social channel coverage (Facebook, Instagram, WhatsApp, Viber, Telegram), and a clearly documented 30-day free trial with no credit card.",
  "whoNeedsBoth": "A support organization split between an enterprise on-premise requirement for one business unit and a smaller, cloud-only team elsewhere might end up licensing both, though the facts don't document either tool supporting the other's core differentiator.",
  "keyDifferences": [
    {
      "title": "Deployment flexibility",
      "toolA": "Deskpro supports cloud, private cloud, self-hosted, on-premise, and sovereign data center deployment.",
      "toolB": "Not documented as offering self-hosted or on-premise deployment for LiveAgent.",
      "whyItMatters": "Regulated industries or organizations with strict data-residency rules often require non-cloud deployment options.",
      "benefitsWho": "Government, healthcare, or finance teams with data-residency constraints."
    },
    {
      "title": "Security certifications",
      "toolA": "Deskpro is documented as SOC II, ISO 27001, and HIPAA certified.",
      "toolB": "Not documented for LiveAgent.",
      "whyItMatters": "Formal certifications are often a procurement requirement for enterprise and healthcare buyers.",
      "benefitsWho": "Enterprise security and compliance reviewers."
    },
    {
      "title": "Call center and IVR",
      "toolA": "Not documented as a Deskpro feature.",
      "toolB": "LiveAgent includes a built-in call center with IVR starting on the $29/agent/month Medium Business plan.",
      "whyItMatters": "A native call center avoids needing a separate phone/IVR vendor integration.",
      "benefitsWho": "Support teams that field phone calls alongside tickets and chat."
    },
    {
      "title": "Minimum agent/seat requirements",
      "toolA": "Deskpro's Team plan requires a minimum of 5 agents, and Enterprise requires 25, raising the cost floor.",
      "toolB": "No minimum agent count is documented for LiveAgent.",
      "whyItMatters": "Minimum seat counts directly affect affordability for very small support teams.",
      "benefitsWho": "Small teams of 1-4 agents who would otherwise pay for unused Deskpro seats."
    },
    {
      "title": "Trial transparency",
      "toolA": "Deskpro offers a free trial but its exact length isn't stated.",
      "toolB": "LiveAgent documents a specific 30-day free trial with no credit card required.",
      "whyItMatters": "A clearly stated trial length lets buyers plan an evaluation timeline with certainty.",
      "benefitsWho": "Teams running a structured, time-boxed vendor evaluation."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI chatbot",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agent assist / answer polishing",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro: AI Agent Assist Co-Pilot; LiveAgent: AI Answer Assistant"
        },
        {
          "feature": "AI-based ticket routing (intent/sentiment/language)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Chatbot documented language coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "LiveAgent: 100+ languages"
        }
      ]
    },
    {
      "group": "Channels",
      "rows": [
        {
          "feature": "Unified inbox (email/chat/voice/SMS/WhatsApp/social)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in call center / IVR",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "From LiveAgent's Medium Business plan"
        },
        {
          "feature": "Native social channel integration",
          "toolA": "available",
          "toolB": "limited",
          "note": "LiveAgent requires Large plan or higher"
        }
      ]
    },
    {
      "group": "Deployment & Security",
      "rows": [
        {
          "feature": "Self-hosted / on-premise option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC II / ISO 27001 / HIPAA certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Minimum agents required",
          "toolA": "limited",
          "toolB": "available",
          "note": "Deskpro: 5 minimum on Team, 25 on Enterprise; LiveAgent: none documented"
        },
        {
          "feature": "Free trial length disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "LiveAgent: 30 days, no credit card"
        },
        {
          "feature": "Entry price per agent",
          "toolA": "available",
          "toolB": "available",
          "note": "Deskpro $39/agent/month; LiveAgent $15/agent/month annual"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Deskpro be self-hosted?",
      "answer": "Yes, deployment options include cloud, private cloud, self-hosted, on-premise, and sovereign data centers. LiveAgent's deployment options are not documented as including self-hosting."
    },
    {
      "question": "Which has a longer or clearer free trial?",
      "answer": "LiveAgent documents a 30-day free trial with no credit card required. Deskpro offers a free trial but its exact length is not stated on the site."
    },
    {
      "question": "Does either include a call center?",
      "answer": "LiveAgent includes a built-in call center with IVR starting on its Medium Business plan ($29/agent/month). This is not documented as a Deskpro feature."
    },
    {
      "question": "Is there a minimum number of agents required?",
      "answer": "Deskpro requires a minimum of 5 agents on its Team plan and 25 on Enterprise. No minimum agent count is documented for LiveAgent."
    },
    {
      "question": "Which is more compliance-certified?",
      "answer": "Deskpro is documented as SOC II, ISO 27001, and HIPAA certified. No equivalent certifications are documented for LiveAgent."
    },
    {
      "question": "How many languages does each AI chatbot support?",
      "answer": "LiveAgent's AI chatbot supports 100+ languages. Deskpro's chatbot documentation doesn't specify a language count."
    }
  ]
};

export default deskproVsLiveagentContent;
