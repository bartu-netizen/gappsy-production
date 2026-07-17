import type { ToolComparisonContent } from './types';

const craftCmsVsStatamicContent: ToolComparisonContent = {
  "verdict": "Craft CMS and Statamic are both self-hosted, freemium CMS platforms from small companies with a free single-user tier and paid per-project or per-site licenses, but they differ in storage architecture and hosting: Statamic supports both flat-file and database storage modes and gates its REST API, GraphQL, and Git integration behind the $349-per-site Pro license, while Craft CMS is database-driven with a core GraphQL API, a companion Craft Commerce product, and first-party Craft Cloud managed hosting from $120/month per project. Neither is an OSI-approved open-source project — Craft uses a proprietary Pixel & Tonic license, and Statamic's licensing isn't documented as OSI-approved either.",
  "bestForToolA": "Craft CMS suits agencies building multi-site, multi-language marketing sites or storefronts that want first-party managed hosting (Craft Cloud) and a bundled e-commerce product (Craft Commerce with Stripe integration).",
  "bestForToolB": "Statamic suits Laravel developers who want the flexibility to start in flat-file mode and later move to a database, and who value the Bard block editor for building flexible page layouts.",
  "whoNeedsBoth": "There's no realistic single-project scenario for running both — an agency would more plausibly standardize on one platform per client relationship, maintaining expertise in both only to match whichever CMS a given client already has installed.",
  "keyDifferences": [
    {
      "title": "Content Storage Model",
      "toolA": "Craft CMS's documented feature set (Twig templating, GraphQL API, built on the Yii framework) describes a database-driven architecture with no flat-file mode mentioned.",
      "toolB": "Statamic explicitly supports both flat-file and database-backed storage modes, letting a project choose based on scale.",
      "whyItMatters": "Flat-file support lets small sites run without provisioning or maintaining a separate database server.",
      "benefitsWho": "Developers running small-to-mid sites who want simpler deployment without a managed database."
    },
    {
      "title": "Headless API Access",
      "toolA": "Craft CMS documents Twig templating and a GraphQL API as a core feature description, without stating that API access is gated to a paid tier.",
      "toolB": "Statamic gates REST API and GraphQL access entirely behind the paid Pro license ($349/site first year, $99/year renewal).",
      "whyItMatters": "Teams planning a headless or decoupled front end need to know upfront whether API access requires the top-tier license.",
      "benefitsWho": "Developers building headless/JAMstack front ends who want to budget API access accurately."
    },
    {
      "title": "Managed Hosting",
      "toolA": "Craft offers first-party Craft Cloud managed hosting with push-to-deploy workflows and a global CDN, billed separately at $120–$240/month per project.",
      "toolB": "Statamic's facts don't document an equivalent first-party managed hosting product.",
      "whyItMatters": "First-party managed hosting removes the need to separately source and configure infrastructure.",
      "benefitsWho": "Teams that want a single vendor for both CMS licensing and hosting."
    },
    {
      "title": "Licensing Cost Structure",
      "toolA": "Craft's Team and Pro self-hosted licenses cost $279 and $399 per project (first year), then $99/year renewal.",
      "toolB": "Statamic Pro costs $349 per site (first year), then $99/year renewal.",
      "whyItMatters": "Similar renewal cost but different first-year entry pricing and a per-project vs per-site framing affects budgeting for multi-site portfolios.",
      "benefitsWho": "Agencies budgeting license costs across multiple client sites or projects."
    },
    {
      "title": "Content Editing Approach",
      "toolA": "Craft CMS's flagship editing features are in-context Live Preview and an image editor, alongside content versioning and scheduling.",
      "toolB": "Statamic's flagship editing feature is the Bard block-based rich content editor with fly-out previews for building flexible page layouts.",
      "whyItMatters": "A block-based editor changes how content editors structure flexible page layouts compared to a more traditional field/template approach.",
      "benefitsWho": "Content editors who prefer modular, block-based page building over fixed field templates."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Modeling & Editing",
      "rows": [
        {
          "feature": "Block-based rich content editor",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statamic: Bard editor"
        },
        {
          "feature": "Flat-file storage option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Live Preview",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Content versioning/revisions & scheduling",
          "toolA": "available",
          "toolB": "limited",
          "note": "Statamic gates revisions/drafts to Pro"
        }
      ]
    },
    {
      "group": "Headless/API & Multi-site",
      "rows": [
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "limited",
          "note": "Statamic gates GraphQL to Pro"
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Statamic gates REST API to Pro"
        },
        {
          "feature": "Multi-site support",
          "toolA": "available",
          "toolB": "limited",
          "note": "Craft: unlimited sites on all editions; Statamic: Pro-tier feature"
        },
        {
          "feature": "Admin/control panel translated into many languages",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft: 25 languages"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted single-user tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft: Solo edition; Statamic: Core edition"
        },
        {
          "feature": "First-party managed cloud hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft Cloud: $120-$240/month per project"
        },
        {
          "feature": "E-commerce companion product",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft Commerce with Stripe integration"
        },
        {
          "feature": "Git integration for content changes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statamic Pro"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can either CMS run without a database?",
      "answer": "Statamic supports a flat-file storage mode as an alternative to a database. Craft CMS's documented architecture (Twig templates, GraphQL, built on Yii) is database-driven with no flat-file option mentioned."
    },
    {
      "question": "Do both offer first-party managed hosting?",
      "answer": "Craft CMS does, through Craft Cloud, priced at $120/month per project (Team) or $240/month (Pro). Statamic's facts don't document an equivalent first-party hosting product."
    },
    {
      "question": "How do the free tiers compare?",
      "answer": "Craft's Solo edition (self-hosted, one user account) and Statamic's Core edition (one admin user, one content form) are both free forever, but each requires upgrading to a paid tier for multi-user teams."
    },
    {
      "question": "Which is cheaper for a small team's first year?",
      "answer": "Craft's Team license costs $279 per project versus Statamic Pro at $349 per site, though both renew at $99/year afterward."
    },
    {
      "question": "Is either platform open source?",
      "answer": "Neither is documented as OSI-approved open source. Craft's source code is publicly viewable on GitHub but distributed under a proprietary Pixel & Tonic license, and Statamic's licensing isn't documented as OSI-approved either, though its Core edition is free forever."
    },
    {
      "question": "Does either include e-commerce functionality out of the box?",
      "answer": "Craft CMS documents a companion Craft Commerce product with Stripe integration. Statamic's facts don't document a comparable native commerce add-on."
    }
  ]
};

export default craftCmsVsStatamicContent;
