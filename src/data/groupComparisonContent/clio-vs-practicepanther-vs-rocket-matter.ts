import type { GroupComparisonContent } from './types';

const clioVsPracticepantherVsRocketMatterContent: GroupComparisonContent = {
  "verdict": "Clio, PracticePanther, and Rocket Matter are all cloud-based legal practice management platforms covering matter management, time and billing, and trust accounting for law firms. Clio has the widest adoption and integration ecosystem, plus companion products like Clio Grow and AI drafting at its top tier. PracticePanther bundles native e-signature, two-way texting, and payment processing to reduce reliance on third-party add-ons. Rocket Matter includes free data migration and unlimited support on every plan, though its advanced accounting features are reserved for its priciest tier.",
  "bestFor": {
    "clio": "Firms wanting the broadest integration ecosystem and adoption base, plus companion tools like Clio Grow for client intake and AI drafting at the top tier.",
    "practicepanther": "Solo and small firms that want native e-signature, two-way texting, and payment processing bundled in without needing third-party add-ons.",
    "rocket-matter": "Firms that value free data migration and unlimited support included on every plan, with room to add a CRM add-on as they grow."
  },
  "highlights": [
    {
      "title": "Widest Adoption and Integrations",
      "description": "Clio's adoption by more than 400,000 legal professionals and its large integration ecosystem, plus Clio Grow for intake, set it apart on breadth.",
      "toolSlugs": [
        "clio"
      ]
    },
    {
      "title": "Most Bundled Native Tools",
      "description": "PracticePanther bundles native e-signature, two-way texting, and ePayments directly into the platform rather than relying on third-party add-ons.",
      "toolSlugs": [
        "practicepanther"
      ]
    },
    {
      "title": "Free Migration and Support on Every Plan",
      "description": "Rocket Matter includes free data migration and unlimited support across all of its tiers, including its entry-level plan.",
      "toolSlugs": [
        "rocket-matter"
      ]
    },
    {
      "title": "Trust Accounting Is Table Stakes, Depth Varies",
      "description": "All three platforms include trust accounting for compliance, but PracticePanther and Rocket Matter reserve their full accounting suites for their top-priced tiers.",
      "toolSlugs": [
        "clio",
        "practicepanther",
        "rocket-matter"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Case and Financial Management",
      "rows": [
        {
          "feature": "Trust accounting",
          "statuses": {
            "clio": "available",
            "practicepanther": "limited",
            "rocket-matter": "limited"
          },
          "note": "PracticePanther's full trust and operating accounting suite requires its Business Pro tier; Rocket Matter's advanced accounting is reserved for its Elite tier."
        },
        {
          "feature": "Time and billing",
          "statuses": {
            "clio": "available",
            "practicepanther": "available",
            "rocket-matter": "available"
          }
        }
      ]
    },
    {
      "group": "Client-Facing Tools",
      "rows": [
        {
          "feature": "Native e-signatures",
          "statuses": {
            "clio": "available",
            "practicepanther": "available",
            "rocket-matter": "available"
          }
        },
        {
          "feature": "Two-way texting",
          "statuses": {
            "clio": "not-documented",
            "practicepanther": "available",
            "rocket-matter": "not-documented"
          }
        },
        {
          "feature": "Client intake forms/portal",
          "statuses": {
            "clio": "available",
            "practicepanther": "available",
            "rocket-matter": "available"
          },
          "note": "Clio's intake capability comes via its companion product, Clio Grow."
        },
        {
          "feature": "CRM functionality",
          "statuses": {
            "clio": "available",
            "practicepanther": "not-documented",
            "rocket-matter": "limited"
          },
          "note": "Rocket Matter's CRM is a separate paid add-on with an extra onboarding fee."
        }
      ]
    },
    {
      "group": "AI and Access",
      "rows": [
        {
          "feature": "AI drafting assistance",
          "statuses": {
            "clio": "available",
            "practicepanther": "not-documented",
            "rocket-matter": "not-documented"
          },
          "note": "Clio's AI drafting is reserved for its top Complete tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the widest adoption and integration ecosystem?",
      "answer": "Clio, with adoption by more than 400,000 legal professionals and the largest integration ecosystem of the three, along with companion products like Clio Grow."
    },
    {
      "question": "Which platform bundles native texting with clients?",
      "answer": "PracticePanther is the one that includes native two-way texting directly in the platform; this is not documented for Clio or Rocket Matter."
    },
    {
      "question": "Do all three include trust accounting?",
      "answer": "Yes, all three include trust accounting for compliance, but PracticePanther's full trust and operating accounting suite is locked behind its Business Pro tier, and Rocket Matter's advanced accounting features require its Elite tier."
    },
    {
      "question": "Which platform offers free data migration and unlimited support on every plan?",
      "answer": "Rocket Matter includes free data migration and unlimited support across all of its pricing tiers, including its entry-level Essentials plan."
    },
    {
      "question": "Does Rocket Matter include CRM functionality by default?",
      "answer": "No, Rocket Matter's CRM functionality is a separate paid add-on that also carries an extra onboarding fee, unlike Clio which includes intake/CRM capability through its Clio Grow companion product."
    },
    {
      "question": "Which platform offers AI drafting assistance?",
      "answer": "Clio offers AI drafting, but only at its top-priced Complete tier; this capability is not documented for PracticePanther or Rocket Matter."
    }
  ]
};

export default clioVsPracticepantherVsRocketMatterContent;
