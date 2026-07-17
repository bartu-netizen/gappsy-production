import type { ToolComparisonContent } from './types';

const mazeVsUsertestingContent: ToolComparisonContent = {
  "verdict": "Maze and UserTesting solve overlapping but distinct problems. Maze is a self-serve, unmoderated testing tool built for speed: teams import a Figma, Adobe XD, or Sketch prototype, then launch a usability test, five-second test, card sort, tree test, live website test, or survey, and get automated reporting with AI-assisted summaries, often without any research training. UserTesting is built for depth and scale: it centers on video-based sessions where real participants narrate their thoughts on camera, and it adds moderated live interviews, a large globally screened panel, custom audience targeting, and a centralized Insights Hub for enterprise research operations. Maze publishes transparent pricing with a free plan and paid tiers starting around 99 dollars a month; UserTesting keeps all pricing behind a sales conversation as annual, credit-based contracts. The practical choice comes down to job fit: teams that need fast, frequent, quantitative validation of designs on a limited budget lean toward Maze, while organizations that need qualitative depth, moderated conversations, and enterprise-grade participant targeting lean toward UserTesting. Neither tool is a strict upgrade of the other, since Maze does not document moderated interviews or video think-aloud recordings, and UserTesting does not publish a self-serve free plan or five-second testing capability.",
  "bestForToolA": "Maze fits product, design, and marketing teams that want fast, affordable, self-serve testing of prototypes and live sites without needing a dedicated research team or a sales process.",
  "bestForToolB": "UserTesting fits enterprise research operations that need video-based qualitative depth, moderated interviews, and a large screened global panel, and that have the budget and process for an annual contract.",
  "whoNeedsBoth": "Teams running a continuous research practice often use Maze for quick, high-volume validation of everyday design decisions and UserTesting for deeper, moderated, video-based studies ahead of higher-stakes launches.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Maze publishes a free plan and paid tiers starting around 99 dollars a month billed annually",
      "toolB": "UserTesting does not publish any pricing and sells annual, credit-based contracts only through a sales conversation",
      "whyItMatters": "Buyers who need to budget quickly or self-serve a purchase cannot do so with a vendor that requires a sales call for every quote",
      "benefitsWho": "Small teams and individual researchers benefit from Maze's pricing clarity, while enterprises with procurement processes are used to UserTesting's sales-led buying"
    },
    {
      "title": "Core research method",
      "toolA": "Maze centers on unmoderated, task-based testing with completion rates and heatmap style reporting",
      "toolB": "UserTesting centers on video-based sessions where participants narrate their thoughts while completing tasks",
      "whyItMatters": "Quantitative task metrics answer whether users succeeded, while narrated video reveals why they struggled",
      "benefitsWho": "Teams needing fast pass or fail signal benefit from Maze, while teams needing behavioral and emotional context benefit from UserTesting"
    },
    {
      "title": "Moderated live interviews",
      "toolA": "Not documented as a Maze capability",
      "toolB": "UserTesting supports one-on-one live moderated conversations for deeper qualitative follow-up",
      "whyItMatters": "Some research questions require real-time probing that only a live conversation can provide",
      "benefitsWho": "Researchers running exploratory or discovery interviews benefit from UserTesting's moderated sessions"
    },
    {
      "title": "Company maturity",
      "toolA": "Maze was founded in 2018 and is headquartered in San Francisco California",
      "toolB": "UserTesting was founded in 2007 and is headquartered in Bellevue Washington",
      "whyItMatters": "A longer operating history can signal more mature enterprise processes and support infrastructure",
      "benefitsWho": "Enterprise buyers who weight vendor track record may favor UserTesting's longevity"
    },
    {
      "title": "Free access without sales contact",
      "toolA": "Maze offers a forever free plan with limited monthly tests that anyone can start using immediately",
      "toolB": "UserTesting has no self-serve free trial, and a trial or demo must be arranged through its sales team",
      "whyItMatters": "Teams that want to evaluate a tool before any budget conversation need self-serve access",
      "benefitsWho": "Individual designers, freelancers, and small teams benefit from Maze's free access"
    },
    {
      "title": "Design tool and workflow integrations",
      "toolA": "Maze integrates directly with Figma, Adobe XD, and Sketch for prototype import",
      "toolB": "UserTesting integrates with Figma plus collaboration tools such as Slack for sharing findings",
      "whyItMatters": "The right integrations reduce manual work moving designs into tests and findings into team workflows",
      "benefitsWho": "Design-heavy teams benefit from Maze's design tool depth, while cross-functional teams benefit from UserTesting's collaboration integrations"
    },
    {
      "title": "Participant recruiting depth",
      "toolA": "Maze offers participant recruiting for teams matching general target demographics",
      "toolB": "UserTesting offers a large globally screened panel with advanced screener and targeting options for niche or specialized segments",
      "whyItMatters": "Research on specialized professions or narrow demographics needs deeper screening than general targeting provides",
      "benefitsWho": "Teams needing highly specific B2B or niche consumer participants benefit from UserTesting's audience depth"
    },
    {
      "title": "AI-assisted analysis focus",
      "toolA": "Maze provides automated reporting with heatmaps, completion rates, and AI-assisted summaries of open-ended responses",
      "toolB": "UserTesting provides AI-powered analysis that summarizes themes, sentiment, and friction points across many video sessions",
      "whyItMatters": "Maze's AI analysis is oriented around quick quantitative reporting while UserTesting's AI is oriented around processing large volumes of qualitative video data",
      "benefitsWho": "Teams running many quick tests benefit from Maze's automated reports, while teams drowning in video session data benefit from UserTesting's AI summarization"
    },
    {
      "title": "Learning curve and required expertise",
      "toolA": "Maze is designed to be usable by designers, product managers, and marketers without formal research training",
      "toolB": "UserTesting has a steeper learning curve and its best value depends on having internal research expertise to design tasks and interpret findings",
      "whyItMatters": "Teams without a dedicated researcher need a tool that does not require specialized skill to get useful results",
      "benefitsWho": "Generalist product and design teams benefit from Maze's accessibility, while dedicated research teams benefit from UserTesting's depth"
    },
    {
      "title": "Centralized insights repository",
      "toolA": "Not documented as a Maze capability",
      "toolB": "UserTesting includes an Insights Hub for organizing, tagging, and sharing research findings and video clips across teams",
      "whyItMatters": "Organizations running many studies need a shared repository so findings do not get lost across individual test reports",
      "benefitsWho": "Larger research operations with multiple stakeholders benefit from UserTesting's centralized repository"
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Testing Methods",
      "rows": [
        {
          "feature": "Usability testing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Prototype testing from Figma, Adobe XD, or Sketch",
          "toolA": "available",
          "toolB": "available",
          "note": "UserTesting documents Figma specifically alongside prototype and app testing"
        },
        {
          "feature": "Five-second testing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Live website testing",
          "toolA": "available",
          "toolB": "available",
          "note": "UserTesting supports testing of live sites as part of prototype and app testing"
        }
      ]
    },
    {
      "group": "Information Architecture Testing",
      "rows": [
        {
          "feature": "Card sorting",
          "toolA": "available",
          "toolB": "available",
          "note": "Included in UserTesting Ultimate plan and above"
        },
        {
          "feature": "Tree testing",
          "toolA": "available",
          "toolB": "available",
          "note": "Included in UserTesting Ultimate plan and above"
        }
      ]
    },
    {
      "group": "Moderated and Qualitative Research",
      "rows": [
        {
          "feature": "Moderated live interviews",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Video and audio think-aloud recordings",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Standalone surveys",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile App Testing",
      "rows": [
        {
          "feature": "Released and unreleased iOS and Android app testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Supports APK upload and App Store, Google Play, or TestFlight links"
        }
      ]
    },
    {
      "group": "Participant Access",
      "rows": [
        {
          "feature": "Built-in participant recruiting",
          "toolA": "available",
          "toolB": "available",
          "note": "Maze targets general demographics; UserTesting offers a larger global panel"
        },
        {
          "feature": "Custom or niche audience screening",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI and Reporting",
      "rows": [
        {
          "feature": "AI-assisted analysis or summaries",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automated heatmaps and completion rate reporting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Centralized insights repository",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "UserTesting Insights Hub"
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
          "note": "Add-on on UserTesting Advanced plan, included on Ultimate"
        },
        {
          "feature": "Slack integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Adobe XD or Sketch integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "UserTesting pricing is contact for pricing only"
        },
        {
          "feature": "Free plan with no sales conversation required",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Enterprise admin and security controls",
          "toolA": "available",
          "toolB": "available",
          "note": "Maze offers this on its Organization tier; UserTesting includes enterprise security compliance on Advanced and above"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Maze or UserTesting?",
      "answer": "Maze is the more affordable and budgetable option because it publishes a free plan and paid tiers starting around 99 dollars a month, while UserTesting does not publish any pricing and requires a sales conversation for its annual, credit-based contracts."
    },
    {
      "question": "Is Maze good for beginners without a UX research background?",
      "answer": "Yes, Maze is designed to be usable by designers, product managers, and marketers without formal research training, whereas UserTesting has a steeper learning curve and its best value depends on having internal research expertise."
    },
    {
      "question": "Can UserTesting do everything Maze does?",
      "answer": "UserTesting covers most of the same ground, including prototype testing, card sorting, and tree testing, but its provided facts do not document a five-second testing feature, which Maze offers."
    },
    {
      "question": "Can Maze do moderated interviews like UserTesting?",
      "answer": "Maze's documented feature set does not include moderated live interviews or video think-aloud recordings, both of which are core, documented UserTesting capabilities."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Maze offers a forever free plan that anyone can start using immediately, while UserTesting has no self-serve free trial and only offers a trial or demo arranged through its sales team."
    },
    {
      "question": "Which tool is better for enterprise research teams?",
      "answer": "UserTesting is the stronger fit for enterprise research operations because it documents a large globally screened panel, custom audience screening, moderated interviews, and a centralized Insights Hub for sharing findings across teams."
    }
  ]
};

export default mazeVsUsertestingContent;
