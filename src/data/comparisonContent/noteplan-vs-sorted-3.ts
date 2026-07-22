import type { ToolComparisonContent } from './types';

const noteplanVsSorted3Content: ToolComparisonContent = {
  "verdict": "NotePlan and Sorted 3 both combine notes, tasks, and calendar into unified planning tools for Apple users, but they differ in data format, AI features, and pricing model. NotePlan stores everything as plaintext markdown files and includes AI note tools, a Smart Note Assistant and Memo AI for voice notes, available only via subscription after a 7-day trial. Sorted 3 emphasizes a visual, auto-scheduling timeline and offers a free tier plus a one-time PRO unlock instead of a subscription.",
  "bestForToolA": "Users who want their notes stored as portable plaintext markdown files, avoiding proprietary lock-in, plus AI features like voice-note transcription and summarization, and who don't mind a paid subscription ($8.33-$12/month).",
  "bestForToolB": "Users who want a fully free tier before ever paying, plus a one-time PRO purchase ($14.99 iOS / $24.99 macOS) rather than a subscription, centered on a visual auto-scheduling timeline with time-blocking.",
  "whoNeedsBoth": "There's little practical case for running both as primary planners since they overlap heavily on unifying tasks, notes, and calendar; a more realistic choice is picking NotePlan for its plaintext markdown portability and AI writing tools, or Sorted 3 for its free tier and one-time-purchase auto-scheduling timeline, rather than paying for both.",
  "keyDifferences": [
    {
      "title": "Data Storage Format",
      "toolA": "NotePlan stores all content as plaintext markdown files, enabling portability, offline access, and avoiding lock-in to a proprietary format.",
      "toolB": "Sorted 3's documented facts don't specify a storage format.",
      "whyItMatters": "Plaintext markdown storage means users can access and edit their data with any text editor, independent of the app.",
      "benefitsWho": "Users concerned about long-term data portability and avoiding vendor lock-in."
    },
    {
      "title": "AI Features",
      "toolA": "NotePlan documents a Smart Note Assistant for writing/summarizing and Memo AI, which turns voice notes into structured insights.",
      "toolB": "Sorted 3's documented feature list includes no AI capability.",
      "whyItMatters": "AI-assisted note-taking and voice transcription can significantly speed up daily planning and journaling.",
      "benefitsWho": "Users who frequently capture voice notes or want AI help summarizing and structuring content."
    },
    {
      "title": "Pricing Model",
      "toolA": "NotePlan has no permanent free plan, only a 7-day free trial before requiring a subscription ($12/month or $8.33/month billed annually, i.e. $99.99/year).",
      "toolB": "Sorted 3 offers a free tier on both iOS and macOS before a one-time PRO unlock ($14.99 iOS, $24.99 macOS), with no subscription required.",
      "whyItMatters": "A free tier with a one-time upgrade versus a trial-then-subscription model changes both the up-front cost and long-term commitment.",
      "benefitsWho": "Budget-conscious users who want to try before paying anything upfront (Sorted 3) versus those comfortable subscribing after a short trial (NotePlan)."
    },
    {
      "title": "Auto-Scheduling",
      "toolA": "NotePlan documents time-blocking via drag-and-drop scheduling but not an automatic task-placement engine.",
      "toolB": "Sorted 3 documents auto-scheduling that automatically places tasks into available time windows, plus a Time Ruler visual time-blocking tool.",
      "whyItMatters": "Automatic scheduling reduces manual effort in fitting tasks into open calendar time.",
      "benefitsWho": "Users who want the app to actively suggest task placement rather than manually dragging every task."
    },
    {
      "title": "Extensibility",
      "toolA": "NotePlan documents support for JavaScript-based plugins, custom templates, and themes for automation and formatting.",
      "toolB": "Sorted 3's documented facts don't mention a plugin system.",
      "whyItMatters": "Plugin support allows power users to customize workflows beyond the app's built-in features.",
      "benefitsWho": "Technical users who want to script custom automations into their planning app."
    }
  ],
  "featureMatrix": [
    {
      "group": "Notes & Data",
      "rows": [
        {
          "feature": "Plaintext markdown storage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Bi-directional linking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Plugin/template system",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "NotePlan: JS plugins, templates, themes"
        }
      ]
    },
    {
      "group": "Scheduling & Tasks",
      "rows": [
        {
          "feature": "Unified task/calendar/notes view",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Auto-scheduling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Time-blocking",
          "toolA": "available",
          "toolB": "available",
          "note": "NotePlan: drag-and-drop; Sorted 3: Time Ruler"
        },
        {
          "feature": "Google Calendar sync",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "AI note tools",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "NotePlan: Smart Note Assistant, Memo AI"
        },
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "NotePlan: 7-day trial only"
        },
        {
          "feature": "One-time purchase option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sorted 3: $14.99 iOS / $24.99 macOS"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does NotePlan have a free plan like Sorted 3?",
      "answer": "No, NotePlan only offers a 7-day free trial before requiring a subscription. Sorted 3 has a genuine free tier on both iOS and macOS before its one-time PRO unlock."
    },
    {
      "question": "Which app has AI features?",
      "answer": "NotePlan documents a Smart Note Assistant and Memo AI for voice-note transcription and summarization. Sorted 3's documented feature list includes no AI capability."
    },
    {
      "question": "How is data stored differently between the two?",
      "answer": "NotePlan stores content as plaintext markdown files for portability. Sorted 3's storage format isn't documented in the available facts."
    },
    {
      "question": "Which is cheaper over time?",
      "answer": "Sorted 3's one-time PRO unlock ($14.99 iOS, $24.99 macOS) avoids ongoing costs, while NotePlan requires an ongoing subscription of $8.33-$12/month after its 7-day trial."
    },
    {
      "question": "Does either app support Windows or Android?",
      "answer": "Neither documents Windows or Android support. NotePlan is built for Mac, iPhone, iPad, and web, while Sorted 3 is iOS and macOS only."
    },
    {
      "question": "Which tool has auto-scheduling?",
      "answer": "Sorted 3 documents an auto-scheduling feature that automatically places tasks into open time windows. NotePlan documents manual drag-and-drop time-blocking but not automatic scheduling."
    }
  ]
};

export default noteplanVsSorted3Content;
