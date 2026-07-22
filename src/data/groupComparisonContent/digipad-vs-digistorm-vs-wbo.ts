import type { GroupComparisonContent } from './types';

const digipadVsDigistormVsWboContent: GroupComparisonContent = {
  "verdict": "Digipad, Digistorm, and WBO all solve pieces of the same problem, free, account-free, real-time collaboration in the classroom, but they are not one-for-one substitutes. Digipad and Digistorm both come from La Digitale and share its EU-hosted, donation-funded, zero-cost model, though Digipad is built for posting and curating multimedia content on a shared wall while Digistorm is built for live polls, quizzes, and word clouds during a session. WBO covers neither directly; it is a dedicated freehand drawing whiteboard and the only one of the three that is fully open source and self-hostable. Most teachers end up combining more than one of these rather than picking a single winner.",
  "bestFor": {
    "digipad": "Teachers building a curated multimedia resource wall or asynchronous collaborative pinboard where students post files, links, and media without needing an account.",
    "digistorm": "Teachers and trainers who need instant live polls, quizzes, and word clouds during a session without registration, response caps, or per-seat fees.",
    "wbo": "Educators or teams who need a lightweight freehand drawing and sketching whiteboard, especially those who want a self-hostable open source option."
  },
  "highlights": [
    {
      "title": "Built for different classroom moments",
      "description": "Digipad curates a lasting multimedia wall of posts and files, Digistorm drives live in-session engagement through polls and quizzes, and WBO handles freehand sketching, so each tool answers a different teaching need rather than competing head-on.",
      "toolSlugs": [
        "digipad",
        "digistorm",
        "wbo"
      ]
    },
    {
      "title": "Two tools from the same family",
      "description": "Digipad and Digistorm are both published by La Digitale, sharing the same account-free participation model, Infomaniak Swiss hosting, and donation-supported pricing rather than a paid tier.",
      "toolSlugs": [
        "digipad",
        "digistorm"
      ]
    },
    {
      "title": "The only self-hostable option",
      "description": "WBO is open source under AGPLv3 and can be deployed on private infrastructure via Docker, an option Digipad and Digistorm do not publish for their own hosted services.",
      "toolSlugs": [
        "wbo"
      ]
    },
    {
      "title": "Zero cost, zero login across the board",
      "description": "None of the three requires participants to create an account or pay to join a session, board, or wall, lowering the barrier to classroom adoption compared with commercial alternatives like Padlet or Mentimeter.",
      "toolSlugs": [
        "digipad",
        "digistorm",
        "wbo"
      ]
    },
    {
      "title": "Live engagement versus freehand work",
      "description": "Digistorm is purpose-built for structured, moment-in-time engagement such as polls and quizzes, while WBO is built for open-ended freehand drawing and diagramming, making the two better viewed as complementary than competing.",
      "toolSlugs": [
        "digistorm",
        "wbo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core interaction format",
      "rows": [
        {
          "feature": "Multimedia content wall (files, links, posts)",
          "statuses": {
            "digipad": "available",
            "digistorm": "unavailable",
            "wbo": "unavailable"
          }
        },
        {
          "feature": "Freehand drawing and sketching canvas",
          "statuses": {
            "digipad": "unavailable",
            "digistorm": "unavailable",
            "wbo": "available"
          }
        },
        {
          "feature": "Live polls, quizzes, and word clouds",
          "statuses": {
            "digipad": "unavailable",
            "digistorm": "available",
            "wbo": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Access and privacy",
      "rows": [
        {
          "feature": "No account required to participate",
          "statuses": {
            "digipad": "available",
            "digistorm": "available",
            "wbo": "available"
          }
        },
        {
          "feature": "EU/Swiss GDPR-aligned hosting on the public instance",
          "statuses": {
            "digipad": "available",
            "digistorm": "available",
            "wbo": "not-documented"
          },
          "note": "Digipad and Digistorm publish that data is hosted on Infomaniak's Swiss servers; WBO's public demo instance does not document a specific hosting location."
        },
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "digipad": "not-documented",
            "digistorm": "not-documented",
            "wbo": "available"
          },
          "note": "WBO's code is open source under AGPLv3 and Docker-deployable; Digipad and Digistorm do not publish a self-hosting path for their own services."
        }
      ]
    },
    {
      "group": "Cost and scale",
      "rows": [
        {
          "feature": "Fully free with no usage caps",
          "statuses": {
            "digipad": "available",
            "digistorm": "available",
            "wbo": "available"
          }
        },
        {
          "feature": "File or image upload support",
          "statuses": {
            "digipad": "available",
            "digistorm": "unavailable",
            "wbo": "limited"
          },
          "note": "Digipad allows file uploads up to 25 MB per capsule; WBO supports inserting images onto the whiteboard but is not a general file-upload tool."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Digipad, Digistorm, and WBO really direct competitors?",
      "answer": "Not entirely. Digipad is a multimedia posting wall, Digistorm is a live polling and quiz tool, and WBO is a freehand drawing whiteboard. They overlap in being free, account-free, real-time classroom tools, but each covers a different core activity, so many teachers use more than one together."
    },
    {
      "question": "Which of the three requires the least setup for students?",
      "answer": "All three are built around the same principle: no account is required to participate. Students join a Digipad wall, a Digistorm session, or a WBO board using only a shared link or code."
    },
    {
      "question": "Can I self-host any of these tools?",
      "answer": "Only WBO publishes a clear self-hosting path. Its code is open source under the AGPLv3 license and can be deployed on private infrastructure, including via Docker. Digipad and Digistorm are run as hosted services by La Digitale on Infomaniak's Swiss servers, with no published option to self-host either one."
    },
    {
      "question": "Is there a paid tier on Digipad or Digistorm?",
      "answer": "No. Both are entirely free with no board, wall, or response caps. La Digitale's only monetized layer is Digidrive, an optional dashboard for managing content across its tools, unlocked through a voluntary annual donation rather than a required subscription. Core Digipad and Digistorm functionality works fully without it."
    },
    {
      "question": "Should I pick Digistorm or WBO for a live lesson?",
      "answer": "It depends on the activity. Digistorm is purpose-built for structured live engagement, polls, quizzes, and word clouds with instant aggregated results, while WBO is built for open-ended freehand drawing and sketching. Many lessons can use both for different segments of the same class."
    },
    {
      "question": "Where is student data stored with each tool?",
      "answer": "Digipad and Digistorm both publish that content is hosted on Infomaniak's Swiss servers, aligned with GDPR. WBO's publicly hosted demo instance does not document a specific data location, though its self-hosting option lets an organization control data placement entirely."
    }
  ]
};

export default digipadVsDigistormVsWboContent;
