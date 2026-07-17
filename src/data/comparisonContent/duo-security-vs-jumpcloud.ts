import type { ToolComparisonContent } from './types';

const duoSecurityVsJumpcloudContent: ToolComparisonContent = {
  "verdict": "Duo Security and JumpCloud both sit in identity/access security but scope differently — Duo is a Cisco-backed MFA/SSO product with a permanent free tier for small teams and tiered pricing up to Premier, while JumpCloud is a broader cloud directory platform adding cross-platform device management and shadow AI/SaaS governance, sold a la carte with a 30-day trial instead of a free-forever plan.",
  "bestForToolA": "Small teams (10 or fewer users) that want free, phishing-resistant MFA and SSO backed by Cisco, without needing full device management.",
  "bestForToolB": "IT teams that need unified identity plus cross-platform device management (including password manager and shadow AI/SaaS visibility) and prefer paying only for the specific modules they use.",
  "whoNeedsBoth": "Organizations sometimes run Duo for its Cisco-integrated MFA and identity threat detection while using JumpCloud as the underlying directory and device management layer, since the two cover adjacent but distinct pieces of IT infrastructure.",
  "keyDifferences": [
    {
      "title": "Free access model",
      "toolA": "Duo Free is permanently available at no cost for teams of 10 or fewer users.",
      "toolB": "No permanent free plan; offers a 30-day fully-featured free trial with no credit card required instead.",
      "whyItMatters": "A free-forever tier vs. a time-limited trial changes how small teams can adopt the tool long-term.",
      "benefitsWho": "Very small teams needing ongoing free MFA (Duo) vs. teams wanting to fully evaluate before buying (JumpCloud)."
    },
    {
      "title": "Core product scope",
      "toolA": "MFA/SSO/identity-focused access security.",
      "toolB": "Full cloud directory platform: identity, cross-platform device management, and shadow AI/SaaS management.",
      "whyItMatters": "One is a focused access-security product; the other is broader IT infrastructure management.",
      "benefitsWho": "Teams needing narrow, strong MFA (Duo) vs. teams needing a unified IT directory and device layer (JumpCloud)."
    },
    {
      "title": "Pricing structure",
      "toolA": "Three clearly tiered plans — Essentials ($3), Advantage ($6), Premier ($9) per user/month — with an explicit feature ladder.",
      "toolB": "A la carte modular pricing (Device Management $9, SSO $11, Device Identity Management $13 per user/month) plus custom Platform tiers.",
      "whyItMatters": "Fixed tiers are simpler to budget; a la carte pricing lets teams pay only for needed modules.",
      "benefitsWho": "Teams wanting predictable tiers (Duo) vs. teams wanting to avoid paying for unused modules (JumpCloud)."
    },
    {
      "title": "Device management depth",
      "toolA": "Device Trust verifies device health before granting access; not described as full endpoint management.",
      "toolB": "Manages devices across Windows, macOS, Linux, iOS, and Android as a core feature, with a built-in password manager.",
      "whyItMatters": "Teams needing actual endpoint/device management (not just a health check) need this documented capability.",
      "benefitsWho": "IT teams managing a fleet of company devices (JumpCloud)."
    },
    {
      "title": "AI-related risk coverage",
      "toolA": "Agentic IAM extends identity and access management controls to AI agents.",
      "toolB": "Discovers shadow AI usage and helps govern/optimize SaaS spend related to it.",
      "whyItMatters": "One secures AI agents as access-control subjects; the other governs unsanctioned SaaS/AI tool usage.",
      "benefitsWho": "Security teams building AI agent access policies (Duo) vs. IT teams managing shadow SaaS/AI sprawl (JumpCloud)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Identity & Access",
      "rows": [
        {
          "feature": "Multi-factor authentication",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Passwordless authentication",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Privileged access management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Device & Endpoint Management",
      "rows": [
        {
          "feature": "Full cross-platform device management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "JumpCloud: Windows/macOS/Linux/iOS/Android"
        },
        {
          "feature": "Password manager",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Emerging Risk",
      "rows": [
        {
          "feature": "Agentic IAM (AI agent access controls)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Shadow AI / SaaS discovery & governance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Trial",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Duo: teams of 10 or fewer"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "JumpCloud: 30-day fully featured"
        },
        {
          "feature": "A la carte / modular pricing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Duo and JumpCloud offer free access?",
      "answer": "Duo Free is available at no cost for teams of 10 or fewer users; JumpCloud doesn't offer a permanent free plan but provides a 30-day fully-featured free trial with no credit card required."
    },
    {
      "question": "How is pricing structured?",
      "answer": "Duo offers three tiered editions — Essentials ($3/user/month), Advantage ($6/user/month), and Premier ($9/user/month); JumpCloud uses a la carte module pricing starting at $9/user/month for Device Management, with SSO and combined packages priced higher, plus custom Platform tiers."
    },
    {
      "question": "Does either manage devices across platforms?",
      "answer": "JumpCloud manages devices across Windows, macOS, Linux, iOS, and Android as a core feature; Duo's Device Trust verifies device health before granting access but isn't described as full cross-platform device management."
    },
    {
      "question": "Who owns Duo Security?",
      "answer": "Duo Security is owned by Cisco Systems, Inc. JumpCloud's facts don't mention a parent company."
    },
    {
      "question": "Does either address AI-related risk?",
      "answer": "Duo's Agentic IAM extends identity and access management controls to AI agents; JumpCloud discovers shadow AI usage and helps govern and optimize SaaS spend related to it."
    }
  ]
};

export default duoSecurityVsJumpcloudContent;
