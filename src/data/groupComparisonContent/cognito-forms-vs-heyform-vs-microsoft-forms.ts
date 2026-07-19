import type { GroupComparisonContent } from './types';

const cognitoFormsVsHeyformVsMicrosoftFormsContent: GroupComparisonContent = {
  "verdict": "The right pick depends on whether payments, openness, or ecosystem lock-in matters most. Cognito Forms is the strongest choice when a form needs to collect money and enforce complex conditional logic on a genuinely free tier. HeyForm is the only one of the three that is open source and self-hostable, which matters for teams that want full control of their data or want to avoid response-based fees long-term. Microsoft Forms wins for organizations already paying for Microsoft 365, since it is the only option with native Excel, Teams, and SharePoint integration and automatic quiz grading.",
  "bestFor": {
    "cognito-forms": "Small businesses, nonprofits, and schools that need to accept payments (via Stripe, PayPal, or Square) and build conditional logic or cost calculations directly into a form without paying for a separate payment integration.",
    "heyform": "Startups, indie makers, and technically capable teams who want a genuinely open-source, self-hostable conversational form builder to keep full ownership of response data and avoid escalating per-response fees.",
    "microsoft-forms": "Organizations already standardized on Microsoft 365 that want forms and quizzes to flow natively into Excel, Teams assignments, and SharePoint without any extra setup or integration work."
  },
  "highlights": [
    {
      "title": "Cognito Forms pairs a real free plan with native payments",
      "description": "Cognito Forms' free Individual plan allows unlimited forms and includes payment acceptance via Stripe, PayPal, or Square, which is unusual for a free tier and makes it a strong pick for registration or order forms that need to collect money from day one.",
      "toolSlugs": [
        "cognito-forms"
      ]
    },
    {
      "title": "HeyForm is the only self-hostable option",
      "description": "HeyForm is open source and can be self-hosted via Docker, giving teams full control over where response data lives, an option neither Cognito Forms nor Microsoft Forms offers.",
      "toolSlugs": [
        "heyform"
      ]
    },
    {
      "title": "Microsoft Forms is built for the Microsoft 365 workflow",
      "description": "Automatic quiz grading with Teams assignment integration, direct Excel export, SharePoint embedding, and Power Automate triggers make Microsoft Forms the natural choice for organizations that already live inside Microsoft 365.",
      "toolSlugs": [
        "microsoft-forms"
      ]
    },
    {
      "title": "Free-tier generosity varies sharply",
      "description": "Cognito Forms and HeyForm both allow unlimited forms on their free plans (capped by monthly entries or responses), while Microsoft Forms caps free Personal accounts at 200 responses per form, which can be limiting for anything beyond casual use.",
      "toolSlugs": [
        "cognito-forms",
        "heyform",
        "microsoft-forms"
      ]
    },
    {
      "title": "Only two of the three accept payments natively",
      "description": "Cognito Forms and HeyForm both let respondents pay directly through the form, with HeyForm charging a payment commission that decreases as customers move up plan tiers, while Microsoft Forms has no documented native payment collection feature.",
      "toolSlugs": [
        "cognito-forms",
        "heyform"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Form Building and Logic",
      "rows": [
        {
          "feature": "Conditional logic / branching",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "microsoft-forms": "available"
          }
        },
        {
          "feature": "Electronic signature capture",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "not-documented",
            "microsoft-forms": "not-documented"
          },
          "note": "Cognito Forms offers e-signatures on its Pro plan and above."
        },
        {
          "feature": "Automatic quiz grading",
          "statuses": {
            "cognito-forms": "not-documented",
            "heyform": "not-documented",
            "microsoft-forms": "available"
          },
          "note": "Microsoft Forms quizzes can be auto-graded and pushed into Teams assignments."
        }
      ]
    },
    {
      "group": "Payments and Commerce",
      "rows": [
        {
          "feature": "Native payment collection",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "microsoft-forms": "not-documented"
          },
          "note": "Cognito Forms uses Stripe, PayPal, or Square; HeyForm charges a commission that decreases at higher plan tiers."
        }
      ]
    },
    {
      "group": "Hosting, Ecosystem and Collaboration",
      "rows": [
        {
          "feature": "Self-hosting / open-source option",
          "statuses": {
            "cognito-forms": "unavailable",
            "heyform": "available",
            "microsoft-forms": "unavailable"
          }
        },
        {
          "feature": "Native productivity-suite integration (Excel, Teams, SharePoint)",
          "statuses": {
            "cognito-forms": "unavailable",
            "heyform": "unavailable",
            "microsoft-forms": "available"
          },
          "note": "Cognito Forms and HeyForm connect to other software via Zapier, Power Automate, or webhooks rather than native suite integration."
        },
        {
          "feature": "Multi-user team collaboration",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "microsoft-forms": "limited"
          },
          "note": "Cognito Forms (Team plan, client portal) and HeyForm (Premium/Business workspaces) document explicit multi-member plans; Microsoft Forms relies on org-wide Microsoft 365 sharing rather than a dedicated team workspace feature."
        }
      ]
    },
    {
      "group": "Free Plan Value",
      "rows": [
        {
          "feature": "Unlimited forms on the free plan",
          "statuses": {
            "cognito-forms": "available",
            "heyform": "available",
            "microsoft-forms": "limited"
          },
          "note": "Microsoft Forms Free Personal caps at 200 responses per form and 400 surveys total."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has the most usable free plan?",
      "answer": "Cognito Forms and HeyForm both allow unlimited forms on their free tiers, with Cognito Forms capped at 100 entries per month and HeyForm at 250 responses per month. Microsoft Forms Free Personal is capped at 200 responses per form and 400 surveys total, which can run out faster for an active form."
    },
    {
      "question": "Can I collect payments directly through the form?",
      "answer": "Yes with Cognito Forms (via Stripe, PayPal, or Square, including on the free plan) and yes with HeyForm (built-in payment forms with a commission that decreases on higher plans). Microsoft Forms does not document a native payment collection feature."
    },
    {
      "question": "Is any of these tools self-hostable?",
      "answer": "HeyForm is the only one of the three that is open source and can be self-hosted via Docker for full control over response data. Cognito Forms and Microsoft Forms are both cloud-only SaaS products."
    },
    {
      "question": "Which tool is best for quizzes with automatic grading?",
      "answer": "Microsoft Forms is the clear choice here, since it supports automatic quiz grading with due dates and direct integration into Microsoft Teams assignments, a capability not documented for Cognito Forms or HeyForm."
    },
    {
      "question": "Do I need a Microsoft 365 subscription to use Microsoft Forms?",
      "answer": "No, a Free Personal plan exists with response and survey caps, but the higher-volume tiers (up to 1,000 or up to 5,000,000 responses per form) are included as part of Microsoft 365 Personal or Business/Education licensing rather than sold as a standalone Forms subscription."
    },
    {
      "question": "Which tool scales best for a growing team that needs more seats?",
      "answer": "Cognito Forms Team plan supports 5 users plus 5 guest accounts with a client portal and approval workflows for $39.20/month billed annually, while HeyForm Business supports up to 10 team members with zero payment commission for $40/month. Microsoft Forms collaboration instead scales through an organization's entire Microsoft 365 business or education licensing rather than a per-seat forms plan."
    }
  ]
};

export default cognitoFormsVsHeyformVsMicrosoftFormsContent;
