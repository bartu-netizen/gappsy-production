import type { ToolComparisonContent } from './types';

const greenhouseVsLeverContent: ToolComparisonContent = {
  "verdict": "Greenhouse and Lever both trace back to the 2012 wave of modern applicant tracking systems and both sell exclusively through custom, quote-based enterprise contracts rather than public self-serve pricing. The real choice comes down to which recruiting motion a team actually runs. Greenhouse leans hardest into structured, defensible hiring: standardized interview kits and scorecards, an AI interview notetaker, explicit Real Talent identity verification and fraud detection, a candidate-facing MyGreenhouse portal, and dedicated offer-to-onboarding workflows that hand new hires off to connected HR systems. That makes it a strong fit for organizations that need consistent, auditable hiring decisions and want the platform to own the process from application through onboarding. Lever is built around LeverTRM, its combined ATS and CRM, with nurture and email campaign tools designed to keep passive candidate pools warm between hiring cycles, plus workflow automation for repetitive recruiting tasks. That makes it a better match for teams doing continuous, proactive sourcing rather than reactive requisition filling. Both platforms offer solid reporting and diversity metrics dashboards, broad HRIS and assessment integrations, and enterprise security options, and neither publishes flat pricing or a free tier, so budget comparisons require a sales conversation either way. Neither tool is a clear universal winner; the better pick depends on whether an organization values Greenhouse's structured evaluation and fraud safeguards or Lever's sourcing and nurture-driven CRM workflow.",
  "bestForToolA": "Greenhouse is the better fit for enterprises that want a structured, audit-ready hiring process, with interview scorecards, AI-assisted note-taking, applicant fraud and identity verification, and built-in onboarding handoff to HR systems.",
  "bestForToolB": "Lever is the better fit for mid-market and enterprise teams doing continuous, proactive sourcing, since LeverTRM combines the ATS with a built-in CRM, nurture email campaigns, and workflow automation for keeping candidate pipelines warm.",
  "whoNeedsBoth": "Large, multi-brand or multi-region organizations that run compliance-heavy structured hiring for some roles while also doing always-on proactive sourcing for others may end up licensing both platforms across different business units or hiring functions.",
  "keyDifferences": [
    {
      "title": "Core product identity",
      "toolA": "Greenhouse is positioned as a structured applicant tracking and hiring platform built around interview kits, scorecards, and governance.",
      "toolB": "Lever is positioned around LeverTRM, a unified applicant tracking system and CRM built for ongoing sourcing and nurture.",
      "whyItMatters": "The two platforms are optimized for different recruiting rhythms, one geared toward consistent evaluation of active applicants and the other toward building and re-engaging talent pools over time.",
      "benefitsWho": "Compliance-focused hiring teams lean toward Greenhouse, while recruiting teams doing constant proactive sourcing lean toward Lever."
    },
    {
      "title": "Fraud and identity verification",
      "toolA": "Greenhouse documents a dedicated Real Talent Matching and Fraud Detection feature, combining AI candidate matching with identity verification aimed at catching AI-generated or fraudulent applications.",
      "toolB": "Lever's documented features describe AI-assisted sourcing and matching but do not mention dedicated identity verification or fraud-detection tools.",
      "whyItMatters": "As AI-generated resumes and fraudulent applications become a bigger recruiting risk, dedicated detection tooling reduces manual screening burden.",
      "benefitsWho": "High-volume hiring teams concerned about application fraud benefit most from Greenhouse's documented safeguards."
    },
    {
      "title": "AI interview notetaking",
      "toolA": "Greenhouse documents an AI notetaker that captures and summarizes interview conversations to cut down manual note-taking.",
      "toolB": "Lever's documented AI capability is centered on AI-assisted sourcing rather than an interview notetaking tool.",
      "whyItMatters": "Automated interview summaries save interviewer time and improve consistency of the written record used in evaluation.",
      "benefitsWho": "Interview-heavy teams that want less manual documentation work benefit from Greenhouse's notetaker."
    },
    {
      "title": "Nurture and email campaigns",
      "toolA": "Greenhouse's documented Sourcing and CRM feature covers pipeline building and nurturing but does not call out a dedicated email campaign tool.",
      "toolB": "Lever documents a specific Nurture and Email Campaigns feature for sending segmented, automated outreach to keep candidate pools warm.",
      "whyItMatters": "Purpose-built nurture campaigns make it easier to systematically re-engage past applicants instead of manually reaching out ad hoc.",
      "benefitsWho": "Recruiting teams that recruit continuously from a standing talent pool benefit more from Lever's documented nurture tooling."
    },
    {
      "title": "Candidate-facing portal",
      "toolA": "Greenhouse documents a candidate portal called MyGreenhouse offering real-time application status updates and job alerts.",
      "toolB": "Lever's provided facts do not document an equivalent candidate-facing status portal.",
      "whyItMatters": "A self-serve status portal can reduce candidate anxiety and inbound status-check emails to recruiters.",
      "benefitsWho": "Employers hiring at high volume, where candidate experience and status transparency matter, benefit from Greenhouse's documented portal."
    },
    {
      "title": "Onboarding workflows",
      "toolA": "Greenhouse documents onboarding tools that carry new-hire information from the offer stage into onboarding and connected HR systems.",
      "toolB": "Lever's provided facts do not document a dedicated onboarding workflow feature.",
      "whyItMatters": "Built-in offer-to-onboarding handoff reduces manual data re-entry and gaps between recruiting and HR systems.",
      "benefitsWho": "Organizations that want the ATS itself to bridge into onboarding benefit from Greenhouse's documented onboarding tools."
    },
    {
      "title": "Career site and job posting tools",
      "toolA": "Greenhouse's provided feature list does not explicitly document career site or job posting syndication tools.",
      "toolB": "Lever documents Career Sites and Job Postings as a named feature for publishing and syndicating openings to a branded careers page and job boards.",
      "whyItMatters": "A named career site and syndication feature signals a more turnkey path to publishing openings without separate tooling.",
      "benefitsWho": "Teams wanting an all-in-one careers page and distribution tool benefit from Lever's documented feature."
    },
    {
      "title": "Corporate ownership",
      "toolA": "The provided facts do not document Greenhouse's ownership or parent company.",
      "toolB": "Lever is documented as having been acquired by Employ Inc in 2022, operating alongside JazzHR and Jobvite in that company's portfolio.",
      "whyItMatters": "Ownership structure can affect long-term product roadmap, support, and how a vendor is positioned relative to sibling products.",
      "benefitsWho": "Buyers doing vendor-risk or roadmap diligence may weight this differently depending on how they view portfolio-owned products versus standalone vendors."
    },
    {
      "title": "Enterprise security and governance naming",
      "toolA": "Greenhouse documents SSO, audit logs, and configurable data governance controls available on higher-tier plans.",
      "toolB": "Lever's Enterprise tier documents custom permissions and enterprise-grade security controls without separately naming SSO or audit logs.",
      "whyItMatters": "Enterprise buyers with strict compliance requirements often need specific, named controls like SSO and audit logging rather than general security language.",
      "benefitsWho": "Enterprises with formal compliance checklists benefit from Greenhouse's more explicitly itemized governance features."
    },
    {
      "title": "Pricing tier structure",
      "toolA": "Greenhouse offers three named tiers, Core, Plus, and Pro, each with custom pricing and escalating feature sets.",
      "toolB": "Lever offers three named tiers, Core ATS, LeverTRM, and Enterprise, each with custom or contact-for-pricing terms and escalating feature sets.",
      "whyItMatters": "Understanding how each vendor gates features across tiers helps buyers estimate which plan level they will actually need to quote.",
      "benefitsWho": "Buyers comparing total cost of ownership benefit from mapping their required features against each vendor's specific tier breakdown before a sales call."
    }
  ],
  "featureMatrix": [
    {
      "group": "Applicant tracking and pipeline management",
      "rows": [
        {
          "feature": "Requisition and pipeline management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Customizable pipeline stages",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented for Lever; implied by Greenhouse's structured hiring workflow"
        },
        {
          "feature": "Structured interview kits and scorecards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Sourcing and CRM",
      "rows": [
        {
          "feature": "Built-in CRM for talent pools",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Nurture and automated email campaigns",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Not called out in Greenhouse's documented feature list"
        },
        {
          "feature": "Sourcing automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenhouse: Plus tier and above"
        }
      ]
    },
    {
      "group": "AI features",
      "rows": [
        {
          "feature": "AI interview notetaker",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI-assisted candidate matching",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenhouse: Real Talent matching; Lever: AI-assisted sourcing"
        },
        {
          "feature": "Identity verification and fraud detection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: Plus tier and above"
        }
      ]
    },
    {
      "group": "Candidate experience",
      "rows": [
        {
          "feature": "Candidate-facing status portal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: MyGreenhouse portal"
        },
        {
          "feature": "Branded career site and job posting syndication",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and analytics",
      "rows": [
        {
          "feature": "Pipeline and funnel dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Diversity metrics reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-powered report filters",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: Plus tier and above"
        }
      ]
    },
    {
      "group": "Integrations and platform",
      "rows": [
        {
          "feature": "HRIS and background check integrations",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Open API access",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Business intelligence connector",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: Plus tier and above"
        }
      ]
    },
    {
      "group": "Onboarding",
      "rows": [
        {
          "feature": "Offer-to-onboarding workflow",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "HRIS handoff for new hires",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Lever integrates with HRIS tools generally, but a dedicated onboarding handoff workflow is not documented"
        }
      ]
    },
    {
      "group": "Security and governance",
      "rows": [
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: Core tier and above"
        },
        {
          "feature": "Audit logs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenhouse: Pro tier"
        },
        {
          "feature": "Custom permissions",
          "toolA": "limited",
          "toolB": "available",
          "note": "Greenhouse documents broader configurable data governance rather than named custom permissions; Lever names custom permissions explicitly on its Enterprise tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Greenhouse or Lever?",
      "answer": "Neither publishes pricing; both are sold as custom, quote-based enterprise contracts, so actual cost depends on company size and negotiated plan tier rather than a public price list."
    },
    {
      "question": "Does Greenhouse or Lever offer a free trial or free plan?",
      "answer": "Neither tool offers a permanent free tier, and neither widely advertises a self-serve free trial; both require a sales demo before pricing is disclosed."
    },
    {
      "question": "Can Lever do what Greenhouse's Real Talent fraud detection does?",
      "answer": "Not based on documented features; Lever's provided facts describe AI-assisted sourcing and matching but do not document dedicated identity verification or fraud-detection capabilities like Greenhouse's Real Talent feature."
    },
    {
      "question": "Does Greenhouse have a built-in CRM like Lever's LeverTRM?",
      "answer": "Yes, Greenhouse includes Sourcing and CRM tools for building and nurturing candidate pipelines, though Lever's LeverTRM branding places more explicit emphasis on nurture and email campaign tools for re-engaging past candidates."
    },
    {
      "question": "Who owns Lever?",
      "answer": "Lever was acquired by Employ Inc in 2022 and operates alongside JazzHR and Jobvite in that company's portfolio, while Greenhouse's ownership is not addressed in the documented facts."
    },
    {
      "question": "Is Greenhouse or Lever better for a small hiring team?",
      "answer": "Neither is designed primarily for very small or infrequent hiring; both are positioned for mid-market and enterprise organizations and each vendor's own materials describe setup and configuration as more platform than a low-volume team may need."
    }
  ]
};

export default greenhouseVsLeverContent;
