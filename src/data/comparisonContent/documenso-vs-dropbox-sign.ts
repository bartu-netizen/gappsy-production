import type { ToolComparisonContent } from './types';

const documensoVsDropboxSignContent: ToolComparisonContent = {
  "verdict": "Documenso and Dropbox Sign are both e-signature platforms for sending, signing, and tracking legally binding documents, but they differ sharply in deployment model and company history: Documenso is open source with a self-hostable Docker option, while Dropbox Sign is a hosted-only platform with roots as HelloSign (acquired by Dropbox in 2019, renamed in 2023). Documenso's plans are structured around unlimited documents per tier with per-seat team pricing starting at $25/month for an individual, while Dropbox Sign gates volume and features behind Essentials ($15/user/month), Standard ($25/user/month, 2-user minimum), and a custom Premium tier. The right choice depends on whether infrastructure control and open-source transparency matter more than a longer track record and deeper native integrations.",
  "bestForToolA": "Documenso fits teams or developers who want an open-source, self-hostable e-signature platform with API access included even on the entry Individual plan ($25/month), or who want to try a free tier (5 documents/month, no credit card) before committing.",
  "bestForToolB": "Dropbox Sign fits teams that want a mature, well-documented platform with tight Dropbox integration, a free plan for occasional signers (3 requests/month), and established integrations with Google Workspace, Slack, HubSpot, and Salesforce.",
  "whoNeedsBoth": "A software vendor could self-host Documenso to embed white-label signing directly into its own product via the Platform plan, while its internal operations team separately uses Dropbox Sign's hosted app for day-to-day HR or vendor contract signing where deep Dropbox file integration is already in place.",
  "keyDifferences": [
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "Documenso's code is open source on GitHub and can be self-hosted via Docker instead of using the hosted cloud service, giving organizations full infrastructure control.",
      "toolB": "Dropbox Sign is a closed-source, hosted-only SaaS platform with no self-hosting option documented.",
      "whyItMatters": "Self-hosting matters for organizations with data-residency, compliance, or infrastructure-control requirements that a pure SaaS tool can't satisfy.",
      "benefitsWho": "Engineering teams and privacy-sensitive organizations benefit from Documenso's self-hosting option."
    },
    {
      "title": "Free Plan Limits",
      "toolA": "Documenso's Free plan allows 5 documents per month with up to 10 recipients per document and no credit card required.",
      "toolB": "Dropbox Sign's Free plan is capped at 3 signature requests per month with unlimited self-signing.",
      "whyItMatters": "The free-tier cap determines how long a very light user can avoid paying, and the two tools cap on different units (documents vs. requests).",
      "benefitsWho": "Occasional individual signers testing either platform before upgrading."
    },
    {
      "title": "Entry Paid Pricing Structure",
      "toolA": "Documenso's Individual plan is $25/month ($300/year) with unlimited documents and API access for personal use; the Teams plan is $40/month for 5 users ($8/month per extra user).",
      "toolB": "Dropbox Sign's Essentials plan is $15/user/month (annual billing) for unlimited signature requests, while Standard is $25/user/month with a 2-user minimum for custom branding and bulk send.",
      "whyItMatters": "Documenso prices per plan with a flat user allotment, while Dropbox Sign prices per user with a forced minimum on its mid tier, which changes the total cost as a team grows.",
      "benefitsWho": "Solo users and developers may find Documenso's flat Individual price predictable; small teams needing exactly 2-3 seats may find Dropbox Sign's per-user Essentials tier more granular."
    },
    {
      "title": "Compliance Documentation",
      "toolA": "Documenso states compliance with the ESIGN Act, UETA, 21 CFR Part 11, SOC2, and HIPAA.",
      "toolB": "Dropbox Sign states its signatures are designed to be legally binding under laws such as the U.S. ESIGN Act and UETA, with an audit trail and certificate of completion on every document, though specific certifications like SOC2 or HIPAA are not documented in its feature list.",
      "whyItMatters": "Regulated industries (healthcare, pharma, life sciences) often require documented 21 CFR Part 11 or HIPAA compliance before adopting an e-signature tool.",
      "benefitsWho": "Healthcare and life-sciences teams needing documented 21 CFR Part 11/HIPAA compliance benefit from Documenso's stated certifications."
    },
    {
      "title": "Company Background & Maturity",
      "toolA": "Documenso does not disclose its founding year or headquarters on its site.",
      "toolB": "Dropbox Sign traces back to HelloSign, founded in 2010 and headquartered in San Francisco, acquired by Dropbox in 2019 and rebranded in 2023, giving it over a decade of operating history under one product line.",
      "whyItMatters": "Company track record and transparency about founding history can factor into vendor-risk assessments for larger buyers.",
      "benefitsWho": "Risk-averse enterprise buyers may weigh Dropbox Sign's longer, publicly documented history more heavily."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Reusable templates",
          "toolA": "available",
          "toolB": "available",
          "note": "Both support saving documents as reusable templates"
        },
        {
          "feature": "API and webhooks",
          "toolA": "available",
          "toolB": "available",
          "note": "Documenso: from Individual plan; Dropbox Sign: priced separately from web app plans"
        },
        {
          "feature": "Bulk send",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Dropbox Sign: Standard plan and above"
        },
        {
          "feature": "In-person signing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom/white-label branding",
          "toolA": "available",
          "toolB": "available",
          "note": "Documenso: Platform plan white-label; Dropbox Sign: Standard/Premium plans"
        },
        {
          "feature": "Embedded signing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documenso Platform plan supports embedded signing"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Documenso: 5 docs/month; Dropbox Sign: 3 requests/month"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Documenso Individual $25/month; Dropbox Sign Essentials $15/user/month"
        },
        {
          "feature": "Self-hosted licensing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer contact-sales top tiers"
        }
      ]
    },
    {
      "group": "Trust & Compliance",
      "rows": [
        {
          "feature": "Audit trail / certificate of completion",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Stated compliance certifications",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documenso lists ESIGN, UETA, 21 CFR Part 11, SOC2, HIPAA"
        },
        {
          "feature": "Mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Dropbox Sign has native iOS and Android apps"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I self-host Documenso or Dropbox Sign?",
      "answer": "Documenso can be self-hosted via Docker in addition to its hosted cloud service, since its code is open source on GitHub. Dropbox Sign has no self-hosting option documented — it is a hosted-only SaaS product."
    },
    {
      "question": "Which tool has a bigger free plan?",
      "answer": "Documenso's Free plan allows 5 documents per month with up to 10 recipients per document and no credit card required. Dropbox Sign's Free plan is capped at 3 signature requests per month, though it includes unlimited self-signing."
    },
    {
      "question": "Is Dropbox Sign the same company as HelloSign?",
      "answer": "Yes. Dropbox Sign is the rebranded name for HelloSign, an e-signature company founded in 2010 that Dropbox acquired in 2019 and renamed to Dropbox Sign in 2023, with the underlying service and account history carried over."
    },
    {
      "question": "Do both tools offer an API for developers?",
      "answer": "Yes. Documenso includes API access starting on its Individual plan ($25/month), with unlimited API access on the Platform plan. Dropbox Sign also offers a developer API for embedding signature requests and templates, with webhook support, priced and packaged separately from its standard web app plans."
    },
    {
      "question": "Which tool is better documented for regulated industries?",
      "answer": "Documenso explicitly states compliance with the ESIGN Act, UETA, 21 CFR Part 11, SOC2, and HIPAA. Dropbox Sign states its signatures are designed to be legally binding under the ESIGN Act and UETA with an audit trail on every document, but does not list SOC2 or HIPAA certifications in its published feature set."
    },
    {
      "question": "How does per-seat pricing compare for a small team?",
      "answer": "Documenso's Teams plan is $40/month for 5 included users ($8/month per additional user). Dropbox Sign's Standard plan is $25/user/month with a 2-user minimum, so a 5-person team would cost more on Dropbox Sign's per-seat model than on Documenso's flat Teams price."
    }
  ]
};

export default documensoVsDropboxSignContent;
