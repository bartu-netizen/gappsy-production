import type { ToolComparisonContent } from './types';

const teachableVsThinkificContent: ToolComparisonContent = {
  "verdict": "Teachable and Thinkific both start from the same premise: a no-code platform for packaging video lessons into a sellable course, but they optimize for different businesses. Teachable is built around AI-assisted course creation and a polished, high-conversion checkout with automatic global sales tax and VAT handling, making it a strong fit for solo creators and coaches who want to launch fast and rely on order bumps and upsells to grow average order value. Thinkific leans further into building a full creator business around a course, bundling native communities, membership tiers, and Zoom-integrated live cohorts alongside self-paced lessons, which suits creators who want recurring revenue and an engaged audience, not just one-off course sales. Pricing is close at the entry tier, but Teachable's cheapest plan carries a 7.5 percent transaction fee while Thinkific has been phasing fees out on most current plans, so the real cost gap depends on sales volume. Teams that need enterprise compliance features like single sign-on and SCORM, or an API to connect a course site into an existing tech stack, will find those documented only on Thinkific's Grow and Plus tiers. Neither tool is a blanket winner: pick Teachable for fast, AI-assisted course and coaching launches with strong checkout mechanics, and pick Thinkific for building a community-driven learning business with live and recurring components.",
  "bestForToolA": "Teachable is the better fit for solo creators and coaches who want to launch a course or coaching offer quickly, use AI to draft curriculum, and rely on a polished built-in checkout with automatic global tax handling.",
  "bestForToolB": "Thinkific is the better fit for creators and teams building a broader learning business around communities, memberships, and live cohort coaching, or who need API access and enterprise features like SSO and SCORM via Thinkific Plus.",
  "whoNeedsBoth": "A creator-education agency running courses for multiple clients might use Teachable for clients who want fast, AI-assisted solo launches and Thinkific for clients who need community and live-cohort features, rather than standardizing on one platform.",
  "keyDifferences": [
    {
      "title": "Entry-level pricing and fees",
      "toolA": "Teachable's Starter plan is 39 dollars a month, or 29 dollars a month billed annually, but charges a 7.5 percent transaction fee on sales",
      "toolB": "Thinkific's Basic plan is 49 dollars a month, or 36 dollars a month billed annually, and has moved toward eliminating transaction fees on most current plans",
      "whyItMatters": "the effective cost of the entry tier depends more on sales volume and transaction fees than the sticker price",
      "benefitsWho": "high-volume sellers benefit more from Thinkific's fee structure while low-volume creators may prefer Teachable's lower sticker price"
    },
    {
      "title": "Core platform focus",
      "toolA": "Teachable centers on structured courses, coaching, and digital downloads sold through a single guided checkout",
      "toolB": "Thinkific bundles courses with native communities, memberships, and live cohort coaching in one site",
      "whyItMatters": "buyers who want an all-in-one community and recurring-revenue hub need more built-in tooling than a pure course checkout provides",
      "benefitsWho": "coaches and course-only sellers benefit from Teachable's focus while community-driven educators benefit from Thinkific's broader toolset"
    },
    {
      "title": "AI content creation",
      "toolA": "Teachable includes AI tools that generate course outlines, lesson text, and quizzes, plus automatic video subtitle translation into dozens of languages",
      "toolB": "Thinkific's documented feature set does not mention AI course-writing or subtitle-translation tools",
      "whyItMatters": "creators who want to speed up first-draft curriculum production have a documented advantage on one platform",
      "benefitsWho": "solo creators short on time or writing skill benefit most from Teachable's AI tools"
    },
    {
      "title": "Communities and memberships",
      "toolA": "Teachable itself notes that community and membership features are less developed than on dedicated platforms",
      "toolB": "Thinkific includes native discussion communities and membership tiers that can be bundled directly with course content",
      "whyItMatters": "creators building recurring revenue around an engaged audience need first-party community tools rather than workarounds",
      "benefitsWho": "membership-site operators and community-first educators benefit from Thinkific's native support"
    },
    {
      "title": "Live cohorts and coaching delivery",
      "toolA": "Teachable supports selling coaching sessions as a product type through its checkout",
      "toolB": "Thinkific adds Zoom-integrated live sessions and cohort-based course delivery alongside self-paced content",
      "whyItMatters": "cohort-based programs need scheduling and live-session tooling, not just a sellable product listing",
      "benefitsWho": "cohort-course creators and live coaches benefit from Thinkific's built-in Zoom integration"
    },
    {
      "title": "Mobile app options",
      "toolA": "Teachable gives students iOS and Android apps for consuming purchased courses",
      "toolB": "Thinkific offers the same native student apps plus an optional paid add-on to publish a fully white-label branded app",
      "whyItMatters": "creators who want their own-branded app store presence need that option available at all",
      "benefitsWho": "creators building a distinct consumer brand benefit from Thinkific's branded app add-on"
    },
    {
      "title": "API access and integrations",
      "toolA": "Teachable's provided facts do not document a public API or app marketplace",
      "toolB": "Thinkific offers API access on the Grow plan and above plus an app marketplace for email, CRM, and marketing tools",
      "whyItMatters": "businesses connecting a course site into an existing CRM or marketing stack need programmatic access",
      "benefitsWho": "teams with existing marketing or CRM tooling benefit from Thinkific's documented API and integrations"
    },
    {
      "title": "Enterprise and compliance tier",
      "toolA": "Teachable's top Custom plan adds a dedicated success manager, white-glove onboarding, and priority SLA support",
      "toolB": "Thinkific Plus adds single sign-on, SCORM and learning paths, and CRM integrations for large organizations",
      "whyItMatters": "large organizations often have compliance and identity-management requirements beyond a standard course plan",
      "benefitsWho": "enterprise learning and development teams needing SSO or SCORM benefit specifically from Thinkific Plus"
    },
    {
      "title": "Ownership and company background",
      "toolA": "Teachable was founded in 2013 and has been owned by Hotmart Company, a creator-economy business, since a 2020 acquisition",
      "toolB": "Thinkific was founded in 2012 and remains headquartered in Vancouver, British Columbia",
      "whyItMatters": "some buyers weigh company independence and acquisition history when choosing a long-term platform for their business",
      "benefitsWho": "buyers researching vendor stability can factor this into due diligence"
    },
    {
      "title": "Admin seats and team permissions",
      "toolA": "Teachable's Growth plan supports up to 5 admin users with configurable permissions",
      "toolB": "Thinkific's provided facts do not document a specific admin-seat or permissions structure",
      "whyItMatters": "multi-instructor teams need clear seat limits and role-based access to collaborate safely",
      "benefitsWho": "multi-instructor or staff-based teams benefit from Teachable's documented admin permission tiers"
    }
  ],
  "featureMatrix": [
    {
      "group": "Course Building and Content",
      "rows": [
        {
          "feature": "Drag-and-drop course builder",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Quizzes",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Drip content scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Completion certificates",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Assignments and instructor grading",
          "toolA": "limited",
          "toolB": "available",
          "note": "Teachable lists assessment options as thin for complex quizzes, file uploads, and open-ended grading"
        }
      ]
    },
    {
      "group": "Payments and Checkout",
      "rows": [
        {
          "feature": "Native built-in checkout",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Order bumps and upsells",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Subscriptions and payment plans",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Thinkific's Start plan and above"
        },
        {
          "feature": "Transaction fee on entry plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Teachable Starter charges 7.5 percent; Thinkific has moved toward eliminating fees on most current plans"
        },
        {
          "feature": "Automatic global sales tax and VAT collection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Community, Membership and Live Coaching",
      "rows": [
        {
          "feature": "Student discussion communities",
          "toolA": "limited",
          "toolB": "available",
          "note": "Teachable itself notes community features are less developed than dedicated platforms"
        },
        {
          "feature": "Membership or subscription selling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Live cohort sessions with Zoom integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Sell one-on-one coaching sessions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Thinkific documents cohort coaching but not one-on-one coaching sales specifically"
        }
      ]
    },
    {
      "group": "AI and Localization",
      "rows": [
        {
          "feature": "AI-generated course outlines and lesson text",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI-generated quizzes",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Automatic video subtitle translation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Multiple student-facing interface languages",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile Experience",
      "rows": [
        {
          "feature": "Native student app on iOS and Android",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "White-label branded mobile app",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Thinkific offers this as a paid add-on"
        }
      ]
    },
    {
      "group": "Team, Admin and Support",
      "rows": [
        {
          "feature": "Multiple admin seats with permissions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Teachable documents up to 5 admin users on its Growth plan"
        },
        {
          "feature": "Phone or priority support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Thinkific's Grow plan and above"
        },
        {
          "feature": "Dedicated success manager on top tier",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Integrations, API and Analytics",
      "rows": [
        {
          "feature": "Public API access",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented on Thinkific's Grow plan and above"
        },
        {
          "feature": "App marketplace or third-party integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Analytics and reporting dashboards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Enterprise and Compliance",
      "rows": [
        {
          "feature": "Single sign-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available via Thinkific Plus"
        },
        {
          "feature": "SCORM support or learning paths",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available via Thinkific Plus"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Teachable or Thinkific?",
      "answer": "Teachable's cheapest annual plan is 29 dollars a month versus Thinkific's 36 dollars a month, but Teachable's entry Starter plan charges a 7.5 percent transaction fee while Thinkific has moved toward eliminating fees on most current plans, so higher-volume sellers may find Thinkific cheaper overall despite the higher sticker price."
    },
    {
      "question": "Is Teachable or Thinkific better for beginners?",
      "answer": "Both offer no-code, drag-and-drop course builders that are approachable for non-technical creators, though Teachable's guided setup and AI course-creation tools can make producing a first course faster, while Thinkific's deeper feature set around communities and live cohorts takes a bit more configuration to use fully."
    },
    {
      "question": "Can Thinkific generate course content with AI like Teachable does?",
      "answer": "Not based on the documented feature set; Thinkific's facts describe a drag-and-drop editor, communities, and live cohorts but do not mention AI-generated outlines, lesson text, quizzes, or subtitle translation, which are specifically documented as Teachable features."
    },
    {
      "question": "Which platform is better for building a community or membership site?",
      "answer": "Thinkific is the stronger documented fit, since it includes native discussion communities and membership tiers bundled directly with courses, while Teachable itself lists community and membership features as less developed than dedicated platforms."
    },
    {
      "question": "Does Teachable or Thinkific have a free plan?",
      "answer": "Neither platform offers a permanent free plan; both provide a free trial on paid plans, and Teachable additionally backs its trial with a 30-day money-back guarantee."
    },
    {
      "question": "Which tool is better for live cohort-based courses or coaching?",
      "answer": "Thinkific documents built-in Zoom-integrated live sessions and cohort-based course delivery, while Teachable supports selling coaching sessions as a product type but does not document dedicated live-cohort scheduling tools, making Thinkific the more built-out option for cohort programs."
    }
  ]
};

export default teachableVsThinkificContent;
