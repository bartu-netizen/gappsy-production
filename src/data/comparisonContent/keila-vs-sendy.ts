import type { ToolComparisonContent } from './types';

const keilaVsSendyContent: ToolComparisonContent = {
  "verdict": "Keila and Sendy are both budget-conscious alternatives to subscription email marketing platforms, but they reach that goal differently. Keila is fully open source (AGPLv3) and can be self-hosted free forever, or run as a managed EU-hosted \"Keila Cloud\" service from €8/month. Sendy is a commercially licensed, closed-source PHP/MySQL script sold for a one-time $69 per-domain fee that you self-host and connect to Amazon SES for roughly $1 per 10,000 emails sent.",
  "bestForToolA": "GDPR-focused teams that want either free, open-source self-hosting or a managed EU-hosted option, plus Liquid-based personalization and a form builder with bot protection.",
  "bestForToolB": "Agencies or cost-sensitive senders who want to pay once ($69 per domain) instead of subscribing, and who are comfortable configuring Amazon SES for sub-cent-per-email sending costs; Sendy also documents white-labeled \"brands\" for managing multiple clients' newsletters.",
  "whoNeedsBoth": "There's no realistic scenario for running both concurrently — they solve the identical self-hosted-newsletter problem, so a team would pick one licensing/hosting model (open-source Keila vs. commercially-licensed Sendy) rather than operate both.",
  "keyDifferences": [
    {
      "title": "Licensing Model",
      "toolA": "Keila is fully open source under AGPLv3, free to self-host indefinitely.",
      "toolB": "Sendy is a commercially licensed script sold for a one-time $69 fee per domain, with no indication it is open source.",
      "whyItMatters": "Open-source licensing affects whether you can audit, modify, and redistribute the code, while Sendy's model is pay-once-per-domain without source freedom.",
      "benefitsWho": "Developers who need to audit or modify the codebase (Keila) versus buyers who just want a low-cost, ready-made script (Sendy)."
    },
    {
      "title": "Sending Infrastructure",
      "toolA": "Keila's documented features don't specify a required SMTP provider; Keila Cloud plans are priced by monthly email volume (e.g., €8/month for 2,000 emails on Keila XS).",
      "toolB": "Sendy is built specifically around Amazon SES (or SendGrid, Mailjet, Elastic Email) integration, advertising roughly $1 per 10,000 emails sent.",
      "whyItMatters": "Sendy's SES-routed model can be dramatically cheaper per email at high volume than a flat monthly SaaS-style tier.",
      "benefitsWho": "High-volume senders who want to minimize per-email cost by using their own SES account."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Keila is either free to self-host or billed monthly for Keila Cloud across six tiers from €8/month (2,000 emails) to €256/month (250,000 emails).",
      "toolB": "Sendy charges a one-time $69 license per domain, plus an optional $79 installation service and a $39 AI Assistant add-on.",
      "whyItMatters": "A one-time fee versus a recurring subscription changes long-term cost projections very differently.",
      "benefitsWho": "Budget-conscious buyers who prefer a single upfront payment (Sendy) versus those who want a scalable managed service with no server maintenance (Keila Cloud)."
    },
    {
      "title": "Agency/Multi-client Features",
      "toolA": "Keila's documented features don't mention white-labeling or multi-brand/client management.",
      "toolB": "Sendy documents \"white-labeled brands\" for client account management, letting agencies run multiple newsletters under one install.",
      "whyItMatters": "Agencies managing newsletters for multiple clients need built-in multi-tenant or white-label support.",
      "benefitsWho": "Marketing agencies and freelancers sending newsletters on behalf of multiple clients."
    },
    {
      "title": "AI Features",
      "toolA": "Keila's documented feature list includes no AI capability.",
      "toolB": "Sendy offers an optional paid \"AI Assistant\" add-on ($39, discounted from $49) for generating newsletters, subject lines, and campaign insights.",
      "whyItMatters": "AI-assisted copywriting can speed up campaign creation, but it's an added cost on Sendy and simply absent from Keila.",
      "benefitsWho": "Solo marketers who want AI help drafting subject lines and copy without hiring a copywriter."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Hosting",
      "rows": [
        {
          "feature": "License type",
          "toolA": "available",
          "toolB": "available",
          "note": "Keila: AGPLv3 open source; Sendy: commercial per-domain license"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Keila free; Sendy $69 one-time per domain"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Keila Cloud from €8/month"
        }
      ]
    },
    {
      "group": "Sending & Campaigns",
      "rows": [
        {
          "feature": "Amazon SES integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "~$1/10,000 emails"
        },
        {
          "feature": "Transactional email API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Segmentation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Autoresponders / drip sequences",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Agency & AI Features",
      "rows": [
        {
          "feature": "White-labeled client management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI writing assistant",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sendy: paid add-on, $39"
        },
        {
          "feature": "Form builder with bot protection",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Keila or Sendy cheaper?",
      "answer": "It depends on usage. Sendy is a one-time $69 fee per domain plus SES costs (~$1/10,000 emails), while Keila is free to self-host or €8-€256/month for the managed Keila Cloud tiers."
    },
    {
      "question": "Are both open source?",
      "answer": "Keila is, under AGPLv3. Sendy is not documented as open source; it's a commercially licensed script."
    },
    {
      "question": "Which is better for agencies managing multiple clients?",
      "answer": "Sendy documents white-labeled \"brands\" for client account management built specifically for agency use; Keila's documented features don't mention an equivalent white-label capability."
    },
    {
      "question": "Do either offer AI features?",
      "answer": "Sendy offers a separate paid AI Assistant add-on ($39) for newsletters and subject lines. Keila's documented features don't include AI capabilities."
    },
    {
      "question": "Which one requires Amazon SES?",
      "answer": "Sendy is built around Amazon SES (or SendGrid, Mailjet, Elastic Email) for low-cost sending. Keila's facts don't specify a required SMTP provider."
    },
    {
      "question": "Is there a managed hosting option for either?",
      "answer": "Keila offers Keila Cloud, hosted on EU infrastructure, from €8/month. Sendy has no managed cloud option; it's self-hosted only, though a paid installation service ($79) is available."
    }
  ]
};

export default keilaVsSendyContent;
