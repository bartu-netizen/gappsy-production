import type { ToolComparisonContent } from './types';

const activepiecesVsStatuscakeContent: ToolComparisonContent = {
  "verdict": "activepieces and StatusCake serve different jobs. Built as an open-source platform for workflow and process automation, activepieces connects apps and builds automated processes spanning HR, finance, marketing, and sales; it prices execution at $0 per run, with its Standard tier costing $5 per active flow each month. StatusCake, founded in 2012 and serving over 220,000 customers, is external monitoring software for uptime, SSL certificates, domains, page speed, and servers, with a permanent free plan and paid tiers starting at €16.66/month. They aren't substitutes for each other -- one automates work, the other watches infrastructure.",
  "bestForToolA": "Teams wanting to build automated workflows across HR, finance, marketing, and sales tools, especially those who want self-hosting flexibility and usage-based pricing that doesn't punish high execution volume.",
  "bestForToolB": "Teams needing external monitoring of uptime, SSL certificates, domains, and page speed, starting from a permanent free plan with 10 monitors.",
  "whoNeedsBoth": "A DevOps or IT team could plausibly use both together -- StatusCake to monitor uptime, SSL, and page speed and trigger alerts, with an activepieces workflow (via its integration \"pieces\" like Gmail) automating what happens next, such as routing incident alerts to the right team -- though the facts don't document a direct StatusCake-activepieces integration.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "activepieces is a workflow/process automation platform for connecting apps and automating tasks across departments like HR, finance, marketing, and sales.",
      "toolB": "StatusCake is external monitoring software covering uptime, SSL certificates, domains, page speed, and servers.",
      "whyItMatters": "These solve entirely different problems -- automating processes versus watching infrastructure health.",
      "benefitsWho": "Operations teams automating workflows versus IT/DevOps teams monitoring site and server reliability."
    },
    {
      "title": "Pricing Model",
      "toolA": "activepieces charges $5 per active flow per month on its Standard plan, with $0 per execution, meaning a flow can run millions of times at the same cost; the Ultimate plan is custom, annual-contract pricing.",
      "toolB": "StatusCake uses fixed monitor-count tiers: Free at €0/month (10 monitors), Superior at €16.66/month annual, Business at €58.33/month annual, and a custom Enterprise tier.",
      "whyItMatters": "Usage-based pricing (per flow) scales differently than monitor-count-based pricing, affecting cost predictability as usage grows.",
      "benefitsWho": "Teams running high-volume automated processes (activepieces) versus teams needing to monitor a specific, growing number of sites/servers (StatusCake)."
    },
    {
      "title": "Deployment",
      "toolA": "activepieces explicitly supports both self-hosted and cloud deployment, and is open source.",
      "toolB": "No self-hosting or open-source option is documented for StatusCake; it operates as a SaaS monitoring service.",
      "whyItMatters": "Self-hosting affects data control and infrastructure ownership, which matters for compliance-sensitive automation workflows.",
      "benefitsWho": "Organizations needing to keep automation infrastructure on their own servers."
    },
    {
      "title": "Free Tier",
      "toolA": "No permanent free plan is documented for activepieces; its cheapest published tier is Standard at $5/active flow/month.",
      "toolB": "StatusCake's permanent free tier includes 10 uptime monitors checked every 5 minutes, along with a single page speed monitor, a single domain monitor, and a single SSL monitor.",
      "whyItMatters": "A permanent free tier lets small teams monitor a handful of sites indefinitely at no cost.",
      "benefitsWho": "Small sites or solo developers wanting basic monitoring without a subscription."
    },
    {
      "title": "Enterprise/Scale Features",
      "toolA": "activepieces' Ultimate plan adds enterprise governance controls for larger organizations, billed as a custom annual contract.",
      "toolB": "StatusCake's Business and Enterprise tiers add team tools, up to 300+ monitors, 30-second check intervals, dedicated locations, and service-level agreements.",
      "whyItMatters": "Enterprise tiers reveal what each platform considers 'scale' -- governance for automation versus monitor volume and check frequency.",
      "benefitsWho": "Larger organizations evaluating which platform's enterprise tier matches their operational needs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Workflow/process automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Prebuilt app integrations (\"pieces\")",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "e.g. Gmail"
        },
        {
          "feature": "Uptime monitoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SSL / domain / page speed monitoring",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Status pages for incident communication",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "StatusCake Free plan: 10 uptime monitors"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "activepieces: $5/active flow/month, $0 per execution"
        },
        {
          "feature": "Custom enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces Ultimate; StatusCake Enterprise"
        },
        {
          "feature": "Multi-year billing discount",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "StatusCake: up to 40% per its documented pros"
        }
      ]
    },
    {
      "group": "Deployment & Scale",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Check intervals as low as 30 seconds",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "StatusCake Business plan and above"
        },
        {
          "feature": "Enterprise governance/SLA controls",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces Ultimate plan; StatusCake Enterprise plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can activepieces be self-hosted?",
      "answer": "Yes -- activepieces supports both self-hosted and cloud deployment."
    },
    {
      "question": "Does StatusCake have a free plan?",
      "answer": "Yes -- StatusCake's free tier never expires and includes 10 uptime monitors on 5-minute test intervals, plus one page speed monitor, one domain monitor, and one SSL monitor."
    },
    {
      "question": "How is activepieces priced?",
      "answer": "Usage-based per active flow: the Standard plan is $5/active flow/month, and activepieces advertises $0 per execution, meaning a flow can run millions of times without added cost."
    },
    {
      "question": "What does StatusCake monitor?",
      "answer": "Uptime, SSL certificates, domains, page speed, and servers, serving over 220,000 customers including Accenture, Audi, Mastercard, and Netflix."
    },
    {
      "question": "Are activepieces and StatusCake substitutes for each other?",
      "answer": "No -- activepieces is a workflow automation platform for connecting apps and automating processes, while StatusCake is external monitoring software for site and server reliability. They serve different purposes."
    },
    {
      "question": "Does StatusCake offer status pages?",
      "answer": "Yes, StatusCake includes customer-facing status pages for communicating incidents."
    }
  ]
};

export default activepiecesVsStatuscakeContent;
