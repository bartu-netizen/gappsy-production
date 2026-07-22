import type { ToolComparisonContent } from './types';

const guruVsSlabContent: ToolComparisonContent = {
  "verdict": "Guru and Slab both help teams organize and retrieve internal knowledge, but they sit at opposite ends of the market: Guru is a custom-quoted platform built around permission-aware AI search, automated conflict and duplicate detection (Knowledge Agents), and a SOC 2 Type II / HIPAA-ready compliance posture, while Slab is a self-serve wiki with a genuine free tier for up to 10 users and published per-user pricing ($6.67 to $12.50/user/month) whose AI features (Autofix, Predict, Ask) are writing-assistance tools gated by plan tier. Neither disclosure gap should be ignored: Guru publishes no pricing at all, and Slab discloses no founding year, headquarters, or company size.",
  "bestForToolA": "Larger or compliance-sensitive organizations that need permission-scoped AI answers, automated detection of conflicting or outdated knowledge, and direct integration with tools like Slack, Microsoft Teams, Claude, and Cursor — and that are prepared to go through a sales conversation for pricing.",
  "bestForToolB": "Smaller teams (10 users or fewer) that want to start on a free plan with no credit card, or growing teams that want transparent per-user pricing and AI writing assistance (Autofix) without committing to an enterprise sales process.",
  "whoNeedsBoth": "Organizations comparing a self-serve wiki against an enterprise knowledge-governance platform as part of a formal evaluation will likely need both quotes in hand, since Guru requires a sales conversation to even see pricing while Slab's numbers are already public.",
  "keyDifferences": [
    {
      "title": "Pricing transparency and access model",
      "toolA": "Guru is fully custom/quote-only, with no published plans or prices and no self-serve free plan advertised.",
      "toolB": "Slab publishes exact prices for Free ($0, up to 10 users), Startup ($6.67/user/month), and Business ($12.50/user/month), with Enterprise as the only custom tier (100+ user minimum).",
      "whyItMatters": "Teams that want to evaluate cost without a sales call can do so with Slab but not with Guru.",
      "benefitsWho": "Smaller teams and self-serve buyers who want to see pricing before engaging sales."
    },
    {
      "title": "Automated knowledge verification vs. AI writing assistance",
      "toolA": "Guru's Knowledge Agents automatically flag conflicting versions, duplicates, and gaps in the knowledge base.",
      "toolB": "Slab's AI (Autofix on Startup; Predict and Ask on Business) is framed around writing assistance rather than automated conflict detection.",
      "whyItMatters": "Guru's approach targets keeping large, sprawling knowledge bases accurate at scale, while Slab's AI is oriented toward helping individual authors write and edit faster.",
      "benefitsWho": "Knowledge managers at larger orgs (Guru) vs. individual document authors on smaller teams (Slab)."
    },
    {
      "title": "Permission-aware, cited AI answers",
      "toolA": "Guru's AI search and chat are permission-aware and surface cited answers grounded in governed company knowledge.",
      "toolB": "Slab's facts don't describe a permission-scoped AI search or citation feature.",
      "whyItMatters": "Permission-aware answers reduce the risk of AI surfacing restricted information to the wrong audience.",
      "benefitsWho": "Compliance-sensitive teams with role-based access requirements."
    },
    {
      "title": "Compliance certifications stated",
      "toolA": "Guru states SOC 2 Type II certification and a HIPAA-ready posture.",
      "toolB": "Slab's facts don't mention a compliance certification, only SAML SSO and SCIM provisioning on the Business plan.",
      "whyItMatters": "Regulated industries (healthcare, finance) often require documented compliance certifications during vendor review.",
      "benefitsWho": "Compliance and security teams evaluating vendors for regulated data."
    },
    {
      "title": "AI assistant and chat-tool integrations",
      "toolA": "Guru integrates with Slack, Microsoft Teams, Claude, Chrome, Cursor, and MCP so answers surface where people already work.",
      "toolB": "Slab's stated integrations are Google, Asana, and Ashby, with no AI assistant integrations mentioned.",
      "whyItMatters": "Teams that already rely on AI coding or chat assistants may want their knowledge base answers to appear directly inside those tools.",
      "benefitsWho": "Engineering and support teams using Claude, Cursor, Slack, or Teams daily."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free self-serve plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Slab: free forever for up to 10 users, no credit card required."
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Guru: only offering. Slab: requires 100+ users minimum."
        }
      ]
    },
    {
      "group": "AI & Knowledge Features",
      "rows": [
        {
          "feature": "Automated conflict/duplicate detection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI writing assistance",
          "toolA": "limited",
          "toolB": "available",
          "note": "Guru offers 'Draft generation' from existing sources; Slab's Autofix is dedicated writing assistance from the Startup plan up."
        },
        {
          "feature": "Permission-aware AI search/chat",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cited, grounded AI answers",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Governance & Compliance",
      "rows": [
        {
          "feature": "Audit trails / audit logs",
          "toolA": "available",
          "toolB": "available",
          "note": "Slab: Enterprise plan only."
        },
        {
          "feature": "SOC 2 / HIPAA-ready",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SAML SSO / SCIM provisioning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Slab: Business plan and above."
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "AI assistant integrations (Claude, Cursor, MCP)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Chat platform integrations (Slack, Teams)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Guru's pricing public?",
      "answer": "No, Guru uses custom pricing scoped during a conversation with its sales team based on organization scale and AI usage."
    },
    {
      "question": "Does Slab have a free plan?",
      "answer": "Yes, Slab is free forever for up to 10 users with unlimited posts/topics and no credit card required."
    },
    {
      "question": "What AI features does Guru offer?",
      "answer": "Knowledge Agents that automatically verify and flag conflicting or duplicate content, plus permission-aware AI search and chat that returns cited answers, integrating with Slack, Teams, Claude, and Cursor."
    },
    {
      "question": "What AI features does Slab offer, and on which plans?",
      "answer": "AI Autofix is included from the Startup plan ($6.67/user/month); AI Predict and AI Ask are added on the Business plan ($12.50/user/month)."
    },
    {
      "question": "Is Guru HIPAA compliant?",
      "answer": "Guru states it is HIPAA-ready and holds SOC 2 Type II certification."
    },
    {
      "question": "Is there an Enterprise plan for Slab?",
      "answer": "Yes, a custom-priced Enterprise plan is available for organizations with a 100+ user minimum."
    }
  ]
};

export default guruVsSlabContent;
