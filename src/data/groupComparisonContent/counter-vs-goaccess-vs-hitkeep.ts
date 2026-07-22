import type { GroupComparisonContent } from './types';

const counterVsGoaccessVsHitkeepContent: GroupComparisonContent = {
  "verdict": "Counter, GoAccess, and HitKeep are all free, self-hostable alternatives to Google Analytics that avoid third-party data sharing, but they take different technical approaches and reach different depths of functionality. GoAccess stands apart by needing no tracking script at all, since it parses server logs you already have. Counter and HitKeep both use a lightweight client-side script instead, with Counter staying intentionally minimal and HitKeep extending into funnels, ecommerce tracking, and multi-client agency reporting. None of the three is objectively best; the right choice depends on whether you have server log access, want the simplest possible visitor count, or need fuller product-analytics features.",
  "bestFor": {
    "counter": "Bloggers and indie developers who want the simplest possible free, no-cookie visitor counter with a tiny script and an optional self-hosted Docker deployment",
    "goaccess": "System administrators and DevOps teams who want zero-script, real-time traffic analysis parsed directly from existing Apache, Nginx, S3, or CloudFront logs",
    "hitkeep": "Agencies and businesses that need fuller privacy-first analytics, including funnels, ecommerce tracking, AI-crawler detection, and multi-client reporting, with both free self-hosting and paid cloud tiers"
  },
  "highlights": [
    {
      "title": "GoAccess needs no tracking script at all",
      "description": "Unlike Counter and HitKeep, which both rely on a lightweight JavaScript snippet, GoAccess parses server logs you already generate, sending no data to any third party and requiring no client-side script to install or maintain.",
      "toolSlugs": [
        "goaccess"
      ]
    },
    {
      "title": "HitKeep goes beyond basic pageview counting",
      "description": "HitKeep adds funnels, ecommerce transaction revenue, AI-crawler and bot detection, and multi-client reporting for up to 50 sites on its Business tier, a materially deeper feature set than Counter's or GoAccess's intentionally narrow scope.",
      "toolSlugs": [
        "hitkeep"
      ]
    },
    {
      "title": "Free self-hosting across all three",
      "description": "Counter, GoAccess, and HitKeep can all be run at no cost on infrastructure the operator controls, though GoAccess has no official hosted SaaS option at all, while Counter and HitKeep also offer optional hosted cloud plans.",
      "toolSlugs": [
        "counter",
        "goaccess",
        "hitkeep"
      ]
    },
    {
      "title": "Deliberately minimal footprints",
      "description": "Counter's tracking script is roughly 1.1 KB and its dashboard covers only unique visitors, referrers, and country data, mirroring GoAccess's philosophy of staying lightweight rather than becoming a full product-analytics suite.",
      "toolSlugs": [
        "counter",
        "goaccess"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking Approach",
      "rows": [
        {
          "feature": "Requires a client-side JavaScript tracking script",
          "statuses": {
            "counter": "available",
            "goaccess": "unavailable",
            "hitkeep": "available"
          },
          "note": "GoAccess instead parses existing server log files and needs no script installed on the site."
        },
        {
          "feature": "Cookie-free, no personal-data collection by design",
          "statuses": {
            "counter": "available",
            "goaccess": "available",
            "hitkeep": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment Options",
      "rows": [
        {
          "feature": "Free hosted or cloud option (no self-hosting required)",
          "statuses": {
            "counter": "available",
            "goaccess": "unavailable",
            "hitkeep": "available"
          },
          "note": "GoAccess has no official hosted SaaS product; it is designed to be run on infrastructure you already control."
        },
        {
          "feature": "Free self-hosting option",
          "statuses": {
            "counter": "available",
            "goaccess": "available",
            "hitkeep": "available"
          }
        }
      ]
    },
    {
      "group": "Analytics Depth",
      "rows": [
        {
          "feature": "Real-time, live-updating dashboard",
          "statuses": {
            "counter": "not-documented",
            "goaccess": "available",
            "hitkeep": "not-documented"
          }
        },
        {
          "feature": "Funnel or ecommerce revenue tracking",
          "statuses": {
            "counter": "unavailable",
            "goaccess": "unavailable",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Multi-site or multi-client agency reporting",
          "statuses": {
            "counter": "not-documented",
            "goaccess": "not-documented",
            "hitkeep": "available"
          }
        }
      ]
    },
    {
      "group": "Openness",
      "rows": [
        {
          "feature": "Fully open-source codebase",
          "statuses": {
            "counter": "available",
            "goaccess": "available",
            "hitkeep": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does GoAccess require adding a tracking script to my website?",
      "answer": "No. GoAccess works entirely differently from Counter and HitKeep -- it parses access logs your web server already produces, whether from Apache, Nginx, Amazon S3, or CloudFront, so there is no client-side script to install at all."
    },
    {
      "question": "Which of the three is easiest for a non-technical blogger to set up?",
      "answer": "Counter and HitKeep's hosted cloud plan are both simpler for non-technical users since they only require adding a small script tag; GoAccess assumes shell or server access to log files and a terminal-comfortable operator."
    },
    {
      "question": "Which tool supports ecommerce and funnel tracking?",
      "answer": "HitKeep is the only one of the three with documented funnel and ecommerce transaction revenue tracking; Counter and GoAccess are scoped to simpler traffic counting rather than conversion or revenue analytics."
    },
    {
      "question": "Can I self-host all three of these for free?",
      "answer": "Yes. Counter offers a Docker-based self-hosted repository, GoAccess is inherently self-hosted open-source software with no company or paid tier at all, and HitKeep's self-hosted binary is free forever with no feature restrictions."
    },
    {
      "question": "Which is best for an agency managing analytics across many client sites?",
      "answer": "HitKeep is purpose-built for this, with multi-client reporting supporting up to 50 sites and 20 team members on its Business cloud tier; Counter and GoAccess do not document dedicated multi-client reporting features."
    },
    {
      "question": "Do any of these require a cookie consent banner?",
      "answer": "None of them are designed to require one. Counter and HitKeep avoid cookies and personal identifiers by design, and GoAccess collects no visitor-side tracking data at all since it only analyzes server logs after the fact."
    }
  ]
};

export default counterVsGoaccessVsHitkeepContent;
