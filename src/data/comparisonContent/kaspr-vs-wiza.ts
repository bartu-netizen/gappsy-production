import type { ToolComparisonContent } from './types';

const kasprVsWizaContent: ToolComparisonContent = {
  "verdict": "Kaspr and Wiza are both freemium contact-data tools with genuine free tiers, but they differ in emphasis. Kaspr leans into LinkedIn-native workflows with Sales Navigator/Recruiter Lite access and multi-language support (English, German, Spanish, French). Wiza emphasizes real-time verification against live sources and proactive job-change monitoring via Wiza Monitor. Kaspr claims a database from 150+ sources totaling 500M+ verified numbers/emails, versus Wiza's stated 850M+ prospects; pricing structures also diverge, with Kaspr's paid tiers priced flat per account and Wiza's priced per user, reaching up to $199/month/user at the Email+Phone tier.",
  "bestForToolA": "Recruiters and sales teams working primarily inside LinkedIn who want Sales Navigator/Recruiter Lite access baked into a paid tier and need a multi-language interface (English, German, Spanish, French).",
  "bestForToolB": "Teams that specifically want real-time email/phone verification against live sources rather than a cached database, or that need proactive alerts when tracked contacts change jobs via Wiza Monitor.",
  "whoNeedsBoth": "A combined recruiting-and-sales team might use Kaspr's Chrome extension for LinkedIn-native prospecting with Sales Navigator access, while relying on Wiza Monitor to catch job changes among contacts Kaspr already sourced.",
  "keyDifferences": [
    {
      "title": "Data freshness approach",
      "toolA": "Not documented; Bulk Data Enrichment updates lead lists with accurate contact information, without a stated real-time-vs-cached distinction.",
      "toolB": "Explicitly checks live data sources at the moment of search rather than serving stale cached records.",
      "whyItMatters": "Real-time verification can reduce the chance of contacting someone who's already left a role.",
      "benefitsWho": "Teams sourcing contacts for time-sensitive outreach where data staleness causes bounces."
    },
    {
      "title": "Job-change monitoring",
      "toolA": "Not documented in the facts.",
      "toolB": "Wiza Monitor proactively alerts when decision-makers or key contacts change jobs, with verified new contact data.",
      "whyItMatters": "Ongoing monitoring surfaces new opportunities from a team's existing contact base without a manual re-search.",
      "benefitsWho": "Teams doing account-based selling who track specific decision-makers over time."
    },
    {
      "title": "Stated database scale",
      "toolA": "500M+ verified phone numbers and emails from 150+ sources.",
      "toolB": "850M+ prospects with 40+ data points via Wiza Prospect.",
      "whyItMatters": "A larger stated pool can mean broader prospecting coverage, though sourcing methodology differs.",
      "benefitsWho": "Teams doing high-volume list-building."
    },
    {
      "title": "LinkedIn-native access",
      "toolA": "Sales Navigator and LinkedIn Recruiter Lite access included on paid tiers.",
      "toolB": "Not documented in the facts.",
      "whyItMatters": "Bundled Sales Navigator/Recruiter Lite access can reduce separate LinkedIn subscription costs.",
      "benefitsWho": "Recruiters and LinkedIn-heavy sales reps."
    },
    {
      "title": "Multi-language interface",
      "toolA": "Supports English, German, Spanish, and French.",
      "toolB": "Not documented in the facts.",
      "whyItMatters": "A localized interface matters for non-English-speaking sales/recruiting teams.",
      "benefitsWho": "European teams operating in German, Spanish, or French."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan & Core Data",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Kaspr: 15 B2B email/5 phone/5 direct email credits per month; Wiza: 20 valid emails/5 phone numbers"
        },
        {
          "feature": "Chrome extension",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Stated contact database size",
          "toolA": "available",
          "toolB": "available",
          "note": "500M+ (150+ sources) vs 850M+ (40+ data points)"
        },
        {
          "feature": "Real-time (live-source) lookups vs cached",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Advanced/Monitoring Features",
      "rows": [
        {
          "feature": "Job-change monitoring/alerts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wiza Monitor"
        },
        {
          "feature": "Sales Navigator / Recruiter Lite access",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-language interface",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access Tiers",
      "rows": [
        {
          "feature": "Full API access",
          "toolA": "available",
          "toolB": "limited",
          "note": "Kaspr: Business plan+; Wiza: Team/custom plan only, 3+ user minimum"
        },
        {
          "feature": "Entry-level paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Kaspr $49/mo flat vs Wiza $49/mo/user"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Kaspr Enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Kaspr free to use?",
      "answer": "Yes, Kaspr offers a Free plan with 15 B2B email credits, 5 phone credits, and 5 direct email credits per month."
    },
    {
      "question": "Does Wiza have a free plan?",
      "answer": "Yes, the Free plan includes 20 valid emails and 5 phone numbers."
    },
    {
      "question": "What is Wiza Monitor?",
      "answer": "A feature that alerts users when tracked decision-makers or key contacts change jobs."
    },
    {
      "question": "How large is Kaspr's contact database?",
      "answer": "Kaspr claims access to over 500 million verified phone numbers and emails from 150+ sources."
    },
    {
      "question": "How large is Wiza's prospect database?",
      "answer": "Wiza states 850M+ prospects with 40+ data points."
    },
    {
      "question": "What languages does Kaspr support?",
      "answer": "English, German (Deutsch), Spanish (Español), and French (Français)."
    }
  ]
};

export default kasprVsWizaContent;
