import type { ToolComparisonContent } from './types';

const googleWorkspaceVsMicrosoft365Content: ToolComparisonContent = {
  "verdict": "Google Workspace and Microsoft 365 solve the same basic problem, business email plus office apps plus storage, but they start from different design points. Google Workspace is built web first: Gmail, Docs, Sheets, and Slides run in the browser with real-time multi-user editing built in from the start, and storage scales from 30GB up to 5TB or more per user as you move up plans, ending in a custom-priced Enterprise tier. Microsoft 365 keeps the familiar desktop-first Office suite, Word, Excel, PowerPoint, and Outlook, available across desktop, web, and mobile, paired with Teams, and backs it with Copilot AI built directly into the Business Standard and Premium plans rather than sold as a separate product. Entry pricing is close, Google Starter at €6.80 per user per month against Microsoft Business Basic at $7.00, so the decision comes down to workflow and AI needs rather than sticker price. Organizations already living in Word, Excel, and Outlook, and wanting AI baked into the core plan, point toward Microsoft 365. Teams that work primarily in the browser, want collaborative editing to feel native rather than added on, and want storage that scales cleanly with plan tier point toward Google Workspace. Neither tool is a strict upgrade over the other, they represent two different defaults for how an organization prefers to work day to day.",
  "bestForToolA": "Google Workspace fits teams that work primarily in the browser and want real-time collaborative document editing and tiered storage that scales cleanly from small teams up to a custom-priced Enterprise tier.",
  "bestForToolB": "Microsoft 365 fits organizations already invested in the Word, Excel, PowerPoint, and Outlook workflow that want Copilot AI included directly in the Business Standard or Premium plan rather than purchased separately.",
  "whoNeedsBoth": "Organizations that exchange files with clients or partners using both Google Docs and Microsoft Office formats, or that run Gmail for one team and Outlook for another, often end up licensing both suites.",
  "keyDifferences": [
    {
      "title": "Core app philosophy",
      "toolA": "Docs, Sheets, and Slides are web-native apps with real-time multi-user editing built in from the start.",
      "toolB": "Word, Excel, PowerPoint, and Outlook are available as full apps across desktop, web, and mobile devices.",
      "whyItMatters": "Determines whether a team's day-to-day work happens primarily in a browser tab or in installed desktop software, which affects offline access and file-handling habits.",
      "benefitsWho": "Browser-first, distributed teams benefit from Google's approach; teams tied to desktop Office workflows benefit from Microsoft's approach."
    },
    {
      "title": "Built-in AI assistant",
      "toolA": "Not documented as including a built-in AI assistant in the provided plan data.",
      "toolB": "Copilot AI ships as part of the Business Standard and Premium plans, and can be added separately to other tiers.",
      "whyItMatters": "Teams wanting generative AI drafting and analysis features baked into their subscription rather than a separate purchase will weigh this heavily.",
      "benefitsWho": "Teams that want AI assistance without buying and managing a separate AI tool benefit from Microsoft 365."
    },
    {
      "title": "Video conferencing",
      "toolA": "Google Meet is built in and integrated directly with Calendar.",
      "toolB": "Teams is bundled as the suite's chat and video conferencing app.",
      "whyItMatters": "Determines which conferencing tool becomes the company default and whether a separate chat tool is needed.",
      "benefitsWho": "Teams standardized on Calendar-driven scheduling benefit from Meet; teams wanting combined chat and video in one app benefit from Teams."
    },
    {
      "title": "Storage allowance",
      "toolA": "Storage is tiered and scales from 30GB up to 5TB or more per user depending on plan.",
      "toolB": "1TB of OneDrive storage per user is included across all business plans.",
      "whyItMatters": "Heavy storage users, like teams working with large media files, need to know whether storage grows with plan tier or stays flat.",
      "benefitsWho": "Teams expecting to outgrow storage over time benefit from Google's tiered scaling; teams with predictable, moderate storage needs benefit from Microsoft's flat 1TB allowance."
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Starter plan is €6.80 per user per month, billed annually.",
      "toolB": "Business Basic plan is $7.00 per user per month, billed annually.",
      "whyItMatters": "Entry pricing is close once currency is accounted for, so budget-conscious buyers need to compare included features rather than sticker price alone.",
      "benefitsWho": "Cost-sensitive small teams benefit from comparing what each entry tier actually includes rather than assuming one is clearly cheaper."
    },
    {
      "title": "Mid-tier plan features",
      "toolA": "Standard plan is €13.60 per user per month.",
      "toolB": "Business Standard with Copilot is $23.50 per user per month and includes Copilot AI.",
      "whyItMatters": "The price gap widens at the middle tier because Microsoft bundles AI into this plan while Google's Standard plan does not document an AI feature.",
      "benefitsWho": "Teams wanting AI at the mid tier benefit from Microsoft's Business Standard; budget-focused teams without an AI need benefit from the cheaper Google Standard plan."
    },
    {
      "title": "Top-tier named plan",
      "toolA": "Plus plan is €21.10 per user per month.",
      "toolB": "Business Premium with Copilot is $32.00 per user per month.",
      "whyItMatters": "At the top of each suite's named plan range, Microsoft's plan costs meaningfully more, reflecting the bundled Copilot AI.",
      "benefitsWho": "Larger teams wanting the most capable named plan with AI included benefit from Microsoft's Business Premium; teams wanting the most capable Google plan without AI included benefit from Plus."
    },
    {
      "title": "Enterprise or custom pricing tier",
      "toolA": "Enterprise plan is available with custom pricing.",
      "toolB": "Not documented as offering a named enterprise tier beyond Business Premium in the provided plan data.",
      "whyItMatters": "Larger organizations negotiating custom terms need to know whether a vendor has a formal enterprise tier to escalate to.",
      "benefitsWho": "Larger organizations wanting a documented custom-priced enterprise tier benefit from Google Workspace's Enterprise plan."
    },
    {
      "title": "Real-time collaborative editing",
      "toolA": "Real-time, multi-user editing in Docs and Sheets is called out as a core built-in strength.",
      "toolB": "Not documented as a called-out feature in the provided facts.",
      "whyItMatters": "Teams that co-edit documents simultaneously with many contributors care about how native and reliable real-time editing feels.",
      "benefitsWho": "Teams doing heavy simultaneous co-editing benefit from Google Workspace's documented real-time editing strength."
    }
  ],
  "featureMatrix": [
    {
      "group": "Email and Communication",
      "rows": [
        {
          "feature": "Business email",
          "toolA": "available",
          "toolB": "available",
          "note": "Gmail for Google Workspace, Outlook for Microsoft 365"
        },
        {
          "feature": "Video conferencing",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Meet integrated with Calendar; Teams bundled with Microsoft 365"
        },
        {
          "feature": "Team chat app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Provided data does not mention a standalone chat app for Google Workspace; Teams covers chat for Microsoft 365"
        }
      ]
    },
    {
      "group": "Core Productivity Apps",
      "rows": [
        {
          "feature": "Word processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Docs vs Microsoft Word"
        },
        {
          "feature": "Spreadsheets",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Sheets vs Microsoft Excel"
        },
        {
          "feature": "Presentations",
          "toolA": "available",
          "toolB": "available",
          "note": "Google Slides vs Microsoft PowerPoint"
        },
        {
          "feature": "Native desktop apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Microsoft 365 explicitly documents desktop, web, and mobile apps; Google Workspace facts emphasize web-native use"
        }
      ]
    },
    {
      "group": "Storage",
      "rows": [
        {
          "feature": "Cloud storage included",
          "toolA": "available",
          "toolB": "available",
          "note": "Tiered 30GB to 5TB+ for Google Workspace; flat 1TB OneDrive for Microsoft 365"
        },
        {
          "feature": "Storage scales with plan tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Microsoft 365 documents 1TB as included across all business plans rather than scaling per tier"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copilot ships with Business Standard and Premium plans"
        },
        {
          "feature": "AI addable to lower tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Copilot can be added separately to other Microsoft 365 tiers per provided data"
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Real-time multi-user document editing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Called out as a core Google Workspace strength in provided facts"
        }
      ]
    },
    {
      "group": "Platform Support",
      "rows": [
        {
          "feature": "Web app access",
          "toolA": "available",
          "toolB": "available",
          "note": "Both suites are documented as usable via the web"
        },
        {
          "feature": "Mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Microsoft 365 explicitly documents mobile apps; not confirmed in the Google Workspace facts provided"
        }
      ]
    },
    {
      "group": "Pricing Tiers",
      "rows": [
        {
          "feature": "Entry-level plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Starter at €6.80/user/month vs Business Basic at $7.00/user/month"
        },
        {
          "feature": "Enterprise custom pricing tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Google Workspace lists a custom-priced Enterprise plan; no equivalent named tier appears in the provided Microsoft 365 plans"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Google Workspace or Microsoft 365?",
      "answer": "Their entry-level plans are close, Google Workspace Starter is €6.80 per user per month and Microsoft 365 Business Basic is $7.00 per user per month, so the currencies differ but the entry cost is roughly comparable rather than one being clearly cheaper."
    },
    {
      "question": "Does Microsoft 365 include AI features?",
      "answer": "Yes, Copilot AI ships as part of the Business Standard and Premium plans, and it can also be added separately to other Microsoft 365 tiers."
    },
    {
      "question": "Does Google Workspace include an AI assistant like Copilot?",
      "answer": "The provided Google Workspace plan data does not document a built-in AI assistant, so this is not confirmed as a feature of its current plans."
    },
    {
      "question": "Which suite offers more storage?",
      "answer": "Google Workspace offers more storage headroom, scaling from 30GB up to 5TB or more per user depending on plan, while Microsoft 365 includes a flat 1TB of OneDrive storage per user across its business plans."
    },
    {
      "question": "Which is better for real-time collaborative document editing?",
      "answer": "Google Workspace is documented as built for real-time, multi-user editing in Docs and Sheets from the start, which is called out as one of its core strengths."
    },
    {
      "question": "Can I get custom or enterprise pricing with either tool?",
      "answer": "Google Workspace documents a custom-priced Enterprise plan, while the provided Microsoft 365 plan data tops out at Business Premium with Copilot and does not include a separate named enterprise tier."
    }
  ]
};

export default googleWorkspaceVsMicrosoft365Content;
