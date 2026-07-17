import type { ToolComparisonContent } from './types';

const appwriteVsConvexContent: ToolComparisonContent = {
  "verdict": "Appwrite and Convex are both freemium backend platforms starting around $25/month, but they solve different problems — Appwrite bundles auth, databases, storage, functions, messaging, realtime, and site hosting into one open-source platform supporting 30+ languages and frameworks, while Convex is a TypeScript-first reactive database and function platform built around end-to-end type safety and built-in AI coding agent integrations. Pricing structure also differs: Appwrite's Pro tier is a flat $25/month, while Convex's Professional tier bills $25 per developer seat per month.",
  "bestForToolA": "Teams building across multiple languages and frameworks (30+ supported) that want a single open-source platform covering auth, database, storage, serverless functions, messaging, and even site hosting, with named production users like The Times of India, IBM, and American Airlines as reference points.",
  "bestForToolB": "TypeScript-centric teams that want end-to-end type safety from database to client, reactive real-time data sync, and built-in integrations with AI coding agents like Claude Code and Codex.",
  "whoNeedsBoth": "Teams running polyglot backend services alongside a TypeScript-heavy real-time frontend feature might use Appwrite for general backend needs like messaging and broad storage while using Convex specifically for a reactive, type-safe data layer in a TypeScript client app.",
  "keyDifferences": [
    {
      "title": "Language and framework breadth vs. TypeScript specialization",
      "toolA": "Supports 30+ frameworks and languages including React, Next.js, Vue, Flutter, Node.js, Python, PHP, Swift, and Kotlin.",
      "toolB": "Built specifically around TypeScript, with end-to-end type safety enforced from the database to the client.",
      "whyItMatters": "Determines whether the backend fits a polyglot team or a TypeScript-only stack.",
      "benefitsWho": "Teams choosing a backend to match their existing language stack."
    },
    {
      "title": "Per-seat vs. flat pricing on paid tiers",
      "toolA": "Pro plan is a flat $25/month covering 2TB bandwidth, 150GB storage, and unlimited databases/functions.",
      "toolB": "Professional plan bills $25 per developer per month (1-20 seats), so costs scale with team size.",
      "whyItMatters": "Growing engineering teams pay more on Convex's per-seat model as headcount increases, while Appwrite's flat fee doesn't scale with team size.",
      "benefitsWho": "Teams budgeting for growing engineering headcount."
    },
    {
      "title": "Compliance certifications on lower tiers",
      "toolA": "SOC-2, HIPAA, and BAA compliance require the custom Enterprise plan.",
      "toolB": "SOC 2 Type II certification and HIPAA compliance are documented at the platform level, not gated to a specific custom tier.",
      "whyItMatters": "Affects how early a compliance-sensitive team can adopt the platform without negotiating an enterprise contract.",
      "benefitsWho": "Startups in regulated industries such as health tech or fintech needing compliance sooner."
    },
    {
      "title": "Product surface area",
      "toolA": "Bundles Auth, Databases, Storage, Functions, Messaging, Realtime, and Sites (an open-source Vercel-style hosting alternative) in one platform.",
      "toolB": "Focuses on a reactive database, serverless functions, real-time sync, file storage, plus reusable Convex Components.",
      "whyItMatters": "Appwrite covers more distinct product categories, like messaging and site hosting, that Convex doesn't document.",
      "benefitsWho": "Teams wanting to consolidate more infrastructure under a single vendor."
    },
    {
      "title": "Free tier constraints",
      "toolA": "Free plan projects are paused after 1 week of inactivity and limited to 2 projects.",
      "toolB": "Free & Starter tier (1-6 developer seats) includes reactive database, file storage, and vector search with pay-as-you-go overage, with no documented inactivity pause.",
      "whyItMatters": "Determines whether a side project or prototype risks being paused on the free tier.",
      "benefitsWho": "Solo developers and early-stage prototypes."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Backend Services",
      "rows": [
        {
          "feature": "Authentication",
          "toolA": "available",
          "toolB": "available",
          "note": "Appwrite includes MFA support"
        },
        {
          "feature": "Database",
          "toolA": "available",
          "toolB": "available",
          "note": "Convex's is reactive with real-time sync"
        },
        {
          "feature": "File storage",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Serverless functions",
          "toolA": "available",
          "toolB": "available",
          "note": "Convex uses Node.js actions"
        },
        {
          "feature": "Messaging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Site hosting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Developer Experience",
      "rows": [
        {
          "feature": "End-to-end type safety",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Vector/text search included free",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI coding agent integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Convex documents Claude Code and Codex integrations"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Convex documents open-source \"Convex Components\" but not the full platform as open source"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier available",
          "toolA": "limited",
          "toolB": "available",
          "note": "Appwrite's free tier is capped at 2 projects and paused after 1 week of inactivity"
        },
        {
          "feature": "Flat-rate paid tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Convex Professional bills per developer seat ($25/dev/month) rather than flat"
        },
        {
          "feature": "SOC 2 / HIPAA compliance",
          "toolA": "limited",
          "toolB": "available",
          "note": "Appwrite requires the custom Enterprise plan; Convex documents this at the Professional tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Appwrite open source?",
      "answer": "Yes, Appwrite is an open-source backend platform."
    },
    {
      "question": "Does Convex support real-time features?",
      "answer": "Yes, Convex has a reactive database with automatic real-time synchronization across connected clients."
    },
    {
      "question": "How does pricing differ between the two?",
      "answer": "Appwrite's Pro plan is a flat $25/month; Convex's Professional plan is $25 per developer seat per month, so cost scales with team size."
    },
    {
      "question": "Which platform integrates with AI coding agents?",
      "answer": "Convex documents built-in integrations for AI coding agents like Claude Code and Codex; this isn't documented for Appwrite."
    },
    {
      "question": "Does Appwrite include messaging and hosting?",
      "answer": "Yes, Appwrite bundles a messaging service and a Sites feature, an open-source alternative to Vercel, alongside auth, databases, storage, functions, and realtime."
    },
    {
      "question": "Are both HIPAA compliant?",
      "answer": "Convex documents HIPAA compliance and SOC 2 Type II certification at the platform level; Appwrite requires its custom Enterprise plan for SOC-2, HIPAA, and BAA compliance."
    }
  ]
};

export default appwriteVsConvexContent;
