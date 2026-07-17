import type { ToolComparisonContent } from './types';

const doverVsRecruiterflowContent: ToolComparisonContent = {
  "verdict": "Dover pairs a genuinely free ATS — unlimited users and jobs, posting to 100+ job boards — with a marketplace of vetted fractional recruiters priced with transparent cost-per-hire, aimed at startups from seed through Series C+ that want to hire without a full-time in-house recruiter. Recruiterflow is a paid ATS-and-CRM combo starting at $149/user/month, purpose-built for executive search firms, recruiting agencies, and staffing companies (2,100+ reported users), with SOC 2 and ISO 27001 certification and an AIRA suite of AI agents available as a custom-priced add-on. These serve different buyers: Dover is for companies hiring for themselves, while Recruiterflow is for agencies and search firms recruiting on behalf of clients.",
  "bestForToolA": "Dover fits startups that want a free core ATS with unlimited users and jobs, plus optional access to vetted fractional recruiters through its marketplace with transparent cost-per-hire pricing.",
  "bestForToolB": "Recruiterflow fits executive search firms, recruiting agencies, and staffing companies that need combined ATS-and-CRM functionality, multichannel outreach sequences, and AIRA AI agents like Notetaker and Job Change Alerts, and value SOC 2/ISO 27001 certification.",
  "whoNeedsBoth": "A staffing agency that also runs its own internal hiring could use Dover's free ATS to hire its own employees while using Recruiterflow's ATS-and-CRM to manage client search engagements and candidate placements — the two tools serve the agency's internal hiring and client-facing recruiting business separately.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Dover's core ATS is free ($0/month) with unlimited users and jobs; its Premium ATS tier is a flat $199/month regardless of team size.",
      "toolB": "Recruiterflow starts at $149/user/month for its Platform plan, with no free tier documented; its AIRA AI-agent plan uses custom pricing.",
      "whyItMatters": "Per-user versus flat/free pricing changes total cost dramatically as a team scales headcount.",
      "benefitsWho": "Small startup hiring teams that want to avoid per-seat costs benefit from Dover; larger agencies with dedicated recruiters may find per-user pricing more predictable."
    },
    {
      "title": "Target Customer",
      "toolA": "Dover is built for startups from seed through Series C+ that want to hire without bringing on a full-time in-house recruiter.",
      "toolB": "Recruiterflow is built for executive search firms, recruiting agencies, and staffing companies, reporting 2,100+ search firms as users globally.",
      "whyItMatters": "The two tools are designed around fundamentally different business models — direct employer hiring versus third-party recruiting services.",
      "benefitsWho": "In-house talent teams need Dover's model; recruiting agencies serving multiple clients need Recruiterflow's model."
    },
    {
      "title": "Recruiter Marketplace vs Agency CRM",
      "toolA": "Dover includes a marketplace matching startups with vetted fractional recruiters, showing transparent, upfront cost-per-hire pricing and an agency portal for pipeline visibility.",
      "toolB": "Recruiterflow does not document an external recruiter marketplace; instead it provides CRM functionality for the agency itself to manage its own leads and client relationships.",
      "whyItMatters": "Companies without recruiting staff need access to outside recruiters, while agencies need CRM tools to manage their own client pipeline.",
      "benefitsWho": "Startups without any recruiting function benefit from Dover's marketplace; agencies managing multiple clients benefit from Recruiterflow's built-in CRM."
    },
    {
      "title": "AI Feature Depth",
      "toolA": "Dover's AI capabilities are AI applicant scoring and AI-generated job content/careers pages, included in the $199/month Premium ATS tier.",
      "toolB": "Recruiterflow's AIRA suite includes AIRA Notetaker (call summarization), AIRA Search (natural language search), Job Change Alerts, Matchmaker, Field Updates, Submission, and Task agents, offered as a separate custom-priced AIRA plan.",
      "whyItMatters": "The breadth of named AI agents indicates how much of the sourcing-to-placement workflow can be automated.",
      "benefitsWho": "High-volume recruiting agencies that want multiple specialized AI agents benefit from Recruiterflow's AIRA suite."
    },
    {
      "title": "Certifications & Trust Signals",
      "toolA": "Dover documents customer count (2,000+ companies including Descript and Benchling) as its primary trust signal, without published security certifications.",
      "toolB": "Recruiterflow documents SOC 2 and ISO 27001 certification, GDPR compliance, and 4.8/5 ratings on both G2 and Capterra.",
      "whyItMatters": "Agencies handling sensitive candidate and client data for multiple companies may require documented compliance certifications during procurement.",
      "benefitsWho": "Enterprise-facing recruiting agencies whose clients require SOC 2 or ISO 27001 evidence."
    }
  ],
  "featureMatrix": [
    {
      "group": "ATS & Pipeline",
      "rows": [
        {
          "feature": "Free ATS tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dover: $0, unlimited users/jobs; Recruiterflow starts at $149/user/month"
        },
        {
          "feature": "Job board posting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dover posts to 100+ job boards"
        },
        {
          "feature": "Combined CRM functionality",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recruiterflow's ATS and CRM"
        },
        {
          "feature": "Multichannel outreach sequences (email/LinkedIn/phone)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI applicant scoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dover Premium, $199/month"
        },
        {
          "feature": "AI notetaking",
          "toolA": "available",
          "toolB": "available",
          "note": "Dover Premium; Recruiterflow's AIRA Notetaker (custom AIRA plan)"
        },
        {
          "feature": "Natural language candidate search",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AIRA Search"
        },
        {
          "feature": "Job change/re-engagement alerts",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access & Trust",
      "rows": [
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recruiterflow Platform plan"
        },
        {
          "feature": "Security certifications (SOC 2, ISO 27001)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "External recruiter marketplace",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published third-party review ratings",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "4.8/5 on G2 and Capterra"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dover's ATS really free?",
      "answer": "Yes, Dover offers a free ATS tier with unlimited users and jobs, posting to 100+ job boards, and Gmail/Outlook integration."
    },
    {
      "question": "How much does Recruiterflow cost?",
      "answer": "Recruiterflow's Platform plan is $149 per user per month, billed monthly or annually. The AIRA plan, which adds AI agents, uses custom pricing."
    },
    {
      "question": "Which tool is better for executive search firms?",
      "answer": "Recruiterflow is purpose-built for executive search firms, recruiting agencies, and staffing companies, reporting 2,100+ search firms as users. Dover is built for startups hiring for themselves rather than agencies placing candidates with clients."
    },
    {
      "question": "Which has better AI notetaking?",
      "answer": "Both include AI notetaking: Dover's is part of its $199/month Premium ATS tier, while Recruiterflow's AIRA Notetaker is part of its separately, custom-priced AIRA plan alongside several other AI agents."
    },
    {
      "question": "Does either tool offer an open API?",
      "answer": "Recruiterflow's Platform plan includes API access. Dover does not document API access in its published feature list."
    },
    {
      "question": "Does either platform hold security certifications?",
      "answer": "Recruiterflow documents SOC 2 and ISO 27001 certification plus GDPR compliance. Dover does not publish comparable certifications."
    }
  ]
};

export default doverVsRecruiterflowContent;
