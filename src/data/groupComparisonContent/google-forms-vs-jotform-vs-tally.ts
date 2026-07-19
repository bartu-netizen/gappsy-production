import type { GroupComparisonContent } from './types';

const googleFormsVsJotformVsTallyContent: GroupComparisonContent = {
  "verdict": "Google Forms, Jotform, and Tally each take a different approach to being 'the free form builder.' Google Forms is bundled free into every Google Account with no premium tier or response caps, but it trades away payment collection and design flexibility. Jotform is the deepest commercial option, layering payments, e-signatures, approvals, and AI agents on top of form building. Tally splits the difference, offering a modern, document-style editor with unlimited free submissions but without Google Forms' native Sheets and Classroom integrations.",
  "bestFor": {
    "google-forms": "Teams already on Google Workspace who need a completely free, no-frills form or quiz builder with native Google Sheets integration.",
    "jotform": "Businesses needing a single platform for forms, payments, e-signatures, approvals, and AI agents at scale.",
    "tally": "Startups and indie builders who want a free, unlimited-submission form tool with a modern editor and no spreadsheet-suite lock-in."
  },
  "highlights": [
    {
      "title": "Zero Cost, No Catch",
      "description": "Google Forms carries no separate price tag at all, with unlimited forms and responses included in every free Google Account.",
      "toolSlugs": [
        "google-forms"
      ]
    },
    {
      "title": "Deepest Commercial Feature Set",
      "description": "Jotform bundles payments, e-signatures, approval workflows, data tables, and AI agents that Google Forms does not offer natively.",
      "toolSlugs": [
        "jotform"
      ]
    },
    {
      "title": "Unlimited Free Submissions on a Dedicated Builder",
      "description": "Tally's free plan matches Google Forms on unlimited submissions while adding payments, signatures, and conditional logic that Google Forms lacks.",
      "toolSlugs": [
        "tally"
      ]
    },
    {
      "title": "Payment Collection Is Not Universal",
      "description": "Jotform and Tally both collect payments directly on forms; Google Forms has no native payment collection without third-party add-ons.",
      "toolSlugs": [
        "jotform",
        "tally"
      ]
    },
    {
      "title": "Classroom and Workspace Fit",
      "description": "Google Forms' Quiz mode and Google Classroom integration make it the default choice for education use cases already standardized on Google Workspace.",
      "toolSlugs": [
        "google-forms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Limits",
      "rows": [
        {
          "feature": "Free plan response/submission limits",
          "statuses": {
            "google-forms": "available",
            "jotform": "limited",
            "tally": "available"
          },
          "note": "Google Forms and Tally are unlimited on free; Jotform's free Starter plan caps at 100 submissions/month."
        },
        {
          "feature": "Native payment collection",
          "statuses": {
            "google-forms": "unavailable",
            "jotform": "available",
            "tally": "available"
          }
        }
      ]
    },
    {
      "group": "Logic and Design",
      "rows": [
        {
          "feature": "Conditional logic/branching",
          "statuses": {
            "google-forms": "available",
            "jotform": "available",
            "tally": "available"
          }
        },
        {
          "feature": "Branding removed on free plan",
          "statuses": {
            "google-forms": "available",
            "jotform": "unavailable",
            "tally": "unavailable"
          },
          "note": "Jotform and Tally show their own branding until upgraded to a paid plan."
        },
        {
          "feature": "E-signature collection",
          "statuses": {
            "google-forms": "unavailable",
            "jotform": "available",
            "tally": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Data",
      "rows": [
        {
          "feature": "Real-time collaborative editing",
          "statuses": {
            "google-forms": "available",
            "jotform": "not-documented",
            "tally": "not-documented"
          }
        },
        {
          "feature": "Live spreadsheet/data table integration",
          "statuses": {
            "google-forms": "available",
            "jotform": "available",
            "tally": "available"
          },
          "note": "Google Sheets live-links natively; Jotform has its own Tables product; Tally connects out to Google Sheets."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Google Forms really free with no hidden limits?",
      "answer": "Yes. Google Forms has no separate subscription, premium tier, or response cap; it is included free with every personal Google Account and every Google Workspace plan."
    },
    {
      "question": "Which of these tools can collect payments directly on a form?",
      "answer": "Jotform and Tally both support native payment collection. Google Forms has no built-in payment collection and requires third-party add-ons to accept payments."
    },
    {
      "question": "Which has the best free plan for high-volume form submissions?",
      "answer": "Google Forms and Tally both offer unlimited submissions on their free plans. Jotform's free Starter plan is capped at 100 submissions per month."
    },
    {
      "question": "Does Google Forms support e-signatures?",
      "answer": "Not natively. Jotform and Tally both support e-signature collection directly within a form; Google Forms would require a third-party add-on."
    },
    {
      "question": "Which tool is best suited for classroom or education use?",
      "answer": "Google Forms is the strongest fit for education, thanks to its built-in Quiz mode with auto-grading and direct integration with Google Classroom."
    },
    {
      "question": "Do Jotform and Tally both show branding on free forms?",
      "answer": "Yes, both Jotform's Starter plan and Tally's free plan display the provider's own branding on forms; removing it requires upgrading to a paid plan on either platform."
    }
  ]
};

export default googleFormsVsJotformVsTallyContent;
