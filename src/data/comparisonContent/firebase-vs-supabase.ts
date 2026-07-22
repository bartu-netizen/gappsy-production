import type { ToolComparisonContent } from './types';

const firebaseVsSupabaseContent: ToolComparisonContent = {
  "verdict": "Firebase and Supabase both promise a full backend without managing servers, but they start from different data philosophies and serve different default users. Firebase, built by Google since 2011, centers on Cloud Firestore and the Realtime Database, two NoSQL stores tuned for fast, real-time sync and offline mobile use, plus a deep bench of mobile tooling: Crashlytics, Analytics, Remote Config, and Cloud Messaging that ship free and integrate tightly with Android, iOS, and Flutter. Supabase, launched in 2020, is built around managed Postgres, so teams get full SQL, joins, foreign keys, and Postgres extensions including pgvector for embeddings, plus Row Level Security defined directly in the database rather than a separate rules language. It is also open source and can be self-hosted, while Firebase is closed and tied to Google Cloud. Pricing reflects the same split: Firebase's Blaze plan bills per operation once free quotas are exceeded, while Supabase charges a flatter 25 dollar per month Pro tier plus overages, though its Free tier pauses projects after a week of inactivity. Teams building real-time mobile apps with heavy analytics and crash reporting needs tend to reach for Firebase; teams that want relational data integrity, SQL flexibility, AI or vector features, or an exit path from vendor lock-in tend to reach for Supabase.",
  "bestForToolA": "Mobile-first teams building on Android, iOS, or Flutter that want real-time NoSQL sync, offline support, and bundled analytics, crash reporting, and push notifications without assembling separate tools.",
  "bestForToolB": "Teams that want a full relational Postgres database with SQL, foreign keys, Row Level Security, and built-in vector search, or that want an open source stack they can self-host.",
  "whoNeedsBoth": "Teams migrating off Firebase toward a more relational or open source backend, or agencies maintaining older Firebase mobile apps while building newer web products on Supabase, may reasonably run both during a transition.",
  "keyDifferences": [
    {
      "title": "Core data model",
      "toolA": "Cloud Firestore and the Realtime Database are NoSQL stores, a document tree and a JSON tree respectively",
      "toolB": "Every project is a dedicated Postgres instance with full SQL access and foreign keys",
      "whyItMatters": "Relational integrity, joins, and complex queries are native to one model and awkward to bolt onto the other",
      "benefitsWho": "Teams with relational or reporting-heavy data benefit from Supabase; teams with simple, denormalized, fast-changing data benefit from Firebase"
    },
    {
      "title": "Platform maturity",
      "toolA": "Founded in 2011 and long established as a Google product",
      "toolB": "Founded in 2020, a newer entrant to the backend-as-a-service space",
      "whyItMatters": "Longer-running platforms tend to have more accumulated tooling, integrations, and community answers",
      "benefitsWho": "Risk-averse teams and large mobile organizations lean toward the more established option"
    },
    {
      "title": "Pricing structure",
      "toolA": "Free Spark plan with quotas, then usage-based Blaze billing per operation",
      "toolB": "Free plan at zero cost, then a flat 25 dollar per month Pro tier plus usage overages",
      "whyItMatters": "Usage-based billing can be harder to forecast than a flatter tier with predictable overage categories",
      "benefitsWho": "Budget-conscious teams that want predictable line items benefit from Supabase's flatter tiering"
    },
    {
      "title": "Open source and lock-in",
      "toolA": "Closed source and tightly coupled to Google Cloud, with a nontrivial migration path if you leave",
      "toolB": "Core components are open source and the full stack can be self-hosted via Docker",
      "whyItMatters": "Vendor lock-in affects long-term negotiating leverage, compliance options, and exit costs",
      "benefitsWho": "Teams with compliance requirements or an aversion to lock-in benefit from Supabase's self-hosting option"
    },
    {
      "title": "Mobile-specific tooling",
      "toolA": "Bundles Crashlytics, Google Analytics for Firebase, Remote Config, and Cloud Messaging for cross-platform push",
      "toolB": "Does not document equivalent crash reporting, mobile analytics, feature flagging, or push messaging",
      "whyItMatters": "Mobile teams often need crash reporting, remote config, and push in addition to a database and auth",
      "benefitsWho": "Native Android, iOS, and Flutter teams benefit from Firebase's bundled mobile observability stack"
    },
    {
      "title": "AI and vector search",
      "toolA": "No vector or embeddings feature documented",
      "toolB": "Built-in pgvector support for storing and querying embeddings alongside relational data",
      "whyItMatters": "Teams building AI search, recommendations, or retrieval-augmented generation need a vector store somewhere in the stack",
      "benefitsWho": "Teams building AI features benefit from having vector search already inside Supabase's Postgres instance"
    },
    {
      "title": "Access control model",
      "toolA": "Security rules use a dedicated, proprietary syntax with a documented learning curve",
      "toolB": "Row Level Security policies are defined directly in standard Postgres",
      "whyItMatters": "The mechanism for securing data affects how much new syntax a team must learn and how portable those rules are",
      "benefitsWho": "Teams already comfortable with SQL benefit from Supabase's native Postgres RLS"
    },
    {
      "title": "Serverless function runtime",
      "toolA": "Cloud Functions run on Node.js or Python",
      "toolB": "Edge Functions run on Deno and TypeScript with Node.js compatibility, close to users worldwide",
      "whyItMatters": "Runtime and language choice affects code reuse with an existing stack and cold-start behavior",
      "benefitsWho": "Python backend teams benefit from Firebase; TypeScript-first teams benefit from Supabase Edge Functions"
    },
    {
      "title": "Free tier behavior",
      "toolA": "Spark plan free quotas are ongoing with no documented project pausing",
      "toolB": "Free plan projects automatically pause after a week of inactivity",
      "whyItMatters": "Automatic pausing can break demos, staging environments, or low-traffic side projects unexpectedly",
      "benefitsWho": "Hobbyists with intermittently used projects benefit from Firebase's non-pausing free quotas"
    },
    {
      "title": "Hosting for web apps",
      "toolA": "Firebase Hosting offers global CDN-backed static and SPA hosting with preview channels and free SSL",
      "toolB": "No dedicated static site or SPA hosting product is documented",
      "whyItMatters": "Bundled hosting removes the need for a separate deployment provider for the frontend",
      "benefitsWho": "Teams that want backend and frontend hosting from one vendor benefit from Firebase"
    }
  ],
  "featureMatrix": [
    {
      "group": "Database and data model",
      "rows": [
        {
          "feature": "SQL relational queries and joins",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Firestore and Realtime Database are NoSQL; complex relational queries are documented as harder in Firebase"
        },
        {
          "feature": "NoSQL document or JSON-tree store",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Firestore and the Realtime Database"
        },
        {
          "feature": "Row level access control in the database itself",
          "toolA": "limited",
          "toolB": "available",
          "note": "Firebase uses a separate security rules syntax rather than in-database policies"
        },
        {
          "feature": "Foreign key constraints",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Authentication",
      "rows": [
        {
          "feature": "Email and password sign-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Phone number OTP sign-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Magic link passwordless email sign-in",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Serverless compute",
      "rows": [
        {
          "feature": "Serverless functions",
          "toolA": "available",
          "toolB": "available",
          "note": "Firebase: Node.js or Python; Supabase: Deno and TypeScript with Node.js compatibility"
        },
        {
          "feature": "Scheduled or cron-triggered functions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Database event webhooks to external services",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Storage and media",
      "rows": [
        {
          "feature": "Object storage with CDN delivery",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "On the fly image transformations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Resumable uploads",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Realtime and sync",
      "rows": [
        {
          "feature": "Realtime data listeners",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Offline data support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented for Firestore specifically"
        },
        {
          "feature": "Presence and broadcast channels",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI and vector search",
      "rows": [
        {
          "feature": "Vector embeddings storage and search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "pgvector support in Supabase"
        },
        {
          "feature": "Built-in AI or vector toolkit",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Hosting and deployment",
      "rows": [
        {
          "feature": "Static site and SPA hosting with global CDN",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Preview deploy channels",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Custom domains with free SSL",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Developer tooling and openness",
      "rows": [
        {
          "feature": "Command line interface for local development",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Self-hosting the full stack",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Supabase can be self-hosted via Docker; Firebase is Google Cloud only"
        },
        {
          "feature": "Open source core",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Analytics and monitoring",
      "rows": [
        {
          "feature": "Built-in product analytics",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Analytics for Firebase"
        },
        {
          "feature": "Crash and error reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crashlytics"
        },
        {
          "feature": "Remote config and feature flags",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Push notifications",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cloud Messaging"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Firebase or Supabase?",
      "answer": "Both have free tiers, but they price growth differently: Firebase's free Spark plan moves to usage-based Blaze billing per operation once quotas are exceeded, while Supabase moves from a free plan to a flat 25 dollar per month Pro tier plus overages, which is generally easier to forecast at moderate scale."
    },
    {
      "question": "Is Supabase a good alternative to Firebase?",
      "answer": "Yes for teams that want a relational Postgres database instead of NoSQL, since Supabase provides full SQL, foreign keys, Row Level Security, and open source self-hosting, though it does not document Firebase's bundled mobile analytics, crash reporting, and push notification tooling."
    },
    {
      "question": "Does Firebase support SQL and relational data like Supabase?",
      "answer": "No, Firebase's two databases, Cloud Firestore and the Realtime Database, are both NoSQL, and complex relational queries, joins, and multi-table transactions are documented as harder to model than in a SQL database like Supabase's managed Postgres."
    },
    {
      "question": "Is Firebase or Supabase better for beginners?",
      "answer": "Firebase is generally considered easier for developers without SQL experience because its NoSQL model and prebuilt sign-in UI components require less relational database knowledge, while Supabase requires more comfort with SQL and Postgres concepts even though its dashboard and CLI tooling are approachable."
    },
    {
      "question": "Can Supabase do real-time sync like Firebase?",
      "answer": "Yes, Supabase's Realtime feature provides WebSocket-based broadcast, presence, and database change listeners for live, collaborative features, comparable in purpose to Firebase's real-time listeners on Firestore and the Realtime Database."
    },
    {
      "question": "Is Supabase open source, and is Firebase?",
      "answer": "Supabase's core components are open source and can be self-hosted via Docker, while Firebase is a closed, proprietary Google Cloud service with no self-hosting option documented."
    }
  ]
};

export default firebaseVsSupabaseContent;
