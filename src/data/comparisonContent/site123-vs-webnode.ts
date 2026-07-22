import type { ToolComparisonContent } from './types';

const site123VsWebnodeContent: ToolComparisonContent = {
  "verdict": "SITE123 and Webnode are both freemium website builders aimed at non-technical users, but they lean into different strengths. SITE123 uses a guided, wizard-style editor with a genuinely free-forever core plan, unlimited websites per account, 24/7 live chat support, and a 14-day money-back guarantee, though sites can't be downloaded since it's a closed, proprietary hosting platform. Webnode, founded in 2008, leads with an AI website generator that creates a starting site and content automatically, plus built-in booking, invoicing, and multilingual support aimed at service-based small businesses. The better fit depends on whether guided template building with strong support or AI-assisted generation with service-business tooling matters more.",
  "bestForToolA": "Users who want a guided, wizard-style building process, the ability to run multiple separate websites on one account, and 24/7 live chat support with a money-back guarantee.",
  "bestForToolB": "Service-based freelancers and small businesses that want an AI-generated starting site plus built-in appointment booking, invoicing, and payment acceptance.",
  "whoNeedsBoth": "An agency handling both service-based clients needing booking and invoicing and simpler clients wanting quick template-based sites with strong support might use Webnode for the former and SITE123 for the latter.",
  "keyDifferences": [
    {
      "title": "AI-assisted site generation",
      "toolA": "Not documented — uses a guided, wizard-style editor where users upload content into pre-built layouts.",
      "toolB": "Includes an AI website generator that instantly creates a starting site and can generate and edit content with AI.",
      "whyItMatters": "Users wanting the fastest possible starting point benefit from Webnode's AI generation versus manual wizard steps.",
      "benefitsWho": "Time-constrained small business owners who want a site generated quickly."
    },
    {
      "title": "Service-business tools: booking and invoicing",
      "toolA": "Not documented as a feature; instead offers an online store.",
      "toolB": "Includes built-in online booking and invoicing with payment acceptance.",
      "whyItMatters": "Service businesses that take appointments and bill clients directly need tools Webnode documents explicitly.",
      "benefitsWho": "Freelancers and service providers like consultants, therapists, or tutors."
    },
    {
      "title": "Company track record",
      "toolA": "Founding year and headquarters are not documented.",
      "toolB": "Founded in 2008, giving it a documented long operating track record.",
      "whyItMatters": "Buyers evaluating platform stability have more documented history available for Webnode.",
      "benefitsWho": "Businesses prioritizing platform longevity."
    },
    {
      "title": "Support and guarantees",
      "toolA": "Documents 24/7 live chat support and a 14-day money-back guarantee on paid plans.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Users wanting readily available support and a refund safety net have clearer documented options with SITE123.",
      "benefitsWho": "First-time site builders who may need hands-on support."
    },
    {
      "title": "Multiple websites per account",
      "toolA": "Explicitly documents no limit on the number of websites per account.",
      "toolB": "Not documented.",
      "whyItMatters": "Users managing several small sites (e.g., multiple projects or clients) benefit from SITE123's documented lack of a site limit.",
      "benefitsWho": "Freelancers or small agencies managing multiple simple sites."
    }
  ],
  "featureMatrix": [
    {
      "group": "Site Creation",
      "rows": [
        {
          "feature": "AI-generated starting site",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Wizard-style guided editor",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Drag-and-drop customization",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SEO tools",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Business Tools",
      "rows": [
        {
          "feature": "Online store / e-commerce",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Online booking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Invoicing and payments",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multilingual site support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Webnode advertises support for 25+ languages."
        }
      ]
    },
    {
      "group": "Plans, Support & Track Record",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both describe a permanent/free-forever core plan."
        },
        {
          "feature": "24/7 live chat support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SITE123 documents a 14-day money-back guarantee on paid plans."
        },
        {
          "feature": "Unlimited websites per account",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Founded year documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Webnode was founded in 2008."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either tool use AI to build the site?",
      "answer": "Webnode's AI website generator can instantly create a starting site and generate or edit content; SITE123 instead uses a wizard-style editor where users upload content into pre-built layouts, with no AI feature documented."
    },
    {
      "question": "Which tool supports online booking and invoicing?",
      "answer": "Webnode includes built-in online booking and invoicing with payment acceptance; these aren't documented as SITE123 features."
    },
    {
      "question": "Are both genuinely free to start?",
      "answer": "Yes. SITE123's core plan is free forever with no credit card required, and Webnode also offers a permanent free plan for building and hosting a site indefinitely."
    },
    {
      "question": "Can I create more than one website?",
      "answer": "SITE123 explicitly places no limit on the number of websites per account; this isn't addressed in Webnode's documented facts."
    },
    {
      "question": "Which company has a longer documented track record?",
      "answer": "Webnode was founded in 2008; SITE123's founding year and headquarters aren't documented."
    },
    {
      "question": "Is 24/7 support available?",
      "answer": "SITE123 documents 24/7 live chat support plus a 14-day money-back guarantee on paid plans; this isn't documented for Webnode."
    }
  ]
};

export default site123VsWebnodeContent;
