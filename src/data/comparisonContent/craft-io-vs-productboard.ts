import type { ToolComparisonContent } from './types';

const craftIoVsProductboardContent: ToolComparisonContent = {
  "verdict": "Craft.io is a paid-only product management platform starting at $19/editor/month (annual, Starter) with a 14-day free trial and built-in Guru AI for epic summaries, release notes, and go-to-market briefs included from the entry tier, plus design-tool integrations (Figma, Adobe XD, Sketch, and others) starting on its Pro plan. Productboard is a freemium platform with a genuine $0/month Free plan, also starting paid plans at $19/maker/month, centered on customer insights and AI spec generation (Spark) metered by monthly AI credits. Both price around unlimited free viewer/contributor seats, but they differ in whether a $0 plan exists at all and in what their AI features are built to do.",
  "bestForToolA": "Craft.io fits product teams that want Guru AI (epic summaries, release notes, go-to-market briefs) included from the entry Starter plan, plus native integrations with design tools like Figma and Adobe XD starting on Pro, and don't need a permanently free tier.",
  "bestForToolB": "Productboard fits teams that want to start on a genuine $0/month Free plan before committing budget, and later want AI spec generation (Spark) that converts ideas into delivery-ready specs alongside product-usage integrations like Amplitude and Mixpanel.",
  "whoNeedsBoth": "There's no realistic scenario for using both simultaneously — both are systems of record for product roadmapping and feedback, so running two in parallel would mean duplicating backlog and feedback data rather than any complementary workflow split.",
  "keyDifferences": [
    {
      "title": "Free Plan vs Free Trial",
      "toolA": "Craft.io has no permanently free plan; it offers a 14-day free trial with no credit card required, with paid plans starting at $19/editor/month (annual, Starter).",
      "toolB": "Productboard offers a true $0/month Free plan with unlimited roadmaps, 500 feedback notes, 25 contributors, and 1 teamspace.",
      "whyItMatters": "A permanent free plan lets small teams use the tool indefinitely, while a trial forces a purchase decision within a fixed window.",
      "benefitsWho": "Small teams evaluating tools without a budget commitment benefit from Productboard's Free plan."
    },
    {
      "title": "AI Feature Scope",
      "toolA": "Craft.io's Guru AI automates epic summarization, release note creation, and go-to-market brief preparation, included even on the entry Starter plan.",
      "toolB": "Productboard's Spark AI converts ideas into delivery-ready specs, metered by monthly AI credits (50 shared on Free, scaling to 800/maker on Enterprise) with paid top-ups required beyond the cap.",
      "whyItMatters": "The two AI tools solve different problems — Craft.io automates documentation output while Productboard automates spec generation from ideas.",
      "benefitsWho": "Teams that spend significant time writing release notes and GTM briefs benefit from Craft.io's Guru AI; teams converting raw feedback into specs benefit from Productboard's Spark."
    },
    {
      "title": "Design Tool Integration",
      "toolA": "Craft.io connects to Figma, Adobe XD, Sketch, Mural, Axure, InVision, and Miro, starting on its Pro plan.",
      "toolB": "Productboard's documented integrations focus on product-usage analytics tools (Amplitude, Mixpanel) rather than design tools.",
      "whyItMatters": "Teams that work closely with design tools during roadmap planning benefit from native connections rather than manual linking.",
      "benefitsWho": "Product teams working tightly with design/UX workflows benefit from Craft.io's design tool integrations."
    },
    {
      "title": "Add-on Structure",
      "toolA": "Craft.io treats OKRs/product strategy, the feedback portal, and capacity planning as paid add-ons ($20/month, or $15/month billed annually) on Starter and Pro, included by default only on Enterprise.",
      "toolB": "Productboard bundles strategic planning and customer insights into its core plans without a documented separate add-on fee structure for those capabilities.",
      "whyItMatters": "Add-on pricing can make the effective cost of a 'full-featured' setup higher than the advertised base price.",
      "benefitsWho": "Teams that need OKRs and capacity planning from day one should budget for Craft.io's add-on fees or start at Enterprise."
    },
    {
      "title": "Collaboration Tool Availability",
      "toolA": "Craft.io's Slack and Microsoft Teams integrations were not yet available at the time of review; the plan table lists them under Enterprise.",
      "toolB": "Productboard does not document Slack or Microsoft Teams integration status either way; both products list Salesforce as an Enterprise-tier integration.",
      "whyItMatters": "Teams relying heavily on Slack-based workflows for product feedback may need to verify current availability before purchasing.",
      "benefitsWho": "Teams centered on Slack/Teams-based collaboration should confirm current integration status with either vendor before committing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanently free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Productboard Free: $0/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "limited",
          "note": "Craft.io: 14-day, no CC; Productboard: 14-day trial on Business plan only"
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft.io: $19/editor/month annual (Starter); Productboard: $19/maker/month annual (Plus)"
        },
        {
          "feature": "Free viewer/contributor seats",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft.io: unlimited contributors/viewers; Productboard: 25 free contributors on Free plan, unlimited on Enterprise"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI epic/release note generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft.io's Guru AI, included from Starter"
        },
        {
          "feature": "AI spec generation from ideas",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Productboard's Spark"
        },
        {
          "feature": "AI usage capped by credits",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Productboard: 50-800 credits/month by plan"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Design tool integrations (Figma, Adobe XD, Sketch, etc.)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft.io Pro plan and above"
        },
        {
          "feature": "Product usage analytics integrations (Amplitude, Mixpanel)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Dev tool integrations (Jira, Azure DevOps, GitHub, GitLab)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Slack / Microsoft Teams integration",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Craft.io: not available at time of review on lower tiers, listed under Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Craft.io offer a free plan like Productboard?",
      "answer": "No, Craft.io has no permanently free plan, only a 14-day free trial with no credit card required. Productboard offers a genuine $0/month Free plan."
    },
    {
      "question": "How do the AI features compare?",
      "answer": "Craft.io's Guru AI automates epic summaries, release notes, and go-to-market briefs, included from the entry Starter plan. Productboard's Spark AI converts ideas into delivery-ready specs, metered by monthly AI credits that scale by plan."
    },
    {
      "question": "Which tool integrates with design tools like Figma?",
      "answer": "Craft.io connects to Figma, Adobe XD, Sketch, Mural, Axure, InVision, and Miro starting on its Pro plan. Productboard's documented integrations focus on analytics tools like Amplitude and Mixpanel instead."
    },
    {
      "question": "What's the entry price for each platform?",
      "answer": "Both start around $19/user/month billed annually: Craft.io's Starter plan is $19/editor/month, and Productboard's Plus plan is $19/maker/month."
    },
    {
      "question": "Are OKRs included in Craft.io's base price?",
      "answer": "No, OKRs and product strategy are a paid add-on ($20/month, or $15/month billed annually) on Craft.io's Starter and Pro plans, included by default only on Enterprise."
    },
    {
      "question": "Do contributors and viewers cost extra on either platform?",
      "answer": "No. Craft.io gives unlimited free contributor and viewer seats, charging only for editors, team leaders, and admins. Productboard includes 25 free contributors even on its Free plan and unlimited contributors from Enterprise."
    }
  ]
};

export default craftIoVsProductboardContent;
