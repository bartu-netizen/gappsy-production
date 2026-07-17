import type { ToolComparisonContent } from './types';

const makeVsStreamsetsContent: ToolComparisonContent = {
  "verdict": "Make is a no-code visual automation platform aimed at connecting SaaS apps and running business workflows, while StreamSets (now IBM StreamSets) is an enterprise hybrid data-pipeline platform for building and running streaming and batch data integration across multi-cloud and on-prem environments. Make is priced and packaged for individuals and small teams to automate app-to-app processes; StreamSets is priced and packaged as custom/enterprise software for data engineering teams moving large volumes of structured and unstructured data. The two rarely compete directly — they sit at different layers of a company's stack.",
  "bestForToolA": "Make fits teams automating day-to-day business processes across CRMs, spreadsheets, and marketing tools using a visual scenario builder with routers and branching logic, with plans starting free and paid tiers from around $9/month.",
  "bestForToolB": "StreamSets fits data engineering teams that need to build streaming and batch pipelines with automatic data drift handling and deployment across AWS, Azure, Google Cloud, private VPC, or on-prem infrastructure, backed by IBM's enterprise support.",
  "whoNeedsBoth": "A company's data engineering team could use StreamSets to move large-scale streaming and batch data between databases and cloud warehouses, while a separate operations or marketing team uses Make to automate lighter-weight, app-to-app business workflows that don't require heavy data-pipeline infrastructure.",
  "keyDifferences": [
    {
      "title": "Target User",
      "toolA": "Make is built for business users and no-code automators connecting SaaS apps via a drag-and-drop scenario canvas.",
      "toolB": "StreamSets is built for data engineers building production data pipelines, with a no-code/low-code pipeline builder aimed at reducing coding for pipeline construction.",
      "whyItMatters": "The intended user shapes the learning curve, the pricing model, and the kind of infrastructure decisions each tool assumes.",
      "benefitsWho": "Operations and marketing teams benefit from Make's accessibility; data engineering teams benefit from StreamSets' pipeline-specific tooling."
    },
    {
      "title": "Data Handling Model",
      "toolA": "Make moves data between apps using iterators, aggregators, and built-in transformation functions inside individual automation scenarios.",
      "toolB": "StreamSets is built specifically around streaming and batch data pipelines in one platform, with automatic data drift handling so pipelines adapt to schema changes in source data.",
      "whyItMatters": "Data drift handling and dedicated streaming support matter for high-volume, schema-changing data feeds that a general automation tool isn't designed to absorb.",
      "benefitsWho": "Data teams dealing with large or frequently changing source schemas benefit from StreamSets' drift handling."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Make publishes tiered pricing: a Free plan, Core from around $9/month, Pro from around $16/month, and Teams from around $29/month, plus custom Enterprise.",
      "toolB": "StreamSets does not publicly list pricing; it requires contacting sales, consistent with its custom/enterprise pricing model.",
      "whyItMatters": "Transparent pricing lets small teams self-serve and budget quickly, while custom pricing suits larger deployments with negotiated enterprise contracts.",
      "benefitsWho": "Budget-conscious small teams benefit from Make's published tiers; enterprise buyers benefit from StreamSets' negotiated, IBM-backed contracts."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Make is a hosted SaaS platform with no documented self-hosted or private-cloud deployment option.",
      "toolB": "StreamSets supports deployment on AWS, Azure, Google Cloud, in a private VPC, or on local infrastructure, with a central control plane for monitoring pipelines across environments.",
      "whyItMatters": "Hybrid and on-prem deployment options matter for regulated industries or companies with existing multi-cloud infrastructure commitments.",
      "benefitsWho": "Enterprises with hybrid or regulated infrastructure requirements benefit from StreamSets' deployment flexibility."
    },
    {
      "title": "Ownership & Backing",
      "toolA": "Make was founded in 2012 (as Integromat), acquired by Celonis in 2020, and rebranded as Make in 2022.",
      "toolB": "StreamSets is now sold and supported as an IBM product, marketed as IBM StreamSets, backed by IBM's enterprise support and ecosystem.",
      "whyItMatters": "Corporate backing affects long-term roadmap direction, support SLAs, and how the tool integrates with a buyer's existing vendor relationships.",
      "benefitsWho": "IBM-shop enterprises benefit from StreamSets' IBM backing; independent SaaS-focused teams benefit from Make's Celonis-backed roadmap."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Functionality",
      "rows": [
        {
          "feature": "Visual/no-code builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Make: flowchart scenario canvas; StreamSets: drag-and-drop pipeline designer"
        },
        {
          "feature": "Pre-built connectors/integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Make: thousands of app modules; StreamSets: library of database/app/cloud connectors"
        },
        {
          "feature": "Streaming data processing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "StreamSets supports real-time streaming pipelines"
        },
        {
          "feature": "Automatic schema/data drift handling",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pipelines auto-adapt to schema changes in source data"
        },
        {
          "feature": "Routers/branching logic",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make scenarios split into conditional paths"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Public pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "StreamSets requires contacting sales"
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "No public free tier listed for StreamSets"
        },
        {
          "feature": "Entry price point",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make Core from ~$9/month"
        }
      ]
    },
    {
      "group": "Deployment & Support",
      "rows": [
        {
          "feature": "Hybrid/on-prem deployment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "StreamSets: AWS, Azure, GCP, private VPC, or local infrastructure"
        },
        {
          "feature": "Multi-cloud central control plane",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Enterprise vendor backing",
          "toolA": "available",
          "toolB": "available",
          "note": "Make: Celonis-owned; StreamSets: IBM-owned"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Make a substitute for StreamSets in a data engineering pipeline?",
      "answer": "Generally no. Make is a no-code automation tool for connecting SaaS apps and running business workflows, while StreamSets is purpose-built for streaming and batch data pipelines with automatic data drift handling and multi-cloud/on-prem deployment — the kind of infrastructure a data engineering team, not a business operations team, typically owns."
    },
    {
      "question": "Does StreamSets have a free plan like Make?",
      "answer": "No public free tier is listed for StreamSets; pricing requires contacting IBM sales. Make, by contrast, offers a Free plan with a limited monthly operations/credits allowance."
    },
    {
      "question": "Can StreamSets run outside a public cloud?",
      "answer": "Yes. StreamSets supports deployment on AWS, Azure, Google Cloud, in a private VPC, or on local infrastructure. Make does not document a self-hosted or private deployment option — it is delivered as hosted SaaS."
    },
    {
      "question": "Who owns StreamSets and Make today?",
      "answer": "StreamSets is now part of IBM's product portfolio, marketed as IBM StreamSets. Make was founded in 2012 as Integromat, acquired by Celonis in 2020, and rebranded as Make in 2022."
    },
    {
      "question": "Which tool handles real-time streaming data?",
      "answer": "StreamSets explicitly supports both real-time streaming and scheduled batch processing from the same platform. Make is oriented around triggered and scheduled automation scenarios rather than dedicated data-streaming pipelines."
    },
    {
      "question": "How does pricing compare between the two?",
      "answer": "Make publishes tiered pricing starting with a Free plan and paid tiers from around $9/month (Core) up to custom Enterprise pricing. StreamSets does not publish pricing at all and requires a sales conversation, consistent with its custom/enterprise positioning."
    }
  ]
};

export default makeVsStreamsetsContent;
