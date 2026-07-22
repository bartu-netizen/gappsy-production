import type { ToolComparisonContent } from './types';

const fullstoryVsLogrocketContent: ToolComparisonContent = {
  "verdict": "FullStory offers a free-forever plan (30,000 monthly sessions, 12-month retention) with all paid tiers requiring a custom quote, while LogRocket publishes a concrete starting price ($176/month) but only a 14-day free trial rather than a permanent free tier. FullStory leans on StoryAI for natural-language querying of behavioral data; LogRocket leans on Galileo AI for automatically prioritizing and explaining errors with reproduction steps. The better fit depends on whether a team values a durable free tier or transparent entry pricing, and whether the priority is behavioral analytics or error/issue triage.",
  "bestForToolA": "Teams that want to start on a genuinely free, ongoing plan with a meaningful session volume (30,000/month) and are comfortable requesting a custom quote once they outgrow it, and who value AI-driven behavioral insight querying via StoryAI.",
  "bestForToolB": "Teams that want a published starting price ($176/month) to budget against, dedicated error tracking alongside session replay, and Galileo AI's automatic issue prioritization with reproduction steps for engineering triage.",
  "whoNeedsBoth": "A product organization might use FullStory's free tier for broad behavioral/product analytics across the whole site while engineering separately runs LogRocket for its error-tracking and reproduction-step workflow — the facts support both being used for different purposes rather than as substitutes.",
  "keyDifferences": [
    {
      "title": "Free tier durability",
      "toolA": "FullstoryFree is a free-forever plan with 30,000 monthly sessions and 12-month retention for up to 10 users, no credit card required.",
      "toolB": "Offers a 14-day free trial with full feature access, not a permanent free tier.",
      "whyItMatters": "Teams wanting to run indefinitely on a free tier without ongoing cost have that option only with FullStory in these facts.",
      "benefitsWho": "Early-stage or budget-constrained teams that want long-term free usage rather than a time-boxed trial."
    },
    {
      "title": "Pricing transparency",
      "toolA": "All paid tiers (Business, Advanced, Enterprise) are custom, contact-sales pricing with nothing published.",
      "toolB": "Core plan starts at a published $176/month, scaling with session capture volume up to roughly $765/month before Enterprise custom pricing.",
      "whyItMatters": "Teams that want to estimate cost without a sales call get a concrete starting number from LogRocket that FullStory doesn't provide.",
      "benefitsWho": "Teams evaluating cost early in a purchasing process without engaging sales."
    },
    {
      "title": "AI feature focus",
      "toolA": "StoryAI turns behavioral data into insights teams can query directly, in natural language.",
      "toolB": "Galileo AI automatically watches every session, surfaces impactful issues, and delivers reproduction steps.",
      "whyItMatters": "StoryAI is oriented toward exploratory, natural-language analytics questions; Galileo AI is oriented toward proactively triaging and reproducing specific issues.",
      "benefitsWho": "Product/analytics teams (StoryAI) versus engineering teams triaging bugs (Galileo AI)."
    },
    {
      "title": "Dedicated error tracking",
      "toolA": "Error tracking is not listed as a distinct feature; the platform is framed around session replay, product analytics, and heatmaps.",
      "toolB": "Error tracking is an explicit core feature, identifying frequent errors, crashes, and network failures alongside session replay.",
      "whyItMatters": "Engineering teams specifically needing bug/crash tracking as a first-class feature (not just qualitative session viewing) are better served by LogRocket per these facts.",
      "benefitsWho": "Engineering teams whose primary need is diagnosing errors and crashes rather than broader product analytics."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Analytics Features",
      "rows": [
        {
          "feature": "Session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Product analytics / funnels",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Heatmaps / clickmaps",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Error tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Supplementary Product Features",
      "rows": [
        {
          "feature": "Mobile app analytics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "In-product guides and surveys",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Natural-language querying of behavioral data",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FullStory's StoryAI."
        },
        {
          "feature": "Automatic issue prioritization with reproduction steps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "LogRocket's Galileo AI."
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free-forever tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "LogRocket offers only a 14-day free trial."
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted deployment option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on LogRocket's Enterprise plan."
        },
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does FullStory have a free plan?",
      "answer": "Yes, FullstoryFree offers 30,000 monthly sessions and 12 months of retention for up to 10 users, no credit card required."
    },
    {
      "question": "Does LogRocket offer a free trial?",
      "answer": "Yes, a 14-day free trial with full feature access is available."
    },
    {
      "question": "How much do FullStory's paid plans cost?",
      "answer": "Pricing is custom; you need to request pricing and a demo from FullStory."
    },
    {
      "question": "How much does LogRocket cost?",
      "answer": "The Core plan starts at $176/month, with pricing scaling based on session capture volume; Enterprise is custom-priced."
    },
    {
      "question": "What is StoryAI?",
      "answer": "FullStory's AI feature that transforms behavioral data into insights teams can query in natural language."
    },
    {
      "question": "What does Galileo AI do?",
      "answer": "Galileo AI watches every session, analyzes severity across real sessions, and delivers reproduction steps so teams can act on issues quickly."
    }
  ]
};

export default fullstoryVsLogrocketContent;
