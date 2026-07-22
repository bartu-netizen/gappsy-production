import type { ToolComparisonContent } from './types';

const bonuslyVsPerkboxContent: ToolComparisonContent = {
  "verdict": "Bonusly and Perkbox both sit in the employee rewards space but with different emphasis. Bonusly is a peer-to-peer recognition platform with transparent pricing (free up to 8 users, then $3/user/month) built around social recognition and a rewards catalog. Perkbox is broader employee benefits and rewards platform emphasizing discounts, wellbeing support, and salary sacrifice benefit schemes, with pricing entirely unpublished and notable clients like Oxford University Hospitals NHS and Bosch.",
  "bestForToolA": "Bonusly fits teams wanting transparent, self-serve pricing for peer-to-peer recognition, starting free for up to 8 users and scaling to $3-5/user/month, with an API and Slack/Microsoft Teams integration.",
  "bestForToolB": "Perkbox fits organizations wanting a broader benefits package combining employee discounts, wellbeing support, and salary sacrifice schemes alongside recognition, and reports a 89% employee activation rate and £27.8+ million in employee savings.",
  "whoNeedsBoth": "A company could plausibly run both: Perkbox for its discount marketplace, wellbeing resources, and salary sacrifice benefits, and Bonusly layered on top for its lighter-weight, Slack-integrated peer-to-peer recognition feed, since the two emphasize different halves of total rewards.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Bonusly publishes exact pricing: free for up to 8 users, Team at $3/user/month, Team + Bizy AI at $5/user/month, and custom Organization pricing.",
      "toolB": "Perkbox does not publish pricing at all; the site asks visitors to fill out a form for a custom quote.",
      "whyItMatters": "Transparent pricing lets buyers budget and compare before a sales call, which is only available on one of these platforms.",
      "benefitsWho": "Procurement-constrained SMBs benefit from Bonusly's published rates; Perkbox's model instead suits buyers already planning a sales-led evaluation."
    },
    {
      "title": "Core Value Proposition",
      "toolA": "Bonusly centers on peer-to-peer recognition in a shared feed, redeemable for gift cards, cash, or catalog rewards.",
      "toolB": "Perkbox centers on employee discounts and savings at partner brands, plus wellbeing support and salary sacrifice benefit schemes, with recognition & rewards as one feature among several.",
      "whyItMatters": "Buyers should match the platform to their primary goal — social recognition culture versus a broader discounts/benefits package.",
      "benefitsWho": "Culture-focused HR teams benefit from Bonusly's recognition-first design; total-rewards/benefits teams benefit from Perkbox's discounts-and-wellbeing focus."
    },
    {
      "title": "Reported Impact Metrics",
      "toolA": "Bonusly reports being used by 3,400+ organizations, per the company, without a specific savings or activation-rate figure documented.",
      "toolB": "Perkbox reports an 89% employee activation rate, £27.8+ million in annual employee savings, and 106,938+ recognitions sent in the past year, per the company.",
      "whyItMatters": "Documented usage and savings metrics can help buyers gauge expected ROI and adoption benchmarks.",
      "benefitsWho": "Benefits teams building a business case with concrete ROI figures benefit from Perkbox's documented savings and activation data."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Bonusly's Bizy AI is an AI-powered feature available as an add-on ($2/user/month) or bundled into paid plans.",
      "toolB": "Perkbox's documented cons explicitly note no AI features are mentioned on the website.",
      "whyItMatters": "Teams wanting AI-assisted recognition workflows have a documented option in only one of these platforms.",
      "benefitsWho": "Teams wanting AI-enhanced recognition tooling benefit from Bonusly's Bizy AI, since Perkbox has no equivalent documented."
    },
    {
      "title": "Wellbeing and Salary Sacrifice Benefits",
      "toolA": "Bonusly's documented feature set does not include wellbeing support or salary sacrifice benefit schemes.",
      "toolB": "Perkbox offers dedicated Wellbeing Support (mental, physical, financial wellness resources) and Salary Sacrifice Benefits through protected benefit schemes.",
      "whyItMatters": "Organizations building a total-rewards package that includes formal wellbeing and tax-advantaged benefit schemes need a platform that documents these specifically.",
      "benefitsWho": "UK-style benefits programs relying on salary sacrifice schemes benefit specifically from Perkbox's documented capability."
    }
  ],
  "featureMatrix": [
    {
      "group": "Recognition & Rewards",
      "rows": [
        {
          "feature": "Peer-to-peer recognition",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Rewards catalog (gift cards, cash)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automated celebrations/milestones",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Admin dashboard for benefits management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Benefits & Wellbeing",
      "rows": [
        {
          "feature": "Employee discounts at partner brands",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Wellbeing support (mental/physical/financial)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Salary sacrifice benefit schemes",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Culture & communication tools",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, AI & Integrations",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bonusly free plan covers up to 8 users."
        },
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bonusly starts at $3/user/month."
        },
        {
          "feature": "AI-powered features",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bonusly's Bizy AI; Perkbox documents no AI features."
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bonusly or Perkbox cheaper?",
      "answer": "Bonusly publishes exact pricing starting free for up to 8 users and $3/user/month for the Team plan. Perkbox does not publish any pricing and requires filling out an inquiry form for a custom quote, so a direct cost comparison isn't possible from public information."
    },
    {
      "question": "Does Perkbox include peer recognition like Bonusly?",
      "answer": "Yes, Perkbox includes peer-to-peer recognition and celebration tools alongside its discounts and benefits, but recognition is one feature among several rather than the platform's primary focus, unlike Bonusly."
    },
    {
      "question": "Which platform offers employee discounts?",
      "answer": "Perkbox is built around employee discounts and savings at partner brands, along with wellbeing support and salary sacrifice benefit schemes. Bonusly's documented feature set does not include a discounts marketplace."
    },
    {
      "question": "Does either platform have AI features?",
      "answer": "Bonusly offers Bizy AI as an add-on ($2/user/month) or bundled into paid plans. Perkbox's documented cons explicitly state no AI features are mentioned on its website."
    },
    {
      "question": "What impact metrics does each company report?",
      "answer": "Perkbox reports an 89% employee activation rate, over £27.8 million in annual employee savings, and 106,938+ recognitions sent in the past year. Bonusly reports usage by 3,400+ organizations, without an equivalent savings or activation figure documented."
    },
    {
      "question": "Who are notable customers of each platform?",
      "answer": "Perkbox names clients including Oxford University Hospitals NHS, Bosch, Schuh, Footasylum, and Optiver. Specific named customers are not documented in Bonusly's available facts."
    }
  ]
};

export default bonuslyVsPerkboxContent;
