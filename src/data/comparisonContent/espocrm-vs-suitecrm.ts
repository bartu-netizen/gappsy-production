import type { ToolComparisonContent } from './types';

const espocrmVsSuitecrmContent: ToolComparisonContent = {
  "verdict": "EspoCRM publishes transparent, tiered per-user cloud pricing (from €12.90 to €59/user/month) with clear record and storage limits and a 2,000+ integration ecosystem, suiting teams that want predictable cloud costs. SuiteCRM is a self-hosted-first CRM with formal ISO 9001/27001 certification and Crown Commercial Service supplier status, plus optional flat-rate managed hosting and support packages, for organizations prioritizing vendor certification and support-contract flexibility over published per-seat cloud pricing.",
  "bestForToolA": "Teams wanting predictable, published per-user cloud pricing with a 30-day trial and a 2,000+ built-in integration catalog, best suited to growing teams that meet the 3+, 5+, or 10+ user minimums by tier.",
  "bestForToolB": "Organizations, especially public-sector or regulated buyers, that value formal ISO 9001/27001 certification and Crown Commercial Service supplier status, paired with self-hosted control and optional flat-rate managed hosting from £50/month.",
  "whoNeedsBoth": "There's limited realistic overlap since both are full CRM platforms solving the same core need, so a team would typically self-host or subscribe to one rather than run both in production; the realistic scenario is trialing EspoCRM's 30-day cloud trial alongside a self-hosted SuiteCRM proof-of-concept before choosing a long-term platform.",
  "keyDifferences": [
    {
      "title": "Cloud Pricing Structure",
      "toolA": "EspoCRM publishes exact per-user cloud pricing: €12.90/user/month (Basic), €22.00/user/month (Enterprise), and €59.00/user/month (Ultimate).",
      "toolB": "SuiteCRM's managed hosting is a flat rate from £50/month without published per-user tiers, with support and implementation sold as separate line items.",
      "whyItMatters": "Per-user published pricing lets teams calculate exact costs before signing up.",
      "benefitsWho": "Growing teams that want predictable, scalable cloud costs."
    },
    {
      "title": "Record and Storage Limits",
      "toolA": "EspoCRM explicitly tiers record and storage limits by plan, from 100,000 records and 3GB per user on Basic up to unlimited records and 400GB total storage on Ultimate.",
      "toolB": "SuiteCRM's facts don't document record or storage caps.",
      "whyItMatters": "Data-heavy teams need to know storage limits before they hit a ceiling mid-contract.",
      "benefitsWho": "Larger sales and support teams tracking high record volumes."
    },
    {
      "title": "Minimum User Requirements",
      "toolA": "EspoCRM cloud plans require minimum users per tier — 3 for Basic, 5 for Enterprise, 10 for Ultimate — billed for 6 months or a year.",
      "toolB": "SuiteCRM's managed hosting plan doesn't document a minimum user count.",
      "whyItMatters": "Small teams below the minimum threshold may pay for unused seats on EspoCRM Cloud.",
      "benefitsWho": "Very small teams evaluating minimum commitment size."
    },
    {
      "title": "Integration Ecosystem Size",
      "toolA": "EspoCRM cloud plans include 2,000+ third-party integrations plus 9 official Advanced Pack extensions at no extra cost.",
      "toolB": "SuiteCRM documents a named plugin list (Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, WhatsApp) without a total integration count.",
      "whyItMatters": "A larger documented integration catalog reduces the risk of needing custom development for common connections.",
      "benefitsWho": "Teams needing broad, low-effort third-party connectivity."
    },
    {
      "title": "Formal Certifications vs. Adoption Scale",
      "toolA": "EspoCRM reports usage by 50,000+ companies across 163 countries.",
      "toolB": "SuiteCRM instead documents formal certifications: ISO 9001, ISO 27001, and Crown Commercial Service supplier status.",
      "whyItMatters": "Buyers weighing adoption proof versus formal compliance credentials will favor different tools.",
      "benefitsWho": "Public-sector buyers needing certifications versus teams wanting evidence of wide adoption."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM Features",
      "rows": [
        {
          "feature": "Contact/company/opportunity management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Reporting and dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Marketing automation/segmentation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Both document open API access."
        }
      ]
    },
    {
      "group": "Cloud Plans & Pricing Structure",
      "rows": [
        {
          "feature": "Published per-user cloud pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: €12.90-€59/user/month."
        },
        {
          "feature": "Free trial on cloud/hosted plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: 30-day trial."
        },
        {
          "feature": "Minimum user requirements",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: 3/5/10 users by tier."
        },
        {
          "feature": "Record/storage tiering",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Documented integration count",
          "toolA": "available",
          "toolB": "limited",
          "note": "EspoCRM: 2,000+; SuiteCRM names plugins without a total."
        },
        {
          "feature": "Formal certifications (ISO, government supplier)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official extension bundle included free",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "EspoCRM: 9 Advanced Pack extensions on cloud plans."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How do EspoCRM and SuiteCRM cloud pricing compare?",
      "answer": "EspoCRM publishes per-user cloud pricing from €12.90/user/month (Basic, minimum 3 users) up to €59/user/month (Ultimate). SuiteCRM's managed hosting is a flat rate from £50/month without published per-user tiers."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "EspoCRM's cloud plans include a 30-day free trial. SuiteCRM's facts don't specify a trial length for its Fully Managed Hosting plan."
    },
    {
      "question": "Which has more third-party integrations documented?",
      "answer": "EspoCRM cloud plans include 2,000+ third-party integrations. SuiteCRM documents a named plugin list (Outlook, Xero, DocuSign, Mailchimp, QuickBooks, Zoom, WhatsApp) without a total integration count."
    },
    {
      "question": "Which has formal compliance or government certifications?",
      "answer": "SuiteCRM Ltd is ISO 9001 and ISO 27001 certified and a UK Crown Commercial Service supplier. EspoCRM's facts don't document equivalent certifications."
    },
    {
      "question": "Can both be self-hosted for free?",
      "answer": "Yes. EspoCRM can be installed on Windows, macOS, or Linux, including via Docker, at no license cost, and SuiteCRM's core software is free and open source for self-hosting."
    },
    {
      "question": "Are there minimum user requirements on either platform?",
      "answer": "EspoCRM's cloud plans require a minimum of 3 users (Basic), 5 (Enterprise), or 10 (Ultimate). SuiteCRM's Fully Managed Hosting plan doesn't document a minimum user count."
    }
  ]
};

export default espocrmVsSuitecrmContent;
