import type { GroupComparisonContent } from './types';

const bewcloudVsChibisafeVsFilegatorContent: GroupComparisonContent = {
  "verdict": "These three self-hosted file tools solve overlapping but genuinely different problems, so the right pick depends on what you actually mean by file management. If you want a lightweight, do-everything personal cloud that replaces Nextcloud for files, calendar, contacts, notes and photos, bewCloud is the closest fit. If your real need is a private, ShareX-compatible link generator for quickly hosting and sharing files or screenshots, Chibisafe is purpose-built for that. If you need a browser-based file manager that gives multiple users or clients permissioned, scoped access across local disk, FTP, S3, or Dropbox, FileGator is the strongest match. None of the three is a drop-in substitute for the others.",
  "bestFor": {
    "bewcloud": "Individuals or small teams who want one lightweight, self-hosted app covering files, calendar, contacts, notes, and photos on a cheap VPS, without Nextcloud's heavier PHP stack.",
    "chibisafe": "Developers, Discord or community server admins, and ShareX users who want a private, self-hosted alternative to public image and file uploaders for fast shareable links.",
    "filegator": "Agencies and IT admins who need to give multiple clients or team members isolated, role-based access to files spread across local disk, FTP, SFTP, S3, Azure, or Dropbox from one interface."
  },
  "highlights": [
    {
      "title": "bewCloud is the only true personal-cloud suite",
      "description": "bewCloud is the only one of the three that bundles files with calendar, contacts (via CalDAV/CardDAV), notes, and a photo gallery in a single lightweight app, positioning it as a Nextcloud alternative rather than a single-purpose file tool.",
      "toolSlugs": [
        "bewcloud"
      ]
    },
    {
      "title": "Chibisafe is built for shareable links, not personal file organization",
      "description": "Chibisafe's core purpose is generating shareable links for uploaded files and images, with native ShareX, browser extension, and iOS shortcut support, plus a built-in URL shortener; it is not designed as a general personal file browser.",
      "toolSlugs": [
        "chibisafe"
      ]
    },
    {
      "title": "FileGator alone offers multi-cloud storage backends and hierarchical roles",
      "description": "FileGator's Flysystem-based architecture lets it serve files from local disk, FTP, SFTP, S3, Azure Blob Storage, or Dropbox through one interface, combined with a multi-user permission hierarchy where a superuser manages other users' scoped folders.",
      "toolSlugs": [
        "filegator"
      ]
    },
    {
      "title": "All three are free and self-hosted, with no managed SaaS option",
      "description": "None of the three offers an official vendor-run hosted plan; all require the operator to run their own server or VPS and handle updates and backups themselves.",
      "toolSlugs": [
        "bewcloud",
        "chibisafe",
        "filegator"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Personal Cloud Features",
      "rows": [
        {
          "feature": "File storage and sharing",
          "statuses": {
            "bewcloud": "available",
            "chibisafe": "available",
            "filegator": "available"
          }
        },
        {
          "feature": "Calendar and contacts (CalDAV/CardDAV)",
          "statuses": {
            "bewcloud": "available",
            "chibisafe": "unavailable",
            "filegator": "unavailable"
          }
        },
        {
          "feature": "Notes app and photo gallery",
          "statuses": {
            "bewcloud": "available",
            "chibisafe": "limited",
            "filegator": "unavailable"
          },
          "note": "Chibisafe includes a masonry-style media gallery for uploads but has no notes app; bewCloud has both a dedicated notes app and a photo gallery."
        }
      ]
    },
    {
      "group": "Storage Backends and Access Control",
      "rows": [
        {
          "feature": "Multiple storage backends (FTP, SFTP, S3, Azure, Dropbox)",
          "statuses": {
            "bewcloud": "not-documented",
            "chibisafe": "limited",
            "filegator": "available"
          },
          "note": "Chibisafe supports S3-compatible storage only; FileGator supports a much wider set of backends via Flysystem."
        },
        {
          "feature": "Multi-user, role-based permissions",
          "statuses": {
            "bewcloud": "not-documented",
            "chibisafe": "available",
            "filegator": "available"
          },
          "note": "Chibisafe offers public, user-account, and invite-only modes; FileGator offers hierarchical per-folder roles."
        }
      ]
    },
    {
      "group": "Sharing and Uploads",
      "rows": [
        {
          "feature": "ShareX / browser extension / mobile shortcut uploads",
          "statuses": {
            "bewcloud": "unavailable",
            "chibisafe": "available",
            "filegator": "unavailable"
          }
        },
        {
          "feature": "Chunked, resumable large-file uploads",
          "statuses": {
            "bewcloud": "not-documented",
            "chibisafe": "available",
            "filegator": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Docker-based deployment",
          "statuses": {
            "bewcloud": "available",
            "chibisafe": "available",
            "filegator": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the best Nextcloud alternative?",
      "answer": "bewCloud, since it is explicitly designed as a lighter, lower-resource replacement for Nextcloud covering files, calendar, contacts, notes, and photos, rather than a single-purpose uploader or file browser."
    },
    {
      "question": "Can Chibisafe be used to organize personal files and folders like bewCloud or FileGator?",
      "answer": "Not really. Chibisafe is built around generating shareable links for uploaded files and images, with albums, tags, and a gallery view, rather than the folder-based personal file organization that bewCloud and FileGator provide."
    },
    {
      "question": "Does FileGator support cloud storage like Amazon S3 or Dropbox?",
      "answer": "Yes. FileGator uses the Flysystem library to support local disk, FTP, SFTP, Amazon S3, DigitalOcean Spaces, Azure Blob Storage, and Dropbox as pluggable storage backends, all through the same web interface."
    },
    {
      "question": "Do any of these three offer a managed, hosted version so I do not have to self-host?",
      "answer": "No. All three are open-source projects that require self-hosting on your own server or VPS; none has an official vendor-run SaaS plan."
    },
    {
      "question": "Which tool is best for giving multiple clients scoped access to their own files?",
      "answer": "FileGator, because of its hierarchical, role-based multi-user model that lets an administrator restrict each account to its own home folder with read-only or full access."
    },
    {
      "question": "Do any of these include a calendar or contacts feature?",
      "answer": "Only bewCloud. Chibisafe and FileGator are focused on file upload/sharing and file management respectively, with no built-in calendar or contacts functionality."
    }
  ]
};

export default bewcloudVsChibisafeVsFilegatorContent;
