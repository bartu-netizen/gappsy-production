import type { ToolComparisonContent } from './types';

const greenhouseVsWorkableContent: ToolComparisonContent = {
  "verdict": "Greenhouse and Workable both descend from the same 2012 founding era, but they now serve different points on the hiring maturity curve. Greenhouse is built for organizations that want to run hiring as a rigorous, governed process: standardized scorecards, fraud and identity detection, enterprise-grade SSO and audit logging, and a large integrations marketplace that plugs into an existing HRIS stack. Its custom, sales-quoted pricing and heavier setup reflect that enterprise orientation. Workable is built for speed and breadth at the small-to-mid-market level: one-click distribution to a large job board network, an AI sourcing and screening agent, and a bundled HRIS layer covering onboarding, time off, and payroll prep, all sold on published, headcount-based plans starting at 299 dollars a month with a 15-day free trial. Neither tool is objectively better; the right choice depends on whether a team needs deep governance and integration depth for complex, multi-region hiring, or fast time-to-value with built-in HR operations for a growing but leaner organization. Teams evaluating strictly on documented AI depth, published pricing transparency, and self-serve trial access will lean Workable, while teams evaluating on structured-hiring discipline, fraud detection, and enterprise security controls will lean Greenhouse.",
  "bestForToolA": "Greenhouse is the better fit for larger or multi-region organizations that need structured, auditable hiring processes, enterprise security controls like SSO and audit logs, and deep integration with an existing HRIS and background-check stack.",
  "bestForToolB": "Workable is the better fit for small and mid-sized companies that want published, predictable pricing, a fast setup with minimal training, one-click job board distribution, and bundled HR features like onboarding and time off in a single platform.",
  "whoNeedsBoth": "A company that scales quickly from a lean recruiting function into a multi-region enterprise might run Workable for early, cost-efficient hiring and job board reach, then adopt Greenhouse as its structured-hiring and governance needs, headcount, and compliance requirements grow.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Greenhouse publishes no rates; all plans require a custom sales quote",
      "toolB": "Workable publishes a starting price of 299 dollars per month for its Standard plan, billed annually",
      "whyItMatters": "Buyers comparing options quickly need to know if they can budget without a sales call",
      "benefitsWho": "Cost-conscious small and mid-sized teams benefit from Workable's published pricing, while enterprises expecting negotiated contracts are unaffected by Greenhouse's opaque model"
    },
    {
      "title": "Free trial access",
      "toolA": "No self-serve free trial is documented; prospects go through a demo and sales conversation",
      "toolB": "A 15-day free trial with no credit card required gives access to the Standard plan feature set",
      "whyItMatters": "A trial lets a team validate fit before committing budget and implementation time",
      "benefitsWho": "Smaller teams that want to test-drive software before buying benefit from Workable's trial model"
    },
    {
      "title": "Job board distribution",
      "toolA": "Not documented as a dedicated one-click multi-board posting feature; relies instead on an integrations marketplace",
      "toolB": "Publishes a job once and distributes it to a large network of free and premium job boards with a single click",
      "whyItMatters": "Fast, wide job board reach matters most to teams hiring frequently across many channels with limited recruiting headcount",
      "benefitsWho": "High-volume, lean recruiting teams benefit most from Workable's one-click distribution"
    },
    {
      "title": "AI recruiting approach",
      "toolA": "Real Talent matching pairs AI candidate matching with identity verification and fraud detection, plus an AI interview notetaker",
      "toolB": "An AI sourcing tool searches candidate pools for passive talent, and an AI recruiting agent can screen, qualify, and engage candidates automatically",
      "whyItMatters": "Fraud and identity risk are a growing concern for high-volume hiring, while automated sourcing and engagement save time on early-funnel manual work",
      "benefitsWho": "Teams worried about fraudulent or AI-generated applications benefit from Greenhouse's Real Talent features, while teams wanting hands-off top-of-funnel screening benefit from Workable's AI agent"
    },
    {
      "title": "Bundled HR operations",
      "toolA": "Onboarding tools carry offer-stage data into onboarding and connected HR systems, but payroll and time off are not documented",
      "toolB": "Includes onboarding, employee time-off requests, and payroll preparation in the same platform used for recruiting",
      "whyItMatters": "Consolidating recruiting and core HR operations in one system reduces tool sprawl for smaller HR teams",
      "benefitsWho": "Smaller companies without a separate HRIS benefit from Workable's bundled HR functions; larger companies with existing HRIS platforms may prefer Greenhouse's connector approach"
    },
    {
      "title": "Enterprise security and governance",
      "toolA": "SSO is included starting on the Core plan, with audit logs and enterprise-level data configuration on the Pro plan",
      "toolB": "SSO support is only available on the top Enterprise plan at 719 dollars per month",
      "whyItMatters": "Organizations with compliance or multi-business-unit governance needs require SSO and audit trails as baseline requirements, not premium add-ons",
      "benefitsWho": "Enterprises with strict security requirements benefit from Greenhouse's earlier inclusion of SSO across tiers"
    },
    {
      "title": "Mobile access",
      "toolA": "No native mobile app is documented",
      "toolB": "Native iOS and Android apps let hiring managers review resumes, message candidates, and schedule interviews on the go",
      "whyItMatters": "Hiring managers who are frequently away from a desk need mobile access to keep pipelines moving without delay",
      "benefitsWho": "Distributed or field-based hiring teams benefit from Workable's mobile app"
    },
    {
      "title": "Reporting depth versus customization",
      "toolA": "Reporting and analytics cover pipeline health, time-to-hire, source effectiveness, and diversity metrics, with AI-powered report filters on the Plus plan",
      "toolB": "Reporting covers time to hire, pipeline conversion, and source effectiveness, but customization is documented as more limited than some competitors",
      "whyItMatters": "Recruiting leadership at larger organizations often needs granular, customizable dashboards for board-level reporting",
      "benefitsWho": "Enterprise recruiting operations teams benefit from Greenhouse's deeper reporting customization"
    },
    {
      "title": "Setup and learning curve",
      "toolA": "Structured-hiring workflows require meaningful upfront configuration time and have a learning curve for unfamiliar teams",
      "toolB": "Designed to be fast to set up and easy for hiring managers to learn without extensive training",
      "whyItMatters": "Time to first value matters for teams that need to start hiring immediately without a long implementation phase",
      "benefitsWho": "Smaller teams without dedicated recruiting operations staff benefit from Workable's faster onboarding"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core ATS Workflow",
      "rows": [
        {
          "feature": "Structured interview kits and scorecards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Interview scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "Workable adds candidate self-scheduling; Greenhouse bundles scheduling into its Core plan"
        },
        {
          "feature": "Visual candidate pipeline tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Named explicitly as a Workable feature; not separately documented for Greenhouse"
        }
      ]
    },
    {
      "group": "Sourcing and Candidate Acquisition",
      "rows": [
        {
          "feature": "AI-driven candidate matching or sourcing",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenhouse's Real Talent focuses on matching plus fraud detection; Workable's AI sourcing searches a broad candidate pool"
        },
        {
          "feature": "One-click multi job board posting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Sourcing and CRM for passive talent pools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Named explicitly as a Greenhouse feature"
        }
      ]
    },
    {
      "group": "AI Recruiting Features",
      "rows": [
        {
          "feature": "AI interview notetaker",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Autonomous AI screening or engagement agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Fraud or identity verification for applicants",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of Greenhouse's Real Talent and fraud and spam detection features"
        }
      ]
    },
    {
      "group": "Hiring Manager and Candidate Experience",
      "rows": [
        {
          "feature": "Candidate-facing status portal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "MyGreenhouse portal for Greenhouse"
        },
        {
          "feature": "Mobile recruiting app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Native iOS and Android apps"
        },
        {
          "feature": "Offer letters with e-signatures",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Onboarding and HR Operations",
      "rows": [
        {
          "feature": "New hire onboarding workflow",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Time off tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Payroll preparation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and Analytics",
      "rows": [
        {
          "feature": "Pipeline, time-to-hire, and source reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Diversity metrics reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Advanced report customization",
          "toolA": "available",
          "toolB": "limited",
          "note": "Workable's reporting customization is explicitly documented as more limited than some competitors"
        }
      ]
    },
    {
      "group": "Integrations, Platform, and Security",
      "rows": [
        {
          "feature": "Third-party integrations marketplace",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenhouse describes a large pre-built marketplace; Workable offers an open API and integrations"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Single sign-on (SSO)",
          "toolA": "available",
          "toolB": "available",
          "note": "Included from Greenhouse's Core plan; only on Workable's top-tier Enterprise plan at 719 dollars per month"
        },
        {
          "feature": "Audit logs and enterprise data governance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Greenhouse's Pro plan"
        }
      ]
    },
    {
      "group": "Pricing and Trial",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Greenhouse requires a custom quote; Workable starts at 299 dollars per month"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Workable offers a 15-day trial with no credit card required"
        },
        {
          "feature": "Permanently free tier",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Greenhouse or Workable cheaper?",
      "answer": "Workable is the cheaper and more transparent option on paper, starting at 299 dollars per month for its Standard plan with published Premier and Enterprise tiers up to 719 dollars per month, while Greenhouse does not publish any pricing and requires a custom sales quote based on company size and plan."
    },
    {
      "question": "Does Greenhouse offer a free trial like Workable does?",
      "answer": "No, Greenhouse does not widely advertise a self-serve free trial and instead requires prospects to go through a demo and sales conversation, whereas Workable offers a 15-day free trial with no credit card required."
    },
    {
      "question": "Can Greenhouse post jobs to multiple job boards like Workable can?",
      "answer": "This is not documented for Greenhouse; Workable explicitly offers one-click posting to a large network of free and premium job boards, while Greenhouse's documented distribution approach relies on its integrations marketplace rather than a named one-click multi-board feature."
    },
    {
      "question": "Which tool has better AI recruiting features, Greenhouse or Workable?",
      "answer": "It depends on the use case: Greenhouse's Real Talent matching combines AI candidate matching with identity verification and fraud detection plus an AI interview notetaker, while Workable's AI sourcing tool and AI recruiting agent focus on finding passive candidates and automating early-stage screening and engagement."
    },
    {
      "question": "Is Workable good for small businesses and hiring beginners?",
      "answer": "Yes, Workable is documented as fast to set up and easy for hiring managers to learn without extensive training, though the removal of a lower-cost entry tier means very small or infrequent hirers should compare current plan pricing against their hiring volume."
    },
    {
      "question": "Which platform is better for enterprise hiring governance, Greenhouse or Workable?",
      "answer": "Greenhouse is the stronger documented fit for enterprise governance, including SSO from its Core plan, audit logs and enterprise-level data configuration on its Pro plan, and reporting on diversity metrics, while Workable only includes SSO on its top-tier Enterprise plan and does not document audit logs or diversity reporting."
    }
  ]
};

export default greenhouseVsWorkableContent;
