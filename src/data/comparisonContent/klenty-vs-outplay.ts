import type { ToolComparisonContent } from './types';

const klentyVsOutplayContent: ToolComparisonContent = {
  "verdict": "Klenty and Outplay both run multichannel outreach with dialers and AI-assisted account research, but they target different buying situations. Outplay leads with a genuine Free Forever plan (capped at 2,000 active prospects/month) built for growing SMBs, while Klenty skips a free tier entirely in favor of a full-featured 14-day trial and a higher-volume Parallel Dialer (up to 350 calls/hour) sold as a $45/user/month add-on. Outplay documents explicit LinkedIn, SMS, WhatsApp, video, and website-chat channels plus Enterprise-tier SSO and Slack integration; Klenty's channel list is less itemized but adds documented AI account research across 150+ data sources and account-based selling on its top plan.",
  "bestForToolA": "Sales teams that need high-volume calling (Parallel Dialer, up to 350 calls/hour with AI voicemail/IVR detection) and are willing to add it as a paid extra, or that want account-based selling and AI call coaching on a top-tier plan.",
  "bestForToolB": "Smaller or budget-constrained teams that want to start on a genuinely free plan before committing to a paid tier, or that specifically need native LinkedIn/SMS/WhatsApp/video outreach and SSO, none of which are documented for Klenty.",
  "whoNeedsBoth": "A growing team might start on Outplay's Free Forever tier for early prospecting volume, then bring in Klenty's Parallel Dialer add-on once cold-calling volume outgrows what Outplay's basic dialer supports.",
  "keyDifferences": [
    {
      "title": "Permanent free plan",
      "toolA": "None; Klenty offers only a 14-day free trial with full feature access.",
      "toolB": "Free Forever plan supporting 2,000 active prospects/month and 2 mailboxes.",
      "whyItMatters": "A genuine free tier lets very small teams run outreach indefinitely without a subscription.",
      "benefitsWho": "Solo founders and early-stage SMBs testing outbound before budgeting for it."
    },
    {
      "title": "High-volume calling",
      "toolA": "Parallel Dialer executes up to 350 calls/hour with AI voicemail/IVR detection, sold as a $45/user/month add-on.",
      "toolB": "Includes a basic dialer on the Free Forever plan; a power dialer is reserved for the Enterprise tier.",
      "whyItMatters": "Teams doing heavy cold-calling need to know whether dialer capability is included or a paid extra at their tier.",
      "benefitsWho": "Outbound-heavy sales teams that call at scale."
    },
    {
      "title": "LinkedIn and multichannel breadth",
      "toolA": "Multichannel outreach is described generically as email, calls, SMS, and 5+ channels, without naming LinkedIn specifically.",
      "toolB": "Explicitly documents automated LinkedIn outreach plus SMS, WhatsApp, video, and website chat.",
      "whyItMatters": "Explicitly named channels reduce ambiguity about what a sequence can actually include.",
      "benefitsWho": "Teams that specifically plan LinkedIn-based cadences."
    },
    {
      "title": "Enterprise access controls",
      "toolA": "SSO is not documented in the facts.",
      "toolB": "SSO (Okta & SAML) and Slack integration are included on the Enterprise tier.",
      "whyItMatters": "SSO is often a hard requirement for larger organizations' IT security policies.",
      "benefitsWho": "Larger teams whose IT departments require SSO for any new SaaS tool."
    },
    {
      "title": "Account-based selling",
      "toolA": "Available, but limited to the top-tier Plus plan.",
      "toolB": "Not documented in the facts.",
      "whyItMatters": "Account-based selling features matter to teams targeting a defined list of enterprise accounts rather than broad prospecting.",
      "benefitsWho": "ABM-focused sales teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Free Tier",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Outplay Free Forever: 2,000 active prospects/month, 2 mailboxes"
        },
        {
          "feature": "Free trial on paid tiers",
          "toolA": "available",
          "toolB": "available",
          "note": "Klenty: 14-day, full features, no card; Outplay: 7-day, no card"
        },
        {
          "feature": "Entry-level paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Klenty Starter $50/mo vs Outplay Starter $39/mo (billed annually)"
        }
      ]
    },
    {
      "group": "Outreach Channels & Automation",
      "rows": [
        {
          "feature": "Parallel/power dialer",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Klenty: $45/user/month add-on; Outplay: basic dialer free, power dialer on Enterprise only"
        },
        {
          "feature": "Native LinkedIn outreach",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SMS/WhatsApp/video/chat channels",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-driven account research",
          "toolA": "available",
          "toolB": "available",
          "note": "Klenty specifies 150+ data sources"
        }
      ]
    },
    {
      "group": "Advanced/Enterprise Features",
      "rows": [
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Outplay Enterprise: Okta & SAML"
        },
        {
          "feature": "Slack integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Outplay Enterprise tier"
        },
        {
          "feature": "Account-based selling",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Klenty: Plus plan only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Klenty have a free plan?",
      "answer": "No, but it offers a 14-day free trial with no credit card required."
    },
    {
      "question": "Does Outplay have a free plan?",
      "answer": "Yes, a Free Forever plan supporting 2,000 active prospects/month."
    },
    {
      "question": "Is the parallel dialer included in Klenty's plans?",
      "answer": "No, the Parallel & Power Dialer is a $45/user/month add-on."
    },
    {
      "question": "Does Outplay support LinkedIn outreach?",
      "answer": "Yes, automated LinkedIn outreach is included."
    },
    {
      "question": "What's the cheapest paid Outplay plan?",
      "answer": "Starter, at $39/month billed annually."
    },
    {
      "question": "What's the cheapest Klenty plan?",
      "answer": "Starter, at $50/month billed annually."
    }
  ]
};

export default klentyVsOutplayContent;
