import type { GroupComparisonContent } from './types';

const chamiloLmsVsGibbonVsIliasContent: GroupComparisonContent = {
  "verdict": "Chamilo and ILIAS are purpose-built, SCORM/xAPI-compliant learning management systems focused on course delivery and assessment, while Gibbon is a broader self-hosted school management platform whose teaching tools sit alongside attendance, finance, and communication modules. All three are free, open-source, and self-hosted, so the right pick depends less on price and more on whether the priority is polished e-learning delivery (Chamilo), heavyweight assessment at large scale (ILIAS), or day-to-day school operations (Gibbon). None offers a fully managed SaaS option, so every option still requires server administration or a paid hosting partner.",
  "bestFor": {
    "chamilo-lms": "institutions that want a modern e-learning LMS with virtual classrooms, a sellable course catalog, and AI-assisted content and grading tools",
    "gibbon": "schools that need day-to-day school administration, attendance, finance, and communication in one system alongside basic teaching tools",
    "ilias": "universities and large public institutions that need a robust SCORM-compliant testing engine and can scale past 100,000 users"
  },
  "highlights": [
    {
      "title": "ILIAS is built for scale and rigorous assessment",
      "description": "ILIAS installations are reported to run from small departments up to well over 100,000 users, with a strong built-in question-pool and randomized/timed exam engine that reflects its academic testing heritage.",
      "toolSlugs": [
        "ilias"
      ]
    },
    {
      "title": "Chamilo leans into modern e-learning extras",
      "description": "Chamilo adds AI-assisted content creation and automated grading plus a course catalog with a built-in shopping cart, letting institutions sell course access directly, features not documented for Gibbon or ILIAS.",
      "toolSlugs": [
        "chamilo-lms"
      ]
    },
    {
      "title": "Gibbon covers whole-school operations, not just courses",
      "description": "Gibbon's 24-plus core modules include attendance tracking, a finance module for fees and billing, and a Fast Student Finder for behavioral and medical alerts, areas Chamilo and ILIAS do not cover.",
      "toolSlugs": [
        "gibbon"
      ]
    },
    {
      "title": "All three require self-hosting, with paid help available",
      "description": "None of the three is a managed SaaS product. Chamilo offers a paid Chamilo PRO services tier, ILIAS has a network of certified hosting and service providers, and Gibbon points schools to third-party PHP/MySQL hosts or contracted developers.",
      "toolSlugs": [
        "chamilo-lms",
        "gibbon",
        "ilias"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Learning and Assessment",
      "rows": [
        {
          "feature": "SCORM/xAPI compliant course packages",
          "statuses": {
            "chamilo-lms": "available",
            "gibbon": "unavailable",
            "ilias": "available"
          }
        },
        {
          "feature": "Full course authoring tools",
          "statuses": {
            "chamilo-lms": "available",
            "gibbon": "limited",
            "ilias": "available"
          },
          "note": "Gibbon offers lesson-planning Smart Blocks and homework tools rather than full e-learning course authoring."
        },
        {
          "feature": "Exam and assessment engine",
          "statuses": {
            "chamilo-lms": "available",
            "gibbon": "available",
            "ilias": "available"
          },
          "note": "ILIAS's question-pool, randomized and timed exam engine is the most assessment-focused of the three."
        },
        {
          "feature": "Virtual classroom or video conferencing",
          "statuses": {
            "chamilo-lms": "available",
            "gibbon": "unavailable",
            "ilias": "not-documented"
          }
        }
      ]
    },
    {
      "group": "School Administration",
      "rows": [
        {
          "feature": "Attendance tracking",
          "statuses": {
            "chamilo-lms": "unavailable",
            "gibbon": "available",
            "ilias": "unavailable"
          }
        },
        {
          "feature": "Finance and fee billing module",
          "statuses": {
            "chamilo-lms": "unavailable",
            "gibbon": "available",
            "ilias": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Scale and Deployment",
      "rows": [
        {
          "feature": "Documented support for 100,000-plus users",
          "statuses": {
            "chamilo-lms": "not-documented",
            "gibbon": "not-documented",
            "ilias": "available"
          }
        },
        {
          "feature": "Paid managed hosting or support option",
          "statuses": {
            "chamilo-lms": "available",
            "gibbon": "available",
            "ilias": "available"
          },
          "note": "Chamilo PRO, ILIAS certified providers, and third-party Gibbon hosts all offer paid help, but none is a first-party managed SaaS product."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is better for pure school administration like attendance and billing?",
      "answer": "Gibbon, since it was built as a school management platform with dedicated attendance and finance modules that Chamilo and ILIAS do not include."
    },
    {
      "question": "Which has the strongest assessment or testing engine?",
      "answer": "ILIAS, whose question-pool, randomized, and timed exam engine grew out of its origins as a university testing and content platform."
    },
    {
      "question": "Can any of these run without an in-house developer?",
      "answer": "All three are self-hosted software, so some technical setup is required either way. Chamilo PRO, ILIAS's certified service providers, and third-party Gibbon hosting or contractors can reduce that burden for a fee."
    },
    {
      "question": "Does any of these platforms include AI features?",
      "answer": "Chamilo is the only one of the three documented to include AI-assisted content creation and automated grading tools."
    },
    {
      "question": "Which scales best for a large university or public education system?",
      "answer": "ILIAS, which is reported to run installations from small departments up to well over 100,000 users."
    },
    {
      "question": "Are Chamilo, Gibbon, and ILIAS really free to use?",
      "answer": "Yes, all three are free, open-source software with no licensing fees. The real-world cost is hosting infrastructure and, optionally, paid support or managed hosting."
    }
  ]
};

export default chamiloLmsVsGibbonVsIliasContent;
