import type { GroupComparisonContent } from './types';

const breezyHrVsRecruitCrmVsWorkableContent: GroupComparisonContent = {
  "verdict": "Breezy HR is the most accessible option for small and mid-sized companies hiring internally, with a genuinely usable free plan and built-in video interviewing. Recruit CRM is purpose-built for recruitment and staffing agencies that need to manage both candidate pipelines and client business deals side by side, a workflow the other two do not replicate. Workable sits at the higher end of the price range but pairs its ATS with onboarding, time-off and payroll-prep tools for companies that want hiring and light HR in one subscription.",
  "bestFor": {
    "breezy-hr": "Small and mid-sized companies that want an affordable ATS with a real free tier, drag-and-drop pipelines and built-in video interviewing without extra tools.",
    "recruit-crm": "Recruitment and staffing agencies that need to track both candidate pipelines and client deals, with AI resume parsing and GPT-assisted outreach, in one purpose-built platform.",
    "workable": "Growing companies that want a full applicant tracking system combined with onboarding, time-off and payroll-prep features in a single subscription, and are willing to pay a premium for it."
  },
  "highlights": [
    {
      "title": "Breezy HR's free tier is genuinely usable",
      "description": "The Bootstrap plan is free indefinitely for a single open position, with unlimited users and candidates, a branded career site and distribution to more than 50 job boards, not just a time-limited trial.",
      "toolSlugs": [
        "breezy-hr"
      ]
    },
    {
      "title": "Recruit CRM is built for agencies, not internal hiring teams",
      "description": "Its deal pipelines track client business alongside candidate hiring stages, and features like an executive search report generator and bulk texting are aimed squarely at staffing and search firms rather than companies filling their own roles.",
      "toolSlugs": [
        "recruit-crm"
      ]
    },
    {
      "title": "Workable pairs recruiting with light HR",
      "description": "Beyond its ATS and AI Recruiting Agent for auto-sourcing and pre-screening, Workable includes an HR information system covering onboarding, time-off management, time tracking and payroll preparation, features the other two do not offer at this depth.",
      "toolSlugs": [
        "workable"
      ]
    },
    {
      "title": "AI is present across all three, at different depths",
      "description": "Breezy Intelligence is a paid add-on for candidate evaluation, Recruit CRM bundles an AI resume parser and GPT integration into every paid plan, and Workable includes an AI Recruiting Agent plus free AI credits on every tier.",
      "toolSlugs": [
        "breezy-hr",
        "recruit-crm",
        "workable"
      ]
    },
    {
      "title": "Entry pricing spans a wide range",
      "description": "Breezy HR's cheapest paid plan starts at $157 a month, Recruit CRM's Pro plan is priced per user at $85 a month billed annually, and Workable's Standard plan starts at $299 a month, a gap buyers should factor in alongside feature depth.",
      "toolSlugs": [
        "breezy-hr",
        "recruit-crm",
        "workable"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Hiring Features",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "breezy-hr": "available",
            "recruit-crm": "unavailable",
            "workable": "unavailable"
          },
          "note": "Recruit CRM and Workable offer free trials rather than a permanent free plan; Breezy HR's Bootstrap plan is free indefinitely for one open position."
        },
        {
          "feature": "Built-in video interviewing",
          "statuses": {
            "breezy-hr": "available",
            "recruit-crm": "not-documented",
            "workable": "limited"
          },
          "note": "Workable offers video interviews as an optional paid add-on rather than an included feature on its Standard plan."
        },
        {
          "feature": "Multi-job-board distribution",
          "statuses": {
            "breezy-hr": "available",
            "recruit-crm": "not-documented",
            "workable": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted resume or candidate evaluation",
          "statuses": {
            "breezy-hr": "limited",
            "recruit-crm": "available",
            "workable": "available"
          },
          "note": "Breezy Intelligence is a separate paid add-on rather than included by default."
        }
      ]
    },
    {
      "group": "Agency and Enterprise Tools",
      "rows": [
        {
          "feature": "Client or deal pipeline for agency business",
          "statuses": {
            "breezy-hr": "unavailable",
            "recruit-crm": "available",
            "workable": "unavailable"
          }
        },
        {
          "feature": "HR information system (onboarding, time off, payroll prep)",
          "statuses": {
            "breezy-hr": "limited",
            "recruit-crm": "unavailable",
            "workable": "available"
          },
          "note": "Breezy HR connects to HRIS systems on its Business tier and above rather than including a native HR information system."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does any of these applicant tracking systems have a free plan?",
      "answer": "Yes, Breezy HR's Bootstrap plan is free indefinitely, though it is limited to a single open position or candidate pool. Recruit CRM and Workable both offer free trials instead of a permanent free tier."
    },
    {
      "question": "What makes Recruit CRM different from Breezy HR and Workable?",
      "answer": "Recruit CRM is purpose-built for recruitment and staffing agencies, combining candidate hiring pipelines with client deal pipelines, executive search reporting and bulk texting, workflows aimed at agencies placing candidates for external clients rather than companies hiring for their own roles."
    },
    {
      "question": "Which tool includes video interviewing without a paid add-on?",
      "answer": "Breezy HR includes built-in live video interviewing and candidate self-scheduling on its plans. Workable offers video interviews as an optional add-on, and Recruit CRM does not document a built-in video interviewing feature."
    },
    {
      "question": "Do these tools offer HR or onboarding features beyond hiring?",
      "answer": "Workable includes the most built-in HR functionality, with onboarding, time-off management, time tracking and payroll preparation. Breezy HR connects to external HRIS systems on its Business tier and above, and Recruit CRM does not offer onboarding or payroll features, since it is focused on the recruiting and placement workflow."
    },
    {
      "question": "Which of the three is the most affordable to start with?",
      "answer": "Breezy HR is the cheapest overall thanks to its free Bootstrap plan and $157-a-month Startup tier. Recruit CRM's Pro plan runs $85 per user a month billed annually, and Workable's Standard plan starts at $299 a month, making it the most expensive entry point of the three."
    },
    {
      "question": "Are these tools meant for internal recruiting teams or staffing agencies?",
      "answer": "Breezy HR and Workable are built for companies hiring for their own open roles. Recruit CRM is built specifically for recruitment and staffing agencies managing candidates and client relationships on behalf of other companies, so the right choice depends on which side of the hiring relationship you are on."
    }
  ]
};

export default breezyHrVsRecruitCrmVsWorkableContent;
