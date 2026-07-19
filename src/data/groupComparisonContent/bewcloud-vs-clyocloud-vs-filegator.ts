import type { GroupComparisonContent } from './types';

const bewcloudVsClyocloudVsFilegatorContent: GroupComparisonContent = {
  "verdict": "bewCloud, ClyoCloud, and FileGator all take a self-hosted, low-overhead approach to personal file management, but they solve different jobs. bewCloud is a lightweight Nextcloud alternative that bundles calendar, contacts, notes, and photos on top of file storage, ClyoCloud is a personal cloud storage and media-streaming server built around a database-free architecture, and FileGator is a narrower, multi-backend, multi-user file manager built for scoped access rather than groupware. Choosing between them comes down to whether you want a broader personal-cloud replacement, a media-centric storage server, or a permissioned file exchange point that can sit in front of local disk, S3, FTP, or Dropbox.",
  "bestFor": {
    "bewcloud": "Self-hosters who want a lightweight Nextcloud alternative that also covers calendar, contacts, notes, and photos on a low-cost VPS.",
    "clyocloud": "Homelab users who want personal cloud storage with built-in ffmpeg-powered media streaming and mandatory TOTP two-factor authentication.",
    "filegator": "Agencies and IT admins who need role-based, multi-user file access across local disk, S3, FTP, SFTP, Azure, or Dropbox backends."
  },
  "highlights": [
    {
      "title": "Lightest resource footprint",
      "description": "bewCloud is built to run in under 50 MB of RAM on Deno and Fresh, making it viable on minimal VPS plans where heavier self-hosted platforms would struggle.",
      "toolSlugs": [
        "bewcloud"
      ]
    },
    {
      "title": "Calendar and contacts built in",
      "description": "bewCloud bundles CalDAV and CardDAV syncing via Radicale integration alongside file storage, notes, and photos, covering more of the personal-cloud use case out of the box.",
      "toolSlugs": [
        "bewcloud"
      ]
    },
    {
      "title": "Media streaming with ffmpeg",
      "description": "ClyoCloud pairs file storage with ffmpeg-powered video streaming and transcoding plus mandatory TOTP two-factor authentication once enabled, giving it a security and media edge for a personal cloud tool.",
      "toolSlugs": [
        "clyocloud"
      ]
    },
    {
      "title": "Multi-cloud storage backends",
      "description": "FileGator's Flysystem-powered adapters let it serve files from local disk, FTP, SFTP, Amazon S3, Azure Blob Storage, or Dropbox through one unified interface, something neither bewCloud nor ClyoCloud offers.",
      "toolSlugs": [
        "filegator"
      ]
    },
    {
      "title": "Database-free deployment",
      "description": "ClyoCloud stores metadata in sidecar JSON files next to each file, and FileGator's default setup stores users and settings in a JSON file too, so both can run and be backed up without standing up a separate database server.",
      "toolSlugs": [
        "clyocloud",
        "filegator"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "File Storage and Sharing",
      "rows": [
        {
          "feature": "File storage and sharing",
          "statuses": {
            "bewcloud": "available",
            "clyocloud": "available",
            "filegator": "available"
          },
          "note": "bewCloud uses symlink-based sharing, ClyoCloud offers public share links, and FileGator supports full copy, move, zip, and download operations."
        },
        {
          "feature": "Multi-user, role-based permissions",
          "statuses": {
            "bewcloud": "not-documented",
            "clyocloud": "not-documented",
            "filegator": "available"
          },
          "note": "FileGator supports hierarchical multi-user accounts scoped to home folders, with a superuser able to manage subfolders belonging to other users."
        },
        {
          "feature": "External storage backends (S3, FTP, Dropbox, etc.)",
          "statuses": {
            "bewcloud": "unavailable",
            "clyocloud": "unavailable",
            "filegator": "available"
          },
          "note": "FileGator connects to local disk, FTP, SFTP, S3, Azure Blob Storage, and Dropbox via Flysystem; bewCloud and ClyoCloud are documented as local, self-hosted storage only."
        }
      ]
    },
    {
      "group": "Personal Cloud Extras",
      "rows": [
        {
          "feature": "Calendar and contacts sync (CalDAV/CardDAV)",
          "statuses": {
            "bewcloud": "available",
            "clyocloud": "unavailable",
            "filegator": "unavailable"
          }
        },
        {
          "feature": "Video/media streaming",
          "statuses": {
            "bewcloud": "limited",
            "clyocloud": "available",
            "filegator": "unavailable"
          },
          "note": "bewCloud includes a photo gallery but no documented video streaming; ClyoCloud provides ffmpeg-powered video streaming and transcoding."
        }
      ]
    },
    {
      "group": "Security and Uploads",
      "rows": [
        {
          "feature": "Two-factor authentication",
          "statuses": {
            "bewcloud": "not-documented",
            "clyocloud": "available",
            "filegator": "not-documented"
          },
          "note": "ClyoCloud offers TOTP-based 2FA that becomes mandatory once enabled for an account."
        },
        {
          "feature": "Resumable, chunked uploads",
          "statuses": {
            "bewcloud": "not-documented",
            "clyocloud": "not-documented",
            "filegator": "available"
          },
          "note": "FileGator uses Resumable.js for chunked, pausable, resumable uploads, useful for large files or unreliable connections."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the lightest weight for a cheap VPS?",
      "answer": "bewCloud is explicitly built to run in under 50 MB of RAM, making it the lightest of the three for minimal VPS hardware. ClyoCloud and FileGator are also comparatively lightweight, with ClyoCloud's database-free design and FileGator's optional no-database setup keeping both installs simple."
    },
    {
      "question": "Do any of these tools include calendar and contacts syncing?",
      "answer": "Only bewCloud does. It integrates CalDAV and CardDAV syncing through Radicale, alongside file storage, notes, and photos. Neither ClyoCloud nor FileGator documents calendar or contacts functionality."
    },
    {
      "question": "Which tool supports storage backends like S3, FTP, or Dropbox?",
      "answer": "FileGator is the only one of the three with documented support for external storage backends. Its Flysystem-based adapters cover local disk, FTP, SFTP, Amazon S3, Azure Blob Storage, and Dropbox through a single interface, while bewCloud and ClyoCloud are self-hosted, local-storage-only tools."
    },
    {
      "question": "Does any of these tools offer built-in two-factor authentication?",
      "answer": "ClyoCloud is the only one with documented two-factor authentication, using TOTP codes compatible with standard authenticator apps that become mandatory once enabled for an account."
    },
    {
      "question": "Which is best for giving multiple people scoped access to files?",
      "answer": "FileGator is purpose-built for this, with hierarchical multi-user accounts, home folders, and read-only or read-write permission controls. bewCloud and ClyoCloud are oriented more toward single-user or small personal-cloud use rather than managing many distinct user accounts."
    },
    {
      "question": "Are bewCloud, ClyoCloud, and FileGator all free to use?",
      "answer": "Yes. All three are free, open-source, self-hosted projects with no vendor-run SaaS subscription: bewCloud is AGPL-3.0 and sustained through GitHub Sponsors and donations, ClyoCloud is GPL-3.0, and FileGator is MIT-licensed. The only ongoing cost for any of them is the server or VPS they run on."
    }
  ]
};

export default bewcloudVsClyocloudVsFilegatorContent;
