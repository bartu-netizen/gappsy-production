import type { ToolComparisonContent } from './types';

const juiceboxVsOpencatsContent: ToolComparisonContent = {
  "verdict": "Juicebox is an AI-powered sourcing tool that lets recruiters search 800M+ candidate profiles with natural language and run automated outreach agents; OpenCATS is a free, self-hosted applicant tracking system for managing job requisitions, submissions, and candidate records once they're in your pipeline. They solve different parts of recruiting: finding candidates versus tracking them through a hiring process.",
  "bestForToolA": "Recruiters and talent teams who need to search a large external candidate database with natural-language queries and automate outreach sequences, starting at $99/month for the Starter plan with unlimited searches.",
  "bestForToolB": "Staffing agencies or internal recruiting teams that want a completely free, self-hosted applicant tracking system and are comfortable managing their own server infrastructure.",
  "whoNeedsBoth": "A staffing agency could use Juicebox's PeopleGPT search and AI agents to source and reach out to candidates from its 800M+ profile database, then log qualified candidates into a self-hosted OpenCATS instance to track job requisitions and submissions through the hiring pipeline, since Juicebox is sourcing-focused and OpenCATS is pipeline-tracking focused with no documented native integration between them.",
  "keyDifferences": [
    {
      "title": "Deployment and Cost Model",
      "toolA": "Juicebox is a hosted SaaS with a Free tier (limited searches), Starter at $99/month, Growth at $179/month, and custom Business pricing.",
      "toolB": "OpenCATS is completely free and open source, self-hosted on infrastructure you control, with no listed subscription tiers.",
      "whyItMatters": "Total cost of ownership differs sharply between a per-seat SaaS subscription and a self-hosted tool with only infrastructure costs.",
      "benefitsWho": "Budget-conscious agencies or organizations with in-house IT capacity that prefer OpenCATS's zero licensing cost."
    },
    {
      "title": "Sourcing vs. Pipeline Tracking",
      "toolA": "Juicebox is built around finding new candidates: PeopleGPT search across 800M+ profiles from 30+ sources, plus AI agents that run outreach continuously.",
      "toolB": "OpenCATS tracks candidates already in the system: job requisitions, submissions, company/contact records, and candidate status history.",
      "whyItMatters": "A recruiting stack often needs both a sourcing tool and a tracking system, since they serve different stages of the hiring funnel.",
      "benefitsWho": "Recruiters need Juicebox to find people; hiring teams need OpenCATS-style tools to manage the process afterward."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Juicebox is AI-native, with PeopleGPT natural-language search and autonomous AI Agents (a separate $199/agent/month add-on) that learn from hiring patterns and run outreach around the clock.",
      "toolB": "OpenCATS documents no AI features on its official site.",
      "whyItMatters": "AI-driven sourcing can significantly cut the manual search time recruiters spend building candidate lists.",
      "benefitsWho": "High-volume recruiters and sourcing teams that want to automate candidate discovery."
    },
    {
      "title": "Integrations",
      "toolA": "Juicebox integrates with 41 ATS platforms and 21 CRMs, including Lever, Greenhouse, Ashby, Workday, and Bullhorn.",
      "toolB": "OpenCATS has no published integrations list on its official site.",
      "whyItMatters": "Wide ATS/CRM coverage lets sourced candidates flow directly into whatever system a team already uses.",
      "benefitsWho": "Teams that already run an ATS and want Juicebox to plug into their existing hiring workflow."
    },
    {
      "title": "Data Control and Source Code Access",
      "toolA": "Juicebox is a closed, hosted SaaS platform with credit-based usage caps (contact and export credits per plan).",
      "toolB": "OpenCATS is self-hosted and open source, so data stays under the organization's control and the source code can be inspected.",
      "whyItMatters": "Organizations with strict data residency or code-transparency requirements may need self-hosted control over their ATS.",
      "benefitsWho": "Organizations with data sovereignty requirements or engineering teams that want to customize the ATS code directly."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing & Search",
      "rows": [
        {
          "feature": "Candidate database search",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Juicebox: 800M+ profiles, natural language"
        },
        {
          "feature": "AI-driven candidate agents",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Juicebox Agents: $199/agent/month add-on"
        },
        {
          "feature": "Automated outreach sequences",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Browser extension for sourcing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Applicant Tracking",
      "rows": [
        {
          "feature": "Candidate record management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Job requisition tracking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Submission management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Company/contact management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Juicebox: limited free searches; OpenCATS: fully free"
        },
        {
          "feature": "Self-hosting option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "ATS/CRM integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Juicebox: 41 ATS, 21 CRMs"
        },
        {
          "feature": "Open-source code access",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Juicebox replace an ATS like OpenCATS?",
      "answer": "Not based on the documented features. Juicebox is focused on candidate sourcing and outreach (PeopleGPT search, AI agents), while OpenCATS handles job requisition tracking, submissions, and candidate pipeline records, which Juicebox's facts don't document."
    },
    {
      "question": "Is OpenCATS really free?",
      "answer": "Yes, OpenCATS is free and open source; you self-host it on your own infrastructure rather than paying a subscription."
    },
    {
      "question": "Does OpenCATS have AI-powered candidate sourcing?",
      "answer": "No, OpenCATS's official site documents no AI features, unlike Juicebox's PeopleGPT search and AI Agents."
    },
    {
      "question": "How much does Juicebox cost?",
      "answer": "Juicebox has a Free tier with limited searches, a Starter plan at $99/month (1 seat, unlimited searches, 500 contact/export credits), a Growth plan at $179/month (up to 5 seats), and custom Business pricing."
    },
    {
      "question": "Does OpenCATS integrate with sourcing tools like Juicebox?",
      "answer": "OpenCATS's official site doesn't publish an integrations list, so a Juicebox-to-OpenCATS integration isn't documented; candidates would need to be transferred manually."
    },
    {
      "question": "Which tool requires technical setup?",
      "answer": "OpenCATS requires self-hosting and technical setup since there's no managed SaaS option; Juicebox is a hosted SaaS product that doesn't require infrastructure management."
    }
  ]
};

export default juiceboxVsOpencatsContent;
