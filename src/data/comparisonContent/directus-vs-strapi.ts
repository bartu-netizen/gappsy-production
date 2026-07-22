import type { ToolComparisonContent } from './types';

const directusVsStrapiContent: ToolComparisonContent = {
  "verdict": "Both Directus and Strapi are open-source headless CMSs that auto-generate REST/GraphQL APIs and support MCP for AI agents, but they start from different places. Directus connects directly to an existing database and adds a free, built-in AI Assistant even on its self-hosted Core plan; Strapi builds content types natively within its own system and offers a much lower-cost managed cloud entry point ($35/month) plus a large open-source community (72.7k+ GitHub stars). Neither is a strict upgrade over the other — the fit depends on whether you're wrapping an existing database or starting fresh, and how much you're willing to pay for managed hosting or SSO.",
  "bestForToolA": "Teams with an existing database who want instant REST/GraphQL APIs without migrating data, plus a built-in AI Assistant included free on the self-hosted Core plan.",
  "bestForToolB": "Teams starting a new project who want a large open-source community, a low-cost managed cloud entry point ($35/month Starter), and content types built from scratch through a no-code Content Type Builder.",
  "whoNeedsBoth": "Agencies managing a mixed portfolio may run both: legacy projects with an existing database fit Directus's connect-and-generate model, while new greenfield projects fit Strapi's from-scratch content modeling and lower-cost Strapi Cloud entry tier.",
  "keyDifferences": [
    {
      "title": "Database integration model",
      "toolA": "Connects to an existing database and auto-generates REST and GraphQL APIs on top of it — no migration required.",
      "toolB": "Auto-generates REST and GraphQL APIs from content types built inside Strapi's own Content Type Builder.",
      "whyItMatters": "Directus fits projects that already have data living in a database; Strapi fits projects designing content structures from scratch.",
      "benefitsWho": "Teams migrating off legacy databases (Directus) versus teams starting a new content model (Strapi)."
    },
    {
      "title": "Managed cloud entry price",
      "toolA": "Free self-hosted Core plan, but cloud hosting for it costs an additional $99/month; the Team plan (with SSO) starts at $499/month annual or $599/month monthly.",
      "toolB": "Strapi Cloud's Starter plan starts at $35/month per project, with Pro at $90/month and Business at $450/month.",
      "whyItMatters": "Strapi's managed-hosting entry point is far cheaper than Directus's Team tier, though Directus's self-hosted Core plan itself is free with no artificial caps.",
      "benefitsWho": "Budget-conscious teams wanting cheap managed hosting (Strapi) versus teams comfortable self-hosting for free (Directus)."
    },
    {
      "title": "Built-in AI Assistant availability",
      "toolA": "Includes a Built-in AI Assistant even on the free Core plan, plus a native MCP Server for Claude Desktop, Cursor, and ChatGPT.",
      "toolB": "Offers Strapi MCP so AI agents can manage content, but no built-in AI content assistant is documented.",
      "whyItMatters": "Directus gives every user, including free self-hosters, an AI assistant for content and translation tasks out of the box.",
      "benefitsWho": "Teams wanting AI-assisted content work without paying for a higher tier."
    },
    {
      "title": "Discounted access for small orgs and nonprofits",
      "toolA": "Offers an Open Innovation Grant with free (self-hosted) or $99/month (cloud) full-feature access for organizations under $5M revenue and fewer than 50 employees.",
      "toolB": "No equivalent discount program is documented.",
      "whyItMatters": "Small organizations and nonprofits have a documented path to full-featured access with Directus that isn't available with Strapi.",
      "benefitsWho": "Nonprofits and small businesses with limited budgets."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Architecture",
      "rows": [
        {
          "feature": "Auto-generated REST/GraphQL APIs",
          "toolA": "available",
          "toolB": "available",
          "note": "Directus generates from an existing database; Strapi generates from content types built in Strapi."
        },
        {
          "feature": "No-code content modeling interface",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real-time updates (WebSocket)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MCP support for AI agents",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in AI content assistant",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud starting price",
          "toolA": "limited",
          "toolB": "available",
          "note": "Directus: $99/month add-on for free Core, $499-599/month for SSO-enabled Team. Strapi Cloud starts at $35/month."
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "limited",
          "note": "Directus includes SSO on the $499+/month Team plan; Strapi reserves SSO for its custom Enterprise tier, not documented on Starter/Pro/Business."
        },
        {
          "feature": "Discount program for small orgs/nonprofits",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Community",
      "rows": [
        {
          "feature": "SOC 2 / GDPR compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source community size stated",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Strapi cites 72.7k+ GitHub stars."
        },
        {
          "feature": "Free/discounted access for small orgs & nonprofits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Directus's Open Innovation Grant for orgs under $5M revenue and <50 employees."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Directus free?",
      "answer": "Yes, the Core plan is free to self-host with no credit card required; Directus Cloud hosting is a $99/month add-on."
    },
    {
      "question": "Do I need to migrate my database to use Directus?",
      "answer": "No, Directus connects to your existing database and generates APIs on top of it."
    },
    {
      "question": "Does Directus support AI agents?",
      "answer": "Yes, via a native MCP server plus a built-in AI Assistant for content and translation tasks."
    },
    {
      "question": "Is Strapi free?",
      "answer": "Yes, the core Strapi CMS is MIT-licensed and free to self-host; Strapi Cloud managed hosting starts at $35/month per project."
    },
    {
      "question": "Does Strapi support GraphQL?",
      "answer": "Yes, Strapi automatically generates both REST and GraphQL APIs from your content models."
    },
    {
      "question": "Can AI agents work with Strapi?",
      "answer": "Yes, Strapi MCP (Model Context Protocol) lets AI agents manage content directly."
    }
  ]
};

export default directusVsStrapiContent;
