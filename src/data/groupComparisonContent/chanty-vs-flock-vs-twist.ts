import type { GroupComparisonContent } from './types';

const chantyVsFlockVsTwistContent: GroupComparisonContent = {
  "verdict": "Chanty, Flock, and Twist are all genuine, affordable alternatives to Slack and Microsoft Teams for small and mid-sized teams, but they solve the 'too much chat' problem differently. Chanty and Flock both bundle real-time messaging with native task management, to-dos, and video calling, competing mostly on free-tier size and per-user price, while Twist deliberately abandons real-time chat in favor of threaded, asynchronous discussion for distributed teams. No single tool wins outright: the right pick depends on whether a team wants tighter task integration, a bigger free tier, or less always-on chat pressure.",
  "bestFor": {
    "chanty": "Small teams that want unlimited searchable chat history and one-click task creation (Teambook) on a permanently free plan for up to 5 members",
    "flock": "Slightly larger free teams (up to 20 members) that want bundled productivity apps like shared to-dos, polls, and reminders alongside chat",
    "twist": "Remote and distributed teams that want to deliberately move away from real-time chat pressure in favor of organized, thread-based async discussion"
  },
  "highlights": [
    {
      "title": "Built-in task management sets Chanty and Flock apart from Twist",
      "description": "Chanty's Teambook turns any message into a task with one click, and Flock ships native shared to-dos, polls, and reminders directly in the app. Twist instead relies on its Todoist integration for task tracking rather than a built-in task manager.",
      "toolSlugs": [
        "chanty",
        "flock"
      ]
    },
    {
      "title": "Twist is built around async-first, thread-based conversations",
      "description": "Twist organizes discussion into subject-lined threads like email or a forum and deliberately omits typing indicators, read receipts, and always-online status to reduce interruption-driven chat culture.",
      "toolSlugs": [
        "twist"
      ]
    },
    {
      "title": "Free plans differ sharply in what they cap",
      "description": "Chanty's free plan is unlimited on message history but capped at 5 team members. Flock's free Starter plan allows up to 20 members but caps searchable history at 10,000 messages. Twist's free plan has no stated member cap but limits visible history to the past month.",
      "toolSlugs": [
        "chanty",
        "flock",
        "twist"
      ]
    },
    {
      "title": "Chanty scales furthest on video meeting capacity",
      "description": "Chanty supports video meetings with up to 1,000 participants and 49 visible tiles at 4K, notably larger scale than Flock's group video calls with screen sharing, while Twist offers no built-in video calling at all.",
      "toolSlugs": [
        "chanty",
        "flock",
        "twist"
      ]
    },
    {
      "title": "Entry-level paid pricing is close but not identical",
      "description": "Chanty's Business plan starts at $3/user/month billed annually, Flock's Pro plan at $4.50/user/month billed annually, and Twist's Unlimited plan at $6/user/month billed annually.",
      "toolSlugs": [
        "chanty",
        "flock",
        "twist"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Communication",
      "rows": [
        {
          "feature": "Real-time group chat",
          "statuses": {
            "chanty": "available",
            "flock": "available",
            "twist": "limited"
          },
          "note": "Twist uses threaded, asynchronous conversations by design rather than a live chat stream."
        },
        {
          "feature": "Threaded/asynchronous discussion",
          "statuses": {
            "chanty": "unavailable",
            "flock": "unavailable",
            "twist": "available"
          }
        },
        {
          "feature": "Video calling",
          "statuses": {
            "chanty": "available",
            "flock": "available",
            "twist": "unavailable"
          },
          "note": "Chanty supports meetings up to 1,000 participants; Flock supports group video calls with screen sharing."
        },
        {
          "feature": "One-on-one voice calls",
          "statuses": {
            "chanty": "available",
            "flock": "available",
            "twist": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Productivity and Integrations",
      "rows": [
        {
          "feature": "Built-in task/to-do management",
          "statuses": {
            "chanty": "available",
            "flock": "available",
            "twist": "limited"
          },
          "note": "Twist connects to Todoist for tasks rather than including native task management."
        },
        {
          "feature": "Polls and reminders",
          "statuses": {
            "chanty": "not-documented",
            "flock": "available",
            "twist": "not-documented"
          }
        },
        {
          "feature": "Third-party app integrations (Zapier, GitHub, Google Drive, etc.)",
          "statuses": {
            "chanty": "available",
            "flock": "available",
            "twist": "available"
          }
        }
      ]
    },
    {
      "group": "Plans and Access",
      "rows": [
        {
          "feature": "Free plan message history",
          "statuses": {
            "chanty": "available",
            "flock": "limited",
            "twist": "limited"
          },
          "note": "Chanty offers unlimited searchable history free; Flock caps free history at 10,000 messages; Twist's free plan shows only the past month."
        },
        {
          "feature": "SSO and HIPAA compliance",
          "statuses": {
            "chanty": "available",
            "flock": "limited",
            "twist": "not-documented"
          },
          "note": "Chanty includes HIPAA and SSO on its standard Business tier; Flock reserves SSO and Active Directory sync for its custom Enterprise plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheapest for a small paid team: Chanty, Flock, or Twist?",
      "answer": "Chanty's Business plan is the cheapest of the three at $3 per user per month billed annually, compared to Flock's Pro plan at $4.50 per user per month and Twist's Unlimited plan at $6 per user per month, both also billed annually."
    },
    {
      "question": "What makes Twist fundamentally different from Chanty and Flock?",
      "answer": "Twist replaces the real-time chat stream used by Chanty and Flock with subject-lined, threaded conversations similar to email, and it deliberately leaves out typing indicators, read receipts, and online status to reduce always-on chat pressure for distributed teams."
    },
    {
      "question": "Do Chanty and Flock include task management without a separate app?",
      "answer": "Yes. Chanty lets you turn any chat message into a task with one click through its Teambook feature, and Flock includes native shared to-do lists, polls, and reminders directly in the app, so lightweight task tracking doesn't require a separate tool."
    },
    {
      "question": "Which tool has the largest free team size?",
      "answer": "Flock's free Starter plan supports up to 20 team members, larger than Chanty's free plan, which is capped at 5 members. Twist's free plan does not state a hard member cap but limits visible message history to one month."
    },
    {
      "question": "Does any of these three support HIPAA compliance or single sign-on?",
      "answer": "Chanty includes HIPAA compliance and SSO on its standard Business plan. Flock offers SSO and Active Directory sync only on its custom-priced Enterprise plan. Twist does not document HIPAA compliance or SSO support."
    },
    {
      "question": "Which tool is best for large video meetings?",
      "answer": "Chanty supports the largest video meetings of the three, with capacity for up to 1,000 participants and 49 visible video tiles at 4K quality. Flock supports smaller group video calls with screen sharing, and Twist does not include built-in video calling."
    }
  ]
};

export default chantyVsFlockVsTwistContent;
