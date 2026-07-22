import type { GroupComparisonContent } from './types';

const factorialVsHibobVsPaylocityContent: GroupComparisonContent = {
  "verdict": "All three are legitimate full HR and payroll platforms, but they are built for different geographies and buyers. Factorial is the most accessible entry point with a genuinely free plan and publicly published starting pricing, and its EU compliance roots make it strongest for European SMBs. HiBob leans into people analytics, compensation, and engagement for distributed international mid-market teams. Paylocity is the most US-focused of the three, backed by a publicly traded company with two decades of payroll and tax-compliance experience and a social-style engagement feed aimed at frontline adoption.",
  "bestFor": {
    "factorial": "European or EU-compliant small and mid-sized businesses, roughly 10 to a few hundred employees, that want to start free with document management and e-signature and scale into payroll and talent hubs without a large upfront contract.",
    "hibob": "International mid-market companies, roughly 100 to 3,000 employees, with distributed or global teams that want a design-forward platform with strong built-in people analytics, attrition-risk insights, and compensation benchmarking.",
    "paylocity": "US-based mid-sized organizations, roughly 50 to 5,000 employees, that want a single publicly traded HCM vendor covering payroll, tax filing, benefits, and talent management with a mobile-first, socially engaging employee experience."
  },
  "highlights": [
    {
      "title": "Factorial is the only one with a genuine free plan and public starting price",
      "description": "Factorial offers a free plan for document management and e-signature plus a publicly quoted Core plan starting around $8 per user per month, while HiBob and Paylocity both require a custom sales quote to learn actual pricing.",
      "toolSlugs": [
        "factorial"
      ]
    },
    {
      "title": "HiBob has the deepest built-in people analytics and compensation tooling",
      "description": "HiBob explicitly bundles AI-powered people analytics that surface burnout and attrition risk alongside compensation management with company-wide pay bands and equity tracking, directly in its core platform rather than as a separate add-on.",
      "toolSlugs": [
        "hibob"
      ]
    },
    {
      "title": "Paylocity is a public company with a distinctive social engagement feed",
      "description": "As a NASDAQ-listed company (PCTY) operating since 1997, Paylocity pairs payroll and tax-filing depth with a Community engagement feed for peer recognition, a feature aimed specifically at improving software adoption among frontline and distributed workforces.",
      "toolSlugs": [
        "paylocity"
      ]
    },
    {
      "title": "Geographic payroll reach separates Factorial and HiBob from Paylocity",
      "description": "Factorial supports roughly 180 currencies and multi-entity compliance, and HiBob runs native US and UK payroll plus a global Payroll Hub for other countries, while Paylocity's payroll and tax-filing capabilities as described are scoped to US federal, state, and local compliance.",
      "toolSlugs": [
        "factorial",
        "hibob",
        "paylocity"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR and Payroll",
      "rows": [
        {
          "feature": "Native in-house payroll processing",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "paylocity": "available"
          },
          "note": "HiBob's native processing is confirmed specifically for the US and UK, with other countries handled through its Payroll Hub partner network."
        },
        {
          "feature": "Multi-country payroll and compliance beyond the home market",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "paylocity": "unavailable"
          },
          "note": "Factorial handles roughly 180 currencies and multi-entity compliance; HiBob extends beyond the US and UK via its Payroll Hub; Paylocity's described payroll scope is US federal, state, and local tax filing only."
        }
      ]
    },
    {
      "group": "Talent and Compensation",
      "rows": [
        {
          "feature": "Applicant tracking and recruiting (ATS)",
          "statuses": {
            "factorial": "available",
            "hibob": "limited",
            "paylocity": "available"
          },
          "note": "HiBob is described as offering 'ATS-lite' hiring functionality, less extensive than Factorial's AI-assisted ATS or Paylocity's talent management suite."
        },
        {
          "feature": "Compensation management with pay bands and benchmarking",
          "statuses": {
            "factorial": "not-documented",
            "hibob": "available",
            "paylocity": "not-documented"
          },
          "note": "HiBob explicitly lists compensation management with company-wide pay bands and equity tracking; this is not confirmed for Factorial or Paylocity in the provided data."
        }
      ]
    },
    {
      "group": "Analytics and Engagement",
      "rows": [
        {
          "feature": "People analytics with burnout or attrition-risk insights",
          "statuses": {
            "factorial": "limited",
            "hibob": "available",
            "paylocity": "available"
          },
          "note": "Factorial offers general AI-generated reporting and a natural-language analytics assistant but no attrition-specific insight is documented; HiBob explicitly surfaces burnout and attrition risk, and Paylocity's workforce analytics track turnover trends."
        },
        {
          "feature": "Social-style internal engagement feed",
          "statuses": {
            "factorial": "not-documented",
            "hibob": "not-documented",
            "paylocity": "available"
          },
          "note": "Paylocity's Community feed for peer recognition and company announcements is explicitly documented; no equivalent is confirmed for Factorial or HiBob."
        }
      ]
    },
    {
      "group": "Pricing Transparency",
      "rows": [
        {
          "feature": "Publicly listed starting price without a sales call",
          "statuses": {
            "factorial": "available",
            "hibob": "limited",
            "paylocity": "unavailable"
          },
          "note": "Factorial publishes a Core plan starting price; HiBob does not publish list pricing but third-party estimates exist; Paylocity's pricing is fully custom with only third-party estimates available."
        },
        {
          "feature": "Genuinely free plan (not just a trial)",
          "statuses": {
            "factorial": "available",
            "hibob": "unavailable",
            "paylocity": "unavailable"
          },
          "note": "Factorial's free plan covers document management and e-signature; neither HiBob nor Paylocity offers a free plan in the provided data."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three HR platforms has a free plan?",
      "answer": "Factorial. It offers a genuinely free plan limited to document management and digital e-signature, useful for very small teams before they need full HRIS functionality. HiBob and Paylocity do not offer a free plan in the provided data."
    },
    {
      "question": "Do all three handle payroll outside their home country?",
      "answer": "Factorial and HiBob both do: Factorial supports multi-entity compliance across roughly 180 currencies, and HiBob runs native US and UK payroll plus a global Payroll Hub for other countries. Paylocity's described payroll and tax-filing capabilities are scoped to US federal, state, and local compliance."
    },
    {
      "question": "Which one publishes pricing without requiring a sales call?",
      "answer": "Factorial is the most transparent, with its Core plan publicly quoted at around $8 per user per month. HiBob and Paylocity both require a custom sales quote, though third-party estimates place HiBob around $8-25 per employee per month and Paylocity around $20-40 per employee per month."
    },
    {
      "question": "Is Paylocity a private startup or a public company?",
      "answer": "Paylocity is publicly traded on NASDAQ under the ticker PCTY, listed since its 2014 IPO, and has operated since 1997 out of Schaumburg, Illinois."
    },
    {
      "question": "Which tool has the strongest built-in people analytics?",
      "answer": "HiBob, based on its explicit AI-powered people analytics that surface burnout, disengagement, and attrition risk directly in the core platform, alongside dedicated compensation management tools."
    },
    {
      "question": "Do any of these include compensation benchmarking?",
      "answer": "HiBob explicitly includes compensation management with company-wide pay bands and equity tracking. The provided data does not confirm equivalent compensation benchmarking features for Factorial or Paylocity."
    }
  ]
};

export default factorialVsHibobVsPaylocityContent;
