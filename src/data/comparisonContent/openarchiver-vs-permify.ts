import type { ToolComparisonContent } from './types';

const openarchiverVsPermifyContent: ToolComparisonContent = {
  "verdict": "openarchiver is an open-source, self-hosted platform for email backup, compliance, and eDiscovery with full-text search. Permify is an open-source, Zanzibar-inspired authorization engine for building fine-grained RBAC, ABAC, and ReBAC access control into applications. Both are open-source, self-hostable, compliance-adjacent infrastructure tools, but they solve unrelated problems — one archives email communications, the other governs who can access what inside software.",
  "bestForToolA": "openarchiver fits IT and compliance teams that need to archive email from Microsoft 365, Google Workspace, or generic IMAP servers, or import historical PST/EML files, for backup, eDiscovery, and full-text search.",
  "bestForToolB": "Permify fits engineering teams building an application that needs a dedicated, self-hostable authorization service supporting RBAC, ABAC, and ReBAC in a single schema, with access checks reported as fast as 10ms.",
  "whoNeedsBoth": "An organization building an internal compliance platform could use Permify to control which employees or roles can access which archived mailboxes inside their own admin tooling, while using openarchiver as the underlying system that actually archives and indexes the email content.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "openarchiver archives email communications for backup, compliance, and eDiscovery, with full-text search across archived messages.",
      "toolB": "Permify centralizes authorization logic — RBAC, ABAC, and ReBAC — so applications don't need to hardcode permission checks per feature.",
      "whyItMatters": "Confusing these categories wastes evaluation time; one is a data-archiving system, the other is developer infrastructure for access control.",
      "benefitsWho": "IT/compliance teams need openarchiver's archiving; application engineering teams need Permify's authorization logic."
    },
    {
      "title": "Data Source Integrations",
      "toolA": "openarchiver connects directly to Microsoft 365 and Google Workspace, plus generic IMAP servers, and can import existing PST and EML files without a live mailbox connection.",
      "toolB": "Permify has no email or mailbox connectors documented — it works via its own schema language and API calls made from an application.",
      "whyItMatters": "Direct connectors to major email platforms determine how easily an organization can start archiving without custom integration work.",
      "benefitsWho": "Teams migrating or backing up existing mail systems benefit from openarchiver's connectors; this isn't a relevant dimension for Permify."
    },
    {
      "title": "Deployment Options",
      "toolA": "openarchiver is documented as a self-hosted platform, with no managed cloud version documented.",
      "toolB": "Permify offers both a free, self-hosted Community edition (AGPL-3.0) and a managed Permify Cloud with SOC2 and GDPR compliance across AWS, GCP, and Azure.",
      "whyItMatters": "Having a managed cloud option removes hosting burden for teams that don't want to run infrastructure themselves.",
      "benefitsWho": "Teams wanting a managed option benefit from Permify Cloud; openarchiver users must currently plan to self-host."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "openarchiver is tagged as freemium, but no specific pricing plans or tiers are documented.",
      "toolB": "Permify documents two clear tiers: Community (free, self-hosted) and Permify Cloud (custom, usage-based).",
      "whyItMatters": "Clearer tiering makes it easier to know what you get for free versus what requires payment before evaluating a tool.",
      "benefitsWho": "Buyers wanting upfront pricing clarity benefit from Permify's documented tiers over openarchiver's undocumented ones."
    },
    {
      "title": "Ownership and Backing",
      "toolA": "openarchiver's founding, company, and headquarters information is not documented in the available facts.",
      "toolB": "Permify was acquired by FusionAuth in November 2025, which has committed to keeping it open source, with a unified pricing model planned for 2026.",
      "whyItMatters": "Knowing who backs and maintains open-source infrastructure affects confidence in its long-term support.",
      "benefitsWho": "Risk-averse buyers evaluating vendor stability get more documented signal from Permify's FusionAuth backing than from openarchiver's undocumented ownership."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Email archiving & eDiscovery",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Full-text search over archived data",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Fine-grained authorization (RBAC/ABAC/ReBAC)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Schema-as-code permission modeling",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Import",
      "rows": [
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Generic IMAP support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PST/EML file import",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Permify Community is AGPL-3.0 and free"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Permify Cloud"
        },
        {
          "feature": "Published pricing tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Permify: Community free / Cloud custom"
        },
        {
          "feature": "Described as open source",
          "toolA": "available",
          "toolB": "available",
          "note": "Permify explicitly AGPL-3.0"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are openarchiver and Permify competitors?",
      "answer": "No. openarchiver archives email for compliance and eDiscovery, while Permify is an authorization engine for controlling access inside applications. They address different problems, though both are open-source and self-hostable."
    },
    {
      "question": "Does openarchiver connect to Microsoft 365 and Google Workspace?",
      "answer": "Yes, along with generic IMAP servers and PST/EML file imports for historical archives without a live mailbox connection."
    },
    {
      "question": "Is Permify free to use?",
      "answer": "Yes, Permify's core Community edition is open source under AGPL-3.0 and can be self-hosted for free. A managed Permify Cloud option is also available with custom, usage-based pricing."
    },
    {
      "question": "Does openarchiver publish its pricing?",
      "answer": "No specific pricing plans are documented for openarchiver, even though it's tagged as freemium. Permify, by contrast, documents a free Community tier and a custom-priced Cloud tier."
    },
    {
      "question": "Can openarchiver and Permify be used together?",
      "answer": "Potentially — an organization could use Permify to govern who can access which archived mailboxes or search results inside a custom compliance tool, while openarchiver handles the underlying email archiving and full-text search."
    },
    {
      "question": "Which tool offers a managed cloud version?",
      "answer": "Permify offers Permify Cloud, a managed hosting option with SOC2 and GDPR compliance across AWS, GCP, and Azure. openarchiver does not document a managed cloud version."
    }
  ]
};

export default openarchiverVsPermifyContent;
