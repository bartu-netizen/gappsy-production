import type { GroupComparisonContent } from './types';

const bitwardenVsDashlaneVsNordpassContent: GroupComparisonContent = {
  "verdict": "Bitwarden, Dashlane, and NordPass all deliver zero-knowledge encrypted vaults with passkey support, but they target different budgets and priorities. Bitwarden remains the standout for anyone who wants a genuinely free, audited, open-source manager with a self-hosting option, while Dashlane leans into an all-in-one subscription bundling a VPN, AI scam protection, and dark web monitoring, at the cost of no longer offering any free tier. NordPass sits between the two on price, undercutting both on multi-year billing while still offering strong encryption, passkeys, and a capable Enterprise tier for growing businesses.",
  "bestFor": {
    "bitwarden": "Privacy-conscious individuals and organizations that want a free, open-source, independently audited password manager with the option to self-host the entire backend.",
    "dashlane": "Users who want an all-in-one subscription that bundles a VPN, AI-powered scam protection, and dark web monitoring with the vault, and don't need a free plan.",
    "nordpass": "Budget-conscious individuals, families, and SMBs who want strong encryption and passkey support at the lowest price on multi-year billing."
  },
  "highlights": [
    {
      "title": "Most Generous Free Plan",
      "description": "Bitwarden's Free plan includes unlimited passwords across unlimited devices at no cost, a rarity among competitors since Dashlane retired its free tier in September 2025.",
      "toolSlugs": [
        "bitwarden"
      ]
    },
    {
      "title": "Open Source and Self-Hostable",
      "description": "Bitwarden publishes its client and server code on GitHub and lets organizations self-host the entire backend via Docker for full control over compliance and data residency.",
      "toolSlugs": [
        "bitwarden"
      ]
    },
    {
      "title": "All-in-One Security Bundle",
      "description": "Dashlane's Premium plan wraps a built-in VPN, AI-powered scam protection, and dark web monitoring into the core subscription rather than charging separately for each.",
      "toolSlugs": [
        "dashlane"
      ]
    },
    {
      "title": "Lowest Price on Multi-Year Billing",
      "description": "NordPass Premium starts as low as $1.38 per month on a two-year plan, undercutting both Bitwarden Premium and Dashlane's paid-only pricing.",
      "toolSlugs": [
        "nordpass"
      ]
    },
    {
      "title": "Passkey Support Across the Board",
      "description": "All three managers let users generate, store, and log in with FIDO2 passkeys alongside traditional passwords, reflecting the industry's shift toward passwordless login.",
      "toolSlugs": [
        "bitwarden",
        "dashlane",
        "nordpass"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Vault",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "unavailable",
            "nordpass": "available"
          },
          "note": "Dashlane discontinued its free tier on September 16, 2025; NordPass Free is limited to one device at a time."
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "unavailable",
            "nordpass": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Security Features",
      "rows": [
        {
          "feature": "Passkey support",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "nordpass": "available"
          }
        },
        {
          "feature": "Dark web or breach monitoring",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "nordpass": "available"
          },
          "note": "Bitwarden surfaces exposed passwords through its vault health reports; Dashlane and NordPass run dedicated dark web and breach scanners."
        },
        {
          "feature": "Built-in VPN",
          "statuses": {
            "bitwarden": "unavailable",
            "dashlane": "available",
            "nordpass": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Business and Enterprise",
      "rows": [
        {
          "feature": "SSO integration",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "nordpass": "available"
          },
          "note": "Available on each provider's top-tier Enterprise or Omnix plan."
        },
        {
          "feature": "Directory sync (AD/LDAP/SCIM)",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "not-documented",
            "nordpass": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Bitwarden, Dashlane, or NordPass have a free plan?",
      "answer": "Bitwarden offers a permanent free plan with unlimited passwords and devices. NordPass also has a free plan, but it restricts vault access to one device at a time. Dashlane discontinued its free tier on September 16, 2025, and now operates exclusively as a paid subscription with a 30-day money-back guarantee."
    },
    {
      "question": "Which password manager is the cheapest?",
      "answer": "NordPass tends to be the cheapest option, with Premium starting around $1.38 per month on two-year billing. Bitwarden Premium costs $1.65 per month billed annually, and Dashlane starts from roughly $4.99 per month billed annually with no free alternative."
    },
    {
      "question": "Which of these password managers includes a VPN?",
      "answer": "Only Dashlane bundles a VPN, included at no extra cost with its Premium plan. Bitwarden and NordPass do not include a VPN in their password manager plans."
    },
    {
      "question": "Can I self-host any of these password managers?",
      "answer": "Bitwarden is the only one of the three that supports self-hosting, letting organizations run the entire server stack on their own infrastructure via Docker. Dashlane and NordPass are cloud-only services."
    },
    {
      "question": "Do all three support passkeys?",
      "answer": "Yes. Bitwarden, Dashlane, and NordPass all let users generate, store, and log in with FIDO2 passkeys alongside traditional passwords."
    },
    {
      "question": "Which is best for a business that needs SSO?",
      "answer": "All three offer SSO on their top-tier business plans: Bitwarden Enterprise, Dashlane Omnix or Enterprise, and NordPass Enterprise. The right choice depends on per-seat pricing and whether self-hosting or directory sync is required."
    }
  ]
};

export default bitwardenVsDashlaneVsNordpassContent;
