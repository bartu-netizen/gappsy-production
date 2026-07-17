import type { ToolComparisonContent } from './types';

const hostingerVsNamecheapContent: ToolComparisonContent = {
  "verdict": "Hostinger is hosting-first, built around its Horizons AI website builder and higher-storage cloud/VPS tiers, while Namecheap is domain-first, bundling shared hosting with a personal VPN and PremiumDNS — the tradeoff is Hostinger's dedicated AI site-building product versus Namecheap's broader single-account bundle of domains, hosting, VPN, and DNS.",
  "bestForToolA": "Buyers wanting Horizons, an AI website builder that generates a full site from a text description, plus managed WordPress hosting, higher NVMe storage tiers, and AI-powered email marketing.",
  "bestForToolB": "Buyers who want domain registration as the primary purchase (900+ TLDs, competitive new-customer pricing) along with bundled extras like a consumer VPN and PremiumDNS, plus a 30-day free trial on shared hosting.",
  "whoNeedsBoth": "Someone could register a domain through Namecheap for its competitive new-customer domain pricing while hosting the site on Hostinger to use its AI builder and higher storage/backup tiers.",
  "keyDifferences": [
    {
      "title": "AI website-building depth",
      "toolA": "Hostinger Horizons is a dedicated AI product that generates a full site from a text description, with a free trial requiring no credit card.",
      "toolB": "Namecheap's Shared Hosting plan lists 'AI website builder tools' as a bundled feature line rather than a named standalone product.",
      "whyItMatters": "Buyers prioritizing AI-driven site creation may prefer a dedicated, purpose-built product over a bundled feature line.",
      "benefitsWho": "Non-technical founders wanting an AI tool that is the core offering, not an add-on."
    },
    {
      "title": "Domain-first vs. hosting-first focus",
      "toolA": "Domains are a free first-year add-on bundled with hosting plans, not the core product.",
      "toolB": "Domain registration is the core offering, with .com starting at $6.79/year for new customers across 900+ TLDs.",
      "whyItMatters": "Buyers who primarily need a domain, without hosting, are better served by a domain-first registrar.",
      "benefitsWho": "Domain-only buyers vs. buyers wanting hosting with a domain thrown in."
    },
    {
      "title": "Extra bundled services",
      "toolA": "No VPN or premium DNS product is documented.",
      "toolB": "Bundles its own consumer VPN service and PremiumDNS (priced under $5/year) alongside domains and hosting.",
      "whyItMatters": "Consolidating multiple services (domain, hosting, DNS, VPN) under one account reduces vendor sprawl.",
      "benefitsWho": "Privacy-conscious users wanting one account for domain, hosting, DNS, and VPN."
    },
    {
      "title": "Trial vs. money-back structure",
      "toolA": "Offers a 30-day money-back guarantee on hosting plans (pay first, refund if unsatisfied).",
      "toolB": "Shared Hosting includes a 30-day free trial before any payment is required.",
      "whyItMatters": "A free trial avoids upfront payment, while a money-back guarantee requires paying first and requesting a refund.",
      "benefitsWho": "Risk-averse buyers who prefer trying before paying."
    },
    {
      "title": "Storage and backup tiers",
      "toolA": "Top Cloud Startup plan offers 100GB NVMe storage with daily plus on-demand backups.",
      "toolB": "Shared Hosting plan features don't specify a storage size or backup frequency.",
      "whyItMatters": "Larger sites or higher site counts need clearer storage and backup guarantees.",
      "benefitsWho": "Growing sites that need more storage and backup assurance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Hosting & Website Building",
      "rows": [
        {
          "feature": "AI website builder",
          "toolA": "available",
          "toolB": "limited",
          "note": "Hostinger: dedicated Horizons product; Namecheap: listed as a Shared Hosting plan feature."
        },
        {
          "feature": "Managed WordPress hosting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free SSL bundled with hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Namecheap bundles 50 free Standard SSL certificates."
        },
        {
          "feature": "Cloud/VPS hosting",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Domains & Extras",
      "rows": [
        {
          "feature": "Domain registration",
          "toolA": "available",
          "toolB": "available",
          "note": "Hostinger: free first year with hosting; Namecheap: $6.79/year new-customer .com pricing across 900+ TLDs."
        },
        {
          "feature": "VPN service",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Premium/managed DNS",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PremiumDNS."
        }
      ]
    },
    {
      "group": "Pricing & Trials",
      "rows": [
        {
          "feature": "Entry promotional price",
          "toolA": "available",
          "toolB": "available",
          "note": "Hostinger $2.99/month promo (renews $10.99); Namecheap Shared Hosting free for 30 days."
        },
        {
          "feature": "Free trial (no payment required)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Hostinger: 30-day money-back guarantee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does Hostinger cost?",
      "answer": "Promotional pricing starts around $2.99/month for the Premium plan on a 48-month term, renewing at $10.99/month."
    },
    {
      "question": "What is Hostinger Horizons?",
      "answer": "It's an AI website builder that creates a site from a text description and offers a free trial with no credit card required."
    },
    {
      "question": "Does Namecheap offer a free trial?",
      "answer": "Yes, Shared Hosting plans include a 30-day free trial."
    },
    {
      "question": "How much does a .com domain cost on Namecheap?",
      "answer": "New customers can register a .com domain starting at $6.79 for the first year."
    },
    {
      "question": "Does Namecheap offer a VPN?",
      "answer": "Yes, Namecheap sells its own VPN service for securing devices and public Wi-Fi connections."
    },
    {
      "question": "Does Namecheap hosting include SSL?",
      "answer": "Yes, Shared Hosting plans include 50 free Standard SSL certificates for one year."
    }
  ]
};

export default hostingerVsNamecheapContent;
