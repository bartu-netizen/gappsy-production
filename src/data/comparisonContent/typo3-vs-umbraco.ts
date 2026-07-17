import type { ToolComparisonContent } from './types';

const typo3VsUmbracoContent: ToolComparisonContent = {
  "verdict": "TYPO3 and Umbraco are both open-source enterprise CMS platforms with free self-hosted cores, but they run on different stacks and are governed differently. TYPO3 is a PHP-based, GPL v2-licensed CMS with native multi-site/multi-language architecture built into the core, governed by a nonprofit Association with 1,000+ members and widely adopted in European government and public-sector projects. Umbraco is an MIT-licensed .NET CMS backed by the commercial company Umbraco A/S (owned by growth investor Monterro since 2021), with a published managed-cloud product (Umbraco Cloud, from €45/month) and a backoffice localized into 20+ languages. The right pick largely depends on whether a team's infrastructure favors PHP or .NET, and whether transparent managed-cloud pricing matters.",
  "bestForToolA": "TYPO3 suits organizations, especially government and public-sector bodies in Europe, that need native multi-site/multi-language publishing from a single install and prefer a nonprofit-governed open-source project with LTS release cycles.",
  "bestForToolB": "Umbraco suits teams already invested in Microsoft/.NET infrastructure who want a published, tiered managed-cloud pricing path starting at €45/month and built-in AI tooling for content editors.",
  "whoNeedsBoth": "There's no realistic single-project scenario for running both since they're alternative full CMS platforms on different stacks. A digital agency serving both PHP-shop and .NET-shop clients might maintain expertise in both to match each client's existing infrastructure, but wouldn't deploy both on one site.",
  "keyDifferences": [
    {
      "title": "Underlying Tech Stack",
      "toolA": "TYPO3 is a PHP-based CMS with a GPL v2 (or later) license.",
      "toolB": "Umbraco runs on .NET/ASP.NET Core and is licensed under MIT.",
      "whyItMatters": "The stack determines what hosting environment, developer skills, and existing infrastructure a team needs.",
      "benefitsWho": "Teams that already standardize on PHP or Microsoft/.NET infrastructure."
    },
    {
      "title": "Managed Cloud Pricing",
      "toolA": "TYPO3 has no official managed-cloud product documented; paid support is available only via TYPO3 GmbH and certified partners on a quote basis.",
      "toolB": "Umbraco Cloud publishes tiered pricing: Starter at €45/month, Standard at €280/month, Professional at €730/month, and custom Enterprise.",
      "whyItMatters": "Published pricing lets teams budget for managed hosting upfront rather than requesting a quote.",
      "benefitsWho": "Buyers who want to compare hosting costs without a sales call."
    },
    {
      "title": "Multi-Site & Multi-Language Architecture",
      "toolA": "TYPO3's core natively runs many websites in many languages from a single installation without extra modules, and its admin backend is translatable into 40+ languages via the community-maintained Crowdin project.",
      "toolB": "Umbraco ships a backoffice localized into 20+ languages, but native multi-site architecture from a single install is not documented in the same way.",
      "whyItMatters": "Organizations running many localized sites need this built into the core rather than bolted on.",
      "benefitsWho": "Multinational or multi-brand organizations managing many sites and languages centrally."
    },
    {
      "title": "Governance Model",
      "toolA": "TYPO3 is governed by the nonprofit TYPO3 Association (1,000+ members) via a General Assembly voting process.",
      "toolB": "Umbraco is backed by the commercial company Umbraco A/S, owned by growth investor Monterro since a 2021 acquisition.",
      "whyItMatters": "Nonprofit governance versus commercial ownership affects roadmap priorities and long-term project direction.",
      "benefitsWho": "Organizations with procurement policies favoring community-governed or vendor-backed open source, respectively."
    },
    {
      "title": "AI Tooling for Editors",
      "toolA": "Not documented as a TYPO3 core feature.",
      "toolB": "Umbraco includes built-in AI tools for content editors with governance controls, per umbraco.com.",
      "whyItMatters": "Built-in AI assistance can speed up content authoring without third-party plugins.",
      "benefitsWho": "Content teams wanting AI-assisted authoring out of the box."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Open-source self-hosted core",
          "toolA": "available",
          "toolB": "available",
          "note": "TYPO3: GPL v2; Umbraco: MIT"
        },
        {
          "feature": "Official managed cloud hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umbraco Cloud from €45/month"
        },
        {
          "feature": "Published managed-hosting price list",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "LTS release cycles",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "TYPO3 offers LTS plus optional Extended LTS"
        }
      ]
    },
    {
      "group": "Content & Localization",
      "rows": [
        {
          "feature": "Native multi-site from one install",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Backend UI language translations",
          "toolA": "available",
          "toolB": "available",
          "note": "TYPO3: 40+ languages via Crowdin; Umbraco: 20+ languages shipped"
        },
        {
          "feature": "AI tooling for content editors",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Content Delivery API with SLA",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Umbraco Standard tier and above"
        }
      ]
    },
    {
      "group": "Governance & Support",
      "rows": [
        {
          "feature": "Nonprofit community governance body",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "TYPO3 Association, 1,000+ members"
        },
        {
          "feature": "Certified implementation partner network",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Extension/add-on repository",
          "toolA": "available",
          "toolB": "available",
          "note": "TYPO3 Extension Repository (TER); Umbraco official add-ons suite"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both TYPO3 and Umbraco free to self-host?",
      "answer": "Yes. TYPO3's core is free and open source under GPL v2 (or later), and Umbraco's core is free and open source under the MIT license."
    },
    {
      "question": "Does TYPO3 offer managed cloud hosting like Umbraco Cloud?",
      "answer": "Not documented as an official product. Umbraco Cloud has published, tiered pricing starting at €45/month (Starter), rising to €730/month (Professional) and custom Enterprise pricing; TYPO3's paid options are quote-based support and implementation services through TYPO3 GmbH and certified partners."
    },
    {
      "question": "Which is better for multi-language, multi-site projects?",
      "answer": "TYPO3's core is built to run many sites and languages from a single installation without extra modules, and its backend can be translated into 40+ languages via Crowdin. Umbraco's backoffice ships localized into 20+ languages, but native multi-site architecture isn't documented to the same degree."
    },
    {
      "question": "Who governs each project?",
      "answer": "TYPO3 is governed by the nonprofit TYPO3 Association (1,000+ members) through a General Assembly. Umbraco is backed by the commercial company Umbraco A/S, which was acquired by growth investor Monterro in 2021."
    },
    {
      "question": "What tech stack does each CMS run on?",
      "answer": "TYPO3 is PHP-based; Umbraco runs on .NET/ASP.NET Core. This affects hosting requirements and the developer skill set needed."
    },
    {
      "question": "Which CMS has notable brand adopters?",
      "answer": "Umbraco cites Domino's, Volvo, and Heineken as users. TYPO3's facts note broad adoption across European government and public-sector organizations rather than specific named brands."
    }
  ]
};

export default typo3VsUmbracoContent;
