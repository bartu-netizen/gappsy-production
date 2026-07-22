import type { ToolComparisonContent } from './types';

const concreteCmsVsProcesswireContent: ToolComparisonContent = {
  "verdict": "Concrete CMS and ProcessWire both have free, self-hostable open-source cores, but Concrete CMS additionally sells paid hosted plans from $4.99/month (Starter) with stated SOC 2/HIPAA-compliant hosting options and ISO 27001-certified security, while ProcessWire documents no first-party hosted plans and instead positions itself as an API-driven core for developers, with built-in multi-language support and a small paid Pro Shop (ProCache, Form Builder, PAGEGRID) rather than a hosted product line.",
  "bestForToolA": "Concrete CMS suits teams that want in-context, live-page WYSIWYG editing plus compliance-oriented hosting (stated SOC 2/HIPAA options) without managing their own infrastructure.",
  "bestForToolB": "ProcessWire suits developers who want a minimal, API-driven CMS core with built-in multi-language support and a hierarchical page tree, self-hosted with no ongoing license fee.",
  "whoNeedsBoth": "There's no realistic scenario for running both on one site — a team would choose Concrete CMS if it wants managed, compliance-oriented hosting, or ProcessWire if it wants full self-hosted control over an API-driven core, but not both for the same project.",
  "keyDifferences": [
    {
      "title": "First-Party Hosted Plans",
      "toolA": "Concrete CMS sells paid hosted plans starting at $4.99/month (Starter: 1 editor, 10,000 monthly page views, 2GB storage), up to $19/month (Business) and a custom-quoted Custom SLA tier.",
      "toolB": "ProcessWire's facts document no pricing plans at all — no first-party hosted product, meaning self-hosting is the primary deployment path.",
      "whyItMatters": "Teams without in-house hosting expertise may prefer a vendor offering managed plans over configuring self-hosted infrastructure from scratch.",
      "benefitsWho": "Non-technical site owners who want a turnkey hosted option."
    },
    {
      "title": "Editing Philosophy",
      "toolA": "Concrete CMS's flagship feature is in-context WYSIWYG editing directly on the live page.",
      "toolB": "ProcessWire is explicitly API-driven, giving developers a simple, minimal-code API for accessing and manipulating content as its headline design principle rather than a live-page editing UI.",
      "whyItMatters": "In-context editing suits non-technical content editors, while an API-first core suits developers building custom front ends.",
      "benefitsWho": "Marketing and content teams (Concrete CMS) versus developers building bespoke applications (ProcessWire)."
    },
    {
      "title": "Compliance-Oriented Hosting",
      "toolA": "Concrete CMS states its hosting can offer SOC 2 and HIPAA-compliant options and describes its security as ISO 27001 certified.",
      "toolB": "ProcessWire's facts don't document any compliance certifications or hosted-plan compliance options.",
      "whyItMatters": "Regulated industries (healthcare, finance) often require documented compliance certifications from their hosting vendor.",
      "benefitsWho": "Organizations in regulated industries needing documented compliance for their web platform."
    },
    {
      "title": "Permission Granularity",
      "toolA": "Concrete CMS offers role-based permissions down to individual content blocks.",
      "toolB": "ProcessWire documents a granular role-based access control system controlling what editors and users can do.",
      "whyItMatters": "Block-level permission granularity can matter for large sites with many contributors editing shared pages.",
      "benefitsWho": "Large editorial teams needing fine-grained control over who can edit specific page sections."
    },
    {
      "title": "Project Maturity & Lineage",
      "toolA": "Concrete CMS traces back to 2003 (originally released as concrete5), giving it a longer track record.",
      "toolB": "ProcessWire launched in 2010, with a smaller GitHub footprint (about 1.1k stars) than mainstream CMS competitors.",
      "whyItMatters": "Project age can correlate with ecosystem maturity, though smaller projects can still be well-maintained and stable.",
      "benefitsWho": "Risk-averse teams weighing project longevity in their vendor selection."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing & Content Model",
      "rows": [
        {
          "feature": "In-context/live-page WYSIWYG editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "API-driven content access as core design",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Hierarchical, unlimited-depth page tree",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Version history & change logs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-in multi-language support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Permissions & Compliance",
      "rows": [
        {
          "feature": "Role-based permissions",
          "toolA": "available",
          "toolB": "available",
          "note": "Concrete CMS: down to individual content blocks"
        },
        {
          "feature": "Built-in approval workflows",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "SOC 2 / HIPAA-compliant hosting options",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "ISO 27001 security certification claim",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "available",
          "toolB": "available",
          "note": "Concrete CMS: MIT; ProcessWire: mainly MPL 2.0"
        },
        {
          "feature": "First-party paid hosted plans",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Concrete CMS: from $4.99/month"
        },
        {
          "feature": "Optional paid add-on modules",
          "toolA": "available",
          "toolB": "available",
          "note": "ProcessWire: ProCache, Form Builder, PAGEGRID"
        },
        {
          "feature": "Custom self-managed enterprise deployment (CI/CD)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Concrete CMS: Custom SLA via GitLab"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both free to self-host?",
      "answer": "Yes. Concrete CMS's MIT-licensed core and ProcessWire's mainly MPL 2.0-licensed core can both be self-hosted for free."
    },
    {
      "question": "Does either offer first-party managed hosting?",
      "answer": "Concrete CMS sells hosted plans starting at $4.99/month (Starter). ProcessWire's facts document no first-party hosted plans, only self-hosting."
    },
    {
      "question": "Which is more compliance-oriented out of the box?",
      "answer": "Concrete CMS states SOC 2 and HIPAA-compliant hosting options and ISO 27001-certified security. ProcessWire's facts don't document comparable compliance certifications."
    },
    {
      "question": "How do their editing philosophies differ?",
      "answer": "Concrete CMS emphasizes in-context editing directly on the live page for non-technical editors. ProcessWire is built around a developer-facing API for minimal-code content access."
    },
    {
      "question": "Which has been around longer?",
      "answer": "Concrete CMS traces to 2003 (originally released as concrete5). ProcessWire was founded in 2010."
    },
    {
      "question": "Does either include paid optional modules beyond the free core?",
      "answer": "Yes for both. Concrete CMS layers compliance and scale into paid hosted plans, while ProcessWire sells specific Pro Shop modules like ProCache, Form Builder, and PAGEGRID Page Builder."
    }
  ]
};

export default concreteCmsVsProcesswireContent;
