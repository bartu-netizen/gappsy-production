import type { ToolComparisonContent } from './types';

const suitecrmVsYetiforceContent: ToolComparisonContent = {
  "verdict": "SuiteCRM is a CRM-focused open-source platform with a named plugin ecosystem, formal ISO 9001/27001 certification, and official managed-hosting and support tiers for teams that want vendor backing; YetiForce is a broader free CRM+ERP suite with 80+ modules and documented large-scale deployments (up to 12,500 users across roughly 23,000 firms) for organizations wanting one free system that also covers finance, HR, and logistics without an official first-party paid hosting plan.",
  "bestForToolA": "Teams wanting a CRM with vendor-backed managed hosting (from £50/month), formal ISO 9001/27001 certification, and a named plugin ecosystem (Xero, DocuSign, QuickBooks) — a good fit for regulated or public-sector buyers, given SuiteCRM Ltd's Crown Commercial Service supplier status.",
  "bestForToolB": "Organizations that want CRM and ERP functionality (finance, HR, logistics, invoicing) combined in one free, self-hosted system, proven at deployments up to 12,500 users across roughly 23,000 firms.",
  "whoNeedsBoth": "There's limited realistic overlap since both are full CRM systems addressing the same core need; a more realistic scenario is evaluating both self-hosted options in parallel during a CRM selection process before standardizing on one.",
  "keyDifferences": [
    {
      "title": "CRM vs. Combined CRM+ERP Scope",
      "toolA": "SuiteCRM covers sales, marketing segmentation, and customer service tools as a CRM.",
      "toolB": "YetiForce combines CRM with ERP through 80+ modules spanning marketing, sales, project management, support, finance, logistics, HR, and office administration.",
      "whyItMatters": "Businesses needing finance or HR functionality alongside CRM avoid a second system with YetiForce's broader scope.",
      "benefitsWho": "Small businesses wanting one free system instead of separate CRM and ERP tools."
    },
    {
      "title": "Official Managed Hosting & Support",
      "toolA": "SuiteCRM offers Fully Managed Hosting from £50/month, Quick Start Implementation from £2,520 one-time, and SuiteASSURED support from £3,350/year.",
      "toolB": "YetiForce's facts list no first-party managed hosting plan, only \"optional paid support and subscription services\" through its marketplace.",
      "whyItMatters": "Teams without in-house IT need a vendor-backed hosting and support path rather than pure self-hosting.",
      "benefitsWho": "Organizations without dedicated server administrators."
    },
    {
      "title": "Named Integration Ecosystem",
      "toolA": "SuiteCRM documents a plugin ecosystem covering Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, and WhatsApp.",
      "toolB": "YetiForce's own materials disclose limited detail on specific third-party integrations, per its documented cons.",
      "whyItMatters": "Buyers who need specific integrations should confirm they're named rather than assumed.",
      "benefitsWho": "Teams needing confirmed integrations with tools like DocuSign or QuickBooks."
    },
    {
      "title": "Documented Scale of Adoption",
      "toolA": "SuiteCRM's facts don't publish comparable user or deployment counts, instead highlighting ISO 9001/27001 certification and Crown Commercial Service supplier status.",
      "toolB": "YetiForce documents adoption by roughly 23,000 firms across 100 countries, with a largest single deployment of 12,500 users.",
      "whyItMatters": "Proof of scale helps buyers gauge whether a self-hosted system holds up under large deployments.",
      "benefitsWho": "Larger organizations evaluating whether an open-source CRM can scale."
    },
    {
      "title": "Formal Certifications",
      "toolA": "SuiteCRM Ltd is ISO 9001 and ISO 27001 certified and a UK Crown Commercial Service supplier.",
      "toolB": "YetiForce's facts don't document equivalent formal certifications.",
      "whyItMatters": "Public-sector and regulated buyers often require formal quality and security certifications from vendors.",
      "benefitsWho": "Government and enterprise procurement teams with certification requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Capabilities",
      "rows": [
        {
          "feature": "Lead and opportunity management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Marketing segmentation/campaigns",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Customer service/case management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Reporting and dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "YetiForce includes a dynamic report builder."
        },
        {
          "feature": "Open REST API",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "ERP & Extended Modules",
      "rows": [
        {
          "feature": "Finance/invoicing module",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HR module",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Logistics/project management modules",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Combined CRM+ERP positioning",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SuiteCRM's documented features are CRM-only."
        }
      ]
    },
    {
      "group": "Deployment, Support & Trust",
      "rows": [
        {
          "feature": "Named third-party plugin integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SuiteCRM: Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, WhatsApp."
        },
        {
          "feature": "First-party managed hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SuiteCRM: from £50/month."
        },
        {
          "feature": "Paid support packages",
          "toolA": "available",
          "toolB": "limited",
          "note": "SuiteCRM: SuiteASSURED from £3,350/year; YetiForce mentions support/subscription services without published pricing."
        },
        {
          "feature": "Formal certifications (ISO, government supplier status)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented scale (installs/users)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "YetiForce: ~23,000 firms, 100 countries, 12,500-user largest deployment."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is SuiteCRM or YetiForce free?",
      "answer": "Both have a free open-source core. SuiteCRM's core software is free with optional paid managed hosting from £50/month and support packages; YetiForce is free with no license fees and only optional paid support via its marketplace."
    },
    {
      "question": "Which one includes ERP functionality?",
      "answer": "YetiForce combines CRM and ERP with 80+ modules including finance, HR, and logistics. SuiteCRM's documented features cover CRM functionality — sales, marketing, and service — without ERP modules."
    },
    {
      "question": "Which has more documented integrations?",
      "answer": "SuiteCRM names specific plugins including Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, and WhatsApp. YetiForce's own materials disclose limited detail on specific third-party integrations."
    },
    {
      "question": "Does either offer official managed hosting?",
      "answer": "SuiteCRM does, through Fully Managed Hosting starting from £50/month. YetiForce's facts don't list a first-party managed hosting plan."
    },
    {
      "question": "Which has stronger proof of enterprise-scale adoption?",
      "answer": "YetiForce documents roughly 23,000 firms across 100 countries with a 12,500-user deployment. SuiteCRM's facts highlight ISO 9001/27001 certification and Crown Commercial Service status rather than usage counts."
    },
    {
      "question": "Do either provide a public REST API?",
      "answer": "SuiteCRM explicitly documents an Open REST API for connecting to third-party systems. API access is not documented for YetiForce in the facts reviewed."
    }
  ]
};

export default suitecrmVsYetiforceContent;
