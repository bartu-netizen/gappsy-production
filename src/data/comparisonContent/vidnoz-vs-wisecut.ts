import type { ToolComparisonContent } from './types';

const vidnozVsWisecutContent: ToolComparisonContent = {
  "verdict": "Vidnoz and Wisecut are both AI video tools, but they target different production stages: Vidnoz generates presenter-led avatar videos from a huge library of avatars, voices, and templates, while Wisecut repurposes existing long-form recordings into short clips with automated highlight detection and channel monitoring. They solve adjacent but distinct problems rather than competing head-to-head.",
  "bestForToolA": "Teams that need to generate presenter-style videos from scratch using AI avatars, want a very large voice/template library, and need translation/dubbing into 140+ languages.",
  "bestForToolB": "YouTubers, podcasters, or marketers who already have long-form recordings and want automatic highlight detection, silence removal, and — via the Autopilot plan — hands-off monitoring of a YouTube channel for new clips.",
  "whoNeedsBoth": "A creator could generate an avatar-led explainer with Vidnoz and separately run their long-form livestreams or podcasts through Wisecut's Autopilot to auto-generate short clips.",
  "keyDifferences": [
    {
      "title": "Generating avatar video vs. repurposing existing footage",
      "toolA": "Built around a library of 1,900+ AI avatars, 2,000+ voices, and 2,800+ templates for generating new presenter-led videos.",
      "toolB": "Built around AI Highlight Detection and Silence Removal to turn existing long recordings into short, edited clips.",
      "whyItMatters": "The starting material differs — Vidnoz creates video from avatars/templates, Wisecut edits video you already recorded.",
      "benefitsWho": "Users without existing footage benefit from Vidnoz's generative approach; users with existing long-form recordings benefit from Wisecut's editing approach."
    },
    {
      "title": "Pricing model: per-credit vs. flat monthly tiers",
      "toolA": "Paid tiers are credit-based at $2/credit (e.g., Starter includes 15 credits/month, Business 30 credits/month).",
      "toolB": "Flat monthly tiers with clearly stated minute allowances, starting at $15.75/month for 480 minutes.",
      "whyItMatters": "Credit-based pricing can be harder to map to actual usage than a flat minutes-per-month allowance.",
      "benefitsWho": "Buyers wanting predictable monthly costs benefit from Wisecut's flat-tier structure; buyers with irregular usage may prefer Vidnoz's credit model."
    },
    {
      "title": "Channel-monitoring automation",
      "toolA": "No automated channel-monitoring feature is documented.",
      "toolB": "Autopilot plan ($49/month) monitors a YouTube channel and automatically creates and schedules new clips.",
      "whyItMatters": "Hands-off monitoring removes the need to manually upload each new long-form video for clipping.",
      "benefitsWho": "High-volume YouTubers/podcasters benefit specifically from Wisecut's Autopilot automation."
    },
    {
      "title": "Translation and dubbing language coverage",
      "toolA": "Translates and dubs videos into 140+ languages with lip-sync.",
      "toolB": "Auto captions and translation are supported, but no specific language count is documented.",
      "whyItMatters": "Teams localizing to many markets need documented, broad language coverage.",
      "benefitsWho": "Global localization teams benefit from Vidnoz's stated 140+ language dubbing support."
    },
    {
      "title": "Headquarters location",
      "toolA": "No headquarters location documented.",
      "toolB": "Based in Miami, FL, US.",
      "whyItMatters": "Some buyers factor vendor location into support-hours or jurisdiction decisions.",
      "benefitsWho": "Buyers with a preference for documented, US-based vendors can use this to inform their choice with Wisecut."
    }
  ],
  "featureMatrix": [
    {
      "group": "Video Creation & Editing",
      "rows": [
        {
          "feature": "AI avatar generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Vidnoz states 1,900+ avatars"
        },
        {
          "feature": "AI highlight detection (clipping)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Silence removal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Auto reframe (vertical/square/horizontal)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Video translation & dubbing",
          "toolA": "available",
          "toolB": "available",
          "note": "Vidnoz: 140+ languages; Wisecut: language count not documented"
        }
      ]
    },
    {
      "group": "Automation & Publishing",
      "rows": [
        {
          "feature": "Channel-monitoring automation (Autopilot)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Social media auto-posting/scheduling",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Requires Wisecut's Starter+ or Professional+ plans"
        },
        {
          "feature": "Team collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Vidnoz's Business plan supports up to 1,000 users"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Vidnoz: daily credits, 3-min cap, watermark; Wisecut: 30 min/month, 7-day project expiry"
        },
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Vidnoz is per-credit ($2/credit); Wisecut is flat monthly tiers"
        },
        {
          "feature": "Compliance certification stated",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Vidnoz states ISO/IEC 27001:2022 compliance"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Vidnoz free?",
      "answer": "Yes, the free plan grants daily credits with 720p export and videos capped at 3 minutes."
    },
    {
      "question": "Is there a free plan for Wisecut?",
      "answer": "Yes, with 30 minutes/month of processing; projects expire after 7 days."
    },
    {
      "question": "Does Vidnoz support video translation?",
      "answer": "Yes, Vidnoz translates and dubs videos into 140+ languages with lip-sync."
    },
    {
      "question": "What is Wisecut's Autopilot plan?",
      "answer": "A $49/month plan that monitors a YouTube channel and automatically creates and schedules clips."
    },
    {
      "question": "Does Wisecut support 4K export?",
      "answer": "Yes, on the Professional and Professional+ plans."
    },
    {
      "question": "Where is Wisecut based?",
      "answer": "Miami, FL, US."
    }
  ]
};

export default vidnozVsWisecutContent;
