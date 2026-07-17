import type { ToolComparisonContent } from './types';

const benchmarkEmailVsEmailoctopusContent: ToolComparisonContent = {
  "verdict": "Benchmark Email and EmailOctopus are both freemium email marketing tools with drag-and-drop builders, but EmailOctopus offers a larger free-tier ceiling, a cheaper entry paid plan ($9 vs. $27/month), unlimited users on its Pro plan, and 1,000+ integrations, while Benchmark Email cites larger recognizable customers and includes real-time reporting and mobile-first design as named features. The choice largely comes down to budget and team size versus brand-scale reference customers.",
  "bestForToolA": "Teams that value being in the same customer base as large brands (FedEx, Panasonic, Samsung) and don't mind paying per additional user beyond the 1 included on Pro.",
  "bestForToolB": "Budget-conscious small teams or nonprofits that want a bigger free tier, a cheaper $9/month entry paid plan, unlimited users, and broad third-party integrations.",
  "whoNeedsBoth": "The facts don't describe a complementary use case — these are largely substitutable, general-purpose email marketing tools serving the same core job, so most teams would pick one rather than run both.",
  "keyDifferences": [
    {
      "title": "Free Plan Subscriber Ceiling",
      "toolA": "Benchmark Email's free plan covers up to 500 contacts and 2,500 sends per month.",
      "toolB": "EmailOctopus's free plan covers up to 2,500 subscribers and 10,000 emails per month.",
      "whyItMatters": "EmailOctopus's free tier goes roughly 5x further before requiring an upgrade.",
      "benefitsWho": "Early-stage senders wanting to stay free longer as their list grows."
    },
    {
      "title": "Entry Paid Price",
      "toolA": "Benchmark Email's Pro plan starts at $27/month.",
      "toolB": "EmailOctopus's Pro plan starts at $9/month.",
      "whyItMatters": "A roughly 3x difference in entry paid pricing affects which is more budget-friendly for small senders moving off a free plan.",
      "benefitsWho": "Cost-sensitive small businesses and solo marketers."
    },
    {
      "title": "Integration Breadth",
      "toolA": "Benchmark Email's facts don't list a specific integration count or catalog.",
      "toolB": "EmailOctopus documents 1,000+ third-party integrations.",
      "whyItMatters": "Broader integration support reduces custom development work to connect other tools.",
      "benefitsWho": "Teams relying on many existing SaaS tools that need to sync with their email platform."
    },
    {
      "title": "Team Seats on Entry Paid Plan",
      "toolA": "Benchmark Email's Pro plan includes 1 user, with additional users at $15/month each (up to 10 total).",
      "toolB": "EmailOctopus's Pro plan includes unlimited users.",
      "whyItMatters": "Teams with multiple people sending campaigns face materially different per-seat costs.",
      "benefitsWho": "Small marketing teams with more than one person needing account access."
    },
    {
      "title": "Nonprofit Discount",
      "toolA": "Benchmark Email's facts don't mention a nonprofit discount program.",
      "toolB": "EmailOctopus offers a documented 20% lifetime discount for nonprofits.",
      "whyItMatters": "Relevant for nonprofit organizations comparing long-term cost.",
      "benefitsWho": "Nonprofit and mission-driven organizations."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Drag-and-drop editor",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Segmentation",
          "toolA": "available",
          "toolB": "available",
          "note": "Benchmark: lists/tags/segmentation. EmailOctopus: tags and custom fields."
        },
        {
          "feature": "Personalization (dynamic content)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Signup forms / landing pages",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No branding on free plan",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "EmailOctopus's facts state its free plan carries EmailOctopus branding, removed on Pro."
        },
        {
          "feature": "Full report retention on free plan",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "EmailOctopus's free plan retains reports for 30 days versus indefinitely on Pro."
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Benchmark Email $27/month; EmailOctopus $9/month."
        },
        {
          "feature": "Unlimited users on entry paid plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Benchmark Email's Pro includes 1 user; extra users cost $15/month each."
        }
      ]
    },
    {
      "group": "Integrations & Scale",
      "rows": [
        {
          "feature": "Documented integration count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1,000+ integrations."
        },
        {
          "feature": "Nonprofit discount",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "20% lifetime discount."
        },
        {
          "feature": "Enterprise tier for very large lists",
          "toolA": "available",
          "toolB": "available",
          "note": "Benchmark: 100,000+ contacts via sales. EmailOctopus: custom pricing above 500,000 subscribers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do both have permanent free plans?",
      "answer": "Yes — Benchmark Email's free plan covers up to 500 contacts and 2,500 sends per month; EmailOctopus's free plan covers up to 2,500 subscribers and 10,000 emails per month."
    },
    {
      "question": "What does each entry-level paid plan cost?",
      "answer": "Benchmark Email's Pro plan starts at $27/month; EmailOctopus's Pro plan starts at $9/month, billed annually."
    },
    {
      "question": "How many integrations does each offer?",
      "answer": "EmailOctopus documents over 1,000 third-party integrations; Benchmark Email's facts don't state a specific integration count."
    },
    {
      "question": "Are there extra costs for additional team members?",
      "answer": "Benchmark Email charges $15/month per additional user beyond the 1 included on Pro (up to 10 total); EmailOctopus's Pro plan includes unlimited users."
    },
    {
      "question": "Is there a nonprofit discount?",
      "answer": "EmailOctopus offers a 20% lifetime discount for nonprofits; Benchmark Email's facts don't mention a nonprofit program."
    }
  ]
};

export default benchmarkEmailVsEmailoctopusContent;
