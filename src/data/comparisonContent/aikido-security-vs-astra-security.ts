import type { ToolComparisonContent } from './types';

const aikidoSecurityVsAstraSecurityContent: ToolComparisonContent = {
  "verdict": "Aikido Security and Astra Security both use AI in application security, but package it differently: Aikido bundles code (SAST/SCA), cloud posture management, runtime protection, and AI pentesting into flat monthly platform tiers plus a free-forever plan; Astra sells more specialized, separately-priced products (PTaaS, DAST, API security, cloud scanning), each with its own published price. Teams wanting one dashboard and a genuine free tier may prefer Aikido; teams wanting to buy a specific product at transparent per-product pricing may prefer Astra.",
  "bestForToolA": "Best for teams that want a single consolidated platform (code, cloud, runtime) at a flat monthly price, and that value a free-forever entry tier (2 users, 10 repos, 1 cloud account, 10 AI AutoFixes/month) to start without paying anything.",
  "bestForToolB": "Best for teams that want to buy a specific, well-defined security product — a one-off penetration test (Pentest Auto at $1,999/year or Pentest Expert at $5,999/year) or just a DAST scanner (from $69/month) — with transparent, published per-product pricing and a low-cost $7 trial week.",
  "whoNeedsBoth": "Organizations running both an internal engineering security program and needing outside-in validation might use Aikido for continuous code/cloud/runtime coverage while separately engaging Astra for its dedicated PTaaS or DAST products, since the two overlap in scanning but differ in packaging and manual-pentest depth.",
  "keyDifferences": [
    {
      "title": "Platform breadth vs. product specialization",
      "toolA": "Aikido bundles code security (SAST/SCA), Cloud Security Posture Management, AI-powered pentesting, and a runtime firewall (Zen) into one dashboard with AutoTriage to reduce alert noise.",
      "toolB": "Astra offers separately priced products: PTaaS, a DAST scanner covering 10,000+ tests, an API security platform, and a cloud vulnerability scanner detecting 400+ misconfigurations.",
      "whyItMatters": "Buying a single consolidated platform vs. assembling specific point products changes both total cost and how many vendor relationships a security team manages.",
      "benefitsWho": "Security leads deciding between an all-in-one tool and a best-of-breed stack."
    },
    {
      "title": "Free tier vs. trial-only access",
      "toolA": "Aikido offers a free-forever Developer plan (2 users, 10 repos, 2 container images, 1 domain, 1 cloud account, 10 AI AutoFixes/month) with no credit card required.",
      "toolB": "Astra has no free plan; it offers a $7 trial week for its DAST Scanner, API Scanner, and Cloud Starter products, with no credit card required.",
      "whyItMatters": "Teams that want to keep basic scanning running indefinitely at zero cost can do so with Aikido; Astra requires eventually moving to a paid, per-product plan.",
      "benefitsWho": "Budget-constrained teams and solo developers evaluating tools long-term."
    },
    {
      "title": "Pricing structure",
      "toolA": "Aikido prices its platform in flat monthly tiers by user/repo/cloud-account count — Basic $300/month (10 users), Pro and Advanced $600/month — plus separately priced pentest options.",
      "toolB": "Astra prices per product and per target — e.g., DAST Scanner Lite $69/month for 1 target, Cloud Starter $99/month for 1 cloud target — so cost scales with the number of assets and products purchased.",
      "whyItMatters": "Aikido's flat platform pricing is easier to forecast org-wide; Astra's per-target, per-product pricing can better fit teams securing a small number of specific assets.",
      "benefitsWho": "Finance/procurement teams comparing total cost of ownership across differently structured pricing models."
    },
    {
      "title": "Company transparency",
      "toolA": "Aikido states it was founded in 2022 and is headquartered in Ghent, Belgium, with an additional San Francisco office.",
      "toolB": "Astra Security's available facts do not state a founding year or headquarters.",
      "whyItMatters": "Company transparency (founding date, HQ) can factor into vendor due diligence, especially for regulated buyers.",
      "benefitsWho": "Procurement and vendor-risk teams performing due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Security Capabilities",
      "rows": [
        {
          "feature": "Code security (SAST/SCA)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cloud Security Posture Management",
          "toolA": "available",
          "toolB": "available",
          "note": "Astra: Cloud vulnerability scanner, 400+ misconfigurations"
        },
        {
          "feature": "Runtime protection/firewall",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-powered penetration testing",
          "toolA": "available",
          "toolB": "available",
          "note": "Astra: Pentest Auto"
        },
        {
          "feature": "API security scanning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published entry price",
          "toolA": "available",
          "toolB": "available",
          "note": "Aikido: $300/month Basic (after free tier); Astra: $69/month DAST Scanner Lite"
        },
        {
          "feature": "Low-cost trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Astra: $7 trial week"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Alert Management & Reporting",
      "rows": [
        {
          "feature": "Alert deduplication/noise reduction",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aikido: AutoTriage"
        },
        {
          "feature": "Compliance posture reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Astra: Trust Center for SOC 2, HIPAA, ISO"
        },
        {
          "feature": "CI/CD & ticketing integrations",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Aikido Security free?",
      "answer": "Yes, the Developer plan is free forever for 2 users with limited repos, containers, and cloud accounts."
    },
    {
      "question": "Does Astra Security offer a free trial?",
      "answer": "Yes, a $7 trial week is available for the DAST Scanner, API Scanner, and Cloud Starter products, with no credit card required."
    },
    {
      "question": "What does Aikido's Basic plan cost?",
      "answer": "The Basic plan starts at $300/month for 10 users, billed monthly or annually with a 10% discount."
    },
    {
      "question": "Does Astra do penetration testing?",
      "answer": "Yes, Astra offers Pentest Auto starting at $1,999/year and Pentest Expert (manual, certified-expert testing) at $5,999/year, plus a custom Enterprise tier."
    },
    {
      "question": "Where is Aikido headquartered?",
      "answer": "Aikido Security is headquartered in Ghent, Belgium, with an additional office in San Francisco."
    },
    {
      "question": "Does Astra scan cloud infrastructure?",
      "answer": "Yes, its Cloud Security Platform scans AWS, Azure, and GCP for 400+ misconfigurations, starting at $99/month for Cloud Starter."
    }
  ]
};

export default aikidoSecurityVsAstraSecurityContent;
