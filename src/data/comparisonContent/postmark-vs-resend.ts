import type { ToolComparisonContent } from './types';

const postmarkVsResendContent: ToolComparisonContent = {
  "verdict": "Postmark, founded in 2010 and now owned by ActiveCampaign, is a transactional-only email service with message streams that separate transactional from broadcast traffic and retention up to 365 days on paid tiers. Resend is a developer-focused email API with broader SDK coverage across 9 languages, a built-in MCP server for AI-client integration, and separate marketing-email pricing tracks, backed by SOC 2 Type II and GDPR compliance on all plans. The choice depends on whether long-established transactional focus or modern developer/AI tooling matters more.",
  "bestForToolA": "Teams that want a service dedicated specifically to transactional email deliverability, with message streams keeping transactional and broadcast traffic separated, and that need up to 365-day data retention on a paid tier.",
  "bestForToolB": "Developer teams that want broad SDK language coverage (9 languages including Go, Rust, .NET, Laravel), React Email component-based templates, an MCP server for AI client integration, and SOC 2 Type II/GDPR compliance included on every plan.",
  "whoNeedsBoth": "Teams sending both transactional emails and separate marketing campaigns from contact lists may use Resend's marketing track for campaigns while keeping Postmark's stream-separated transactional service for reliable order/receipt/notification email.",
  "keyDifferences": [
    {
      "title": "Company history and ownership",
      "toolA": "Founded in 2010, now owned by ActiveCampaign.",
      "toolB": "No founding year or parent company is documented in the facts reviewed.",
      "whyItMatters": "A longer, documented operating history and an established parent company can signal stability for teams prioritizing vendor longevity.",
      "benefitsWho": "Risk-averse buyers who weigh vendor track record in procurement decisions."
    },
    {
      "title": "Transactional vs. marketing email",
      "toolA": "Cons note it is primarily transactional-only, not a marketing campaign builder.",
      "toolB": "Offers separate Marketing (contact-based) pricing tracks — Free (1,000 contacts/month) and Pro ($40/month for 5,000 contacts) — alongside its Transactional tiers.",
      "whyItMatters": "Teams needing both transactional and marketing/broadcast sending from one vendor avoid managing two separate providers.",
      "benefitsWho": "Teams that send both order confirmations and marketing newsletters and want one vendor for both."
    },
    {
      "title": "AI client / MCP integration",
      "toolA": "Not documented in the facts reviewed.",
      "toolB": "Provides an MCP server for integrating email sending into AI clients like Cursor and Claude, plus a monthly AI credit allotment on every plan.",
      "whyItMatters": "Native MCP support lets AI coding assistants send email directly as part of an agentic workflow without custom integration work.",
      "benefitsWho": "Developer teams building AI-agent-driven products or using AI coding assistants."
    },
    {
      "title": "Free tier shape",
      "toolA": "Free plan never expires, but is limited to 100 emails/month.",
      "toolB": "Free plan offers 3,000 emails/month but is capped at 100 emails/day and 1 domain.",
      "whyItMatters": "A higher monthly cap with a daily limit suits bursty sending patterns differently than a lower flat monthly cap.",
      "benefitsWho": "Low-volume, steady senders (Postmark) versus teams with occasional higher-volume days within a capped total (Resend)."
    },
    {
      "title": "Data retention and compliance",
      "toolA": "Retention can extend up to 365 days on the Pro tier.",
      "toolB": "Documents 30-day retention on its free tier and SOC 2 Type II plus GDPR compliance across all plans; longer retention tiers are not itemized in the facts reviewed.",
      "whyItMatters": "Longer retention supports deeper historical analytics, while documented compliance certifications matter for procurement and security review.",
      "benefitsWho": "Teams needing long-term delivery analytics (Postmark) versus teams needing documented compliance for security review (Resend)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Sending",
      "rows": [
        {
          "feature": "Email API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SMTP relay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Inbound email processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Postmark: available starting on paid plans."
        },
        {
          "feature": "Reusable email templates",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "React Email / component-based templates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Batch sending with open/link tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Developer Tools & AI",
      "rows": [
        {
          "feature": "CLI tool",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP server for AI client integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official SDK language count",
          "toolA": "available",
          "toolB": "available",
          "note": "Postmark: 6 languages (Node.js, Python, Ruby on Rails, Ruby, PHP, C#). Resend: 9 languages (adds Go, Java, Laravel, Rust, .NET)."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Postmark: 100 emails/month, never expires. Resend: 3,000 emails/month, capped at 100/day."
        },
        {
          "feature": "Separate marketing-email pricing track",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Retention up to 365 days",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Postmark: Pro tier."
        },
        {
          "feature": "SOC 2 Type II / GDPR compliance documented",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free Postmark plan?",
      "answer": "Yes, Postmark's free plan never expires and includes 100 emails/month."
    },
    {
      "question": "Is there a free Resend plan?",
      "answer": "Yes, Resend's free plan includes 3,000 emails/month (up to 100/day), 1 domain, and 5 AI credits/month."
    },
    {
      "question": "Who owns Postmark?",
      "answer": "Postmark is owned by ActiveCampaign; it was founded in 2010."
    },
    {
      "question": "Can AI agents use Resend to send email?",
      "answer": "Yes, Resend provides an MCP server for integration with AI clients such as Cursor and Claude, and plans include a monthly allotment of AI credits."
    },
    {
      "question": "Does either support building emails as React components?",
      "answer": "Resend supports React Email for building emails as components; this is not documented for Postmark."
    },
    {
      "question": "How long can delivery data be retained?",
      "answer": "Postmark's Pro tier allows retention up to 365 days. Resend documents 30-day retention on its free tier, with longer retention not itemized in the facts reviewed."
    }
  ]
};

export default postmarkVsResendContent;
