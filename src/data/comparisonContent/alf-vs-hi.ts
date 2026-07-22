import type { ToolComparisonContent } from './types';

const alfVsHiContent: ToolComparisonContent = {
  "verdict": "alf (Alf.io) and hi (Hi.Events) are both open-source, self-hostable event ticketing platforms, but they document their value differently: alf emphasizes flexible deployment across enterprise platforms like OpenShift, Heroku, and Cloud Foundry, while hi emphasizes a fee structure where organizers keep 100% of ticket revenue and buyers pay the service fee, plus a polished free-badge-designer add-on. Neither publishes deep pricing tiers or feature lists beyond what's summarized here, so the decision often comes down to deployment environment and documented extras.",
  "bestForToolA": "alf suits organizations that already run infrastructure on OpenShift, Heroku, or Cloud Foundry and want an open-source ticketing tool with documented deployment guides for those specific platforms.",
  "bestForToolB": "hi suits organizers who want a documented $0 organizer-side cost with instant payouts and either a hosted cloud option or a self-hosted Docker path, plus a built-in badge designer for on-site check-in.",
  "whoNeedsBoth": "There is no realistic scenario for running both at once — they solve the identical problem (self-hosted event ticketing) for the same event, so a team would choose one, not layer them together.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "alf is documented simply as Free / Open Source with no listed pricing plans or organizer fee structure.",
      "toolB": "hi is Freemium with a documented $0 \"For Organizers\" plan and an explicit fee model: the buyer pays the service fee, not the organizer.",
      "whyItMatters": "hi's documented buyer-pays-fee structure is more transparent for organizers trying to predict their exact revenue per ticket.",
      "benefitsWho": "Organizers who need to model exact take-home revenue before setting ticket prices."
    },
    {
      "title": "Deployment Options",
      "toolA": "alf documents deployment guides specifically for OpenShift, Heroku, and Cloud Foundry.",
      "toolB": "hi documents a quick-start guide for self-hosted deployment plus local development with Docker, alongside a hosted cloud option.",
      "whyItMatters": "Teams already standardized on a specific PaaS (OpenShift, Heroku, Cloud Foundry) will find alf's guides more directly relevant; teams that want either a managed cloud or a Docker-based self-host will find hi more flexible.",
      "benefitsWho": "IT and DevOps teams choosing a deployment target for event ticketing infrastructure."
    },
    {
      "title": "Payout Speed",
      "toolA": "alf does not document a payout mechanism or payout timing.",
      "toolB": "hi documents instant payouts to organizers as a named feature.",
      "whyItMatters": "For organizers relying on ticket revenue to cover upfront event costs, payout speed can materially affect cash flow.",
      "benefitsWho": "Independent organizers and small event businesses that need ticket revenue quickly."
    },
    {
      "title": "On-Site / Check-In Extras",
      "toolA": "alf does not document any badge or check-in tooling in its listed features.",
      "toolB": "hi includes a free event badge designer to create printable attendee badges without a separate tool.",
      "whyItMatters": "Organizers who print badges in-house avoid buying a separate badge-design tool if they choose hi.",
      "benefitsWho": "In-person conference and event organizers handling on-site check-in."
    },
    {
      "title": "Cloud vs. Self-Host Choice",
      "toolA": "alf's documented facts only mention self-hosted deployment paths (OpenShift, Heroku, Cloud Foundry) with no mention of a first-party hosted cloud option.",
      "toolB": "hi explicitly offers a choice: \"use our cloud or self-host for free.\"",
      "whyItMatters": "Teams that don't want to manage their own servers have a documented managed option with hi but not clearly with alf.",
      "benefitsWho": "Smaller organizers without dedicated DevOps resources who still want a low-fee ticketing tool."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Fees",
      "rows": [
        {
          "feature": "Free organizer plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "hi: $0 For Organizers plan."
        },
        {
          "feature": "Buyer-pays-fee model documented",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Instant payouts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Listed pricing plans",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "alf has no documented pricing_plans entries; hi lists a $0 For Organizers plan."
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Hosted cloud option",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Documented platform-specific deploy guides (OpenShift/Heroku/Cloud Foundry)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Docker local development",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Event-Day Tools",
      "rows": [
        {
          "feature": "Event badge designer",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Full data ownership messaging",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "hi markets \"full data ownership\" alongside self-hosting."
        },
        {
          "feature": "Open-source licensing",
          "toolA": "available",
          "toolB": "available",
          "note": "Both are documented as open source / self-hostable."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are alf (Alf.io) and hi (Hi.Events) both open source?",
      "answer": "Yes. alf is described as Free / Open Source, and hi is Freemium but is also open source with a documented self-hosted deployment path."
    },
    {
      "question": "Does hi (Hi.Events) charge a fee to organizers?",
      "answer": "No. hi's fee is paid by the ticket buyer, not deducted from the organizer's revenue, so organizers keep 100% of ticket face value."
    },
    {
      "question": "What deployment platforms does alf (Alf.io) support?",
      "answer": "alf's documented facts list deployment guides for OpenShift, Heroku, and Cloud Foundry."
    },
    {
      "question": "Can I self-host either alf or hi?",
      "answer": "Yes, both support self-hosting. alf documents guides for OpenShift, Heroku, and Cloud Foundry, while hi documents a quick-start guide plus local Docker development."
    },
    {
      "question": "Does alf (Alf.io) offer instant payouts like hi?",
      "answer": "This is not documented for alf. hi explicitly lists instant payouts to organizers as a feature; no equivalent payout-speed claim appears in alf's available facts."
    },
    {
      "question": "Which tool has a badge designer for event check-in?",
      "answer": "hi documents a free event badge designer for printable attendee badges. No equivalent feature is documented for alf."
    }
  ]
};

export default alfVsHiContent;
