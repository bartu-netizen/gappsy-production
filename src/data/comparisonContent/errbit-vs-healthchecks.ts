import type { ToolComparisonContent } from './types';

const errbitVsHealthchecksContent: ToolComparisonContent = {
  "verdict": "Errbit and healthchecks solve adjacent but distinct reliability problems: Errbit is a free, self-hosted, open-source error catcher that's API-compatible with Airbrake, designed to collect and surface application exceptions, while healthchecks is a cron job and scheduled task monitor that alerts when jobs silently fail to run on time. One catches errors that happen; the other catches jobs that don't happen at all.",
  "bestForToolA": "Development teams that want a completely free, self-hosted, MIT-licensed error tracker and are already using (or migrating from) Airbrake, since Errbit is a drop-in API-compatible replacement.",
  "bestForToolB": "Teams running scheduled or cron-based jobs (backups, batch processes, background workers) who need alerting specifically when a job fails to run or check in, with a genuinely free Hobbyist tier for up to 20 jobs.",
  "whoNeedsBoth": "A backend team running scheduled jobs that also write application code could use healthchecks to catch cron jobs that silently stop running, while Errbit catches and logs exceptions thrown by the application code itself — together covering both 'the job didn't run' and 'the job ran but errored' failure modes.",
  "keyDifferences": [
    {
      "title": "What Each Tool Monitors",
      "toolA": "Errbit is an error catcher: it collects application exceptions and errors reported via the Airbrake-compatible API.",
      "toolB": "healthchecks detects silent failures in scheduled and cron jobs — it alerts when a job doesn't check in on time, not when code throws an error.",
      "whyItMatters": "These are fundamentally different monitoring problems; conflating them could leave a gap where jobs stop running without erroring, or errors go untracked.",
      "benefitsWho": "Teams need to know which failure mode they're actually trying to catch before choosing a tool."
    },
    {
      "title": "Hosting Model",
      "toolA": "Errbit requires self-hosting on your own infrastructure (Ruby/MongoDB stack, or Docker), with no managed cloud option and no official vendor support or SLA.",
      "toolB": "healthchecks is offered as a hosted service with tiered pricing, so no self-hosting or infrastructure maintenance is required (an open-source self-hosted version is also implied by its tags, though pricing plans describe the hosted offering).",
      "whyItMatters": "Self-hosting gives full data control but adds operational burden; a hosted service removes that burden at a price.",
      "benefitsWho": "Teams wanting zero infrastructure overhead may prefer healthchecks' hosted plans; teams requiring full data control or working in restricted environments may prefer Errbit's self-hosted model."
    },
    {
      "title": "Pricing",
      "toolA": "Errbit is completely free and open source under the MIT license, with no paid tiers at all.",
      "toolB": "healthchecks has a free Hobbyist tier (20 jobs, 100 log entries per job) plus paid tiers from $5/month (Supporter) up to $80/month (Business Plus, 1000 jobs with SMS/WhatsApp/phone credits).",
      "whyItMatters": "Errbit's cost is entirely infrastructure and maintenance time; healthchecks' cost scales with job count and alert channel richness (SMS, WhatsApp, phone calls).",
      "benefitsWho": "Cost-sensitive teams with engineering capacity to self-host benefit from Errbit being free; teams wanting managed alerting with phone/SMS escalation benefit from healthchecks' paid tiers."
    },
    {
      "title": "Alert Channel Breadth",
      "toolA": "Errbit's alerting/notification channels are not detailed in its documented feature list beyond being an Airbrake-compatible error collector.",
      "toolB": "healthchecks supports Telegram, Pushover, Mattermost, Rocket.Chat, PagerDuty, and Google Chat, with SMS, WhatsApp, and phone call alerting available on paid tiers.",
      "whyItMatters": "Wide alert channel support, including phone calls, matters when a missed cron job needs to wake someone up outside business hours.",
      "benefitsWho": "On-call teams needing escalation beyond email/chat when critical scheduled jobs fail to run."
    },
    {
      "title": "Migration Compatibility",
      "toolA": "Errbit is explicitly Airbrake API compliant, so existing Airbrake gem/SDK users can point their client at an Errbit instance with no code changes.",
      "toolB": "healthchecks does not document compatibility with a specific competing product's API.",
      "whyItMatters": "API compatibility with an existing paid tool (Airbrake) makes Errbit a low-friction self-hosted replacement rather than a full re-integration.",
      "benefitsWho": "Teams already using Airbrake's SDKs who want to cut hosting costs by self-hosting instead."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring Function",
      "rows": [
        {
          "feature": "Application error/exception tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Cron/scheduled job monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Airbrake API compatibility",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Docker deployment support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Alerting",
      "rows": [
        {
          "feature": "Chat integrations (Slack-like tools)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Telegram, Mattermost, Rocket.Chat, Google Chat"
        },
        {
          "feature": "PagerDuty integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SMS/WhatsApp/phone call alerts",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "healthchecks: paid tiers only"
        }
      ]
    },
    {
      "group": "Pricing & Hosting",
      "rows": [
        {
          "feature": "Free tier / free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Errbit: fully free; healthchecks: Hobbyist tier for 20 jobs"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Paid managed tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "healthchecks: $5 to $80/mo"
        },
        {
          "feature": "Official vendor support/SLA",
          "toolA": "unavailable",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Errbit and healthchecks monitor the same thing?",
      "answer": "No. Errbit catches application errors and exceptions reported by your code. healthchecks monitors whether scheduled or cron jobs run on time and alerts when they don't check in — a different failure mode entirely."
    },
    {
      "question": "Is Errbit really free?",
      "answer": "Yes, Errbit is completely free and open source under the MIT license with no paid tiers. It does require self-hosting, so infrastructure and maintenance are still a cost."
    },
    {
      "question": "Does healthchecks have a free plan?",
      "answer": "Yes, its Hobbyist plan is free for up to 20 monitored jobs with 100 log entries per job. SMS, WhatsApp, and phone call alerting require a paid tier starting at $20/month (Business)."
    },
    {
      "question": "Can I migrate from Airbrake to Errbit?",
      "answer": "Yes, Errbit is Airbrake API compliant, so you can redirect an existing Airbrake gem or SDK to a self-hosted Errbit instance with no code changes."
    },
    {
      "question": "Which tool is better for on-call escalation?",
      "answer": "healthchecks supports SMS, WhatsApp, and phone call alerting on its paid tiers (from $20/month), alongside PagerDuty integration, which suits on-call escalation for missed jobs. Errbit's alert channel options are not documented in its feature list."
    },
    {
      "question": "Would a team need both Errbit and healthchecks?",
      "answer": "Possibly. Since Errbit catches application errors and healthchecks catches jobs that silently fail to run at all, a team running both application code and scheduled jobs could use both to cover different failure modes."
    }
  ]
};

export default errbitVsHealthchecksContent;
