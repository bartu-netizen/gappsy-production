import type { ToolComparisonContent } from './types';

const betterProposalsVsProposifyContent: ToolComparisonContent = {
  "verdict": "Better Proposals and Proposify solve the same core job, turning static quotes into trackable, signable, on-brand documents, but they are built for different buyer profiles. Better Proposals leans toward speed and affordability for a single freelancer or a small agency: its entry Starter plan starts at $13/user/month, bundles e-signatures and built-in payment collection into one document, and its Premium tier adds CRM sync and API and Zapier access. Proposify positions itself more as a team standardization tool from the start, with a visual drag-and-drop editor, approval workflows to enforce pricing consistency, and a top Business tier that is custom-quoted for larger organizations, at a higher published entry price of roughly $19-29/user/month. Neither product documents payment collection on the Proposify side, and neither is positioned for complex configure-price-quote or full contract lifecycle management. If the priority is getting a polished proposal out fast and collecting a signed deposit in the same flow, Better Proposals is the more direct fit. If the priority is a structured, editor-driven process with manager sign-off before a proposal goes out, and budget allows for per-user pricing that climbs at scale, Proposify is the closer match. The real decision usually comes down to team size, whether payment collection needs to live inside the document, and how much approval control matters before send.",
  "bestForToolA": "Better Proposals fits freelancers, solo consultants, and small agencies that want a low starting price, fast template-based setup, and payment collection built into the same signed document.",
  "bestForToolB": "Proposify fits small-to-mid sales teams that want a visual drag-and-drop editor and formal approval workflows to keep pricing and terms consistent before a proposal is sent.",
  "whoNeedsBoth": "An agency running both quick freelance-style pitches and larger managed sales deals might trial both tools side by side to compare which workflow, payment-in-document versus approval-gated sending, fits each type of deal.",
  "keyDifferences": [
    {
      "title": "Entry-level pricing",
      "toolA": "Starter plan starts at $13/user/month billed annually for 1 user and up to 10 documents per month",
      "toolB": "Team plan starts around $19-29 per user/month billed annually",
      "whyItMatters": "For a solo user or very small team, the per-seat cost difference compounds quickly over a year",
      "benefitsWho": "Budget-conscious freelancers and small agencies benefit from the lower Better Proposals entry price"
    },
    {
      "title": "Built-in payment collection",
      "toolA": "Payment integrations let a signed proposal trigger an immediate deposit or invoice payment inside the same document",
      "toolB": "Not documented as a feature in the provided facts",
      "whyItMatters": "Collecting payment at the moment of signature removes a separate invoicing step and speeds up cash flow",
      "benefitsWho": "Sellers who want to close and get paid in a single client interaction benefit from Better Proposals here"
    },
    {
      "title": "Editor style",
      "toolA": "Uses templates and a reusable content library, no drag-and-drop editor explicitly documented",
      "toolB": "Includes a dedicated drag-and-drop visual editor for arranging text, images, video, and pricing blocks",
      "whyItMatters": "A visual block editor gives more layout control for teams that want highly customized document design",
      "benefitsWho": "Teams with design-conscious sales or marketing staff benefit from Proposify's editor"
    },
    {
      "title": "Approval workflows",
      "toolA": "Manager approvals and content locking are only available on the top Enterprise tier",
      "toolB": "Approval workflows are documented as a core feature, routing non-standard pricing or terms to managers before sending",
      "whyItMatters": "Approval gating prevents reps from sending inconsistent pricing or terms without oversight",
      "benefitsWho": "Sales managers overseeing multiple reps benefit more directly from Proposify's approval workflow feature"
    },
    {
      "title": "CRM integration tier",
      "toolA": "CRM integrations with HubSpot, Salesforce, and Pipedrive require the Premium tier or above",
      "toolB": "CRM integrations are included starting on the entry Team plan",
      "whyItMatters": "Where CRM sync sits in the pricing ladder affects the real cost of getting proposal data into a sales pipeline",
      "benefitsWho": "Teams that need CRM sync from day one get it sooner and cheaper with Proposify's Team plan"
    },
    {
      "title": "Automated follow-up",
      "toolA": "Offers an add-on automation feature called Nudge to re-engage clients who have not opened or signed",
      "toolB": "Includes scheduled follow-up notifications described as automated reminders",
      "whyItMatters": "Automated nudging reduces manual chasing of unresponsive prospects",
      "benefitsWho": "High-volume senders on either platform benefit, though Better Proposals frames this as a named add-on rather than a core feature"
    },
    {
      "title": "Top-tier pricing transparency",
      "toolA": "All three tiers, including Enterprise, publish exact per-user prices",
      "toolB": "The top Business tier is custom-quoted rather than publicly priced",
      "whyItMatters": "Published pricing lets a buyer budget without a sales call, while custom quotes require direct contact",
      "benefitsWho": "Buyers who prefer self-serve budgeting benefit from Better Proposals' full price transparency"
    },
    {
      "title": "Monthly document caps",
      "toolA": "Starter and Premium plans cap documents at 10 and 50 per month respectively, with unlimited only on Enterprise",
      "toolB": "No document caps are documented in the provided plan details",
      "whyItMatters": "A document cap can force an upgrade for teams sending a high volume of proposals",
      "benefitsWho": "Lower-volume senders are fine on Better Proposals' capped tiers, while high-volume senders should confirm limits before committing"
    },
    {
      "title": "Company origin and founding year",
      "toolA": "Founded in 2015, headquartered in Brighton, United Kingdom",
      "toolB": "Founded in 2013, headquartered in Halifax, Nova Scotia, Canada",
      "whyItMatters": "Longevity and location can matter for support hours, data residency preferences, or vendor due diligence",
      "benefitsWho": "Buyers with specific vendor-location or support-timezone preferences may weigh this differently"
    },
    {
      "title": "Core positioning",
      "toolA": "Explicitly built around a single interactive document that combines proposal, signature, and payment",
      "toolB": "Explicitly built around standardizing the proposal process across a sales team with editor and approval controls",
      "whyItMatters": "The two tools optimize for different bottlenecks, closing the payment gap versus closing the consistency gap",
      "benefitsWho": "Solo closers benefit from Better Proposals' all-in-one document, while sales teams benefit from Proposify's standardization focus"
    }
  ],
  "featureMatrix": [
    {
      "group": "Proposal creation",
      "rows": [
        {
          "feature": "Template library",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Reusable content blocks",
          "toolA": "available",
          "toolB": "available",
          "note": "Both describe reusable content such as case studies, bios, or blocks"
        },
        {
          "feature": "Drag-and-drop visual editor",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Only Proposify explicitly documents a drag-and-drop editor"
        }
      ]
    },
    {
      "group": "Pricing and quoting",
      "rows": [
        {
          "feature": "Interactive pricing tables",
          "toolA": "available",
          "toolB": "available",
          "note": "Both let clients adjust options and see totals update live"
        },
        {
          "feature": "Complex CPQ or configure-price-quote support",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Both explicitly state they are not built for complex CPQ scenarios"
        }
      ]
    },
    {
      "group": "Signing and payments",
      "rows": [
        {
          "feature": "Built-in electronic signatures",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "In-document payment collection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Better Proposals ties signing directly to deposit or invoice payment"
        }
      ]
    },
    {
      "group": "Tracking and follow-up",
      "rows": [
        {
          "feature": "Open tracking and time-on-section analytics",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated follow-up reminders",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals calls this Nudge and offers it as an add-on"
        }
      ]
    },
    {
      "group": "Team collaboration",
      "rows": [
        {
          "feature": "Manager approval workflows",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals requires Enterprise tier; Proposify includes it on Business"
        },
        {
          "feature": "Content locking and permissions",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals requires Enterprise tier; Proposify requires Business tier"
        },
        {
          "feature": "Simultaneous editing and inline commenting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented only for Better Proposals Enterprise tier"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals requires Premium tier or above; Proposify includes it from the Team tier"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals documents API and Zapier on Premium tier and above; Proposify is tagged as offering API access without itemized detail"
        },
        {
          "feature": "Custom domain and brand styling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented only for Better Proposals Premium tier and above"
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Published pricing for all tiers",
          "toolA": "available",
          "toolB": "limited",
          "note": "Proposify's top Business tier is custom-quoted rather than publicly priced"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Better Proposals documents a 14-day trial with no credit card required"
        },
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Better Proposals explicitly has no free plan; Proposify's facts do not confirm either way"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Better Proposals or Proposify cheaper?",
      "answer": "Better Proposals is cheaper at the entry level, starting at $13/user/month billed annually versus Proposify's roughly $19-29 per user/month for its entry Team plan, though Proposify's top Business tier is custom-quoted so a full enterprise comparison depends on negotiated pricing."
    },
    {
      "question": "Can clients pay directly through the proposal in either tool?",
      "answer": "Better Proposals explicitly supports built-in payment collection, letting a signed proposal trigger a deposit or invoice payment in the same document, while Proposify's provided facts do not document a payment collection feature."
    },
    {
      "question": "Which tool is better for a freelancer or solo user?",
      "answer": "Better Proposals is the better fit for a solo user because its Starter plan is built around a single seat at a lower starting price, whereas Proposify's plans are structured around multi-user teams."
    },
    {
      "question": "Do both Better Proposals and Proposify have e-signatures?",
      "answer": "Yes, both tools document legally binding electronic signatures built directly into the proposal document, so no separate e-signature tool is needed with either platform."
    },
    {
      "question": "Which tool has stronger approval workflows for sales teams?",
      "answer": "Both document manager approval workflows, but Proposify includes this as a named core feature on its Business plan while Better Proposals only offers it at the very top Enterprise tier alongside content locking and advanced permissions."
    },
    {
      "question": "Do Better Proposals and Proposify integrate with CRM software?",
      "answer": "Yes, both integrate with CRM platforms, but Better Proposals requires the Premium tier or above while Proposify includes CRM integration starting on its entry-level Team plan."
    }
  ]
};

export default betterProposalsVsProposifyContent;
