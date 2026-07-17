import type { ToolComparisonContent } from './types';

const keystonejsVsSilverstripeCmsContent: ToolComparisonContent = {
  "verdict": "KeystoneJS and Silverstripe CMS solve different problems for developers. KeystoneJS is a free, MIT-licensed Node.js/TypeScript headless CMS that auto-generates a GraphQL API and admin UI from a schema you define, aimed at developers building custom frontends who self-deploy to clouds like DigitalOcean, Heroku, Render, Vercel, AWS, Azure, or Google Cloud. Silverstripe CMS is a free, BSD-licensed traditional PHP CMS with a built-in templating engine, 2,500+ community modules, and an optional ISO/IEC 27001-certified managed Silverstripe Cloud. The choice depends on whether a team wants a decoupled, API-first stack (Keystone) or an integrated CMS with built-in page rendering (Silverstripe).",
  "bestForToolA": "KeystoneJS suits Node.js/TypeScript developers who want a schema-driven GraphQL API and admin UI for a custom frontend, and who are comfortable self-deploying to their own cloud infrastructure.",
  "bestForToolB": "Silverstripe CMS suits teams wanting an integrated, PHP-based CMS with a built-in templating engine, 2,500+ ready-made modules, and the option of Silverstripe Limited's certified managed Cloud hosting.",
  "whoNeedsBoth": "A team could plausibly pair the two if it runs a decoupled application or marketing site on KeystoneJS as the content API while using Silverstripe CMS for a separate, more traditional PHP-rendered site within the same organization, though this is an unusual setup rather than a common combined workflow.",
  "keyDifferences": [
    {
      "title": "Architecture Model",
      "toolA": "KeystoneJS is a headless CMS that auto-generates a GraphQL API and admin UI from a schema, intended to power a separate custom frontend.",
      "toolB": "Silverstripe CMS is a traditional full-stack CMS with a built-in templating engine for direct page rendering.",
      "whyItMatters": "Headless versus traditional architecture changes how a frontend is built and who owns page rendering.",
      "benefitsWho": "Developers building decoupled apps (Keystone) versus teams wanting an all-in-one rendered website (Silverstripe)."
    },
    {
      "title": "Tech Stack",
      "toolA": "KeystoneJS is written in TypeScript (99% of the codebase) and runs on Node.js.",
      "toolB": "Silverstripe CMS is a PHP framework and CMS.",
      "whyItMatters": "Determines which developers and hosting environments are compatible.",
      "benefitsWho": "Teams standardized on JavaScript/TypeScript versus PHP."
    },
    {
      "title": "Managed Hosting",
      "toolA": "KeystoneJS has no packaged managed hosting product; it's deployable to DigitalOcean, Heroku, Render, Vercel, AWS, Azure, or Google Cloud, self-managed.",
      "toolB": "Silverstripe Cloud is an ISO/IEC 27001-certified managed hosting product, though pricing is quote-based.",
      "whyItMatters": "A packaged managed-hosting option removes infrastructure setup work but comes at a cost.",
      "benefitsWho": "Teams without in-house DevOps capacity (Silverstripe Cloud) versus teams that want full control over their own cloud deployment (Keystone)."
    },
    {
      "title": "Ecosystem Scale",
      "toolA": "KeystoneJS reports over 1 million npm installs and 250+ contributors.",
      "toolB": "Silverstripe reports 50,000+ live installations and 2,500+ community modules.",
      "whyItMatters": "The two ecosystems measure adoption differently (package installs vs. live sites), reflecting their different use cases.",
      "benefitsWho": "Developers evaluating community size and available third-party modules/packages."
    },
    {
      "title": "Commercial Support Path",
      "toolA": "Paid support for KeystoneJS is only available as a separate enterprise contract through Thinkmill, not a packaged pricing tier.",
      "toolB": "Silverstripe is backed by commercial company Silverstripe Limited, which also runs the quote-based Silverstripe Cloud.",
      "whyItMatters": "Neither publishes fixed support pricing, but the support relationship differs (project maintainer vs. dedicated commercial CMS vendor).",
      "benefitsWho": "Organizations needing a support contract to justify the platform choice internally."
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture & API",
      "rows": [
        {
          "feature": "Auto-generated GraphQL API from schema",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Auto-generated admin UI from schema",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in templating engine for page rendering",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Field/list/operation-level access control",
          "toolA": "available",
          "toolB": "available",
          "note": "Silverstripe: role-based permission controls"
        }
      ]
    },
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Official managed cloud hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Silverstripe Cloud, quote-based"
        },
        {
          "feature": "Self-hosting on major public clouds",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Keystone: DigitalOcean, Heroku, Render, Vercel, AWS, Azure, Google Cloud"
        },
        {
          "feature": "Automatic database migrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Keystone uses Prisma"
        }
      ]
    },
    {
      "group": "Ecosystem & Support",
      "rows": [
        {
          "feature": "Community scale indicator",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: 1M+ npm installs, 250+ contributors; Silverstripe: 50,000+ live sites, 2,500+ modules"
        },
        {
          "feature": "Paid enterprise support",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: separate contract via Thinkmill; Silverstripe: via Silverstripe Limited"
        },
        {
          "feature": "Permissive open-source license",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: MIT; Silverstripe: BSD"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is KeystoneJS headless while Silverstripe is a traditional CMS?",
      "answer": "Yes. KeystoneJS generates a GraphQL API and admin UI from a schema for use with a separate custom frontend (Node.js/TypeScript). Silverstripe CMS has a built-in templating engine for full-stack page rendering (PHP)."
    },
    {
      "question": "Which requires more developer skill to run?",
      "answer": "Both require developer involvement. KeystoneJS is explicitly a developer framework requiring Node.js skills, not a no-code tool. Silverstripe's cons note it requires PHP development expertise to customize beyond out-of-the-box functionality."
    },
    {
      "question": "Does either offer official managed hosting?",
      "answer": "Silverstripe Cloud exists as a quote-based, ISO/IEC 27001-certified managed hosting product. KeystoneJS has no packaged managed hosting; it's deployed manually to hosts like DigitalOcean, Heroku, Render, Vercel, AWS, Azure, or Google Cloud."
    },
    {
      "question": "How does KeystoneJS handle database migrations?",
      "answer": "Keystone handles schema migrations automatically through Prisma. This isn't documented for Silverstripe."
    },
    {
      "question": "Should I use Keystone 5 or Keystone 6?",
      "answer": "Keystone 5 is in maintenance mode; only Keystone 6, published under the @keystone-6/* npm namespace, receives active development."
    },
    {
      "question": "Which has a larger ecosystem?",
      "answer": "Silverstripe has 2,500+ community modules and 50,000+ live installations. KeystoneJS reports over 1 million npm installs and 250+ contributors — different metrics reflecting their different distribution models (installable modules vs. npm packages)."
    }
  ]
};

export default keystonejsVsSilverstripeCmsContent;
