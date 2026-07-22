import type { ToolComparisonContent } from './types';

const keystonejsVsTinacmsContent: ToolComparisonContent = {
  "verdict": "KeystoneJS and TinaCMS are both open-source headless CMS options for developers, but they store and edit content very differently. KeystoneJS (MIT-licensed, maintained by Thinkmill) persists content in a database via Prisma migrations and auto-generates both a GraphQL API and a form-based admin UI from your schema, and it is entirely free with no pricing plans. TinaCMS (Apache-2.0, maintained by SSW since its 2024 acquisition of Forestry.io) stores content directly in Git as Markdown/MDX/JSON/YAML and layers a visual, in-context editor on top, with a freemium Tina Cloud service (free for 2 users, Team plans from $24/month) for teams wanting hosted editorial workflows. The right pick depends on whether content should live in a database or in version-controlled files, and whether visual in-context editing matters.",
  "bestForToolA": "KeystoneJS suits developers building data-driven applications who want a database-backed GraphQL API and auto-generated admin UI, with zero licensing cost regardless of team size.",
  "bestForToolB": "TinaCMS suits teams publishing Markdown/MDX content via static site generators like Next.js, Astro, Hugo, or Jekyll who want non-technical editors to make visual, in-context edits that commit directly to Git.",
  "whoNeedsBoth": "There's no typical scenario for combining them on one project since both are alternative headless CMS backends for the same content layer. A larger organization might run KeystoneJS for an internal data-driven app and TinaCMS for its Git-based marketing blog, but that's operating two separate systems rather than integrating them.",
  "keyDifferences": [
    {
      "title": "Content Storage Model",
      "toolA": "KeystoneJS persists content in a database, with schema migrations handled automatically via Prisma.",
      "toolB": "TinaCMS stores content directly in a Git repository as Markdown, MDX, JSON, or YAML, preserving full version history.",
      "whyItMatters": "Database-backed content suits complex relational data; Git-backed content suits version-controlled static sites.",
      "benefitsWho": "App developers needing relational data (Keystone) versus content teams wanting Git-native version history (TinaCMS)."
    },
    {
      "title": "Editing Experience",
      "toolA": "KeystoneJS auto-generates a customizable admin UI with a rich text WYSIWYG editor from your schema.",
      "toolB": "TinaCMS offers visual, in-context editing where authors edit live pages directly, with changes synced back to Git.",
      "whyItMatters": "In-context editing lets non-technical authors see exactly what they're publishing as they edit.",
      "benefitsWho": "Non-technical content editors who want a WYSIWYG, on-page editing experience (TinaCMS)."
    },
    {
      "title": "Pricing Model",
      "toolA": "KeystoneJS is entirely free and open source under MIT, with no pricing plans at all.",
      "toolB": "TinaCMS is freemium: Tina Cloud is free for 2 users, then Team is $24/month, Team Plus (with editorial workflow) is $41/month, Business is $249/month, and Enterprise is custom.",
      "whyItMatters": "Total cost scales differently as a team grows past the free tier.",
      "benefitsWho": "Cost-sensitive teams of any size (Keystone) versus teams wanting a hosted editorial workflow as they scale (TinaCMS)."
    },
    {
      "title": "Auto-Generated API",
      "toolA": "KeystoneJS generates a full GraphQL API with pagination, sorting, filtering, and CRUD operations from your schema.",
      "toolB": "TinaCMS auto-generates a GraphQL API that lets any frontend query and mutate Git-backed content.",
      "whyItMatters": "Both offer schema-driven GraphQL, but query against different underlying stores (database vs. Git files).",
      "benefitsWho": "Frontend developers wanting a consistent GraphQL layer regardless of storage backend."
    },
    {
      "title": "Maintainer & Governance",
      "toolA": "KeystoneJS is maintained by Thinkmill, an Australian consultancy, since the project's first commit in 2013, with 250+ contributors.",
      "toolB": "TinaCMS was originally launched by Forestry.io and has been maintained by SSW, an Australian software consultancy, since SSW acquired the project in 2024.",
      "whyItMatters": "Project maintainership affects long-term update cadence and roadmap direction.",
      "benefitsWho": "Teams evaluating the stability and backing of an open-source dependency before adopting it."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Model & Editing",
      "rows": [
        {
          "feature": "Content storage backend",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: database via Prisma; TinaCMS: Git-backed Markdown/MDX/JSON/YAML"
        },
        {
          "feature": "Visual, in-context editing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Auto-generated admin UI",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Full version history via Git",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "API & Developer Experience",
      "rows": [
        {
          "feature": "Auto-generated GraphQL API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hostable backend without vendor cloud",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: fully self-hosted, MIT; TinaCMS: Apache-2.0 backend self-hostable on Express-compatible platforms"
        },
        {
          "feature": "Documented framework integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Next.js, Astro, Hugo, Jekyll"
        },
        {
          "feature": "Field/operation-level access control",
          "toolA": "available",
          "toolB": "available",
          "note": "TinaCMS: role-based access on Cloud plans"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Free tier / free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: entirely free (MIT, no plans); TinaCMS: free Tina Cloud tier for 2 users"
        },
        {
          "feature": "Paid editorial workflow",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TinaCMS Team Plus, $41/month"
        },
        {
          "feature": "Custom Enterprise support",
          "toolA": "available",
          "toolB": "available",
          "note": "Keystone: separate contract via Thinkmill; TinaCMS: Enterprise plan with SSO, GitHub Enterprise support"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does content storage differ between KeystoneJS and TinaCMS?",
      "answer": "KeystoneJS stores content in a database, with migrations handled automatically via Prisma. TinaCMS stores content directly in your Git repository as Markdown, MDX, JSON, or YAML, giving full version history."
    },
    {
      "question": "Is KeystoneJS free while TinaCMS is not?",
      "answer": "KeystoneJS is entirely free under the MIT license with no pricing plans. TinaCMS is freemium: Tina Cloud is free for 2 users, with paid Team plans starting at $24/month for more users and features."
    },
    {
      "question": "Which offers visual, in-context editing?",
      "answer": "TinaCMS offers visual, in-context editing where authors edit live pages with changes synced to Git. KeystoneJS instead provides an auto-generated, form-based admin UI with a rich text editor."
    },
    {
      "question": "Do both generate a GraphQL API automatically?",
      "answer": "Yes. Both KeystoneJS and TinaCMS auto-generate a GraphQL API from your schema or content structure, though they query different underlying stores (database vs. Git)."
    },
    {
      "question": "Who maintains each project today?",
      "answer": "KeystoneJS is maintained by Thinkmill, an Australian consultancy, since 2013. TinaCMS was originally built by Forestry.io and has been maintained by SSW, another Australian software consultancy, since SSW acquired the project in 2024."
    },
    {
      "question": "Can either be self-hosted without paying for a cloud service?",
      "answer": "Yes. KeystoneJS is fully self-hostable under its MIT license. TinaCMS's Apache-2.0 backend can also be self-hosted on any Express-compatible platform as an alternative to the hosted Tina Cloud service."
    }
  ]
};

export default keystonejsVsTinacmsContent;
