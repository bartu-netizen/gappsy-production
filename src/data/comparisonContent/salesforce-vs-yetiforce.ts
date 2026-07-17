import type { ToolComparisonContent } from './types';

const salesforceVsYetiforceContent: ToolComparisonContent = {
  "verdict": "Salesforce and YetiForce both call themselves CRM platforms, but they sit at opposite ends of the cost and control spectrum. Salesforce is a paid, cloud-based family of interconnected Clouds (Sales, Service, Marketing) with a large AppExchange ecosystem, while YetiForce is a free, open-source, self-hosted system that combines CRM with ERP modules for finance, logistics, and HR. Neither is a drop-in replacement for the other's exact scope.",
  "bestForToolA": "Salesforce fits organizations with complex, non-standard sales and service processes who can budget for deep customization and, per its own FAQ, typically a dedicated administrator or implementation partner.",
  "bestForToolB": "YetiForce fits budget-constrained or IT-capable organizations that want CRM and ERP functionality (80+ modules spanning sales, marketing, support, finance, logistics, and HR) without license fees, and are willing to self-host.",
  "whoNeedsBoth": "A growing company could run YetiForce internally for finance/logistics/HR modules while still evaluating Salesforce Clouds for a specific sales team that needs AppExchange-level third-party integrations — though most organizations would consolidate onto one rather than run both CRMs simultaneously.",
  "keyDifferences": [
    {
      "title": "Licensing Cost",
      "toolA": "Salesforce uses a Paid pricing model with no starting price publicly listed in its own facts, and deep customization typically requires a dedicated administrator or implementation partner.",
      "toolB": "YetiForce is Free and open-source with no license fees; optional paid support and subscription services are available separately for enterprise-level assistance.",
      "whyItMatters": "Total cost of ownership diverges sharply between a licensed SaaS platform and a free, self-hosted system.",
      "benefitsWho": "Cash-constrained SMBs and technically capable IT teams benefit most from YetiForce's zero license cost."
    },
    {
      "title": "Deployment Model",
      "toolA": "Salesforce delivers its product as interconnected Clouds (Sales Cloud, Service Cloud, Marketing Cloud, and others) that share the same underlying customer data.",
      "toolB": "YetiForce is installed and customized on your own infrastructure at no software cost, as a self-hosted, open-source deployment.",
      "whyItMatters": "Self-hosting gives full data control but adds setup and maintenance burden, while a managed cloud product removes infrastructure work but reduces control.",
      "benefitsWho": "Organizations with strict data-residency or on-prem requirements benefit from YetiForce's self-hosted model."
    },
    {
      "title": "Scope: CRM vs. CRM+ERP",
      "toolA": "Salesforce's documented scope is CRM: sales, service, marketing, and commerce across its Clouds.",
      "toolB": "YetiForce explicitly combines CRM and ERP in one system, with 80+ modules covering marketing, sales, project management, customer support, finance, logistics, HR, and office administration.",
      "whyItMatters": "Companies wanting finance, HR, and logistics modules bundled with CRM avoid running a separate ERP system if they choose YetiForce.",
      "benefitsWho": "SMBs wanting one system for both CRM and back-office ERP functions benefit from YetiForce's combined scope."
    },
    {
      "title": "Third-Party Ecosystem",
      "toolA": "Salesforce offers AppExchange, a large marketplace of pre-built integrations and add-on apps covering nearly any industry-specific need.",
      "toolB": "YetiForce's official site discloses limited detail on specific third-party integrations, per its documented cons.",
      "whyItMatters": "Extensibility through a mature app marketplace versus building custom integrations changes how quickly a team can add specialized functionality.",
      "benefitsWho": "Teams needing prebuilt, industry-specific add-ons benefit from Salesforce's AppExchange."
    },
    {
      "title": "Implementation & Admin Requirements",
      "toolA": "Salesforce has a real learning curve, and per its own FAQ, a real deployment typically requires a dedicated administrator or implementation partner to configure well.",
      "toolB": "YetiForce's self-hosted deployment requires technical setup and maintenance, but is proven at scale with a largest reported deployment of 12,500 users among roughly 23,000 firms across 100 countries.",
      "whyItMatters": "The type of expertise needed differs — a Salesforce admin/consultant versus an in-house sysadmin for self-hosting.",
      "benefitsWho": "Organizations with existing Salesforce admin budget benefit from Salesforce; organizations with in-house IT capacity benefit from YetiForce."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Capabilities",
      "rows": [
        {
          "feature": "Sales pipeline management",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesforce via Sales Cloud; YetiForce via its sales module"
        },
        {
          "feature": "Marketing tools",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesforce via Marketing Cloud"
        },
        {
          "feature": "Customer support/service",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesforce via Service Cloud"
        },
        {
          "feature": "ERP functions (finance, HR, logistics)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of YetiForce's 80+ modules"
        },
        {
          "feature": "Dynamic report builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Build custom reports without external tools"
        },
        {
          "feature": "Built-in invoicing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Salesforce: Paid, no public starting price; YetiForce: Free, open-source"
        },
        {
          "feature": "Self-hosted deployment option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Third-party app marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Salesforce's AppExchange"
        },
        {
          "feature": "Optional paid support add-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available via YetiForce's marketplace"
        }
      ]
    },
    {
      "group": "Ecosystem & Scale",
      "rows": [
        {
          "feature": "Disclosed customer count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "~23,000 firms across 100 countries"
        },
        {
          "feature": "Largest deployment size disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "12,500 users"
        },
        {
          "feature": "Review platform recognition",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Capterra, G2, SourceForge"
        },
        {
          "feature": "Multiple interconnected products sharing data",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Salesforce's multi-Cloud architecture"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is YetiForce really free, unlike Salesforce?",
      "answer": "Yes. YetiForce is free and open-source with no license fees, while Salesforce uses a Paid pricing model with no published starting price in the facts here."
    },
    {
      "question": "Does YetiForce include ERP functionality that Salesforce doesn't?",
      "answer": "YetiForce explicitly combines CRM and ERP in one system across 80+ modules, including finance, logistics, and HR. Salesforce's documented scope is CRM only, spanning Sales Cloud, Service Cloud, and Marketing Cloud."
    },
    {
      "question": "Do I need a dedicated administrator for either platform?",
      "answer": "Salesforce typically requires a dedicated administrator or implementation partner per its own FAQ. YetiForce's self-hosted deployment requires technical setup and maintenance instead, without a licensing-driven admin requirement."
    },
    {
      "question": "Which platform has a larger third-party app ecosystem?",
      "answer": "Salesforce, through its AppExchange marketplace. YetiForce's site does not disclose extensive detail on specific third-party integrations."
    },
    {
      "question": "How many organizations use each platform?",
      "answer": "YetiForce reports roughly 23,000 firms across 100 countries, with a largest deployment of 12,500 users. Salesforce does not publish a specific customer count in these facts."
    },
    {
      "question": "Is Salesforce one single product?",
      "answer": "No — per Salesforce's own FAQ, it's a family of interconnected Clouds (Sales, Service, Marketing, and others) that share the same underlying customer data."
    }
  ]
};

export default salesforceVsYetiforceContent;
