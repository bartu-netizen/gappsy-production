import type { ToolComparisonContent } from './types';

const healthchecksVsUptimeKumaContent: ToolComparisonContent = {
  "verdict": "healthchecks is a hosted, freemium cron-job monitoring service specifically for detecting silent failures in scheduled or background tasks, with a genuinely free tier for up to 20 jobs and paid tiers adding SMS, WhatsApp, and phone alerting. Uptime Kuma is a completely free, open-source, self-hosted uptime monitoring tool covering a much broader range of protocols including HTTP, TCP, WebSocket, ping, DNS, Docker containers, and gaming servers, with 90+ notification integrations, but requires you to run and maintain your own instance. They solve adjacent but distinct problems: healthchecks watches for jobs that fail to run on schedule, while Uptime Kuma watches whether services and endpoints are currently reachable.",
  "bestForToolA": "healthchecks fits teams wanting a hosted, no-maintenance way to catch silently failing cron jobs and scheduled tasks, with a genuinely free tier for up to 20 jobs and no self-hosting required.",
  "bestForToolB": "Uptime Kuma fits technical teams and self-hosters who want free, unlimited, self-hosted monitoring across many protocols such as HTTP, TCP, DNS, Docker, and gaming servers, and are comfortable running their own Docker/Node.js instance.",
  "whoNeedsBoth": "A DevOps team could use healthchecks to monitor whether its cron jobs and scheduled tasks check in on time while running Uptime Kuma to monitor whether the services those jobs depend on, such as web endpoints, databases, or Docker containers, are currently reachable — the two watch different failure modes.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "healthchecks is a hosted SaaS service with no infrastructure to manage.",
      "toolB": "Uptime Kuma is self-hosted only, deployable via Docker Compose, Docker CLI, or a non-Docker install on Linux or Windows 10+, with no official managed cloud version.",
      "whyItMatters": "Self-hosting trades operational overhead for cost control and data ownership.",
      "benefitsWho": "Teams wanting zero infrastructure management benefit from healthchecks' hosted model; teams wanting full data control benefit from Uptime Kuma's self-hosted model."
    },
    {
      "title": "Monitoring Scope",
      "toolA": "healthchecks is purpose-built for detecting silent failures in cron jobs and background/scheduled tasks.",
      "toolB": "Uptime Kuma monitors a much broader range of protocols, including HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers, with 20-second check intervals and status pages.",
      "whyItMatters": "A cron-monitoring tool and a general uptime/service monitor address different failure scenarios.",
      "benefitsWho": "Teams needing broad infrastructure and service uptime monitoring benefit from Uptime Kuma's protocol coverage; teams specifically worried about missed scheduled jobs benefit from healthchecks' focus."
    },
    {
      "title": "Cost Structure",
      "toolA": "healthchecks' Hobbyist tier is free for up to 20 jobs, with paid tiers at $5, $20, and $80/month adding more jobs and SMS/WhatsApp/phone alert credits.",
      "toolB": "Uptime Kuma is entirely free and open source under the MIT license with no paid tiers at all.",
      "whyItMatters": "Even healthchecks' generous free tier caps out at 20 jobs, while Uptime Kuma has no usage-based cost ceiling since it's self-hosted.",
      "benefitsWho": "Teams monitoring more than 20 jobs or services on a budget benefit from Uptime Kuma's unlimited free self-hosted model."
    },
    {
      "title": "Alerting Channels",
      "toolA": "healthchecks offers Telegram, Pushover, Mattermost, Rocket.Chat, PagerDuty, and Google Chat on all tiers, with SMS, WhatsApp, and phone call alerting reserved for paid tiers.",
      "toolB": "Uptime Kuma supports 90+ notification integrations including Telegram, Discord, Slack, email (SMTP), Pushover, and Gotify, all included at no cost since the tool itself is free.",
      "whyItMatters": "The number and cost-gating of alert channels affects how quickly teams can be reached during an incident.",
      "benefitsWho": "Teams wanting phone/SMS alerts without extra hosting work benefit from healthchecks' paid tiers; teams wanting the widest integration list at zero cost benefit from Uptime Kuma."
    },
    {
      "title": "Status Pages",
      "toolA": "healthchecks' feature list does not mention public status pages.",
      "toolB": "Uptime Kuma provides multiple public status pages with custom domain mapping.",
      "whyItMatters": "Public status pages let a team communicate incidents transparently to users.",
      "benefitsWho": "Teams wanting to publish uptime status externally benefit from Uptime Kuma's built-in status pages."
    }
  ],
  "featureMatrix": [
    {
      "group": "Monitoring Capabilities",
      "rows": [
        {
          "feature": "Cron/scheduled job monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-protocol monitoring (HTTP/TCP/DNS/etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Docker container monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Check interval speed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "20-second intervals"
        },
        {
          "feature": "SSL/certificate expiry tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Alerting & Notifications",
      "rows": [
        {
          "feature": "Chat app notifications",
          "toolA": "available",
          "toolB": "available",
          "note": "healthchecks: Telegram, Pushover, Mattermost, Rocket.Chat, Google Chat; Uptime Kuma: 90+ integrations incl. Telegram, Discord, Slack"
        },
        {
          "feature": "SMS/WhatsApp/phone call alerts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "healthchecks paid tiers only"
        },
        {
          "feature": "PagerDuty integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Public status pages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Custom domain mapping"
        }
      ]
    },
    {
      "group": "Cost & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "healthchecks: Hobbyist, 20 jobs; Uptime Kuma: entirely free/open source"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "healthchecks is a hosted SaaS"
        },
        {
          "feature": "Open-source license",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MIT license"
        },
        {
          "feature": "Managed/hosted cloud version",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Healthchecks.io have a free tier?",
      "answer": "Yes, the Hobbyist plan is free for up to 20 monitored jobs."
    },
    {
      "question": "Is Uptime Kuma free?",
      "answer": "Yes, Uptime Kuma is free and open source under the MIT license."
    },
    {
      "question": "Do I need to self-host Uptime Kuma?",
      "answer": "Yes, Uptime Kuma is a self-hosted tool, deployable via Docker Compose, Docker CLI, or a non-Docker install on Linux or Windows 10+."
    },
    {
      "question": "What protocols can Uptime Kuma monitor?",
      "answer": "It can monitor HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers."
    },
    {
      "question": "Does healthchecks support SMS alerts?",
      "answer": "Yes, but only on paid tiers; the free tier is email/chat only, while paid plans add SMS, WhatsApp, and phone call alerting."
    },
    {
      "question": "How many notification services does Uptime Kuma support?",
      "answer": "Uptime Kuma supports 90+ notification services including Telegram, Discord, Slack, email, Pushover, and Gotify."
    }
  ]
};

export default healthchecksVsUptimeKumaContent;
