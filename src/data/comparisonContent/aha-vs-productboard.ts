import type { ToolComparisonContent } from './types';

const ahaVsProductboardContent: ToolComparisonContent = {
  "verdict": "Aha! is a comprehensive suite spanning strategy through delivery — Roadmaps, Discovery, Ideas, Whiteboards, Builder, and Develop/Teamwork — priced from $74.59/user/month with no free plan, only a 30-day free trial, and free read-only seats reserved for its Enterprise and Enterprise+ tiers. Productboard is a freemium product management platform starting at $19/maker/month with a genuine $0/month Free plan, centered on customer insights, roadmapping, and AI spec generation (Spark) that is metered by monthly AI credits. Aha! suits teams wanting one platform across the entire product lifecycle including engineering delivery tracking; Productboard suits teams wanting a lower-cost entry point with a real free tier.",
  "bestForToolA": "Aha! fits product teams that want a single platform covering strategy, customer discovery interviews, ideation whiteboards, AI-assisted prototyping (Aha! Builder), and engineering delivery tracking (Aha! Develop and Teamwork), and don't mind starting at $74.59/user/month.",
  "bestForToolB": "Productboard fits teams that want to start on a genuine $0/month Free plan (500 feedback notes, 25 contributors, 1 teamspace) and scale into AI spec generation (Spark) and product-usage integrations like Amplitude and Mixpanel as they grow.",
  "whoNeedsBoth": "There's no realistic scenario for running both at once — both are full product management systems of record for roadmapping and feedback, and using two would mean maintaining duplicate roadmaps and feedback data rather than any complementary split.",
  "keyDifferences": [
    {
      "title": "Free Plan Availability",
      "toolA": "Aha! has no free plan; it offers only a 30-day free trial, with paid plans starting at $74.59/user/month (Premium).",
      "toolB": "Productboard offers a genuine $0/month Free plan with unlimited roadmaps, 500 feedback notes, 25 contributors, and 1 teamspace, with no credit card required.",
      "whyItMatters": "A true free plan lets small teams use the product indefinitely without a purchasing decision, unlike a time-limited trial.",
      "benefitsWho": "Small teams or early-stage startups evaluating product management tools without budget benefit from Productboard's Free plan."
    },
    {
      "title": "Entry Price Point",
      "toolA": "Aha!'s entry Premium tier starts at $74.59/user/month.",
      "toolB": "Productboard's entry paid tier (Plus) starts at $19/maker/month billed annually, or $25/maker/month billed monthly.",
      "whyItMatters": "The roughly 4x difference in entry price affects which team sizes and budgets can justify the tool.",
      "benefitsWho": "Budget-conscious product teams benefit from Productboard's lower entry price; teams wanting a full suite from day one may accept Aha!'s higher cost."
    },
    {
      "title": "Scope of Suite",
      "toolA": "Aha! bundles a broad suite as add-ons: Aha! Discovery (customer interviews), Aha! Ideas, Aha! Whiteboards, Aha! Builder (AI-powered prototype and app creation), and Aha! Develop and Teamwork (engineering delivery coordination).",
      "toolB": "Productboard focuses on customer insights, roadmapping, strategic planning, and AI spec generation (Spark), without a documented dedicated engineering-delivery module.",
      "whyItMatters": "Teams that want strategy-through-delivery in one system need a suite that extends into engineering workflow management.",
      "benefitsWho": "Product and engineering teams wanting delivery tracking alongside roadmapping benefit from Aha!'s broader suite."
    },
    {
      "title": "AI Feature Model",
      "toolA": "Aha!'s Elle AI assistant and Aha! Builder are described as included platform features without a documented credit-cap system.",
      "toolB": "Productboard's Spark AI is credit-based across all plans — 50 shared credits on Free, scaling up to 800 credits per maker per month on Enterprise — with paid top-ups required once the cap is reached.",
      "whyItMatters": "Metered AI usage can create unpredictable costs for heavy users, while uncapped AI use offers more predictable access.",
      "benefitsWho": "Teams with heavy, unpredictable AI usage needs may prefer Aha!'s uncapped model; teams wanting a low-cost entry point may accept Productboard's credit caps."
    },
    {
      "title": "Free Viewer/Reviewer Seats at Scale",
      "toolA": "Aha! makes reviewer and viewer seats free only on its Enterprise ($124.99/user/month) and Enterprise+ ($149/user/month) tiers.",
      "toolB": "Productboard includes 25 free contributors even on its $0 Free plan, and unlimited contributors starting at its Enterprise tier.",
      "whyItMatters": "The point at which non-editing stakeholders become free affects total cost for organizations with many viewers relative to editors.",
      "benefitsWho": "Organizations with many read-only stakeholders (executives, sales, support) benefit from whichever tool makes those seats free at their budget tier."
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
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Aha!: $74.59/user/month; Productboard: $19/maker/month (annual)"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Aha!: 30-day; Productboard: 14-day (Business plan only)"
        },
        {
          "feature": "Free viewer/reviewer seats",
          "toolA": "available",
          "toolB": "available",
          "note": "Aha!: Enterprise/Enterprise+ only; Productboard: 25 free contributors even on Free plan, unlimited from Enterprise"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha!'s Elle"
        },
        {
          "feature": "AI prototype/app generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha! Builder"
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
      "group": "Suite Breadth",
      "rows": [
        {
          "feature": "Customer interview/discovery management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha! Discovery"
        },
        {
          "feature": "Collaborative whiteboarding",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha! Whiteboards"
        },
        {
          "feature": "Engineering delivery tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Aha! Develop and Teamwork"
        },
        {
          "feature": "Product usage analytics integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Amplitude, Mixpanel on paid plans"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Aha! have a free plan like Productboard?",
      "answer": "No, Aha! offers no free plan, only a 30-day free trial. Productboard offers a genuine $0/month Free plan with 500 feedback notes, 25 contributors, and 1 teamspace."
    },
    {
      "question": "What's the starting price for each?",
      "answer": "Aha!'s Premium plan starts at $74.59/user/month. Productboard's Plus plan starts at $19/maker/month billed annually, or $25/maker/month billed monthly."
    },
    {
      "question": "How does AI usage work on each platform?",
      "answer": "Aha! includes the Elle AI assistant and Aha! Builder without a documented credit cap. Productboard's Spark AI is metered by monthly AI credits that scale by plan, from 50 shared credits on Free up to 800 per maker on Enterprise."
    },
    {
      "question": "Which platform includes engineering delivery tracking?",
      "answer": "Aha! includes Aha! Develop and Teamwork for engineering workflow management and delivery coordination. Productboard does not document a comparable delivery-tracking module."
    },
    {
      "question": "When are viewer or reviewer seats free?",
      "answer": "Aha! makes read-only reviewer and viewer seats free only on its Enterprise and Enterprise+ plans. Productboard includes 25 free contributors even on its Free plan, and unlimited contributors starting at Enterprise."
    },
    {
      "question": "Which large companies use Productboard?",
      "answer": "Productboard lists Autodesk, Zoom, Salesforce, and Coca-Cola among its customers."
    }
  ]
};

export default ahaVsProductboardContent;
