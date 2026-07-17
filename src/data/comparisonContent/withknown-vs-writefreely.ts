import type { ToolComparisonContent } from './types';

const withknownVsWritefreelyContent: ToolComparisonContent = {
  "verdict": "Known and WriteFreely are both open-source, IndieWeb-friendly publishing tools built for people who want to own their content rather than depend on a third-party platform, but they emphasize different parts of that mission. Known is a broader personal CMS for publishing blog posts, photos, and media to your own domain, with a documented DMCA takedown policy that signals real production use. WriteFreely narrows the focus to minimalist blogging with native ActivityPub/Fediverse integration, plus an optional managed hosting service run directly by the WriteFreely team for people who don't want to self-host.",
  "bestForToolA": "Known fits IndieWeb practitioners who want a single self-hosted home for mixed media - posts, photos, and other content - published on their own domain, backed by a formal copyright/DMCA process.",
  "bestForToolB": "WriteFreely fits writers who want a distraction-free, minimalist blogging experience that natively reaches Mastodon and other Fediverse followers, with the option to skip self-hosting via WriteFreely's managed hosting service.",
  "whoNeedsBoth": "A publisher could run Known as the primary IndieWeb hub for photos and mixed media while syndicating text posts through WriteFreely to tap its native Fediverse audience on Mastodon - though the facts don't document any built-in bridge between the two, so this would require manual cross-posting.",
  "keyDifferences": [
    {
      "title": "Hosting Options",
      "toolA": "Known's documented model is IndieWeb-aligned self-publishing on your own domain, with no managed hosting service mentioned.",
      "toolB": "WriteFreely offers a managed hosting option available directly from the WriteFreely team, in addition to self-hosting the open-source software.",
      "whyItMatters": "Whether a vendor offers turnkey hosting determines how much server-management work falls on the publisher.",
      "benefitsWho": "Non-technical writers who want to start blogging without running their own server benefit from WriteFreely's managed option."
    },
    {
      "title": "Fediverse/ActivityPub Integration",
      "toolA": "Known's short description emphasizes syndicating content to social networks, but ActivityPub/Fediverse support is not documented in the facts.",
      "toolB": "WriteFreely is built on ActivityPub, so posts can be followed and interacted with directly from Mastodon and other Fediverse platforms.",
      "whyItMatters": "Native Fediverse federation determines whether posts reach readers where they already follow accounts, versus requiring manual cross-posting.",
      "benefitsWho": "Writers who want their posts to show up natively in followers' Mastodon timelines benefit from WriteFreely's ActivityPub integration."
    },
    {
      "title": "Content Types Published",
      "toolA": "Known is described as publishing blog posts, photos, and media to your own site, positioning it as a broader personal CMS.",
      "toolB": "WriteFreely is described as a minimalist blogging platform, with no documented support for photo or media publishing beyond text posts.",
      "whyItMatters": "The range of supported content types determines whether a single tool can serve as a full personal media hub or just a text-focused blog.",
      "benefitsWho": "Publishers who want to post photos and mixed media alongside text benefit from Known's broader content model."
    },
    {
      "title": "Formal Copyright/Takedown Policy",
      "toolA": "Known publishes a documented DMCA copyright-takedown policy, signaling real production use that required a formal process.",
      "toolB": "No formal DMCA or copyright-takedown policy is documented for WriteFreely in the facts.",
      "whyItMatters": "A documented takedown process signals operational maturity and gives publishers and rights holders a defined path for disputes.",
      "benefitsWho": "Publishers who need a documented legal/compliance process for user-submitted or federated content benefit from Known's DMCA policy."
    },
    {
      "title": "Pricing Model",
      "toolA": "Known is listed as Free / Open Source, with no paid tiers documented.",
      "toolB": "WriteFreely is listed as Freemium, implying a paid layer (likely the managed hosting service), though no specific price is documented.",
      "whyItMatters": "Knowing whether a paid tier exists at all shapes long-term budgeting even before specific prices are available.",
      "benefitsWho": "Budget-conscious self-hosters who want a purely free tool benefit from Known's fully free/open-source model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing & Content",
      "rows": [
        {
          "feature": "Blog post publishing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Photo/media publishing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Minimalist/distraction-free writing focus",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Publishing to your own domain",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Federation & Distribution",
      "rows": [
        {
          "feature": "ActivityPub/Fediverse integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Mastodon interaction with posts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Posts can be followed and interacted with from Mastodon"
        },
        {
          "feature": "Syndication to social networks",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Hosting & Governance",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed/hosted service option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Hosted service available directly from the WriteFreely team"
        },
        {
          "feature": "Formal DMCA/copyright policy",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Known open source?",
      "answer": "Yes - Known is an open-source, IndieWeb-aligned content management system, listed with a Free / Open Source pricing model."
    },
    {
      "question": "Does WriteFreely integrate with Mastodon?",
      "answer": "Yes - WriteFreely is built on ActivityPub, so posts can be followed and interacted with from Mastodon and other Fediverse platforms."
    },
    {
      "question": "Does Known offer a managed hosting option like WriteFreely?",
      "answer": "The facts don't document a managed hosting service for Known; its model centers on self-publishing content on your own domain. WriteFreely explicitly offers a hosted service run by its own team."
    },
    {
      "question": "Is WriteFreely free to use?",
      "answer": "WriteFreely's pricing model is listed as Freemium, but a specific starting price isn't documented - likely tied to its optional managed hosting service."
    },
    {
      "question": "Which tool is better for publishing photos, not just text?",
      "answer": "Known explicitly documents publishing blog posts, photos, and media to your own site. WriteFreely's documented focus is minimalist text blogging, with no photo/media publishing feature listed."
    },
    {
      "question": "Does Known federate with the Fediverse the way WriteFreely does?",
      "answer": "That's not documented in the available facts for Known. WriteFreely's ActivityPub/Fediverse integration is explicitly confirmed, including Mastodon interoperability."
    }
  ]
};

export default withknownVsWritefreelyContent;
