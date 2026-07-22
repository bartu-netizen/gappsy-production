import type { GroupComparisonContent } from './types';

const bitwardenVsKeeperVsNordpassContent: GroupComparisonContent = {
  "verdict": "Bitwarden, Keeper, and NordPass all offer zero-knowledge encrypted vaults, but they target different buyers. Bitwarden is the only open-source, self-hostable option among the three and pairs that with the most generous permanent free tier. Keeper leans hardest into compliance, with FedRAMP High, FIPS 140-3, and ITAR certifications plus bundled secrets management and privileged access tools that suit government and regulated enterprises. NordPass undercuts both on price, especially on multi-year plans, and was an early mover on passkey support, making it a reasonable pick for budget-conscious users who don't need self-hosting or deep compliance credentials.",
  "bestFor": {
    "bitwarden": "Budget-conscious individuals, families, and privacy-focused teams who want the most generous free tier of the three plus the option to self-host the entire backend.",
    "keeper": "Government contractors, defense organizations, and regulated enterprises that need FedRAMP High, FIPS 140-3, and ITAR compliance alongside bundled secrets management and privileged access management.",
    "nordpass": "Users already in or attracted to the Nord Security ecosystem who want the lowest multi-year pricing and early passkey support without needing self-hosting or deep compliance certifications."
  },
  "highlights": [
    {
      "title": "Bitwarden is the only open-source, self-hostable option",
      "description": "Bitwarden's client and server code is published on GitHub and has undergone repeated independent security audits, and its full backend can be self-hosted via Docker, an option neither Keeper nor NordPass offers.",
      "toolSlugs": [
        "bitwarden"
      ]
    },
    {
      "title": "Keeper has by far the deepest compliance certifications",
      "description": "Keeper holds FedRAMP High authorization, FIPS 140-3 validation, and ITAR compliance, a certification depth not documented for Bitwarden or NordPass, making it a common choice for government and defense customers.",
      "toolSlugs": [
        "keeper"
      ]
    },
    {
      "title": "NordPass is the cheapest on multi-year billing",
      "description": "NordPass Premium starts around $1.38 to $1.99 per month on multi-year terms, undercutting Bitwarden's $1.65/month Premium and Keeper's roughly $4/month Personal plan.",
      "toolSlugs": [
        "nordpass"
      ]
    },
    {
      "title": "Bitwarden and NordPass both have permanent free tiers; Keeper does not",
      "description": "Bitwarden's Free plan supports unlimited passwords across unlimited devices, and NordPass's Free plan supports unlimited passwords on one device at a time, while Keeper's lowest listed tier is the paid Personal plan.",
      "toolSlugs": [
        "bitwarden",
        "nordpass",
        "keeper"
      ]
    },
    {
      "title": "Bitwarden and Keeper both offer developer secrets management",
      "description": "Bitwarden Secrets Manager and Keeper Secrets Manager both let development teams store and rotate API keys and credentials, a capability not documented for NordPass.",
      "toolSlugs": [
        "bitwarden",
        "keeper"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core vault and access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "bitwarden": "available",
            "keeper": "unavailable",
            "nordpass": "available"
          },
          "note": "Bitwarden's Free plan allows unlimited devices; NordPass's Free plan limits vault access to one device at a time. Keeper's lowest documented tier is the paid Personal plan."
        },
        {
          "feature": "Open-source codebase with independent security audits",
          "statuses": {
            "bitwarden": "available",
            "keeper": "unavailable",
            "nordpass": "not-documented"
          }
        },
        {
          "feature": "Passkey support",
          "statuses": {
            "bitwarden": "available",
            "keeper": "not-documented",
            "nordpass": "available"
          }
        }
      ]
    },
    {
      "group": "Advanced security features",
      "rows": [
        {
          "feature": "Dark web or breach monitoring",
          "statuses": {
            "bitwarden": "not-documented",
            "keeper": "available",
            "nordpass": "available"
          },
          "note": "Keeper's BreachWatch and NordPass's Data Breach Scanner both explicitly monitor for compromised credentials. Bitwarden's vault health reports flag weak or reused passwords but breach monitoring specifically is not documented."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "bitwarden": "available",
            "keeper": "unavailable",
            "nordpass": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Business and developer tools",
      "rows": [
        {
          "feature": "Secrets management for developers and DevOps",
          "statuses": {
            "bitwarden": "available",
            "keeper": "available",
            "nordpass": "not-documented"
          }
        },
        {
          "feature": "Government or regulated-industry certifications (FedRAMP, FIPS, ITAR)",
          "statuses": {
            "bitwarden": "not-documented",
            "keeper": "available",
            "nordpass": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing structure",
      "rows": [
        {
          "feature": "Discounted multi-year billing tiers",
          "statuses": {
            "bitwarden": "not-documented",
            "keeper": "not-documented",
            "nordpass": "available"
          },
          "note": "NordPass explicitly prices Premium, Family, Teams, Business, and Enterprise plans across 1-year and 2-year billing options with lower per-month rates on longer terms."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which password manager has the best free tier?",
      "answer": "Bitwarden's free plan is the most generous of the three, offering unlimited passwords across unlimited devices at no cost. NordPass also has a free plan but limits vault access to one device at a time. Keeper does not offer a documented free tier, starting instead at its paid Personal plan."
    },
    {
      "question": "Which of these three can I self-host?",
      "answer": "Only Bitwarden. Its full server stack can be self-hosted via Docker for organizations that want to control their own infrastructure. Keeper and NordPass are both cloud-only services."
    },
    {
      "question": "Which is best for government or highly regulated industries?",
      "answer": "Keeper, which holds FedRAMP High authorization, FIPS 140-3 validation, and ITAR compliance, certifications not documented for Bitwarden or NordPass."
    },
    {
      "question": "Which is the cheapest overall?",
      "answer": "NordPass, especially on multi-year billing, with Premium starting around $1.38 to $1.99 per month. Bitwarden Premium is close behind at $1.65/month billed annually, while Keeper's Personal plan runs around $4/month billed annually."
    },
    {
      "question": "Do any of these support passkeys?",
      "answer": "Bitwarden and NordPass both explicitly support generating, storing, and logging in with passkeys. Passkey support is not documented for Keeper."
    },
    {
      "question": "Which ones offer secrets management for development teams?",
      "answer": "Both Bitwarden (Secrets Manager) and Keeper (Keeper Secrets Manager) offer dedicated products for storing and rotating API keys, database credentials, and certificates. This capability is not documented for NordPass."
    }
  ]
};

export default bitwardenVsKeeperVsNordpassContent;
