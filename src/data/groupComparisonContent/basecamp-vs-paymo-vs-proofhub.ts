import type { GroupComparisonContent } from './types';

const basecampVsPaymoVsProofhubContent: GroupComparisonContent = {
  "verdict": "Basecamp and ProofHub both use flat-rate pricing that covers unlimited users, but ProofHub adds built-in file proofing and multiple project views that Basecamp leaves out in favor of a simpler chat-and-lists workspace. Paymo takes a different route entirely, charging per user while bundling time tracking directly into client invoicing, which makes it the natural fit for teams that bill hourly rather than teams that just need a shared workspace.",
  "bestFor": {
    "basecamp": "Teams that want the simplest possible async communication hub at a predictable flat price.",
    "paymo": "Freelancers and small teams that need time tracking to flow directly into client invoices.",
    "proofhub": "Agencies that need built-in file proofing and approval workflows alongside flat-rate unlimited-user pricing."
  },
  "highlights": [
    {
      "title": "Flat-rate unlimited-user pricing",
      "description": "Basecamp and ProofHub both let teams add unlimited members for one fixed monthly price, unlike Paymo's per-user model.",
      "toolSlugs": [
        "basecamp",
        "proofhub"
      ]
    },
    {
      "title": "Built-in creative proofing",
      "description": "ProofHub lets teams review, annotate, and approve images, PDFs, and documents directly inside the platform, a differentiator for agencies managing client approvals.",
      "toolSlugs": [
        "proofhub"
      ]
    },
    {
      "title": "Time tracking that becomes an invoice",
      "description": "Paymo turns logged billable hours directly into client invoices, a workflow neither Basecamp nor ProofHub natively documents.",
      "toolSlugs": [
        "paymo"
      ]
    },
    {
      "title": "Async-first communication",
      "description": "Basecamp centers its workflow on message boards and Campfire chat to replace scattered email threads and status meetings.",
      "toolSlugs": [
        "basecamp"
      ]
    },
    {
      "title": "Multiple work views",
      "description": "ProofHub and Paymo both offer Kanban, Gantt-style, and table views, giving teams more ways to visualize work than Basecamp's list-first approach.",
      "toolSlugs": [
        "proofhub",
        "paymo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Views and Planning",
      "rows": [
        {
          "feature": "Kanban boards",
          "statuses": {
            "basecamp": "not-documented",
            "paymo": "available",
            "proofhub": "available"
          }
        },
        {
          "feature": "Gantt or timeline views",
          "statuses": {
            "basecamp": "not-documented",
            "paymo": "available",
            "proofhub": "available"
          }
        }
      ]
    },
    {
      "group": "Time Tracking and Billing",
      "rows": [
        {
          "feature": "Native time tracking",
          "statuses": {
            "basecamp": "unavailable",
            "paymo": "available",
            "proofhub": "available"
          }
        },
        {
          "feature": "Client invoicing",
          "statuses": {
            "basecamp": "unavailable",
            "paymo": "available",
            "proofhub": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Review and Collaboration",
      "rows": [
        {
          "feature": "File proofing and annotation",
          "statuses": {
            "basecamp": "not-documented",
            "paymo": "not-documented",
            "proofhub": "available"
          }
        },
        {
          "feature": "Built-in team chat",
          "statuses": {
            "basecamp": "available",
            "paymo": "not-documented",
            "proofhub": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Flat-rate unlimited-user plan",
          "statuses": {
            "basecamp": "available",
            "paymo": "limited",
            "proofhub": "available"
          },
          "note": "Paymo's Plus and Pro plans allow unlimited users but still bill per user rather than a single flat fee."
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "basecamp": "unavailable",
            "paymo": "available",
            "proofhub": "unavailable"
          },
          "note": "Basecamp and ProofHub offer free trials rather than an always-free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Basecamp offer file proofing like ProofHub?",
      "answer": "No. Basecamp focuses on to-do lists, message boards, schedules, and chat; ProofHub is the one of the three built around reviewing and approving creative files inside the platform."
    },
    {
      "question": "Is ProofHub really flat-rate for unlimited users?",
      "answer": "Yes. Both the Essential and Ultimate Control plans include unlimited users at a fixed monthly price, similar to Basecamp's Pro Unlimited plan."
    },
    {
      "question": "Which tool is cheapest for a solo freelancer?",
      "answer": "Paymo, since its Free and Solo plans are priced for a single user, whereas Basecamp and ProofHub are built around flat-rate team pricing that assumes multiple users."
    },
    {
      "question": "Does Basecamp have per-user pricing as an alternative to the flat rate?",
      "answer": "Yes. Basecamp offers $15 per user per month as well as a flat monthly fee for unlimited users, so teams can choose whichever works out cheaper for their size."
    },
    {
      "question": "Which is best for creative agencies needing client approvals?",
      "answer": "ProofHub, because its built-in proofing tool lets agencies collect markup and sign-off on creative files without switching to a separate review tool."
    },
    {
      "question": "Do any of these three include native invoicing?",
      "answer": "Only Paymo documents a native time-to-invoice workflow; Basecamp and ProofHub do not include built-in client invoicing."
    }
  ]
};

export default basecampVsPaymoVsProofhubContent;
