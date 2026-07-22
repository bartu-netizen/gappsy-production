import type { ToolComparisonContent } from './types';

const usertestingVsUserzoomContent: ToolComparisonContent = {
  "verdict": "UserTesting and UserZoom both trace back to the same 2007 founding era and merged under common ownership in 2023, yet they still serve slightly different research habits. UserTesting centers on video-based usability testing narrated live by participants, paired with a large screened panel, moderated live conversations, and an AI-powered Insights Hub for centralizing findings across teams. UserZoom packages a wider single-platform method set, including card sorting, tree testing, click testing, surveys, and usability benchmarking, plus a documented 200-plus filter participant panel and named SOC 2 Type II, GDPR, and HIPAA compliance credentials. Neither publishes self-serve pricing, and neither offers a genuine self-serve free trial, so budget comparisons ultimately require a sales conversation with both. Teams that need rich qualitative video narratives and a hub for sharing clips across product, design, and marketing functions lean toward UserTesting. Teams running a broader mix of quantitative and structural studies, especially with regulated-industry compliance requirements, lean toward UserZoom. Because the two are now part of the same corporate family and increasingly cross-sell, the choice is less about picking a permanent winner and more about which method set and entry tier fits a given team's research maturity and volume right now.",
  "bestForToolA": "UserTesting fits enterprise research teams that prioritize narrated video usability sessions, moderated live interviews, and a centralized Insights Hub for sharing findings across product, design, and marketing.",
  "bestForToolB": "UserZoom fits teams that want a single platform covering usability testing, card sorting, tree testing, click testing, surveys, and benchmarking, particularly in regulated industries needing documented SOC 2 Type II, GDPR, and HIPAA support.",
  "whoNeedsBoth": "Large research operations teams that already sit inside the combined UserTesting and UserZoom by UserTesting portfolio may use UserTesting for video-based qualitative studies and UserZoom for structural and quantitative studies like tree testing and benchmarking dashboards.",
  "keyDifferences": [
    {
      "title": "Breadth of research methods in one platform",
      "toolA": "UserTesting documents usability testing, moderated conversations, card sorting and tree testing, and prototype and app testing",
      "toolB": "UserZoom documents usability testing, card sorting, tree testing, click testing, surveys, and usability benchmarking as distinct named features",
      "whyItMatters": "Teams that need click testing, formal surveys, or longitudinal benchmarking dashboards may need fewer additional tools with the broader documented method set",
      "benefitsWho": "Dedicated UX research and research operations teams running many study types benefit from the wider documented method coverage"
    },
    {
      "title": "Entry tier for small teams",
      "toolA": "UserTesting's cons explicitly state it is not well suited to teams that only need occasional or very low-volume feedback",
      "toolB": "UserZoom GO is explicitly positioned as usability testing for individuals and small teams",
      "whyItMatters": "A named entry-level plan signals which vendor is more likely to accommodate smaller research volumes without a large annual commitment",
      "benefitsWho": "Individual researchers or small product teams benefit from an explicitly named small-team tier like UserZoom GO"
    },
    {
      "title": "Named security and compliance certifications",
      "toolA": "UserTesting's Advanced plan lists enterprise security compliance without naming specific certifications in the provided facts",
      "toolB": "UserZoom explicitly documents SOC 2 Type II certification along with GDPR and HIPAA compliance support",
      "whyItMatters": "Procurement teams in regulated industries often require named certifications, not just general compliance language, to pass security review",
      "benefitsWho": "Buyers in healthcare, finance, or other regulated sectors benefit from UserZoom's explicitly named certifications"
    },
    {
      "title": "AI-labeled analysis features",
      "toolA": "UserTesting names AI-powered analysis and AI-generated test creation as explicit features",
      "toolB": "UserZoom documents automated transcripts, timestamped notes, charts, and highlight reels, without labeling this analysis as AI-driven in the provided facts",
      "whyItMatters": "Teams evaluating AI-assisted synthesis of large volumes of session data should confirm whether automation is explicitly AI-driven or rule-based",
      "benefitsWho": "Teams processing high volumes of qualitative video sessions benefit from UserTesting's explicitly named AI analysis capability"
    },
    {
      "title": "Participant panel filter transparency",
      "toolA": "UserTesting describes a large, screened, globally distributed panel with custom audiences and screening, without a specific filter count",
      "toolB": "UserZoom documents a global participant network with more than 200 demographic filters plus live-intercept recruiting for existing customers",
      "whyItMatters": "A disclosed filter count gives buyers a clearer sense of how precisely they can target niche or specialized participant segments",
      "benefitsWho": "Researchers recruiting narrowly defined demographic or professional segments benefit from UserZoom's disclosed 200-plus filter count"
    },
    {
      "title": "Integration focus",
      "toolA": "UserTesting integrates with tools such as Figma, Slack, and other product, design, and collaboration platforms",
      "toolB": "UserZoom integrates with tools such as Figma, Adobe Analytics, and Google Analytics",
      "whyItMatters": "The integration set signals which workflow each platform is built to sit inside, collaboration and communication versus analytics and reporting",
      "benefitsWho": "Design and product teams centered on Slack-based collaboration benefit from UserTesting's integration set, while teams pairing research with web analytics benefit from UserZoom's"
    },
    {
      "title": "Centralized insights repository",
      "toolA": "UserTesting offers an Insights Hub, a centralized repository for organizing, tagging, and sharing research findings and video clips across teams",
      "toolB": "UserZoom's documented reporting centers on automated transcripts and highlight reels rather than a named centralized repository",
      "whyItMatters": "A dedicated repository changes how easily findings get reused and shared across product, design, and marketing long after a study ends",
      "benefitsWho": "Organizations running many overlapping studies benefit from UserTesting's named Insights Hub for long-term knowledge management"
    },
    {
      "title": "Quantitative and attitudinal research support",
      "toolA": "UserTesting's documented features do not include a named survey or usability benchmarking capability",
      "toolB": "UserZoom explicitly documents surveys for attitudinal data and usability benchmarking to track standardized metrics over releases",
      "whyItMatters": "Teams that need to pair qualitative findings with quantitative attitudinal data or track usability scores over time need this capability in one place",
      "benefitsWho": "Research operations teams tracking usability metrics release over release benefit from UserZoom's documented benchmarking feature"
    },
    {
      "title": "Corporate relationship and brand structure",
      "toolA": "UserTesting is the parent brand following the 2023 merger and operates the combined company under its name",
      "toolB": "UserZoom is now marketed as a distinct product line, UserZoom by UserTesting, within that same combined portfolio",
      "whyItMatters": "Buyers should understand these are sibling products under one company, which affects long-term roadmap alignment, support, and potential future consolidation",
      "benefitsWho": "Buyers evaluating long-term vendor stability benefit from knowing both tools now share common ownership and support infrastructure"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Usability Testing",
      "rows": [
        {
          "feature": "Video-based usability testing with narration",
          "toolA": "available",
          "toolB": "available",
          "note": "UserZoom adds synced transcripts alongside video capture"
        },
        {
          "feature": "Moderated live sessions",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Unmoderated self-guided testing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Prototype and app testing",
          "toolA": "available",
          "toolB": "available",
          "note": "Both document websites, apps, and prototypes as testable"
        }
      ]
    },
    {
      "group": "Information Architecture and Structural Testing",
      "rows": [
        {
          "feature": "Card sorting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Tree testing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Click testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Not listed among UserTesting's documented features"
        }
      ]
    },
    {
      "group": "Quantitative and Attitudinal Research",
      "rows": [
        {
          "feature": "Surveys",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Usability benchmarking over time",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Participant Recruitment",
      "rows": [
        {
          "feature": "Built-in global participant panel",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Custom audience or screener targeting",
          "toolA": "available",
          "toolB": "available",
          "note": "UserZoom discloses 200-plus demographic filters; UserTesting does not disclose a filter count"
        },
        {
          "feature": "Live-intercept recruiting for existing customers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Analysis and Reporting",
      "rows": [
        {
          "feature": "AI-powered session analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "UserZoom documents automated transcripts and highlight reels but not explicitly as AI-driven"
        },
        {
          "feature": "Automated highlight reels or shareable clips",
          "toolA": "available",
          "toolB": "available",
          "note": "UserTesting supports this through the Insights Hub"
        },
        {
          "feature": "Centralized cross-team insights repository",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "UserTesting's Insights Hub is explicitly named for this purpose"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Figma integration",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Slack integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Web analytics platform integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserZoom documents Adobe Analytics and Google Analytics integrations"
        }
      ]
    },
    {
      "group": "Security and Compliance",
      "rows": [
        {
          "feature": "General enterprise security compliance",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SOC 2 Type II certification named",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "GDPR compliance support named",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "HIPAA compliance support named",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Access and Pricing",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both use a contact-for-pricing model"
        },
        {
          "feature": "Self-serve free trial",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "UserTesting trials are arranged through sales rather than self-serve; UserZoom documents no free trial or free plan"
        },
        {
          "feature": "Named entry tier for individuals or small teams",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "UserZoom GO is explicitly positioned for individuals and small teams"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, UserTesting or UserZoom?",
      "answer": "Neither publishes list pricing, so a direct cost comparison is not possible from public information; both use a contact-for-pricing, custom-quote model, though UserZoom does name an entry-level GO plan aimed at individuals and small teams while UserTesting's documented tiers start at Advanced without an explicit small-team framing."
    },
    {
      "question": "Is UserTesting or UserZoom better for a small team or first-time researcher?",
      "answer": "UserZoom is the better documented fit for small teams, since its GO plan is explicitly named for individuals and small teams, while UserTesting's own listed cons state it is not well suited to teams needing only occasional or low-volume feedback."
    },
    {
      "question": "Can UserZoom do card sorting and tree testing like UserTesting?",
      "answer": "Yes, both platforms explicitly document card sorting and tree testing as built-in research methods."
    },
    {
      "question": "Does UserTesting offer click testing or usability benchmarking like UserZoom?",
      "answer": "No, UserTesting's documented feature list does not include click testing or usability benchmarking, while UserZoom explicitly offers both as named features."
    },
    {
      "question": "Are UserTesting and UserZoom the same company now?",
      "answer": "Yes, UserZoom merged with UserTesting in 2023 under common ownership, and UserZoom is now marketed as UserZoom by UserTesting within the combined company's product portfolio."
    },
    {
      "question": "Which platform has stronger documented security certifications for regulated industries?",
      "answer": "UserZoom has the more specific documentation, explicitly naming SOC 2 Type II certification along with GDPR and HIPAA compliance support, while UserTesting's Advanced plan only references general enterprise security compliance without naming specific certifications."
    }
  ]
};

export default usertestingVsUserzoomContent;
