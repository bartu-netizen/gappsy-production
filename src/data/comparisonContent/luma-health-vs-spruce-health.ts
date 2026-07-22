import type { ToolComparisonContent } from './types';

const lumaHealthVsSpruceHealthContent: ToolComparisonContent = {
  "verdict": "Luma Health and Spruce Health both serve healthcare organizations but automate different layers of the patient journey. Luma Health is an operational AI platform built around a core called Spark that automates referrals, intake, prior authorization, and payments across EHR-connected workflows, and it is trusted by 1,000+ organizations including Banner Health and UAMS. Spruce Health is a HIPAA-compliant communication platform focused on messaging, texting, video visits, and e-fax with transparent per-user pricing starting at $24/user/month. One replaces back-office operational workflows; the other replaces the phone system and fax machine for day-to-day patient communication.",
  "bestForToolA": "Larger healthcare organizations that need EHR-integrated automation of referrals, intake forms, eligibility verification, and prior authorization -- Luma Health lists direct integrations with Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech.",
  "bestForToolB": "Practices and clinics that need straightforward HIPAA-compliant texting, video visits, and e-fax without per-message charges, and want transparent pricing ($24/user/month Basic, $49/user/month Communicator) and a 14-day free trial with no credit card.",
  "whoNeedsBoth": "A multi-site health system could use Luma Health to automate referral routing, digital intake forms, and prior-authorization workflows tied into its EHR, while giving front-desk and clinical staff Spruce Health for real-time HIPAA-compliant texting, video visits, and e-fax with patients -- Luma Health does not document two-way texting or video visits, and Spruce does not document eligibility or prior-authorization automation.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Luma Health does not publish pricing; a sales conversation is required to get a quote.",
      "toolB": "Spruce Health publishes two tiers: Basic at $24/user/month and Communicator at $49/user/month, both billed month-to-month with annual contracts available.",
      "whyItMatters": "Buyers evaluating on a budget can immediately compare Spruce's cost, while Luma Health requires a sales cycle before any pricing is known.",
      "benefitsWho": "Small and mid-size practices that need to compare software costs quickly without a sales call."
    },
    {
      "title": "Core Product Focus",
      "toolA": "Luma Health centers on operational automation -- Agentic Access, Agentic Engagement, Agentic Intake, and Agentic Payments -- coordinated by an AI core called Spark.",
      "toolB": "Spruce Health centers on direct communication: secure messaging, two-way SMS texting, video telehealth visits, e-fax, and team messaging with tasks.",
      "whyItMatters": "The tools solve different problems: Luma automates back-office processes like referrals and prior auth, while Spruce replaces the phone, fax, and messaging tools front-line staff use every day.",
      "benefitsWho": "Operations leaders trying to reduce administrative workload (Luma Health) versus clinical and front-desk teams needing a unified inbox (Spruce Health)."
    },
    {
      "title": "EHR Integration Depth",
      "toolA": "Luma Health lists direct integrations with eight named EHR systems: Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech.",
      "toolB": "Spruce Health does not publicly document specific EHR integrations, though its Communicator plan includes general integrations and API access.",
      "whyItMatters": "Organizations that need patient data and workflows synced directly with a specific EHR will find Luma Health's named integration list far more decision-relevant.",
      "benefitsWho": "Hospital systems and multi-provider groups running Epic, Oracle Health, or similar enterprise EHR platforms."
    },
    {
      "title": "No-Code Customization",
      "toolA": "Luma Health includes a no-code workflow builder that lets healthcare teams build custom automated workflows without developer support.",
      "toolB": "Spruce Health does not document a no-code workflow builder or comparable customization tool.",
      "whyItMatters": "Teams that need to adapt automated processes (like intake sequences or waitlist rules) without engineering resources benefit from a no-code builder.",
      "benefitsWho": "Operations teams at healthcare organizations without dedicated developer support who still need custom automation logic."
    },
    {
      "title": "Free Trial and Entry Cost",
      "toolA": "Luma Health does not mention a free trial or free plan; pricing and access require contacting sales.",
      "toolB": "Spruce Health offers a 14-day free trial with no credit card required, covering all Basic plan features except SMS texting.",
      "whyItMatters": "A free trial lets smaller practices test the actual product before committing budget, which is not possible with Luma Health's sales-only model.",
      "benefitsWho": "Small practices and solo providers who want to self-evaluate a communication tool before paying."
    }
  ],
  "featureMatrix": [
    {
      "group": "Patient Communication",
      "rows": [
        {
          "feature": "Secure HIPAA-compliant messaging",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spruce: included on Basic ($24/user/month)"
        },
        {
          "feature": "Two-way SMS texting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spruce: requires one-time $19.50 registration fee"
        },
        {
          "feature": "Video telehealth visits",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Fax handling",
          "toolA": "available",
          "toolB": "available",
          "note": "Luma: fax processing under Agentic Access; Spruce: dedicated e-fax feature"
        },
        {
          "feature": "VoIP phone system",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Spruce: Communicator plan only ($49/user/month)"
        }
      ]
    },
    {
      "group": "Operational Automation & AI",
      "rows": [
        {
          "feature": "AI-driven digital intake forms",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Luma: Agentic Intake"
        },
        {
          "feature": "Eligibility verification / prior authorization automation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Luma: Agentic Payments"
        },
        {
          "feature": "No-code workflow builder",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Named EHR integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Luma: Epic, Oracle Health, MEDITECH, and 5 more"
        },
        {
          "feature": "AI-powered two-way translation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Publicly published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Spruce: $24 or $49 per user/month"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Spruce: 14 days, no credit card"
        },
        {
          "feature": "API access",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Spruce: Communicator plan only"
        },
        {
          "feature": "Digital payment collection",
          "toolA": "available",
          "toolB": "available",
          "note": "Luma: Agentic Payments; Spruce: digital payments feature"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Luma Health publish its pricing?",
      "answer": "No. Luma Health's pricing is not disclosed publicly and requires contacting sales for a quote."
    },
    {
      "question": "Can I try Spruce Health before paying?",
      "answer": "Yes, Spruce offers a 14-day free trial with no credit card required, though it excludes SMS texting until a paid plan is active."
    },
    {
      "question": "Which tool integrates with Epic or other major EHRs?",
      "answer": "Luma Health documents direct integrations with Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech. Spruce Health does not publish a specific EHR integration list."
    },
    {
      "question": "Does Spruce Health charge per text or per call?",
      "answer": "No, Spruce offers effectively unlimited texting, calling, and faxing with no per-use charges, aside from a one-time $19.50 SMS registration fee."
    },
    {
      "question": "Is Luma Health built for small clinics or large health systems?",
      "answer": "Luma Health's customer base of 1,000+ organizations, including Banner Health and UAMS, and its feature set around firm-wide automation suggest it is built primarily for larger healthcare organizations."
    },
    {
      "question": "Does either tool offer video visits?",
      "answer": "Spruce Health documents video telehealth visits as a core feature. Luma Health does not list video visits among its documented features."
    }
  ]
};

export default lumaHealthVsSpruceHealthContent;
