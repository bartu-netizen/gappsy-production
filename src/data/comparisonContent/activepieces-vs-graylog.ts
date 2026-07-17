import type { ToolComparisonContent } from './types';

const activepiecesVsGraylogContent: ToolComparisonContent = {
  "verdict": "Activepieces automates cross-app business workflows through prebuilt integrations like Gmail. Graylog is a centralized log management and SIEM platform, free at the Graylog Open tier and scaling to full SIEM capability through paid Security, Enterprise, API Security, Cloud, and Small Business tiers. These are unrelated problem domains — business process automation versus security/log operations — so the two are rarely evaluated as alternatives.",
  "bestForToolA": "Business teams in HR, finance, marketing, and sales wanting automated cross-app workflows via prebuilt \"pieces\" like Gmail.",
  "bestForToolB": "IT/security teams needing centralized log management that scales from a free Graylog Open edition up to full SIEM capability — AI-powered anomaly detection, UEBA, and SOAR-style investigation automation — via the paid Security tier.",
  "whoNeedsBoth": "A security operations team could run Graylog to collect and analyze logs, while a separate business team uses Activepieces to automate unrelated workflows like sales lead routing — no native integration between the two is documented in the facts available.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "Workflow automation platform.",
      "toolB": "Log management and SIEM platform.",
      "whyItMatters": "These address completely different operational needs — app workflows versus log/security data.",
      "benefitsWho": "Clarifies category fit for buyers researching either tool."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes plan pricing: $5/active flow/month (Standard), custom Ultimate plan.",
      "toolB": "Paid tier pricing is entirely unpublished and requires contacting sales; no pricing plans are documented for any Graylog edition.",
      "whyItMatters": "Buyers can budget precisely with Activepieces but must go through a sales process for Graylog.",
      "benefitsWho": "Procurement teams that need self-service pricing benefit from Activepieces' published rates."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Offers cloud-hosted or self-hosted deployment for app workflows.",
      "toolB": "Offers cloud, on-premises, or hybrid deployment for log infrastructure.",
      "whyItMatters": "Both are flexible, but the underlying workloads they deploy are entirely different.",
      "benefitsWho": "IT teams with data-residency or compliance requirements benefit from Graylog's on-prem/hybrid options."
    },
    {
      "title": "Security/Threat Capabilities",
      "toolA": "Documents \"enterprise governance controls\" but no threat-detection or security-analytics features.",
      "toolB": "Documents AI-powered anomaly detection, UEBA (user and entity behavior analytics), and SOAR-style investigation automation in its Security tier.",
      "whyItMatters": "Security teams evaluating threat detection need capabilities Activepieces simply doesn't offer.",
      "benefitsWho": "Security operations and SOC teams benefit from Graylog's dedicated threat-detection tooling."
    },
    {
      "title": "Product Tier Complexity",
      "toolA": "A simple two-tier structure: Standard and Ultimate.",
      "toolB": "Spans five named tiers — Security, Enterprise, API Security, Cloud, and Small Business — which Graylog's own documented cons note \"can make choosing the right plan confusing.\"",
      "whyItMatters": "More tiers mean more evaluation overhead before a buying decision can be made.",
      "benefitsWho": "Buyers wanting a fast, simple purchase benefit from Activepieces' simpler tier structure; larger security orgs benefit from Graylog's tier granularity."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Business workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Centralized log management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SIEM / threat detection",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Graylog Security tier"
        }
      ]
    },
    {
      "group": "Pricing & Editions",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Graylog requires contacting sales"
        },
        {
          "feature": "Free edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Graylog Open"
        },
        {
          "feature": "Number of named product tiers",
          "toolA": "available",
          "toolB": "available",
          "note": "AP: 2 (Standard, Ultimate); Graylog: 5 (Security, Enterprise, API Security, Cloud, Small Business)"
        }
      ]
    },
    {
      "group": "Advanced Capabilities",
      "rows": [
        {
          "feature": "AI-powered anomaly detection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "UEBA",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tiered data archival",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Graylog free?",
      "answer": "Graylog Open is a free, source-available edition. Paid tiers (Security, Enterprise, Cloud, Small Business) require a license and unpublished pricing."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "Is Graylog a SIEM?",
      "answer": "Graylog Security is positioned as a full SIEM offering with threat detection, UEBA, and investigation automation on top of the log management core."
    },
    {
      "question": "Where is Graylog headquartered?",
      "answer": "Houston, TX, with additional offices in London, UK and Hamburg, Germany."
    },
    {
      "question": "Can Activepieces analyze security logs like Graylog?",
      "answer": "No — the facts don't document any log ingestion, anomaly detection, or SIEM capability for Activepieces; it's a general SaaS workflow automation tool."
    },
    {
      "question": "Can Graylog be self-hosted?",
      "answer": "Yes, it supports cloud, on-premises, and hybrid deployment models."
    }
  ]
};

export default activepiecesVsGraylogContent;
