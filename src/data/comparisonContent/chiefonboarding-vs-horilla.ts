import type { ToolComparisonContent } from './types';

const chiefonboardingVsHorillaContent: ToolComparisonContent = {
  "verdict": "chiefonboarding is a narrowly focused tool built specifically for onboarding new hires directly through Slack, with straightforward public pricing instead of a sales-contact gate. Horilla is a full open-source HRMS bundling nine modules, including recruitment and onboarding alongside attendance, payroll, leave, performance, asset tracking, and a helpdesk, available free to self-host or as paid cloud hosting at $7/user/month. The two overlap only at the onboarding step; Horilla covers the entire employee lifecycle where chiefonboarding covers one slice of it.",
  "bestForToolA": "Small teams that already live in Slack and want a lightweight, dedicated tool purely for structuring and running new-hire onboarding, without adopting a broader HR system.",
  "bestForToolB": "Companies wanting a single open-source HRMS that bundles onboarding with attendance, payroll, leave management, performance reviews, and asset tracking, self-hostable for free under LGPL-2.1 or via Docker one-click install.",
  "whoNeedsBoth": "Realistically this pairing has little scenario for combined use: Horilla's own Recruitment & Onboarding module already covers structured onboarding workflows, so a team adopting Horilla would likely replace chiefonboarding rather than run both, or start with chiefonboarding's lightweight Slack-based flow and migrate to Horilla once broader HR needs (payroll, attendance, performance) emerge.",
  "keyDifferences": [
    {
      "title": "Scope of HR Coverage",
      "toolA": "chiefonboarding's documented feature set is limited to Slack-based onboarding and public pricing; no other HR functions are documented.",
      "toolB": "Horilla bundles nine modules together: employee database, attendance tracking, payroll, leave management, recruitment & onboarding, performance management, asset tracking, and helpdesk.",
      "whyItMatters": "A team choosing between the two needs to know whether it's picking a single-purpose onboarding tool or a full HR system of record.",
      "benefitsWho": "Small teams only need onboarding benefit from chiefonboarding's focus; growing companies needing payroll and attendance benefit from Horilla's breadth."
    },
    {
      "title": "Slack-Native Workflow",
      "toolA": "chiefonboarding's core feature is onboarding new hires directly through Slack.",
      "toolB": "Horilla does not document a Slack-based onboarding workflow; its onboarding is part of the broader Recruitment & Onboarding module inside its own interface.",
      "whyItMatters": "Teams that manage most operations inside Slack may prefer a tool that meets them there rather than requiring a separate HR portal.",
      "benefitsWho": "Slack-centric remote or distributed teams."
    },
    {
      "title": "Self-Hosting & Open Source",
      "toolA": "chiefonboarding's hosting model and licensing are not documented beyond its pricing_model being 'Paid'.",
      "toolB": "Horilla's self-hosted edition is free forever, released under LGPL-2.1 with source on GitHub, and supports Docker one-click installation.",
      "whyItMatters": "Open-source, self-hosted licensing affects data ownership, customization rights, and long-term cost.",
      "benefitsWho": "Technical teams that want to self-host and control their HR data, and open-source-first organizations."
    },
    {
      "title": "Payroll & Attendance",
      "toolA": "chiefonboarding does not document payroll or attendance tracking features.",
      "toolB": "Horilla includes built-in payroll processing integrated with attendance and leave data, plus mobile check-in support for attendance.",
      "whyItMatters": "Payroll and attendance are core, ongoing HR operations well beyond the one-time onboarding event.",
      "benefitsWho": "Companies wanting to consolidate payroll and time tracking into the same system as onboarding."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "chiefonboarding's own stated feature is 'public pricing,' explicitly published rather than gated behind a sales contact, though exact plan prices are not documented in available data.",
      "toolB": "Horilla publishes exact pricing: Self-Hosted is free, Cloud is $7/user/month with a 30-day free trial, and Enterprise is custom/quote-only.",
      "whyItMatters": "Transparent pricing lets buyers evaluate cost without a sales call.",
      "benefitsWho": "Self-serve buyers and small teams comparing costs directly."
    }
  ],
  "featureMatrix": [
    {
      "group": "Onboarding Features",
      "rows": [
        {
          "feature": "Slack-based onboarding",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Applicant tracking / recruitment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Structured onboarding workflows",
          "toolA": "available",
          "toolB": "available",
          "note": "Horilla: part of Recruitment & Onboarding module"
        }
      ]
    },
    {
      "group": "HR Module Breadth",
      "rows": [
        {
          "feature": "Payroll processing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Attendance tracking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Includes mobile check-in"
        },
        {
          "feature": "Leave management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Performance management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Asset tracking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "HR helpdesk/ticketing",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free self-hosted option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Horilla: free forever, LGPL-2.1"
        },
        {
          "feature": "Docker one-click install",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published transparent pricing",
          "toolA": "limited",
          "toolB": "available",
          "note": "chiefonboarding: pricing is public per its own feature list, but exact figures not documented here; Horilla: $7/user/month Cloud"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Horilla: 30-day free trial on Cloud"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does chiefonboarding include payroll or attendance tracking?",
      "answer": "This is not documented as part of chiefonboarding's feature set, which is focused specifically on Slack-based new-hire onboarding. Horilla, by contrast, includes built-in payroll processing integrated with attendance and leave data."
    },
    {
      "question": "Can Horilla be self-hosted for free?",
      "answer": "Yes, Horilla's self-hosted edition is free forever and released under the LGPL-2.1 open-source license, with Docker one-click installation available."
    },
    {
      "question": "Is chiefonboarding Slack-native?",
      "answer": "Yes, its core documented feature is onboarding new hires directly through Slack."
    },
    {
      "question": "Which tool covers more of the employee lifecycle?",
      "answer": "Horilla, which bundles nine HR modules covering the employee database, attendance, payroll, leave, recruitment and onboarding, performance, asset tracking, and a helpdesk. chiefonboarding's documented scope is limited to onboarding."
    },
    {
      "question": "How does pricing compare?",
      "answer": "chiefonboarding publishes straightforward pricing rather than gating it behind a sales contact, though exact figures aren't documented here. Horilla publishes exact pricing: free self-hosted, $7/user/month for Cloud with a 30-day free trial, and custom pricing for Enterprise."
    },
    {
      "question": "Would a growing company outgrow chiefonboarding?",
      "answer": "Likely, since chiefonboarding's documented functionality is limited to onboarding. Companies that later need payroll, attendance, leave, or performance management would need a broader system like Horilla."
    }
  ]
};

export default chiefonboardingVsHorillaContent;
