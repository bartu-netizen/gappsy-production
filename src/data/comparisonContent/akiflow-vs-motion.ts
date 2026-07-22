import type { ToolComparisonContent } from './types';

const akiflowVsMotionContent: ToolComparisonContent = {
  "verdict": "Akiflow and Motion both use AI to time-block calendars and prioritize tasks, but they differ in scope and pricing structure: Motion extends into full project management (Gantt charts, capacity planning, AI meeting notetaking) on per-seat pricing, while Akiflow stays focused on personal task/calendar consolidation with voice capture and a universal inbox at a flat monthly price. Neither offers a permanent free plan.",
  "bestForToolA": "Individuals who want a universal inbox, time-blocking calendar, and voice/natural-language task capture at a lower flat monthly price ($19/month billed yearly), without needing project-management features.",
  "bestForToolB": "Teams that need AI-driven project management — timeline/Gantt charts, team capacity planning, and AI meeting notetaking — alongside calendar auto-scheduling, and that are comfortable with per-seat pricing ($19–$29/seat/month).",
  "whoNeedsBoth": "These are largely substitute personal/team planners rather than complements; an individual contributor might use Akiflow for personal time-blocking while their broader team runs projects in Motion, but the facts don't describe a native combined workflow between the two.",
  "keyDifferences": [
    {
      "title": "Project management scope",
      "toolA": "Focused on tasks, calendar, and a universal inbox — no project management, timeline, or Gantt chart features are documented.",
      "toolB": "Business AI tier adds team capacity planning, advanced dashboards and reports, and timeline/Gantt charts.",
      "whyItMatters": "Teams tracking multi-person projects with dependencies need Gantt/capacity-planning tools that a personal planner doesn't provide.",
      "benefitsWho": "Project managers and team leads benefit from Motion's Business AI project-management features."
    },
    {
      "title": "AI meeting notetaking",
      "toolA": "Not documented as a feature; Akiflow instead sends daily briefings and reminders of upcoming tasks and meetings.",
      "toolB": "AI meeting notetaker takes meeting notes and follows up with action items automatically.",
      "whyItMatters": "Automatic meeting note capture reduces manual note-taking and ensures action items are tracked without extra effort.",
      "benefitsWho": "People in meeting-heavy roles benefit from Motion's AI meeting notetaker."
    },
    {
      "title": "Voice and natural-language capture",
      "toolA": "Aki AI assistant supports adding tasks via voice commands or natural language from anywhere.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Voice capture lets users offload tasks quickly without opening the app and typing.",
      "benefitsWho": "Users who want hands-free task capture benefit from Akiflow's voice and natural-language input."
    },
    {
      "title": "Pricing structure",
      "toolA": "Flat monthly pricing: $34/month billed monthly or $19/month billed yearly, not per-seat.",
      "toolB": "Per-seat pricing: $19/seat/month (Pro AI) or $29/seat/month (Business AI).",
      "whyItMatters": "Per-seat pricing scales cost with team size, while flat pricing keeps individual cost predictable regardless of team growth.",
      "benefitsWho": "Solo users benefit from Akiflow's flat pricing; teams adding members benefit from clarity on Motion's published per-seat cost, even as it scales up."
    },
    {
      "title": "Trial length",
      "toolA": "Offers a 7-day free trial; no permanent free plan.",
      "toolB": "Offers a free trial that can be cancelled at any time; no permanent free plan.",
      "whyItMatters": "Trial length and cancellation terms affect how much time a buyer has to evaluate the product before paying.",
      "benefitsWho": "Buyers wanting a longer or more flexible evaluation window may prefer Motion's cancel-anytime trial over Akiflow's fixed 7-day window."
    }
  ],
  "featureMatrix": [
    {
      "group": "Planning & AI Capabilities",
      "rows": [
        {
          "feature": "AI-driven scheduling/prioritization",
          "toolA": "available",
          "toolB": "available",
          "note": "Akiflow: Aki assistant via chat/voice. Motion: AI calendar assistant auto-schedules around commitments."
        },
        {
          "feature": "AI meeting notetaker",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Voice/natural-language task capture",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI project manager (auto status updates)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Daily briefings/summaries",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Team & Project Features",
      "rows": [
        {
          "feature": "Timeline / Gantt charts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Motion Business AI tier."
        },
        {
          "feature": "Team capacity planning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Permissions & access control",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published team/multi-seat pricing",
          "toolA": "limited",
          "toolB": "available",
          "note": "Akiflow team pricing requires contacting sales."
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Akiflow: 7-day trial. Motion: cancel-anytime trial, length not specified."
        },
        {
          "feature": "AI credit allowance disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Motion: 7,500–15,000 credits/seat/month."
        },
        {
          "feature": "AI phone-call feature",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Akiflow lists this as in development, not yet available."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Akiflow have a free plan?",
      "answer": "No, Akiflow offers a 7-day free trial rather than a permanent free plan."
    },
    {
      "question": "Does Motion have a free plan?",
      "answer": "No, Motion requires a paid seat after the free trial, which can be cancelled at any time."
    },
    {
      "question": "Which tool includes project management features like Gantt charts?",
      "answer": "Motion's Business AI tier includes timeline and Gantt charts along with team capacity planning; this isn't a documented feature of Akiflow."
    },
    {
      "question": "Can I add tasks by voice on either platform?",
      "answer": "Akiflow's Aki assistant supports voice commands and natural-language task capture from anywhere. This isn't documented as a Motion feature."
    },
    {
      "question": "How is each tool priced?",
      "answer": "Akiflow is priced flat per user: $34/month monthly or $19/month billed yearly. Motion is priced per seat: $19/seat/month (Pro AI) or $29/seat/month (Business AI)."
    },
    {
      "question": "Is Akiflow's AI phone-call feature available yet?",
      "answer": "No, it's listed as in development and not yet available."
    }
  ]
};

export default akiflowVsMotionContent;
