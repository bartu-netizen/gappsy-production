import type { ToolComparisonContent } from './types';

const activepiecesVsNetboxContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business workflows across SaaS apps for HR, finance, marketing, and sales teams. NetBox is an open-source network source-of-truth platform for data center infrastructure (DCIM) and IP address management (IPAM), free to self-host with optional paid NetBox Cloud and NetBox Enterprise editions. They address unrelated problems — app workflow automation versus network infrastructure data modeling — so the comparison is mostly about category fit rather than head-to-head features.",
  "bestForToolA": "Business/ops teams automating workflows across SaaS apps like Gmail, paying per active flow starting at $5/month.",
  "bestForToolB": "Network engineering teams needing a central source of truth for racks, devices, IP addresses, VLANs, and circuits — free to self-host under Apache 2.0, with a plugin ecosystem and 21k+ GitHub stars.",
  "whoNeedsBoth": "A network operations team could maintain NetBox as its infrastructure source of truth and separately use Activepieces to automate downstream notification workflows, such as emailing stakeholders via Gmail when a device is provisioned — though no native connector between the two is documented.",
  "keyDifferences": [
    {
      "title": "Category & Purpose",
      "toolA": "Business workflow automation platform.",
      "toolB": "DCIM/IPAM network source-of-truth platform.",
      "whyItMatters": "These solve different jobs, so fit depends entirely on which problem a team actually has.",
      "benefitsWho": "Clarifies scope for anyone researching either category."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes exact pricing: $5/active flow/month (Standard), custom Ultimate plan on annual contract.",
      "toolB": "Core NetBox is free; NetBox Cloud and NetBox Enterprise pricing from NetBox Labs is not publicly published.",
      "whyItMatters": "Buyers evaluating total cost of ownership can get a concrete number from Activepieces but must contact sales for NetBox's advanced tiers.",
      "benefitsWho": "Procurement teams that need upfront pricing benefit from Activepieces' published Standard tier."
    },
    {
      "title": "Licensing",
      "toolA": "No free or open-source tier is documented; the product is paid.",
      "toolB": "Core NetBox is Apache 2.0 open source and free to self-host.",
      "whyItMatters": "Open licensing lets network teams adopt NetBox at zero software cost, unlike Activepieces.",
      "benefitsWho": "Network teams on constrained budgets benefit from NetBox's free Apache 2.0 core."
    },
    {
      "title": "Automation Role",
      "toolA": "Directly executes cross-app workflows through its \"pieces\" integration library.",
      "toolB": "Serves as a structured data source that separate network automation tools query, per its documented \"network automation source of truth\" feature, rather than an automation engine itself.",
      "whyItMatters": "NetBox doesn't run automations itself — it feeds other tooling — while Activepieces is the automation engine.",
      "benefitsWho": "Network engineers building automation pipelines benefit from NetBox as the data layer feeding those pipelines."
    },
    {
      "title": "Extensibility",
      "toolA": "Extends via prebuilt \"pieces\" integrations, such as Gmail.",
      "toolB": "Has a large community and vendor plugin ecosystem that extends its core data model, plus documented REST/GraphQL access.",
      "whyItMatters": "Teams needing to model custom network data types depend on NetBox's plugin ecosystem, which has no analogue in Activepieces.",
      "benefitsWho": "Network engineers with nonstandard infrastructure benefit from NetBox's plugin extensibility."
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
          "feature": "Data center infrastructure management (DCIM)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "IP address management (IPAM)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "NetBox is Apache 2.0"
        },
        {
          "feature": "Published SaaS/cloud pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "$5/active flow/month"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both unpublished except AP's Standard tier"
        }
      ]
    },
    {
      "group": "Extensibility & Access",
      "rows": [
        {
          "feature": "REST/GraphQL API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin ecosystem",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Audit logging",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "\"pieces\" e.g. Gmail"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is NetBox free?",
      "answer": "Core NetBox is open source under Apache 2.0 and free to self-host. NetBox Cloud and NetBox Enterprise are paid products from NetBox Labs with unpublished pricing."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's a paid product starting at $5 per active flow/month."
    },
    {
      "question": "Can Activepieces replace NetBox as a network source of truth?",
      "answer": "No — the facts don't document any DCIM/IPAM or network-data-modeling capability for Activepieces; NetBox is purpose-built for that."
    },
    {
      "question": "Does NetBox have an API?",
      "answer": "Yes, it exposes REST and GraphQL access for automation workflows and third-party tooling."
    },
    {
      "question": "How large is NetBox's community?",
      "answer": "21k+ GitHub stars, and it's cited as widely adopted as a network source of truth."
    },
    {
      "question": "What is NetBox Cloud?",
      "answer": "A fully-hosted SaaS version of NetBox offered by NetBox Labs, for teams that don't want to self-host."
    }
  ]
};

export default activepiecesVsNetboxContent;
