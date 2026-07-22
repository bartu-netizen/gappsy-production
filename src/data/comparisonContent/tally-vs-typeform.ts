import type { ToolComparisonContent } from './types';

const tallyVsTypeformContent: ToolComparisonContent = {
  "verdict": "Tally and Typeform solve the same broad problem, collecting form responses, but they are built for different jobs. Tally is a document-style form builder that gives away nearly its full feature set, conditional logic, calculated fields, Stripe payments, e-signatures, and file uploads, on a forever-free plan with unlimited forms and submissions, making it a strong fit for anyone who needs a functional, logic-capable form without a budget line item. Typeform is built around a conversational, one-question-at-a-time respondent experience with embedded video questions and automated lead scoring, aimed at teams that treat the form itself as a branded, engagement-driving surface rather than just a data-collection utility, and it backs that with purpose-built plans like Talent and Growth Flow. That polish and specialization comes at a cost: Typeform has no free tier, and its entry-level Basic plan starts at 28 dollars a month with a cap of only 100 responses monthly, versus Tally's zero-cost, uncapped starting point. Neither tool is objectively better; a bootstrapped team building internal surveys or payment-collecting order forms will get more for free from Tally, while a marketing or recruiting team that needs video-driven engagement and lead scoring, and can absorb response caps and per-plan pricing, may find Typeform's format worth paying for. The right choice depends on whether the priority is cost-efficient functionality or a curated respondent experience.",
  "bestForToolA": "Tally is the better fit for budget-conscious freelancers, startups, and small teams who need unlimited forms with payments, e-signatures, and conditional logic without paying anything to start.",
  "bestForToolB": "Typeform is the better fit for marketing and recruiting teams that want a conversational, video-capable respondent experience and automated lead scoring, and are willing to pay for purpose-built plans.",
  "whoNeedsBoth": "An agency or growth team might use Tally's free tier for internal, logic-heavy operational forms while running external-facing lead-gen or recruiting funnels on Typeform to take advantage of its conversational format and lead scoring.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "Tally offers a forever-free plan with unlimited forms and submissions, including logic, payments, signatures, and file uploads",
      "toolB": "Typeform has no free tier; Basic starts at 28 dollars a month with a cap of only 100 responses monthly",
      "whyItMatters": "Teams testing form tools or running low-budget projects need to know whether they can get real functionality without paying",
      "benefitsWho": "Startups, freelancers, and cash-conscious small teams benefit most from Tally's free tier"
    },
    {
      "title": "Core editing paradigm",
      "toolA": "Tally uses a document-style editor where you type content and insert fields with slash commands",
      "toolB": "Typeform presents forms conversationally, one question at a time, designed for higher completion rates",
      "whyItMatters": "The editing and respondent experience shapes both how fast forms are built and how respondents engage with them",
      "benefitsWho": "Fast, text-first builders favor Tally; teams optimizing respondent engagement favor Typeform"
    },
    {
      "title": "Payments, signatures, and file uploads",
      "toolA": "Tally includes Stripe payment collection, e-signatures, and file uploads on its free plan",
      "toolB": "Not documented in the available Typeform facts",
      "whyItMatters": "Built-in payment and signature collection removes the need for separate tools or integrations in order forms and contracts",
      "benefitsWho": "Freelancers, small businesses, and anyone collecting payments or signed documents directly through a form"
    },
    {
      "title": "Conditional logic and calculated fields",
      "toolA": "Tally supports branching logic and dynamic calculated fields that update results in real time",
      "toolB": "Not documented in the available Typeform facts",
      "whyItMatters": "Dynamic forms that adapt to respondent answers reduce irrelevant questions and can compute results like quotes or scores",
      "benefitsWho": "Survey and quiz builders that need adaptive question flows"
    },
    {
      "title": "Video questions",
      "toolA": "Not documented in the available Tally facts",
      "toolB": "Typeform allows video to be embedded directly into form questions",
      "whyItMatters": "Video questions can make a form feel more personal and engaging, which matters for brand-facing surveys",
      "benefitsWho": "Marketing and recruiting teams wanting a more human, engaging respondent experience"
    },
    {
      "title": "Automated lead scoring",
      "toolA": "Not documented in the available Tally facts",
      "toolB": "Typeform automatically scores leads based on form responses",
      "whyItMatters": "Automatic scoring helps sales teams prioritize follow-up without manually reviewing every submission",
      "benefitsWho": "Sales and marketing teams running lead-gen or qualification forms"
    },
    {
      "title": "Purpose-built plan tiers",
      "toolA": "Tally's plans (Free, Pro, Business) are general-purpose rather than use-case specific",
      "toolB": "Typeform offers separately priced, purpose-built tiers, Talent for recruiting and Growth Flow for lead generation",
      "whyItMatters": "Niche tiers can bundle exactly the features a specific team needs, but add pricing complexity",
      "benefitsWho": "Recruiting teams and lead-gen focused marketers evaluating Typeform's specialized plans"
    },
    {
      "title": "Named integrations versus integration breadth",
      "toolA": "Tally names specific native integrations: Google Sheets, Notion, Airtable, Slack, Zapier, Make, and Pipedream",
      "toolB": "Typeform is described as offering hundreds of third-party integrations, without specific platforms named",
      "whyItMatters": "Buyers need to confirm their exact tool stack is supported rather than relying on a general integration count",
      "benefitsWho": "Teams with a known, specific tool stack benefit from Tally's named list; teams wanting broad general coverage may look favorably on Typeform's stated breadth"
    },
    {
      "title": "Developer API",
      "toolA": "Tally provides a documented REST API to create forms, manage fields, and fetch or delete submissions",
      "toolB": "Not documented in the available Typeform facts",
      "whyItMatters": "A documented API is required for teams building custom automation or integrations beyond native connectors",
      "benefitsWho": "Developers and technical teams building custom workflows around form data"
    },
    {
      "title": "Multi-language and RTL support",
      "toolA": "Tally forms can be presented in 45+ languages with right-to-left layout support",
      "toolB": "Not documented in the available Typeform facts",
      "whyItMatters": "Built-in localization removes the need for manual translation work when serving international respondents",
      "benefitsWho": "International teams and multilingual audiences needing forms in respondents' native language"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Building",
      "rows": [
        {
          "feature": "Document-style editor (type and insert fields)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Typeform uses a conversational one-question-at-a-time format instead"
        },
        {
          "feature": "Conversational one-question-at-a-time format",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tally uses a document-style editor instead"
        },
        {
          "feature": "Video embedded in questions",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Pre-built template library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Tally offers 100+ templates"
        }
      ]
    },
    {
      "group": "Logic and Automation",
      "rows": [
        {
          "feature": "Conditional branching logic",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Calculated fields",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Automated lead scoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Payments, Signatures, and Files",
      "rows": [
        {
          "feature": "Stripe payment collection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Tally's free plan"
        },
        {
          "feature": "E-signature capture",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Tally's free plan"
        },
        {
          "feature": "File uploads",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Tally's free plan"
        }
      ]
    },
    {
      "group": "Customization and Branding",
      "rows": [
        {
          "feature": "Remove builder branding",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Requires Tally Pro plan or above"
        },
        {
          "feature": "Custom domain",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Requires Tally Pro plan or above"
        },
        {
          "feature": "Custom CSS",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Requires Tally Pro plan or above"
        }
      ]
    },
    {
      "group": "Integrations and Developer Tools",
      "rows": [
        {
          "feature": "Native third-party integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Tally names specific tools; Typeform is described as offering hundreds of integrations without specifics"
        },
        {
          "feature": "Webhook support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Included on Tally's free plan"
        },
        {
          "feature": "Documented developer REST API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Tally's API is documented at developers.tally.so"
        }
      ]
    },
    {
      "group": "Localization and Accessibility",
      "rows": [
        {
          "feature": "Multi-language support (45+ languages)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Right-to-left layout support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Analytics and Insights",
      "rows": [
        {
          "feature": "Form visit and drop-off analytics",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Extended history on Tally's paid plans"
        },
        {
          "feature": "Automated lead scoring analytics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Team Collaboration",
      "rows": [
        {
          "feature": "Unlimited team members",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Tally's paid plans"
        },
        {
          "feature": "Workspaces and folders",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Typeform's Basic plan starts at 28 dollars a month with a 100-response cap"
        },
        {
          "feature": "Purpose-built plan tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Typeform offers Talent and Growth Flow tiers"
        },
        {
          "feature": "Custom-quoted enterprise plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Tally's top tier (Business, 89 dollars a month) is fixed-price rather than custom-quoted"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Tally or Typeform?",
      "answer": "Tally is cheaper, since it offers a forever-free plan with unlimited forms and submissions, while Typeform has no free tier and its Basic plan starts at 28 dollars a month with a cap of only 100 responses monthly."
    },
    {
      "question": "Does Typeform have a free plan?",
      "answer": "No, Typeform has no free tier; its lowest-priced Basic plan starts at 28 dollars a month and is capped at 100 responses monthly."
    },
    {
      "question": "Can Typeform collect payments within a form like Tally can?",
      "answer": "This is not documented in Typeform's available facts, whereas Tally confirms built-in Stripe payment collection, e-signatures, and file uploads, available even on its free plan."
    },
    {
      "question": "Which tool supports video questions in forms?",
      "answer": "Typeform supports embedding video directly into form questions; this capability is not documented for Tally."
    },
    {
      "question": "Is Tally suitable for beginners?",
      "answer": "Yes, Tally is designed around an intuitive document-style editor with a short learning curve, since you build forms by typing content and inserting fields with slash commands rather than using a drag-and-drop canvas."
    },
    {
      "question": "Does Tally provide a developer API?",
      "answer": "Yes, Tally offers a documented REST API for programmatically creating forms, managing fields, and fetching or deleting submissions, documented at developers.tally.so."
    }
  ]
};

export default tallyVsTypeformContent;
