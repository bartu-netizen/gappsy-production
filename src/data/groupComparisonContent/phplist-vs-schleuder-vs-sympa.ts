import type { GroupComparisonContent } from './types';

const phplistVsSchleuderVsSympaContent: GroupComparisonContent = {
  "verdict": "phpList, Schleuder, and Sympa are all free, self-hosted, open-source tools for managing groups of email recipients, but they are built for different jobs. phpList is a newsletter and marketing platform with campaign tracking and an optional hosted service, Sympa is a discussion-list manager engineered for institutional scale, and Schleuder is a specialist tool that automatically GPG-encrypts list traffic for privacy-focused groups. A nonprofit sending a monthly newsletter, a university running large discussion lists, and an activist group needing encrypted correspondence would each reasonably land on a different one of the three.",
  "bestFor": {
    "phplist": "Nonprofits, publishers, and marketers who want free or low-cost newsletter and campaign sending with open and click tracking, with an optional hosted plan for those who do not want to self-host",
    "schleuder": "Privacy-conscious groups, activists, journalists, and NGOs that need a mailing list where every message is automatically GPG-encrypted and decrypted",
    "sympa": "Universities and large institutions that need self-hosted, database-backed list infrastructure proven at very large scale"
  },
  "highlights": [
    {
      "title": "Marketing Campaigns vs List Discussion",
      "description": "phpList is purpose-built for newsletters and marketing campaigns, with click and open tracking, autoresponders, and bounce management, while Sympa and Schleuder are oriented around discussion and secure group correspondence rather than tracked marketing sends.",
      "toolSlugs": [
        "phplist"
      ]
    },
    {
      "title": "Encrypted by Default",
      "description": "Schleuder automatically GPG-encrypts and decrypts every message that passes through the list and can even bridge encrypted correspondence with non-subscribers, a capability neither phpList nor Sympa offers.",
      "toolSlugs": [
        "schleuder"
      ]
    },
    {
      "title": "Institutional Scale",
      "description": "Sympa stores subscriber data in a relational database and is proven at deployments with up to 20,000 lists and 700,000 subscribers, well beyond what phpList or Schleuder are typically used for.",
      "toolSlugs": [
        "sympa"
      ]
    },
    {
      "title": "Free Core, Optional Paid Hosting",
      "description": "phpList is the only one of the three that offers an official paid hosted service through phpList.com starting around $1 a month, giving organizations that do not want to self-host a path to using the software without server administration.",
      "toolSlugs": [
        "phplist"
      ]
    },
    {
      "title": "All Open Source, All Self-Hostable",
      "description": "phpList, Schleuder, and Sympa are all free and open source at their core, and all can be run entirely on an organization's own infrastructure without per-subscriber licensing fees.",
      "toolSlugs": [
        "phplist",
        "schleuder",
        "sympa"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Sending and Campaigns",
      "rows": [
        {
          "feature": "Newsletter and campaign sending with open and click tracking",
          "statuses": {
            "phplist": "available",
            "schleuder": "unavailable",
            "sympa": "not-documented"
          }
        },
        {
          "feature": "Autoresponders and drip sequences",
          "statuses": {
            "phplist": "available",
            "schleuder": "unavailable",
            "sympa": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Security",
      "rows": [
        {
          "feature": "Automatic end-to-end GPG encryption of list mail",
          "statuses": {
            "phplist": "unavailable",
            "schleuder": "available",
            "sympa": "unavailable"
          }
        },
        {
          "feature": "DKIM or ARC authentication support",
          "statuses": {
            "phplist": "not-documented",
            "schleuder": "not-documented",
            "sympa": "available"
          }
        }
      ]
    },
    {
      "group": "Administration and Scale",
      "rows": [
        {
          "feature": "Web-based admin interface",
          "statuses": {
            "phplist": "available",
            "schleuder": "limited",
            "sympa": "available"
          },
          "note": "Schleuder's schleuder-web is an optional add-on rather than a bundled default interface."
        },
        {
          "feature": "Proven capacity for 100,000-plus subscribers",
          "statuses": {
            "phplist": "not-documented",
            "schleuder": "not-documented",
            "sympa": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting Options",
      "rows": [
        {
          "feature": "Official managed or hosted service",
          "statuses": {
            "phplist": "available",
            "schleuder": "unavailable",
            "sympa": "unavailable"
          },
          "note": "phpList offers hosted plans through phpList.com; Schleuder and Sympa are self-hosted only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is phpList suitable for encrypted communications like Schleuder?",
      "answer": "No. phpList is built for tracked marketing newsletters, not encrypted correspondence, and has no built-in GPG encryption. Groups that need every message automatically encrypted and decrypted should look at Schleuder instead."
    },
    {
      "question": "Which of these three offers an official hosted or managed option?",
      "answer": "Only phpList. It offers a paid hosted service through phpList.com starting around $1 a month, while Schleuder and Sympa must be self-hosted on the organization's own server."
    },
    {
      "question": "Which is designed for university-scale mailing lists?",
      "answer": "Sympa. It uses a relational database backend and is proven at deployments supporting up to 20,000 lists and 700,000 subscribers, and is already used by universities such as Edinburgh and Glasgow."
    },
    {
      "question": "Can Sympa or Schleuder be used to send marketing newsletters?",
      "answer": "They can technically distribute mail to a list, but neither is built for marketing use cases like open and click tracking or autoresponder sequences the way phpList is. Sympa and Schleuder are oriented toward discussion and secure correspondence rather than tracked campaigns."
    },
    {
      "question": "Which tool is easiest for a nonprofit sending a monthly newsletter?",
      "answer": "phpList. Its campaign management, subscriber list tools, and tracking features are built specifically for newsletter-style sending, and its low-cost hosted option removes the need to manage a mail server."
    },
    {
      "question": "Do any of these three require a CRM or paid platform to run?",
      "answer": "No. All three are free, open-source, and independent of any CRM. phpList additionally offers an optional low-cost hosted plan, but its core software, like Schleuder and Sympa, can be run entirely for free on self-managed infrastructure."
    }
  ]
};

export default phplistVsSchleuderVsSympaContent;
