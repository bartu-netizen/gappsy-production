import type { ToolComparisonContent } from './types';

const krayinCrmVsYetiforceContent: ToolComparisonContent = {
  "verdict": "Krayin CRM is a Laravel-based, sales/marketing/support-focused CRM with an active 23,000+ star GitHub community, named multi-channel communication integrations, and Webkul's official Cloudkul managed hosting; YetiForce is a broader free CRM+ERP suite with 80+ modules spanning finance, HR, and logistics, backed by documented adoption across roughly 23,000 firms in 100 countries but without a first-party managed hosting option in the facts reviewed.",
  "bestForToolA": "Teams wanting a modern, actively maintained (23,000+ GitHub stars) Laravel CRM with built-in VoIP and live chat support, plus an official managed-hosting path via Webkul's Cloudkul service.",
  "bestForToolB": "Organizations wanting one free system that combines CRM with ERP functions like invoicing, finance, and HR across 80+ modules, proven at deployments up to 12,500 users.",
  "whoNeedsBoth": "There's limited realistic overlap since both are general-purpose self-hosted CRMs covering overlapping sales, marketing, and support ground, so a team would typically pick one rather than run both; the realistic use case is evaluating both self-hosted options side by side before committing to one platform.",
  "keyDifferences": [
    {
      "title": "Underlying Framework",
      "toolA": "Krayin CRM is built on Laravel (PHP), maintained by Webkul.",
      "toolB": "YetiForce's underlying framework is not documented in the facts reviewed.",
      "whyItMatters": "Technical teams often prefer to self-host systems built on a framework they already know.",
      "benefitsWho": "PHP/Laravel development teams evaluating a CRM they can extend in-house."
    },
    {
      "title": "CRM vs. Combined CRM+ERP Scope",
      "toolA": "Krayin covers sales management, marketing automation, and customer support in one CRM.",
      "toolB": "YetiForce combines CRM and ERP across 80+ modules including finance, HR, logistics, and invoicing.",
      "whyItMatters": "Businesses needing finance or HR modules alongside CRM get more from YetiForce's broader scope.",
      "benefitsWho": "Small businesses wanting one free system instead of separate CRM and ERP tools."
    },
    {
      "title": "Open-Source Community Proof Points",
      "toolA": "Krayin documents 23,000+ GitHub stars with an active, recently updated codebase.",
      "toolB": "YetiForce documents adoption through roughly 23,000 firms across 100 countries rather than a GitHub star count.",
      "whyItMatters": "Buyers evaluating open-source project health look at different signals — code activity versus real-world deployment scale.",
      "benefitsWho": "Technical evaluators assessing long-term project viability."
    },
    {
      "title": "Official Managed Hosting",
      "toolA": "Krayin has Webkul's official Cloudkul managed hosting on AWS, GCP, and Azure, plus third-party hosting options.",
      "toolB": "YetiForce's facts show no first-party managed hosting option, only vague \"optional paid support and subscription services\" through its marketplace.",
      "whyItMatters": "Teams without in-house server administration need a vendor-backed hosting path.",
      "benefitsWho": "Organizations without dedicated IT staff to self-host."
    },
    {
      "title": "Multi-Channel Communication Integrations",
      "toolA": "Krayin explicitly documents integrations with Gmail, Outlook, WhatsApp, Facebook, WeChat, Skype, and phone systems.",
      "toolB": "YetiForce's own materials disclose limited detail on specific third-party integrations, per its documented cons.",
      "whyItMatters": "Confirmed, named integrations reduce the risk of discovering gaps after deployment.",
      "benefitsWho": "Support and sales teams needing confirmed omnichannel communication tools."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sales & Marketing",
      "rows": [
        {
          "feature": "Lead/deal tracking and forecasting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Marketing automation/campaigns",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom fields and access control lists",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Support & Extended Modules",
      "rows": [
        {
          "feature": "VoIP and live chat support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Finance/invoicing module",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HR and logistics modules",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Outside Krayin's documented CRM scope."
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Official managed cloud hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Krayin: Webkul's Cloudkul on AWS/GCP/Azure."
        },
        {
          "feature": "Named multi-channel communication integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Krayin: Gmail, Outlook, WhatsApp, Facebook, WeChat, Skype, phone."
        },
        {
          "feature": "Documented GitHub community size",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Krayin: 23,000+ stars."
        },
        {
          "feature": "Documented firm-scale adoption",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "YetiForce: ~23,000 firms, 100 countries, 12,500-user deployment."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What tech stack is each built on?",
      "answer": "Krayin is built on Laravel (PHP). YetiForce's underlying framework is not documented in the facts reviewed."
    },
    {
      "question": "Which covers more than CRM?",
      "answer": "YetiForce combines CRM and ERP across 80+ modules including finance, HR, and logistics. Krayin focuses on sales, marketing automation, and support."
    },
    {
      "question": "Is managed hosting available for either?",
      "answer": "Krayin has Webkul's official Cloudkul managed hosting on AWS, GCP, and Azure plus third-party hosting options. YetiForce's facts don't list an equivalent first-party managed hosting plan."
    },
    {
      "question": "How active is each project's open-source community?",
      "answer": "Krayin documents 23,000+ GitHub stars with recent commits. YetiForce's facts instead document adoption by roughly 23,000 firms across 100 countries rather than a GitHub star count."
    },
    {
      "question": "Which integrates with more communication channels out of the box?",
      "answer": "Krayin names Gmail, Outlook, WhatsApp, Facebook, WeChat, Skype, and phone integrations. YetiForce's own materials disclose limited detail on specific third-party integrations."
    },
    {
      "question": "Are both completely free?",
      "answer": "Yes, both are free, open-source, self-hosted software with no license fees. Krayin's paid managed hosting is sold separately via Cloudkul, and YetiForce offers optional paid support and subscription services through its marketplace."
    }
  ]
};

export default krayinCrmVsYetiforceContent;
