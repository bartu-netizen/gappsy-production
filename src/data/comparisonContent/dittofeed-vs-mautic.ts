import type { ToolComparisonContent } from './types';

const dittofeedVsMauticContent: ToolComparisonContent = {
  "verdict": "Dittofeed is an embeddable, open-source customer engagement platform built for product teams (especially vertical SaaS) who want to add email, SMS, mobile push, and WhatsApp messaging directly into their own app via embeddable UI components. Mautic is a broader, more established open-source marketing automation platform with a built-in landing page builder and lead-scoring engine, aimed at marketing teams running nurture campaigns rather than developers embedding messaging into a product. Both are self-hostable and open source, but they solve different jobs: in-product engagement infrastructure versus a full external marketing automation suite.",
  "bestForToolA": "Product and engineering teams, especially vertical SaaS builders, who want to embed messaging (email, SMS, push, WhatsApp) directly into their app using Dittofeed's embeddable UI components and low-code segmentation, starting from $75/month or free self-hosted.",
  "bestForToolB": "Marketing teams that need a full external marketing automation suite with a drag-and-drop landing page builder, lead scoring, and omnichannel campaigns (email, SMS, WhatsApp), and want open-source ownership of campaign data, whether self-hosted for free or via managed hosting starting at €247.50/month.",
  "whoNeedsBoth": "A vertical SaaS company could run Mautic to nurture and convert prospects with landing pages and lead scoring before they sign up, then use Dittofeed's embeddable components to power in-app messaging (onboarding emails, push notifications, WhatsApp alerts) for customers once they're inside the product.",
  "keyDifferences": [
    {
      "title": "Product Focus",
      "toolA": "Dittofeed is built around embeddable UI components that let developers add messaging features directly into another app, positioned for vertical SaaS use cases.",
      "toolB": "Mautic is a standalone marketing automation platform with its own campaign builder, aimed at marketing teams running nurture campaigns from outside the product.",
      "whyItMatters": "Teams need to know whether they're buying infrastructure to embed in their own product or a self-contained marketing tool they operate separately.",
      "benefitsWho": "Developers at SaaS companies who want engagement features inside their own app rather than a separate marketing console."
    },
    {
      "title": "Landing Pages",
      "toolA": "Dittofeed's documented features do not include a landing page builder; its focus is on email, SMS, push, and WhatsApp journeys.",
      "toolB": "Mautic includes a mobile-optimized email and landing page builder as a core feature.",
      "whyItMatters": "Marketing teams that need to capture leads via standalone landing pages require that capability built in rather than bolted on.",
      "benefitsWho": "Marketers running top-of-funnel lead capture campaigns."
    },
    {
      "title": "Pricing & Self-Hosting",
      "toolA": "Dittofeed starts at $75/month with a free self-hosting option to keep cloud costs low.",
      "toolB": "Mautic's Community Edition is free to self-host; official managed hosting via Dropsolid starts at €247.50/month and scales to €1,237/month for the Professional tier.",
      "whyItMatters": "The cost of getting started and the cost of scaling to higher volume differ significantly between the two.",
      "benefitsWho": "Budget-conscious teams comparing entry-level hosted pricing versus self-hosted cost control."
    },
    {
      "title": "Embeddability",
      "toolA": "Dittofeed explicitly ships embeddable UI components so messaging features can be added directly into another application's interface.",
      "toolB": "Mautic does not document embeddable UI components; it is used as a standalone marketing platform.",
      "whyItMatters": "Product teams building customer-facing messaging inside their own app need embeddable components, not a separate admin tool.",
      "benefitsWho": "Vertical SaaS product teams building in-app notification and messaging experiences."
    },
    {
      "title": "Ecosystem & Community Size",
      "toolA": "Dittofeed's own stated con is a smaller integration ecosystem than established commercial customer-messaging platforms, with documented integrations limited to Segment.io, Twilio, and Resend.",
      "toolB": "Mautic has a large established community, described as used by 200,000+ companies with 40,000+ companies participating in its community, plus a broader plugin ecosystem and full REST API.",
      "whyItMatters": "A larger ecosystem means more prebuilt integrations, documentation, and community troubleshooting support.",
      "benefitsWho": "Teams that want extensive third-party integrations and community support out of the box."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Messaging & Journeys",
      "rows": [
        {
          "feature": "Drag-and-drop journey/campaign builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Dittofeed: journey builder; Mautic: campaign builder"
        },
        {
          "feature": "Email, SMS, and WhatsApp channels",
          "toolA": "available",
          "toolB": "available",
          "note": "Dittofeed SMS via Twilio"
        },
        {
          "feature": "Mobile push notifications",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Landing page builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Lead scoring & nurturing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free self-hosting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Starting hosted price",
          "toolA": "available",
          "toolB": "available",
          "note": "Dittofeed from $75/mo; Mautic managed via Dropsolid from €247.50/mo"
        },
        {
          "feature": "Embeddable UI components",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations & Extensibility",
      "rows": [
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Segment.io integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Plugin/integration ecosystem",
          "toolA": "limited",
          "toolB": "available",
          "note": "Dittofeed cons note a smaller ecosystem than established platforms"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can both Dittofeed and Mautic be self-hosted for free?",
      "answer": "Yes. Dittofeed offers a free self-hosting option to keep cloud costs low, and Mautic's Community Edition is free and open source for self-hosting as well."
    },
    {
      "question": "Which tool has a landing page builder?",
      "answer": "Mautic includes a mobile-optimized email and landing page builder as a core feature. Dittofeed's documented feature set does not include landing pages; it focuses on email, SMS, push, and WhatsApp messaging journeys."
    },
    {
      "question": "Which tool is better for embedding messaging into my own SaaS product?",
      "answer": "Dittofeed, since it ships embeddable UI components specifically designed to add messaging features directly into another application, a use case Mautic does not document."
    },
    {
      "question": "How does pricing compare between Dittofeed and Mautic?",
      "answer": "Dittofeed starts at $75/month with a free self-hosting option. Mautic's core software is free to self-host, while its official managed hosting via Dropsolid starts at €247.50/month and scales up to €1,237/month for higher-volume Professional plans."
    },
    {
      "question": "Which platform has the larger community and ecosystem?",
      "answer": "Mautic, which is described as used by over 200,000 companies with 40,000+ participating in its community. Dittofeed's own documented con is a smaller integration ecosystem than established commercial customer-messaging platforms."
    },
    {
      "question": "Does either tool support WhatsApp messaging?",
      "answer": "Yes, both do. Dittofeed lists WhatsApp among its supported channels, and Mautic supports omnichannel messaging including email, SMS, and WhatsApp."
    }
  ]
};

export default dittofeedVsMauticContent;
