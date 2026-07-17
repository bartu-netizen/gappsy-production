import type { ToolComparisonContent } from './types';

const formcarryVsFormsparkContent: ToolComparisonContent = {
  "verdict": "Formcarry runs on recurring monthly subscriptions ($5-$80/month, billed annually) with team-member caps that grow by tier and a custom Enterprise SLA option. Formspark instead sells one-time, non-expiring data bundles — pay once for a pool of submissions rather than a recurring plan — with unlimited team members on every tier but no Enterprise option. The right pick depends on whether predictable recurring pricing or a pay-once model with unlimited seats matters more.",
  "bestForToolA": "Teams that want predictable monthly recurring pricing with tiers based on team size and, at the top end, a dedicated Enterprise plan with a 99.9% uptime SLA.",
  "bestForToolB": "Developers and small teams that prefer paying once for a non-expiring pool of submissions instead of a subscription, need unlimited team members from the free tier, and want broad framework support (React, Next.js, Webflow, static site generators).",
  "whoNeedsBoth": "An agency managing many small client sites might use Formspark's low-cost one-time bundles for low-traffic static sites while using Formcarry's subscription tiers — with more team members and an Enterprise SLA — for higher-volume client projects needing guaranteed uptime.",
  "keyDifferences": [
    {
      "title": "Subscription vs. one-time pricing",
      "toolA": "Recurring monthly plans (Starter $5/mo, Basic $15/mo, Premium $80/mo, billed annually) with submission caps that reset monthly.",
      "toolB": "One-time, non-expiring data bundles (e.g., $25 for 50,000 submissions and 100 forms) instead of a recurring subscription.",
      "whyItMatters": "Businesses with steady, predictable form volume may prefer a subscription; those with sporadic or one-off projects may prefer paying once.",
      "benefitsWho": "Recurring SaaS-style buyers versus freelancers or agencies running one-off client sites."
    },
    {
      "title": "Team member limits",
      "toolA": "Team members are capped per plan: 1 (BABY), 3 (Starter), 5 (Basic), 20 (Premium).",
      "toolB": "Unlimited team members on every plan, including the Free tier.",
      "whyItMatters": "Larger or distributed teams that need many collaborators without upgrading purely for seat count benefit from Formspark's model.",
      "benefitsWho": "Larger teams or agencies collaborating across many contributors."
    },
    {
      "title": "Multi-language support",
      "toolA": "Not documented — no multi-language support is mentioned.",
      "toolB": "Supports 10 languages, including English, Spanish, French, German, and Ukrainian.",
      "whyItMatters": "Sites serving non-English-speaking users need localized thank-you pages, emails, and error messages.",
      "benefitsWho": "International or multi-language websites."
    },
    {
      "title": "Framework/platform support",
      "toolA": "Works with plain HTML, jQuery, React, or Vue forms.",
      "toolB": "Supports 20+ frontend platforms including React, Next.js, Vue, Angular, Svelte, WordPress, Webflow, Hugo, Jekyll, and Astro.",
      "whyItMatters": "Teams on modern frameworks or static site generators get broader native support from Formspark.",
      "benefitsWho": "Developers using static site generators or newer frontend frameworks."
    },
    {
      "title": "Enterprise option",
      "toolA": "Custom Enterprise plan with a 99.9% uptime SLA and unlimited submissions/uploads.",
      "toolB": "Not offered — only Free and one Upgrade bundle are available.",
      "whyItMatters": "Businesses needing an SLA guarantee for high-volume, mission-critical forms only have that option with Formcarry.",
      "benefitsWho": "Larger businesses with uptime and support requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Form Handling",
      "rows": [
        {
          "feature": "Spam protection",
          "toolA": "available",
          "toolB": "available",
          "note": "Formcarry: built-in, 98.6% stated accuracy; Formspark: built-in plus optional Botpoison/reCAPTCHA/hCaptcha/Turnstile"
        },
        {
          "feature": "File uploads",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-language support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Formspark supports 10 languages"
        },
        {
          "feature": "Framework / platform support",
          "toolA": "limited",
          "toolB": "available",
          "note": "Formcarry: HTML/jQuery/React/Vue; Formspark: 20+ platforms"
        }
      ]
    },
    {
      "group": "Team & Access",
      "rows": [
        {
          "feature": "Team members on free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Formcarry: 1 team member; Formspark: unlimited"
        },
        {
          "feature": "Team members on paid plans",
          "toolA": "limited",
          "toolB": "available",
          "note": "Formcarry caps at 3/5/20 by tier; Formspark is unlimited on all plans"
        },
        {
          "feature": "Named integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Formcarry claims 3,000+; Formspark names Slack, Zapier, Make, and webhooks"
        }
      ]
    },
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Recurring subscription",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Formspark uses one-time bundles instead"
        },
        {
          "feature": "One-time non-expiring bundle",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom Enterprise tier",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Formcarry have a free plan?",
      "answer": "Yes, the BABY plan is free and includes 1 form and 50 submissions/month."
    },
    {
      "question": "Does Formspark have a free plan?",
      "answer": "Yes, every account includes a free tier with 250 submissions and 10 forms."
    },
    {
      "question": "How is Formcarry priced?",
      "answer": "Paid plans (Starter $5/mo, Basic $15/mo, Premium $80/mo) are billed annually, with a custom Enterprise option available."
    },
    {
      "question": "How does Formspark pricing work?",
      "answer": "Formspark uses one-time, non-expiring data bundles (e.g. $25 for 50,000 submissions and 100 forms) rather than recurring subscriptions."
    },
    {
      "question": "What frameworks does Formcarry support?",
      "answer": "Formcarry works with plain HTML, jQuery, React, and Vue forms."
    },
    {
      "question": "What platforms does Formspark support?",
      "answer": "Formspark supports 20+ platforms including React, Next.js, Vue, Angular, Svelte, WordPress, Webflow, Hugo, Jekyll, and Astro."
    }
  ]
};

export default formcarryVsFormsparkContent;
