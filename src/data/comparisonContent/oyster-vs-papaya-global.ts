import type { ToolComparisonContent } from './types';

const oysterVsPapayaGlobalContent: ToolComparisonContent = {
  "verdict": "Oyster and Papaya Global are both EOR platforms with broad country coverage, but they differ on price, product architecture, and documented integrations: Oyster is priced somewhat higher for EOR but adds a domestic US PEO option, named HRIS/ATS integrations, and B Corp certification, while Papaya Global runs its own cross-border payments infrastructure and offers a lower-cost standard EOR tier alongside a premium tier with dedicated HR support.",
  "bestForToolA": "Oyster fits companies that want the widest documented country coverage (180+ countries), a dedicated US PEO option for domestic-only hiring, named integrations with common HR/ATS tools (BambooHR, Greenhouse, HiBob, Personio, Ashby, Xero, QuickBooks), and a misclassification risk analyzer for contractor compliance.",
  "bestForToolB": "Papaya Global fits companies prioritizing lower-cost standard EOR pricing ($650/employee/month vs Oyster's $699) that want a provider running its own cross-border payments infrastructure (130+ currencies) rather than relying solely on third-party rails, or that need a premium EOR tier with dedicated HR support.",
  "whoNeedsBoth": "The facts don't point to a scenario requiring both platforms simultaneously; companies would more likely evaluate both for the same regions and select one as their primary EOR vendor based on price, integrations, and support needs rather than run them in parallel.",
  "keyDifferences": [
    {
      "title": "EOR pricing",
      "toolA": "$699/employee/month flat regardless of country.",
      "toolB": "$650/employee/month standard tier, with a $770/employee/month premium tier adding dedicated HR support and priority compliance review.",
      "whyItMatters": "The price gap and the option for a premium HR-support tier let Papaya customers choose between a lower base rate or added support, while Oyster keeps a single flat EOR price.",
      "benefitsWho": "Cost-sensitive teams making many EOR hires; teams wanting dedicated HR support benefit from Papaya's premium tier option."
    },
    {
      "title": "Domestic US hiring option",
      "toolA": "Offers a dedicated US PEO plan at $114/employee/month for hiring across US states via co-employment.",
      "toolB": "Not documented as offering a domestic US-only PEO product.",
      "whyItMatters": "Teams that only need US-based hiring can avoid full EOR pricing by using a PEO-specific plan.",
      "benefitsWho": "US-only or US-majority employers who don't need cross-border EOR."
    },
    {
      "title": "Payments infrastructure",
      "toolA": "Not documented as operating proprietary payment rails.",
      "toolB": "Runs its own cross-border payments infrastructure (Payments OS) supporting 130+ currencies, in addition to EOR and contractor products.",
      "whyItMatters": "Owning payment rails can affect payment speed, currency support, and reliance on third-party processors.",
      "benefitsWho": "Finance teams concerned about payment reliability and currency coverage for globally distributed payroll."
    },
    {
      "title": "Documented tool integrations",
      "toolA": "Integrates with Xero, Slack, HiBob, Personio, Ashby, BambooHR, Greenhouse, and QuickBooks.",
      "toolB": "No specific HRIS/ATS/accounting integrations are documented in the facts.",
      "whyItMatters": "Integration breadth affects how easily a platform fits into an existing HR/recruiting/accounting stack.",
      "benefitsWho": "HR and recruiting teams with established tool stacks (e.g., using BambooHR or Greenhouse) who want native integration."
    },
    {
      "title": "Certifications and social accountability",
      "toolA": "Certified B Corporation, with discount programs for nonprofits, B-corps, refugees, and startups.",
      "toolB": "No B Corp or equivalent social-accountability certification documented.",
      "whyItMatters": "B Corp certification and mission-driven discount programs can matter to socially conscious buyers or nonprofits choosing a vendor.",
      "benefitsWho": "Nonprofits, B-corps, and mission-driven companies evaluating vendor values alignment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Employment Types & Coverage",
      "rows": [
        {
          "feature": "EOR country coverage",
          "toolA": "available",
          "toolB": "available",
          "note": "Oyster: 180+ countries. Papaya Global: 160+ countries."
        },
        {
          "feature": "Contractor management",
          "toolA": "available",
          "toolB": "available",
          "note": "Oyster: $29/contractor/month after a free 30 days. Papaya: $30/contractor/month."
        },
        {
          "feature": "US-only PEO option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Oyster's US PEO is $114/employee/month."
        },
        {
          "feature": "Visa/immigration sponsorship",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Misclassification risk analyzer",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Standard EOR monthly price",
          "toolA": "available",
          "toolB": "available",
          "note": "Oyster: $699/employee/month. Papaya: $650 standard, $770 premium."
        },
        {
          "feature": "Free/trial contractor tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Oyster's Global Contractors plan is free for the first 30 days."
        },
        {
          "feature": "Hourly HR advisory add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Oyster's People Partner Services is billed at $300/hour."
        }
      ]
    },
    {
      "group": "Platform & Integrations",
      "rows": [
        {
          "feature": "Documented HRIS/ATS/accounting integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Xero, Slack, HiBob, Personio, Ashby, BambooHR, Greenhouse, QuickBooks."
        },
        {
          "feature": "Proprietary payments infrastructure",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Papaya's own payments infrastructure supports 130+ currencies."
        },
        {
          "feature": "B Corp certification",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does Oyster's EOR pricing compare to Papaya Global's?",
      "answer": "Oyster's EOR plan costs $699/employee/month flat. Papaya Global's standard EOR tier is $650/employee/month, with a premium tier at $770/employee/month that adds dedicated HR support."
    },
    {
      "question": "How many countries does each platform cover?",
      "answer": "Oyster covers 180+ countries for EOR and contractor hiring. Papaya Global covers 160+ countries for EOR, payroll, and contractor services."
    },
    {
      "question": "Can I hire only within the US?",
      "answer": "Oyster offers a dedicated US PEO plan at $114/employee/month. Papaya Global's facts don't document a comparable domestic-only PEO product."
    },
    {
      "question": "Does either platform process its own payments?",
      "answer": "Papaya Global operates its own cross-border payments infrastructure supporting 130+ currencies. This isn't documented for Oyster."
    },
    {
      "question": "What integrations does Oyster support?",
      "answer": "Oyster integrates with Xero, Slack, HiBob, Personio, Ashby, BambooHR, Greenhouse, and QuickBooks."
    },
    {
      "question": "When were these companies founded?",
      "answer": "Oyster was founded in 2020 and is headquartered in San Francisco (fully distributed team). Papaya Global was founded in 2016 and is headquartered in New York, NY."
    }
  ]
};

export default oysterVsPapayaGlobalContent;
