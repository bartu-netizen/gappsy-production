import type { ToolComparisonContent } from './types';

const appwriteVsPocketbaseContent: ToolComparisonContent = {
  "verdict": "Appwrite and PocketBase are both open-source backends, but they target very different scales — Appwrite is a freemium, multi-service platform (auth, database, storage, functions, messaging, realtime, site hosting) with a paid Pro tier and named enterprise customers, while PocketBase is a completely free, single-executable backend maintained primarily by one creator, with no official managed cloud hosting.",
  "bestForToolA": "Teams that want a hosted or managed option, need messaging or site-hosting features, plan to scale past a hobby project, or want enterprise compliance (SOC-2, HIPAA, SSO) available via a custom plan.",
  "bestForToolB": "Developers who want to self-host a single-executable backend with no external dependencies, don't need a managed cloud option, and are comfortable relying on a project maintained primarily by one creator.",
  "whoNeedsBoth": "A team prototyping quickly with PocketBase for its zero-dependency simplicity, then migrating to Appwrite once they need managed hosting, messaging, or enterprise compliance, would use both at different project stages rather than simultaneously.",
  "keyDifferences": [
    {
      "title": "Managed hosting availability",
      "toolA": "Offers a hosted Free plan and paid Pro/Enterprise tiers in addition to self-hosting.",
      "toolB": "Self-hosted only — no official managed cloud hosting is offered on the site.",
      "whyItMatters": "Determines whether a team must operate its own servers or can rely on the vendor's infrastructure.",
      "benefitsWho": "Teams without the DevOps capacity to run and maintain their own backend infrastructure."
    },
    {
      "title": "Product scope",
      "toolA": "Bundles auth, databases, storage, functions, messaging, realtime, and site hosting.",
      "toolB": "Provides a realtime database, authentication (including OAuth2 for Google, Facebook, GitHub, GitLab), file storage, and an admin dashboard — no dedicated messaging or site-hosting product.",
      "whyItMatters": "Affects how many separate tools a team needs to stitch together for a complete backend.",
      "benefitsWho": "Teams wanting a single-vendor solution versus those needing only core data, auth, and storage primitives."
    },
    {
      "title": "Project maintenance model",
      "toolA": "Cites named production case studies (The Times of India, IBM, American Airlines) as evidence of organizational backing and scale.",
      "toolB": "Built and maintained primarily by a single creator, which its own cons note may affect long-term support capacity.",
      "whyItMatters": "Long-term project sustainability and support responsiveness can differ significantly between a company-backed platform and a single-maintainer project.",
      "benefitsWho": "Teams evaluating vendor risk for production-critical systems."
    },
    {
      "title": "Deployment footprint",
      "toolA": "Runs as a platform with free and paid hosted tiers and a broader multi-service architecture.",
      "toolB": "Ships as a single Go executable with no external dependencies to install.",
      "whyItMatters": "A single-binary deployment is far simpler to run locally or on minimal infrastructure, such as a single VM or edge device.",
      "benefitsWho": "Solo developers, small projects, and edge or embedded deployments."
    },
    {
      "title": "Pricing",
      "toolA": "Freemium with Free ($0, 2 projects, paused after 1 week inactivity), Pro ($25/month), and custom Enterprise tiers.",
      "toolB": "Entirely free — no pricing plans are published since it's self-hosted only.",
      "whyItMatters": "Affects total cost of ownership at different scales.",
      "benefitsWho": "Budget-constrained projects versus teams wanting a paid support/SLA relationship."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Backend Services",
      "rows": [
        {
          "feature": "Realtime database",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Authentication",
          "toolA": "available",
          "toolB": "available",
          "note": "Appwrite includes MFA; PocketBase includes OAuth2 for Google, Facebook, GitHub, GitLab"
        },
        {
          "feature": "File storage",
          "toolA": "available",
          "toolB": "available",
          "note": "PocketBase supports local or S3-compatible storage with thumbnails"
        },
        {
          "feature": "Admin dashboard",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Messaging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Serverless functions",
          "toolA": "available",
          "toolB": "limited",
          "note": "PocketBase is extended via Go/JS hooks rather than a dedicated function service"
        },
        {
          "feature": "Site hosting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Support",
      "rows": [
        {
          "feature": "Managed cloud hosting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Single-executable deployment",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official SDKs",
          "toolA": "available",
          "toolB": "available",
          "note": "Appwrite: 30+ frameworks/languages; PocketBase: JS/TypeScript and Dart"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Appwrite's free tier caps at 2 projects and pauses after 1 week of inactivity; PocketBase is fully free"
        },
        {
          "feature": "Paid managed tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Enterprise compliance (SOC-2, HIPAA, SSO)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is PocketBase free?",
      "answer": "Yes, PocketBase is open source and free to self-host."
    },
    {
      "question": "Does Appwrite offer a free plan?",
      "answer": "Yes, but the Free plan is limited to 2 projects and projects are paused after 1 week of inactivity."
    },
    {
      "question": "Can PocketBase be run in a managed cloud?",
      "answer": "No — PocketBase is self-hosted only, with no official managed cloud hosting offered."
    },
    {
      "question": "What language is PocketBase built in?",
      "answer": "PocketBase is built with Go and distributed as a single executable."
    },
    {
      "question": "Does PocketBase support OAuth login?",
      "answer": "Yes, it supports OAuth2 sign-in with Google, Facebook, GitHub, and GitLab in addition to email/password."
    },
    {
      "question": "Which platform has messaging built in?",
      "answer": "Appwrite includes a dedicated messaging service; this isn't documented as a feature of PocketBase."
    }
  ]
};

export default appwriteVsPocketbaseContent;
