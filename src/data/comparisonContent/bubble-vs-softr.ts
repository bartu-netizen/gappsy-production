import type { ToolComparisonContent } from './types';

const bubbleVsSoftrContent: ToolComparisonContent = {
  "verdict": "Bubble and Softr both promise no-code app building, but they are built for different starting points. Bubble is a from-scratch application platform: it gives you a blank canvas with a full relational database, a visual workflow engine, and pixel-level layout control, which means more power but a real learning curve before you can ship something production-ready. Softr is a layering tool: it turns data you already have in Airtable, Google Sheets, or its own simple database into a working portal, directory, or internal tool using pre-built blocks and templates, which gets you to launch faster but hits ceilings once your logic gets complex. Bubble suits teams building a genuine standalone product with custom logic and, eventually, native mobile apps. Softr suits teams that already have structured data and need a client portal, internal tool, or simple marketplace live quickly, with native payments and AI blocks included out of the box. Neither is a strict upgrade over the other; the right choice depends on whether you are designing an application from zero or wrapping a usable interface around data you already manage elsewhere.",
  "bestForToolA": "Bubble fits founders and agencies building a full custom web application with complex backend logic, custom data relationships, and eventual native iOS or Android app store deployment.",
  "bestForToolB": "Softr fits teams that already store their data in Airtable or Google Sheets and need to quickly launch a client portal, internal tool, or directory without building a backend from scratch.",
  "whoNeedsBoth": "A team might prototype an internal tool or client portal quickly in Softr on top of Airtable, then move to Bubble once the product needs custom backend logic, deeper data relationships, or native mobile app packaging.",
  "keyDifferences": [
    {
      "title": "Backend architecture",
      "toolA": "Bubble ships its own built-in relational database with custom data types and relationships as the foundation of every app",
      "toolB": "Softr is built to sit on top of Airtable, Google Sheets, or its own simpler built-in database rather than being a from-scratch backend",
      "whyItMatters": "Teams that already manage data in a spreadsheet or Airtable base can go live faster on Softr, while teams needing custom relational structures need Bubble's native database",
      "benefitsWho": "Data teams already using Airtable or Sheets benefit from Softr; teams designing a new data model from scratch benefit from Bubble"
    },
    {
      "title": "Platform maturity",
      "toolA": "Bubble was founded in 2012 and is headquartered in New York City",
      "toolB": "Softr was founded in 2019 and is headquartered in Berlin",
      "whyItMatters": "A longer track record generally means a larger plugin ecosystem, more community resources, and more battle-tested edge cases",
      "benefitsWho": "Buyers who want a mature ecosystem and extensive community troubleshooting resources lean toward Bubble"
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Bubble's paid plans start at 29 dollars per month billed annually",
      "toolB": "Softr's paid Basic plan starts at 49 dollars per month, or 588 dollars per year billed annually",
      "whyItMatters": "Bubble has a lower nominal entry price, though the two platforms meter usage completely differently, so the cheaper sticker price does not automatically mean cheaper at scale",
      "benefitsWho": "Budget-conscious solo builders benefit from Bubble's lower starting price point"
    },
    {
      "title": "Usage-based scaling model",
      "toolA": "Bubble plans are metered by Workload Units, which measure database queries, workflows, API calls, and page loads",
      "toolB": "Softr plans are metered by app users, database records, workflow actions, and AI credits per plan tier",
      "whyItMatters": "Buyers need to estimate their expected usage against each platform's specific metering model, since a high-traffic app can exhaust either kind of limit quickly",
      "benefitsWho": "Teams with predictable, portal-style usage patterns can budget more easily on Softr's per-user and per-record caps, while compute-heavy apps need to watch Bubble's Workload Units"
    },
    {
      "title": "Free plan capability",
      "toolA": "Bubble's free plan is for learning and prototyping only, with limited Workload Units and no custom domain or production deployment",
      "toolB": "Softr's free plan includes a free custom domain along with 10 app users and 5,000 database records",
      "whyItMatters": "Softr's free tier can support a genuinely usable small live app, while Bubble's free tier is explicitly non-production",
      "benefitsWho": "Solo builders or very small teams testing a real, live app on a shoestring benefit from Softr's more usable free tier"
    },
    {
      "title": "Depth of custom logic",
      "toolA": "Bubble's visual workflow engine supports conditional, event-driven backend and frontend logic for building complex applications",
      "toolB": "Softr's own documented cons state that complex custom logic can hit the limits of its block-based builder",
      "whyItMatters": "Applications with intricate business rules, multi-step conditional flows, or heavy backend processing need a platform built for that depth of logic",
      "benefitsWho": "Builders creating a complex SaaS product or internal tool with nontrivial logic benefit from Bubble's workflow engine"
    },
    {
      "title": "Native mobile app deployment",
      "toolA": "Bubble supports packaging and deploying apps to the iOS App Store and Google Play on eligible paid plans",
      "toolB": "Softr's documented cons state there is no native iOS or Android app compilation, only responsive web and progressive web app output",
      "whyItMatters": "Products that need to be distributed through the Apple or Google app stores as an installable native-feeling app require this capability",
      "benefitsWho": "Founders whose go-to-market plan depends on app store presence benefit from Bubble"
    },
    {
      "title": "Native AI features",
      "toolA": "Bubble's documented feature set does not include a native AI content block, though its plugin marketplace and API Connector can integrate outside AI services",
      "toolB": "Softr includes built-in AI Blocks for generating, summarizing, or transforming content directly inside a published app, with a monthly AI credit allowance per plan",
      "whyItMatters": "Teams that want AI text generation or summarization inside the end-user experience without wiring up an external API get that natively in Softr",
      "benefitsWho": "Non-technical builders wanting AI content features without extra integration work benefit from Softr"
    },
    {
      "title": "Native payments integration",
      "toolA": "Bubble's documented facts show payments handled through its plugin and template marketplace rather than a named native payment feature",
      "toolB": "Softr includes a native Stripe integration for one-time payments and recurring subscriptions as a core documented feature",
      "whyItMatters": "A named native payments feature typically means less setup work and fewer third-party plugin dependencies for monetizing an app",
      "benefitsWho": "Builders launching a paid portal or subscription product quickly benefit from Softr's native Stripe integration"
    },
    {
      "title": "Learning curve",
      "toolA": "Bubble's own documented cons list a steep learning curve compared to simpler website or app builders",
      "toolB": "Softr's own documented pros highlight being fast to launch functional web apps without writing code",
      "whyItMatters": "Time to first working app matters for teams with limited technical bandwidth or tight launch timelines",
      "benefitsWho": "Non-technical founders and teams needing to ship quickly benefit from Softr's shorter ramp-up time"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Data and Backend",
      "rows": [
        {
          "feature": "Built-in relational database",
          "toolA": "available",
          "toolB": "available",
          "note": "Softr can alternatively use Airtable or Google Sheets instead of its own database"
        },
        {
          "feature": "Connect Airtable or Google Sheets as backend",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Bubble's API Connector can reach external REST APIs generally, but native Airtable/Sheets connection is not documented"
        },
        {
          "feature": "Custom data types and relationships",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Softr's data structure follows its connected source rather than a documented custom relational modeling feature"
        }
      ]
    },
    {
      "group": "App Building and Design",
      "rows": [
        {
          "feature": "Visual drag-and-drop editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Softr's editor is block-based rather than pixel-level"
        },
        {
          "feature": "Pixel-level custom layout control",
          "toolA": "available",
          "toolB": "limited",
          "note": "Softr relies on pre-built blocks and templates rather than free-form layout"
        },
        {
          "feature": "Custom CSS and JavaScript injection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available as part of Softr's Custom Code and Domains feature"
        }
      ]
    },
    {
      "group": "Logic and Automation",
      "rows": [
        {
          "feature": "Visual workflow engine for conditional logic",
          "toolA": "available",
          "toolB": "available",
          "note": "Softr calls this Workflows and Automations"
        },
        {
          "feature": "Complex, deeply nested backend logic",
          "toolA": "available",
          "toolB": "limited",
          "note": "Softr's documented cons note complex custom logic can hit builder limits"
        }
      ]
    },
    {
      "group": "User Management and Access",
      "rows": [
        {
          "feature": "User sign-up, login, and account management",
          "toolA": "available",
          "toolB": "available",
          "note": "Softr documents this via its User Groups and Permissions feature"
        },
        {
          "feature": "Granular user groups and segmented access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Bubble documents general roles and permissions but not a distinct user-groups feature"
        }
      ]
    },
    {
      "group": "Payments and Monetization",
      "rows": [
        {
          "feature": "Native Stripe integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Bubble handles payments through its plugin marketplace rather than a named native feature"
        },
        {
          "feature": "Payment plugins and marketplace add-ons",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of Bubble's plugin and template marketplace"
        }
      ]
    },
    {
      "group": "Mobile and Deployment",
      "rows": [
        {
          "feature": "Native iOS and Android app store deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bubble requires an eligible paid plan; Softr explicitly does not compile native apps"
        },
        {
          "feature": "Responsive web app output",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Progressive web app (PWA) installability",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "Native AI content generation blocks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Softr's AI Blocks generate, summarize, or transform content inside a published app"
        },
        {
          "feature": "Monthly AI usage allowance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Softr allots AI credits per plan tier, from 5 on Free up to 100 on Business"
        }
      ]
    },
    {
      "group": "Integrations and Extensibility",
      "rows": [
        {
          "feature": "Generic external REST API connector",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bubble's API Connector"
        },
        {
          "feature": "Zapier and Make integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Softr's Third-Party Integrations feature"
        },
        {
          "feature": "Development and live branch version control",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Higher Bubble tiers add premium version control and more custom branches"
        }
      ]
    },
    {
      "group": "Custom Domains and Hosting",
      "rows": [
        {
          "feature": "Custom domain support",
          "toolA": "available",
          "toolB": "available",
          "note": "Softr includes a free custom domain even on its Free plan; Bubble requires a paid plan"
        },
        {
          "feature": "Managed hosting included",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Bubble or Softr?",
      "answer": "Bubble has the lower entry price, with paid plans starting at 29 dollars per month billed annually versus Softr's Basic plan at 49 dollars per month, though the two platforms meter usage completely differently (Workload Units for Bubble versus app users, records, and workflow actions for Softr), so actual cost at scale depends on your specific usage pattern."
    },
    {
      "question": "Is Bubble or Softr better for beginners?",
      "answer": "Softr is generally easier for beginners, since its own documented pros highlight being fast to launch functional web apps without writing code, while Bubble's documented cons explicitly note a steeper learning curve compared to simpler builders."
    },
    {
      "question": "Can Softr build apps as complex as Bubble can?",
      "answer": "Not according to the documented facts: Softr's own cons state that complex custom logic can hit the limits of its block-based builder, while Bubble is built around a full custom database, visual workflow engine, and pixel-level frontend control for more complex applications."
    },
    {
      "question": "Does Bubble have a native mobile app like Softr?",
      "answer": "Bubble supports packaging and deploying apps to the iOS App Store and Google Play on eligible paid plans, while Softr's documented cons state it has no native iOS or Android app compilation and only offers responsive web and progressive web app output."
    },
    {
      "question": "Which tool has built-in AI features?",
      "answer": "Softr documents native AI Blocks for generating, summarizing, or transforming content inside a published app, with a monthly AI credit allowance per plan tier, while Bubble's documented feature set does not list a native AI feature."
    },
    {
      "question": "Do I need Airtable to use Softr, or can I use my own database with either tool?",
      "answer": "Softr can connect to Airtable, Google Sheets, or use its own built-in database, so Airtable is not required, while Bubble provides its own built-in relational database and does not document native Airtable or Google Sheets connections."
    }
  ]
};

export default bubbleVsSoftrContent;
