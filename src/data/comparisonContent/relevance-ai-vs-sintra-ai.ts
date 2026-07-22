import type { ToolComparisonContent } from './types';

const relevanceAiVsSintraAiContent: ToolComparisonContent = {
  "verdict": "Relevance AI and Sintra AI both promise AI agents that offload work, but they solve different problems: Relevance AI is a no-code platform for building custom agent workflows across 1,000+ integrated apps, while Sintra AI ships 12 ready-made 'AI employees' for specific business functions on a flat subscription. The choice depends on whether you want to build agents or use finished ones.",
  "bestForToolA": "Teams that need custom agent workflows wired into many existing systems (Salesforce, HubSpot, LinkedIn, Slack, Gmail), want to choose or mix LLM providers, and require enterprise security controls like SSO/SAML, audit logs, and SOC 2/GDPR compliance.",
  "bestForToolB": "Small businesses or solo operators who want pre-built agents for specific roles — social media, copywriting, data analysis, customer support — running immediately on a flat monthly price, without configuring a workflow builder.",
  "whoNeedsBoth": "An agency managing multiple clients could use Sintra AI's ready-made agents for day-to-day content and support tasks while using Relevance AI to build custom, integration-heavy automations for clients with specific CRM or operational requirements.",
  "keyDifferences": [
    {
      "title": "Build-your-own vs. pre-built agents",
      "toolA": "No-code builder with pre-built templates for constructing custom agent workflows from scratch.",
      "toolB": "12 fixed, pre-trained AI agents for specific roles (social media manager, copywriter, data analyst, customer support) used as-is.",
      "whyItMatters": "Buyers who need a workflow tailored to their own systems and processes need a builder; buyers who just want a function handled need a ready-made agent.",
      "benefitsWho": "Technical/ops teams benefit from Relevance AI's flexibility; non-technical small-business owners benefit from Sintra AI's plug-and-play agents."
    },
    {
      "title": "Integration breadth",
      "toolA": "Advertises 1,000+ app integrations, including Salesforce, HubSpot, LinkedIn, Slack, and Gmail.",
      "toolB": "Integrates with 50+ tools, including Gmail, Google Calendar, Outlook, Facebook, Instagram, Notion, and Slack.",
      "whyItMatters": "Organizations with many disparate tools need broader integration coverage to avoid manual handoffs.",
      "benefitsWho": "Larger or more tool-diverse organizations benefit from Relevance AI's wider integration library."
    },
    {
      "title": "Pricing structure and transparency",
      "toolA": "Usage-based, billed per task (cited as low as $0.02/simple task); the public pricing page otherwise shows only a custom Enterprise plan.",
      "toolB": "Flat subscription starting at $48.50/month (monthly billing), with lower per-month rates on quarterly and annual commitments.",
      "whyItMatters": "Usage-based pricing can scale efficiently for light use but makes monthly costs harder to predict, while flat pricing is predictable but doesn't scale down for irregular usage.",
      "benefitsWho": "Budget-conscious teams with steady usage benefit from Sintra AI's flat pricing; teams with variable or bursty task volume may prefer Relevance AI's per-task billing."
    },
    {
      "title": "Security and compliance controls",
      "toolA": "States SOC 2 and GDPR compliance, SSO/SAML, audit logs, and data residency options.",
      "toolB": "No compliance certifications or SSO/audit-log features are mentioned in the available facts.",
      "whyItMatters": "Regulated industries or enterprise buyers often require documented compliance and access controls before adoption.",
      "benefitsWho": "Enterprise and regulated-industry buyers benefit from Relevance AI's documented security posture."
    },
    {
      "title": "Trial vs. commitment before paying",
      "toolA": "Offers a 'Try it out' option, though detailed self-serve plan pricing isn't published.",
      "toolB": "No free trial; instead offers a 14-day money-back guarantee after subscribing.",
      "whyItMatters": "Buyers who want to test before paying anything have different options with each vendor.",
      "benefitsWho": "Risk-averse buyers who want to try before committing money lean toward Relevance AI's try-it-out option; those comfortable paying upfront with a refund safety net can use Sintra AI."
    }
  ],
  "featureMatrix": [
    {
      "group": "Agent Capabilities",
      "rows": [
        {
          "feature": "Custom no-code agent building",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Sintra AI's agents are pre-built, fixed roles rather than a builder"
        },
        {
          "feature": "Multi-LLM model selection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Human-in-the-loop approval steps",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Continuous/24-7 task automation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Extensibility",
      "rows": [
        {
          "feature": "Third-party app integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Relevance AI advertises 1,000+; Sintra AI advertises 50+"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Relevance AI is tagged with API access; no API is mentioned for Sintra AI"
        },
        {
          "feature": "Multiple business profiles/brands",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 5 profiles per account"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Relevance AI offers a 'Try it out' option without published pricing; Sintra AI offers a 14-day money-back guarantee instead"
        },
        {
          "feature": "Published self-serve pricing tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Relevance AI's public page shows only a custom Enterprise plan"
        },
        {
          "feature": "Usage-based billing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Security & Compliance",
      "rows": [
        {
          "feature": "SSO/SAML",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2 / GDPR compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Audit logs",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Relevance AI offer a free trial?",
      "answer": "The site offers a 'Try it out' option, though detailed self-serve plan pricing isn't published; the public pricing page shows a custom Enterprise plan."
    },
    {
      "question": "Does Sintra AI offer a free trial?",
      "answer": "No free trial is advertised; Sintra AI offers a 14-day money-back guarantee instead."
    },
    {
      "question": "How is each platform priced?",
      "answer": "Relevance AI bills usage-based per task (examples as low as $0.02 per simple task), while Sintra AI charges a flat subscription starting at $48.50/month, with lower per-month rates on quarterly and annual plans."
    },
    {
      "question": "Which platform has more integrations?",
      "answer": "Relevance AI advertises 1,000+ integrations versus Sintra AI's 50+, including overlapping tools like Gmail and Slack."
    },
    {
      "question": "Which tool is better suited for regulated industries?",
      "answer": "Relevance AI states SOC 2 and GDPR compliance plus SSO/SAML and audit logs; no equivalent certifications are documented for Sintra AI."
    },
    {
      "question": "Can either tool support multiple clients or brands?",
      "answer": "Sintra AI supports up to 5 customizable business profiles per account; Relevance AI's facts don't document a similar multi-brand feature."
    }
  ]
};

export default relevanceAiVsSintraAiContent;
