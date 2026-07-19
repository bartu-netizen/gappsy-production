import type { GroupComparisonContent } from './types';

const formpressVsMicrosoftFormsVsZohoFormsContent: GroupComparisonContent = {
  "verdict": "All three build forms with drag-and-drop editors and conditional logic, but they target different buyers. FormPress is the pick for anyone who wants a free, open-source, self-hostable form tool with full data control. Microsoft Forms is the pick if you already pay for Microsoft 365 or Office 365 and want a form and quiz tool bundled at no extra cost with deep Teams, Excel, and SharePoint integration. Zoho Forms is the pick if you need form building plus real workflow automation, payment collection, and offline field data collection, especially alongside other Zoho apps.",
  "bestFor": {
    "formpress": "Developers, small businesses, and WordPress site owners who want a genuinely open-source, self-hostable form builder that keeps full control over where submitted data is stored.",
    "microsoft-forms": "Organizations and schools already on a Microsoft 365 or Office 365 subscription who want quick surveys, quizzes, and forms bundled at no extra cost with native Excel, Teams, and SharePoint integration.",
    "zoho-forms": "Businesses that need form building combined with multi-level approval workflows, payment collection, and offline mobile data collection, particularly if they already use other Zoho apps."
  },
  "highlights": [
    {
      "title": "Zoho Forms has the deepest feature set of the three",
      "description": "Zoho Forms goes further with multi-level approval workflows, built-in payment processing through PayPal, Stripe, and 2Checkout, and a mobile app that can capture form data offline, complete with location tagging and QR scanning — none of which FormPress or Microsoft Forms document.",
      "toolSlugs": [
        "zoho-forms"
      ]
    },
    {
      "title": "Microsoft Forms wins on cost if you are already a Microsoft 365 customer",
      "description": "Any active Microsoft 365 or Office 365 subscription already includes Microsoft Forms — there's no separate purchase needed, and that bundled access is what sets it apart from standalone form builders.",
      "toolSlugs": [
        "microsoft-forms"
      ]
    },
    {
      "title": "FormPress is the only fully open-source, self-hostable option",
      "description": "FormPress publishes its full application source code and can be self-hosted on your own infrastructure, giving complete control over form data storage, unlike the vendor-hosted Microsoft Forms and Zoho Forms.",
      "toolSlugs": [
        "formpress"
      ]
    },
    {
      "title": "Free-tier limits differ significantly",
      "description": "Microsoft Forms' free personal plan caps out at 200 responses per form and 400 surveys, and Zoho Forms' free plan has limited monthly submissions, while FormPress markets itself as free with no documented response caps because it is self-hosted.",
      "toolSlugs": [
        "formpress",
        "microsoft-forms",
        "zoho-forms"
      ]
    },
    {
      "title": "Compliance depth varies",
      "description": "Zoho Forms documents GDPR, HIPAA, and CCPA support (with HIPAA reserved for its top Premium plan) and Microsoft Forms achieved GDPR compliance in 2017, while FormPress's compliance posture is not documented in available data.",
      "toolSlugs": [
        "formpress",
        "microsoft-forms",
        "zoho-forms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Form Building",
      "rows": [
        {
          "feature": "Drag-and-drop WYSIWYG builder",
          "statuses": {
            "formpress": "available",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Conditional / branching logic",
          "statuses": {
            "formpress": "available",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Custom branding on entry-level or free plan",
          "statuses": {
            "formpress": "not-documented",
            "microsoft-forms": "unavailable",
            "zoho-forms": "available"
          },
          "note": "Microsoft Forms explicitly has no custom branding on lower tiers; Zoho Forms offers custom themes across plans."
        }
      ]
    },
    {
      "group": "Automation and Data Collection",
      "rows": [
        {
          "feature": "Multi-level approval workflows",
          "statuses": {
            "formpress": "unavailable",
            "microsoft-forms": "limited",
            "zoho-forms": "available"
          },
          "note": "Microsoft Forms can approximate approvals via Power Automate but has no native approval workflow feature like Zoho Forms."
        },
        {
          "feature": "Built-in payment collection",
          "statuses": {
            "formpress": "unavailable",
            "microsoft-forms": "unavailable",
            "zoho-forms": "available"
          }
        },
        {
          "feature": "Offline mobile data collection",
          "statuses": {
            "formpress": "not-documented",
            "microsoft-forms": "unavailable",
            "zoho-forms": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations and Deployment",
      "rows": [
        {
          "feature": "Self-hosting option",
          "statuses": {
            "formpress": "available",
            "microsoft-forms": "unavailable",
            "zoho-forms": "unavailable"
          }
        },
        {
          "feature": "Native integration with a wider productivity suite",
          "statuses": {
            "formpress": "limited",
            "microsoft-forms": "available",
            "zoho-forms": "available"
          },
          "note": "FormPress integrates with WordPress via a Gutenberg block; Microsoft Forms ties into Teams, Excel, SharePoint, and Power Automate; Zoho Forms ties into the broader Zoho suite."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is FormPress really free, or does it have paid tiers like the other two?",
      "answer": "FormPress positions itself as free to use and open source, but detailed public pricing pages with named paid tiers were not found in available data, so buyers with high-volume or commercial needs should confirm current terms directly with FormPress."
    },
    {
      "question": "Can I self-host any of these instead of relying on the vendor's cloud?",
      "answer": "Only FormPress. Its full application source code is available for self-hosting, while Microsoft Forms and Zoho Forms are vendor-hosted SaaS products with no self-hosting option."
    },
    {
      "question": "Which of these lets me collect payments directly through a form?",
      "answer": "Zoho Forms, which supports payment integrations with PayPal, Stripe, and 2Checkout starting on its Basic plan. This is not documented as a feature of FormPress or Microsoft Forms."
    },
    {
      "question": "Does Microsoft Forms cost extra on top of my Microsoft 365 subscription?",
      "answer": "No — Microsoft Forms comes bundled with every Microsoft 365 and Office 365 subscription at no added charge, which is the main way it stands apart from standalone tools like Zoho Forms."
    },
    {
      "question": "Which tool is best for collecting data in the field without an internet connection?",
      "answer": "Zoho Forms is the answer here — its mobile app can gather submissions without an internet connection while still tagging each entry's location and scanning QR codes. Neither FormPress nor Microsoft Forms documents this capability."
    },
    {
      "question": "Is HIPAA compliance available with any of these three?",
      "answer": "Zoho Forms is the only one of the three that documents HIPAA compliance, and that coverage is reserved for its highest-priced Premium plan, which runs $90 per month. Neither FormPress nor Microsoft Forms documents HIPAA support."
    }
  ]
};

export default formpressVsMicrosoftFormsVsZohoFormsContent;
