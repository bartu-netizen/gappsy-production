import type { GroupComparisonContent } from './types';

const endurainVsFittrackeeVsWgerContent: GroupComparisonContent = {
  "verdict": "All three are free, open-source, self-hosted fitness trackers with no paid tier from the projects themselves, but they cover different parts of fitness tracking. Endurain and FitTrackee are both GPS-route-focused, Strava-style outdoor activity trackers, while wger is built around structured strength-training routine planning, automatic progression, and nutrition logging rather than route-based cardio. Endurain stands out for direct Strava and Garmin Connect sync and a dedicated mobile app, FitTrackee stands out for its detailed map and elevation visualization plus optional ActivityPub federation between instances, and wger stands out as the only one with a real nutrition database and body-progress photo tracking.",
  "bestFor": {
    "endurain": "Cyclists and runners who already use Strava or Garmin Connect and want a self-hosted alternative that can directly sync or migrate that activity history, plus a dedicated mobile app and per-item gear-mileage tracking.",
    "fittrackee": "Privacy-focused outdoor athletes who want detailed GPX-based route, speed, and elevation visualization, optional federation with other self-hosted instances, and are comfortable pairing it with a third-party mobile GPX-logging app.",
    "wger": "Users who want structured strength-training routine planning with automatic progression, nutrition logging against a large food database, and body-measurement and progress-photo tracking, including small gyms or trainers managing multiple clients."
  },
  "highlights": [
    {
      "title": "Only Endurain documents direct Strava and Garmin Connect sync",
      "description": "Endurain integrates directly with Strava and Garmin Connect so users can migrate existing activity history or keep syncing from those platforms alongside self-hosted storage, a capability neither FitTrackee nor wger document.",
      "toolSlugs": [
        "endurain"
      ]
    },
    {
      "title": "Mobile app coverage differs across all three",
      "description": "Endurain ships a dedicated Flutter-based companion app for iOS and Android, and wger offers official native Android (since 2020) and iOS (since 2024) apps; FitTrackee has no official app of its own, instead relying on compatibility with third-party GPX apps like OpenTracks and FitoTrack.",
      "toolSlugs": [
        "endurain",
        "wger",
        "fittrackee"
      ]
    },
    {
      "title": "wger is the only one built for strength training and nutrition",
      "description": "wger centers on a workout-routine builder with automatic weight progression and nutrition logging against the Open Food Facts database of millions of foods, plus body measurement and progress-photo tracking, none of which Endurain or FitTrackee document.",
      "toolSlugs": [
        "wger"
      ]
    },
    {
      "title": "FitTrackee is the only one with social federation features",
      "description": "FitTrackee supports following other users, commenting on workouts, and a federated activity feed built on ActivityPub, letting separate self-hosted instances interconnect, a feature not documented for Endurain or wger.",
      "toolSlugs": [
        "fittrackee"
      ]
    },
    {
      "title": "wger has the longest track record, Endurain the shortest",
      "description": "wger's project dates to 2014, FitTrackee's repository dates to 2017, and Endurain is the newest of the three, founded in 2023, which shows up in Endurain's smaller but more modern, actively-designed feature set.",
      "toolSlugs": [
        "wger",
        "fittrackee",
        "endurain"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Activity Import and Sync",
      "rows": [
        {
          "feature": "GPS route file import (GPX/TCX/FIT)",
          "statuses": {
            "endurain": "available",
            "fittrackee": "available",
            "wger": "not-documented"
          },
          "note": "FitTrackee supports single GPX files or a ZIP archive of multiple files."
        },
        {
          "feature": "Direct Strava or Garmin Connect sync",
          "statuses": {
            "endurain": "available",
            "fittrackee": "not-documented",
            "wger": "not-documented"
          }
        },
        {
          "feature": "Manual workout entry",
          "statuses": {
            "endurain": "not-documented",
            "fittrackee": "available",
            "wger": "available"
          }
        }
      ]
    },
    {
      "group": "Training, Nutrition, and Body Data",
      "rows": [
        {
          "feature": "Structured workout and routine planning",
          "statuses": {
            "endurain": "not-documented",
            "fittrackee": "not-documented",
            "wger": "available"
          }
        },
        {
          "feature": "Nutrition and food tracking",
          "statuses": {
            "endurain": "not-documented",
            "fittrackee": "not-documented",
            "wger": "available"
          },
          "note": "wger connects to the Open Food Facts database of several million foods."
        },
        {
          "feature": "Gear and equipment tracking",
          "statuses": {
            "endurain": "available",
            "fittrackee": "available",
            "wger": "not-documented"
          }
        },
        {
          "feature": "Body measurement and progress photos",
          "statuses": {
            "endurain": "limited",
            "fittrackee": "not-documented",
            "wger": "available"
          },
          "note": "Endurain logs weight, sleep, and goals but does not document progress-photo tracking."
        }
      ]
    },
    {
      "group": "Platform and Community",
      "rows": [
        {
          "feature": "Official native mobile app",
          "statuses": {
            "endurain": "available",
            "fittrackee": "unavailable",
            "wger": "available"
          },
          "note": "FitTrackee has no official app but is compatible with third-party GPX apps."
        },
        {
          "feature": "Multi-user or gym/trainer support",
          "statuses": {
            "endurain": "available",
            "fittrackee": "available",
            "wger": "available"
          }
        },
        {
          "feature": "Social or federation features",
          "statuses": {
            "endurain": "not-documented",
            "fittrackee": "available",
            "wger": "not-documented"
          },
          "note": "FitTrackee's federation uses the ActivityPub protocol."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these can sync directly with Strava or Garmin Connect?",
      "answer": "Only Endurain documents direct integrations with both Strava and Garmin Connect for migrating or continuing to sync activity history."
    },
    {
      "question": "Which one has an official mobile app?",
      "answer": "Endurain has a dedicated Flutter-based companion app for iOS and Android, and wger has official Android (since 2020) and iOS (since 2024) apps. FitTrackee does not document an official app of its own, though it is compatible with third-party GPX apps like OpenTracks and FitoTrack."
    },
    {
      "question": "Which is best for strength training and nutrition rather than GPS cardio?",
      "answer": "wger, with its workout-routine builder, automatic weight progression, and nutrition logging backed by the Open Food Facts database."
    },
    {
      "question": "Do any of these have social or federated features?",
      "answer": "FitTrackee supports following other users, commenting on workouts, and a federated activity feed via ActivityPub. Endurain and wger do not document comparable social features."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes. Endurain, FitTrackee, and wger are all free, open-source, AGPL-licensed, and self-hosted with no paid tier from the projects themselves, though wger is also available through third-party managed hosting providers such as Elestio."
    },
    {
      "question": "Which has the longest track record?",
      "answer": "wger has the longest track record, with a project history dating to 2014, followed by FitTrackee, whose repository dates to 2017. Endurain is the newest of the three, founded in 2023."
    }
  ]
};

export default endurainVsFittrackeeVsWgerContent;
