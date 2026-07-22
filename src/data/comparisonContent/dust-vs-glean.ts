import type { ToolComparisonContent } from './types';

const dustVsGleanContent: ToolComparisonContent = {
  "verdict": "Dust and Glean both let organizations build AI agents connected to company knowledge, but they sit at different points on the self-serve-to-enterprise spectrum: Dust emphasizes an accessible, non-technical agent builder with a freemium pricing model, while Glean is a fully custom-quoted enterprise platform with deeper compliance certifications and a longer list of named integrations.",
  "bestForToolA": "Teams wanting a non-technical agent builder that connects to common tools like Slack, Notion, and Drive, with flexibility to run on multiple LLMs via MCP, without necessarily going through an enterprise sales process.",
  "bestForToolB": "Large enterprises needing permission-aware search across many named systems (Jira, Confluence, SharePoint, Salesforce, GitHub), extensive compliance certifications (HIPAA, ISO 42001), and support for 35+ LLMs.",
  "whoNeedsBoth": "An organization piloting lightweight, team-level agents in Dust while separately running a company-wide, compliance-heavy knowledge search and automation layer in Glean could reasonably use both for different scopes of work.",
  "keyDifferences": [
    {
      "title": "Pricing Model & Transparency",
      "toolA": "Listed as Freemium, implying some self-serve tier, though detailed self-serve pricing tiers could not be independently confirmed from the official site.",
      "toolB": "Custom/Enterprise only, requiring a sales demo for any quote with no published pricing.",
      "whyItMatters": "The ability to self-serve or try before buying differs significantly.",
      "benefitsWho": "Smaller teams or individuals wanting to start without a sales process versus large enterprises expecting a custom procurement process."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Enterprise controls documented as SSO, SCIM, SOC 2, and an optional zero data retention mode.",
      "toolB": "Holds SOC 2 Type II, ISO 27001, ISO 42001, HIPAA, and GDPR compliance.",
      "whyItMatters": "Regulated industries like healthcare and finance require specific certifications such as HIPAA that not all vendors carry.",
      "benefitsWho": "Enterprises in regulated industries needing HIPAA or ISO 42001-level compliance."
    },
    {
      "title": "Enterprise System Integrations",
      "toolA": "Knowledge connectors to Slack, Notion, and Google Drive, plus native integrations like Zendesk and a Chrome extension.",
      "toolB": "Integrates with a named list of enterprise systems: Slack, Google Drive, Jira, Confluence, SharePoint, GitHub, and Salesforce.",
      "whyItMatters": "The specific systems a company already uses may determine which platform can actually plug into its existing knowledge base.",
      "benefitsWho": "IT and ops teams evaluating connector coverage against their current tool stack."
    },
    {
      "title": "Multi-LLM Breadth",
      "toolA": "Supports multiple leading models such as GPT and Claude, without a specific count documented.",
      "toolB": "Supports 35+ different LLMs.",
      "whyItMatters": "Broader model choice can matter for cost optimization or capability requirements across use cases.",
      "benefitsWho": "Enterprises wanting to standardize on many models rather than a couple."
    },
    {
      "title": "Company Transparency",
      "toolA": "No founding year or headquarters is documented in the available facts.",
      "toolB": "Founded in 2019, headquartered in Palo Alto, CA, USA.",
      "whyItMatters": "Company background can factor into vendor trust and due diligence for enterprise buyers.",
      "benefitsWho": "Procurement and security teams doing vendor due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Agent Building & Knowledge",
      "rows": [
        {
          "feature": "No-code agent builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Knowledge connectors (Slack/Drive/etc.)",
          "toolA": "available",
          "toolB": "available",
          "note": "Glean names a wider list: Jira, Confluence, SharePoint, GitHub, Salesforce"
        },
        {
          "feature": "MCP tool support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Permission-aware search",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Workflow automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-model support",
          "toolA": "available",
          "toolB": "available",
          "note": "Dust: GPT and Claude; Glean: 35+ LLMs"
        }
      ]
    },
    {
      "group": "Enterprise Security & Compliance",
      "rows": [
        {
          "feature": "SSO / SCIM",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2",
          "toolA": "available",
          "toolB": "available",
          "note": "Glean: SOC 2 Type II"
        },
        {
          "feature": "HIPAA / GDPR / ISO 42001",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Zero data retention mode",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Company Info",
      "rows": [
        {
          "feature": "Public/self-serve pricing",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Glean requires a sales demo"
        },
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Dust: Freemium; Glean: Custom/Enterprise"
        },
        {
          "feature": "Founding year/HQ published",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Founded 2019, Palo Alto, CA"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is pricing public for Dust or Glean?",
      "answer": "Neither publishes full self-serve pricing. Dust's pricing model is listed as Freemium, but detailed self-serve tiers could not be confirmed from the official site. Glean requires a sales demo for a custom quote and has no published pricing."
    },
    {
      "question": "Which platform supports more LLMs?",
      "answer": "Glean states it supports 35+ unique LLMs. Dust supports multiple leading models, including GPT and Claude, without a specific count documented."
    },
    {
      "question": "Which tool offers permission-aware search?",
      "answer": "Glean explicitly provides permission-aware search that preserves each user's existing access controls. This isn't documented as a Dust feature."
    },
    {
      "question": "What compliance certifications does each hold?",
      "answer": "Glean holds SOC 2 Type II, ISO 27001, ISO 42001, HIPAA, and GDPR compliance. Dust's enterprise controls include SSO, SCIM, SOC 2, and an optional zero data retention mode."
    },
    {
      "question": "What company background is available for each?",
      "answer": "Glean was founded in 2019 and is headquartered in Palo Alto, CA. No founding year or headquarters is published for Dust in the available facts."
    }
  ]
};

export default dustVsGleanContent;
