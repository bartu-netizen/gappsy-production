import type { ToolComparisonContent } from './types';

const instatusVsPulseticContent: ToolComparisonContent = {
  "verdict": "Instatus centers on incident collaboration and status-page communication, with a free-forever Starter plan and on-call management, but its Pro and Business plan prices are not published. Pulsetic publishes a full price ladder starting at $9/month with 15 global check locations even on entry plans and a wide set of monitor types, but doesn't document on-call role management. The better fit depends on whether transparent pricing or built-in on-call/incident collaboration matters more.",
  "bestForToolA": "Teams that need incident collaboration tools (Slack/Microsoft Teams integration, on-call roles) and SAML SSO on the Business tier, and are comfortable requesting a quote for mid-tier pricing.",
  "bestForToolB": "Teams that want fully published pricing at every tier, a wide range of monitor types (HTTP, SSL, ping, port, TCP, keyword, cron, API, domain expiration) in one plan, and 15 global check locations from the entry paid tier.",
  "whoNeedsBoth": "Teams that need Instatus's on-call and incident-collaboration workflow for internal response may still add Pulsetic-style broad monitor-type coverage (domain expiration, keyword checks) if their monitoring needs extend beyond what Instatus documents.",
  "keyDifferences": [
    {
      "title": "Published pricing",
      "toolA": "Pro and Business plan prices are not published (listed as null); only Starter ($0) and Enterprise (custom) prices are given.",
      "toolB": "Every tier has a published price: Free $0, Solo $9/month, Team $19/month, Organization $49/month.",
      "whyItMatters": "Published pricing lets teams budget and compare costs without a sales conversation.",
      "benefitsWho": "Self-serve buyers and small teams that want to evaluate cost upfront."
    },
    {
      "title": "Monitor type breadth",
      "toolA": "Documented as general 'service monitoring' without a specific list of monitor types.",
      "toolB": "Explicitly supports HTTP/HTTPS, SSL, ping, port, TCP, keyword, cron job, API, and domain expiration monitoring.",
      "whyItMatters": "A documented range of monitor types signals coverage for varied infrastructure (not just web endpoints).",
      "benefitsWho": "Teams monitoring diverse infrastructure like domains, ports, and scheduled jobs, not just websites."
    },
    {
      "title": "Global check locations",
      "toolA": "Not documented in the facts reviewed.",
      "toolB": "15 global data centers, with location count scaling by plan (3 regions on Free up to 15 on Team/Organization).",
      "whyItMatters": "More check locations help confirm whether downtime is a regional network issue or a genuine outage.",
      "benefitsWho": "Teams serving a geographically distributed audience."
    },
    {
      "title": "On-call and incident collaboration",
      "toolA": "Includes on-call member roles from the Starter plan upward, plus incident collaboration tools integrated with Slack and Microsoft Teams.",
      "toolB": "Not documented in the facts reviewed.",
      "whyItMatters": "Built-in on-call roles streamline incident response without needing a separate on-call tool.",
      "benefitsWho": "Teams that run a formal on-call rotation for incident response."
    },
    {
      "title": "SSO support",
      "toolA": "SAML SSO is included on the Business plan; multiple SSO connections are available on Enterprise.",
      "toolB": "Not documented in the facts reviewed.",
      "whyItMatters": "SSO is often a hard requirement for enterprise IT security policy compliance.",
      "benefitsWho": "Enterprise buyers with centralized identity management requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring",
      "rows": [
        {
          "feature": "Service/uptime monitoring",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Documented monitor type list",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pulsetic: HTTP, SSL, ping, port, TCP, keyword, cron, API, domain expiration."
        },
        {
          "feature": "Global check locations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 15 data centers."
        },
        {
          "feature": "Real user monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RUM page views included in plans."
        }
      ]
    },
    {
      "group": "Status Pages & Alerts",
      "rows": [
        {
          "feature": "Public status pages",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Password-protected status pages",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SMS / call alerts",
          "toolA": "available",
          "toolB": "available",
          "note": "Instatus: Pro plan and above. Pulsetic: Solo tier and above."
        },
        {
          "feature": "On-call member roles",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free forever plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published pricing for all tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Instatus Pro/Business prices not published."
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Instatus: Business plan."
        },
        {
          "feature": "White-labeled status pages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pulsetic: Organization plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Instatus free?",
      "answer": "Yes, the Starter plan is free forever with 15 monitors and a public status page."
    },
    {
      "question": "Is Pulsetic free?",
      "answer": "Yes, the Free plan includes 10 monitors/heartbeats/domains with unlimited email alerts."
    },
    {
      "question": "Which one publishes pricing for all its plans?",
      "answer": "Pulsetic publishes a price for every tier (Free, Solo $9/month, Team $19/month, Organization $49/month). Instatus publishes prices only for Starter (free) and lists Pro and Business as custom/unpublished."
    },
    {
      "question": "How many check locations does each offer?",
      "answer": "Pulsetic checks from up to 15 global data centers depending on plan. Instatus does not document a specific number of check locations."
    },
    {
      "question": "Does Instatus support SSO?",
      "answer": "Yes, SAML SSO is included on the Business plan, and multiple SSO connections are available on Enterprise."
    },
    {
      "question": "Can I use a custom domain for my status page?",
      "answer": "For Instatus, custom domains are available starting on the Pro plan. Pulsetic's facts do not document custom domain support specifically."
    }
  ]
};

export default instatusVsPulseticContent;
