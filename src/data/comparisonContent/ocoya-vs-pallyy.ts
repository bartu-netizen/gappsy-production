import type { ToolComparisonContent } from './types';

const ocoyaVsPallyyContent: ToolComparisonContent = {
  "verdict": "Ocoya and Pallyy both offer content calendars and approval workflows, but differ on AI depth and free access. Ocoya bundles AI content and caption generation, pre-built AI agent automation templates (auto-posting, DM replies, comment-to-DM conversion), and Canva/Unsplash/Giphy integration, starting at $15/month after a 7-day trial. Pallyy's facts describe no AI features, but it offers a genuine free plan (15 posts/month, 1 account) and was founded in 2019 in Australia, with paid tiers also starting at $15/month. Teams that want AI-driven automation will prefer Ocoya; teams wanting a simple, no-cost starting point without AI complexity will prefer Pallyy.",
  "bestForToolA": "Teams wanting AI-powered automation — caption and image generation, automated DM replies, comment-to-DM conversion — plus built-in Canva, Unsplash, and Giphy access, who don't mind starting with a 7-day trial rather than a free plan.",
  "bestForToolB": "Individuals or small teams wanting a genuine free plan to start scheduling immediately (15 posts/month, 1 social account) with a simple unified inbox and link-in-bio pages, without needing AI features.",
  "whoNeedsBoth": "A social team that wants Pallyy's free tier for a small side brand and Ocoya's AI automation for a primary, higher-volume brand might reasonably run both.",
  "keyDifferences": [
    {
      "title": "Free access",
      "toolA": "No permanent free plan, only a 7-day free trial.",
      "toolB": "Free plan with 15 posts/month and 1 social account, no credit card required.",
      "whyItMatters": "A genuine free tier lets budget-constrained users use the tool indefinitely rather than facing a trial cutoff.",
      "benefitsWho": "Solo creators and hobbyists testing tools long-term without payment."
    },
    {
      "title": "AI capabilities",
      "toolA": "Includes AI content and caption generation, plus AI agent automation templates for posting, DM replies, and comment-to-DM conversion.",
      "toolB": "Facts state no AI features are mentioned on the site.",
      "whyItMatters": "Teams wanting AI-driven content creation or automated engagement need a tool that documents these capabilities.",
      "benefitsWho": "Teams wanting to automate content creation and engagement responses."
    },
    {
      "title": "Company transparency",
      "toolA": "No founding year or headquarters documented in available facts.",
      "toolB": "Founded in 2019, headquartered in Australia (Pallyy PTY LTD).",
      "whyItMatters": "Vendor due diligence sometimes requires company background information.",
      "benefitsWho": "Procurement teams vetting vendor legitimacy."
    },
    {
      "title": "Scale ceiling",
      "toolA": "Scales up to 150 social profiles and 50 users on the Diamond plan.",
      "toolB": "Largest documented tier (Scale) supports 30 social sets and 10 users.",
      "whyItMatters": "Large agencies managing many client profiles need higher account ceilings.",
      "benefitsWho": "Large agencies managing dozens of client accounts."
    },
    {
      "title": "Approval workflows",
      "toolA": "Supports multi-level internal, client, and stakeholder approval workflows.",
      "toolB": "Supports approval and scheduling via its calendar, but higher tiers are needed for multiple team members, per the facts.",
      "whyItMatters": "Multi-level, stakeholder-specific sign-off differs from a single-tier team approval flow.",
      "benefitsWho": "Agencies needing formal, multi-stage client sign-off processes."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & AI",
      "rows": [
        {
          "feature": "AI caption/content generation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Pallyy: no AI features mentioned on the site."
        },
        {
          "feature": "AI automation agents (DM replies, comment-to-DM)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Content calendar with best-time-to-post",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Media library integrations (Canva/Unsplash/Giphy)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Team & Access",
      "rows": [
        {
          "feature": "Unified inbox",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Link in bio",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-level approval workflows",
          "toolA": "available",
          "toolB": "limited",
          "note": "Pallyy: multiple team members require higher tiers."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "15 posts/month, 1 account."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Both start at $15/month."
        },
        {
          "feature": "Top-tier scale",
          "toolA": "available",
          "toolB": "available",
          "note": "150 profiles/50 users vs. 30 social sets/10 users."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Ocoya offer a free trial?",
      "answer": "Yes, all paid plans include a 7-day free trial with full feature access."
    },
    {
      "question": "Does Pallyy have a free plan?",
      "answer": "Yes, a free plan with 15 posts/month and 1 social account."
    },
    {
      "question": "Where is Pallyy based?",
      "answer": "Australia, operated by Pallyy PTY LTD, founded in 2019."
    },
    {
      "question": "Does Ocoya include AI content generation?",
      "answer": "Yes, AI tools for caption writing, image generation, translation, and rephrasing."
    },
    {
      "question": "What social platforms does Ocoya support?",
      "answer": "Facebook, Instagram, X, and Pinterest, among 30+ integrations."
    },
    {
      "question": "Can I cancel Pallyy anytime?",
      "answer": "Yes, users can upgrade, downgrade, or cancel anytime without penalty."
    }
  ]
};

export default ocoyaVsPallyyContent;
