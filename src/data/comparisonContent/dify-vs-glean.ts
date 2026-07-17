import type { ToolComparisonContent } from './types';

const difyVsGleanContent: ToolComparisonContent = {
  "verdict": "Dify is an open-source, no-code platform for visually building AI agents, workflows, and RAG pipelines that developers configure and deploy, while Glean is an enterprise Work AI platform that unifies existing company data and apps (Slack, Google Drive, Jira, SharePoint, Salesforce) to power permission-aware search and AI agents across an organization's own knowledge. Dify is a build-your-own-agent toolkit; Glean is a pre-integrated enterprise search and knowledge layer with agent capabilities layered on top. They address overlapping AI-agent use cases but from opposite starting points — build versus connect.",
  "bestForToolA": "Dify fits developers and technical teams building custom AI agents and RAG pipelines from scratch using a visual Workflow Studio, with a free self-hosted Community Edition (149K+ GitHub stars) or a Cloud Sandbox tier requiring no installation.",
  "bestForToolB": "Glean fits enterprises that need permission-aware search and AI agents across dozens of existing systems (Slack, Confluence, GitHub, Salesforce) without building custom pipelines, supporting 35+ different LLMs and backed by SOC 2, ISO 27001, ISO 42001, HIPAA, and GDPR compliance.",
  "whoNeedsBoth": "A large enterprise could use Glean as its permission-aware knowledge layer across Slack, SharePoint, and Salesforce for company-wide search and pre-built agents, while a product or engineering team separately uses Dify to build custom, purpose-specific AI workflows and RAG applications that go beyond what Glean's out-of-the-box connectors and agents cover.",
  "keyDifferences": [
    {
      "title": "Core Approach",
      "toolA": "Dify is a visual, node-based builder for constructing agentic workflows, RAG knowledge pipelines, and custom tools/plugins from the ground up.",
      "toolB": "Glean is a pre-built enterprise Work AI platform that connects to existing systems (Slack, Google Drive, Jira, Confluence, SharePoint, GitHub, Salesforce) to power search and automation without requiring custom pipeline construction.",
      "whyItMatters": "Building custom agents versus connecting to and searching existing company knowledge are fundamentally different starting points that suit different technical maturity levels.",
      "benefitsWho": "Developers wanting granular control over agent logic benefit from Dify; enterprises wanting fast time-to-value from existing data benefit from Glean."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Dify publishes tiered pricing: a free Sandbox (200 message credits), Professional ($590/year), Team ($1,590/year), and a free self-hosted Community Edition.",
      "toolB": "Glean does not list public prices; it requires a sales demo to get a quote, consistent with its custom/enterprise pricing model.",
      "whyItMatters": "Published pricing lets smaller teams self-serve, while custom pricing typically means a longer enterprise sales cycle.",
      "benefitsWho": "Budget-conscious developers and small teams benefit from Dify's transparent tiers; enterprise buyers used to negotiated contracts are unaffected by Glean's lack of public pricing."
    },
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "Dify's Community Edition is open source and can be self-hosted for free via Docker Compose, with an Enterprise self-hosted/VPC option also available.",
      "toolB": "Glean does not document an open-source or self-hosted option; it is positioned as a cloud enterprise platform.",
      "whyItMatters": "Self-hosting and open-source access matter for organizations wanting infrastructure control or wanting to inspect/modify the underlying code.",
      "benefitsWho": "Engineering teams wanting full infrastructure control benefit from Dify's open-source, self-hostable model."
    },
    {
      "title": "LLM Flexibility",
      "toolA": "Dify's Marketplace provides access to model providers and MCP-compatible integrations, letting teams choose and swap models within workflows.",
      "toolB": "Glean explicitly states support for 35+ different large language models rather than locking customers into a single provider.",
      "whyItMatters": "Multi-LLM support avoids vendor lock-in to a single model provider and lets teams pick the best model for cost or capability.",
      "benefitsWho": "Enterprises wanting to avoid single-vendor LLM lock-in benefit from Glean's explicit 35+ LLM support."
    },
    {
      "title": "Permission-Aware Search",
      "toolA": "Dify's documented features focus on building agent workflows and RAG pipelines; a permission-aware enterprise search layer across existing company systems is not documented.",
      "toolB": "Glean provides enterprise search that respects each user's existing access permissions across connected systems like SharePoint and Salesforce.",
      "whyItMatters": "Permission-aware search is critical for large organizations that need AI search to respect existing document and data access controls rather than exposing everything to everyone.",
      "benefitsWho": "Large enterprises with complex existing access-control requirements benefit from Glean's permission-aware search."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Visual/no-code agent builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dify's Workflow Studio is the core builder"
        },
        {
          "feature": "Pre-built enterprise app connectors",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Glean: Slack, Google Drive, Jira, Confluence, SharePoint, GitHub, Salesforce"
        },
        {
          "feature": "Permission-aware search",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "RAG knowledge pipeline",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-LLM support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Glean explicitly states 35+ LLMs"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Glean requires a sales demo"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dify Sandbox is free; Glean has no published free plan"
        },
        {
          "feature": "Self-hosted free option",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Security & Compliance",
      "rows": [
        {
          "feature": "SOC 2 Type II",
          "toolA": "available",
          "toolB": "available",
          "note": "Both on Enterprise/full offering"
        },
        {
          "feature": "ISO 27001",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "GDPR compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "ISO 42001 (AI-specific)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dify a substitute for Glean's enterprise search?",
      "answer": "Not directly. Dify is a build-your-own toolkit for AI agents and RAG pipelines, while Glean provides pre-built, permission-aware search across existing enterprise systems like Slack, SharePoint, and Salesforce. Dify doesn't document a permission-aware search layer of the kind Glean offers out of the box."
    },
    {
      "question": "Does Glean have published pricing?",
      "answer": "No. Glean does not list public prices and requires a sales demo to get a quote. Dify, by contrast, publishes tiered Cloud pricing (Sandbox free, Professional $590/year, Team $1,590/year) plus a free self-hosted Community Edition."
    },
    {
      "question": "Can Dify be self-hosted?",
      "answer": "Yes. Dify's Community Edition is open source and can be self-hosted for free via Docker Compose, and an Enterprise self-hosted/VPC option is also available. Glean does not document a self-hosted option."
    },
    {
      "question": "How many LLMs does each platform support?",
      "answer": "Glean states explicit support for 35+ different large language models. Dify provides access to model providers through its Marketplace but does not publish a specific LLM count."
    },
    {
      "question": "Which tool is more compliance-certified for regulated industries?",
      "answer": "Glean documents a broader compliance set: SOC 2 Type II, ISO 27001, ISO 42001, HIPAA, and GDPR. Dify's Enterprise tier documents SOC 2 Type II and ISO 27001, but HIPAA and GDPR certifications are not specifically listed."
    },
    {
      "question": "Do I need engineering resources to use these tools?",
      "answer": "Dify is built as a no-code visual workflow builder but is positioned toward developers building custom agents and RAG pipelines, with a CLI (difyctl) for CI/CD. Glean is positioned as a more turnkey enterprise platform connecting to existing systems, though implementation still typically involves IT/admin setup for connectors and permissions."
    }
  ]
};

export default difyVsGleanContent;
