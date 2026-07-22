import type { ToolComparisonContent } from './types';

const canvasLmsVsMoodleContent: ToolComparisonContent = {
  "verdict": "Canvas LMS and Moodle both serve K-12 schools, universities, and training organizations, but they solve the problem in different ways. Canvas is a commercially hosted product from Instructure, priced through custom sales quotes, built around a modern interface, native Student/Teacher/Parent mobile apps, and named integrations with tools like Zoom, Google Workspace, Microsoft 365, and Turnitin. Moodle is free, open-source software under the GNU GPL that any organization can self-host at no licensing cost, or run through MoodleCloud or a certified Moodle Partner, making it the more budget-flexible and deeply customizable option for teams with technical capacity or plugin development resources. Canvas suits institutions that want a single vendor relationship, dedicated support, and a polished out-of-box experience, and are comfortable with quote-based pricing. Moodle suits organizations that want full control over cost, hosting, and configuration, and either have in-house IT staff or budget for managed hosting. Neither tool is universally better: the decision comes down to whether predictable vendor support or open-ended customization and cost control matters more, and whether the organization has the technical resources to run and extend an open-source platform versus paying for a managed commercial one.",
  "bestForToolA": "Canvas LMS is the better fit for schools, districts, and universities that want a modern, vendor-supported cloud LMS with dedicated mobile apps and named third-party integrations, and are willing to go through custom sales pricing for that support.",
  "bestForToolB": "Moodle is the better fit for schools, universities, and organizations that want a free, fully customizable open-source LMS and either have in-house technical staff or a budget for MoodleCloud or a Moodle Partner.",
  "whoNeedsBoth": "Large multi-department institutions or ed-tech consultants supporting multiple clients may end up administering both platforms, since some faculties or departments standardize on Canvas for vendor support while others run Moodle for cost control or legacy reasons.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Canvas institutional pricing is custom-quoted with no published rates; Instructure also offers a free Canvas Free-for-Teacher account for individual educators",
      "toolB": "Moodle core software is free and open source with no per-user licensing cost, with paid MoodleCloud hosting tiers and Moodle Partner services available",
      "whyItMatters": "Buyers with fixed or limited budgets need to know upfront whether they can plan costs precisely or must negotiate a quote",
      "benefitsWho": "Budget-constrained schools and independent educators benefit from Moodle or Canvas Free-for-Teacher; institutions wanting predictable vendor billing accept Canvas quotes"
    },
    {
      "title": "Licensing and hosting model",
      "toolA": "Canvas is primarily a commercially hosted product from Instructure, though a Canvas Open Source core is available for self-hosting",
      "toolB": "Moodle is fundamentally open source under the GNU GPL and is designed to be self-hosted, with MoodleCloud as an optional managed layer on top",
      "whyItMatters": "Organizations differ in whether they want to own infrastructure or hand it to a vendor",
      "benefitsWho": "IT teams that want full server control benefit from Moodle; organizations that prefer not to manage infrastructure benefit from Canvas by Instructure"
    },
    {
      "title": "Platform origin and history",
      "toolA": "Canvas LMS was founded in 2008 and is headquartered in Salt Lake City, Utah",
      "toolB": "Moodle was founded in 2002 and is headquartered in Perth, Australia",
      "whyItMatters": "A longer open-source history correlates with a larger plugin and community ecosystem, while a newer commercial product may reflect more recent interface design choices",
      "benefitsWho": "Organizations valuing community-built plugins lean toward Moodle's longer open-source track record; those wanting a newer commercial interface lean toward Canvas"
    },
    {
      "title": "Native video authoring tool",
      "toolA": "Canvas includes Canvas Studio, a built-in tool for video hosting, interactive video quizzes, and time-stamped comments embedded directly in courses",
      "toolB": "Not documented as a native built-in feature; Moodle's plugin ecosystem covers conferencing and related tools instead",
      "whyItMatters": "Institutions that lean heavily on video lecture content may want this capability built in rather than added through third-party plugins",
      "benefitsWho": "Video-heavy course creators benefit from Canvas Studio being native; Moodle users would need a plugin to match this"
    },
    {
      "title": "Shared content repository",
      "toolA": "Canvas Commons lets instructors and districts publish and reuse course modules, assessments, and resources across a system",
      "toolB": "Not documented as an equivalent built-in feature; Moodle's plugin ecosystem provides other forms of content and resource sharing",
      "whyItMatters": "Districts standardizing curriculum across many courses benefit from a built-in shared repository",
      "benefitsWho": "Multi-school districts and departments reusing course content benefit from Canvas Commons"
    },
    {
      "title": "Customization and extensibility approach",
      "toolA": "Canvas extends through a curated open REST API and LTI 1.3 integrations, plus an open-source core option for deeper self-hosted customization",
      "toolB": "Moodle extends through thousands of community and commercial plugins, themes, and a public web services API",
      "whyItMatters": "The breadth of a plugin marketplace versus a curated integration set affects how much a team can tailor the platform without vendor involvement",
      "benefitsWho": "Developers and technical teams wanting granular plugin-level control benefit from Moodle; teams wanting a smaller, curated integration set benefit from Canvas"
    },
    {
      "title": "Mobile app structure",
      "toolA": "Canvas offers three separate native apps, Canvas Student, Canvas Teacher, and Canvas Parent, each tailored to a specific role",
      "toolB": "Moodle offers a single Moodle Mobile app for iOS and Android covering courses, grades, and notifications",
      "whyItMatters": "Role-specific apps can offer more tailored workflows, while a single app is simpler to deploy and explain to users",
      "benefitsWho": "Parents and teachers wanting role-specific mobile experiences benefit from Canvas; administrators wanting one app to support benefit from Moodle"
    },
    {
      "title": "Multi-language support",
      "toolA": "Not documented as an explicit feature in the provided facts",
      "toolB": "Moodle explicitly supports dozens of languages with a fully translatable interface and course content",
      "whyItMatters": "International or multilingual deployments need confirmed, documented localization support",
      "benefitsWho": "Global organizations and non-English-speaking institutions benefit from Moodle's documented multi-language support"
    },
    {
      "title": "Support model",
      "toolA": "Canvas by Instructure includes dedicated customer support and premium support options as part of the institutional plan, though effective use often still requires a dedicated LMS administrator",
      "toolB": "Moodle support comes through community resources, MoodleCloud, or certified Moodle Partners, since self-hosting requires ongoing server maintenance and technical expertise",
      "whyItMatters": "Organizations without strong in-house IT need to know whether support is bundled with the vendor or must be sourced separately",
      "benefitsWho": "Institutions without deep technical staff benefit from Canvas's bundled vendor support; technically capable teams may prefer Moodle's community and partner model"
    }
  ],
  "featureMatrix": [
    {
      "group": "Grading and Assessment",
      "rows": [
        {
          "feature": "Gradebook",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas pairs its gradebook with SpeedGrader for annotated feedback"
        },
        {
          "feature": "Quiz engine with question banks",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas calls this Quizzes and New Quizzes; Moodle's quiz engine supports randomized question banks"
        },
        {
          "feature": "Rubric-based annotated feedback",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented for Canvas via SpeedGrader; not confirmed in Moodle's provided facts"
        }
      ]
    },
    {
      "group": "Course Design and Content",
      "rows": [
        {
          "feature": "Sequential modules or topic-based course structure",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas uses Modules; Moodle uses weekly or topic-based course formats"
        },
        {
          "feature": "Conditional release or mastery paths",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas has a dedicated Mastery Paths feature; Moodle includes conditional release rules within Course Management"
        },
        {
          "feature": "Native video authoring and hosting tool",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canvas Studio is a named built-in feature; not confirmed as native in Moodle's facts"
        }
      ]
    },
    {
      "group": "Collaboration and Communication",
      "rows": [
        {
          "feature": "Discussion boards or forums",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Class announcements",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canvas explicitly lists Announcements alongside Discussions"
        },
        {
          "feature": "Wikis and group activities",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Listed under Moodle's Forums and Collaboration feature"
        }
      ]
    },
    {
      "group": "Content Sharing and Reuse",
      "rows": [
        {
          "feature": "Institution-wide shared content repository",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canvas Commons is the named feature"
        },
        {
          "feature": "Reusable randomized question banks",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Mobile and Accessibility",
      "rows": [
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas offers three role-specific apps; Moodle offers one unified app"
        },
        {
          "feature": "Multi-language interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Moodle explicitly supports dozens of languages"
        }
      ]
    },
    {
      "group": "Integrations and APIs",
      "rows": [
        {
          "feature": "LTI integration standard support",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas documents LTI 1.3; Moodle's FAQ confirms LTI support"
        },
        {
          "feature": "Open web services or REST API",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Named third-party integrations such as Zoom, Google Workspace, Microsoft 365, Turnitin",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Moodle's facts mention SIS, HR, and SSO integrations generally but do not name specific partners"
        }
      ]
    },
    {
      "group": "Analytics and Reporting",
      "rows": [
        {
          "feature": "Engagement and at-risk student analytics",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Canvas names institution-level Analytics and Reporting; Moodle's reporting is documented as completion tracking"
        },
        {
          "feature": "Completion tracking and activity reports",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Explicitly named as a Moodle feature"
        }
      ]
    },
    {
      "group": "Deployment and Support",
      "rows": [
        {
          "feature": "Self-hosted open-source option",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas Open Source core versus Moodle's fully open GPL codebase"
        },
        {
          "feature": "Managed hosted plan with vendor support",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas by Instructure Institutional versus MoodleCloud or Moodle Partner hosting"
        },
        {
          "feature": "Free tier for individuals or small deployments",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas Free-for-Teacher versus MoodleCloud Free with limited users and storage"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Canvas LMS or Moodle?",
      "answer": "Moodle is generally cheaper for organizations with technical capacity, since its core software is free and open source with no per-user licensing cost, while Canvas requires contacting sales for a custom institutional quote, though Canvas does offer a free Canvas Free-for-Teacher option for individual educators."
    },
    {
      "question": "Is Moodle good for beginners?",
      "answer": "Moodle has a noticeable learning curve for new administrators and an interface that can feel dated compared to newer platforms, so beginners without technical support may find MoodleCloud or a Moodle Partner easier to start with than self-hosting."
    },
    {
      "question": "Can Canvas LMS do everything Moodle does?",
      "answer": "Both platforms cover core LMS functions like gradebooks, quizzes, discussion forums, and mobile access, but Canvas is primarily a vendor-hosted commercial product with paid add-ons like Studio and Commons, while Moodle is open-source software that can be self-hosted and modified freely."
    },
    {
      "question": "Does Canvas LMS or Moodle have better mobile apps?",
      "answer": "Canvas offers three separate native apps, Canvas Student, Canvas Teacher, and Canvas Parent, for role-specific mobile experiences, while Moodle provides a single Moodle Mobile app for iOS and Android covering courses, grades, and notifications."
    },
    {
      "question": "Is Moodle open source?",
      "answer": "Yes, Moodle's core software is free and open source under the GNU GPL, while Canvas offers an open-source core option but is primarily distributed as a commercially hosted product by Instructure."
    },
    {
      "question": "Which has more integrations, Canvas LMS or Moodle?",
      "answer": "Canvas documents named integrations with Zoom, Google Workspace, Microsoft 365, and Turnitin through its LTI and API ecosystem, while Moodle offers a web services API, LTI support, and thousands of community and commercial plugins, though specific named integration partners are not documented."
    }
  ]
};

export default canvasLmsVsMoodleContent;
