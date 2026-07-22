import type { ToolComparisonContent } from './types';

const limesurveyVsUserzoomContent: ToolComparisonContent = {
  "verdict": "LimeSurvey is a self-hostable-or-cloud survey and form-building tool with published pricing starting at €29/month (or free open-source self-hosting), while UserZoom is an enterprise UX research platform for usability testing, card sorting, and tree testing with no public pricing and a mandatory sales conversation. LimeSurvey covers structured survey data collection broadly; UserZoom is a specialized research-operations suite for teams running moderated and unmoderated usability studies at scale.",
  "bestForToolA": "Teams and organizations that need affordable, self-hostable or cloud survey creation with 30+ question types, 800+ templates, and support for 80+ languages, including academic and nonprofit users eligible for 30-50% cloud discounts.",
  "bestForToolB": "Dedicated UX research and research-operations teams at mid-size to large organizations that need usability testing, card sorting, tree testing, click testing, and a built-in participant panel with 200+ demographic filters, backed by SOC 2 Type II, GDPR, and HIPAA compliance.",
  "whoNeedsBoth": "A product organization might run broad customer satisfaction and NPS-style surveys in LimeSurvey while its dedicated UX research team uses UserZoom for moderated usability testing and card-sorting studies during a redesign, since the two tools serve different research depths.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes pricing directly - the Expert plan is €29/month or €348/year (3 admin users, 10,000 responses/year) - plus a free self-hosted Community Edition.",
      "toolB": "Both UserZoom GO and UserZoom Enterprise plans are listed as 'Contact for pricing' with no published rates or free trial.",
      "whyItMatters": "Buyers evaluating budget quickly can self-serve on LimeSurvey but must engage sales for UserZoom.",
      "benefitsWho": "Benefits budget-conscious teams and procurement processes that prefer transparent pricing."
    },
    {
      "title": "Research Method Depth",
      "toolA": "Focused on survey creation with logic branching, question types, and analytics dashboards; no dedicated usability-testing methods are documented.",
      "toolB": "Purpose-built for usability testing (moderated and unmoderated), card sorting, tree testing, and click testing in addition to surveys.",
      "whyItMatters": "Information-architecture and navigation-specific research, such as card sorting and tree testing, requires specialized tooling that plain survey platforms don't offer.",
      "benefitsWho": "Benefits UX researchers validating navigation and design decisions specifically."
    },
    {
      "title": "Participant Recruitment",
      "toolA": "Not documented as offering a built-in participant panel; distribution relies on a team's own respondent lists.",
      "toolB": "Includes a global participant recruitment panel with more than 200 demographic filters plus live-intercept recruiting.",
      "whyItMatters": "Teams without their own respondent pool need built-in recruitment to run studies at all.",
      "benefitsWho": "Benefits researchers who need fast access to external participants rather than surveying an existing audience."
    },
    {
      "title": "Self-Hosting Option",
      "toolA": "The open-source Community Edition can be self-hosted under a GPL license.",
      "toolB": "No self-hosting option is documented; it's a hosted enterprise SaaS platform.",
      "whyItMatters": "Organizations with data-residency requirements or a preference to avoid vendor lock-in need self-hosting availability.",
      "benefitsWho": "Benefits organizations with strict data control or infrastructure requirements."
    },
    {
      "title": "Free Access / Trial",
      "toolA": "Offers a free GPL-licensed Community Edition plus a free cloud tier to evaluate before paying.",
      "toolB": "No free trial or free plan is advertised; access requires a sales-led demo and custom quote.",
      "whyItMatters": "Teams wanting to test before buying have a materially easier path with LimeSurvey.",
      "benefitsWho": "Benefits smaller teams or individuals wanting to try before committing budget."
    }
  ],
  "featureMatrix": [
    {
      "group": "Study & Question Design",
      "rows": [
        {
          "feature": "Question type variety",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LimeSurvey: 30+ question types"
        },
        {
          "feature": "Conditional/branching logic",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-language support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LimeSurvey: 80+ languages"
        },
        {
          "feature": "Survey template library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "LimeSurvey: 800+ templates"
        }
      ]
    },
    {
      "group": "Research Methods",
      "rows": [
        {
          "feature": "Usability testing (moderated & unmoderated)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Card sorting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Tree testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Click testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Usability benchmarking dashboards",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Compliance & Support",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "LimeSurvey from €29/month; UserZoom is custom quote only"
        },
        {
          "feature": "SOC 2 Type II / HIPAA compliance documented",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Built-in participant recruitment panel",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "200+ demographic filters"
        },
        {
          "feature": "GDPR compliance",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, LimeSurvey or UserZoom?",
      "answer": "LimeSurvey publishes pricing starting at €29/month (and offers a free self-hosted Community Edition), while UserZoom requires contacting sales for a custom quote with no published rates."
    },
    {
      "question": "Does UserZoom support card sorting and tree testing?",
      "answer": "Yes, UserZoom includes dedicated card sorting and tree testing methods for information architecture research, which LimeSurvey does not offer."
    },
    {
      "question": "Can LimeSurvey be self-hosted?",
      "answer": "Yes, its GPL-licensed Community Edition can be self-hosted for free; UserZoom has no self-hosting option documented."
    },
    {
      "question": "Does UserZoom provide research participants?",
      "answer": "Yes, UserZoom includes a global participant recruitment panel with more than 200 demographic filters; LimeSurvey does not document a built-in participant panel."
    },
    {
      "question": "Is there a free trial for UserZoom?",
      "answer": "No, UserZoom does not publicly advertise a free trial or free plan; LimeSurvey offers both a free open-source edition and a free cloud tier."
    },
    {
      "question": "Which tool fits a dedicated UX research team better?",
      "answer": "UserZoom, since it's purpose-built for usability testing, card sorting, tree testing, and benchmarking with enterprise compliance credentials like SOC 2 Type II and HIPAA; LimeSurvey is a more general survey tool."
    }
  ]
};

export default limesurveyVsUserzoomContent;
