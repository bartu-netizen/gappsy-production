import type { ToolComparisonContent } from './types';

const fetcherVsGemContent: ToolComparisonContent = {
  "verdict": "Fetcher and Gem both use AI to source candidates, but they differ in what they replace and how transparent their pricing is: Fetcher publishes clear tiered pricing ($115-$649/month) and pairs AI sourcing with a human sourcing team, while Gem publishes only a discounted startup-program price ($130/month for 1-10 employees) and positions itself as either layering AI sourcing onto an existing ATS or replacing it outright with 'Gem All-in-One.' The choice often depends on whether you want sourcing-as-a-service or a full AI-first recruiting system.",
  "bestForToolA": "Best for teams that want transparent, published pricing tiers and a hybrid of AI-screened sourcing plus a human sourcing team, including a dedicated sourcer on higher tiers (Amplify plan) for 4-6 open roles.",
  "bestForToolB": "Best for teams that want to layer AI sourcing on top of an existing ATS (Greenhouse, Workday, Lever, iCIMS) or consolidate CRM/ATS/sourcing/analytics into one AI-first system, and that qualify for Gem's startup program (companies with 1-10 or under-30 employees).",
  "whoNeedsBoth": "A talent acquisition team scaling quickly might start with Fetcher for its published pricing and dedicated sourcer model to fill immediate roles, while separately piloting Gem's AI sourcing layer against its existing ATS to evaluate replacing manual sourcing longer-term.",
  "keyDifferences": [
    {
      "title": "Candidate database scale",
      "toolA": "Fetcher gives all plans access to a 500M+ candidate database.",
      "toolB": "Gem's AI Sourcing Agent searches over 800M+ profiles and surfaces past candidates with verified contact info.",
      "whyItMatters": "A larger, verified candidate pool can widen sourcing reach, especially for hard-to-fill or niche roles.",
      "benefitsWho": "Sourcing-heavy teams recruiting for specialized or high-volume roles benefit from a larger database."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Fetcher publishes three tiers (Self-Serve $115/month, Growth $379/month, Amplify $649/month) plus a custom Enterprise tier, with 30% off for annual billing.",
      "toolB": "Gem's full platform pricing is quote-based and tied to company FTE count; only its startup program rate ($130/month for 1-10 employees) is published.",
      "whyItMatters": "Published tiered pricing lets buyers budget without a sales conversation for most company sizes.",
      "benefitsWho": "Budget-conscious teams outside Gem's startup-program size band benefit more from Fetcher's published tiers."
    },
    {
      "title": "Human sourcing support",
      "toolA": "Higher Fetcher tiers include a dedicated sourcer for open roles (4-6 roles on the Amplify plan) plus a dedicated success team.",
      "toolB": "Gem's features are AI-agent-based (AI Sourcing Agent, AI Application Review Agent, AI Fraud Detection Agent) without a documented dedicated human sourcer.",
      "whyItMatters": "A dedicated human sourcer can supplement AI matching with judgment calls that pure automation may miss.",
      "benefitsWho": "Teams that want sourcing support beyond software, especially for roles that are hard to define algorithmically."
    },
    {
      "title": "ATS relationship",
      "toolA": "Fetcher integrates with existing ATS, CRM, email, and Slack tools rather than replacing them.",
      "toolB": "Gem offers a choice: 'Gem + Your ATS' (AI sourcing layered on an existing ATS) or 'Gem All-in-One' (built-in ATS that can replace the existing one).",
      "whyItMatters": "Teams unwilling to migrate off their current ATS need a sourcing tool that integrates rather than replaces it; those open to consolidation have more flexibility with Gem.",
      "benefitsWho": "Teams committed to an existing ATS may prefer Fetcher's integration-only approach; teams open to consolidating systems may prefer Gem's All-in-One option."
    },
    {
      "title": "AI fraud detection",
      "toolA": "Fetcher's documented features do not include AI fraud/deepfake detection for candidate applications.",
      "toolB": "Gem includes an AI Fraud Detection Agent that flags fraudulent or AI-generated candidate applications.",
      "whyItMatters": "As AI-generated résumés and fraudulent applications increase, dedicated detection can reduce time wasted screening fake candidates.",
      "benefitsWho": "High-volume recruiting teams processing large applicant pools where AI-generated fraud is a growing concern."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Database",
      "rows": [
        {
          "feature": "Candidate database size",
          "toolA": "available",
          "toolB": "available",
          "note": "Fetcher: 500M+. Gem: 800M+."
        },
        {
          "feature": "AI-screened sourcing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Diversity search criteria",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI fraud/deepfake detection",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & ATS",
      "rows": [
        {
          "feature": "Built-in CRM",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in ATS option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Gem All-in-One."
        },
        {
          "feature": "Integrates with existing ATS (Greenhouse, Workday, Lever, iCIMS)",
          "toolA": "available",
          "toolB": "available",
          "note": "Fetcher integrates generally with 'existing ATS'; Gem names specific ATS integrations."
        },
        {
          "feature": "Recruitment/hiring analytics",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Published tiered pricing",
          "toolA": "available",
          "toolB": "limited",
          "note": "Fetcher: 3 published tiers + custom Enterprise. Gem: only startup-program rate published."
        },
        {
          "feature": "Dedicated human sourcer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fetcher Amplify plan."
        },
        {
          "feature": "Startup/discount program",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Gem: free for 6 months under 30 employees, then 50% off."
        },
        {
          "feature": "Free trial or free plan",
          "toolA": "unavailable",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Fetcher's pricing compare to Gem's?",
      "answer": "Fetcher publishes three tiers: Self-Serve ($115/month), Growth ($379/month), and Amplify ($649/month), plus a custom Enterprise tier. Gem's full pricing is quote-based on company size; only its startup-program rate ($130/month for 1-10 employees) is published."
    },
    {
      "question": "Which has the larger candidate database?",
      "answer": "Gem's AI Sourcing Agent searches over 800M+ profiles. Fetcher gives all plans access to a 500M+ candidate database."
    },
    {
      "question": "Does either tool include a dedicated human sourcer?",
      "answer": "Fetcher's Amplify plan includes a dedicated sourcer for 4-6 roles and a dedicated success team. This isn't a documented Gem feature."
    },
    {
      "question": "Does Gem replace an existing ATS?",
      "answer": "Gem offers two options: 'Gem + Your ATS,' which layers AI sourcing on an existing ATS, or 'Gem All-in-One,' which includes its own built-in ATS."
    },
    {
      "question": "Does either platform detect fraudulent applications?",
      "answer": "Gem includes an AI Fraud Detection Agent that flags fraudulent or AI-generated candidate applications. This isn't documented among Fetcher's features."
    },
    {
      "question": "Does Gem offer any startup discounts?",
      "answer": "Yes — companies with 1-10 employees can get the startup program rate of $130/month, and companies under 30 employees can get free access for six months, then 50% off paid plans."
    }
  ]
};

export default fetcherVsGemContent;
