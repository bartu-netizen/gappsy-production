import type { ToolComparisonContent } from './types';

const clioVsSmokeballContent: ToolComparisonContent = {
  "verdict": "Clio and Smokeball both run on case management, billing, and trust accounting for law firms, but they are built around different workflows. Clio is a modular platform that lets a firm start with basic time tracking and billing on the EasyStart plan and add intake, CRM, and workflow automation as the firm grows, with published per-tier pricing from $39/user/month. Smokeball centers the whole product on automatic, passive time capture and deep, practice-area-specific document templates, backed by tight Microsoft 365 integration, but pricing is quoted per firm under an annual or 36-month contract rather than published upfront. Firms that want transparent, self-serve pricing, a large third-party app marketplace, and a dedicated intake and CRM add-on tend to lean toward Clio. Firms that lose billable hours to manual timers, live inside Outlook and Word all day, and want document automation tailored to specific practice areas tend to lean toward Smokeball. Neither is a strict upgrade over the other: Clio is broader and more configurable, Smokeball is narrower and more automated around time capture and documents. The right choice depends on whether a firm's biggest pain point is intake and reporting flexibility, or manual timekeeping and document drafting overhead.",
  "bestForToolA": "Clio fits solo attorneys and small-to-midsize firms that want transparent tiered pricing, a large third-party integration marketplace, and an optional dedicated intake and CRM tool (Clio Grow) as they scale.",
  "bestForToolB": "Smokeball fits firms whose biggest pain point is manual timekeeping and document drafting, especially those already standardized on Microsoft 365 and willing to commit to an annual or multi-year contract for a custom quote.",
  "whoNeedsBoth": "A firm that wants Clio's published pricing and intake and CRM flexibility for client-facing workflows, but also wants Smokeball's passive time capture and practice-area templates for a specific high-volume practice group, could reasonably run both rather than replacing one with the other.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Clio publishes four tiers from $39/user/month (EasyStart) up to $129/user/month (Complete), billed annually",
      "toolB": "Smokeball advertises a starting price of $149/user/month (Bill plan) but all plans require a custom quote",
      "whyItMatters": "Buyers comparing options online can budget and self-serve with Clio, while Smokeball requires a sales conversation before final costs are known",
      "benefitsWho": "Price-sensitive solo attorneys and small firms benefit from Clio's published pricing; firms comfortable with a sales-led buying process are less affected by Smokeball's quote model"
    },
    {
      "title": "Time tracking method",
      "toolA": "Clio captures billable time and expenses from desktop or mobile, feeding entries into invoices",
      "toolB": "Smokeball passively captures billable time as staff work in documents, emails, and calls",
      "whyItMatters": "Passive capture reduces end-of-day time reconstruction and lost billable hours, while manual or mobile entry still relies on staff remembering to log time",
      "benefitsWho": "Firms with high time-leakage problems benefit most from Smokeball's automatic capture; firms comfortable with disciplined manual logging can rely on Clio's approach"
    },
    {
      "title": "Client intake and CRM depth",
      "toolA": "Clio Grow is a dedicated intake and CRM product, bundled into the Complete plan with automated intake forms and referral source reporting",
      "toolB": "Smokeball only offers lead and matter intake management on its top Prosper+ tier, without a named dedicated CRM product",
      "whyItMatters": "Firms that rely heavily on inbound lead generation need strong pre-matter intake and referral tracking, not just post-intake case management",
      "benefitsWho": "Firms with active marketing and referral pipelines benefit more from Clio Grow than from Smokeball's more limited intake tools"
    },
    {
      "title": "AI features",
      "toolA": "Clio's documented feature set does not include a named AI assistant",
      "toolB": "Smokeball offers Archie, an add-on AI assistant for communication and administrative tasks",
      "whyItMatters": "Firms wanting AI-assisted drafting or admin help have a named option with Smokeball that is not documented for Clio",
      "benefitsWho": "Firms exploring AI-assisted workflows benefit from Smokeball's Archie; this is not a documented factor for Clio"
    },
    {
      "title": "Contract terms",
      "toolA": "Clio's plans are billed per user per month on an annual basis with no multi-year contract mentioned",
      "toolB": "Smokeball plans run under annual or 36-month contract terms",
      "whyItMatters": "Longer contract terms reduce pricing flexibility and can make switching software more difficult later",
      "benefitsWho": "Firms wanting shorter commitment cycles benefit from Clio's annual-only billing; firms confident in a long-term fit may not mind Smokeball's longer terms"
    },
    {
      "title": "Document automation scope",
      "toolA": "Clio Draft generates court forms and templated documents automatically from matter data",
      "toolB": "Smokeball generates court forms, letters, and contracts from practice-area templates spanning family law, personal injury, estate planning, criminal defense, and real estate, among others",
      "whyItMatters": "Breadth of pre-built, practice-area-specific templates can significantly cut document drafting time for firms in those specific practice areas",
      "benefitsWho": "Firms concentrated in the named practice areas benefit most from Smokeball's templates; firms with more varied or niche practices may find Clio Draft's matter-data approach more flexible"
    },
    {
      "title": "Third-party integration breadth",
      "toolA": "Clio's app marketplace includes 200+ integrations covering email, calendaring, accounting, and eSignature tools",
      "toolB": "Smokeball's own documentation lists deep Microsoft 365 integration but notes that customization and third-party integrations are more limited than some enterprise-focused competitors",
      "whyItMatters": "Firms with an existing tech stack outside Microsoft 365 may need a wider integration ecosystem to avoid manual workarounds",
      "benefitsWho": "Firms with diverse existing software benefit from Clio's broader marketplace; firms fully standardized on Microsoft 365 benefit from Smokeball's tighter native fit"
    },
    {
      "title": "Native eSignature and eFiling",
      "toolA": "Clio's facts describe marketplace integrations with eSignature tools but do not document native eFiling",
      "toolB": "Smokeball documents native eSignature and eFiling directly within the platform for supported courts",
      "whyItMatters": "Native eFiling can remove a manual step for firms that regularly file documents with courts electronically",
      "benefitsWho": "Litigation-heavy firms that file frequently benefit from Smokeball's native eFiling; firms with lighter filing needs may not need this feature from either tool"
    },
    {
      "title": "Desktop and mobile platform footprint",
      "toolA": "Clio is documented as a web app with native iOS and Android mobile apps",
      "toolB": "Smokeball is documented with Windows and Mac desktop presence in addition to a web app and iOS mobile app, plus Android per its features and FAQ content",
      "whyItMatters": "Firms with staff who prefer dedicated desktop software rather than browser-based tools may have a platform preference",
      "benefitsWho": "Firms wanting native desktop software benefit from Smokeball's Windows and Mac presence; firms happy with browser-based access are equally served by Clio's web-first approach"
    },
    {
      "title": "Company maturity and support resources",
      "toolA": "Clio was founded in 2008 in Vancouver, Canada, with pros citing extensive onboarding, documentation, and support resources",
      "toolB": "Smokeball was founded in 2011 in Chicago, Illinois, with pros citing hands-on onboarding to help firms migrate from prior systems",
      "whyItMatters": "A longer track record and more extensive public documentation can mean more self-serve resources and a larger existing user community",
      "benefitsWho": "Firms that prefer self-serve learning and a mature ecosystem may lean toward Clio; firms that want hands-on migration support may value Smokeball's onboarding approach equally"
    }
  ],
  "featureMatrix": [
    {
      "group": "Case and Matter Management",
      "rows": [
        {
          "feature": "Matter or case management",
          "toolA": "available",
          "toolB": "available",
          "note": "Both centralize documents, contacts, tasks, and communications on a matter record"
        },
        {
          "feature": "Client portal",
          "toolA": "available",
          "toolB": "available",
          "note": "Both let clients view updates and communicate with the firm"
        },
        {
          "feature": "Task and calendar management",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented explicitly for Smokeball on the Boost plan; included in Clio's matter record features"
        }
      ]
    },
    {
      "group": "Time Tracking and Billing",
      "rows": [
        {
          "feature": "Time and expense tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio captures entries from desktop or mobile; Smokeball captures time passively"
        },
        {
          "feature": "Automatic passive time capture",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Not documented for Clio, which relies on desktop or mobile entry"
        },
        {
          "feature": "Online invoicing and payments",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Trust accounting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio cites IOLTA compliance; Smokeball cites state bar trust compliance"
        }
      ]
    },
    {
      "group": "Client Intake and CRM",
      "rows": [
        {
          "feature": "Dedicated intake and CRM product",
          "toolA": "available",
          "toolB": "limited",
          "note": "Clio Grow is a named product bundled in the Complete plan; Smokeball only lists lead and matter intake on the top Prosper+ tier"
        },
        {
          "feature": "Automated web intake forms",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Only documented for Clio Grow"
        },
        {
          "feature": "Referral source reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented only for Clio Grow"
        }
      ]
    },
    {
      "group": "Document Automation and Filing",
      "rows": [
        {
          "feature": "Document automation from matter data",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio Draft versus Smokeball practice-area templates"
        },
        {
          "feature": "Practice-area-specific templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Smokeball names family law, personal injury, estate planning, criminal defense, and real estate"
        },
        {
          "feature": "eSignature",
          "toolA": "limited",
          "toolB": "available",
          "note": "Clio offers eSignature only via third-party marketplace tools; Smokeball has it built in"
        },
        {
          "feature": "eFiling with courts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Only documented for Smokeball"
        }
      ]
    },
    {
      "group": "Reporting and Analytics",
      "rows": [
        {
          "feature": "Matter or firm profitability reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio on Advanced and Complete plans; Smokeball on Prosper+"
        },
        {
          "feature": "Staff utilization or activity reporting",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio on Advanced tier; Smokeball on Prosper+ tier"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Smokeball offers Archie as an add-on; no AI assistant is documented for Clio"
        }
      ]
    },
    {
      "group": "Integrations and Platform",
      "rows": [
        {
          "feature": "Third-party app marketplace",
          "toolA": "available",
          "toolB": "limited",
          "note": "Clio lists 200+ integrations; Smokeball's own cons note more limited third-party integrations"
        },
        {
          "feature": "Microsoft 365 or Outlook and Gmail integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Clio integrates with Outlook and Gmail; Smokeball integrates deeply with Microsoft 365 including Word"
        },
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer native mobile apps for time tracking and matter access"
        },
        {
          "feature": "Windows or Mac desktop app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Only documented for Smokeball"
        }
      ]
    },
    {
      "group": "Pricing and Trial",
      "rows": [
        {
          "feature": "Published tiered pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Smokeball only advertises a starting price and requires a custom quote for actual plan costs"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Smokeball's free trial is specific to its Boost plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Clio or Smokeball?",
      "answer": "Clio publishes lower and clearer pricing, starting at $39/user/month for its EasyStart plan billed annually, while Smokeball advertises a starting price of $149/user/month but requires a custom quote based on firm size and selected add-ons under an annual or 36-month contract."
    },
    {
      "question": "Does Clio or Smokeball track billable time automatically?",
      "answer": "Smokeball is the one built around automatic time tracking, passively capturing billable time as staff work in documents, emails, and calls, whereas Clio captures time and expense entries from desktop or mobile that staff enter or trigger themselves."
    },
    {
      "question": "Is Clio or Smokeball better for solo attorneys or small firms?",
      "answer": "Clio is explicitly positioned for solo attorneys and small firms through its entry-level EasyStart plan with transparent pricing, while Smokeball's plans require a custom quote and are typically structured around annual or multi-year contracts, which can be less flexible for very small practices."
    },
    {
      "question": "Does either tool include AI features?",
      "answer": "Smokeball offers Archie, an add-on AI assistant for communication and administrative tasks, while Clio's documented feature set does not include a named AI assistant."
    },
    {
      "question": "Can Smokeball handle client intake and CRM the way Clio Grow does?",
      "answer": "Not to the same extent based on documented features, since Clio Grow is a dedicated intake and CRM product with automated intake forms and referral source reporting bundled into Clio's Complete plan, while Smokeball only lists lead and matter intake management on its top Prosper+ tier without a named dedicated CRM product."
    },
    {
      "question": "Which tool has more third-party integrations?",
      "answer": "Clio has the broader documented integration ecosystem, with an app marketplace listing 200+ integrations across email, calendaring, accounting, and eSignature tools, while Smokeball's own materials note that its customization and third-party integrations are more limited than some enterprise-focused competitors, even though it integrates deeply with Microsoft 365."
    }
  ]
};

export default clioVsSmokeballContent;
