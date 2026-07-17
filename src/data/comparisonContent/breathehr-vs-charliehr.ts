import type { ToolComparisonContent } from './types';

const breathehrVsCharliehrContent: ToolComparisonContent = {
  "verdict": "BreatheHR and CharlieHR are both UK-focused SME HR platforms with free trials and no long-term contracts, but they differ in what's documented: CharlieHR publishes clear tiered per-employee pricing and bundles a large perks/discounts marketplace, while BreatheHR documents a broader core feature set including e-learning and rota/shift scheduling but doesn't have public pricing available in the facts.",
  "bestForToolA": "BreatheHR fits UK SMEs (up to 250 employees) that want e-learning with 100+ UK-specific training courses, rota and shift scheduling, and Xero payroll integration bundled into one HR platform with no long-term contract.",
  "bestForToolB": "CharlieHR fits UK startups and small businesses that want transparent, tiered per-employee pricing starting at £20/month, a built-in perks and discounts marketplace (30,000+ deals), and optional add-ons for recruiting (Charlie Recruit) or dedicated HR advisory (Charlie Advice).",
  "whoNeedsBoth": "Both target similar UK SME HR-admin needs, so the facts don't indicate a case for running both simultaneously -- a company would typically choose one as its core HR system of record.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "No numeric pricing is published in the facts; pricing page details were not accessible at time of review.",
      "toolB": "Published tiered pricing from £20/month (1-4 employees) up to £735/month (250+ employees).",
      "whyItMatters": "Transparent pricing lets prospects self-serve a budget estimate without contacting sales.",
      "benefitsWho": "Small businesses wanting to compare costs upfront before a sales conversation."
    },
    {
      "title": "E-learning / training content",
      "toolA": "Includes an e-learning platform with 100+ UK-specific training courses.",
      "toolB": "Not documented as offering e-learning content.",
      "whyItMatters": "Built-in compliance/skills training can reduce the need for a separate learning platform.",
      "benefitsWho": "UK SMEs wanting to consolidate HR admin and staff training in one tool."
    },
    {
      "title": "Perks and discounts marketplace",
      "toolA": "Not documented as including a perks/discounts marketplace.",
      "toolB": "Access to 30,000+ discounts and deals included in every subscription.",
      "whyItMatters": "An included perks marketplace can be used as an employee-retention benefit without extra procurement.",
      "benefitsWho": "Small teams wanting to offer employee perks without buying a separate benefits platform."
    },
    {
      "title": "Recruiting and HR-advisor add-ons",
      "toolA": "Not documented as offering recruiting or dedicated HR-advisor add-ons.",
      "toolB": "Offers Charlie Recruit (automated hiring workflows, from £55/month) and Charlie Advice (dedicated HR advisor with legal compliance checks, from £179/month) as paid add-ons.",
      "whyItMatters": "Named add-ons give a clear upgrade path for hiring or HR legal support without switching platforms.",
      "benefitsWho": "Growing SMEs that expect to need recruiting tools or HR legal guidance as they scale."
    },
    {
      "title": "Company ownership/history",
      "toolA": "Acquired by ELMO Cloud HR & Payroll in 2020; founded in 2012 and headquartered in Horsham, UK.",
      "toolB": "Founding year not disclosed; headquartered in London, UK.",
      "whyItMatters": "Ownership by a larger HR/payroll group can affect long-term product roadmap and support structure.",
      "benefitsWho": "Buyers evaluating vendor stability and roadmap continuity as part of procurement."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core HR Features",
      "rows": [
        {
          "feature": "Onboarding workflows",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Time off/holiday management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Performance management/reviews",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "E-learning / training courses",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BreatheHR includes 100+ UK-specific courses."
        },
        {
          "feature": "Rota and shift scheduling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Employee engagement polls",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Add-ons & Extras",
      "rows": [
        {
          "feature": "Perks & discounts marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "CharlieHR includes 30,000+ discounts in every plan."
        },
        {
          "feature": "Recruiting/ATS add-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Charlie Recruit, from £55/month."
        },
        {
          "feature": "Dedicated HR advisor add-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Charlie Advice, from £179/month."
        },
        {
          "feature": "Payroll integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BreatheHR integrates with Xero for payroll."
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "CharlieHR: £20/month for 1-4 employees."
        },
        {
          "feature": "Free trial (no card required)",
          "toolA": "available",
          "toolB": "available",
          "note": "CharlieHR: 7 days. BreatheHR: length not specified."
        },
        {
          "feature": "No long-term contract",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "BreatheHR explicitly states plans can be cancelled anytime."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does BreatheHR publish its pricing?",
      "answer": "No -- the facts note that public pricing details were not accessible on BreatheHR's pricing page at the time of review."
    },
    {
      "question": "How much does CharlieHR cost?",
      "answer": "CharlieHR starts from £20/month for 1-4 employees, scaling up to £735/month for 250+ employees, tiered by team size."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes. CharlieHR offers a 7-day free trial with no credit card required. BreatheHR offers a commitment-free trial that also doesn't require a credit card, though the exact trial length isn't specified."
    },
    {
      "question": "Which platform includes e-learning?",
      "answer": "BreatheHR includes an e-learning platform with 100+ UK-specific training courses. This isn't documented for CharlieHR."
    },
    {
      "question": "Does CharlieHR include employee perks?",
      "answer": "Yes, CharlieHR includes access to 30,000+ discounts and deals in every subscription."
    },
    {
      "question": "Who owns BreatheHR?",
      "answer": "BreatheHR was acquired by ELMO Cloud HR & Payroll in 2020."
    }
  ]
};

export default breathehrVsCharliehrContent;
