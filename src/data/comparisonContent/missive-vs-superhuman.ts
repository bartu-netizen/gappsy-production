import type { ToolComparisonContent } from './types';

const missiveVsSuperhumanContent: ToolComparisonContent = {
  "verdict": "Missive and Superhuman both offer AI-assisted email tooling, but they target different layers of the job. Missive is built around shared team inboxes, internal comments, and task conversion from its cheapest tier ($14/user/month), with SOC 2 Type II compliance on every plan and support for multiple AI providers (Anthropic, OpenAI, Gemini) — but it has no free plan, only a 30-day trial. Superhuman has a genuine free tier with AI chat, Grammarly writing help, and Docs, but its actual fast email client, Superhuman Mail, is only unlocked on the $33-40/month Business plan.",
  "bestForToolA": "Teams needing a shared team inbox with internal comments and task conversion from day one, multi-AI-provider flexibility, and SOC 2 Type II compliance on every plan including the cheapest tier.",
  "bestForToolB": "Individuals or teams primarily wanting fast AI-assisted writing (Grammarly-powered) and a collaborative Docs tool who can start free, with the classic fast Superhuman Mail client available once they upgrade to Business.",
  "whoNeedsBoth": "A company might use Missive for a shared support or sales team inbox — its core purpose — while individual employees separately use Superhuman's free or Pro tier for personal AI writing assistance and Docs, since the two tools serve different layers: team inbox collaboration versus individual fast-email and writing productivity.",
  "keyDifferences": [
    {
      "title": "What's included at the entry tier",
      "toolA": "Shared team inboxes, internal comments, and task conversion are available from the $14/user/month Starter plan.",
      "toolB": "Superhuman Mail itself (the fast email client) is only included on the $33/month (annual) Business plan — Free and Pro tiers offer AI chat, Grammarly writing help, and Docs, not the email client.",
      "whyItMatters": "Missive's cheapest tier already delivers its core team-inbox product; Superhuman's cheapest tiers don't include its namesake email client at all.",
      "benefitsWho": "Teams wanting collaborative email immediately (Missive) versus users content starting with AI writing/Docs before paying for Mail (Superhuman)."
    },
    {
      "title": "Free-tier availability",
      "toolA": "No free plan — only a 30-day free trial with no credit card required.",
      "toolB": "Has a genuine Free plan with AI chat across apps, Grammarly writing assistance, and collaborative Docs.",
      "whyItMatters": "Superhuman lets users stay on a permanent free tier indefinitely; Missive requires payment after the trial period ends.",
      "benefitsWho": "Individuals wanting an indefinite free option (Superhuman) versus teams comfortable committing after a trial (Missive)."
    },
    {
      "title": "AI provider flexibility",
      "toolA": "AI assistant explicitly supports multiple providers — Anthropic, OpenAI, and Gemini — rather than locking into one.",
      "toolB": "AI features (Go, Grammarly-powered writing) are Superhuman's own proprietary assistants; it's described as compatible with Claude, ChatGPT, and Cursor as external tools rather than switchable model providers within Superhuman.",
      "whyItMatters": "Missive lets teams choose or mix AI model providers; Superhuman's AI experience is built around its own Grammarly-integrated assistant.",
      "benefitsWho": "Teams with a preferred AI vendor or compliance requirement around model choice."
    },
    {
      "title": "Compliance documentation",
      "toolA": "States SOC 2 Type II compliance on all plans, including the $14/user/month Starter tier.",
      "toolB": "No SOC 2 statement is documented; enterprise security controls (SAML SSO, custom roles) are reserved for the Enterprise plan only.",
      "whyItMatters": "Missive documents a security certification at every price point; Superhuman's security controls are reserved for its top tier without a stated certification.",
      "benefitsWho": "Security-conscious teams evaluating vendors regardless of plan tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Email & Inbox",
      "rows": [
        {
          "feature": "Shared/team inbox",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Fast individual email client",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Superhuman Mail is included only on the Business plan."
        },
        {
          "feature": "Internal comments on messages",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Task conversion from email",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Collaboration",
      "rows": [
        {
          "feature": "AI writing assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "Missive: multi-provider (Anthropic/OpenAI/Gemini). Superhuman: Grammarly-powered."
        },
        {
          "feature": "Cross-app AI assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Superhuman Go."
        },
        {
          "feature": "Collaborative docs tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Superhuman Docs."
        },
        {
          "feature": "Rules / automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Missive: up to 1,000 rules on Productive plan. Superhuman: unlimited automations on Business plan."
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Missive: 30 days, no credit card required."
        },
        {
          "feature": "SOC 2 Type II compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Missive states this on all plans."
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Missive: Business plan. Superhuman: Enterprise plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free version of Missive?",
      "answer": "No, Missive offers a 30-day free trial rather than a permanent free plan."
    },
    {
      "question": "How much does Missive cost?",
      "answer": "Starter is $14/user/month, Productive is $24/user/month, and Business is $36/user/month, each with a yearly discount option."
    },
    {
      "question": "Does Missive include AI features?",
      "answer": "Yes, all plans include an AI assistant with support for multiple AI providers."
    },
    {
      "question": "Is Superhuman free?",
      "answer": "There is a Free plan with AI chat, Grammarly, and Docs, but it does not include Superhuman Mail."
    },
    {
      "question": "How much does Superhuman cost?",
      "answer": "Pro is €12/member/month billed annually (€15/month billed monthly); Business, which includes Mail, is €33/member/month annually (€40/month monthly); Enterprise is custom-priced."
    },
    {
      "question": "What is Superhuman Go?",
      "answer": "Go is an AI assistant that works across connected apps to provide proactive, cross-application help."
    }
  ]
};

export default missiveVsSuperhumanContent;
