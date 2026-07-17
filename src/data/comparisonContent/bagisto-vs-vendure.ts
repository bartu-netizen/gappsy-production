import type { ToolComparisonContent } from './types';

const bagistoVsVendureContent: ToolComparisonContent = {
  "verdict": "Bagisto and Vendure are both free, open-source commerce platforms but built on different stacks for different use cases: Bagisto is a Laravel/PHP platform geared toward multi-vendor marketplaces, B2B/B2C storefronts, and point-of-sale in one package, while Vendure is a TypeScript/GraphQL (NestJS) headless framework with a deeper, purpose-built B2B feature set like quote-to-cash and contract pricing. Bagisto leans toward breadth (marketplace, POS, omnichannel) out of the box, while Vendure leans toward depth in B2B workflows and governance for complex commerce operations.",
  "bestForToolA": "Bagisto fits Laravel/PHP development teams that want a free platform to launch a multi-vendor marketplace, B2C storefront, or in-person POS operation from one codebase, backed by a large 26K+ star GitHub community.",
  "bestForToolB": "Vendure fits TypeScript/Node.js teams building complex B2B commerce with needs like quote-to-cash flows, bulk SKU ordering, and contract pricing, especially those wanting SSO and audit-trail governance controls, as used by brands like IBM, Breitling, and Swile.",
  "whoNeedsBoth": "There's no realistic scenario for combining them on one storefront — they're alternative commerce backends in different languages (PHP vs. TypeScript), so the choice depends on which stack and B2B depth the engineering team needs.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Bagisto is built on the Laravel PHP framework.",
      "toolB": "Vendure is built on TypeScript, Node.js (NestJS), and GraphQL.",
      "whyItMatters": "The language ecosystem determines which developers can maintain and extend the platform without ramping up on a new stack.",
      "benefitsWho": "PHP/Laravel shops benefit from Bagisto; TypeScript/Node shops benefit from Vendure."
    },
    {
      "title": "License",
      "toolA": "Bagisto's pricing model is listed as freemium with a free open-source self-hosted core plus paid Bagisto Cloud Hosting (price undisclosed).",
      "toolB": "Vendure Core is GPLv3-licensed and described as free forever, with a separately priced Platform tier requiring contact with sales.",
      "whyItMatters": "GPLv3's copyleft terms differ from typical permissive open-source licenses and can affect how derivative commercial products must be licensed.",
      "benefitsWho": "Legal/engineering teams assessing license compatibility with proprietary extensions they plan to build."
    },
    {
      "title": "B2B Workflow Depth",
      "toolA": "Bagisto supports B2B and B2C commerce from the same codebase but does not document specific B2B workflow features like quote-to-cash.",
      "toolB": "Vendure documents deep B2B workflows: quote-to-cash flows, bulk SKU entry, saved requisition lists, repeat-order flows, and customer-specific/contract pricing.",
      "whyItMatters": "Complex B2B buying processes (quotes, approvals, contract pricing) need purpose-built tooling that goes beyond generic B2B/B2C support.",
      "benefitsWho": "Wholesale and account-based B2B sellers with formal quoting and approval processes."
    },
    {
      "title": "Marketplace and Omnichannel",
      "toolA": "Bagisto includes built-in multi-vendor marketplace tools, a Point of Sale (POS) module, and multi-tenant SaaS support for hosting multiple stores.",
      "toolB": "Vendure's documented features focus on B2B workflows, pricing, governance, and search rather than a named POS or multi-tenant marketplace module.",
      "whyItMatters": "Merchants wanting to launch a marketplace with in-person POS in one package have more directly documented support from Bagisto.",
      "benefitsWho": "Marketplace operators and merchants needing both online and in-person (POS) selling channels."
    },
    {
      "title": "Governance and Search",
      "toolA": "Bagisto's documented features do not mention SSO, audit trails, or advanced search infrastructure.",
      "toolB": "Vendure documents SSO, audit trails, row-level permissions, content versioning, and Typesense-backed catalog search with a command palette.",
      "whyItMatters": "Enterprise buyers often require SSO and audit logging as a baseline security requirement; Vendure documents these natively.",
      "benefitsWho": "Enterprise IT and security teams needing built-in access governance and audit logging."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Hosting",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud/hosting option",
          "toolA": "available",
          "toolB": "limited",
          "note": "Bagisto Cloud Hosting available now; Vendure Cloud design-partner only"
        },
        {
          "feature": "GitHub community size",
          "toolA": "available",
          "toolB": "available",
          "note": "Bagisto 26K+ stars; Vendure 8.2K+ stars"
        }
      ]
    },
    {
      "group": "Commerce Features",
      "rows": [
        {
          "feature": "Multi-vendor marketplace",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Point of Sale (POS)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "B2B quote-to-cash workflows",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Contract/customer-specific pricing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Governance & Search",
      "rows": [
        {
          "feature": "SSO / audit trails",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Advanced catalog search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vendure: Typesense-backed"
        },
        {
          "feature": "Headless / API-first architecture",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bagisto or Vendure free?",
      "answer": "Both have free, open-source cores. Bagisto's core is free and open source with optional paid Bagisto Cloud Hosting (price undisclosed). Vendure Core is free forever under GPLv3, with a separately priced Platform tier."
    },
    {
      "question": "Which platform is better for a multi-vendor marketplace?",
      "answer": "Bagisto documents built-in multi-vendor marketplace tools directly in its feature list, along with a POS module. Vendure's documented features focus more on B2B workflows and governance rather than a named marketplace module."
    },
    {
      "question": "Which platform has deeper B2B features?",
      "answer": "Vendure documents more specific B2B tooling: quote-to-cash flows, bulk SKU entry, saved requisition lists, and contract pricing. Bagisto supports B2B and B2C from the same codebase but doesn't document equivalent named workflows."
    },
    {
      "question": "What technology stack does each platform use?",
      "answer": "Bagisto is built on Laravel (PHP). Vendure is built on TypeScript, Node.js (NestJS), and GraphQL."
    },
    {
      "question": "Does either platform offer point-of-sale (POS) functionality?",
      "answer": "Yes, Bagisto includes a documented POS module for in-person selling alongside its online store. Vendure's documented features do not mention POS."
    },
    {
      "question": "Which platform documents enterprise governance features like SSO?",
      "answer": "Vendure documents SSO, audit trails, row-level permissions, and content versioning as part of its governance tools. Bagisto's documented feature list does not mention these."
    }
  ]
};

export default bagistoVsVendureContent;
