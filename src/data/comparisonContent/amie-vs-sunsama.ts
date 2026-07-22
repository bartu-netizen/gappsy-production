import type { ToolComparisonContent } from './types';

const amieVsSunsamaContent: ToolComparisonContent = {
  "verdict": "Amie and Sunsama both touch calendars and tasks, but for different moments in the day: Amie centers on bot-free meeting recording, multi-language transcription, and turning meetings into action items, while Sunsama centers on planning and timeboxing the day itself, plus an end-of-day shutdown ritual, with broader task-tool integrations and transparently published pricing.",
  "bestForToolA": "People who spend much of their day in calls and want automatic, bot-free recording and transcription across many languages, plus an AI assistant that can draft emails and reschedule meetings from meeting context.",
  "bestForToolB": "People who want to plan and timebox their day across existing task tools like Asana, ClickUp, or Jira, with a structured end-of-day shutdown ritual, transparent published pricing, and a documented 14-day free trial.",
  "whoNeedsBoth": "Someone with a meeting-heavy calendar who also wants disciplined daily planning could use Amie to capture and transcribe meetings while using Sunsama to timebox the resulting action items and run an end-of-day review, since the two cover different parts of the workflow without documented overlap.",
  "keyDifferences": [
    {
      "title": "Meeting recording and transcription",
      "toolA": "Records meetings across Zoom, Google Meet, Microsoft Teams, Slack Huddle, Webex, and others without a bot joining the call, and transcribes 17 languages with speaker labeling plus 82 more without.",
      "toolB": "No meeting recording or transcription feature is documented.",
      "whyItMatters": "Automatic, bot-free meeting capture removes the friction and awkwardness of a separate bot joining every call.",
      "benefitsWho": "People in meeting-heavy roles across multiple languages benefit most from Amie's transcription capabilities."
    },
    {
      "title": "Daily shutdown ritual",
      "toolA": "Not documented as a feature.",
      "toolB": "Runs an end-of-day routine that summarizes accomplishments and highlights.",
      "whyItMatters": "A structured shutdown ritual helps close out the workday intentionally rather than tasks trailing off unfinished.",
      "benefitsWho": "People prone to overworking or who want a clear end-of-day boundary benefit from Sunsama's shutdown ritual."
    },
    {
      "title": "Task-tool integrations",
      "toolA": "Integrates with CRM/ATS tools: HubSpot, Notion, Slack, Linear, Pipedrive, Personio, Ashby, and Greenhouse.",
      "toolB": "Integrates with a broad set of task-management tools: Asana, ClickUp, Jira, Linear, Monday.com, Trello, Notion, and Todoist, plus calendars and Zapier.",
      "whyItMatters": "The right integration set depends on which task tools a team already uses day to day.",
      "benefitsWho": "Sales/recruiting teams using CRM/ATS tools benefit from Amie's integrations; teams standardized on project-management tools benefit from Sunsama's broader task-tool coverage."
    },
    {
      "title": "Pricing transparency and trial",
      "toolA": "Pricing is not published in plain text; only Pro and Business plan names and feature comparisons are listed.",
      "toolB": "Publishes exact prices ($22/month billed monthly, or $17/month billed yearly) and offers a 14-day free trial with no credit card required.",
      "whyItMatters": "Published pricing and a documented trial let buyers evaluate cost and product fit without a sales conversation.",
      "benefitsWho": "Buyers who want upfront pricing clarity and a no-risk trial benefit from Sunsama's transparent model."
    },
    {
      "title": "Platform availability",
      "toolA": "Available on macOS, Windows, and iOS only, with no confirmed Android or Linux app.",
      "toolB": "Available on Windows, web, iOS, and Android, in addition to Mac.",
      "whyItMatters": "Platform coverage determines whether a tool works across a team's mixed device ecosystem, including Android users.",
      "benefitsWho": "Android users and mixed-device teams benefit from Sunsama's broader platform coverage."
    }
  ],
  "featureMatrix": [
    {
      "group": "Meeting & AI Capabilities",
      "rows": [
        {
          "feature": "Bot-free meeting recording",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-language transcription",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Amie: 17 languages with speaker labels, 82 more without."
        },
        {
          "feature": "AI chat assistant (draft emails, reschedule meetings)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Daily shutdown ritual",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Focus mode (Pomodoro / app muting)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Platforms",
      "rows": [
        {
          "feature": "CRM/ATS integrations (HubSpot, Pipedrive, Ashby, Greenhouse)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Task-management tool integrations (Asana, ClickUp, Jira, Trello)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Android app",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Calendar sync (Google, Outlook, Apple)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Trust",
      "rows": [
        {
          "feature": "Published exact pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sunsama Pro: $22/month monthly or $17/month yearly."
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sunsama: 14-day trial, no credit card required."
        },
        {
          "feature": "SOC 2 compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO/SAML for enterprise",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Amie need a bot to join meetings?",
      "answer": "No, Amie records meetings without a separate bot participant joining the call."
    },
    {
      "question": "What languages does Amie transcribe?",
      "answer": "It transcribes 17 languages with speaker labeling and 82 additional languages without speaker labeling."
    },
    {
      "question": "Does Sunsama have a free trial?",
      "answer": "Yes, a 14-day free trial with no credit card required and full feature access."
    },
    {
      "question": "How much does Sunsama cost?",
      "answer": "The Pro plan is $22/month billed monthly or $17/month billed yearly, on a per-person basis."
    },
    {
      "question": "Is Amie's pricing published?",
      "answer": "Not in plain text — Amie lists Pro and Business plan names and feature comparisons, but exact prices aren't shown on the pricing page."
    },
    {
      "question": "What platforms is each app available on?",
      "answer": "Amie is available on macOS, Windows, and iOS, with no confirmed Android or Linux app. Sunsama is available on Windows, web, iOS, Android, and Mac."
    }
  ]
};

export default amieVsSunsamaContent;
