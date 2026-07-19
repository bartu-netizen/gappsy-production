import type { GroupComparisonContent } from './types';

const canvasLmsVsMoodleVsThinkificPlusContent: GroupComparisonContent = {
  "verdict": "Canvas LMS and Moodle are both traditional, institution-grade learning management systems built around gradebooks, assignments, and academic-style course delivery, with Canvas offering a polished commercial hosted product alongside a free open-source release, and Moodle offering the broadest, entirely free self-hosted core with the largest global community. Thinkific Plus takes a different angle, built from a course-commerce foundation and aimed at organizations selling or distributing training to external audiences at scale, with native CRM integrations and bulk checkout that Canvas and Moodle do not offer. None is free-and-hosted at the enterprise tier: Canvas and Moodle charge only for hosted or enterprise versions while remaining free to self-host, and Thinkific Plus is exclusively custom-quoted.",
  "bestFor": {
    "canvas-lms": "Accredited schools, universities, and training organizations that want either a deeply integrated commercial hosted LMS or a free, self-hostable open-source alternative with an extensive API and LTI ecosystem.",
    "moodle": "Cost-conscious institutions and organizations that want a fully free, self-hosted, highly customizable LMS with the largest global community and 100+ language support, scaling up to Moodle Workplace for enterprise needs.",
    "thinkific-plus": "Organizations selling or delivering courses commercially at scale, such as corporate training or customer and partner education, that need multi-site management, CRM integrations, and bulk B2B checkout rather than a traditional academic gradebook-first LMS."
  },
  "highlights": [
    {
      "title": "Two open-source options, one commerce-first platform",
      "description": "Canvas LMS and Moodle can both be self-hosted for free under open-source licenses (AGPLv3 and GPL respectively), while Thinkific Plus has no free or self-hosted tier and is sold entirely on custom quotes.",
      "toolSlugs": [
        "canvas-lms",
        "moodle",
        "thinkific-plus"
      ]
    },
    {
      "title": "Moodle has the largest global community and language support",
      "description": "Moodle is translated into more than 100 languages by volunteer contributors and has one of the largest install bases of any LMS.",
      "toolSlugs": [
        "moodle"
      ]
    },
    {
      "title": "Canvas has the deepest integration ecosystem for institutions",
      "description": "Canvas's REST API, with several hundred endpoints, and its LTI support connect to more than 1,000 third-party educational tools.",
      "toolSlugs": [
        "canvas-lms"
      ]
    },
    {
      "title": "Thinkific Plus is built for selling training, not just delivering it",
      "description": "Features like bulk B2B checkout, native CRM integrations with Salesforce and HubSpot, and multi-site management target organizations monetizing or distributing courses externally.",
      "toolSlugs": [
        "thinkific-plus"
      ]
    },
    {
      "title": "Enterprise tiers all require a sales conversation",
      "description": "Canvas's institutional hosting, Moodle Workplace, and Thinkific Plus are all custom-quoted rather than published with self-serve pricing.",
      "toolSlugs": [
        "canvas-lms",
        "moodle",
        "thinkific-plus"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted open-source option",
          "statuses": {
            "canvas-lms": "available",
            "moodle": "available",
            "thinkific-plus": "unavailable"
          }
        },
        {
          "feature": "Managed or enterprise hosted tier",
          "statuses": {
            "canvas-lms": "available",
            "moodle": "available",
            "thinkific-plus": "available"
          },
          "note": "All three enterprise tiers are custom-quoted rather than published self-serve pricing."
        }
      ]
    },
    {
      "group": "Academic Delivery",
      "rows": [
        {
          "feature": "Gradebook and academic assessment tools",
          "statuses": {
            "canvas-lms": "available",
            "moodle": "available",
            "thinkific-plus": "not-documented"
          }
        },
        {
          "feature": "Competency or mastery-based learning paths",
          "statuses": {
            "canvas-lms": "available",
            "moodle": "not-documented",
            "thinkific-plus": "available"
          },
          "note": "Canvas offers Mastery Paths; Thinkific Plus offers SCORM-based learning-path sequencing."
        }
      ]
    },
    {
      "group": "Commerce and Enterprise Integration",
      "rows": [
        {
          "feature": "Native CRM integrations for sales or marketing workflows",
          "statuses": {
            "canvas-lms": "not-documented",
            "moodle": "limited",
            "thinkific-plus": "available"
          },
          "note": "Moodle Workplace offers HRIS integrations for enterprise training, not a dedicated CRM connector; Thinkific Plus integrates natively with Salesforce and HubSpot."
        },
        {
          "feature": "Bulk or B2B course-selling checkout",
          "statuses": {
            "canvas-lms": "not-documented",
            "moodle": "not-documented",
            "thinkific-plus": "available"
          }
        }
      ]
    },
    {
      "group": "Reach and Ecosystem",
      "rows": [
        {
          "feature": "Multi-language interface",
          "statuses": {
            "canvas-lms": "not-documented",
            "moodle": "available",
            "thinkific-plus": "not-documented"
          },
          "note": "Moodle documents translation into 100+ languages via its AMOS platform."
        },
        {
          "feature": "Large third-party plugin or integration ecosystem",
          "statuses": {
            "canvas-lms": "available",
            "moodle": "available",
            "thinkific-plus": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I use any of these for free?",
      "answer": "Yes, Canvas LMS and Moodle can both be self-hosted for free under open-source licenses, AGPLv3 for Canvas and GPL for Moodle. Thinkific Plus has no free or self-serve tier; it is sold only as a custom-quoted enterprise product."
    },
    {
      "question": "Which is best for a university or K-12 school?",
      "answer": "Canvas LMS and Moodle are both purpose-built for academic institutions, with gradebooks, assignments, and academic-style course structures. Thinkific Plus is built more for organizations selling or distributing training externally rather than running an academic term-based curriculum."
    },
    {
      "question": "Which is best for corporate training or customer education?",
      "answer": "Thinkific Plus is explicitly built for corporate training, partner training, and customer education at scale, with native CRM integrations and bulk B2B checkout. Moodle Workplace also targets corporate and government training with compliance tracking and HRIS integrations, while Canvas is more institution-education focused."
    },
    {
      "question": "How do their integration ecosystems compare?",
      "answer": "Canvas has one of the most extensively documented LMS APIs, connecting to 1,000+ third-party tools via LTI. Moodle has a large community plugin ecosystem. Thinkific Plus focuses on native CRM integrations with Salesforce and HubSpot rather than a broad plugin marketplace."
    },
    {
      "question": "Is pricing published for any of these?",
      "answer": "No. Canvas's institutional hosted pricing, Moodle Workplace pricing, and Thinkific Plus pricing are all custom-quoted and require contacting sales; only the free self-hosted versions of Canvas and Moodle avoid a sales conversation entirely."
    },
    {
      "question": "Which has the broadest language support?",
      "answer": "Moodle, translated into more than 100 languages by volunteer contributors through its AMOS translation platform, has the broadest documented multi-language support of the three."
    }
  ]
};

export default canvasLmsVsMoodleVsThinkificPlusContent;
