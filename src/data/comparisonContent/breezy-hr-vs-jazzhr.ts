import type { ToolComparisonContent } from './types';

const breezyHrVsJazzhrContent: ToolComparisonContent = {
  "verdict": "Breezy HR and JazzHR both target small and mid-sized companies that want a straightforward applicant tracking system rather than an enterprise recruiting suite, but they get there in different ways. Breezy HR leans on a genuinely free Bootstrap plan, a visual drag-and-drop pipeline, and built-in interview scheduling and live video, making it a natural fit for lean teams or first-time hiring managers who want something intuitive with no upfront cost. Its paid tiers then add reference checking, e-signatures, and HRIS integration as needs grow. JazzHR skips the free tier entirely, starting at $1,000 per year for the Hero plan, but offers flat, unlimited-user pricing plus AI-powered candidate matching, configurable workflow automation, and a custom report builder on its higher tiers, which suits teams that already know they are hiring steadily and want automation and reporting depth from day one. Neither company publishes head-to-head data on video interviewing, custom reporting, or mobile apps for the other product, so buyers should treat those gaps as unconfirmed rather than assume feature parity. The right choice comes down to budget timing and workflow maturity: Breezy suits testing the waters for free, JazzHR suits teams ready to commit annually for automation and matching.",
  "bestForToolA": "Breezy HR is the better fit for small teams or first-time hiring managers who want a free, visual, easy-to-use ATS with built-in scheduling and video before committing to a paid plan.",
  "bestForToolB": "JazzHR is the better fit for small or mid-sized businesses that are already hiring steadily and want flat annual pricing with AI-powered candidate matching, workflow automation, and deeper custom reporting.",
  "whoNeedsBoth": "A growing company might start on Breezy's free plan while hiring occasionally, then evaluate JazzHR Plus or Pro once volume grows and it wants AI matching and a dedicated report builder, effectively trialing both before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Free plan versus flat annual fee",
      "toolA": "Breezy HR offers a genuinely free Bootstrap plan with unlimited users and candidates for one open position.",
      "toolB": "JazzHR has no free plan; its Hero tier starts at $1,000 per year billed annually.",
      "whyItMatters": "Teams that hire only occasionally can run Breezy at zero cost, while JazzHR requires an annual commitment even for light use.",
      "benefitsWho": "Very small teams and infrequent hirers benefit from Breezy's free tier; JazzHR suits buyers ready to commit to a paid plan upfront."
    },
    {
      "title": "Entry price point for paid plans",
      "toolA": "Breezy paid plans start around $157 per month (about $1,884 per year) for the Startup tier.",
      "toolB": "JazzHR's Hero plan starts at $1,000 per year but is capped at a small number of active jobs before extra costs apply.",
      "whyItMatters": "The cheapest paid tier of each tool has different constraints, so buyers should compare against expected job volume, not sticker price alone.",
      "benefitsWho": "Teams with many simultaneous open roles may find Breezy Startup's unlimited positions more predictable than JazzHR's per-job caps on Hero."
    },
    {
      "title": "Pipeline interface style",
      "toolA": "Breezy centers on a visual, drag-and-drop kanban-style candidate pipeline.",
      "toolB": "JazzHR centers on configurable pipeline stages with tagging and filtering to compare candidates.",
      "whyItMatters": "A visual drag-and-drop board is generally easier for non-recruiter hiring managers to pick up quickly.",
      "benefitsWho": "Teams with many non-recruiter stakeholders benefit from Breezy's visual pipeline; teams wanting granular tagging and filtering may prefer JazzHR's approach."
    },
    {
      "title": "AI-powered candidate matching",
      "toolA": "Breezy's documentation mentions AI credits as a paid add-on but does not detail a specific AI matching feature.",
      "toolB": "JazzHR includes AI-powered candidate matching built into its Plus and Pro plans.",
      "whyItMatters": "Buyers who specifically want automated candidate-to-role matching have clearer, plan-included support for that on JazzHR.",
      "benefitsWho": "Teams prioritizing AI-assisted shortlisting benefit from JazzHR Plus or Pro; Breezy's AI scope is less clearly documented."
    },
    {
      "title": "Interview scheduling and video",
      "toolA": "Breezy includes candidate self-scheduling and built-in live video interviewing on its paid plans.",
      "toolB": "JazzHR's provided facts do not document a built-in video interviewing feature.",
      "whyItMatters": "Not needing a separate scheduling or video tool can simplify the hiring tech stack.",
      "benefitsWho": "Teams that want interview logistics handled inside the ATS benefit from Breezy; JazzHR users may need a separate video tool."
    },
    {
      "title": "Automated reference checking",
      "toolA": "Breezy offers automated reference checking as a documented feature on its Growth plan and above.",
      "toolB": "JazzHR's provided facts do not mention a reference-checking feature.",
      "whyItMatters": "Automated reference checks save recruiter time compared to manual outreach and follow-up.",
      "benefitsWho": "Teams that formally reference-check every hire benefit from Breezy's built-in workflow."
    },
    {
      "title": "Reporting depth",
      "toolA": "Breezy provides real-time dashboards covering pipeline metrics, time-to-fill, and source effectiveness.",
      "toolB": "JazzHR adds a custom report builder and workflow reporting on top of standard dashboards, on its Pro plan.",
      "whyItMatters": "Organizations that need to build custom, ad hoc reports for stakeholders may need more than a fixed dashboard.",
      "benefitsWho": "Data-driven hiring teams needing bespoke reports benefit from JazzHR Pro; teams satisfied with standard metrics are covered by Breezy."
    },
    {
      "title": "Mobile apps",
      "toolA": "Breezy provides native iOS and Android apps for managing pipelines on the go.",
      "toolB": "JazzHR's provided facts do not document dedicated mobile apps.",
      "whyItMatters": "Hiring managers who review candidates away from a desktop benefit from a native mobile experience.",
      "benefitsWho": "Distributed or frequently traveling hiring teams benefit more from Breezy's mobile apps."
    },
    {
      "title": "Company origin and maturity",
      "toolA": "Breezy HR was founded in 2014 and is based in Jacksonville, Florida.",
      "toolB": "JazzHR was founded in 2009 and is based in Pittsburgh, Pennsylvania, making it the older of the two products.",
      "whyItMatters": "A longer operating history can suggest more time refining integrations and support processes, though it does not guarantee a better fit.",
      "benefitsWho": "Buyers who weigh vendor longevity as a factor may lean toward JazzHR's longer track record."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Breezy's Bootstrap plan is free indefinitely for one position; JazzHR has no free tier"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "JazzHR has historically offered a free trial; current length should be confirmed on jazzhr.com"
        },
        {
          "feature": "Unlimited users",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Applicant Tracking and Pipelines",
      "rows": [
        {
          "feature": "Visual drag-and-drop pipeline",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "JazzHR's pipeline is configurable with tagging and filtering but not documented as drag-and-drop"
        },
        {
          "feature": "Resume parsing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Job Posting and Career Site",
      "rows": [
        {
          "feature": "Job board distribution",
          "toolA": "available",
          "toolB": "available",
          "note": "Breezy cites 50+ boards; JazzHR includes premium listings but does not state a board count"
        },
        {
          "feature": "Branded careers page",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Interviewing and Scheduling",
      "rows": [
        {
          "feature": "Interview self-scheduling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Live video interviewing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Scorecards and interview guides",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Assessment integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Breezy at Business tier; JazzHR structured interviews and assessments on Plus and Pro"
        }
      ]
    },
    {
      "group": "Candidate Evaluation and Offers",
      "rows": [
        {
          "feature": "Automated reference checking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available on Breezy Growth plan and above"
        },
        {
          "feature": "Offer letters with eSignature",
          "toolA": "available",
          "toolB": "available",
          "note": "JazzHR eSignature is documented on the Pro plan"
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-powered candidate matching",
          "toolA": "limited",
          "toolB": "available",
          "note": "Breezy only references AI credits as a paid add-on, without matching-feature detail; JazzHR includes it on Plus and Pro plans"
        },
        {
          "feature": "Configurable workflow automation",
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
          "feature": "Real-time analytics dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom report builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "JazzHR Pro plan only"
        }
      ]
    },
    {
      "group": "Platform and Integrations",
      "rows": [
        {
          "feature": "Mobile apps (iOS and Android)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "HRIS integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Breezy at Business tier; JazzHR via its integration marketplace"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "available",
          "note": "Breezy's API access is gated to its top Business or Pro tier; JazzHR lists API among its tags"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Breezy HR or JazzHR?",
      "answer": "Breezy HR is cheaper to start with since its Bootstrap plan is free indefinitely for one open position, while JazzHR has no free tier and starts at $1,000 per year for the Hero plan; comparing paid tiers, Breezy's Startup plan at roughly $157 per month runs in a similar annual range to JazzHR's Hero plan, but each caps a different thing, active positions versus active jobs."
    },
    {
      "question": "Is Breezy HR or JazzHR better for a small business just starting to hire?",
      "answer": "Breezy HR is generally the better starting point for a small business because its free Bootstrap plan lets a team try a full ATS with unlimited users before paying anything, whereas JazzHR requires an annual commitment starting at $1,000 per year from day one."
    },
    {
      "question": "Does Breezy HR or JazzHR offer AI-powered candidate matching?",
      "answer": "JazzHR documents AI-powered candidate matching as a built-in feature on its Plus and Pro plans, while Breezy HR's provided facts only mention AI credits as a separate paid add-on without detailing a matching feature."
    },
    {
      "question": "Which tool has built-in video interviewing?",
      "answer": "Breezy HR includes built-in live video interviewing along with candidate self-scheduling on its paid plans; JazzHR's documented feature set does not mention a built-in video interviewing capability."
    },
    {
      "question": "Can Breezy HR or JazzHR integrate with HRIS systems?",
      "answer": "Both can: Breezy HR offers HRIS integrations on its top-tier Business plan, and JazzHR connects to HRIS platforms through its broader integration marketplace alongside background check and assessment providers."
    },
    {
      "question": "Which tool has a genuinely free plan?",
      "answer": "Breezy HR is the one with a genuinely free plan, its Bootstrap tier, which includes unlimited users and candidates for one active position with 30-day data retention; JazzHR does not offer a free plan and instead has historically offered a free trial."
    }
  ]
};

export default breezyHrVsJazzhrContent;
