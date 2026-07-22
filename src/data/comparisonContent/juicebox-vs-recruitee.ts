import type { ToolComparisonContent } from './types';

const juiceboxVsRecruiteeContent: ToolComparisonContent = {
  "verdict": "Juicebox and Recruitee address different stages of hiring. Juicebox (PeopleGPT) is a sourcing tool for finding and reaching out to candidates across 800M+ profiles using natural-language search, with published pricing from $0 to $179/month. Recruitee (Tellent Recruitee), founded in 2015 and based in Amsterdam, is an applicant tracking system for managing pipelines, a branded careers site, and job distribution once candidates are in the process, with all pricing tiers listed as \"Contact for pricing.\" They cover complementary but distinct stages of the hiring funnel rather than competing directly.",
  "bestForToolA": "Recruiters who need to actively source and reach out to passive candidates via natural-language search, starting at $99/month for one seat with unlimited searches.",
  "bestForToolB": "Growing companies that need a full applicant tracking workflow -- branded careers site, multi-channel job posting, collaborative pipelines, and referral tracking -- for candidates already in their process.",
  "whoNeedsBoth": "A talent team could use Juicebox to proactively source passive candidates and then manage those candidates once added through Recruitee's pipelines, careers site, and interview scheduling -- a common sourcing-plus-ATS pairing -- though the facts don't confirm a direct integration between the two products.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Juicebox is a candidate sourcing tool for finding and reaching out to candidates not yet in a pipeline, via PeopleGPT natural-language search across 800M+ profiles.",
      "toolB": "Recruitee is an applicant tracking system for managing hiring pipelines, a careers site, and job distribution once candidates have applied or been added.",
      "whyItMatters": "Sourcing and pipeline management are different functions in the hiring funnel, and buyers should be clear on which gap they're filling.",
      "benefitsWho": "Talent acquisition leaders scoping whether they need a sourcing tool, an ATS, or both."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Juicebox publishes tiered pricing: Free ($0), Starter ($99/month), Growth ($179/month), and a custom Business tier.",
      "toolB": "All three Recruitee tiers -- Start, Advance, and Optimize -- are listed as \"Contact for pricing\" with no published numbers.",
      "whyItMatters": "Published pricing lets buyers estimate cost without a sales conversation, which matters for smaller teams evaluating options quickly.",
      "benefitsWho": "Budget-conscious teams that want to self-serve pricing information."
    },
    {
      "title": "AI Features",
      "toolA": "Juicebox's core product is PeopleGPT natural-language search, plus optional AI agents for continuous sourcing and outreach at $199/agent/month.",
      "toolB": "Recruitee includes an AI writing assistant on its entry Start plan and AI screening/matching assistants on the Advance and Optimize tiers.",
      "whyItMatters": "The type of AI feature differs -- sourcing/search automation versus job description writing and applicant screening.",
      "benefitsWho": "Teams wanting AI help finding candidates (Juicebox) versus AI help writing postings and screening applicants (Recruitee)."
    },
    {
      "title": "Careers Site and Job Distribution",
      "toolA": "No careers site or job posting feature is documented for Juicebox.",
      "toolB": "Recruitee includes a CareersHub builder (single-page on Start, multi-page on Advance and up) and multi-channel job board distribution from a single posting.",
      "whyItMatters": "A branded careers site and multi-channel distribution are core to attracting inbound applicants, not just sourcing outbound ones.",
      "benefitsWho": "Employer-branding-focused teams that need a public jobs page."
    },
    {
      "title": "Free Access",
      "toolA": "Juicebox offers a permanent Free plan with limited searches and AI email templates.",
      "toolB": "Recruitee offers a free trial with no credit card required, but no permanent free plan is documented.",
      "whyItMatters": "A permanent free tier allows ongoing light usage, while a trial is time-limited evaluation only.",
      "benefitsWho": "Very small teams or occasional users who don't want to commit to a paid plan."
    }
  ],
  "featureMatrix": [
    {
      "group": "Sourcing vs. Pipeline Management",
      "rows": [
        {
          "feature": "Natural-language candidate search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Juicebox PeopleGPT, 800M+ profiles"
        },
        {
          "feature": "Candidate pipeline management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Customizable drag-and-drop pipelines"
        },
        {
          "feature": "Careers site builder",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Recruitee's CareersHub"
        },
        {
          "feature": "Multi-channel job posting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Employee referral tracking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Recruitee's ReferralsHub, Advance tier and up"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Juicebox: $0/$99/$179/custom; Recruitee: all tiers \"Contact for pricing\""
        },
        {
          "feature": "Permanent free plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Free trial (no credit card)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI & Collaboration",
      "rows": [
        {
          "feature": "AI job description writing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Included on Recruitee's entry Start plan"
        },
        {
          "feature": "AI candidate screening/matching",
          "toolA": "limited",
          "toolB": "available",
          "note": "Juicebox's AI agents source and run outreach rather than screen inbound applicants; Recruitee's screening/matching assistants are on Advance tier and up"
        },
        {
          "feature": "Interview scheduling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Calendar-integrated in Recruitee"
        },
        {
          "feature": "ATS/CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Juicebox names 41 ATS/21 CRMs; Recruitee mentions integrations and SSO without naming specific systems"
        },
        {
          "feature": "Single sign-on",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Recruitee's Optimize tier"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Juicebox an ATS like Recruitee?",
      "answer": "No. Juicebox is a sourcing tool for finding and reaching out to candidates via natural-language search, while Recruitee is an applicant tracking system for managing hiring pipelines, careers pages, and job distribution."
    },
    {
      "question": "Does Recruitee publish its pricing?",
      "answer": "No, all three of Recruitee's tiers -- Start, Advance, and Optimize -- are listed as \"Contact for pricing\" with no published rates."
    },
    {
      "question": "Is there a free plan for either tool?",
      "answer": "Juicebox has a permanent Free plan at $0/seat/month with limited searches. Recruitee offers a free trial with no credit card required, but no permanent free plan is documented."
    },
    {
      "question": "Does Recruitee include AI features?",
      "answer": "Yes -- an AI writing assistant is included on the entry Start plan, and AI screening/matching assistants are available on the Advance and Optimize tiers."
    },
    {
      "question": "How many ATS/CRM integrations does Juicebox support?",
      "answer": "Juicebox integrates with 41 ATS platforms and 21 CRMs, including Lever, Greenhouse, Ashby, Workday, and Bullhorn."
    },
    {
      "question": "Can Juicebox and Recruitee be used together?",
      "answer": "Functionally they'd complement each other -- sourcing candidates in Juicebox and managing them through Recruitee's pipeline -- but the available facts don't document a direct integration between the two products."
    }
  ]
};

export default juiceboxVsRecruiteeContent;
