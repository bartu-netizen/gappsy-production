import type { ToolComparisonContent } from './types';

const hetrixtoolsVsUptimeKumaContent: ToolComparisonContent = {
  "verdict": "HetrixTools is a hosted SaaS that bundles uptime checks, server agent monitoring, and IP/domain blacklist reputation tracking without any infrastructure to maintain, while Uptime Kuma is a free, open-source, self-hosted tool built for multi-protocol monitoring with a huge library of community-built notification integrations. The choice largely comes down to whether you want a managed service with blacklist/reputation monitoring bundled in, or full control via self-hosting with no recurring SaaS cost.",
  "bestForToolA": "Hosting providers and site owners who want blacklist/IP reputation monitoring, a server metrics agent, and SSL/domain expiration alerts without hosting any monitoring infrastructure themselves, using the free-forever tier's 15 uptime monitors and 32 blacklist monitors.",
  "bestForToolB": "Teams comfortable self-hosting via Docker Compose or Node.js 20.4+ who want unlimited, fully free monitoring across HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers, with access to 90+ notification integrations.",
  "whoNeedsBoth": "A hosting provider could run Uptime Kuma internally for granular protocol-level monitoring of its own infrastructure, such as Docker containers and internal services, while using HetrixTools' blacklist and IP reputation monitoring to track how its customer-facing IPs and domains are viewed externally on major blacklists, a capability Uptime Kuma doesn't offer.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "HetrixTools is a SaaS platform accessed via web dashboard with no server to install or maintain.",
      "toolB": "Uptime Kuma is self-hosted only, deployed via Docker Compose, Docker CLI, or a non-Docker install requiring Node.js 20.4+ on Linux or Windows 10+.",
      "whyItMatters": "Self-hosting gives full data control but adds setup and maintenance work, while SaaS trades control for convenience.",
      "benefitsWho": "Teams without spare infrastructure or DevOps time benefit from HetrixTools; teams wanting full data ownership benefit from Uptime Kuma."
    },
    {
      "title": "Monitoring Scope Beyond Uptime",
      "toolA": "HetrixTools combines uptime checks with a server metrics agent (Linux, Windows, macOS, shared hosting) and IP/domain blacklist reputation monitoring, including Microsoft SNDS.",
      "toolB": "Uptime Kuma focuses on multi-protocol uptime monitoring, HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers, without a server metrics agent or blacklist monitoring.",
      "whyItMatters": "Hosting providers care about domain/IP reputation and server health, not just whether a service responds.",
      "benefitsWho": "Hosting companies and email-sending domains that need blacklist visibility benefit most from HetrixTools' broader scope."
    },
    {
      "title": "Free Tier Limits",
      "toolA": "HetrixTools' free-forever tier is capped at 15 uptime monitors and 32 blacklist monitors.",
      "toolB": "Uptime Kuma is fully free and open source under the MIT license with no monitor caps, limited only by the resources of the server it's self-hosted on.",
      "whyItMatters": "Teams monitoring more than a handful of endpoints will hit HetrixTools' free-tier ceiling faster than Uptime Kuma's self-hosted limits.",
      "benefitsWho": "Larger environments monitoring dozens of endpoints benefit from Uptime Kuma's uncapped self-hosted model."
    },
    {
      "title": "Notification Integrations",
      "toolA": "HetrixTools supports email, SMS, phone calls, Telegram, Slack, Discord, Microsoft Teams, PagerDuty, Opsgenie, Zenduty, and webhooks.",
      "toolB": "Uptime Kuma documents 90+ notification services including Telegram, Discord, Slack, email (SMTP), Pushover, and Gotify.",
      "whyItMatters": "Alert routing needs vary by team; SMS/phone call escalation and named incident-management tools like PagerDuty matter for on-call teams.",
      "benefitsWho": "On-call ops teams needing SMS/phone escalation and PagerDuty/Opsgenie benefit from HetrixTools; teams wanting the widest raw integration count benefit from Uptime Kuma."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "HetrixTools' paid plan pricing beyond the free tier is not publicly documented on its marketing site.",
      "toolB": "Uptime Kuma is free forever with no paid tier at all; the only cost is self-hosting infrastructure.",
      "whyItMatters": "Buyers can't compare HetrixTools' paid pricing upfront, while Uptime Kuma's total cost is just server/hosting expenses.",
      "benefitsWho": "Budget-conscious teams that want fully predictable costs benefit from Uptime Kuma's no-paid-tier model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Monitoring Coverage",
      "rows": [
        {
          "feature": "Uptime/HTTP(s) monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Server resource metrics agent",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "HetrixTools supports Linux, Windows, macOS, and shared hosting agents"
        },
        {
          "feature": "IP/domain blacklist reputation monitoring",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Includes Microsoft SNDS"
        },
        {
          "feature": "Docker container monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Gaming server monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSL certificate & domain expiration alerts",
          "toolA": "available",
          "toolB": "limited",
          "note": "Uptime Kuma tracks TLS certificate expiry but not domain/nameserver expiration"
        }
      ]
    },
    {
      "group": "Alerting & Status Pages",
      "rows": [
        {
          "feature": "Public status pages",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "White-labeled status pages",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Notification channel breadth",
          "toolA": "available",
          "toolB": "available",
          "note": "HetrixTools: named list incl. SMS/phone; Uptime Kuma: 90+ integrations"
        },
        {
          "feature": "PagerDuty / Opsgenie integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Managed SaaS hosting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Docker Compose, Docker CLI, or Node.js 20.4+"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "HetrixTools: 15 uptime + 32 blacklist monitors; Uptime Kuma: unlimited, fully free"
        },
        {
          "feature": "Open-source codebase",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "MIT license, 89.2k+ GitHub stars"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is HetrixTools or Uptime Kuma free?",
      "answer": "Both have free options. HetrixTools offers a free-forever tier with 15 uptime monitors and 32 blacklist monitors. Uptime Kuma is entirely free and open source under the MIT license, with the only cost being the server you self-host it on."
    },
    {
      "question": "Does Uptime Kuma monitor blacklists or IP reputation like HetrixTools?",
      "answer": "No, Uptime Kuma's documented features cover multi-protocol uptime monitoring (HTTP, TCP, WebSocket, ping, DNS, Docker, gaming servers) but not blacklist or IP reputation tracking, which is a core HetrixTools feature."
    },
    {
      "question": "Do I need to host my own server to use Uptime Kuma?",
      "answer": "Yes. Uptime Kuma is self-hosted only, deployable via Docker Compose, Docker CLI, or a non-Docker install requiring Node.js 20.4+ on Linux or Windows 10+. There's no managed cloud version."
    },
    {
      "question": "Which tool has more notification integrations?",
      "answer": "Uptime Kuma documents 90+ notification integrations, while HetrixTools lists a more curated set including SMS, phone calls, and dedicated incident-management tools like PagerDuty, Opsgenie, and Zenduty."
    },
    {
      "question": "Can HetrixTools monitor server resource usage like CPU and RAM?",
      "answer": "Yes, HetrixTools includes a server metrics monitoring agent that supports Linux, Windows, macOS, and shared hosting environments. This is not a documented Uptime Kuma feature."
    },
    {
      "question": "Which is easier to get started with if I don't want to manage infrastructure?",
      "answer": "HetrixTools, since it's a SaaS platform with no server to install. Uptime Kuma requires you to run and maintain your own instance via Docker or Node.js."
    }
  ]
};

export default hetrixtoolsVsUptimeKumaContent;
