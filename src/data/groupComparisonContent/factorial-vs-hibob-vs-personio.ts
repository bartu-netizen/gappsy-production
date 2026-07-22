import type { GroupComparisonContent } from './types';

const factorialVsHibobVsPersonioContent: GroupComparisonContent = {
  "verdict": "Factorial, HiBob and Personio all bundle core HR, payroll and talent tools for small and mid-sized employers, but they differ in geographic depth and pricing transparency: Factorial leans on a modular, pay-as-you-grow structure with a free entry tier, HiBob pairs a design-forward interface with native US and UK payroll for distributed teams, and Personio goes deepest on multi-country European compliance without publishing any pricing at all. The right pick depends more on where a workforce is located than on raw feature count.",
  "bestFor": {
    "factorial": "European SMBs that want to start free on document management and e-signature, then add only the Time, Talent, Finance or IT hubs they actually need.",
    "hibob": "Internationally distributed mid-market teams that want native US and UK payroll, AI-driven attrition and engagement analytics, and a modern interface.",
    "personio": "European small and mid-sized businesses that need built-in payroll and labor-law compliance across many individual European countries in one system."
  },
  "highlights": [
    {
      "title": "Factorial is the only one of the three with a genuine free plan",
      "description": "Factorial's Free tier covers document management and digital e-signature at no cost, while both HiBob and Personio require a custom sales quote before a business can start, with no published free tier for either.",
      "toolSlugs": [
        "factorial"
      ]
    },
    {
      "title": "HiBob is the only one with native in-house payroll processing",
      "description": "HiBob runs native payroll directly for the US, across all 50 states, and the UK, connecting to local partners elsewhere through its Global Payroll Hub, whereas Factorial and Personio run payroll through their own compliance engines across European jurisdictions.",
      "toolSlugs": [
        "hibob"
      ]
    },
    {
      "title": "Personio is built specifically around European localization",
      "description": "Personio's platform and payroll compliance are designed around dozens of European countries and languages, positioning it as the deepest of the three on European labor-law compliance.",
      "toolSlugs": [
        "personio"
      ]
    },
    {
      "title": "Pricing transparency varies sharply across the three",
      "description": "Factorial publishes an $8 per user per month Core starting price and HiBob publishes estimated tier pricing from roughly $8 to $25 per employee per month, while Personio publishes no pricing at all and requires a sales conversation for every deal.",
      "toolSlugs": [
        "factorial",
        "hibob",
        "personio"
      ]
    },
    {
      "title": "Recruiting and applicant tracking is not universal across the three",
      "description": "Factorial and Personio both include built-in recruiting and applicant tracking, while HiBob's documented feature set centers on core HR, payroll, performance and analytics without a native ATS.",
      "toolSlugs": [
        "factorial",
        "personio",
        "hibob"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR and Payroll",
      "rows": [
        {
          "feature": "Employee records, org charts and onboarding",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "personio": "available"
          }
        },
        {
          "feature": "Native or built-in payroll compliance",
          "statuses": {
            "factorial": "available",
            "hibob": "limited",
            "personio": "available"
          },
          "note": "HiBob's payroll is native only in the US and UK; other countries route through its Global Payroll Hub partner network."
        },
        {
          "feature": "Time tracking and absence management",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "personio": "available"
          }
        }
      ]
    },
    {
      "group": "Talent and Analytics",
      "rows": [
        {
          "feature": "Recruiting and applicant tracking (ATS)",
          "statuses": {
            "factorial": "available",
            "hibob": "not-documented",
            "personio": "available"
          }
        },
        {
          "feature": "Performance management and reviews",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "personio": "available"
          }
        },
        {
          "feature": "People analytics and reporting",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "personio": "available"
          },
          "note": "HiBob markets its analytics as AI-powered, specifically surfacing burnout and attrition risk signals."
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published starting price",
          "statuses": {
            "factorial": "available",
            "hibob": "available",
            "personio": "unavailable"
          },
          "note": "Personio requires a sales conversation for pricing at every tier; Factorial and HiBob both publish at least an estimated starting range."
        },
        {
          "feature": "Free plan",
          "statuses": {
            "factorial": "available",
            "hibob": "unavailable",
            "personio": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Factorial, HiBob and Personio has a free plan?",
      "answer": "Only Factorial offers a free plan, covering document management and e-signature. HiBob and Personio both require a custom sales quote before you can start, even for their entry-level tiers."
    },
    {
      "question": "Which tool has the deepest payroll compliance for European countries?",
      "answer": "Personio is built specifically around European labor-law compliance across dozens of countries and languages. Factorial also supports multi-country European payroll, while HiBob's native payroll is limited to the US and UK, with other countries handled through partner integrations."
    },
    {
      "question": "Which is best for a distributed, international mid-market team?",
      "answer": "HiBob is generally the strongest fit, with native US and UK payroll, a Global Payroll Hub for other countries, and AI-driven engagement and attrition analytics built for distributed workforces."
    },
    {
      "question": "Do any of these three publish clear pricing online?",
      "answer": "Factorial publishes a Core starting price of around $8 per user per month, and HiBob publishes estimated tier pricing from roughly $8 to $25 per employee per month. Personio publishes no pricing and requires a sales conversation for every deal."
    },
    {
      "question": "Which tools include built-in recruiting and applicant tracking?",
      "answer": "Factorial and Personio both include native recruiting and applicant tracking as part of their core platforms. HiBob's documented feature set does not include a built-in ATS."
    },
    {
      "question": "Are Factorial, HiBob and Personio aimed at small businesses or larger companies?",
      "answer": "All three scale from small businesses into the mid-market, but Personio's plan structure explicitly spans roughly 10 to 2,000-plus employees, HiBob is positioned primarily for mid-market companies, and Factorial's free and $8 per user Core tiers make it especially accessible to very small teams."
    }
  ]
};

export default factorialVsHibobVsPersonioContent;
