import type { ToolComparisonContent } from './types';

const attioVsFolkContent: ToolComparisonContent = {
  "verdict": "Attio and folk are both AI-native CRMs aimed at revenue teams, but they part ways on how contacts enter the system and how much you can use for free. Attio leads with a built-in AI search assistant (Ask Attio), Call Intelligence, and a free plan capped at 3 seats; folk leads with LinkedIn-native contact capture through the folkX extension and four dedicated AI assistants, but has no permanent free plan, only a 14-day trial.",
  "bestForToolA": "Teams that want to start free and grow into paid tiers, or that rely on integrations with Claude, Slack, Notion, Linear, and Stripe via API, SDK, and MCP, and want native call recording and analysis (Call Intelligence) once on the Pro plan.",
  "bestForToolB": "Teams whose pipeline is built primarily from LinkedIn relationships and need the folkX browser extension to capture and enrich contacts from LinkedIn and 7+ other platforms, plus dedicated AI assistants for follow-up, recap, and research work.",
  "whoNeedsBoth": "Organizations that source leads across LinkedIn networking and other channels at once may run a small account-management team on Attio's free plan while a BD or sales team uses folk's LinkedIn capture workflow.",
  "keyDifferences": [
    {
      "title": "Free plan availability",
      "toolA": "Offers a free plan for up to 3 seats with real-time contact syncing and automatic data enrichment.",
      "toolB": "Has no permanent free plan — only a 14-day free trial before a paid plan is required.",
      "whyItMatters": "Teams that want to trial a CRM indefinitely at zero cost, or run a very small team long-term without paying, can do so on Attio but not on folk.",
      "benefitsWho": "Small teams and solo founders testing a CRM before committing budget."
    },
    {
      "title": "Lead capture method",
      "toolA": "Logs emails, calls, and activity automatically from integrated tools (Universal Context), with no dedicated LinkedIn capture extension documented.",
      "toolB": "Uses the folkX browser extension to capture contacts directly from LinkedIn and 7+ other platforms, with waterfall enrichment to fill in missing details.",
      "whyItMatters": "Sales and BD teams whose primary sourcing channel is LinkedIn get a purpose-built capture workflow with folk rather than relying on general activity logging.",
      "benefitsWho": "Recruiters, BD reps, and sales reps who prospect primarily on LinkedIn."
    },
    {
      "title": "AI feature set",
      "toolA": "Provides Ask Attio for AI-powered search and record creation, plus Workflows, Sequences, and Call Intelligence (meeting recording/analysis) on paid tiers.",
      "toolB": "Provides four named AI assistants — Follow-up, Recap, Research, and Workflow — that automate outreach, note-taking, and research tasks.",
      "whyItMatters": "Attio's AI centers on search and call analysis; folk's centers on assistant-style task automation across the outreach cycle. Teams should match the AI style to their workflow.",
      "benefitsWho": "Revenue teams comparing search/call-intelligence AI against assistant-driven outreach AI."
    },
    {
      "title": "API and integration access",
      "toolA": "Lists API access and documents integrations with Claude, Slack, Notion, Linear, and Stripe via API, SDK, and MCP.",
      "toolB": "Documents 5,000+ integrations on the Standard plan, but REST API access itself is gated to the Premium tier and above.",
      "whyItMatters": "Teams needing programmatic access on an entry-level plan should check whether that access is included or requires an upgrade.",
      "benefitsWho": "Technical teams building custom integrations on top of the CRM."
    },
    {
      "title": "Security certification disclosure",
      "toolA": "No SOC 2 or compliance certification is documented in the available facts.",
      "toolB": "States it is SOC 2 Type I certified and GDPR compliant.",
      "whyItMatters": "Buyers with formal vendor security review requirements may weight explicit compliance certification in the purchase decision.",
      "benefitsWho": "Regulated or enterprise buyers with a security/compliance checklist."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "AI-powered search or assistants",
          "toolA": "available",
          "toolB": "available",
          "note": "Attio: Ask Attio search. Folk: Follow-up, Recap, Research, Workflow assistants."
        },
        {
          "feature": "Call Intelligence (meeting recording/analysis)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Attio Pro plan and above."
        },
        {
          "feature": "LinkedIn-native contact capture",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "folkX browser extension."
        },
        {
          "feature": "Workflow automation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free (non-trial) plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Attio free plan capped at 3 seats."
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Attio Plus €36/user/mo (€29 annual); folk Standard $30/member/mo ($24 annual)."
        },
        {
          "feature": "REST API access",
          "toolA": "available",
          "toolB": "limited",
          "note": "Folk's REST API requires the Premium plan or above."
        },
        {
          "feature": "Enterprise custom pricing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SOC 2 / GDPR compliance stated",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free trial length",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Folk offers a 14-day free trial; Attio's trial length is not documented (it has a permanent free plan instead)."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Attio have a free plan?",
      "answer": "Yes, Attio is free for up to 3 seats with real-time contact syncing and automatic data enrichment."
    },
    {
      "question": "Does folk have a free plan?",
      "answer": "No, folk has no permanent free plan — only a 14-day free trial before a paid plan is required."
    },
    {
      "question": "What AI features does Attio offer?",
      "answer": "Ask Attio for AI-powered search and record creation, plus AI-driven lead research and account monitoring."
    },
    {
      "question": "What AI features does folk include?",
      "answer": "Four assistants: Follow-up, Recap, Research, and Workflow, which automate outreach, note-taking, and research tasks."
    },
    {
      "question": "How much do Attio and folk cost to start?",
      "answer": "Attio's Plus plan starts at €36/user/month (€29 billed annually); folk's Standard plan starts at $30/member/month ($24 billed annually)."
    },
    {
      "question": "Does folk integrate with LinkedIn?",
      "answer": "Yes, via the folkX browser extension, which connects the CRM to LinkedIn and 7+ other platforms for contact capture."
    }
  ]
};

export default attioVsFolkContent;
