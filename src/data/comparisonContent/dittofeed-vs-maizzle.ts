import type { ToolComparisonContent } from './types';

const dittofeedVsMaizzleContent: ToolComparisonContent = {
  "verdict": "Dittofeed is an open-source, embeddable customer engagement platform, freemium starting around $75, for automating email, SMS, mobile push, and WhatsApp with segmentation and a drag-and-drop journey builder; Maizzle is a free, open-source framework for developers to build the HTML email templates that platforms like Dittofeed can send. They sit at different layers -- orchestration and sending versus template authoring -- and are commonly used together rather than as substitutes.",
  "bestForToolA": "Dittofeed fits product and growth teams that want an open-source, optionally self-hosted engagement platform to automate cross-channel messaging (email via Resend, SMS via Twilio, WhatsApp) with low-code segmentation and journey building.",
  "bestForToolB": "Maizzle fits developers who need to hand-build well-structured, component-based, Tailwind-styled HTML email templates, regardless of which platform ultimately sends them.",
  "whoNeedsBoth": "A team could design and build its transactional and lifecycle email templates in Maizzle, then import and send them through Dittofeed's journey builder and Resend/Twilio integrations to automate multi-channel delivery.",
  "keyDifferences": [
    {
      "title": "Primary Function",
      "toolA": "Dittofeed automates and sends cross-channel messages (email, SMS, mobile push, WhatsApp) via a journey builder.",
      "toolB": "Maizzle builds the HTML email markup itself, with no sending capability documented.",
      "whyItMatters": "Buyers need to know whether they are picking a sending/orchestration tool or a template-authoring tool.",
      "benefitsWho": "Growth and lifecycle marketers benefit from Dittofeed; frontend and email developers benefit from Maizzle."
    },
    {
      "title": "Pricing Model",
      "toolA": "Dittofeed is freemium, starting around $75, with a free self-hosting option to keep cloud costs low.",
      "toolB": "Maizzle is entirely free and open source with no paid tier.",
      "whyItMatters": "Teams comparing total cost of ownership need to know Dittofeed has a paid cloud tier while Maizzle never does.",
      "benefitsWho": "Cost-sensitive teams that can self-host Dittofeed for free, or use Maizzle for free regardless of scale."
    },
    {
      "title": "Channel Coverage",
      "toolA": "Dittofeed sends SMS via Twilio and email via Resend, plus supports mobile push and WhatsApp per its description.",
      "toolB": "Not documented -- Maizzle has no send channels, only email markup output.",
      "whyItMatters": "Teams needing true multi-channel automation need Dittofeed's channel integrations, which Maizzle doesn't provide.",
      "benefitsWho": "Teams running coordinated email, SMS, WhatsApp, and push campaigns."
    },
    {
      "title": "Embeddability",
      "toolA": "Dittofeed offers embeddable UI components to add messaging features directly into another app.",
      "toolB": "Not documented for Maizzle, which is a build-time developer tool rather than an embeddable product surface.",
      "whyItMatters": "Vertical SaaS builders wanting native in-app messaging need Dittofeed's embedded components specifically.",
      "benefitsWho": "SaaS product teams building customer-facing messaging features into their own app."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Dittofeed offers a free self-hosting option to reduce cloud costs, alongside its hosted freemium tier.",
      "toolB": "Maizzle is a local development framework by nature -- there is no hosting concept since it only generates static HTML.",
      "whyItMatters": "Infrastructure cost and control considerations differ; Dittofeed's self-host option is a cost lever, while Maizzle has no server component at all.",
      "benefitsWho": "Engineering teams wanting to avoid recurring SaaS fees for sending infrastructure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Template Authoring",
      "rows": [
        {
          "feature": "Component-based HTML email templating",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tailwind CSS styling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free, open-source dev framework",
          "toolA": "available",
          "toolB": "available",
          "note": "Both are open source, but Dittofeed's is a freemium hosted product with a free self-host option"
        }
      ]
    },
    {
      "group": "Sending & Orchestration",
      "rows": [
        {
          "feature": "Email sending",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Via Resend"
        },
        {
          "feature": "SMS sending",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Via Twilio"
        },
        {
          "feature": "Mobile push / WhatsApp",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Drag-and-drop journey builder",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Data & Deployment",
      "rows": [
        {
          "feature": "Low-code audience segmentation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Maizzle is entirely free and open source"
        },
        {
          "feature": "Embeddable UI components",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Maizzle send the emails it builds?",
      "answer": "No, Maizzle only develops and builds HTML email markup; a platform like Dittofeed is needed to actually send and automate delivery."
    },
    {
      "question": "Is Dittofeed free like Maizzle?",
      "answer": "Dittofeed is freemium (starting around $75) but offers a free self-hosting option; Maizzle is entirely free and open source with no paid tier."
    },
    {
      "question": "What channels does Dittofeed support beyond email?",
      "answer": "Dittofeed sends SMS via Twilio, email via Resend, and also supports mobile push and WhatsApp automation."
    },
    {
      "question": "Does Maizzle offer audience segmentation like Dittofeed?",
      "answer": "No, segmentation isn't part of Maizzle's documented features -- it's a template-building framework, while Dittofeed provides low-code segmentation and a journey builder."
    },
    {
      "question": "Can Dittofeed be embedded into another product?",
      "answer": "Yes, Dittofeed offers embeddable UI components to add messaging features directly into another app, which is particularly relevant for vertical SaaS."
    }
  ]
};

export default dittofeedVsMaizzleContent;
