import type { GroupComparisonContent } from './types';

const bitwardenVsDashlaneVsKeeperContent: GroupComparisonContent = {
  "verdict": "Bitwarden, Dashlane, and Keeper are all zero-knowledge password managers that solve the same core problem, but they diverge sharply on openness, bundled extras, and enterprise depth. Bitwarden is open source with the most generous free tier and an optional self-hosting path. Dashlane bundles a VPN and AI-powered scam protection into its subscription-only product, having dropped its free plan in September 2025. Keeper leans hardest into enterprise and government compliance, layering privileged access management on top of core password storage.",
  "bestFor": {
    "bitwarden": "Individuals and organizations that want an open-source, independently audited password manager with a genuinely free tier and self-hosting option",
    "dashlane": "Users who want a password manager bundled with a VPN, dark web monitoring, and AI-powered scam protection in one subscription",
    "keeper": "Regulated organizations and government agencies that need FedRAMP, FIPS, or ITAR compliance plus privileged access management alongside password storage"
  },
  "highlights": [
    {
      "title": "Bitwarden is the only one that's open source and self-hostable",
      "description": "Bitwarden's client and server code is published on GitHub and has undergone repeated independent security audits; neither Dashlane nor Keeper is open source, and Keeper's own materials note this as a differentiator versus Bitwarden.",
      "toolSlugs": [
        "bitwarden",
        "dashlane",
        "keeper"
      ]
    },
    {
      "title": "Dashlane dropped its free plan; Bitwarden's remains generous",
      "description": "As of September 2025, Dashlane no longer offers a free plan, while Bitwarden's Free tier still includes unlimited passwords and unlimited devices at no cost.",
      "toolSlugs": [
        "dashlane",
        "bitwarden"
      ]
    },
    {
      "title": "Dashlane bundles a VPN and AI scam protection",
      "description": "Dashlane's Premium plan includes a built-in VPN for public Wi-Fi and AI-powered scam protection that warns users before autofilling credentials on suspected phishing sites, extras neither Bitwarden nor Keeper documents.",
      "toolSlugs": [
        "dashlane"
      ]
    },
    {
      "title": "Keeper adds privileged access management and deep compliance",
      "description": "Keeper's Enterprise Plus tier bundles KeeperPAM, a privileged access management suite, and the company holds FedRAMP High, FIPS 140-3, and ITAR compliance certifications aimed at government and regulated industries.",
      "toolSlugs": [
        "keeper"
      ]
    },
    {
      "title": "All three offer breach or dark web monitoring, branded differently",
      "description": "Bitwarden's vault health reports flag weak, reused, or exposed passwords; Dashlane has dedicated dark web monitoring; and Keeper's BreachWatch does continuous dark web monitoring tied to stored accounts.",
      "toolSlugs": [
        "bitwarden",
        "dashlane",
        "keeper"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Access and Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "unavailable",
            "keeper": "not-documented"
          },
          "note": "Dashlane removed its free plan in September 2025; Keeper's published tiers begin with a paid Personal plan, with no free tier detailed."
        },
        {
          "feature": "Open source and self-hostable",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "unavailable",
            "keeper": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Security Extras",
      "rows": [
        {
          "feature": "Built-in VPN",
          "statuses": {
            "bitwarden": "unavailable",
            "dashlane": "available",
            "keeper": "not-documented"
          }
        },
        {
          "feature": "Dark web or breach monitoring",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "keeper": "available"
          }
        },
        {
          "feature": "Passkey support",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "keeper": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Enterprise and Dev Tools",
      "rows": [
        {
          "feature": "Privileged access management",
          "statuses": {
            "bitwarden": "unavailable",
            "dashlane": "unavailable",
            "keeper": "available"
          }
        },
        {
          "feature": "Secrets manager for developer teams",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "unavailable",
            "keeper": "available"
          }
        },
        {
          "feature": "SSO and SCIM provisioning",
          "statuses": {
            "bitwarden": "available",
            "dashlane": "available",
            "keeper": "available"
          },
          "note": "Reserved for the higher business tiers on all three."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Bitwarden, Dashlane, and Keeper all have free plans?",
      "answer": "Bitwarden does, with an unlimited-password, unlimited-device Free tier. Dashlane no longer offers a free plan as of September 2025. Keeper's published pricing starts with a paid Personal plan, with no free tier documented."
    },
    {
      "question": "Which of the three is open source?",
      "answer": "Only Bitwarden. Its client and server code are published on GitHub and have undergone repeated independent security audits, while Dashlane and Keeper are both closed source."
    },
    {
      "question": "Which one bundles a VPN?",
      "answer": "Dashlane, whose Premium plan includes a built-in VPN for protecting traffic on public Wi-Fi networks."
    },
    {
      "question": "Which is best for regulated industries or government use?",
      "answer": "Keeper, given its FedRAMP High, FIPS 140-3, and ITAR compliance certifications alongside its KeeperPAM privileged access management suite."
    },
    {
      "question": "Can I self-host any of these three password managers?",
      "answer": "Only Bitwarden, whose full server stack can be self-hosted, typically via Docker, for organizations that want to control their own infrastructure."
    },
    {
      "question": "Which offers privileged access management for IT and security teams?",
      "answer": "Keeper, through its Enterprise Plus tier's KeeperPAM suite, which is not offered by Bitwarden or Dashlane."
    }
  ]
};

export default bitwardenVsDashlaneVsKeeperContent;
