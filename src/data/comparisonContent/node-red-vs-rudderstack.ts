import type { ToolComparisonContent } from './types';

const nodeRedVsRudderstackContent: ToolComparisonContent = {
  "verdict": "Node-RED and RudderStack both move data between systems, but for different purposes: Node-RED is a free, open-source, general-purpose visual flow editor for wiring together hardware, APIs, and services (including IoT/edge devices), while RudderStack is a warehouse-native customer data platform for collecting, governing, and activating customer/behavioral event data with compliance coverage for regulated industries. They're rarely direct alternatives; the right choice depends on whether you're automating arbitrary devices and APIs or building a customer data infrastructure.",
  "bestForToolA": "Makers, IoT engineers, and hobbyists who need a free, open-source, browser-based visual editor for wiring together hardware, APIs, and services, including deployment directly on Raspberry Pi, BeagleBone Black, or Arduino.",
  "bestForToolB": "Data, growth, and engineering teams who need a warehouse-native customer data platform to collect events from 16 SDKs, govern and validate that data, and activate it across 200+ destinations, with compliance coverage for GDPR, HIPAA, SOC 2, and CCPA.",
  "whoNeedsBoth": "A product team could use Node-RED to wire together IoT devices or internal API automations, and separately use RudderStack to collect and route the resulting event data into their analytics warehouse and marketing tools — complementary roles in the same broader data and automation stack rather than competing products.",
  "keyDifferences": [
    {
      "title": "Product Category & Primary Use Case",
      "toolA": "Node-RED is a general-purpose visual flow-based tool for wiring together hardware, APIs, and online services, widely used for IoT/home automation and general task automation.",
      "toolB": "RudderStack is a purpose-built customer data platform (CDP) for collecting, unifying, and activating customer/behavioral event data across a 16-SDK collection layer and 200+ downstream destinations.",
      "whyItMatters": "Node-RED is a general automation canvas, while RudderStack is specialized for customer/product analytics data pipelines — the right choice depends on whether you're wiring arbitrary devices/APIs or building a customer data infrastructure.",
      "benefitsWho": "IoT hobbyists and engineers building device automations need Node-RED; data, growth, and marketing teams building a customer data stack need RudderStack."
    },
    {
      "title": "Pricing",
      "toolA": "Node-RED is completely free and open source with no pricing plans or paid tiers at all.",
      "toolB": "RudderStack is freemium — free up to 250K events/month, then $265/month (Growth) for up to 1 million events/month, scaling to custom Enterprise pricing.",
      "whyItMatters": "Node-RED has zero licensing cost regardless of scale (only infrastructure costs), while RudderStack's cost grows with event volume.",
      "benefitsWho": "Cost-sensitive hobbyist/IoT projects favor Node-RED's zero cost; companies needing warehouse-native CDP capabilities budget for RudderStack's usage-based pricing."
    },
    {
      "title": "Hosting & Governance",
      "toolA": "Node-RED has no official Node-RED-run cloud hosting; commercial hosting is provided by third-party sponsor FlowFuse, and the project is governed by the OpenJS Foundation.",
      "toolB": "RudderStack offers both a managed cloud product and a self-hosted open-source version under the Elastic 2.0 license, available on all plans.",
      "whyItMatters": "RudderStack gives buyers an official managed-cloud-or-self-host choice from one vendor, while Node-RED's cloud option comes through a separate third-party sponsor rather than the core project itself.",
      "benefitsWho": "Teams wanting one vendor to manage both cloud and self-hosted options favor RudderStack; teams comfortable assembling their own hosting favor Node-RED plus FlowFuse or their own Docker/Node.js deployment."
    },
    {
      "title": "Data Governance & Compliance",
      "toolA": "No compliance certifications or data-governance feature is documented for Node-RED, as it's a general-purpose flow tool.",
      "toolB": "RudderStack documents schema management, event validation, consent automation, and PII handling as a named \"Data Governance\" feature, plus GDPR, SOC 2 Type 2, CCPA, and HIPAA compliance.",
      "whyItMatters": "Companies handling regulated customer data need documented compliance and governance tooling, which is central to RudderStack's product but outside Node-RED's scope.",
      "benefitsWho": "Teams processing customer PII or operating in regulated industries (healthcare, EU markets) need RudderStack's compliance coverage."
    },
    {
      "title": "Deployment Targets",
      "toolA": "Node-RED explicitly runs on low-cost edge/IoT hardware (Raspberry Pi, BeagleBone Black, Arduino) as well as Android, in addition to standard Docker/Node.js and cloud deployment.",
      "toolB": "RudderStack connects directly to cloud data warehouses (Snowflake, BigQuery, Redshift, Databricks, Azure) as its \"Warehouse-Native Architecture,\" with no edge/IoT device deployment documented.",
      "whyItMatters": "Node-RED can run directly on physical/edge devices, a deployment target RudderStack doesn't address; RudderStack instead is built to plug directly into cloud data warehouses.",
      "benefitsWho": "Makers and industrial/IoT engineers need Node-RED's edge deployment; data engineering teams need RudderStack's direct warehouse integrations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Visual flow/wiring editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Customer event data collection (SDKs)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RudderStack: 16 SDKs"
        },
        {
          "feature": "IoT/edge device deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Node-RED: Raspberry Pi, BeagleBone, Arduino, Android"
        },
        {
          "feature": "Warehouse-native data delivery",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Snowflake, BigQuery, Redshift, Databricks, Azure"
        }
      ]
    },
    {
      "group": "Extensibility & Integrations",
      "rows": [
        {
          "feature": "Community node/integration library",
          "toolA": "available",
          "toolB": "available",
          "note": "Node-RED: 5,000+ nodes; RudderStack: 200+ destinations"
        },
        {
          "feature": "AI-assisted workflows",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RudderAI Agentic Workflows"
        },
        {
          "feature": "Self-hosted open-source option",
          "toolA": "available",
          "toolB": "available",
          "note": "RudderStack: Elastic 2.0 license, all plans"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Node-RED: entire product free; RudderStack: 250K events/month"
        },
        {
          "feature": "Paid tier starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "RudderStack Growth: $265/month"
        },
        {
          "feature": "GDPR/HIPAA/SOC2/CCPA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official vendor-run cloud hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Node-RED relies on third-party sponsor FlowFuse instead"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Node-RED free?",
      "answer": "Yes, Node-RED is completely free and open source with no pricing plans, distributed via npm."
    },
    {
      "question": "Does RudderStack have a free plan?",
      "answer": "Yes, a free plan with 250K events/month, 16 SDK sources, and 200+ destinations, for up to 10 team members."
    },
    {
      "question": "What is each tool actually built for?",
      "answer": "Node-RED is a general-purpose visual tool for wiring together hardware, APIs, and online services, including IoT/edge devices; RudderStack is a customer data platform for collecting, unifying, and activating customer/behavioral data into warehouses and marketing tools."
    },
    {
      "question": "Can either be self-hosted?",
      "answer": "Yes — Node-RED is open source and can be self-hosted via Docker/Node.js, or run on FlowFuse, AWS, or Azure; RudderStack offers a self-hosted open-source version under the Elastic 2.0 license on all plans, alongside its managed cloud product."
    },
    {
      "question": "Does RudderStack support compliance requirements Node-RED doesn't?",
      "answer": "Yes, RudderStack documents GDPR, SOC 2 Type 2, CCPA, and HIPAA compliance along with dedicated data-governance features (schema management, consent automation, PII handling); no equivalent compliance documentation exists for Node-RED."
    },
    {
      "question": "How much does RudderStack cost above the free tier?",
      "answer": "The Growth plan is $265/month (with a 15% discount for annual billing), covering up to 1 million events/month; Enterprise is custom priced."
    }
  ]
};

export default nodeRedVsRudderstackContent;
