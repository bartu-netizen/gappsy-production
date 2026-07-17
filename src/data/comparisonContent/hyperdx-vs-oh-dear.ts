import type { ToolComparisonContent } from './types';

const hyperdxVsOhDearContent: ToolComparisonContent = {
  "verdict": "HyperDX and Oh Dear both fall under the broad umbrella of monitoring, but they watch very different things: HyperDX is a full-stack observability platform unifying logs, traces, metrics, errors, and session replay for engineering teams debugging their own applications, while Oh Dear is an external website health monitor covering uptime, SSL, DNS, broken links, cron jobs, and performance for site owners and agencies. Neither is a substitute for the other, and the right choice depends on whether you're instrumenting your application internally or watching your website from the outside.",
  "bestForToolA": "Engineering teams needing unified logs, traces, metrics, and session replay for their own applications, especially those instrumenting with OpenTelemetry and wanting a ClickHouse-backed, usage-priced observability stack.",
  "bestForToolB": "Agencies and site owners who need external uptime, SSL, DNS, cron, and performance monitoring with client-facing branded status pages and every feature included on every plan.",
  "whoNeedsBoth": "A development agency could use Oh Dear to monitor uptime, SSL, and cron health across client websites for branded status-page reporting, while using HyperDX internally to trace and debug errors within their own application backends — complementary tools addressing different monitoring layers.",
  "keyDifferences": [
    {
      "title": "Monitoring Scope",
      "toolA": "HyperDX provides full-stack observability covering logs, traces, metrics, errors, and correlated session replay via OpenTelemetry instrumentation.",
      "toolB": "Oh Dear provides external website health checks — uptime, SSL certificate monitoring, DNS/domain expiration, broken link and mixed content scanning, cron job monitoring, and Lighthouse-based performance monitoring.",
      "whyItMatters": "This determines whether you need deep in-app telemetry (HyperDX) or black-box external website monitoring (Oh Dear).",
      "benefitsWho": "Engineering teams debugging application behavior need HyperDX; agencies and site owners monitoring uptime and SSL need Oh Dear."
    },
    {
      "title": "Pricing Structure",
      "toolA": "HyperDX is usage-based on storage volume, with a free 3GB/month tier and a $20/month Starter plan (50GB, unlimited users, $0.40/GB overage).",
      "toolB": "Oh Dear has no permanent free tier (only a 10-day trial) and prices by number of monitored sites, from €13/month (Mini, 5 sites) up to €201/month (Premium, 200 sites), with every feature included at every tier.",
      "whyItMatters": "HyperDX cost scales with data volume while Oh Dear cost scales with number of sites/servers monitored — different budgeting models.",
      "benefitsWho": "High-traffic engineering teams benefit from HyperDX's per-GB model; agencies managing many small client sites benefit from Oh Dear's per-site tiers with all features included at every level."
    },
    {
      "title": "Client/Agency Reporting Features",
      "toolA": "No client-facing status page or agency reporting feature is documented for HyperDX.",
      "toolB": "Oh Dear offers branded client status pages with automated monthly reporting, explicitly suited to agencies.",
      "whyItMatters": "Agencies managing multiple client websites need white-labeled reporting, which is a named Oh Dear feature.",
      "benefitsWho": "Web agencies and freelance developers managing many client sites."
    },
    {
      "title": "Session Replay & Distributed Tracing",
      "toolA": "HyperDX offers correlated session replay linking user recordings with backend logs/traces, plus end-to-end tracing across browser or mobile apps through backend services.",
      "toolB": "No session replay or distributed tracing feature is documented for Oh Dear.",
      "whyItMatters": "Debugging user-reported bugs benefits from correlated replay and traces, a capability specific to application observability tools.",
      "benefitsWho": "Product engineering teams triaging bugs reported by real users."
    },
    {
      "title": "Compliance & Hosting Region",
      "toolA": "HyperDX is SOC 2 Type II certified, with SAML SSO available on the custom-priced Enterprise plan.",
      "toolB": "Oh Dear is EU-hosted with GDPR-friendly terms and a Data Processing Agreement (DPA) available; SOC 2 is not mentioned.",
      "whyItMatters": "Compliance requirements differ by region and industry — SOC 2 matters for US enterprise buyers, while EU hosting and a DPA matter for GDPR-sensitive customers.",
      "benefitsWho": "US enterprise engineering orgs favor HyperDX's SOC 2 certification; EU-based businesses favor Oh Dear's EU hosting and DPA."
    }
  ],
  "featureMatrix": [
    {
      "group": "Monitoring Coverage",
      "rows": [
        {
          "feature": "Uptime monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Multi-location checks as often as every minute"
        },
        {
          "feature": "SSL certificate monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Application logs/traces/metrics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cron/scheduled job monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "HyperDX: 3GB/month, 3-day retention; Oh Dear: trial only"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "HyperDX $20/month Starter; Oh Dear €13/month Mini"
        },
        {
          "feature": "All features included on every plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "HyperDX reserves SAML SSO for custom Enterprise"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Oh Dear: 10 days, no credit card required"
        }
      ]
    },
    {
      "group": "Compliance & Support",
      "rows": [
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "HyperDX: SOC 2 Type II"
        },
        {
          "feature": "EU hosting / GDPR DPA",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Oh Dear: 30-day"
        },
        {
          "feature": "Client-facing branded status pages",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does HyperDX have a free plan?",
      "answer": "Yes, 3GB/month storage with 3-day retention and up to 1 user, with no credit card required."
    },
    {
      "question": "Does Oh Dear have a free plan?",
      "answer": "No permanent free tier, but Oh Dear offers a 10-day free trial with no credit card required."
    },
    {
      "question": "How is HyperDX priced compared to Oh Dear?",
      "answer": "HyperDX charges by storage volume ($20/month Starter for 50GB, then $0.40/GB overage), while Oh Dear charges by number of monitored sites, from €13/month for 5 sites up to €201/month for 200 sites, with all monitoring features included at every tier."
    },
    {
      "question": "Which tool does session replay and distributed tracing?",
      "answer": "HyperDX, via its Correlated Session Replay and End-to-End Tracing features; Oh Dear does not document session replay or tracing."
    },
    {
      "question": "Which tool is better for agencies managing many client websites?",
      "answer": "Oh Dear, since it includes branded client status pages with automated monthly reporting and every feature on every plan."
    },
    {
      "question": "Is either tool open source?",
      "answer": "HyperDX is open source with an active GitHub community; Oh Dear's open-source status isn't documented in the facts — it's offered as a paid SaaS with a free trial."
    }
  ]
};

export default hyperdxVsOhDearContent;
