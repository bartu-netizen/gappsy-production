import type { ToolComparisonContent } from './types';

const concreteCmsVsTypo3Content: ToolComparisonContent = {
  "verdict": "Concrete CMS and TYPO3 both have free, open-source self-hosted cores, but they target different scales of deployment: TYPO3 is built from the ground up for native multi-site and multi-language operation, is governed by a nonprofit member association with formal Long-Term Support (LTS) release cycles, and has no paid product tiers documented beyond its free Community plan; Concrete CMS is a company-maintained (PortlandLabs) platform that additionally sells paid hosted plans from $4.99/month with stated SOC 2/HIPAA-compliant options and ISO 27001-certified security, emphasizing in-context editing and block-level permissions.",
  "bestForToolA": "Concrete CMS suits teams that want in-context WYSIWYG editing, block-level permissions, and a paid managed hosting path with stated SOC 2/HIPAA-compliant options.",
  "bestForToolB": "TYPO3 suits organizations — especially in Europe's public sector — that need native multi-site, multi-language operation from a single install and value formal LTS release cycles backed by a nonprofit member association.",
  "whoNeedsBoth": "A multinational organization might run TYPO3 for its complex multi-site, multi-language corporate web presence while a separate department uses Concrete CMS's in-context editing for a smaller, single-language microsite that non-technical staff need to update directly on the page.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Concrete CMS's core is free to self-host, but the company additionally sells paid hosted plans starting at $4.99/month (Starter) up to a custom-quoted Custom SLA tier.",
      "toolB": "TYPO3's core CMS is entirely free with no paid tiers documented at all beyond its free Community plan.",
      "whyItMatters": "Buyers evaluating total cost need to know whether a first-party paid product line exists or whether all deployment paths are free and self-managed.",
      "benefitsWho": "Budget-conscious organizations comparing a fully-free option against one with an optional paid hosted tier."
    },
    {
      "title": "Multi-Site & Multi-Language Architecture",
      "toolA": "Concrete CMS's facts don't document an equivalent native multi-site/multi-language core capability.",
      "toolB": "TYPO3 is built from the ground up to run many websites in many languages from a single installation, sharing templates and resources without extra modules.",
      "whyItMatters": "Native multi-site/multi-language support avoids the complexity of bolting on separate installs or plugins for each site or locale.",
      "benefitsWho": "Multinational organizations and agencies managing many localized sites from one platform."
    },
    {
      "title": "Governance Model",
      "toolA": "Concrete CMS is maintained by PortlandLabs, a company based in Portland, Oregon.",
      "toolB": "TYPO3 is governed by the nonprofit TYPO3 Association (1,000+ members) via a democratic General Assembly voting process, with TYPO3 GmbH — fully owned by the Association — providing commercial services.",
      "whyItMatters": "Nonprofit, member-governed projects can offer different long-term stability guarantees than a single company's roadmap.",
      "benefitsWho": "Public-sector and long-horizon institutional buyers valuing vendor-neutral governance."
    },
    {
      "title": "Release & Support Cadence",
      "toolA": "Concrete CMS's facts don't document a formal Long-Term Support program, instead offering tiered hosted plans and a Custom SLA for enterprise deployment support.",
      "toolB": "TYPO3 offers formal Long-Term Support (LTS) release cycles with multi-year stability, plus optional Extended LTS (ELTS) for even longer support windows.",
      "whyItMatters": "Formal LTS commitments give IT teams predictable upgrade timelines for long-running enterprise deployments.",
      "benefitsWho": "Enterprise IT teams planning multi-year upgrade cycles."
    },
    {
      "title": "Project Age & Adoption",
      "toolA": "Concrete CMS dates to 2003 (originally released as concrete5), a mature, long-running project.",
      "toolB": "TYPO3 dates to 1997, created by Kasper Skårhøj, with deep adoption in European government and public-sector organizations.",
      "whyItMatters": "Longer track records and sector-specific adoption patterns can signal fit for particular institutional buyers.",
      "benefitsWho": "European public-sector and government organizations evaluating platform track record."
    }
  ],
  "featureMatrix": [
    {
      "group": "Multi-site & Localization",
      "rows": [
        {
          "feature": "Native multi-site support from a single install",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Native multi-language content support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Backend/admin UI translations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TYPO3: 40+ languages via Crowdin"
        },
        {
          "feature": "In-context, live-page WYSIWYG editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Governance & Support",
      "rows": [
        {
          "feature": "Nonprofit, member-governed project structure",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Concrete CMS is maintained by PortlandLabs, a company"
        },
        {
          "feature": "Formal Long-Term Support (LTS) release cycles",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TYPO3 also offers optional Extended LTS"
        },
        {
          "feature": "Quote-based enterprise support/partner tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Concrete CMS: Custom SLA; TYPO3: certified partner network via TYPO3 GmbH"
        },
        {
          "feature": "Approval workflows & version history",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost & Compliance",
      "rows": [
        {
          "feature": "Fully free core with no paid product tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Concrete CMS sells paid hosted plans from $4.99/month"
        },
        {
          "feature": "First-party paid hosted plans",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Compliance-oriented hosting (SOC 2/HIPAA options)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Role-based, block-level permissions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is completely free with no paid product tiers?",
      "answer": "TYPO3's core CMS has no pricing tiers beyond its free Community plan. Concrete CMS's core is also free to self-host, but the company additionally sells paid hosted plans starting at $4.99/month."
    },
    {
      "question": "Which has stronger native multi-site/multi-language support?",
      "answer": "TYPO3, whose core is built to run many sites and languages from a single installation, with an admin backend translatable into 40+ languages via Crowdin. Concrete CMS's facts don't document a comparable native capability."
    },
    {
      "question": "How is each project governed?",
      "answer": "TYPO3 is governed by the nonprofit TYPO3 Association via a member General Assembly voting process. Concrete CMS is maintained by PortlandLabs, a company based in Portland, Oregon."
    },
    {
      "question": "Does either offer formal long-term support commitments?",
      "answer": "TYPO3 documents Long-Term Support (LTS) and optional Extended LTS (ELTS) release cycles. Concrete CMS's facts don't document an equivalent formal LTS program."
    },
    {
      "question": "Which offers first-party compliance-certified hosting?",
      "answer": "Concrete CMS states SOC 2/HIPAA-compliant hosting options and ISO 27001-certified security on its paid plans. TYPO3's facts don't document comparable compliance certifications for a first-party hosted offering."
    },
    {
      "question": "How old is each project?",
      "answer": "TYPO3 dates to 1997, created by Kasper Skårhøj. Concrete CMS dates to 2003, originally released as concrete5."
    }
  ]
};

export default concreteCmsVsTypo3Content;
