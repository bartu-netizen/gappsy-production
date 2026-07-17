import type { ToolComparisonContent } from './types';

const ashbyVsGreenhouseContent: ToolComparisonContent = {
  "verdict": "Ashby and Greenhouse solve overlapping but not identical problems, and neither is a strict upgrade over the other. Ashby, founded in 2018, packages applicant tracking, sourcing CRM, scheduling automation, and analytics into one fast, modern interface built for high-growth tech companies that want a single tool covering the full recruiting workflow, with published starting pricing near 400 dollars per month for smaller teams. Greenhouse, founded in 2012, is built around structured interviewing methodology, scorecards, and increasingly deep enterprise governance, security, and onboarding handoff, aimed at larger or multi-region organizations that need standardized, defensible hiring decisions and a long list of pre-built integrations. Greenhouse documents features Ashby does not, like a candidate-facing status portal and onboarding workflows into HR systems, while Ashby documents features Greenhouse does not, like a careers page builder and interviewer load reporting. Both require a sales-led evaluation with no self-serve free trial, and both use custom or tiered enterprise pricing rather than flat self-serve rates. The choice comes down to whether a team wants one lean, fast, all-in-one recruiting workspace, which points to Ashby, or a structured, governance-heavy platform with deeper candidate-facing and onboarding tooling, which points to Greenhouse.",
  "bestForToolA": "Ashby fits fast-moving, high-growth tech companies that want applicant tracking, sourcing CRM, scheduling, and analytics unified in one modern, fast interface without needing separate BI tools.",
  "bestForToolB": "Greenhouse fits larger or multi-region enterprises that need structured, standardized interviewing, documented SSO and audit logging, and built-in onboarding handoff into HR systems.",
  "whoNeedsBoth": "A company scaling from a lean recruiting team into a large, multi-region organization might start on Ashby for speed and later add or migrate toward Greenhouse's governance and onboarding depth, or run both if different business units have different compliance needs.",
  "keyDifferences": [
    {
      "title": "Company age and market positioning",
      "toolA": "Ashby was founded in 2018 and positions itself as a modern, all-in-one recruiting platform for high-growth tech companies.",
      "toolB": "Greenhouse was founded in 2012 and has grown into an enterprise-oriented hiring platform with structured methodology and governance features.",
      "whyItMatters": "A newer, narrower-focus product tends to iterate faster and target one buyer profile, while a longer-established platform tends to have broader enterprise capabilities built up over more product cycles.",
      "benefitsWho": "Fast-moving startups and scale-ups may prefer Ashby; large, multi-region enterprises may prefer Greenhouse's longer track record."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Ashby publishes a starting price of roughly 400 dollars per month for its Foundations plan covering up to 100 employees.",
      "toolB": "Greenhouse does not publish any pricing and requires a custom sales quote for every plan, including its entry-level Core tier.",
      "whyItMatters": "Published starting pricing lets smaller buyers budget and self-qualify before talking to sales, while fully custom pricing usually means a longer sales cycle.",
      "benefitsWho": "Budget-conscious smaller teams benefit from Ashby's published starting price; procurement-heavy enterprises are used to Greenhouse's custom-quote process anyway."
    },
    {
      "title": "Pricing basis",
      "toolA": "Ashby prices its Foundations plan based on total company headcount up to 100 employees, then moves to custom quotes for 101 to 1000+ employees.",
      "toolB": "Greenhouse prices across three named tiers, Core, Plus, and Pro, each with an expanding feature set rather than a published per-employee number.",
      "whyItMatters": "Headcount-based pricing can rise as a company grows even if hiring volume stays flat, while tiered feature-based pricing ties cost more directly to which capabilities a team actually uses.",
      "benefitsWho": "Companies with stable headcount but heavy hiring may prefer Greenhouse's tier model; companies that want a known starting number may prefer Ashby's published entry price."
    },
    {
      "title": "Core product philosophy",
      "toolA": "Ashby combines applicant tracking, sourcing CRM, scheduling automation, and analytics into one unified recruiting suite.",
      "toolB": "Greenhouse centers its product on structured interviewing methodology, kits and scorecards, plus enterprise governance and onboarding handoff.",
      "whyItMatters": "A unified operational suite optimizes for recruiter day-to-day speed, while a structured-methodology platform optimizes for evaluation consistency and compliance at scale.",
      "benefitsWho": "Recruiting teams who want one fast tool for sourcing through scheduling benefit from Ashby; talent acquisition leaders focused on standardized, defensible hiring decisions benefit from Greenhouse."
    },
    {
      "title": "AI feature depth",
      "toolA": "Ashby offers an AI Meeting Notetaker that records interviews and generates summaries, sold as a paid add-on.",
      "toolB": "Greenhouse offers an Interview Notetaker plus Real Talent, which combines AI candidate matching with identity verification and fraud detection.",
      "whyItMatters": "Notetaking automation saves interviewer time in both products, but fraud detection and candidate matching address a different problem, screening out fraudulent or AI-generated applications.",
      "benefitsWho": "Teams worried about fraudulent or bot-generated applicants get more direct AI coverage from Greenhouse; teams that just want faster interview notes are covered by either product."
    },
    {
      "title": "Candidate facing experience",
      "toolA": "Ashby's documented features center on employer-side tools such as a careers page builder, with no documented candidate status portal.",
      "toolB": "Greenhouse offers MyGreenhouse, a candidate-facing portal with real-time application status updates and job alerts.",
      "whyItMatters": "A dedicated candidate portal can reduce candidate-experience complaints and inbound status-check emails to recruiters at high application volumes.",
      "benefitsWho": "Employers with high applicant volume and a strong employer-brand focus benefit more from Greenhouse's candidate portal."
    },
    {
      "title": "Onboarding and HR handoff",
      "toolA": "Ashby's documented feature set stops at offer management and approvals, with no documented onboarding workflow.",
      "toolB": "Greenhouse includes onboarding tools that carry new-hire information from the offer stage into onboarding and connected HR systems.",
      "whyItMatters": "Built-in onboarding handoff reduces manual data entry and rekeying between the ATS and HRIS once a candidate is hired.",
      "benefitsWho": "Companies wanting one connected system from requisition to onboarding benefit from Greenhouse; companies with a separate dedicated onboarding tool may not need this from their ATS."
    },
    {
      "title": "Enterprise security and governance",
      "toolA": "Ashby's Enterprise tier, for companies of 1000 plus employees, includes advanced security and admin controls, though specifics like SSO are not itemized in the documented facts.",
      "toolB": "Greenhouse documents SSO from its Core tier upward and adds audit logs and enterprise-level data configuration and security at its Pro tier.",
      "whyItMatters": "Explicitly documented SSO and audit logging matter to security and compliance teams evaluating a new system before rollout.",
      "benefitsWho": "Security and IT teams at large, multi-region organizations get clearer documented guarantees from Greenhouse."
    },
    {
      "title": "Integrations approach",
      "toolA": "Ashby connects to job boards, assessment providers, calendars, and HRIS systems through an open API and webhooks.",
      "toolB": "Greenhouse offers a large integrations marketplace of pre-built connections to HRIS, background check, assessment, and sourcing vendors.",
      "whyItMatters": "An open API favors teams that want to build custom connections, while a large pre-built marketplace favors teams that want to plug in without engineering work.",
      "benefitsWho": "Technical teams with engineering resources may prefer Ashby's API-first approach; non-technical recruiting operations teams may prefer Greenhouse's larger pre-built marketplace."
    },
    {
      "title": "Free trial and evaluation",
      "toolA": "Ashby offers no free trial or free plan; evaluation happens through a sales demo and proof-of-concept.",
      "toolB": "Greenhouse similarly does not widely advertise a self-serve free trial and moves prospects through a demo and sales conversation.",
      "whyItMatters": "Neither product can be evaluated without engaging sales, so buyers should budget time for a guided evaluation process with either vendor.",
      "benefitsWho": "Buyers comfortable with a sales-led evaluation are equally served by either tool; teams wanting self-serve trials will find neither ideal."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core applicant tracking",
      "rows": [
        {
          "feature": "Configurable pipelines and hiring stages",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Structured interview kits and scorecards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Branded careers page builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Not itemized in Greenhouse's documented feature list"
        }
      ]
    },
    {
      "group": "Sourcing and CRM",
      "rows": [
        {
          "feature": "Candidate sourcing CRM and talent pools",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Outbound email sequencing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Candidate texting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included in Greenhouse's Plus tier"
        }
      ]
    },
    {
      "group": "Interview scheduling",
      "rows": [
        {
          "feature": "Automated interview scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": "Listed under Greenhouse's Core plan features"
        },
        {
          "feature": "Multi person panel coordination across time zones",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Explicitly documented for Ashby only"
        }
      ]
    },
    {
      "group": "AI features",
      "rows": [
        {
          "feature": "AI interview notetaker",
          "toolA": "available",
          "toolB": "available",
          "note": "Ashby's version is a paid add-on"
        },
        {
          "feature": "AI candidate matching",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Greenhouse's Real Talent feature"
        },
        {
          "feature": "Fraud and spam detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of Greenhouse's Real Talent feature, expanded in Plus and Pro tiers"
        }
      ]
    },
    {
      "group": "Analytics and reporting",
      "rows": [
        {
          "feature": "Pipeline and funnel conversion analytics",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Interviewer load reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Diversity metrics",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Business intelligence connector",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included in Greenhouse's Plus tier"
        }
      ]
    },
    {
      "group": "Candidate experience",
      "rows": [
        {
          "feature": "Candidate facing status portal",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Greenhouse's MyGreenhouse portal"
        },
        {
          "feature": "Job alerts for candidates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Part of MyGreenhouse"
        }
      ]
    },
    {
      "group": "Offer and onboarding",
      "rows": [
        {
          "feature": "Offer approval workflows and letter generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Onboarding handoff to HR systems",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise security and integrations",
      "rows": [
        {
          "feature": "Single sign on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented from Greenhouse's Core tier upward"
        },
        {
          "feature": "Audit logs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented at Greenhouse's Pro tier"
        },
        {
          "feature": "Open API and webhooks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Pre built integrations marketplace",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenhouse markets a larger named marketplace; Ashby documents integrations via API and webhooks to similar categories"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Ashby or Greenhouse?",
      "answer": "Ashby publishes a starting price of roughly 400 dollars per month for companies up to 100 employees, while Greenhouse does not publish any pricing and requires a custom quote for every tier, so Ashby is the only one of the two with a documented starting cost."
    },
    {
      "question": "Is Ashby or Greenhouse better for a small or first time hiring team?",
      "answer": "Ashby is more approachable for a smaller team since it has a published entry price and packages sourcing, scheduling, and analytics into one product, while Greenhouse's structured methodology approach and custom pricing are generally built with larger hiring operations in mind."
    },
    {
      "question": "Does Greenhouse have AI features like Ashby's notetaker?",
      "answer": "Yes, Greenhouse has its own Interview Notetaker that captures and summarizes interviews, and it goes further with Real Talent, an AI candidate matching and fraud detection feature that Ashby's documented feature set does not include."
    },
    {
      "question": "Which has better analytics and reporting?",
      "answer": "Both offer pipeline and funnel analytics, but Greenhouse documents diversity metrics and a business intelligence connector while Ashby documents interviewer load reporting, so the better fit depends on whether a team needs diversity and BI tool reporting or interviewer workload visibility."
    },
    {
      "question": "Can Ashby handle onboarding the way Greenhouse does?",
      "answer": "Not based on documented features. Greenhouse includes onboarding tools that carry new hire information into connected HR systems, while Ashby's documented feature set stops at offer management and approvals with no onboarding workflow."
    },
    {
      "question": "Do either Ashby or Greenhouse offer a free trial?",
      "answer": "No. Neither Ashby nor Greenhouse offers a self-serve free trial or free plan, both require going through a sales demo, and Ashby specifically also involves a proof-of-concept process before purchase."
    }
  ]
};

export default ashbyVsGreenhouseContent;
