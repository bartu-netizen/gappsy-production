import type { ToolComparisonContent } from './types';

const blackboardLearnVsCanvasLmsContent: ToolComparisonContent = {
  "verdict": "Blackboard Learn and Canvas LMS are both enterprise-grade learning management systems built for accredited schools, colleges, and universities rather than individual trainers or small teams, and both price on a custom quote basis with no public rate card for institutional plans. Blackboard Learn, in the market since 1997 and now owned by Anthology, carries the deepest legacy footprint in higher education, with strong built-in accessibility tooling through Ally, a native virtual classroom in Collaborate, and a long history of large multi-campus deployments, though institutions still transitioning from its older Original course view to the newer Ultra view can face a mixed interface experience. Canvas LMS, launched in 2008 by Instructure, is generally the more modern, cloud-native option, with an open source core that can be self-hosted for free, a Free-for-Teacher tier for individual educators, and companion products like Studio and Commons for video and content sharing, though those extras are typically separate paid add-ons for institutional customers. The documented facts do not confirm native generative AI tooling on the Canvas side or a native live virtual classroom feature comparable to Collaborate, so those remain real differentiators rather than close calls. The practical choice comes down to whether a buyer needs Blackboard's established accessibility and virtual classroom depth for a large legacy institution, or Canvas's more modern interface and low-cost entry points for smaller or self-hosting minded organizations.",
  "bestForToolA": "Blackboard Learn best fits large, established colleges and universities with complex multi campus administration needs that want built-in accessibility checking through Ally and an integrated virtual classroom via Collaborate.",
  "bestForToolB": "Canvas LMS best fits institutions and individual educators who want a modern interface, flexible deployment options ranging from free self-hosting to a fully managed cloud plan, and a broad third party integration ecosystem.",
  "whoNeedsBoth": "Large university systems that absorbed campuses or programs already standardized on the other platform, or ed-tech consultants and integrators supporting institutions mid-migration between LMS platforms, may need working knowledge of both.",
  "keyDifferences": [
    {
      "title": "Founding and market history",
      "toolA": "Founded in 1997, giving Blackboard Learn the longest running presence in the higher education LMS market",
      "toolB": "Founded in 2008 by Instructure, entering the market after cloud computing had matured",
      "whyItMatters": "A longer institutional history often means deeper legacy integrations, while a newer platform is more likely to be architected around modern cloud-first design from the start",
      "benefitsWho": "Large legacy institutions with entrenched processes favor Blackboard's maturity; newer adopters favor Canvas's modern-era design"
    },
    {
      "title": "Ownership structure",
      "toolA": "Owned and developed by Anthology following the 2021 merger of Blackboard and Anthology",
      "toolB": "Developed by Instructure, a standalone company focused on Canvas and adjacent ed-tech products",
      "whyItMatters": "Ownership affects product roadmap focus and how resources are split across a portfolio of products versus a single core platform",
      "benefitsWho": "Institutions wanting a company singularly focused on the LMS may prefer Instructure's structure behind Canvas"
    },
    {
      "title": "Course interface transition",
      "toolA": "Offers two course views, the newer Ultra course view and the older Original view, with institutions still migrating between them",
      "toolB": "Offers a single modern Modules and Course Design interface without a documented legacy interface to migrate away from",
      "whyItMatters": "Running two interfaces side by side can create inconsistent training and support needs for staff and students",
      "benefitsWho": "Institutions that want one consistent modern interface out of the box benefit from Canvas; institutions already invested in Blackboard workflows may be mid-migration to Ultra"
    },
    {
      "title": "Free and low cost entry points",
      "toolA": "No documented free tier; SaaS, Managed Hosting, and Self-Hosted plans are all custom quote only",
      "toolB": "Offers Canvas Free-for-Teacher for individual educators and a free self-hosted Canvas Open Source edition alongside the paid institutional plan",
      "whyItMatters": "Free or low-friction entry points let individual educators or small programs start without a procurement process",
      "benefitsWho": "Individual teachers and cost-sensitive small programs favor Canvas; large institutions with existing procurement processes are less affected"
    },
    {
      "title": "Live virtual classroom tooling",
      "toolA": "Includes Blackboard Collaborate, a built-in virtual classroom and video conferencing tool integrated directly into courses",
      "toolB": "Documented facts describe Canvas Studio for video creation and hosting, not a native live virtual classroom; LTI integrations can connect tools like Zoom instead",
      "whyItMatters": "A native live classroom tool removes the need to license and configure a separate conferencing product for synchronous sessions",
      "benefitsWho": "Institutions wanting an all-in-one live class tool favor Blackboard; institutions already standardized on Zoom or Microsoft Teams may prefer Canvas's integration-based flexibility"
    },
    {
      "title": "Built-in accessibility tooling",
      "toolA": "Includes Blackboard Ally integration for automated accessibility checks on course content and alternative format generation for students",
      "toolB": "Documented facts do not confirm an equivalent native accessibility-checking or alternative-format tool",
      "whyItMatters": "Automated accessibility remediation is important for institutions under compliance mandates like ADA or Section 508",
      "benefitsWho": "Institutions with strict accessibility compliance requirements benefit from Blackboard's documented Ally integration"
    },
    {
      "title": "Cross-course content sharing",
      "toolA": "Documented facts do not confirm a shared repository for reusing course content across an institution",
      "toolB": "Includes Canvas Commons, a shared repository for publishing and reusing course modules, assessments, and resources across a system",
      "whyItMatters": "A shared content commons helps districts or multi-campus systems standardize curriculum and reduce duplicate course-building work",
      "benefitsWho": "Multi-school districts and systems that want to share curriculum centrally benefit from Canvas Commons"
    },
    {
      "title": "Mobile app structure",
      "toolA": "Provides a single native mobile app covering students and instructors",
      "toolB": "Provides three separate apps, Canvas Student, Canvas Teacher, and Canvas Parent, including a dedicated parent-facing app",
      "whyItMatters": "A dedicated parent app matters most to institutions or districts that need to give parents visibility into coursework and grades",
      "benefitsWho": "Institutions serving younger students or families that want direct parent access favor Canvas's dedicated Parent app"
    },
    {
      "title": "Self-hosting and open source access",
      "toolA": "Offers a Self-Hosted plan, but it is priced as a custom quote rather than a free open source codebase",
      "toolB": "Offers Canvas Open Source, a free, self-hosted, self-supported edition of the core LMS codebase",
      "whyItMatters": "A genuinely free open source option lets technically resourced institutions avoid ongoing licensing costs entirely",
      "benefitsWho": "Institutions with in-house technical administration capacity who want to avoid licensing fees favor Canvas Open Source"
    },
    {
      "title": "AI-assisted course tools",
      "toolA": "Documents generative AI features introduced by Anthology to help instructors with course design and content tasks",
      "toolB": "Documented facts do not confirm a native generative AI feature set",
      "whyItMatters": "Built-in AI assistance for course design can reduce instructor workload without requiring a separate third-party AI tool",
      "benefitsWho": "Institutions prioritizing built-in generative AI tooling for instructors favor Blackboard, based on documented facts"
    }
  ],
  "featureMatrix": [
    {
      "group": "Course Interface and Design",
      "rows": [
        {
          "feature": "Course view options",
          "toolA": "available",
          "toolB": "available",
          "note": "Blackboard offers dual Ultra and Original views; Canvas offers a single modern Modules and Course Design interface"
        },
        {
          "feature": "Conditional or adaptive content release",
          "toolA": "available",
          "toolB": "available",
          "note": "Blackboard uses rule-based adaptive release; Canvas uses Mastery Paths"
        },
        {
          "feature": "Shared content repository across courses",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Canvas Commons lets institutions publish and reuse course content"
        }
      ]
    },
    {
      "group": "Grading and Assessment",
      "rows": [
        {
          "feature": "Gradebook",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Rubric-based grading",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Online tests, quizzes, and question banks",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas documents this via Quizzes and New Quizzes with item analysis"
        },
        {
          "feature": "Dedicated submission annotation and feedback tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Canvas SpeedGrader supports audio, video, and inline feedback"
        }
      ]
    },
    {
      "group": "Communication and Collaboration",
      "rows": [
        {
          "feature": "Discussion boards and announcements",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Built-in live virtual classroom",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Blackboard includes Collaborate; Canvas facts describe Studio for video, not live conferencing"
        },
        {
          "feature": "Video creation and hosting tool",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Canvas Studio supports interactive video quizzes and time-stamped comments"
        }
      ]
    },
    {
      "group": "Accessibility",
      "rows": [
        {
          "feature": "Automated accessibility checking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Blackboard Ally integration"
        },
        {
          "feature": "Alternative format generation for students",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of Blackboard Ally integration"
        }
      ]
    },
    {
      "group": "Mobile Access",
      "rows": [
        {
          "feature": "Student mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Instructor mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": "Blackboard uses one combined app; Canvas has a separate Canvas Teacher app"
        },
        {
          "feature": "Parent-facing mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Canvas Parent app"
        }
      ]
    },
    {
      "group": "Integrations and APIs",
      "rows": [
        {
          "feature": "LTI standard support",
          "toolA": "available",
          "toolB": "available",
          "note": "Canvas documents LTI 1.3 specifically"
        },
        {
          "feature": "Open REST API",
          "toolA": "available",
          "toolB": "available",
          "note": "Blackboard via Building Blocks/REST API; Canvas via its open REST API"
        },
        {
          "feature": "Named third-party tool integrations (Zoom, Google Workspace, Microsoft 365, Turnitin)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Blackboard's facts mention publisher and SIS connections generally but do not name these specific tools"
        }
      ]
    },
    {
      "group": "Analytics and Reporting",
      "rows": [
        {
          "feature": "Course-level engagement analytics",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Institution-level dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "At-risk student identification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Canvas facts specifically mention identifying at-risk students"
        }
      ]
    },
    {
      "group": "Pricing and Access Options",
      "rows": [
        {
          "feature": "Free plan for individual educators",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Canvas Free-for-Teacher"
        },
        {
          "feature": "Free self-hosted open source edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Blackboard's Self-Hosted plan is custom quote, not free or open source"
        },
        {
          "feature": "Published public institutional pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales for a custom quote"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "Generative AI course design tools",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Introduced by Anthology for Blackboard Learn"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Blackboard Learn or Canvas LMS?",
      "answer": "Neither publishes standard institutional pricing since both use custom quotes, but Canvas documents free options, a Free-for-Teacher account and a self-hosted Open Source edition, that Blackboard Learn does not offer, making Canvas the more accessible choice for individual educators or budget-limited self-hosters."
    },
    {
      "question": "Is Canvas LMS good for beginners or first-time LMS administrators?",
      "answer": "Canvas's documented pros describe it as having a modern, intuitive interface that is generally easier to navigate than legacy LMS platforms, though its facts also note that effective use typically still requires a dedicated LMS administrator or IT support."
    },
    {
      "question": "Can Blackboard Learn do what Canvas LMS does?",
      "answer": "Both cover the same core LMS jobs, gradebook and assessment tools, discussion boards, mobile apps, and LTI and API integrations, but Blackboard Learn's documented feature set adds a built-in virtual classroom through Collaborate and accessibility checking through Ally, features not confirmed in Canvas's documented facts."
    },
    {
      "question": "Does Canvas LMS have a free version?",
      "answer": "Yes, per Instructure's documented facts, Canvas offers Canvas Free-for-Teacher for individual educators and a Canvas Open Source edition that can be self-hosted for free, alongside its paid Canvas by Instructure institutional plan; Blackboard Learn has no documented free tier."
    },
    {
      "question": "Which platform has better mobile apps?",
      "answer": "Canvas documents three dedicated apps, Canvas Student, Canvas Teacher, and Canvas Parent, giving it a native parent-facing option that Blackboard Learn's single combined student and instructor mobile app does not document."
    },
    {
      "question": "Who owns Blackboard Learn and Canvas LMS?",
      "answer": "Blackboard Learn is owned and developed by Anthology, following the 2021 merger of Blackboard and Anthology, while Canvas LMS is developed by Instructure, the company that launched it in 2008."
    }
  ]
};

export default blackboardLearnVsCanvasLmsContent;
