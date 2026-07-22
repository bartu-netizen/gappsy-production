import type { ToolComparisonContent } from './types';

const morgenVsRoutineContent: ToolComparisonContent = {
  "verdict": "Morgen and Routine both consolidate calendars and tasks with AI assistance, but Routine is the broader workspace — adding notes, custom databases, a universal inbox, and a genuinely free forever tier — while Morgen stays focused on calendar consolidation with an AI-generated daily plan, scheduling/booking links, and team-availability features that aren't documented for Routine. Routine is also markedly cheaper at entry, starting at $5/month versus Morgen's $15/month lowest paid tier.",
  "bestForToolA": "People juggling multiple calendar providers (Google, Outlook, Apple, Fastmail) who want an AI-generated daily schedule with recommended time blocks, personalized booking links, and visibility into colleague availability.",
  "bestForToolB": "People who want a single free-forever workspace combining tasks, calendar, notes, custom databases, and a universal inbox, upgrading only if they need AI meeting notes or AI agents at the Professional tier and above.",
  "whoNeedsBoth": "A team could start everyone on Routine's free tier for unified tasks, notes, and inbox, while individuals who specifically need multi-calendar consolidation, booking links, or team-availability views might separately adopt Morgen, since neither tool documents the other's differentiating features.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "No permanent free plan; only a 14-day free trial with no credit card required, plus a 30-day money-back guarantee.",
      "toolB": "Has a genuinely free forever tier with tasks, calendar, notes, an AI assistant, AI voice commands, offline mode, 3 integrations, 3 custom databases, and 250 AI credits.",
      "whyItMatters": "A permanent free tier lets individuals use the core product indefinitely at no cost, rather than only within a trial window.",
      "benefitsWho": "Budget-conscious individuals benefit from Routine's free-forever tier; Morgen requires payment after the trial ends."
    },
    {
      "title": "Notes and custom databases",
      "toolA": "Not documented — Morgen's feature set centers on calendar and task consolidation, not notes or custom entity types.",
      "toolB": "Includes notes and custom databases that let users define custom entity types such as customers, projects, or candidates.",
      "whyItMatters": "Custom databases extend a planner into a broader workspace that can track more than just tasks and events.",
      "benefitsWho": "Users who want a single tool for notes, tasks, and lightweight structured data benefit from Routine's custom databases."
    },
    {
      "title": "AI-generated daily schedule",
      "toolA": "The AI Planner generates a daily plan with recommended time blocks that users can preview and adjust, and re-prioritizes as conflicts arise.",
      "toolB": "Offers manual time blocking and tracking, described as scheduling tasks into calendar time blocks and tracking time spent — not described as AI-generated.",
      "whyItMatters": "An AI that proactively generates and adjusts a daily schedule reduces manual planning effort compared to manual time-blocking tools.",
      "benefitsWho": "Users who want automated day-planning benefit from Morgen's AI Planner; Routine users get more manual control over time blocks."
    },
    {
      "title": "Scheduling links and team availability",
      "toolA": "Lets users share personalized booking links and shows colleague availability with recommended meeting times.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Booking links and team-availability views reduce back-and-forth when scheduling meetings with others.",
      "benefitsWho": "People who frequently schedule meetings with external contacts or colleagues benefit from Morgen's booking and availability tools."
    },
    {
      "title": "AI meeting notes",
      "toolA": "Not documented as a feature.",
      "toolB": "Summarizes meetings and turns action items into tasks automatically, available from the Professional tier upward.",
      "whyItMatters": "Automatic meeting summarization saves time compared to manually reviewing notes after every meeting.",
      "benefitsWho": "People with frequent meetings benefit from Routine's AI meeting notes, provided they're on the Professional plan or above."
    }
  ],
  "featureMatrix": [
    {
      "group": "Planning & AI Features",
      "rows": [
        {
          "feature": "AI-generated daily plan/time blocks",
          "toolA": "available",
          "toolB": "limited",
          "note": "Routine offers manual time blocking & tracking; not described as AI-generated."
        },
        {
          "feature": "AI meeting notes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Routine: Professional tier and above."
        },
        {
          "feature": "Notes & custom databases",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Scheduling / booking links",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Team availability view",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Calendar providers consolidated",
          "toolA": "available",
          "toolB": "available",
          "note": "Morgen: Google, Outlook, Apple, Fastmail. Routine: Google Calendar, Outlook among 26+ services."
        },
        {
          "feature": "Task-tool integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Morgen: Notion, ClickUp, Linear, Todoist. Routine: Asana, Linear among 26+ services."
        },
        {
          "feature": "Universal inbox",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Platforms",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Morgen: 14-day trial plus 30-day money-back guarantee."
        },
        {
          "feature": "Cross-platform desktop + mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Morgen: Windows, Mac, Linux, web, mobile. Routine: macOS, Windows, Linux, web, iOS, Android."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Routine free?",
      "answer": "Yes, Routine has a free forever plan with tasks, calendar, notes, and a basic AI assistant; paid tiers add more integrations, databases, and AI credits."
    },
    {
      "question": "Does Morgen have a free trial?",
      "answer": "Yes, a 14-day free trial with full access and no credit card required, plus a 30-day money-back guarantee on paid plans."
    },
    {
      "question": "How much do paid plans cost on each platform?",
      "answer": "Routine: Personal is $5/month, Professional is $10/month, Business is $15/seat/month, and Enterprise is custom. Morgen: Pro is $30/month billed monthly or $15/month billed annually; Team is $25/seat/month monthly or $10/seat/month annually (2-seat minimum)."
    },
    {
      "question": "What does Morgen's AI Planner do?",
      "answer": "It generates a prioritized daily plan and re-prioritizes it if new conflicts arise."
    },
    {
      "question": "Does Routine support AI meeting notes?",
      "answer": "Yes, AI meeting notes and AI agents/automations are included from the Professional plan upward."
    },
    {
      "question": "What calendars does each platform consolidate?",
      "answer": "Morgen combines Google, Outlook, Apple, and Fastmail calendars into one view. Routine integrates with Google Calendar and Outlook, among 26+ connected services."
    }
  ]
};

export default morgenVsRoutineContent;
