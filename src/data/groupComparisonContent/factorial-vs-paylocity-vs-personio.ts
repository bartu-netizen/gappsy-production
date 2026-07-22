import type { GroupComparisonContent } from './types';

const factorialVsPaylocityVsPersonioContent: GroupComparisonContent = {
  "verdict": "Factorial, Paylocity and Personio all combine payroll with broader HR and talent tools, but they are built around different home markets: Factorial and Personio are European-first platforms with deep multi-country compliance, while Paylocity is a US-focused, publicly traded HCM suite with a longer operating history and a distinct mobile-first, social-feed approach to employee engagement. Choosing between them comes down to where the workforce is located and how much pricing transparency a buyer needs upfront.",
  "bestFor": {
    "factorial": "European SMBs that want to start free on document management and e-signature and expand into paid HR, payroll and IT hubs only as needed.",
    "paylocity": "US-based mid-market employers that want a single, mobile-first HCM suite with strong benefits administration and a long-established, publicly traded vendor.",
    "personio": "European small and mid-sized businesses needing built-in payroll and labor-law compliance across many individual European countries in one platform."
  },
  "highlights": [
    {
      "title": "Factorial is the only one with a genuine free plan",
      "description": "Factorial's Free tier covers document management and e-signature at no cost, while Paylocity and Personio both require a sales quote before a business can start on any tier.",
      "toolSlugs": [
        "factorial"
      ]
    },
    {
      "title": "Paylocity is the only publicly traded company of the three",
      "description": "Paylocity has traded on NASDAQ as PCTY since its 2014 IPO and has been operating since 1997, giving it a longer public operating history than either Factorial or Personio, both founded in the mid-2010s.",
      "toolSlugs": [
        "paylocity"
      ]
    },
    {
      "title": "Paylocity adds a social-style engagement feed that Factorial and Personio don't document",
      "description": "Paylocity's Community engagement feed provides peer recognition and company announcements in a social-media-style format aimed at distributed and frontline workforces, a feature neither Factorial nor Personio lists among its own tools.",
      "toolSlugs": [
        "paylocity"
      ]
    },
    {
      "title": "Factorial and Personio both go deeper on built-in European payroll compliance",
      "description": "Both platforms build multi-country European labor-law compliance directly into their payroll engines, while Paylocity's payroll and tax-filing coverage is documented specifically for the United States.",
      "toolSlugs": [
        "factorial",
        "personio"
      ]
    },
    {
      "title": "Pricing transparency differs across all three",
      "description": "Factorial publishes a Core starting price of around $8 per user per month, Paylocity's per-employee pricing is available only through third-party estimates of roughly $20 to $40, and Personio publishes no pricing at all.",
      "toolSlugs": [
        "factorial",
        "paylocity",
        "personio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR and Payroll",
      "rows": [
        {
          "feature": "Employee records and onboarding workflows",
          "statuses": {
            "factorial": "available",
            "paylocity": "available",
            "personio": "available"
          }
        },
        {
          "feature": "Payroll processing and tax compliance",
          "statuses": {
            "factorial": "available",
            "paylocity": "available",
            "personio": "available"
          },
          "note": "Paylocity's payroll and tax-filing coverage is built specifically for the United States, while Factorial and Personio focus on European jurisdictions."
        },
        {
          "feature": "Benefits administration",
          "statuses": {
            "factorial": "not-documented",
            "paylocity": "available",
            "personio": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Talent and Engagement",
      "rows": [
        {
          "feature": "Recruiting and applicant tracking (ATS)",
          "statuses": {
            "factorial": "available",
            "paylocity": "available",
            "personio": "available"
          }
        },
        {
          "feature": "Performance management and reviews",
          "statuses": {
            "factorial": "available",
            "paylocity": "available",
            "personio": "available"
          }
        },
        {
          "feature": "Employee engagement tools",
          "statuses": {
            "factorial": "available",
            "paylocity": "available",
            "personio": "not-documented"
          },
          "note": "Factorial offers engagement surveys under its Talent hub and Paylocity has a Community engagement feed; Personio's documented feature set has no direct equivalent."
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
            "paylocity": "limited",
            "personio": "unavailable"
          },
          "note": "Paylocity's per-employee figures come only from third-party estimates rather than an official published rate card; Personio publishes no pricing at all."
        },
        {
          "feature": "Free plan",
          "statuses": {
            "factorial": "available",
            "paylocity": "unavailable",
            "personio": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Factorial, Paylocity and Personio is built primarily for US employers?",
      "answer": "Paylocity is the US-focused option, with payroll and tax filing built specifically for federal, state and local US compliance. Factorial and Personio are both European-first platforms with deep multi-country EU compliance instead."
    },
    {
      "question": "Does any of these three have a free plan?",
      "answer": "Only Factorial offers a free plan, limited to document management and e-signature. Paylocity and Personio both require a sales quote before a business can start on any tier."
    },
    {
      "question": "Which company is publicly traded?",
      "answer": "Paylocity is the only one of the three that is publicly traded, listed on NASDAQ under the ticker PCTY since its 2014 IPO."
    },
    {
      "question": "Which tool has clearer published pricing?",
      "answer": "Factorial is the most transparent, publishing a Core plan starting around $8 per user per month. Paylocity's pricing is only available through third-party estimates, and Personio publishes no pricing at all, requiring a sales conversation for every deal."
    },
    {
      "question": "Which tool has built-in employee engagement features?",
      "answer": "Paylocity includes a Community engagement feed for peer recognition and announcements, and Factorial offers engagement surveys as part of its Talent hub. Personio's documented feature set does not include a comparable engagement tool."
    },
    {
      "question": "Which is best for a company with both European and US employees?",
      "answer": "None of the three is a perfect fit for both regions out of the box: Factorial and Personio are strongest on European payroll and compliance, while Paylocity's payroll coverage is documented specifically for the United States, so a mixed-geography company should evaluate multi-country support carefully before committing to any one of them."
    }
  ]
};

export default factorialVsPaylocityVsPersonioContent;
