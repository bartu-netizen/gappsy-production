import type { ToolComparisonContent } from './types';

const qualtricsVsQuestionproContent: ToolComparisonContent = {
  "verdict": "Qualtrics and QuestionPro both trace back to 2002 and both operate freemium models, but they are built for different buyers. Qualtrics is an enterprise experience management platform: its CoreXM survey builder, XM Directory, Text iQ AI analytics, and dedicated CX and EX solution suites are designed for large organizations running formal customer experience, employee experience, and academic or market research programs at scale, backed by deep integrations and enterprise administrative controls. Its free account and self-service Strategic Research plan lower the entry point, but the core product and its pricing are oriented toward custom enterprise contracts. QuestionPro is a broader, more accessible survey and market research platform. Its free Essentials plan includes real logic and integrations rather than a stripped demo, its Advanced and Team Edition tiers publish concrete per-user pricing, and its Research Suite adds conjoint analysis, MaxDiff, and TURF plus panel and community access for professional researchers who still want a published price ceiling before escalating to a custom quote. Choosing between them comes down to whether you need Qualtrics's depth of enterprise CX and EX tooling and are prepared for custom pricing and a longer evaluation, or whether you want QuestionPro's transparent tiered pricing and an all-in-one survey to advanced research path without an enterprise sales cycle for most of the plans.",
  "bestForToolA": "Qualtrics is the better fit for large enterprises running formal, cross-functional customer experience and employee experience programs that need deep survey logic, AI-assisted text analytics, and enterprise-grade integrations and admin controls.",
  "bestForToolB": "QuestionPro is the better fit for teams and researchers who want transparent tiered pricing, a genuinely usable free plan, and a single platform that scales from basic surveys up to advanced market research methods like conjoint analysis.",
  "whoNeedsBoth": "Organizations that run both large-scale enterprise CX and EX programs and smaller ad hoc market research studies may use Qualtrics for their flagship experience management program while using QuestionPro for lower-cost, self-service survey projects and advanced methodology work with published pricing.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Qualtrics's enterprise suites and CoreXM are custom-quoted, with only a self-service Strategic Research plan purchasable online without a sales call.",
      "toolB": "QuestionPro publishes concrete per-user monthly prices for its Advanced ($99/user/month) and Team Edition ($83/user/month, five-user minimum) tiers, with only the Research Suite requiring a custom quote.",
      "whyItMatters": "Buyers who need to budget before talking to sales get a much clearer view of costs upfront with one platform than the other.",
      "benefitsWho": "Smaller teams and individual researchers who need to forecast cost benefit from QuestionPro's published pricing."
    },
    {
      "title": "Free plan depth",
      "toolA": "Qualtrics's free account caps active surveys at 3 and responses at 500 per user, with an optional 30-day paid trial upgrade.",
      "toolB": "QuestionPro Essentials is free for one user with 200 responses per survey, 30 question types, and basic logic and integrations included.",
      "whyItMatters": "Determines whether a team can actually run a complete survey project on the free tier or only evaluate the interface.",
      "benefitsWho": "Individuals and small teams needing a production-usable free tool favor QuestionPro; enterprise evaluators wanting a broader trial favor Qualtrics's upgrade path."
    },
    {
      "title": "Core positioning",
      "toolA": "Qualtrics is built as an enterprise experience management platform spanning CX, EX, and strategic research suites.",
      "toolB": "QuestionPro is positioned as an online survey and market research platform with CX and workforce modules layered on top of a core survey tool.",
      "whyItMatters": "Affects whether the product feels like a dedicated survey tool or a broader enterprise system with surveys as one entry point.",
      "benefitsWho": "Enterprises standardizing on one experience management system benefit from Qualtrics's suite approach; teams wanting a survey-first tool with optional add-ons benefit from QuestionPro."
    },
    {
      "title": "AI-assisted text analytics",
      "toolA": "Qualtrics includes Text iQ, an AI-assisted text and sentiment analysis feature that automatically categorizes open-text feedback.",
      "toolB": "QuestionPro's documented feature set does not include a comparable AI text or sentiment analytics capability.",
      "whyItMatters": "Teams processing large volumes of open-text feedback save significant manual coding time with built-in AI categorization.",
      "benefitsWho": "Enterprise CX and research teams handling high open-text volume benefit most from Qualtrics's Text iQ."
    },
    {
      "title": "Advanced market research methodologies",
      "toolA": "Qualtrics's documented features do not name specific methodologies such as conjoint analysis or MaxDiff.",
      "toolB": "QuestionPro's Research Suite explicitly supports conjoint analysis, MaxDiff, and TURF studies.",
      "whyItMatters": "Professional market researchers running trade-off and product-feature studies need these specific methods natively supported.",
      "benefitsWho": "Market research professionals benefit from QuestionPro's named methodology support at the Research Suite tier."
    },
    {
      "title": "Respondent panel access",
      "toolA": "Not documented as including a built-in external respondent panel.",
      "toolB": "QuestionPro's Research Suite includes access to a large external respondent panel plus dedicated community management tools.",
      "whyItMatters": "Teams without their own audience need a built-in way to reach survey respondents rather than sourcing a panel separately.",
      "benefitsWho": "Market researchers without an existing respondent base benefit from QuestionPro's panel access."
    },
    {
      "title": "Team pricing structure",
      "toolA": "Enterprise CoreXM, CX, and EX plans use volume-based pricing on interactions or employees under annual contracts.",
      "toolB": "QuestionPro Team Edition requires a five-user minimum at $83 per user per month, adding cost for very small teams even though the per-user rate is published.",
      "whyItMatters": "Minimum seat counts and volume-based contract models both affect real cost for small versus large teams differently.",
      "benefitsWho": "Larger teams with many named users may find QuestionPro's per-seat model predictable; very small teams may find the five-user minimum a barrier compared to Qualtrics's free or self-service tiers."
    },
    {
      "title": "Learning curve",
      "toolA": "Cons note a steep learning curve given the depth of features and configuration options.",
      "toolB": "Cons note the interface can feel dense, and advanced features like conjoint analysis and MaxDiff carry a real learning curve.",
      "whyItMatters": "Both tools require investment to master advanced capability, but the depth and stakes differ across enterprise configuration versus specific research methods.",
      "benefitsWho": "Teams with dedicated survey or research specialists can absorb either learning curve; casual or occasional survey creators may find both tools' advanced layers less approachable than lightweight alternatives."
    },
    {
      "title": "Named CRM and collaboration integrations",
      "toolA": "Qualtrics offers prebuilt enterprise integrations naming systems such as Salesforce and Slack.",
      "toolB": "QuestionPro offers integrations for connecting survey data to CRM and marketing platforms, without naming specific systems in the provided facts.",
      "whyItMatters": "Determines how easily survey data flows into a team's existing enterprise software stack.",
      "benefitsWho": "Enterprises with Salesforce or Slack-centric stacks benefit from Qualtrics's named integrations."
    },
    {
      "title": "Headquarters and market presence",
      "toolA": "Qualtrics is headquartered in Provo, Utah and Seattle, Washington, United States.",
      "toolB": "QuestionPro is headquartered in Austin, Texas, USA.",
      "whyItMatters": "Not a functional differentiator, but relevant for buyers weighing vendor regional presence or support coverage.",
      "benefitsWho": "Buyers with a preference for a particular vendor's regional base can use this as a minor tie-breaker only."
    }
  ],
  "featureMatrix": [
    {
      "group": "Survey Building",
      "rows": [
        {
          "feature": "Branching and skip logic",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics adds quotas and randomization; QuestionPro calls this skip logic and branching"
        },
        {
          "feature": "Question type variety",
          "toolA": "available",
          "toolB": "available",
          "note": "QuestionPro documents 30 to 52 question types depending on plan tier"
        },
        {
          "feature": "Prebuilt templates",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer libraries organized by use case or industry"
        }
      ]
    },
    {
      "group": "Distribution and Data Collection",
      "rows": [
        {
          "feature": "Offline mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-channel distribution such as SMS, QR codes, and social media",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuestionPro facts explicitly list email, web links, SMS, social media, and QR codes"
        },
        {
          "feature": "Multilingual survey delivery",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Analytics and Reporting",
      "rows": [
        {
          "feature": "Real-time dashboards and reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-assisted text and sentiment analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Qualtrics feature is called Text iQ"
        },
        {
          "feature": "Cross-tabulation and live filtering",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Experience Management Programs",
      "rows": [
        {
          "feature": "Customer experience program tools",
          "toolA": "available",
          "toolB": "available",
          "note": "Both include journey mapping style workflows"
        },
        {
          "feature": "Employee experience and engagement surveys",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Centralized contact and panel management",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics calls this XM Directory; QuestionPro pairs it with community management"
        }
      ]
    },
    {
      "group": "Advanced Research Methods",
      "rows": [
        {
          "feature": "Conjoint analysis, MaxDiff, and TURF studies",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuestionPro Research Suite tier only"
        },
        {
          "feature": "Access to an external respondent panel",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuestionPro Research Suite tier only"
        }
      ]
    },
    {
      "group": "Integrations and Extensibility",
      "rows": [
        {
          "feature": "CRM, helpdesk, and collaboration integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics names Salesforce and Slack specifically"
        },
        {
          "feature": "Documented API for custom workflows",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuestionPro facts explicitly describe API-based custom workflow building"
        }
      ]
    },
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Usable free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Qualtrics caps at 3 surveys and 500 responses per user; QuestionPro Essentials includes 30 question types and basic logic free"
        },
        {
          "feature": "Published mid-tier pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Qualtrics plans above the free account are custom-quoted; QuestionPro publishes per-user prices for Advanced and Team Edition"
        },
        {
          "feature": "Custom enterprise quote tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Qualtrics CX/EX Enterprise and QuestionPro Research Suite are both contact-for-pricing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Qualtrics or QuestionPro?",
      "answer": "QuestionPro publishes clearer pricing, with Advanced starting at $99 per user per month and Team Edition at $83 per user per month for five users, while Qualtrics reserves published self-service pricing for its Strategic Research plan and quotes its CX, EX, and enterprise suites custom, so QuestionPro is generally easier to budget for at the mid-tier level."
    },
    {
      "question": "Is QuestionPro good for beginners?",
      "answer": "QuestionPro's own documented cons note the interface can feel dense compared to newer minimal tools, and its advanced research features like conjoint analysis carry a real learning curve, so beginners doing simple surveys will find the free Essentials plan usable while the deeper toolset takes more time to learn."
    },
    {
      "question": "Can QuestionPro do what Qualtrics does?",
      "answer": "QuestionPro covers core surveys, customer experience tracking, employee experience surveys, and advanced methods like conjoint analysis and MaxDiff through its Research Suite, but its documented feature set does not include an AI-assisted text and sentiment analytics capability comparable to Qualtrics's Text iQ."
    },
    {
      "question": "Which has better AI features, Qualtrics or QuestionPro?",
      "answer": "Qualtrics documents a specific AI-assisted analytics feature, Text iQ, which automatically categorizes open-text feedback and surfaces themes, while QuestionPro's documented features do not describe a comparable AI text or sentiment analysis capability."
    },
    {
      "question": "Does Qualtrics or QuestionPro have a better free plan?",
      "answer": "QuestionPro's free Essentials plan includes real logic, integrations, and 30 question types for one user, while Qualtrics's free account caps active surveys at 3 and responses at 500 per user, making QuestionPro's free tier more usable for a complete small survey project."
    },
    {
      "question": "Which tool is better for advanced market research methods like conjoint analysis?",
      "answer": "QuestionPro is the better documented fit, since its Research Suite tier explicitly supports conjoint analysis, MaxDiff, and TURF studies along with access to an external respondent panel, while Qualtrics's provided feature list does not name these specific methodologies."
    }
  ]
};

export default qualtricsVsQuestionproContent;
