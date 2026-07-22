import type { GroupComparisonContent } from './types';

const mailmanVsSchleuderVsSympaContent: GroupComparisonContent = {
  "verdict": "Mailman, Schleuder, and Sympa are all free, self-hosted, open-source mailing list managers, but they solve different problems within that space. Mailman is the long-running general-purpose choice for open-source projects and community lists, Sympa is built for institutional scale with database-backed storage for up to hundreds of thousands of subscribers, and Schleuder is a specialist tool that automatically GPG-encrypts and decrypts list traffic for privacy-focused groups. Choosing between them comes down to whether the priority is broad familiarity, raw scale, or built-in encryption.",
  "bestFor": {
    "mailman": "Open-source projects, nonprofits, and general-purpose discussion or announcement lists that want a mature, widely documented list manager",
    "schleuder": "Privacy-focused teams, activists, journalists, and NGOs that need a mailing list where messages are automatically GPG-encrypted and decrypted for every subscriber",
    "sympa": "Universities and large institutions that need self-hosted list infrastructure proven at very large scale, up to 20,000 lists and 700,000 subscribers"
  },
  "highlights": [
    {
      "title": "Built for Institutional Scale",
      "description": "Sympa is explicitly engineered for very large deployments, storing subscriber data in a relational database like MySQL, PostgreSQL, or Oracle and supporting configurations with tens of thousands of lists and hundreds of thousands of subscribers, a scale the other two were not designed around.",
      "toolSlugs": [
        "sympa"
      ]
    },
    {
      "title": "Encryption-First Design",
      "description": "Schleuder automatically decrypts incoming OpenPGP-encrypted mail and re-encrypts it for every subscriber, and can even bridge encrypted correspondence with non-subscribers, a capability neither Mailman nor Sympa offers natively.",
      "toolSlugs": [
        "schleuder"
      ]
    },
    {
      "title": "The Established General-Purpose Standard",
      "description": "Mailman has been running mailing lists since 1999 and powers many long-running open-source project and academic lists, giving it the deepest documentation and community familiarity of the three.",
      "toolSlugs": [
        "mailman"
      ]
    },
    {
      "title": "All Free and Self-Hosted",
      "description": "None of the three charge licensing fees; all require the organization to provide its own server, mail transfer agent, and administration effort, so the real cost comparison is infrastructure and admin time rather than subscription price.",
      "toolSlugs": [
        "mailman",
        "schleuder",
        "sympa"
      ]
    },
    {
      "title": "Web Admin Interfaces Vary",
      "description": "Mailman ships Postorius and Sympa ships WWSympa as full web-based administration panels, while Schleuder's web interface is an optional add-on built on top of its version 3 API rather than a bundled default.",
      "toolSlugs": [
        "mailman",
        "sympa",
        "schleuder"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "List Administration",
      "rows": [
        {
          "feature": "Web-based admin interface",
          "statuses": {
            "mailman": "available",
            "schleuder": "limited",
            "sympa": "available"
          },
          "note": "Mailman uses Postorius and Sympa uses WWSympa as bundled interfaces; Schleuder's schleuder-web is an optional, separately run component."
        },
        {
          "feature": "Searchable web archive of past messages",
          "statuses": {
            "mailman": "available",
            "schleuder": "unavailable",
            "sympa": "available"
          }
        }
      ]
    },
    {
      "group": "Security and Delivery",
      "rows": [
        {
          "feature": "Automatic end-to-end GPG encryption of list mail",
          "statuses": {
            "mailman": "unavailable",
            "schleuder": "available",
            "sympa": "unavailable"
          }
        },
        {
          "feature": "DKIM, ARC, or DMARC handling",
          "statuses": {
            "mailman": "available",
            "schleuder": "not-documented",
            "sympa": "available"
          },
          "note": "Mailman offers DMARC mitigation strategies; Sympa supports DKIM and ARC signing."
        },
        {
          "feature": "Automatic bounce processing",
          "statuses": {
            "mailman": "available",
            "schleuder": "not-documented",
            "sympa": "available"
          }
        }
      ]
    },
    {
      "group": "Scale and Integration",
      "rows": [
        {
          "feature": "Relational database-backed storage for large deployments",
          "statuses": {
            "mailman": "not-documented",
            "schleuder": "not-documented",
            "sympa": "available"
          }
        },
        {
          "feature": "API for scripting and automation",
          "statuses": {
            "mailman": "available",
            "schleuder": "available",
            "sympa": "available"
          },
          "note": "Mailman offers a REST API, Schleuder's version 3 rewrite added an API, and Sympa exposes a SOAP API."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the most secure for sensitive communications?",
      "answer": "Schleuder, by design. It automatically GPG-encrypts and decrypts every message on the list, whereas Mailman and Sympa handle plain mail and would require subscribers to manage encryption themselves outside the tool."
    },
    {
      "question": "Can Mailman or Sympa be configured to encrypt list mail like Schleuder?",
      "answer": "Not natively. Mailman focuses on DMARC mitigation and general deliverability, and Sympa focuses on DKIM and ARC authentication, but neither automatically encrypts and decrypts message contents the way Schleuder does."
    },
    {
      "question": "Which tool scales best for a large university or institution?",
      "answer": "Sympa. It is purpose-built for large-scale deployments, backed by a relational database, and has a track record at universities including Edinburgh and Glasgow with configurations supporting up to 700,000 subscribers."
    },
    {
      "question": "Do any of these three offer official managed hosting?",
      "answer": "None of the three core projects offer an official managed cloud version. All require self-hosting, though third-party providers do offer managed Mailman hosting for organizations that prefer not to run their own server."
    },
    {
      "question": "What are Mailman, Schleuder, and Sympa built with?",
      "answer": "Mailman is written primarily in Python, Schleuder is written in Ruby, and Sympa is written in Perl, which matters for teams that want to extend or patch the software themselves."
    },
    {
      "question": "Which is easiest for a small open-source project to set up?",
      "answer": "Mailman is generally the most approachable starting point, thanks to its long history, wide documentation, and familiarity among open-source maintainers, compared to Sympa's institutional-scale design or Schleuder's encryption-focused setup."
    }
  ]
};

export default mailmanVsSchleuderVsSympaContent;
