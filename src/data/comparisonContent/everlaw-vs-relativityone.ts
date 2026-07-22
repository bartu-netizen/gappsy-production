import type { ToolComparisonContent } from './types';

const everlawVsRelativityoneContent: ToolComparisonContent = {
  "verdict": "Everlaw is a cloud-native eDiscovery platform built around usage-based pricing tied to data volume with no per-user fees, giving legal teams unlimited seats plus trial-prep tools like Storybuilder and a Deep Dive AI analysis tool that has been used on datasets exceeding 10 million documents. RelativityOne is a broader legal data platform whose company states 25 years of operation, built around a five-product generative AI suite (Relativity aiR) covering review, privilege, case strategy, and data breach response, plus integrations with outside AI tools like Claude, ChatGPT, and Gemini, and is positioned for Fortune 500 companies and AmLaw 200 firms. Neither publishes pricing, so the practical difference comes down to AI suite depth and target scale rather than published cost.",
  "bestForToolA": "Everlaw fits legal teams that want usage-based pricing without per-user fees or upload limits, and need trial-narrative tools like Storybuilder alongside AI that has handled datasets over 10 million documents (Deep Dive).",
  "bestForToolB": "RelativityOne fits large enterprises, AmLaw 200 firms, and government agencies that want the five-product Relativity aiR generative AI suite (Assist, Review, Privilege, Case Strategy, Data Breach Response) plus the ability to plug in outside AI models like Claude, ChatGPT, or Gemini.",
  "whoNeedsBoth": "A large law firm handling both routine document review and specialized enterprise investigations might run Everlaw for cost-predictable case work while turning to RelativityOne's aiR for Data Breach Response and aiR for Privilege on higher-stakes engagements with Fortune 500 or AmLaw 200 clients.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Everlaw uses usage-based pricing tied to data volume, with no per-user fees and unlimited user licenses included, offered as case-based or annual subscriptions.",
      "toolB": "RelativityOne publishes no pricing model details in its public materials; visitors must contact sales or view a dedicated pricing page.",
      "whyItMatters": "Teams that fluctuate in headcount benefit from a model that doesn't charge per seat.",
      "benefitsWho": "Legal teams with variable staffing across cases, such as firms staffing up for large litigation."
    },
    {
      "title": "AI Suite Breadth",
      "toolA": "Everlaw includes Deep Dive (large-dataset analysis with citations), Coding Suggestions, Predictive Coding and Clustering, and a Writing Assistant included in subscriptions at no extra cost.",
      "toolB": "RelativityOne's Relativity aiR suite spans aiR Assist, aiR for Review, aiR for Privilege, aiR for Case Strategy, and aiR for Data Breach Response, plus integrations with Claude, ChatGPT, and Gemini.",
      "whyItMatters": "The number and specificity of named AI products indicates how much of the review and analysis workflow can be automated versus done manually.",
      "benefitsWho": "Litigation teams handling privilege review or data breach response, who benefit from RelativityOne's purpose-built AI modules."
    },
    {
      "title": "Trial Preparation Tools",
      "toolA": "Everlaw includes Storybuilder, a dedicated trial preparation tool for organizing evidence into a narrative, plus a Communication Visualizer for analyzing communication data.",
      "toolB": "RelativityOne does not document a dedicated trial-narrative or communication-analytics tool in its feature list, though aiR for Case Strategy supports strategy development.",
      "whyItMatters": "Teams preparing for trial presentation need tools purpose-built for organizing evidence into a courtroom-ready story.",
      "benefitsWho": "Litigators building trial narratives from large evidence sets."
    },
    {
      "title": "Target Customer Scale",
      "toolA": "Everlaw serves law firms, corporate legal departments, and government agencies for litigation, investigations, and FOIA requests.",
      "toolB": "RelativityOne is used by Fortune 500 companies, AmLaw 200 firms, and government agencies, and the vendor's own cons note it is geared toward large-scale and enterprise use cases rather than solo practitioners.",
      "whyItMatters": "Solo practitioners and mid-size firms may find RelativityOne oriented toward a larger scale than they need.",
      "benefitsWho": "Enterprise legal departments and AmLaw 200 firms handling large-scale, multi-jurisdiction matters."
    },
    {
      "title": "Company Track Record",
      "toolA": "Everlaw's founding year and headquarters are not documented in its public materials.",
      "toolB": "RelativityOne states the company has been operating for 25 years, and its headquarters is listed as 231 South LaSalle Street, Chicago, Illinois.",
      "whyItMatters": "Buyers evaluating vendor stability for long-term litigation support may weigh documented company history.",
      "benefitsWho": "Procurement and legal ops teams performing vendor due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "AI-Powered Review",
      "rows": [
        {
          "feature": "Large-dataset AI analysis with citations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Everlaw's Deep Dive has been used on 10M+ document datasets"
        },
        {
          "feature": "Predictive coding and clustering",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Privilege review AI",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RelativityOne's aiR for Privilege"
        },
        {
          "feature": "Data breach response AI workflow",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RelativityOne's aiR for Data Breach Response"
        },
        {
          "feature": "Third-party AI integrations (Claude, ChatGPT, Gemini)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Per-user fees",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Everlaw states no per-user fees, unlimited users included"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "not-documented"
        },
        {
          "feature": "Usage-based pricing tied to data volume",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Litigation & Trial Support",
      "rows": [
        {
          "feature": "Trial evidence/narrative organization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Everlaw's Storybuilder"
        },
        {
          "feature": "Communication data analytics",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Everlaw's Communication Visualizer"
        },
        {
          "feature": "Case strategy AI support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RelativityOne's aiR for Case Strategy"
        },
        {
          "feature": "Continuous security monitoring/threat detection",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is Everlaw priced compared to RelativityOne?",
      "answer": "Everlaw uses usage-based pricing tied to data volume with no per-user fees and unlimited users, offered as case-based or annual subscriptions. RelativityOne does not publish its pricing structure; both require contacting sales for a quote."
    },
    {
      "question": "Does either platform publish pricing online?",
      "answer": "No. Neither Everlaw nor RelativityOne lists public prices; both require scheduling a call or visiting a dedicated pricing page to get a quote."
    },
    {
      "question": "What AI review tools does each platform include?",
      "answer": "Everlaw includes Deep Dive, Coding Suggestions, Predictive Coding and Clustering, and a Writing Assistant. RelativityOne includes the five-part Relativity aiR suite (Assist, Review, Privilege, Case Strategy, Data Breach Response) plus integrations with Claude, ChatGPT, and Gemini."
    },
    {
      "question": "Which platform is better for trial preparation?",
      "answer": "Everlaw documents a dedicated trial-prep tool, Storybuilder, for organizing evidence into a narrative. RelativityOne does not document an equivalent trial-narrative tool, though its aiR for Case Strategy supports broader case planning."
    },
    {
      "question": "Does RelativityOne integrate with outside AI tools like ChatGPT?",
      "answer": "Yes, RelativityOne documents integrations with Claude, ChatGPT, and Gemini alongside its own Relativity aiR suite. Everlaw does not document third-party AI integrations."
    },
    {
      "question": "Who typically uses each platform?",
      "answer": "Everlaw is used by law firms, corporate legal departments, and government agencies. RelativityOne is used by AmLaw 200 firms, Fortune 500 corporations, cyber insurers, academic institutions, and government agencies, and its own materials note it targets larger-scale use cases."
    }
  ]
};

export default everlawVsRelativityoneContent;
