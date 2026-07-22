import type { ToolComparisonContent } from './types';

const affineVsTimestripeContent: ToolComparisonContent = {
  "verdict": "AFFiNE and Timestripe both help people organize their work, but they're built around different core structures. AFFiNE is an open-source, local-first workspace combining docs, whiteboards, and databases (an alternative to Notion and Miro), with 70,000+ GitHub stars and a self-hosting option. Timestripe is a goal-planning app organized around \"horizons,\" timeframes ranging from daily boards to multi-year plans, built for long-term goal tracking rather than open-ended document or whiteboard work.",
  "bestForToolA": "Teams and individuals who want a unified workspace for writing docs, sketching on whiteboards, and building structured databases in one app, with the option to self-host the MIT-licensed editor or use the free plan's 10 GB of cloud storage.",
  "bestForToolB": "People planning long-term goals across multiple timeframes (daily to multi-year) who want the Horizons system and step-by-step \"Climbs\" guides for categories like fitness, finance, and career, available on web, iPhone/iPad, and Android.",
  "whoNeedsBoth": "Someone could use Timestripe to plan and track multi-year personal or career goals via its Horizons system, while using AFFiNE as the underlying workspace for the actual documents, project databases, and whiteboards that support those goals day to day.",
  "keyDifferences": [
    {
      "title": "Core Structure",
      "toolA": "AFFiNE unifies docs, whiteboards, and databases in one workspace.",
      "toolB": "Timestripe organizes goals across flexible timeframes via its \"Horizons planning system,\" from daily tasks to multi-year plans.",
      "whyItMatters": "AFFiNE is a general-purpose workspace while Timestripe is purpose-built around a specific goal-timeframe model.",
      "benefitsWho": "Knowledge workers needing flexible docs/whiteboards (AFFiNE) versus goal-oriented planners wanting structured long-term tracking (Timestripe)."
    },
    {
      "title": "Self-Hosting & Open Source",
      "toolA": "AFFiNE's editor is MIT-licensed and open source with 70,000+ GitHub stars, offering a free self-hosting option plus commercial source licensing and OEM/white-label options for enterprises.",
      "toolB": "Timestripe's documented facts don't mention open-source licensing or self-hosting.",
      "whyItMatters": "Self-hosting affects data ownership and the ability to run the tool independent of a vendor's cloud.",
      "benefitsWho": "Privacy-conscious teams or enterprises wanting to control their own infrastructure."
    },
    {
      "title": "AI Features",
      "toolA": "AFFiNE offers an optional AI add-on for writing, visualization, and planning at $8.90/month billed annually, on top of its base plan.",
      "toolB": "Timestripe's documented feature list includes no AI capability.",
      "whyItMatters": "AI-assisted writing/planning can speed up content creation but adds cost on AFFiNE and appears absent entirely from Timestripe.",
      "benefitsWho": "AFFiNE users wanting AI drafting help, since Timestripe doesn't offer a comparable option per its facts."
    },
    {
      "title": "Platform Availability",
      "toolA": "AFFiNE has desktop apps for Windows, macOS, and Linux, plus web and mobile (iOS/Android) apps.",
      "toolB": "Timestripe is available as a web app plus iPhone, iPad, and Android apps, with no confirmed native Mac or Windows desktop app.",
      "whyItMatters": "Native desktop support affects offline use and performance for users who work primarily on a desktop OS.",
      "benefitsWho": "Linux and Windows desktop users specifically, since Timestripe lacks a documented native desktop app."
    },
    {
      "title": "Pricing Structure",
      "toolA": "AFFiNE's Pro plan is $6.75/month billed annually (100 GB storage, up to 10 members), with a Team plan at $10/seat/month (10+ seat minimum) and a one-time $499.99 \"Believer\" lifetime plan (1 TB storage).",
      "toolB": "Timestripe's PRO plan is $5/user/month, plus a one-time $250 \"Strategists' 5 Year Plan\" offering the same features as PRO.",
      "whyItMatters": "Both offer one-time-purchase alternatives to subscriptions, but at very different price points and storage/feature ceilings.",
      "benefitsWho": "Users who prefer to avoid recurring subscriptions, weighing AFFiNE's higher $499.99 lifetime option with 1 TB storage against Timestripe's cheaper $250 one-time plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workspace",
      "rows": [
        {
          "feature": "Docs & whiteboards",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Databases/tables",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Goal/horizon planning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Timestripe's Horizons system"
        },
        {
          "feature": "Templates",
          "toolA": "available",
          "toolB": "available",
          "note": "Timestripe: shared templates"
        }
      ]
    },
    {
      "group": "Platforms & Hosting",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AFFiNE: MIT-licensed, free"
        },
        {
          "feature": "Native desktop apps",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "AFFiNE: Windows, macOS, Linux"
        },
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & AI",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "AFFiNE: 10 GB cloud storage"
        },
        {
          "feature": "AI features",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AFFiNE: paid add-on, $8.90/month"
        },
        {
          "feature": "One-time/lifetime purchase option",
          "toolA": "available",
          "toolB": "available",
          "note": "AFFiNE $499.99; Timestripe $250"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is AFFiNE or Timestripe better for note-taking?",
      "answer": "AFFiNE, since it's built around unified docs, whiteboards, and databases, while Timestripe is centered on goal planning across timeframes rather than general note-taking."
    },
    {
      "question": "Does either tool support self-hosting?",
      "answer": "AFFiNE does. Its editor is MIT-licensed and open source, with a free self-hosting option. Timestripe's facts don't document a self-hosting option."
    },
    {
      "question": "Which has AI features?",
      "answer": "AFFiNE offers an optional AI add-on at $8.90/month for writing, visualization, and planning. Timestripe's documented feature set doesn't include AI capabilities."
    },
    {
      "question": "Are there one-time-purchase options instead of subscriptions?",
      "answer": "Yes for both. AFFiNE's Believer plan is a $499.99 one-time purchase with 1 TB storage, and Timestripe's Strategists' 5 Year Plan is a $250 one-time purchase with the same features as its PRO plan."
    },
    {
      "question": "Which has a native Windows or Linux app?",
      "answer": "AFFiNE does, with desktop apps for Windows, macOS, and Linux. Timestripe has no confirmed native Mac or Windows desktop app; it's a web app plus iOS/Android per its documented cons."
    },
    {
      "question": "What is Timestripe's Horizons system?",
      "answer": "It's a planning model that organizes goals across flexible timeframes, from daily tasks to multi-year plans, which is a structurally different approach than AFFiNE's docs-and-whiteboard workspace."
    }
  ]
};

export default affineVsTimestripeContent;
