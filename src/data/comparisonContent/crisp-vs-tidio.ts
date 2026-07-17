import type { ToolComparisonContent } from './types';

const crispVsTidioContent: ToolComparisonContent = {
  "verdict": "Crisp and Tidio both bundle live chat, an AI agent, and multichannel messaging into a single subscription, but they are built for slightly different buyers. Crisp leans toward small teams that want one workspace to consolidate chat, a shared inbox, chatbots, a knowledge base, and email campaigns, backed by a genuinely permanent free plan for two seats and an omnichannel inbox spanning WhatsApp, Instagram, SMS, Line, and Viber once a team reaches the Essentials plan. Tidio leans toward ecommerce and support teams that want ticketing plus a chat widget out of the box, native Shopify, WooCommerce, and HubSpot integrations, and a free plan that already includes a one-time allotment of Lyro AI conversations to test the AI agent before paying. Crisp's AI features (Hugo, MagicReply, Copilot) are metered through AI credits bundled into each plan, while Tidio bills AI and Flows automation as usage-based add-ons on top of conversation-based plans, which can make total cost less predictable. Teams that want built-in marketing campaigns and a lightweight CRM alongside chat tend to fit Crisp better; teams selling online who need ready-made ecommerce integrations and structured ticketing tend to fit Tidio better. Neither is positioned for large enterprises with complex routing needs, both push those requirements to custom-priced top tiers rather than a full enterprise suite.",
  "bestForToolA": "Crisp fits small teams and agencies that want live chat, a shared inbox, a knowledge base, and email campaigns bundled into one workspace, especially those who value a permanent free plan for two seats with unlimited conversations.",
  "bestForToolB": "Tidio fits small ecommerce and online store teams that want native Shopify, WooCommerce, or BigCommerce integrations, built-in ticketing, and a free trial of its Lyro AI agent before committing to a paid plan.",
  "whoNeedsBoth": "A company running multiple properties, such as a marketing site and a separate online store, might use Crisp for broader support workflows and campaigns on one property and Tidio for storefront-specific integrations and cart-abandonment automation on the other, rather than standardizing on a single vendor.",
  "keyDifferences": [
    {
      "title": "Free plan structure",
      "toolA": "Crisp's Free plan is a permanent workspace for 2 seats with unlimited conversations, mobile and desktop apps, and API access.",
      "toolB": "Tidio's Free plan caps usage at 50 billable conversations per month, includes 10 seats, and gives only a one-time allotment of 50 Lyro AI conversations.",
      "whyItMatters": "Crisp's free tier has no conversation cap, so a small team can rely on it indefinitely, while Tidio's free tier is bounded by conversation volume and offers AI only as a one-time trial.",
      "benefitsWho": "Low-volume teams that want an ongoing free workspace benefit more from Crisp; teams that just want to briefly trial an AI agent benefit from Tidio's one-time Lyro allotment."
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "Crisp's first paid plan, Mini, starts at $45/month for 4 seats with $5 in AI credits included.",
      "toolB": "Tidio's first paid plan, Starter, starts at about $24.17/month for 10 seats but caps usage at 100 billable conversations per month.",
      "whyItMatters": "Tidio's entry price is lower and includes more seats, but its conversation cap could force an early upgrade for teams with higher chat volume, while Crisp's fewer seats come with unlimited conversations.",
      "benefitsWho": "Cost-sensitive teams with low chat volume and many agents may prefer Tidio's Starter plan; teams with high conversation volume but fewer agents may prefer Crisp's unlimited-conversation Mini plan."
    },
    {
      "title": "Ticketing and help desk access",
      "toolA": "Crisp only adds a dedicated ticketing system on its Plus plan at $295/month, alongside the shared inbox.",
      "toolB": "Tidio documents helpdesk ticketing as a core feature in its base feature set rather than gating it to a top-tier plan.",
      "whyItMatters": "Teams that need formal ticket tracking without paying for Crisp's top plan may find ticketing more accessible earlier on Tidio's pricing ladder.",
      "benefitsWho": "Budget-conscious support teams needing ticketing benefit from Tidio; teams comfortable waiting until they scale to a larger workspace can get ticketing from Crisp's Plus plan."
    },
    {
      "title": "Native ecommerce integrations",
      "toolA": "Crisp's documented integrations center on a general developer API and mobile and desktop apps, without named ecommerce platform connectors in the provided facts.",
      "toolB": "Tidio documents native integrations with Shopify, WooCommerce, BigCommerce, HubSpot, Klaviyo, Mailchimp, and Google Analytics.",
      "whyItMatters": "Online stores that want plug-and-play integration with their storefront and marketing stack have named, native connectors documented for Tidio, whereas Crisp's ecommerce-specific integrations are not documented.",
      "benefitsWho": "Ecommerce sellers benefit from Tidio's documented native integrations; teams needing custom integrations regardless of platform can build on Crisp's developer API."
    },
    {
      "title": "AI agent billing model",
      "toolA": "Crisp's Hugo AI agent and MagicReply are metered through AI credits bundled into each plan, ranging from $5 on Mini up to $75 on Plus.",
      "toolB": "Tidio's Lyro AI agent is billed separately from the base plan as a usage-based add-on on top of conversation limits, per its documented cons.",
      "whyItMatters": "Crisp bundles a fixed AI credit allotment into the plan price, which is more predictable, while Tidio's separate AI billing can make total monthly cost harder to forecast.",
      "benefitsWho": "Budget-conscious teams that want predictable AI costs may prefer Crisp's bundled credits; teams that only need AI occasionally may prefer Tidio's separate add-on model to avoid paying for capacity they do not use."
    },
    {
      "title": "Omnichannel messaging coverage",
      "toolA": "Crisp's omnichannel inbox spans WhatsApp, Instagram DMs, SMS, Line, and Viber, available starting on its Essentials plan at $95/month.",
      "toolB": "Tidio's multichannel inbox covers website chat, email, Instagram, Facebook Messenger, and WhatsApp.",
      "whyItMatters": "Crisp documents a wider spread of channels, including Line and Viber, which matters for international audiences, while Tidio documents Facebook Messenger, which Crisp's facts do not list.",
      "benefitsWho": "Teams targeting Southeast Asian markets may value Crisp's Line and Viber support; teams relying on Facebook Messenger as a primary channel may value Tidio's native Messenger integration."
    },
    {
      "title": "Built-in marketing and CRM tools",
      "toolA": "Crisp includes behavior-triggered email Campaigns and a lightweight CRM with customer profiles, notes, and segments as native features.",
      "toolB": "Tidio's documented facts do not describe a built-in email campaign tool or an equivalent lightweight CRM.",
      "whyItMatters": "Teams wanting to run lifecycle email campaigns and track customer context without a separate CRM tool have that capability documented in Crisp but not in Tidio.",
      "benefitsWho": "Small teams wanting an all-in-one messaging and lifecycle marketing tool benefit from Crisp; teams already using a separate CRM or email platform may not need this from either tool."
    },
    {
      "title": "Automation builder focus",
      "toolA": "Crisp offers a drag-and-drop Workflow Automation Builder aimed at triaging FAQs, qualifying leads, and auto-assigning conversations.",
      "toolB": "Tidio offers a no-code Flows Automation Builder for chatbot trees and behavior-triggered automations like cart abandonment prompts and lead capture, with visitor caps tied to plan tier from 100 up to 100,000 Flows visitors per month.",
      "whyItMatters": "Both provide visual no-code builders, but Tidio explicitly documents cart-recovery automation aimed at ecommerce, while Crisp's builder is framed around support routing; Tidio's Flows also carries plan-based visitor-count limits.",
      "benefitsWho": "Ecommerce teams wanting cart-recovery style automation benefit from Tidio's Flows; support-focused teams wanting FAQ triage and routing benefit from Crisp's Workflow Builder."
    },
    {
      "title": "Company origin and headquarters",
      "toolA": "Crisp was founded in 2015 and is headquartered in Nantes, France.",
      "toolB": "Tidio was founded in 2013 and is headquartered in San Francisco, California, with additional offices in Warsaw and Szczecin, Poland.",
      "whyItMatters": "Neither headquarters location restricts who can use the product, but it can matter for teams prioritizing data residency or support timezone alignment with a Europe-based versus US-based vendor.",
      "benefitsWho": "European teams may lean toward Crisp's EU base for data residency comfort; US-based teams may lean toward Tidio's US headquarters for timezone-aligned support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Messaging and Chat",
      "rows": [
        {
          "feature": "Live chat widget",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shared team inbox",
          "toolA": "available",
          "toolB": "available",
          "note": "Tidio documents this as a unified inbox across chat, email, and social channels"
        },
        {
          "feature": "Shared email inbox management",
          "toolA": "available",
          "toolB": "available",
          "note": "Crisp's shared email inbox and custom domain are on the Mini plan and above"
        },
        {
          "feature": "Live video calling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tidio's Starter plan and above include live video calls"
        }
      ]
    },
    {
      "group": "AI Agents",
      "rows": [
        {
          "feature": "AI customer-facing agent",
          "toolA": "available",
          "toolB": "available",
          "note": "Crisp's Hugo and Tidio's Lyro both answer from a knowledge base and hand off to humans"
        },
        {
          "feature": "AI credits included in base plan pricing",
          "toolA": "available",
          "toolB": "limited",
          "note": "Crisp bundles AI credits per plan; Tidio's free plan gives only a one-time 50-conversation Lyro allotment, then bills AI separately"
        },
        {
          "feature": "Internal AI assistant for human agents",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp's Copilot suggests replies and surfaces help content to agents"
        },
        {
          "feature": "Confidence-threshold AI replies",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp's MagicReply limits incorrect replies via a configurable threshold"
        }
      ]
    },
    {
      "group": "Omnichannel and Multichannel Messaging",
      "rows": [
        {
          "feature": "WhatsApp",
          "toolA": "available",
          "toolB": "available",
          "note": "Crisp requires the Essentials plan or above"
        },
        {
          "feature": "Instagram direct messages",
          "toolA": "available",
          "toolB": "available",
          "note": "Crisp requires the Essentials plan or above"
        },
        {
          "feature": "Facebook Messenger",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SMS, Line, and Viber",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp requires the Essentials plan or above"
        }
      ]
    },
    {
      "group": "Automation and Chatbots",
      "rows": [
        {
          "feature": "No-code chatbot and workflow builder",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Lead capture and FAQ triage automation",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Cart abandonment automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented specifically for Tidio's Flows builder"
        }
      ]
    },
    {
      "group": "Ticketing and Help Desk",
      "rows": [
        {
          "feature": "Dedicated ticketing system",
          "toolA": "limited",
          "toolB": "available",
          "note": "Crisp's ticketing is only on the Plus plan at $295/month; Tidio includes it as a core feature"
        },
        {
          "feature": "Self-service knowledge base",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp requires the Essentials plan or above"
        }
      ]
    },
    {
      "group": "Integrations and Extensibility",
      "rows": [
        {
          "feature": "Developer API",
          "toolA": "available",
          "toolB": "available",
          "note": "Tidio's is OpenAPI access on higher-tier plans"
        },
        {
          "feature": "Native ecommerce platform integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tidio documents Shopify, WooCommerce, and BigCommerce"
        },
        {
          "feature": "CRM and marketing tool integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tidio documents HubSpot, Klaviyo, Mailchimp, and Google Analytics"
        },
        {
          "feature": "White labeling or custom branding",
          "toolA": "available",
          "toolB": "available",
          "note": "Crisp on its Plus plan; Tidio custom branding on its Plus plan"
        }
      ]
    },
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "Mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Desktop apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multilingual support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Tidio documents widget language packs and a multilingual Lyro agent"
        }
      ]
    },
    {
      "group": "Marketing and Customer Data",
      "rows": [
        {
          "feature": "Email marketing campaigns",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp's Campaigns feature covers onboarding and lifecycle messaging"
        },
        {
          "feature": "Built-in lightweight CRM",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Crisp includes customer profiles, notes, and segments"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Crisp or Tidio?",
      "answer": "Tidio's entry-level paid plan is cheaper on paper at about $24.17/month versus Crisp's Mini plan at $45/month, but Tidio caps that plan at 100 billable conversations per month while Crisp's Mini plan has unlimited conversations, and Tidio bills its Lyro AI usage separately, so actual cost depends heavily on chat volume and AI usage."
    },
    {
      "question": "Is Crisp or Tidio better for an ecommerce store?",
      "answer": "Tidio is generally the better fit for ecommerce stores because it documents native integrations with Shopify, WooCommerce, and BigCommerce plus cart abandonment automation in its Flows builder, while Crisp's provided facts do not document ecommerce-specific integrations."
    },
    {
      "question": "Does Crisp or Tidio have a better free plan?",
      "answer": "Crisp's free plan is a permanent workspace for 2 seats with unlimited conversations and no expiration, while Tidio's free plan caps usage at 50 billable conversations per month and gives only a one-time 50-conversation allotment of its Lyro AI agent, so Crisp's free tier has less ongoing usage friction."
    },
    {
      "question": "Can Tidio's Lyro AI do what Crisp's Hugo does?",
      "answer": "Both are AI customer-facing agents that answer from a company's knowledge base and hand off unresolved conversations to a human, so their core function is comparable, though Crisp additionally documents MagicReply with a configurable confidence threshold and a separate Copilot tool for human agents that Tidio's documented feature set does not include."
    },
    {
      "question": "Which tool includes a full ticketing system at a lower price?",
      "answer": "Tidio includes helpdesk ticketing as a core documented feature across its plans, while Crisp only adds a dedicated ticketing system on its Plus plan at $295/month, making Tidio the more accessible option for teams that need ticketing without a large budget."
    },
    {
      "question": "Is Crisp or Tidio better for a small team just starting out?",
      "answer": "Crisp's permanent free plan and bundled feature set of chat, shared inbox, knowledge base, and campaigns once on a paid plan suit small teams that want one platform to grow into, while Tidio suits small ecommerce-focused teams that want ticketing and store integrations from day one, so the better starting point depends on whether the priority is broad messaging and marketing or ecommerce-specific workflows."
    }
  ]
};

export default crispVsTidioContent;
