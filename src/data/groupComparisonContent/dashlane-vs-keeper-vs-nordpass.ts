import type { GroupComparisonContent } from './types';

const dashlaneVsKeeperVsNordpassContent: GroupComparisonContent = {
  "verdict": "Dashlane, Keeper, and NordPass are all zero-knowledge password managers with cross-platform apps, but they diverge sharply on business model and depth. NordPass is the only one still offering a genuinely free tier and generally the cheapest paid plans, Dashlane bundles a VPN and AI scam protection directly into its no-longer-free Premium subscription, and Keeper stands apart with the deepest compliance certifications and a full privileged access management and secrets management platform for regulated organizations. None is strictly better across the board; the choice depends on budget, whether a free tier matters, and how far into enterprise security tooling a buyer needs to go.",
  "bestFor": {
    "dashlane": "Individuals who want an all-in-one subscription bundling password management, a VPN, and AI scam protection without juggling separate tools.",
    "keeper": "Government agencies, regulated enterprises, and security teams that need deep compliance certifications plus privileged access and secrets management.",
    "nordpass": "Budget-conscious individuals and families who want a genuinely free tier and the lowest-cost paid plans, especially on multi-year billing."
  },
  "highlights": [
    {
      "title": "NordPass is the only one of the three with an ongoing free plan",
      "description": "Dashlane discontinued its free tier in September 2025 and now operates purely as a paid subscription, and Keeper's published personal plans start from its paid Personal tier, while NordPass still offers a forever-free plan for a single device.",
      "toolSlugs": [
        "nordpass"
      ]
    },
    {
      "title": "Keeper is the only one built into a full privileged access and secrets management platform",
      "description": "Beyond password storage, Keeper offers Keeper Secrets Manager, Keeper Connection Manager, and KeeperPAM for enterprise IT and security teams, none of which Dashlane or NordPass document.",
      "toolSlugs": [
        "keeper"
      ]
    },
    {
      "title": "Dashlane bundles a VPN directly into its Premium plan",
      "description": "Dashlane includes a built-in VPN at no extra charge on its Premium tier, whereas neither Keeper nor NordPass bundles a VPN with their core password manager plans.",
      "toolSlugs": [
        "dashlane"
      ]
    },
    {
      "title": "Keeper holds unusually deep compliance certifications",
      "description": "Keeper's FedRAMP High authorization, FIPS 140-3 validation, and ITAR compliance make it a common choice for government, defense, and regulated-industry buyers in a way that isn't documented for Dashlane or NordPass.",
      "toolSlugs": [
        "keeper"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Access",
      "rows": [
        {
          "feature": "Free tier for individuals",
          "statuses": {
            "dashlane": "unavailable",
            "keeper": "unavailable",
            "nordpass": "available"
          },
          "note": "Dashlane discontinued its free plan in September 2025; Keeper's published personal pricing starts at a paid tier."
        }
      ]
    },
    {
      "group": "Security and Monitoring",
      "rows": [
        {
          "feature": "Dark web or breach monitoring",
          "statuses": {
            "dashlane": "available",
            "keeper": "available",
            "nordpass": "available"
          }
        },
        {
          "feature": "Passkey support",
          "statuses": {
            "dashlane": "available",
            "keeper": "not-documented",
            "nordpass": "available"
          }
        },
        {
          "feature": "Built-in VPN",
          "statuses": {
            "dashlane": "available",
            "keeper": "unavailable",
            "nordpass": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Business and Compliance",
      "rows": [
        {
          "feature": "Deep compliance certifications (FedRAMP, FIPS, ITAR)",
          "statuses": {
            "dashlane": "not-documented",
            "keeper": "available",
            "nordpass": "not-documented"
          }
        },
        {
          "feature": "Privileged access or secrets management",
          "statuses": {
            "dashlane": "not-documented",
            "keeper": "available",
            "nordpass": "not-documented"
          }
        },
        {
          "feature": "Business SSO and SCIM provisioning",
          "statuses": {
            "dashlane": "available",
            "keeper": "available",
            "nordpass": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these password managers still has a free plan?",
      "answer": "NordPass is the only one of the three with an ongoing free plan for individuals. Dashlane discontinued its free tier in September 2025, and Keeper's personal pricing starts at a paid plan."
    },
    {
      "question": "Does Dashlane still offer a free plan?",
      "answer": "No. Dashlane retired its free tier on September 16, 2025, after migrating existing free users through a temporary Premium trial. It now operates exclusively as a paid subscription, though it offers a 30-day money-back guarantee."
    },
    {
      "question": "Which one is best for government or highly regulated organizations?",
      "answer": "Keeper is the strongest fit, holding FedRAMP High authorization, FIPS 140-3 validation, and ITAR compliance, alongside its KeeperPAM privileged access management suite."
    },
    {
      "question": "Do any of them include a VPN?",
      "answer": "Dashlane is the only one of the three that bundles a VPN into its plan (Premium), at no extra charge."
    },
    {
      "question": "Which is cheapest for individuals?",
      "answer": "NordPass generally has the lowest advertised pricing, with Premium starting around $1.38 to $1.99 per month on multi-year billing, undercutting Keeper's roughly $4/month Personal plan and Dashlane's roughly $4.99/month Premium plan."
    },
    {
      "question": "Do all three support passkeys?",
      "answer": "Dashlane and NordPass both document passkey support and autofill. Passkey support is not documented for Keeper in the available data."
    }
  ]
};

export default dashlaneVsKeeperVsNordpassContent;
