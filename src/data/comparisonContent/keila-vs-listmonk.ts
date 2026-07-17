import type { ToolComparisonContent } from './types';

const keilaVsListmonkContent: ToolComparisonContent = {
  "verdict": "Keila and Listmonk are both open-source (AGPLv3), self-hostable email newsletter platforms, but they target different operating models. Listmonk is free forever with no official hosted option beyond third-party one-click deployers, and is built for high-throughput sending at scale via a single Go binary. Keila offers the same free self-hosting option, but also sells a managed \"Keila Cloud\" service hosted on EU infrastructure starting at €8/month for teams that don't want to run their own server.",
  "bestForToolA": "Privacy- and GDPR-focused senders who want either free self-hosting or a managed EU-hosted option (Keila Cloud, from €8/month for 2,000 emails), plus form-builder features like signup forms with captcha and double opt-in.",
  "bestForToolB": "Technical teams sending to very large lists who want a single-binary, self-hosted deployment with multi-threaded SMTP queues built to scale to millions of subscribers, and who don't need a managed cloud option.",
  "whoNeedsBoth": "There isn't a realistic scenario for running both in parallel — both solve the same self-hosted newsletter problem, so a team would typically standardize on one rather than operate both concurrently; at most, a team might trial Keila Cloud's managed hosting before migrating to a self-hosted Listmonk instance once volume justifies running their own infrastructure.",
  "keyDifferences": [
    {
      "title": "Managed Hosting Option",
      "toolA": "Keila offers \"Keila Cloud,\" a paid managed service hosted on EU (Germany/France) infrastructure starting at €8/month for 2,000 emails (Keila XS plan).",
      "toolB": "Listmonk has no official managed cloud version from its maintainers; self-hosting is the only supported deployment, though third-party hosts like Railway and Northflank offer one-click deployments.",
      "whyItMatters": "Teams without server-ops resources need a supported managed option instead of managing infrastructure themselves.",
      "benefitsWho": "Small teams or non-technical marketers who want newsletter sending without running a server."
    },
    {
      "title": "Sending Scale",
      "toolA": "Keila's Cloud plans list tiers up to Keila XXL, 250,000 emails/month at €256/month, with no stated subscriber ceiling for self-hosting.",
      "toolB": "Listmonk documents multi-threaded SMTP queues with rate limiting \"designed to handle mailing lists with millions of subscribers.\"",
      "whyItMatters": "Sending scale and throughput architecture matter for very large lists.",
      "benefitsWho": "High-volume senders such as publishers or SaaS companies with subscriber lists in the millions."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Keila's self-hosted version is free, but Keila Cloud is tiered by monthly email volume (€8 to €256/month across six plans, XS through XXL).",
      "toolB": "Listmonk has no pricing plans at all — it is completely free with no paid tier.",
      "whyItMatters": "Predictable free-forever software vs. a paid managed-service ladder changes total cost of ownership as sending volume grows.",
      "benefitsWho": "Budget-conscious self-hosters (Listmonk) versus teams wanting a paid support/hosting relationship (Keila Cloud)."
    },
    {
      "title": "Form Builder & Personalization",
      "toolA": "Keila documents a form builder with bot protection (captcha, double opt-in) and Liquid templating for dynamic personalized content.",
      "toolB": "Listmonk's documented features focus on a drag-and-drop and Go-template-based email builder without a named signup-form builder.",
      "whyItMatters": "Signup form quality affects list growth and spam/bot protection at the point of capture.",
      "benefitsWho": "Marketers actively growing their list via public signup forms."
    },
    {
      "title": "Analytics Privacy Controls",
      "toolA": "Keila documents \"privacy-first analytics\" with the explicit option to disable tracking entirely.",
      "toolB": "Listmonk documents built-in campaign analytics for opens, clicks, bounces, and link performance without mentioning a tracking opt-out.",
      "whyItMatters": "The ability to fully disable tracking matters for GDPR-strict or privacy-focused senders.",
      "benefitsWho": "EU-based or privacy-conscious organizations that need to avoid tracking pixels for compliance reasons."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Both free via Docker/binary"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Keila Cloud from €8/month"
        },
        {
          "feature": "Database requirement",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listmonk requires PostgreSQL"
        }
      ]
    },
    {
      "group": "Sending & Campaigns",
      "rows": [
        {
          "feature": "High-throughput sending (millions of subscribers)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Transactional email API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Segmentation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Form builder with bot protection",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Licensing & Analytics",
      "rows": [
        {
          "feature": "License",
          "toolA": "available",
          "toolB": "available",
          "note": "Both AGPLv3"
        },
        {
          "feature": "Privacy-first / disable tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "REST API for integrations",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Keila or Listmonk free?",
      "answer": "Both offer free, open-source (AGPLv3) self-hosted versions. Keila additionally sells a paid managed option, Keila Cloud, starting at €8/month; Listmonk has no paid tier at all."
    },
    {
      "question": "Which tool handles larger subscriber lists?",
      "answer": "Listmonk documents multi-threaded SMTP sending queues designed to scale to millions of subscribers. Keila's documented Cloud plans top out at 250,000 emails/month (Keila XXL, €256/month) for the managed option."
    },
    {
      "question": "Does either tool offer managed hosting?",
      "answer": "Keila does, via Keila Cloud on EU (Germany/France) infrastructure. Listmonk does not offer an official managed version, though third-party platforms like Railway and Northflank provide one-click deployments."
    },
    {
      "question": "Can I disable tracking for privacy compliance?",
      "answer": "Keila explicitly documents privacy-first analytics with the option to disable tracking entirely. Listmonk's documented analytics feature does not mention a tracking opt-out."
    },
    {
      "question": "What database does each require for self-hosting?",
      "answer": "Listmonk requires PostgreSQL, per its documentation. Keila's specific database requirement isn't documented in the available facts."
    },
    {
      "question": "Which is better for building signup forms?",
      "answer": "Keila documents a dedicated form builder with bot protection (captcha, double opt-in). Listmonk's documented feature set does not include a named form-builder tool."
    }
  ]
};

export default keilaVsListmonkContent;
