import type { ToolComparisonContent } from './types';

const kitVsMailchimpContent: ToolComparisonContent = {
  "verdict": "Kit and Mailchimp both operate as freemium email marketing platforms, but they are built for different jobs. Kit is designed around the creator economy: its free plan supports up to 10,000 subscribers, an unusually generous ceiling, and every tier including the free one includes built-in digital product sales, letting a solo creator sell a course or ebook without adding separate tools. Its Pro tier adds Subscriber Signals to surface the most engaged audience members, reinforcing a focus on relationship depth over broad campaign complexity. Mailchimp takes a more general-purpose, contact-scaled approach: pricing rises with list size across Essentials, Standard, and Premium tiers, and its free plan is capped at 250 contacts and 500 sends per month, more of a trial than a real starting point. In exchange, Mailchimp offers AI-assisted content tools for building campaigns and, at the Premium tier, phone support with a dedicated onboarding specialist, features aimed at teams that want hands-on help rather than creator-specific monetization. Choosing between them comes down to what you are optimizing for: a creator monetizing a small but growing audience will get more from Kit's free-tier ceiling and built-in commerce, while a business managing a larger contact list that wants AI-assisted drafting and live support may find Mailchimp's structure a better match, even though costs climb faster as contacts grow.",
  "bestForToolA": "Individual creators and solopreneurs who want to grow an audience past 10,000 subscribers for free and sell digital products like courses or ebooks without adding separate commerce tools.",
  "bestForToolB": "Businesses and marketing teams that want AI-assisted campaign creation and are willing to accept contact-based pricing in exchange for phone support and a dedicated onboarding specialist at the Premium tier.",
  "whoNeedsBoth": "A creator-led business that outgrows a single audience-monetization tool may run Kit for digital product sales and audience engagement alongside Mailchimp for broader, AI-assisted campaign work or a larger contact list.",
  "keyDifferences": [
    {
      "title": "Free tier ceiling",
      "toolA": "Free plan supports up to 10,000 subscribers",
      "toolB": "Free plan is capped at 250 contacts and 500 sends per month",
      "whyItMatters": "Determines how long a user can grow an audience before ever paying",
      "benefitsWho": "Growing creators benefit from Kit; small testers benefit less from either but Mailchimp's cap arrives much sooner"
    },
    {
      "title": "Pricing basis",
      "toolA": "Paid tiers priced per 1,000 subscribers, starting at 33 dollars a month for Creator",
      "toolB": "Contact-based pricing that scales across Essentials, Standard, and Premium tiers, from a few hundred to over a million contacts",
      "whyItMatters": "Changes how predictable and how steep cost growth is as a list expands",
      "benefitsWho": "Small creators with modest lists may find Kit's flat per-tier pricing simpler to plan around"
    },
    {
      "title": "Core positioning",
      "toolA": "Built for creators to grow audiences, automate campaigns, and monetize",
      "toolB": "General email marketing and automation platform for campaigns and audience management",
      "whyItMatters": "Signals which product roadmap and feature set a buyer's use case aligns with",
      "benefitsWho": "Independent creators fit Kit's positioning; businesses running broader marketing programs fit Mailchimp's"
    },
    {
      "title": "Built-in digital product sales",
      "toolA": "Sell digital products directly, included in every tier including free",
      "toolB": "Not documented",
      "whyItMatters": "Removes the need for a separate storefront or commerce tool for creators selling courses, ebooks, or templates",
      "benefitsWho": "Creators monetizing directly through their email list"
    },
    {
      "title": "AI-assisted content tools",
      "toolA": "Not documented",
      "toolB": "AI features for campaign creation and content generation",
      "whyItMatters": "Can speed up campaign drafting for teams producing frequent sends",
      "benefitsWho": "Marketing teams that want help generating copy at volume"
    },
    {
      "title": "Audience engagement scoring",
      "toolA": "Subscriber Signals on the Pro tier identifies the most engaged audience members",
      "toolB": "Not documented",
      "whyItMatters": "Helps prioritize outreach and monetization toward the most responsive subscribers",
      "benefitsWho": "Creators who want to focus effort on their most engaged fans"
    },
    {
      "title": "SMS marketing availability",
      "toolA": "Available on Creator and Pro tiers",
      "toolB": "Send SMS campaigns alongside email",
      "whyItMatters": "Determines whether a single platform can cover both email and text outreach",
      "benefitsWho": "Users who want to consolidate email and SMS into one tool, on either platform"
    },
    {
      "title": "Premium support depth",
      "toolA": "Not documented",
      "toolB": "Premium tier includes phone support and a dedicated onboarding specialist",
      "whyItMatters": "Matters for teams that want hands-on help rather than self-serve documentation",
      "benefitsWho": "Larger organizations or less technical teams that value live support"
    },
    {
      "title": "Entry cost at low subscriber volume",
      "toolA": "Paid tiers start at a fairly high base of 33 dollars a month, pricier than some general-purpose email tools at low volume",
      "toolB": "Free plan is genuinely usable for testing before committing to a paid, contact-scaled tier",
      "whyItMatters": "Affects how much a very small list costs to start sending paid campaigns",
      "benefitsWho": "Users with tiny lists may find Mailchimp's free plan cheaper to start with, though Kit's free tier goes further before requiring payment"
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Kit free tier supports up to 10,000 subscribers; Mailchimp free plan caps at 250 contacts and 500 sends per month"
        },
        {
          "feature": "Contact or subscriber based pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Kit prices per 1,000 subscribers; Mailchimp scales by total contacts from a few hundred to over a million"
        },
        {
          "feature": "Number of paid tiers",
          "toolA": "available",
          "toolB": "available",
          "note": "Kit offers Creator and Pro; Mailchimp offers Essentials, Standard, and Premium"
        }
      ]
    },
    {
      "group": "Core Email Marketing",
      "rows": [
        {
          "feature": "Campaign automation",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Audience and contact management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Audience and Monetization",
      "rows": [
        {
          "feature": "Built-in digital product sales",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Kit includes this on every tier, including free"
        },
        {
          "feature": "Engaged subscriber identification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Kit's Subscriber Signals is limited to the Pro tier"
        }
      ]
    },
    {
      "group": "Messaging Channels",
      "rows": [
        {
          "feature": "Email campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SMS marketing",
          "toolA": "available",
          "toolB": "available",
          "note": "Kit limits SMS to Creator and Pro tiers"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI content generation for campaigns",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Support",
      "rows": [
        {
          "feature": "Phone support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on Mailchimp's Premium tier"
        },
        {
          "feature": "Dedicated onboarding specialist",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on Mailchimp's Premium tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Kit or Mailchimp?",
      "answer": "It depends on list size and usage: Kit's free plan covers up to 10,000 subscribers before any payment is needed, while Mailchimp's free plan caps at 250 contacts and 500 sends per month, though Kit's paid Creator tier starts at 33 dollars a month per 1,000 subscribers while Mailchimp's paid cost scales more gradually with contacts across its Essentials, Standard, and Premium tiers."
    },
    {
      "question": "Is Kit or Mailchimp better for creators just starting out?",
      "answer": "Kit is generally the better fit for creators starting out, since its free tier supports up to 10,000 subscribers and includes built-in digital product sales for monetizing directly from the free plan."
    },
    {
      "question": "Does Mailchimp have AI features?",
      "answer": "Yes, Mailchimp includes AI-assisted content tools for campaign creation and content generation; this is not documented as a feature of Kit."
    },
    {
      "question": "Can Kit send SMS messages?",
      "answer": "Yes, Kit supports SMS marketing, but only on its Creator and Pro tiers, not on the free Newsletter plan."
    },
    {
      "question": "Which platform has the more generous free plan?",
      "answer": "Kit has the more generous free plan, supporting up to 10,000 subscribers compared to Mailchimp's free plan limit of 250 contacts and 500 sends per month."
    },
    {
      "question": "Does Mailchimp offer phone support?",
      "answer": "Yes, Mailchimp's Premium tier includes phone support along with a dedicated onboarding specialist; phone support is not documented for Kit at any tier."
    }
  ]
};

export default kitVsMailchimpContent;
