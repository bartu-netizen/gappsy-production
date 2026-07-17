import type { ToolComparisonContent } from './types';

const dolibarrVsIdempiereContent: ToolComparisonContent = {
  "verdict": "Dolibarr and iDempiere are both completely free, open-source ERP/CRM suites, but they document different strengths: Dolibarr names explicit modules for CRM/sales, HR (leave, timesheets, expenses), finance, and inventory under a formally named Dolibarr Association, while iDempiere is built on a specific Java/ZK/OSGi stack with documented multi-entity support and scalability to hundreds of concurrent users, maintained by a global volunteer community. Neither is a blanket winner; the choice comes down to which documented module set and technology stack fits your organization.",
  "bestForToolA": "Small and mid-sized businesses wanting one modular, free system that explicitly covers CRM/sales, HR (leave, timesheets, expenses), finance, and inventory without needing to enable unused modules.",
  "bestForToolB": "Organizations needing a Java/OSGi-based Tier II ERP with documented multi-entity support and scalability to hundreds of concurrent users, particularly those already running Oracle or PostgreSQL.",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously — both are general-purpose, free, self-hosted ERP/CRM suites competing for the same role, so a buyer would pilot and choose one rather than operate both in parallel.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Dolibarr doesn't document a specific named framework beyond platform compatibility (Windows, Mac, Linux, Docker, and cloud deployments).",
      "toolB": "iDempiere is explicitly built on Java, ZK, and OSGi, compatible with both Oracle and PostgreSQL databases, using Maven for project management.",
      "whyItMatters": "Technical teams need to know what stack they'll be maintaining and what developer skills are required.",
      "benefitsWho": "Java-experienced development teams evaluating iDempiere's OSGi/Maven-based architecture."
    },
    {
      "title": "Multi-Entity & Scale Positioning",
      "toolA": "Dolibarr documents a modular design so organizations \"enable only the features they need,\" but doesn't make an explicit multi-entity or hundreds-of-concurrent-users claim.",
      "toolB": "iDempiere explicitly documents multi-entity support (multiple business entities from a single login) and scalability \"from small servers up to environments serving hundreds of concurrent users,\" positioned as a Tier II ERP.",
      "whyItMatters": "Larger or multi-subsidiary organizations need confirmed multi-entity and concurrency support before committing.",
      "benefitsWho": "Mid-sized to larger organizations with multiple business units lean toward iDempiere's documented multi-entity and scale claims."
    },
    {
      "title": "Functional Breadth",
      "toolA": "Dolibarr explicitly documents CRM/sales, HR management (expense reports, leave requests, timesheets), finance (billing, accounting, bank reconciliation), inventory (stock, purchasing, manufacturing), and productivity tools (projects, tasks, agenda).",
      "toolB": "iDempiere documents enterprise-grade accounting and multi-entity support, but doesn't name equivalent HR (leave/timesheets) or inventory/manufacturing modules.",
      "whyItMatters": "Buyers needing named HR functionality like leave requests and timesheets have that explicitly documented only for Dolibarr.",
      "benefitsWho": "SMBs wanting one system covering HR alongside finance and CRM lean toward Dolibarr's documented module list."
    },
    {
      "title": "Release & Maintenance Model",
      "toolA": "Dolibarr doesn't name a specific current release/version in the facts.",
      "toolB": "iDempiere names a specific current LTS release, \"iDempiere 13 'Orion,'\" with security enhancements and performance improvements.",
      "whyItMatters": "An explicit named LTS release signals a defined support and upgrade cadence.",
      "benefitsWho": "IT teams planning long-term upgrade cycles benefit from iDempiere's named LTS release cadence."
    },
    {
      "title": "Governance",
      "toolA": "Dolibarr is overseen by the Dolibarr Association, founded in 2009, backed by a large international community of developers, translators, and testers.",
      "toolB": "iDempiere is maintained by a volunteer community of subject matter specialists, implementors, developers, and end-users worldwide, founded in 2011, with no named foundation or association.",
      "whyItMatters": "A named association versus a described volunteer community may signal different levels of formal governance structure.",
      "benefitsWho": "Organizations wanting a formally named oversight body may feel more confident with Dolibarr's Association structure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Modules",
      "rows": [
        {
          "feature": "CRM/sales management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "HR (leave, timesheets, expenses)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Inventory/manufacturing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Enterprise accounting",
          "toolA": "available",
          "toolB": "available",
          "note": "iDempiere names this explicitly as \"enterprise-grade accounting\""
        },
        {
          "feature": "Multi-entity management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Technology & Deployment",
      "rows": [
        {
          "feature": "Named technology stack",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Java, ZK, OSGi, Maven"
        },
        {
          "feature": "Database support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Oracle and PostgreSQL"
        },
        {
          "feature": "Platform compatibility",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dolibarr: Windows, Mac, Linux, Docker, cloud"
        },
        {
          "feature": "APIs / import-export",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Governance & Support",
      "rows": [
        {
          "feature": "Named oversight body",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dolibarr Association, founded 2009"
        },
        {
          "feature": "Founded year",
          "toolA": "available",
          "toolB": "available",
          "note": "Dolibarr 2009, iDempiere 2011"
        },
        {
          "feature": "Official paid hosting/support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dolibarr: via third-party partners"
        },
        {
          "feature": "Documented LTS release",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "iDempiere 13 \"Orion\""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Dolibarr and iDempiere both free?",
      "answer": "Yes, both are completely free and open-source with no pricing plans published."
    },
    {
      "question": "Which has documented HR functionality?",
      "answer": "Dolibarr explicitly documents HR management including expense reports, leave requests, and timesheets; iDempiere's facts don't name equivalent HR modules."
    },
    {
      "question": "What technology stack does each run on?",
      "answer": "iDempiere is built on Java, ZK, and OSGi, and supports Oracle and PostgreSQL databases with Maven; Dolibarr's specific tech stack isn't documented, though it runs on Windows, Mac, Linux, Docker, and cloud deployments."
    },
    {
      "question": "Which is better suited to multi-entity organizations?",
      "answer": "iDempiere explicitly documents multi-entity support, letting one login manage multiple business entities, and states it scales to hundreds of concurrent users; this isn't explicitly documented for Dolibarr."
    },
    {
      "question": "Who maintains each project?",
      "answer": "Dolibarr is overseen by the Dolibarr Association (founded 2009); iDempiere is maintained by a global volunteer community of specialists and developers (founded 2011), without a named foundation."
    },
    {
      "question": "Can I get paid support for either?",
      "answer": "Dolibarr documents that paid hosting and support are available through third-party partner companies; iDempiere doesn't document an equivalent paid support channel in the facts."
    }
  ]
};

export default dolibarrVsIdempiereContent;
