import type { ToolComparisonContent } from './types';

const hyperproofVsScrutAutomationContent: ToolComparisonContent = {
  "verdict": "Hyperproof and Scrut Automation are both AI-assisted GRC platforms with no published pricing in the available facts, but they differentiate on framework breadth and integration documentation versus AI-agent branding and stated scale. Hyperproof documents 160+ frameworks, 200+ named integrations, and a FedRAMP Moderate authorized government offering; Scrut documents 60+ frameworks (including NIST AI RMF) and leans on its Scrut Teammates AI agents plus stated scale (2,500+ organizations, 10 million+ monitored assets monthly). The choice mostly comes down to which framework list, integration set, or AI-agent capability matches the buyer's compliance needs.",
  "bestForToolA": "Best for organizations that need a documented, broad list of 200+ specific integrations (Slack, AWS, ServiceNow, Okta, GitHub, Jira, Datadog) and/or a FedRAMP Moderate authorized offering (Hyperproof Gov) for government or public-sector compliance work.",
  "bestForToolB": "Best for organizations prioritizing AI-agent-driven automation of compliance work — Scrut Teammates provide guided remediation, evidence validation, and automated security questionnaire completion — and that need NIST AI RMF among their required frameworks.",
  "whoNeedsBoth": "Compliance teams evaluating GRC platforms without published pricing typically request demos from both, since neither Hyperproof's nor Scrut's facts include self-serve pricing — running both trial/demo processes side by side is often the only way to compare cost and fit.",
  "keyDifferences": [
    {
      "title": "Framework library size",
      "toolA": "Hyperproof lists 160+ pre-built compliance frameworks including HIPAA, SOC 2, ISO 27001, GDPR, PCI DSS, NIST, and FedRAMP.",
      "toolB": "Scrut lists 60+ frameworks including SOC 2, ISO 27001, GDPR, PCI DSS, HIPAA, and NIST AI RMF.",
      "whyItMatters": "A larger stated framework library may matter for organizations juggling many compliance regimes, while Scrut's inclusion of NIST AI RMF specifically signals AI-governance readiness.",
      "benefitsWho": "Compliance leads mapping required frameworks against vendor coverage."
    },
    {
      "title": "Integration documentation",
      "toolA": "Hyperproof states 200+ integrations by name, including Slack, AWS, ServiceNow, Okta, GitHub, Jira, and Datadog.",
      "toolB": "Scrut's facts note that its specific integration list is not detailed on the homepage.",
      "whyItMatters": "Buyers who need to confirm specific tool integrations before purchase have more self-service information available from Hyperproof.",
      "benefitsWho": "IT/security teams needing to validate integration compatibility before a purchase decision."
    },
    {
      "title": "Government/public-sector offering",
      "toolA": "Hyperproof Gov is stated to be FedRAMP Moderate authorized.",
      "toolB": "Scrut's facts do not mention a government-specific or FedRAMP-authorized offering.",
      "whyItMatters": "Organizations pursuing FedRAMP authorization or serving government customers need a vendor with that specific authorization already in place.",
      "benefitsWho": "Public-sector and government-contractor compliance teams."
    },
    {
      "title": "AI feature branding and scale claims",
      "toolA": "Hyperproof AI is described as human-in-the-loop, automating control operations, mapping, and vendor assessments.",
      "toolB": "Scrut Teammates are AI agents providing guided remediation, evidence validation, and automated questionnaire completion, and Scrut states it monitors 10 million+ assets monthly across 2,500+ organizations.",
      "whyItMatters": "Scrut's facts include specific scale figures that Hyperproof's facts do not state, which may factor into perceived market traction.",
      "benefitsWho": "Buyers weighing vendor scale and adoption as a proxy for platform maturity."
    }
  ],
  "featureMatrix": [
    {
      "group": "Compliance Coverage",
      "rows": [
        {
          "feature": "Number of pre-built frameworks",
          "toolA": "available",
          "toolB": "available",
          "note": "Hyperproof: 160+; Scrut: 60+"
        },
        {
          "feature": "NIST AI RMF framework",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "FedRAMP-authorized offering",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hyperproof Gov"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted control automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Hyperproof AI vs. Scrut Teammates"
        },
        {
          "feature": "Automated security questionnaire completion",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Third-party/vendor risk management",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Company & Market Info",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Headquarters stated",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hyperproof: Seattle, WA"
        },
        {
          "feature": "Founding year stated",
          "toolA": "not-documented",
          "toolB": "not-documented"
        },
        {
          "feature": "Named integrations documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hyperproof: 200+ named integrations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What frameworks does Hyperproof support?",
      "answer": "Hyperproof includes 160+ pre-built frameworks such as HIPAA, SOC 2, ISO 27001, GDPR, PCI DSS, NIST standards, FedRAMP, and CMMC."
    },
    {
      "question": "How many frameworks does Scrut support?",
      "answer": "Scrut offers 60+ pre-built frameworks, including SOC 2, ISO 27001, GDPR, PCI DSS, HIPAA, and NIST AI RMF."
    },
    {
      "question": "What are Scrut Teammates?",
      "answer": "Scrut Teammates are AI-powered agents that provide guided remediation, intelligent evidence validation, and automated security questionnaire completion."
    },
    {
      "question": "Does Hyperproof use AI?",
      "answer": "Yes, Hyperproof AI automates control operations, mapping, and vendor assessments with human-in-the-loop oversight."
    },
    {
      "question": "Is there a government-specific version of Hyperproof?",
      "answer": "Yes, Hyperproof Gov is FedRAMP Moderate authorized."
    },
    {
      "question": "Is Scrut's pricing public?",
      "answer": "Specific pricing details were not accessible on the site during research; Scrut appears to use a demo/consultation-based sales approach."
    }
  ]
};

export default hyperproofVsScrutAutomationContent;
