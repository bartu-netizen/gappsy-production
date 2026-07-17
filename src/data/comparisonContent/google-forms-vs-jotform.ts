import type { ToolComparisonContent } from './types';

const googleFormsVsJotformContent: ToolComparisonContent = {
  "verdict": "Google Forms and Jotform both let you build online forms, but they are built for different jobs. Google Forms is a free, no-frills tool bundled into the Google ecosystem, tuned for quick surveys, quizzes, RSVPs, and internal data collection that flows straight into Google Sheets. It has essentially no cost barrier, but it also has no native payment collection, no e-signature or PDF generation, and only basic section-based branching logic. Jotform is a broader form and workflow platform: alongside form building it adds payment processing through Stripe, PayPal, and Square, legally binding e-signatures through Jotform Sign, automatic PDF generation, workflow automation, and a spreadsheet-style Jotform Tables view. That depth comes with a steeper free-plan ceiling of 5 forms and 100 monthly submissions, with paid plans starting at $34 per month once you need real volume. For a teacher grading a quiz or a team polling coworkers inside Google Workspace, Google Forms does the job at zero cost. For a business collecting payments, contracts, or HIPAA-sensitive intake, or one that needs approval workflows after submission, Jotform is the more complete tool, at a real subscription price. The right choice depends on whether the job is simple data collection or a full form-driven business process.",
  "bestForToolA": "Google Forms is the better fit for individuals, educators, and Google Workspace users who need free, simple surveys, quizzes, or internal data collection with no payment or complex workflow requirements.",
  "bestForToolB": "Jotform is the better fit for businesses that need to collect payments, gather e-signatures, generate PDFs, or automate approval workflows after submission, and are willing to pay for higher volume and compliance features.",
  "whoNeedsBoth": "A team already using Google Workspace for quick internal polls and quizzes, but also selling products, collecting signed agreements, or handling HIPAA-sensitive intake, would reasonably keep Google Forms for the simple internal cases and Jotform for anything involving payments, signatures, or compliance.",
  "keyDifferences": [
    {
      "title": "Pricing model",
      "toolA": "Completely free with no paywall on core form, survey, and quiz functionality.",
      "toolB": "Free Starter plan is capped at 5 forms and 100 monthly submissions; paid plans start from 34 dollars per month billed annually.",
      "whyItMatters": "Budget-conscious users can build unlimited forms on Google Forms at no cost, while any team with real submission volume on Jotform will eventually hit a wall and need to pay.",
      "benefitsWho": "Individuals, students, and small internal projects benefit most from Google Forms free tier; teams with predictable budgets that need volume benefit from Jotform paid plans."
    },
    {
      "title": "Core use case",
      "toolA": "A simple, general-purpose form and survey tool tied into the Google ecosystem, focused on collecting and viewing responses in Sheets.",
      "toolB": "A broader form-driven platform covering payments, e-signatures, PDF generation, and post-submission workflow automation, not just data collection.",
      "whyItMatters": "Choosing based on scope avoids paying for capability you will not use, or hitting a wall on a tool that was never meant to do more than basic data collection.",
      "benefitsWho": "Casual and internal use cases benefit from Google Forms simplicity; businesses building forms into revenue or operational processes benefit from Jotform breadth."
    },
    {
      "title": "Payment collection",
      "toolA": "No native payment collection; orders or paid registrations require a separate payment tool or add-on.",
      "toolB": "Accepts payments and donations directly on forms through Stripe, PayPal, Square, and other processors.",
      "whyItMatters": "Anyone selling tickets, products, or accepting donations through a form needs built-in payment handling rather than a workaround.",
      "benefitsWho": "Nonprofits, event organizers, and small sellers benefit from Jotform native payment support."
    },
    {
      "title": "Conditional logic depth",
      "toolA": "Sections with skip logic route respondents based on prior answers, but branching is limited to simple, section-based paths.",
      "toolB": "A dedicated conditional logic system can show, hide, or route individual fields and pages based on prior answers.",
      "whyItMatters": "Complex intake forms with many branching paths need finer-grained logic than section-level skipping can provide.",
      "benefitsWho": "HR, healthcare, and operations teams building multi-path intake forms benefit from Jotform conditional logic."
    },
    {
      "title": "Document and e-signature tools",
      "toolA": "No documented e-signature or automatic PDF generation capability.",
      "toolB": "Includes Jotform Sign for legally binding e-signatures and a PDF Editor that converts submissions into formatted, downloadable documents.",
      "whyItMatters": "Contracts, waivers, and formal paperwork often require a signed, exportable document, not just raw response data.",
      "benefitsWho": "Legal, HR, and agency teams handling signed agreements benefit from Jotform document tools."
    },
    {
      "title": "Real-time collaborative editing",
      "toolA": "Multiple people can build and edit the same form simultaneously, similar to Google Docs.",
      "toolB": "Not documented as a feature in the provided facts.",
      "whyItMatters": "Teams that co-author forms together in real time need simultaneous multi-user editing rather than handing off a single editor role.",
      "benefitsWho": "Teams already collaborating in Google Docs and Sheets benefit from Google Forms shared editing."
    },
    {
      "title": "Extensibility approach",
      "toolA": "Google Workspace Marketplace add-ons and Apps Script allow custom automation such as notification emails or third-party connections.",
      "toolB": "Connects to CRMs, email marketing tools, cloud storage, and hundreds of other apps through built-in integrations, and is tagged as offering API access.",
      "whyItMatters": "Whether a team needs to write custom scripts or simply connect pre-built integrations changes how much technical effort is required to automate a form.",
      "benefitsWho": "Developers comfortable scripting in the Google ecosystem benefit from Apps Script; non-technical teams wanting turnkey connections benefit from Jotform integrations."
    },
    {
      "title": "Mobile app building",
      "toolA": "Not documented beyond working reliably on mobile devices through iOS and Android access.",
      "toolB": "An App Builder can turn forms and workflows into standalone mobile-friendly apps.",
      "whyItMatters": "Teams that want a dedicated branded app experience, not just a mobile-friendly web form, need app-building capability.",
      "benefitsWho": "Businesses wanting a lightweight branded app benefit from Jotform App Builder."
    },
    {
      "title": "Compliance features",
      "toolA": "Not documented as offering HIPAA compliance or similar formal certifications.",
      "toolB": "HIPAA-compliant form options are available on the Gold and Enterprise plans, commonly used for patient intake.",
      "whyItMatters": "Healthcare and other regulated organizations cannot use a form tool that lacks formal compliance options for sensitive data.",
      "benefitsWho": "Healthcare providers and regulated organizations benefit from Jotform HIPAA support."
    },
    {
      "title": "Company background",
      "toolA": "Built by Google, founded in 1998 and headquartered in Mountain View, California.",
      "toolB": "Jotform was founded in 2006 as a dedicated form-building company, headquartered in San Francisco, California.",
      "whyItMatters": "A form tool backed by a large parent companys infrastructure versus a company solely focused on forms can affect long-term feature investment and reliability expectations.",
      "benefitsWho": "Users wanting infrastructure backed by a large established company may lean toward Google Forms; those wanting a company singularly focused on form-building depth may lean toward Jotform."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core form building",
      "rows": [
        {
          "feature": "Question and field types",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Forms covers multiple choice, checkboxes, dropdowns, text, grids, date and time, and file upload."
        },
        {
          "feature": "Drag-and-drop visual editor",
          "toolA": "limited",
          "toolB": "available",
          "note": "Google Forms has a simpler linear builder rather than a full drag-and-drop layout editor."
        },
        {
          "feature": "Template library",
          "toolA": "available",
          "toolB": "available",
          "note": "Jotform is documented as offering thousands of templates versus a smaller set of pre-built templates in Google Forms."
        }
      ]
    },
    {
      "group": "Logic and automation",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "toolA": "limited",
          "toolB": "available",
          "note": "Google Forms limits branching to section-based skip logic."
        },
        {
          "feature": "Post-submission workflow automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform documents approval flows and multi-step routing after submission."
        },
        {
          "feature": "Response validation rules",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Forms documents field-level validation such as number ranges or text length."
        }
      ]
    },
    {
      "group": "Payments and monetization",
      "rows": [
        {
          "feature": "Native payment collection",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Google Forms requires a separate payment tool or add-on."
        },
        {
          "feature": "Payment processor options",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Jotform supports Stripe, PayPal, Square, and other processors."
        }
      ]
    },
    {
      "group": "Data and document output",
      "rows": [
        {
          "feature": "Spreadsheet-style response management",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Forms syncs to Google Sheets; Jotform uses its own Jotform Tables view."
        },
        {
          "feature": "Automatic PDF generation from submissions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform documents a PDF Editor that converts submissions into downloadable documents."
        },
        {
          "feature": "E-signature collection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform Sign provides legally binding electronic signatures."
        }
      ]
    },
    {
      "group": "Collaboration and sharing",
      "rows": [
        {
          "feature": "Real-time collaborative form editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Forms supports simultaneous multi-user editing similar to Google Docs."
        },
        {
          "feature": "Sharing via link, email, or embed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Forms explicitly documents link, email, embed, and social sharing options."
        }
      ]
    },
    {
      "group": "Extensibility and integrations",
      "rows": [
        {
          "feature": "Custom scripting or add-ons",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Forms uses Google Workspace Marketplace add-ons and Apps Script."
        },
        {
          "feature": "Third-party app integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform connects to CRMs, email marketing tools, and cloud storage among hundreds of apps."
        },
        {
          "feature": "Standalone app building",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform App Builder turns forms and workflows into mobile-friendly apps."
        }
      ]
    },
    {
      "group": "Pricing and compliance",
      "rows": [
        {
          "feature": "Free plan usability at scale",
          "toolA": "available",
          "toolB": "limited",
          "note": "Google Forms allows unlimited forms free; Jotform Starter caps at 5 forms and 100 monthly submissions."
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jotform offers HIPAA-compliant options on its Gold and Enterprise plans."
        },
        {
          "feature": "Branding removal or white-labeling",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Jotform branding is included on the free Starter plan and removed starting on the Bronze plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Google Forms or Jotform?",
      "answer": "Google Forms is cheaper for most use cases since it is completely free with no paywall on core features, while Jotforms free plan is capped at 5 forms and 100 monthly submissions and paid plans start from 34 dollars per month billed annually."
    },
    {
      "question": "Can Google Forms collect payments like Jotform?",
      "answer": "No, Google Forms has no native payment collection and requires a separate payment tool or add-on, while Jotform supports direct payment collection through Stripe, PayPal, Square, and other processors."
    },
    {
      "question": "Is Google Forms good for beginners?",
      "answer": "Yes, Google Forms is very easy to learn with almost no setup required and only needs a Google account, making it one of the simpler options for beginners building their first survey or quiz."
    },
    {
      "question": "Does Jotform support HIPAA compliance?",
      "answer": "Yes, Jotform offers HIPAA-compliant form options on its Gold and Enterprise plans, commonly used by healthcare providers for patient intake forms."
    },
    {
      "question": "Can Jotform do everything Google Forms can do?",
      "answer": "Jotform covers form building, conditional logic, and templates like Google Forms and adds payments, e-signatures, PDF generation, and workflow automation, though real-time collaborative editing between multiple form builders is not documented as a Jotform feature."
    },
    {
      "question": "Which tool has more templates?",
      "answer": "Jotform has the larger documented template library with thousands of templates across industries, compared to Google Forms smaller gallery of templates for use cases like RSVPs, surveys, and quizzes."
    }
  ]
};

export default googleFormsVsJotformContent;
