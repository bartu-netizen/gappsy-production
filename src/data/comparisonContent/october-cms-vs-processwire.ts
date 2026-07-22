import type { ToolComparisonContent } from './types';

const octoberCmsVsProcesswireContent: ToolComparisonContent = {
  "verdict": "October CMS and ProcessWire are both PHP CMS platforms with self-hosted deployment, but their cost and openness differ sharply: ProcessWire's core has been free and open source (mainly Mozilla Public License 2.0) since 2010 with no ongoing license fee, an API-driven core, and built-in multi-language support requiring no third-party plugin, while October CMS is built on Laravel, gives a free full-featured license for the first year only, then requires a $39/year/site license (or an Unlimited Licenses subscription) under a proprietary EULA with Responsiv Pty Ltd, backed by a Marketplace of hundreds of plugins and themes.",
  "bestForToolA": "October CMS suits Laravel-familiar teams who want a broad plugin Marketplace and reusable page components, and who accept a $39/year/site cost after the first free year.",
  "bestForToolB": "ProcessWire suits developers who want a genuinely free, OSI-licensed CMS with an API-first core, built-in multi-language support, and a hierarchical unlimited-depth page tree, without ever paying a license fee for the core.",
  "whoNeedsBoth": "There's no realistic single-project scenario for running both together — a developer or agency would pick one CMS per project based on framework preference (Laravel vs ProcessWire's own API) and budget tolerance for post-year-one licensing costs.",
  "keyDifferences": [
    {
      "title": "License Model",
      "toolA": "October CMS gives a free full-featured license for the first year only; continuing to receive updates after that requires a paid license ($39/year/site) under a proprietary EULA with Responsiv Pty Ltd.",
      "toolB": "ProcessWire's core has been free and open source since 2010, mainly under Mozilla Public License 2.0 with some MIT-licensed components, with no license fee ever required.",
      "whyItMatters": "Total cost of ownership over multiple years diverges significantly between a recurring per-site license and a permanently free core.",
      "benefitsWho": "Long-running projects and budget-constrained developers sensitive to recurring costs."
    },
    {
      "title": "Framework Foundation",
      "toolA": "October CMS is built on the Laravel framework, giving developers access to Laravel's conventions and wider ecosystem.",
      "toolB": "ProcessWire is its own API-driven framework and CMS with a hierarchical, unlimited-depth page tree, rather than being built on top of another framework.",
      "whyItMatters": "Framework choice determines available tooling, hiring pool familiarity, and integration options.",
      "benefitsWho": "Developers with existing Laravel expertise versus those who prefer a standalone, purpose-built CMS API."
    },
    {
      "title": "Extension Marketplace vs Pro Shop",
      "toolA": "October CMS centers extensibility on its Marketplace, offering hundreds of plugins and themes.",
      "toolB": "ProcessWire's optional paid extensions are limited to a small, named Pro Shop lineup: ProCache, Form Builder, and PAGEGRID Page Builder.",
      "whyItMatters": "A broad marketplace offers more off-the-shelf functionality, while a small curated Pro Shop suggests a leaner, more developer-driven ecosystem.",
      "benefitsWho": "Site owners wanting many ready-made plugins versus developers who prefer building custom functionality via an API."
    },
    {
      "title": "Multi-Language Support",
      "toolA": "October CMS's facts don't document a comparable built-in multi-language capability.",
      "toolB": "ProcessWire documents built-in multi-language support with language packs (e.g., German) and translatable fields as a core feature requiring no third-party plugins.",
      "whyItMatters": "Native multi-language support avoids dependency on third-party translation plugins for international sites.",
      "benefitsWho": "Teams building multilingual sites without wanting to rely on third-party plugins."
    },
    {
      "title": "Ecosystem Size & Recognized Users",
      "toolA": "October CMS cites large recognizable users (Toyota, KFC, Nestlé, per its own site) and hundreds of Marketplace plugins.",
      "toolB": "ProcessWire has a smaller GitHub footprint (about 1.1k stars on the core repo), reflecting a more niche, developer-focused community.",
      "whyItMatters": "Ecosystem size can affect the availability of community support, tutorials, and third-party integrations.",
      "benefitsWho": "Teams weighing community size and enterprise references against a smaller, more specialized developer community."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Architecture",
      "rows": [
        {
          "feature": "Built on Laravel",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ProcessWire is its own API-driven framework"
        },
        {
          "feature": "Hierarchical, unlimited-depth page tree",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "API-driven core as primary design principle",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Hooks system to extend core without modifying core files",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost & Licensing",
      "rows": [
        {
          "feature": "Free forever, no license fee ever",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "October CMS: free year one only, then $39/year/site"
        },
        {
          "feature": "OSI-approved open-source license",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "ProcessWire: mainly MPL 2.0"
        },
        {
          "feature": "Unlimited-site license subscription for agencies",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "October CMS: $26-30/month"
        },
        {
          "feature": "Published pricing plans",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ProcessWire has no pricing_plans listed"
        }
      ]
    },
    {
      "group": "Extensibility & Localization",
      "rows": [
        {
          "feature": "Dedicated plugin/theme marketplace",
          "toolA": "available",
          "toolB": "limited",
          "note": "ProcessWire: small named Pro Shop only"
        },
        {
          "feature": "Built-in multi-language support, no plugin required",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Role-based access control",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automatic update delivery mechanism",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "October CMS: Update Gateway"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which CMS is free to use indefinitely without any license cost?",
      "answer": "ProcessWire's core has been free and open source since 2010. October CMS is free only for the first year, then requires a $39/year/site license to continue receiving updates."
    },
    {
      "question": "Which framework does each build on?",
      "answer": "October CMS is built on Laravel. ProcessWire is a standalone, API-driven CMS and framework with its own hierarchical page-tree architecture."
    },
    {
      "question": "Does either offer native multi-language support?",
      "answer": "ProcessWire documents built-in multi-language support with language packs as a core feature. October CMS's facts don't document an equivalent built-in capability."
    },
    {
      "question": "How do their paid extension offerings compare?",
      "answer": "October CMS has a broad Marketplace with hundreds of plugins and themes. ProcessWire's paid add-ons are limited to a small named Pro Shop lineup: ProCache, Form Builder, and PAGEGRID Page Builder."
    },
    {
      "question": "Which is a better fit for an agency running many client sites?",
      "answer": "October CMS's Unlimited Licenses subscription ($26-30/month) is designed for agencies running multiple sites with Partner Program access. ProcessWire requires no per-site licensing at all since it's free, though it doesn't document an equivalent partner program."
    },
    {
      "question": "Is source code publicly available for both?",
      "answer": "Yes for both. October CMS's source is publicly viewable on GitHub but under a proprietary Responsiv Pty Ltd EULA, while ProcessWire's is released under an OSI-approved license (mainly Mozilla Public License 2.0)."
    }
  ]
};

export default octoberCmsVsProcesswireContent;
