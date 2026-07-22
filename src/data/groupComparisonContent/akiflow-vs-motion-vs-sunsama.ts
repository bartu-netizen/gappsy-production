import type { GroupComparisonContent } from './types';

const akiflowVsMotionVsSunsamaContent: GroupComparisonContent = {
  "verdict": "Akiflow, Motion, and Sunsama each automate a piece of daily planning, but Motion goes furthest by fully automating scheduling with an AI algorithm that places tasks onto the calendar and dynamically re-plans the day, while Akiflow and Sunsama both rely more on the user actively organizing a Universal Inbox or completing a guided planning ritual. Motion also extends into team project management with a Business AI plan, a scope neither Akiflow nor Sunsama shares since both are built primarily for individual workflows. Users who want the AI to do the scheduling should lean toward Motion, those who want to consolidate many tools into one inbox with AI assistance should consider Akiflow, and those who prefer a structured, hands-on daily ritual will likely prefer Sunsama.",
  "bestFor": {
    "akiflow": "Busy professionals who want an AI assistant and Universal Inbox pulling tasks from many tools into one time-blocked calendar",
    "motion": "Professionals and teams who want fully automated AI scheduling that dynamically re-plans the day as things change",
    "sunsama": "Individuals who want a structured, guided daily and weekly planning ritual with simple, single-tier pricing"
  },
  "highlights": [
    {
      "title": "Motion is the only one with fully automated AI scheduling",
      "description": "Motion's algorithm automatically places tasks and meetings into open calendar time based on deadlines and priorities, then re-shuffles the schedule in real time, going further than Akiflow's manual time-blocking or Sunsama's guided ritual.",
      "toolSlugs": [
        "motion"
      ]
    },
    {
      "title": "Motion extends into team project management",
      "description": "Motion's Business AI plan adds Kanban-style project boards and shared team scheduling, a scope neither Akiflow nor Sunsama covers since both are built primarily for individual planning.",
      "toolSlugs": [
        "motion"
      ]
    },
    {
      "title": "Akiflow centers on an AI assistant and Universal Inbox",
      "description": "Aki, Akiflow's AI assistant, handles scheduling, prioritization, voice commands, and daily briefings on top of a Universal Inbox that pulls in tasks from tools like Trello, Slack, and Gmail.",
      "toolSlugs": [
        "akiflow"
      ]
    },
    {
      "title": "Sunsama is built around a daily and weekly ritual",
      "description": "Sunsama structures each day around a guided planning session and a recurring weekly review, a more prescriptive workflow than Akiflow's inbox or Motion's automated scheduling.",
      "toolSlugs": [
        "sunsama"
      ]
    },
    {
      "title": "None of the three offers a permanent free plan",
      "description": "Akiflow, Motion, and Sunsama all require payment after a short free trial, ranging from 7 to 14 days, unlike some calendar competitors that offer an ongoing free tier.",
      "toolSlugs": [
        "akiflow",
        "motion",
        "sunsama"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Planning",
      "rows": [
        {
          "feature": "Fully automated AI scheduling with dynamic re-planning",
          "statuses": {
            "akiflow": "unavailable",
            "motion": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "AI-assisted scheduling and prioritization",
          "statuses": {
            "akiflow": "available",
            "motion": "available",
            "sunsama": "available"
          },
          "note": "Akiflow's Aki assistant and Sunsama's AI planning suggestions assist manual planning, while Motion's AI drives scheduling automatically."
        },
        {
          "feature": "Guided daily and weekly planning ritual",
          "statuses": {
            "akiflow": "limited",
            "motion": "unavailable",
            "sunsama": "available"
          }
        },
        {
          "feature": "Meeting scheduling links",
          "statuses": {
            "akiflow": "unavailable",
            "motion": "available",
            "sunsama": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Platform and Team Features",
      "rows": [
        {
          "feature": "Team or multi-seat plan",
          "statuses": {
            "akiflow": "not-documented",
            "motion": "available",
            "sunsama": "unavailable"
          },
          "note": "Sunsama is intentionally built for individual workflows with no team tier."
        },
        {
          "feature": "Project management boards",
          "statuses": {
            "akiflow": "unavailable",
            "motion": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Free trial before requiring payment",
          "statuses": {
            "akiflow": "available",
            "motion": "available",
            "sunsama": "available"
          }
        },
        {
          "feature": "Enterprise security controls (SSO, SAML, SCIM)",
          "statuses": {
            "akiflow": "not-documented",
            "motion": "not-documented",
            "sunsama": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is Motion different from Akiflow and Sunsama?",
      "answer": "Motion fully automates scheduling with an AI algorithm that places tasks onto the calendar and dynamically re-shuffles them as the day changes, while Akiflow relies on a user-organized Universal Inbox and Sunsama relies on a guided manual planning ritual."
    },
    {
      "question": "Does any of these tools have a free plan?",
      "answer": "No. Akiflow, Motion, and Sunsama all require payment after a short free trial, ranging from 7 days for Akiflow and Motion to 14 days for Sunsama, with no permanent free tier."
    },
    {
      "question": "Which tool is best for a team, not just an individual?",
      "answer": "Motion is the strongest fit for teams, with a Business AI plan that adds shared project management boards and collaborative scheduling. Sunsama has no team tier, and Akiflow does not document a dedicated team plan."
    },
    {
      "question": "Is Motion's automated scheduling better than Akiflow's time-blocking?",
      "answer": "It depends on preference. Motion's AI decides where tasks go and adjusts automatically, which suits users who want less manual control, while Akiflow gives users an inbox to organize and manually time-block, which suits those who prefer more direct control over their schedule."
    },
    {
      "question": "Which tool offers meeting scheduling links like Calendly?",
      "answer": "Motion includes Calendly-style booking pages that let others schedule meetings based on real availability. Akiflow and Sunsama do not document this as a core feature."
    }
  ]
};

export default akiflowVsMotionVsSunsamaContent;
