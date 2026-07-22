import type { ToolComparisonContent } from './types';

const lavenderVsRegieAiContent: ToolComparisonContent = {
  "verdict": "Lavender and Regie.ai both apply AI to sales outreach, but at very different scales: Lavender is a lightweight, largely free email-coaching Chrome extension for individual writing quality, while Regie.ai is a full sales engagement platform requiring an annual, multi-seat contract to automate prospecting, dialing, and multi-channel sequencing.",
  "bestForToolA": "Individual sales reps who want real-time feedback and rewriting on the emails they're already sending, without a large platform commitment.",
  "bestForToolB": "Sales organizations ready to commit to an annual contract (10-seat minimum) for a unified platform covering AI dialing, multi-channel sequencing, and CRM-integrated prospecting.",
  "whoNeedsBoth": "A sales team using Regie.ai to run automated prospecting and multi-channel sequencing might still have individual reps install Lavender's Email Coach to improve the quality of the emails within those sequences.",
  "keyDifferences": [
    {
      "title": "Platform Scope",
      "toolA": "A focused email-coaching and writing tool delivered as a Chrome extension that scores and rewrites emails.",
      "toolB": "A full sales engagement platform covering prospecting, AI dialing, sequencing, and multi-channel orchestration.",
      "whyItMatters": "One is a lightweight writing aid, the other a comprehensive outbound sales system.",
      "benefitsWho": "Individual reps wanting quick email feedback (Lavender) versus sales orgs needing an end-to-end outbound tech stack (Regie.ai)."
    },
    {
      "title": "Pricing Accessibility",
      "toolA": "The Email Coach can be installed for free; pricing for Ora and higher tiers is not publicly listed.",
      "toolB": "No free plan or trial; the entry-level AI SEP plan requires a 10-seat annual contract at $180/user/month.",
      "whyItMatters": "Entry cost and contract commitment differ drastically between a free/self-serve tool and an enterprise contract minimum.",
      "benefitsWho": "Individual reps or small teams (Lavender) versus larger sales orgs able to commit to annual, multi-seat contracts (Regie.ai)."
    },
    {
      "title": "Outreach Channels",
      "toolA": "Focused specifically on email, delivered via a Chrome extension.",
      "toolB": "Orchestrates outreach across phone (AI Dialer), email, and social channels, with named-account targeting.",
      "whyItMatters": "Multi-channel coordination requires a broader platform than an email-focused coaching tool.",
      "benefitsWho": "SDR and BDR teams running coordinated multi-channel sequences."
    },
    {
      "title": "AI Agent Behavior",
      "toolA": "Ora writes emails modeled on top-performing sellers, acting as a writing assistant.",
      "toolB": "AI Prospecting Agents handle lead research and generate personalized outreach messaging as part of dynamic, engagement-based workflows.",
      "whyItMatters": "Ora sharpens individual message quality, while Regie.ai's agents drive an automated, adaptive outbound process.",
      "benefitsWho": "Reps wanting to sharpen individual emails (Lavender) versus teams wanting automated end-to-end prospecting workflows (Regie.ai)."
    },
    {
      "title": "Third-Party Recognition",
      "toolA": "No third-party award or ranking is documented.",
      "toolB": "Recognized as a G2 Spring 2025 Grid Leader.",
      "whyItMatters": "Third-party validation can factor into vendor selection for larger deals.",
      "benefitsWho": "Buyers doing vendor due diligence for enterprise purchases."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capabilities",
      "rows": [
        {
          "feature": "Email scoring/coaching",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-written outreach messaging",
          "toolA": "available",
          "toolB": "available",
          "note": "Lavender: Ora; Regie.ai: AI Prospecting Agents"
        },
        {
          "feature": "Multi-channel orchestration (phone/email/social)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI dialer / calling",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "CRM enrichment/integration",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier / install",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Public pricing for higher tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Regie.ai publishes $180-$499/user/month"
        },
        {
          "feature": "Minimum contract/seat requirement",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "10-seat annual minimum for entry plan"
        }
      ]
    },
    {
      "group": "Platform & Delivery",
      "rows": [
        {
          "feature": "Delivery method",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lavender: Chrome extension only"
        },
        {
          "feature": "Named account targeting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Sales training/education content",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Lavender: Sales Email Certification Course"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Lavender or Regie.ai free to use?",
      "answer": "Lavender's Email Coach can be installed for free, though pricing for its Ora AI agent and CRM enrichment isn't public. Regie.ai has no free plan or trial; its entry-level AI SEP plan requires a 10-seat annual contract at $180/user/month."
    },
    {
      "question": "Which tool covers more of the outbound sales process?",
      "answer": "Regie.ai is the broader platform, orchestrating prospecting, AI dialing, and multi-channel (phone, email, social) sequencing. Lavender is focused specifically on scoring and rewriting emails."
    },
    {
      "question": "What is Ora?",
      "answer": "Ora is Lavender's AI sales agent, designed to write emails modeled on top-performing sellers."
    },
    {
      "question": "Does Regie.ai include a phone dialer?",
      "answer": "Yes, Regie.ai includes an AI Dialer for high-volume outbound calling, with a parallel dialer add-on for up to 9 lines on higher tiers."
    },
    {
      "question": "Who is each tool built for?",
      "answer": "Lavender is built for sales professionals including SDRs, BDRs, Account Executives, and sales leaders who write emails. Regie.ai targets B2B sales teams running full prospecting and multi-channel outreach operations."
    }
  ]
};

export default lavenderVsRegieAiContent;
