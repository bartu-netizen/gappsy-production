-- Enrichment batch: Exim, Haraka, OpenSMTPD, Postfix, Sendmail, HyperKitty, Mailman, mlmmj, phpList, Postorius, Schleuder, Sympa, Cypht, Roundcube, SnappyMail, SquirrelMail, Ergo, InspIRCd, Kiwi IRC, ngircd, Quassel IRC, Robust IRC, The Lounge, UnrealIRCd, Weechat, ZNC, Asterisk, Flexisip, Freepbx, FreeSWITCH, FusionPBX, Kamailio, openSIPS, Routr, SIP3, SIPCAPTURE Homer, Wazo, Yeti-Switch, Akkoma, Answer, Artalk, AsmBB, BuddyPress, Coral, diaspora*, Elgg, Enigma 1/2 BBS, GoToSocial, Hatsu, Hubzilla, Iceshrimp.NET, Isso, Misago, Movim, OSSN, PieFed, qpixel, remark42, Scoold, Simple Machines Forum, Socialhome, Talkyard, yarn.social, Janus, MiroTalk C2C, MiroTalk P2P, MiroTalk SFU, plugNmeet, ejabberd, MongooseIM, Openfire, Prosody IM, Snikket, Tigase, Converse.js, Salut à Toi, ACP Admin, FoodCoopShop, Foodsoft
-- Publishes 79 bulk-imported tool(s) with full editorial content.

-- ── Exim ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Exim is a free, highly configurable open-source mail transfer agent for routing and delivering email on Unix systems.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1995,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Exim: a free, open-source mail transfer agent for Unix. Flexible routing, ACLs, and content-scanning integration since 1995.$q$,
  og_description = $q$Exim: a free, open-source mail transfer agent for Unix. Flexible routing, ACLs, and content-scanning integration since 1995.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a5b0bebc-38eb-4762-ae9c-52a84181c2e6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Flexible mail routing$q$, $q$A rule-based configuration language lets administrators define custom routers and transports for delivering mail to local mailboxes, remote hosts, or other programs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Access control lists (ACLs)$q$, $q$ACLs applied at each stage of an SMTP transaction allow fine-grained accept/reject/defer decisions based on sender, recipient, content, or connection data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Content scanning integration$q$, $q$Built-in hooks integrate with external antivirus and antispam engines such as ClamAV and SpamAssassin.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$TLS encryption$q$, $q$Supports STARTTLS for encrypting SMTP sessions between mail servers and clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Extensive logging$q$, $q$Detailed, configurable logging helps administrators trace message delivery and diagnose problems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Wide platform support$q$, $q$Runs on Linux, BSD, macOS, and most other Unix-like operating systems, with an active build farm testing each release.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Mature, battle-tested codebase with three decades of production use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Extremely configurable routing and filtering logic$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Default MTA on Debian and other major distributions, so documentation and community support are abundant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Free and open source under the GPL$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Active security maintenance with regular patch releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Configuration syntax has a steep learning curve compared to newer MTAs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$No graphical interface; requires command-line and file-editing comfort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Complex deployments (e.g. with content scanning) need real Unix sysadmin expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Is Exim free to use?$q$, $q$Yes. Exim is free, open-source software released under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$What operating systems does Exim run on?$q$, $q$Exim runs on Linux, the BSDs, macOS, and other Unix-like systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Is Exim still actively maintained?$q$, $q$Yes. The project continues to ship security and bug-fix releases, including patches for newly discovered vulnerabilities.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$How does Exim compare to Postfix or Sendmail?$q$, $q$All three are open-source Unix MTAs. Exim is known for its highly flexible, string-expansion-based configuration language, while Postfix emphasizes simplicity and Sendmail is the oldest of the three.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Self-hosted mail server$q$, $q$Run your own inbound and outbound mail server for a domain instead of relying on a hosted provider.$q$, $q$System administrators and small hosting operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$ISP and hosting-provider MTA$q$, $q$Handle mail routing for many domains and mailboxes with custom acceptance and filtering policies.$q$, $q$Web hosts and ISPs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$Custom mail gateway$q$, $q$Use Exim's routing rules to build a gateway that inspects, filters, or forwards mail before it reaches its final destination.$q$, $q$Enterprises with custom mail-flow requirements$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Exim is a message transfer agent (MTA) originally written by Philip Hazel in 1995 for the University of Cambridge Computing Service, with its first public release in 1996. It is distributed under the GNU General Public License and runs on Unix-like systems, where it accepts, routes, and delivers email.$q$, $q$Exim is built around a highly flexible configuration language that lets administrators define custom routing rules, access control lists, and content checks. It has long been one of the most widely deployed MTAs on the internet and is the default mail server on Debian and several other Linux distributions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Exim suits system administrators and hosting providers who need a self-hosted mail server with fine-grained control over routing, spam and virus filtering integration, and access policy, and who are comfortable working with a text-based configuration file rather than a graphical interface.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a5b0bebc-38eb-4762-ae9c-52a84181c2e6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Haraka ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Haraka is an open-source, event-driven SMTP server built on Node.js with a JavaScript plugin architecture.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Haraka: a free, open-source, plugin-driven SMTP server built on Node.js for high-throughput, customizable email handling.$q$,
  og_description = $q$Haraka: a free, open-source, plugin-driven SMTP server built on Node.js for high-throughput, customizable email handling.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9af66bbf-b130-4408-9f34-c92e212205a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9af66bbf-b130-4408-9f34-c92e212205a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Plugin-based architecture$q$, $q$Every SMTP transaction stage is a hook that can be extended or overridden with custom JavaScript plugins.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$High throughput design$q$, $q$Built on Node.js's event loop to handle large numbers of concurrent SMTP connections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Bundled plugin library$q$, $q$Ships with plugins for common needs such as DNS-based blocklist checks, rate limiting, and authentication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$npm-based installation and packaging$q$, $q$Installed and managed as an npm package, fitting naturally into Node.js toolchains.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Community maintenance$q$, $q$Actively maintained on GitHub by the Haraka community, with regular releases.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Highly extensible via JavaScript plugins rather than a proprietary config language$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Designed for high-volume, high-performance mail handling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Free and open source under the permissive MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Familiar toolchain (npm, JavaScript) for Node.js developers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Requires JavaScript/Node.js knowledge to customize behavior effectively$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Smaller ecosystem and community than long-established MTAs like Postfix or Exim$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Documentation is less exhaustive than more mature mail servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Is Haraka free?$q$, $q$Yes. Haraka is open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$What do I need to run Haraka?$q$, $q$Haraka runs on Node.js and is installed via npm.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Can I customize how Haraka handles mail?$q$, $q$Yes, through its plugin system — each stage of the SMTP transaction can be extended with custom JavaScript.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Who maintains Haraka?$q$, $q$It was created by Matt Sergeant and is now maintained by the Haraka open-source community on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$High-volume outbound mail$q$, $q$Handle large sending volumes with a server tuned for concurrency and throughput.$q$, $q$Developers running transactional or bulk mail infrastructure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$Custom antispam / filtering logic$q$, $q$Write JavaScript plugins to implement bespoke filtering, scoring, or routing rules at any SMTP stage.$q$, $q$Engineering teams with specific mail-processing requirements$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Haraka is a Node.js-based SMTP server originally created by Matt Sergeant, a former SpamAssassin project lead. Released under the MIT license, it is designed for high throughput and low latency, handling large volumes of concurrent connections.$q$, $q$Instead of a monolithic configuration file, Haraka exposes every stage of an SMTP transaction — connect, HELO, MAIL FROM, RCPT TO, DATA, and queueing — as a hook that can be extended with a small JavaScript plugin. This makes it popular with developers who want to build custom mail-filtering or routing logic in code rather than a configuration DSL.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Haraka fits teams that are comfortable writing JavaScript and want a scriptable SMTP server for high-volume inbound or outbound mail handling, custom antispam logic, or embedding mail processing into a Node.js-based infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9af66bbf-b130-4408-9f34-c92e212205a4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── OpenSMTPD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenSMTPD is a free, ISC-licensed SMTP server from the OpenBSD project, designed to be simple to configure and secure.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenSMTPD: a free, ISC-licensed SMTP server from the OpenBSD project built for simple configuration and security.$q$,
  og_description = $q$OpenSMTPD: a free, ISC-licensed SMTP server from the OpenBSD project built for simple configuration and security.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '99730711-228d-48f9-acb0-4108e2522d7d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '99730711-228d-48f9-acb0-4108e2522d7d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$RFC 5321-compliant SMTP$q$, $q$Implements the standard SMTP protocol plus common extensions for interoperability with other mail servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Simple configuration syntax$q$, $q$Uses a concise, readable configuration file designed to reduce the risk of misconfiguration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Privilege separation$q$, $q$Follows OpenBSD's security-first design philosophy, splitting the daemon into separate, minimally privileged processes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Table-based lookups$q$, $q$Supports pluggable backends (files, databases) for user, alias, and virtual-domain lookups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Portable builds$q$, $q$A separately maintained portable version runs on Linux and other non-OpenBSD Unix-like systems.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Simple, readable configuration compared to older MTAs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Security-oriented design inherited from the OpenBSD project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Free and open source under the ISC license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Actively maintained with regular releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Smaller feature surface and plugin ecosystem than Postfix or Exim$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Best-documented and most battle-tested on OpenBSD itself; the portable Linux build is a secondary target$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Fewer third-party tutorials and integrations than more established MTAs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Is OpenSMTPD free?$q$, $q$Yes. It is free, open-source software released under the ISC license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Does OpenSMTPD only run on OpenBSD?$q$, $q$No. While it's developed as part of OpenBSD, a portable version is maintained on GitHub for Linux and other Unix-like operating systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Who develops OpenSMTPD?$q$, $q$It is primarily developed by Gilles Chehade and Eric Faurot, with contributions from OpenBSD developers and the wider community.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$What is OpenSMTPD's design philosophy?$q$, $q$It aims for a simpler, more secure alternative to older, more complex mail transfer agents, following OpenBSD's emphasis on privilege separation and code auditing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Self-hosted mail server on OpenBSD$q$, $q$Run inbound/outbound mail natively as part of an OpenBSD-based server stack.$q$, $q$OpenBSD administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$Lightweight Linux mail server$q$, $q$Deploy the portable build as a simpler alternative to Postfix or Exim on Linux systems.$q$, $q$Sysadmins who prefer minimal, security-focused configuration$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenSMTPD implements the server-side SMTP protocol (RFC 5321) along with common extensions, letting a machine send and receive email. It originated within the OpenBSD project — first appearing in the OpenBSD base system in 2009 and reaching its first standalone public release in 2013 — and is primarily developed by Gilles Chehade and Eric Faurot, with contributions from the wider OpenBSD community.$q$, $q$The project was started out of dissatisfaction with the complexity of existing mail transfer agents, and it is released under the permissive ISC license. While it ships as part of OpenBSD, a portable version is maintained separately on GitHub for Linux and other Unix-like systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenSMTPD is aimed at administrators who want a straightforward, security-focused mail server with a simple configuration syntax, particularly those already running OpenBSD or who prefer OpenBSD-style tooling on Linux.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99730711-228d-48f9-acb0-4108e2522d7d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Postfix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Postfix is a free, open-source mail transfer agent built as a fast, secure, easy-to-administer alternative to Sendmail.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1998,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Postfix: a free, open-source mail transfer agent built for speed, security, and easy administration as a Sendmail alternative.$q$,
  og_description = $q$Postfix: a free, open-source mail transfer agent built for speed, security, and easy administration as a Sendmail alternative.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8af6231d-94ed-4f47-822f-a4b6cf8b5e1f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Sendmail-compatible interface$q$, $q$Command-line tools and behavior mimic Sendmail closely, easing migration from legacy Sendmail deployments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Modular, multi-process design$q$, $q$Splits mail handling across small, single-purpose processes for better isolation and security.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Virtual domain and mailbox support$q$, $q$Supports virtual users and domains backed by files, databases, or directory services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$TLS and SASL authentication$q$, $q$Supports encrypted SMTP sessions and authenticated relaying.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Content filtering hooks$q$, $q$Integrates with external antispam and antivirus tools via a milter or pipe interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Broad platform support$q$, $q$Runs on AIX, the BSDs, HP-UX, Linux, macOS, and Solaris.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Widely regarded as easier to configure and secure than legacy Sendmail$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Mature and extremely widely deployed, with a large body of documentation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Free and open source under the IBM Public License$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Actively maintained by its original author$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Default MTA on many Linux distributions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Command-line and file-based configuration; no bundled graphical interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Requires Unix system administration knowledge to deploy and secure properly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Advanced setups (virtual domains, content filtering) require additional configuration work$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Is Postfix free?$q$, $q$Yes. Postfix is free, open-source software released under the IBM Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Who maintains Postfix?$q$, $q$Wietse Venema, its original creator, continues to oversee its development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$What platforms does Postfix support?$q$, $q$Postfix runs on AIX, BSD variants, HP-UX, Linux, macOS, and Solaris.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$How is Postfix different from Sendmail?$q$, $q$Postfix was built as a faster, easier-to-administer, more secure alternative to Sendmail while keeping a similar command-line interface for compatibility.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Self-hosted mail server$q$, $q$Send and receive mail for a domain without relying on a third-party hosted provider.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Enterprise and hosting-provider mail relay$q$, $q$Route mail for many domains and virtual mailboxes at scale.$q$, $q$Hosting providers and enterprise IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$Outbound transactional mail relay$q$, $q$Act as the local relay that hands off application-generated email to upstream delivery services.$q$, $q$Developers and DevOps teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Postfix was created by Wietse Venema at the IBM Thomas J. Watson Research Center, with a first public release in December 1998 (originally under the names VMailer and IBM Secure Mailer). It is released under the IBM Public License and remains under active development by Venema.$q$, $q$Postfix maintains a Sendmail-compatible command-line interface so it can be dropped into existing Sendmail-based setups, while its internal architecture is built from small, cooperating processes designed for speed, security, and administrative simplicity. It runs on most Unix-like systems, including Linux, the BSDs, macOS, AIX, HP-UX, and Solaris, and is the default MTA on many Linux distributions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Postfix is a common default choice for system administrators who want a self-hosted mail server that is easier to configure and audit than classic Sendmail, from single-server personal mail setups to large-scale hosting environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8af6231d-94ed-4f47-822f-a4b6cf8b5e1f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sendmail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sendmail is a long-standing open-source mail transfer agent, with a commercial Sentrion edition offered by Proofpoint for larger deployments.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 1983,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sendmail: a veteran open-source mail transfer agent, with Proofpoint's commercial Sentrion platform available for enterprise environments.$q$,
  og_description = $q$Sendmail: a veteran open-source mail transfer agent, with Proofpoint's commercial Sentrion platform available for enterprise environments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4741d451-b4f1-4455-802f-b4d98dfdba96';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4741d451-b4f1-4455-802f-b4d98dfdba96' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Mature routing engine$q$, $q$Decades-old, extensively documented rule-based mail routing and delivery engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Sendmail.cf configuration$q$, $q$Uses the well-known (if complex) sendmail.cf configuration format that many legacy tools and guides are built around.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Milter content-filtering interface$q$, $q$Supports the milter protocol for integrating antispam and antivirus filtering.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$TLS and authentication support$q$, $q$Supports encrypted SMTP sessions and SMTP authentication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Commercial Sentrion tier$q$, $q$Proofpoint's Sentrion platform extends the open-source core with features for large, complex enterprise mail environments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$One of the oldest, most battle-tested mail transfer agents in existence$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Free open-source edition available directly from sendmail.org$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Extensive legacy documentation and community knowledge built up over decades$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Backed by a commercial vendor (Proofpoint) for organizations that need enterprise support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$sendmail.cf configuration syntax is notoriously complex compared to newer MTAs like Postfix$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Considered legacy by many administrators, with smaller active open-source contributor activity than Postfix or Exim$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Sentrion enterprise pricing is not publicly listed and requires a sales conversation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Is Sendmail still free?$q$, $q$Yes. The core Sendmail MTA remains available as free, open-source software under the Sendmail Open Source License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$What is Sendmail Sentrion?$q$, $q$Sentrion is Proofpoint's separate commercial mail platform for large, complex enterprise environments, built on top of the Sendmail codebase, with pricing available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Who maintains Sendmail today?$q$, $q$Proofpoint distributes and supports Sendmail, including both the open-source edition and the commercial Sentrion platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$How old is Sendmail?$q$, $q$Its lineage dates to Eric Allman's 1979 delivermail program, with Sendmail itself shipping as part of BSD in 1983.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Legacy Unix mail infrastructure$q$, $q$Maintain or extend an existing sendmail.cf-based mail server.$q$, $q$System administrators running established Sendmail deployments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Large enterprise mail consolidation$q$, $q$Evaluate the commercial Sentrion platform for complex, large-scale mail environments.$q$, $q$Enterprise IT and messaging teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Core Sendmail MTA","Self-hosted deployment","Community documentation and support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$Sentrion$q$, $q$Contact for pricing$q$, NULL, $q$["Enterprise-grade mail platform","Built for large, complex environments","Commercial support from Proofpoint"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Sendmail traces back to Eric Allman's delivermail program (1979) at UC Berkeley and shipped under the name Sendmail with BSD 4.1c in 1983, making it one of the oldest actively distributed mail transfer agents. The open-source edition is released under the Sendmail Open Source License, a BSD-style license, and continues to be distributed from sendmail.org.$q$, $q$Sendmail is now stewarded by Proofpoint, which offers the classic MTA as a free open-source download alongside a separate commercial product, Sendmail Sentrion, aimed at large and complex enterprise mail environments (virtualization, consolidation, cloud migration, and similar needs). Pricing for Sentrion is not published and requires contacting Proofpoint directly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$The open-source edition suits administrators maintaining legacy or standard Unix mail infrastructure who are already familiar with Sendmail's configuration model. Organizations with large-scale, complex mail environments may instead evaluate the commercial Sentrion platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4741d451-b4f1-4455-802f-b4d98dfdba96', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── HyperKitty ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HyperKitty is the free, open-source web archiver for GNU Mailman 3, letting users browse and search mailing list discussions in a browser.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HyperKitty: the free, open-source web archiver for GNU Mailman 3, giving mailing lists a searchable, threaded browser archive.$q$,
  og_description = $q$HyperKitty: the free, open-source web archiver for GNU Mailman 3, giving mailing lists a searchable, threaded browser archive.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '11597642-219f-4d25-9f31-8486b2b24eba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '11597642-219f-4d25-9f31-8486b2b24eba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Searchable web archive$q$, $q$Full-text search across archived mailing list messages, replacing static mbox/text archives.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Threaded discussion view$q$, $q$Displays messages grouped into readable, threaded conversations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Reply and post from the web$q$, $q$Registered users can start new threads or reply to existing ones directly from the browser.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Favorites$q$, $q$Users can mark messages as favorites for quick reference later.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Standalone or integrated deployment$q$, $q$Runs as part of the Mailman 3 suite or independently as a Django-based discussion archive.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Free and open source under the GPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Modern, searchable alternative to plain-text mailing list archives$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Can double as a lightweight web forum when run standalone$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Integrates natively with GNU Mailman 3$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Requires a Django deployment environment (Python, database, web server) to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Most useful in combination with the rest of the Mailman 3 suite rather than as a fully independent product$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Smaller community than the core Mailman project itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Is HyperKitty free?$q$, $q$Yes, HyperKitty is free, open-source software released under the GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Do I need Mailman to use HyperKitty?$q$, $q$It's built to archive GNU Mailman 3 lists, but it can also be deployed standalone as a Django-based discussion archive without the full Mailman suite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$What can users do in HyperKitty besides read archives?$q$, $q$Registered users can search, start new threads, reply to existing messages, and mark messages as favorites.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Where does HyperKitty's source code live?$q$, $q$It is hosted on GitLab, with development discussion on the Mailman Developers mailing list.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Searchable mailing list archive$q$, $q$Give subscribers and the public a browsable, searchable web archive of a Mailman 3 list.$q$, $q$Open-source projects and community mailing lists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$Standalone discussion forum$q$, $q$Run HyperKitty independently as a lightweight, threaded web forum.$q$, $q$Communities that want forum-style archiving without full mailing list infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HyperKitty is the archiver component of the GNU Mailman 3 suite, originating from the Fedora community. It is a Django-based web application, licensed under the GPLv3, that replaces older plain-text mailing list archives with a searchable, threaded, browsable web interface.$q$, $q$It plugs into a running Mailman 3 installation to archive incoming list traffic, but it can also be deployed standalone (using the hyperkitty and hyperkitty_standalone packages) to serve as a lightweight, forum-style discussion archive.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HyperKitty is for organizations already running (or planning to run) GNU Mailman 3 who want a modern, searchable web archive of their list discussions rather than raw mbox files, as well as developers who want a standalone, forum-like archive of threaded conversations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11597642-219f-4d25-9f31-8486b2b24eba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mailman ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GNU Mailman is free, open-source software for running and administering email discussion lists and newsletters.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GNU Mailman: free, open-source software for running email discussion lists and newsletters, with a REST API and web UI suite.$q$,
  og_description = $q$GNU Mailman: free, open-source software for running email discussion lists and newsletters, with a REST API and web UI suite.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '09b6e7a8-b810-4a31-9ecf-e4e0719bc76c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$List management engine$q$, $q$Handles subscriptions, unsubscribes, bounce processing, moderation, and message delivery for discussion lists and newsletters.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Digest delivery$q$, $q$Subscribers can choose to receive individual messages or batched digests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Content filtering and spam protection$q$, $q$Built-in tools for filtering unwanted content and reducing spam reaching list subscribers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$REST API$q$, $q$A documented REST API lets Postorius, HyperKitty, and third-party tools manage lists and members programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Companion web apps$q$, $q$Pairs with Postorius (list administration UI) and HyperKitty (searchable web archive) for a full self-hosted mailing list platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Bounce handling$q$, $q$Automatically detects and processes bounced messages to keep subscriber lists healthy.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Free and open source under the GPL, with an official GNU project status$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Long track record and large installed base across open-source projects and institutions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Documented REST API for automation and integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Companion projects (Postorius, HyperKitty) provide a full web-based admin and archive experience$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Active, ongoing development with regular releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Self-hosting the full Mailman 3 suite (Core, Postorius, HyperKitty) requires setting up multiple components$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Mailman 3's architecture (Django-based web components plus a separate core) is more involved to deploy than the older Mailman 2.1$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Not designed as a marketing-focused email platform with built-in campaign analytics like commercial newsletter tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Is Mailman free?$q$, $q$Yes. GNU Mailman is free, open-source software released under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$What's the difference between Mailman, Postorius, and HyperKitty?$q$, $q$Mailman (Core) is the underlying list-management engine, Postorius is the web-based administration and subscriber interface, and HyperKitty is the searchable web archive — together they form the Mailman 3 suite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Does Mailman have an API?$q$, $q$Yes, Mailman Core exposes a documented REST API used by Postorius, HyperKitty, and third-party integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Is the older Mailman 2.1 still available?$q$, $q$Yes, Mailman 2.1.39 remains available for those not yet migrated to Mailman 3, though new deployments should use Mailman 3.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Open-source project mailing lists$q$, $q$Run developer and user discussion lists for an open-source project.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Institutional and community announcement lists$q$, $q$Send newsletters or announcements to a self-managed subscriber list.$q$, $q$Universities, non-profits, and community organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$Self-hosted discussion forums$q$, $q$Combine Mailman with Postorius and HyperKitty for a full web-accessible list platform.$q$, $q$Organizations wanting full control over their mailing list infrastructure$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GNU Mailman is free software for managing email discussion lists and e-newsletters, released under the GNU General Public License and written in Python. Its origins trace to an early version written by John Viega, with development taken over and formalized in the late 1990s; it became an official GNU package shortly after.$q$, $q$Today's Mailman 3 is a suite made up of Mailman Core (the list-management engine), Postorius (a web-based admin/subscriber interface), and HyperKitty (a searchable web archiver), along with a documented REST API for integrations. The current lead developer is Abhilash Raj, with a group of long-standing core contributors. The latest stable release is Mailman 3.3.10 (October 2024); the older Mailman 2.1 branch remains available separately.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mailman is used by open-source projects, universities, non-profits, and organizations that run community discussion lists or announcement newsletters and want a self-hosted, fully controllable alternative to third-party email marketing platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09b6e7a8-b810-4a31-9ecf-e4e0719bc76c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── mlmmj ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$mlmmj is a free, open-source mailing list manager designed to be simple, lightweight, and resource-efficient.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$mlmmj: a free, open-source, lightweight mailing list manager for MTAs, built for minimal resource use on small servers.$q$,
  og_description = $q$mlmmj: a free, open-source, lightweight mailing list manager for MTAs, built for minimal resource use on small servers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f8dc7535-36b0-4fce-a7c3-155bcabd5963';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f8dc7535-36b0-4fce-a7c3-155bcabd5963' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Message archiving$q$, $q$Keeps an archive of messages sent to each list.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Bounce processing$q$, $q$Automated handling of bounced messages to keep subscriber lists clean.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Moderation controls$q$, $q$Supports moderated lists where posts require approval before distribution.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Digest support$q$, $q$Subscribers can receive batched digests instead of individual messages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Custom headers and footers$q$, $q$Lists can be configured with custom message headers and footers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Subscriber-only posting and regex-based access control$q$, $q$Restrict who can post using subscriber-only rules or regular-expression-based access lists.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$VERP and DSN support$q$, $q$Supports Variable Envelope Return Path and Delivery Status Notifications (RFC 1891) for reliable bounce tracking.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Optional web interface$q$, $q$An optional web interface is available for list interaction alongside the core command-line/MTA-integrated tool.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Extremely lightweight; requires no background daemon process$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Free and open source under the MIT license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Well suited to small VPS or resource-constrained hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Supports standard mailing-list features (moderation, digests, bounce handling) without unnecessary complexity$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Minimal by design, so it lacks the richer admin UI and ecosystem of larger platforms like GNU Mailman$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Requires manual MTA integration and command-line/file-based configuration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Smaller community and slower release cadence than more widely used mailing list tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Is mlmmj free?$q$, $q$Yes, mlmmj is free, open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Does mlmmj need a background daemon to run?$q$, $q$No. It is designed to require no daemons, making it lightweight for small servers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Does mlmmj have a web interface?$q$, $q$An optional web interface is available for interacting with lists, in addition to its core MTA-integrated tooling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$What inspired mlmmj?$q$, $q$mlmmj was inspired by ezmlm, another minimalist mailing list manager.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$Lightweight list hosting on small servers$q$, $q$Run mailing lists on a low-resource VPS without the overhead of a larger platform.$q$, $q$Self-hosters and small organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$MTA-integrated list management$q$, $q$Add mailing list capability to an existing Postfix, Exim, or other MTA deployment.$q$, $q$System administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$mlmmj (mailing list management made joyful) is a simple, slim mailing list manager inspired by ezmlm, released under the MIT license. It integrates with standard Mail Transfer Agents to handle subscription management, message distribution, and list moderation.$q$, $q$It is designed for minimal resource usage — the project notes that it requires no background daemons — which makes it well suited to small virtual private servers or other resource-constrained environments where a full mailing list platform would be overkill.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$mlmmj suits administrators who want a lightweight, no-frills mailing list manager for small to mid-sized lists, particularly on low-resource servers, and who are comfortable integrating it with an existing MTA rather than deploying a larger self-contained platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8dc7535-36b0-4fce-a7c3-155bcabd5963', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── phpList ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$phpList is free, open-source, self-hosted newsletter and email campaign software for sending to subscriber lists of any size.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2000,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$phpList: free, open-source, self-hosted newsletter software for sending email campaigns to subscriber lists you fully control.$q$,
  og_description = $q$phpList: free, open-source, self-hosted newsletter software for sending email campaigns to subscriber lists you fully control.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05c5746c-f3a3-47a9-b647-2b4ab14ad200';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05c5746c-f3a3-47a9-b647-2b4ab14ad200' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Subscriber list management$q$, $q$Organize subscribers into lists with custom fields and segmentation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Campaign creation and sending$q$, $q$Compose and send email campaigns to subscriber lists of varying sizes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Plugin architecture$q$, $q$Extend core functionality with plugins, including a REST API plugin for programmatic access.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Self-hosted deployment$q$, $q$Runs on your own PHP/MySQL server, giving full control over data and sending infrastructure.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Bounce and unsubscribe handling$q$, $q$Processes bounces and unsubscribe requests to keep lists compliant and clean.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Free and open source, with full control over hosting and subscriber data$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Long track record — the project dates back to 2000$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Extensible via a plugin system, including an optional REST API plugin$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Can scale from small lists to large subscriber bases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Self-hosting requires managing your own PHP/MySQL server and email deliverability$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$AGPL licensing requires sharing modified source code if you run a customized version publicly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Fewer built-in modern campaign-analytics and design features than some commercial SaaS email marketing tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Is phpList free?$q$, $q$Yes, the self-hosted phpList software at phplist.org is free and open source under the AGPL v3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Is there a hosted version of phpList?$q$, $q$Yes, phpList.com offers a separately branded commercial hosted service for people who don't want to self-host, but the core phpList software itself is free open source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$What license does phpList use?$q$, $q$phpList is released under the GNU Affero General Public License (AGPL) version 3.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Does phpList have an API?$q$, $q$phpList offers an optional REST API plugin for programmatic list and campaign management.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Self-hosted newsletter sending$q$, $q$Send newsletters and announcements to a subscriber list from your own server.$q$, $q$Organizations that want full data ownership over their email marketing$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$Large-scale campaign delivery$q$, $q$Manage and send to subscriber lists ranging from hundreds to much larger audiences.$q$, $q$Publishers and marketing teams running self-hosted infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$phpList is open-source email marketing and newsletter software, originally created in 2000 by Michiel Dethmers. It is released under the GNU Affero General Public License (AGPL) v3, which means anyone who runs a modified version on a public server must make that modified source code available to their users.$q$, $q$The self-hosted version at phplist.org is free to download and deploy on your own PHP server, and it is designed to scale from a few hundred subscribers up to large lists. A separately branded commercial hosted service, phpList.com, also exists for people who prefer not to manage their own server, and it operates independently from the free self-hosted project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$phpList fits organizations and developers who want full control over their newsletter and campaign infrastructure — including data ownership and deliverability — and who are comfortable hosting a PHP application rather than relying on a third-party SaaS email marketing tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c5746c-f3a3-47a9-b647-2b4ab14ad200', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Postorius ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Postorius is the free, open-source Django-based web interface for administering and using GNU Mailman 3 mailing lists.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Postorius: the free, open-source Django web interface for administering GNU Mailman 3 mailing lists in a browser.$q$,
  og_description = $q$Postorius: the free, open-source Django web interface for administering GNU Mailman 3 mailing lists in a browser.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6930e11f-db83-4fac-9da3-6754439654e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6930e11f-db83-4fac-9da3-6754439654e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Web-based list creation and management$q$, $q$Create, configure, and delete mailing lists from a browser interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Subscriber management$q$, $q$Approve, remove, or manage subscribers and moderators through the web UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Moderation queue$q$, $q$Review and act on held messages and pending subscription requests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$List settings configuration$q$, $q$Adjust list-wide settings such as posting policy, digest options, and privacy controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Django-based deployment$q$, $q$Runs as a standard Django application, fitting into common Python web-hosting environments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Free and open source under the LGPL v3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Gives Mailman 3 a modern, browser-based admin experience instead of command-line-only management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Actively developed as part of the official Mailman 3 suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Familiar Django deployment model for teams already using Python web stacks$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Requires a working GNU Mailman Core installation to function — it is not a standalone product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Deploying the full stack (Core, Postorius, and typically HyperKitty) takes more setup than a single-package tool$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Requires Python 3.9+ and Django 4.2+, adding dependency management overhead$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Is Postorius free?$q$, $q$Yes, Postorius is free, open-source software released under the LGPL v3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Can I use Postorius without Mailman?$q$, $q$No. Postorius is a front-end for GNU Mailman Core and requires a running Mailman 3 installation to operate.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$What technology is Postorius built on?$q$, $q$It's a Django application requiring Python 3.9 or newer and Django 4.2 or newer.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Who maintains Postorius?$q$, $q$It is maintained as part of the official GNU Mailman 3 project under the Free Software Foundation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Web-based Mailman administration$q$, $q$Give list owners and moderators a browser interface for day-to-day mailing list management.$q$, $q$Mailing list administrators and moderators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$Self-service subscriber management$q$, $q$Let subscribers manage their own subscription settings through a web UI.$q$, $q$Mailing list subscribers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Postorius is the web-based administration and subscriber interface for GNU Mailman 3, originating from a Google Summer of Code project in 2010-2011 and now maintained under the Free Software Foundation's Mailman project. It is released under the GNU Lesser General Public License (LGPL) v3.$q$, $q$Built as a Django application, Postorius requires a running GNU Mailman Core installation to connect to and lets list owners, moderators, and subscribers manage lists, members, and settings through a browser instead of the command line. It's the piece of the Mailman 3 suite most users interact with directly for day-to-day list administration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Postorius is for anyone running GNU Mailman 3 who wants a browser-based way to create and manage lists, approve subscribers, moderate posts, and adjust list settings, rather than relying solely on command-line tools or the raw REST API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6930e11f-db83-4fac-9da3-6754439654e5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Schleuder ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Schleuder is an open-source, self-hosted mailing list manager that encrypts group email with OpenPGP.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Schleuder is a free, self-hosted mailing list manager that encrypts group email with OpenPGP so subscribers can communicate privately.$q$,
  og_description = $q$Schleuder is a free, self-hosted mailing list manager that encrypts group email with OpenPGP so subscribers can communicate privately.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$OpenPGP encryption gateway$q$, $q$Decrypts incoming mail and re-encrypts a copy for each subscriber using their own public key, so no single party other than the list server handles plaintext for the whole group.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Send to and receive from non-subscribers$q$, $q$List members can email outsiders through the list address, and the list can accept incoming mail from non-subscribers, with encryption applied automatically where keys are known.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Email-command administration$q$, $q$Subscribers and administrators manage keys, membership, and list settings by sending structured commands via email, without requiring a separate admin panel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Per-subscriber key management$q$, $q$Each subscriber's OpenPGP public key is stored on the list and used automatically when encrypting outgoing copies of a message.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Optional web interface via API$q$, $q$The companion schleuder-web project can provide a browser-based front end that talks to Schleuder's API for list and subscriber management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Self-hosted Ruby application$q$, $q$Runs on your own server using Ruby, GnuPG 2.2+, and SQLite, giving operators full control over where encrypted mail is processed and stored.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Provides real end-to-end style encryption for group mailing lists, not just transport encryption$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Works entirely over standard email, so subscribers don't need a special client$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Self-hosted, so encrypted group communication stays on infrastructure you control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Actively maintained by a privacy-focused open-source community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Integrates with subscribers' existing OpenPGP keys$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Requires a technical setup (Ruby, GnuPG, SQLite) and comfort with command-line administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$No polished web GUI out of the box; the web interface is a separate, optional project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Email-command based administration has a learning curve for non-technical subscribers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Smaller community and ecosystem than mainstream mailing list managers like Sympa or Mailman$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$What is Schleuder used for?$q$, $q$It's used to run encrypted group mailing lists, so members can exchange OpenPGP-encrypted email through a shared list address instead of a standard, unencrypted mailing list.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Does Schleuder require GPG?$q$, $q$Yes. Schleuder relies on GnuPG to encrypt and decrypt messages for each subscriber's own key.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Can I self-host Schleuder?$q$, $q$Yes, it is self-hosted software written in Ruby, requiring Ruby, GnuPG, and SQLite on a server you control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Does Schleuder work with existing PGP keys?$q$, $q$Yes, subscribers add their existing OpenPGP public key to the list, which Schleuder then uses to encrypt their copy of each message.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Encrypted coordination for activist and journalist groups$q$, $q$Groups handling sensitive information can run a mailing list where every message is encrypted per subscriber, reducing exposure if the mail server is compromised.$q$, $q$Activist collectives, journalists, human-rights organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$Sensitive security or incident-response lists$q$, $q$Technical teams that already use GPG for other purposes can use Schleuder for internal security discussions that need encryption at rest and in transit.$q$, $q$Sysadmin and security teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Schleuder is a self-hosted, GPG-enabled mailing list manager. It acts as an email gateway for a group: subscribers exchange OpenPGP-encrypted messages among themselves, the list can receive email from non-subscribers, and subscribers can send mail out to non-subscribers through the list address, with Schleuder handling encryption and decryption on each hop.$q$, $q$Each list has its own key pair, and subscriber public keys are stored and validated on the server. Administration is done primarily through commands sent by email, which keeps the tool usable without a dedicated web dashboard, though an optional web interface (schleuder-web) can be run against its API. Schleuder is written in Ruby and depends on GnuPG and SQLite.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Schleuder is aimed at privacy-conscious groups, activist and journalist collectives, and technical teams who already use GPG and want an encrypted alternative to standard mailing list managers for sensitive group communication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d8b2b44-477b-41ea-a9d3-9c1a6fd53b08', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Sympa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sympa is an open-source mailing list manager built for organizations running large-scale email lists.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1997,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sympa is a free, open-source mailing list manager built for organizations that need to run and moderate large-scale email lists.$q$,
  og_description = $q$Sympa is a free, open-source mailing list manager built for organizations that need to run and moderate large-scale email lists.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ec09d1fb-87fc-4f2f-b8e5-57d9e785d533' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Web-based list management$q$, $q$Administrators and moderators manage subscriptions, list settings, and message moderation through a browser interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Archive browsing$q$, $q$Mailing list archives are browsable through the web interface, giving members a searchable history of list activity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$DKIM and ARC support$q$, $q$Built-in support for DKIM signing and ARC helps outgoing list mail pass modern email authentication checks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$SOAP API$q$, $q$Provides a SOAP API for integrating list management and subscription actions with external systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Scalable message distribution$q$, $q$Designed to distribute messages efficiently to large subscriber bases without excessive delay.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Command-line administration$q$, $q$Server administrators can perform maintenance and configuration tasks through command-line tools alongside the web UI.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Handles very large mailing lists efficiently$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Long track record, in active development since 1997$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Web interface for both administrators and subscribers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Free and open source with an active community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$SOAP API for integration with other systems$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Setup and configuration are more involved than lightweight mailing list tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Interface feels dated compared to newer SaaS email tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Best documentation and community support skew toward academic/research use cases$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Requires a Perl runtime and its own set of system dependencies to self-host$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Is Sympa free to use?$q$, $q$Yes, Sympa is free, open-source software released under the GPL, with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Can Sympa handle large mailing lists?$q$, $q$Yes, it is specifically designed for performance on large lists, with the project citing delivery to 90% of a 20,000-member list in about five minutes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Does Sympa have an API?$q$, $q$Yes, it exposes a SOAP API for programmatic list and subscription management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Who maintains Sympa?$q$, $q$Sympa is maintained by The Sympa Community; earlier development was carried out by RENATER and, before that, the Comité Réseau des Universités (CRU).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$University and research mailing lists$q$, $q$Institutions can run large numbers of department, course, or research group mailing lists with self-service subscription and moderation.$q$, $q$Universities and research networks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$Large member or association newsletters$q$, $q$Organizations with tens of thousands of members can distribute list mail reliably while keeping full control of subscriber data on their own servers.$q$, $q$Membership organizations and associations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Sympa (SYsteme de Multi-Postage Automatique) is an open-source mailing list management system first released in 1997 and now maintained by the Sympa Community. It automates subscription handling, message moderation, and archiving, and is built to perform well on large lists — the project cites being able to send a message to 90% of subscribers of a 20,000-member list within about five minutes.$q$, $q$Administration and list browsing happen through a web interface, with a SOAP API available for programmatic access and command-line tools for server administrators. Sympa supports DKIM and ARC email authentication, customizable subscriber data sources, and translations into a number of languages. It is written primarily in Perl.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Sympa is aimed at universities, research networks, and organizations that need to run and moderate many mailing lists at scale, historically with strong adoption among French and European academic and research institutions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec09d1fb-87fc-4f2f-b8e5-57d9e785d533', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cypht ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cypht is a free, self-hosted webmail app that combines multiple email accounts and RSS feeds into one unified inbox.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Cypht is a free, open-source webmail app that unifies multiple IMAP, JMAP, EWS email accounts and RSS feeds into one self-hosted inbox.$q$,
  og_description = $q$Cypht is a free, open-source webmail app that unifies multiple IMAP, JMAP, EWS email accounts and RSS feeds into one self-hosted inbox.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '665b1bfd-5f00-4b50-b428-2743e447dd31';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '665b1bfd-5f00-4b50-b428-2743e447dd31' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Unified multi-account inbox$q$, $q$Combines messages from several connected email accounts into a single consolidated view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Multi-protocol support$q$, $q$Connects to accounts over IMAP/SMTP, JMAP, and EWS, covering both traditional and modern mail backends.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Universal search$q$, $q$Searches across all connected email accounts and RSS feeds from one search box.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Sieve-based filtering$q$, $q$Supports server-side Sieve filters so mail can be organized even when the client is offline.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Flexible authentication$q$, $q$Supports IMAP, LDAP, and OAuth-based authentication for connecting accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Modular architecture$q$, $q$Functionality is delivered through module sets, letting administrators enable only the features they need.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Lightweight compared to full-featured webmail suites$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Handles multiple accounts and protocols (IMAP, JMAP, EWS) in one interface$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Combines email with RSS feed reading$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Free, open source, and self-hosted$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Modular design keeps the footprint small$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Interface is more utilitarian than polished, consumer-style webmail clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Smaller plugin and theme ecosystem than Roundcube$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$JMAP/EWS support depends on the mail server's own protocol implementation$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Best suited to users comfortable with self-hosting PHP applications$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Is Cypht free?$q$, $q$Yes, Cypht is free, open-source software licensed under LGPL-2.1.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Can Cypht combine multiple email accounts?$q$, $q$Yes, its core feature is aggregating multiple IMAP/SMTP, JMAP, and EWS accounts into one unified inbox.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Does Cypht support RSS feeds?$q$, $q$Yes, it can pull in RSS feeds alongside email so both appear in the same unified interface and search.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$What is Cypht built with?$q$, $q$It's built primarily in PHP with JavaScript for the front end, designed to be lightweight for self-hosted deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Consolidating multiple email accounts$q$, $q$Users with several personal or work email addresses across different providers can read and search all of them from one self-hosted inbox.$q$, $q$Individuals and small teams managing multiple mailboxes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$Lightweight self-hosted webmail for organizations$q$, $q$Admins who want a low-resource webmail option for staff, without the overhead of a heavier full-suite client, can deploy Cypht on modest hosting.$q$, $q$IT admins running self-hosted mail infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cypht is an open-source webmail application that aggregates messages from multiple email accounts into a single unified view, functioning somewhat like a news reader but for email. It supports IMAP/SMTP, JMAP, and EWS (Exchange Web Services), so it can pull mail from a mix of account types into one interface.$q$, $q$The application is built around a modular system of 'module sets' that add or extend functionality, and it supports IMAP, LDAP, and OAuth authentication. Cypht also includes Sieve-based server-side filtering, universal search across connected accounts and RSS feeds, and cross-account message actions. It is written in PHP and JavaScript, licensed under LGPL-2.1, and free to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Cypht suits people and organizations who manage several email accounts (personal, work, multiple domains) and want one lightweight, self-hosted interface instead of switching between separate webmail logins, plus admins who want a low-overhead alternative to heavier webmail clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('665b1bfd-5f00-4b50-b428-2743e447dd31', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Roundcube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Roundcube is a free, open-source, browser-based IMAP email client with a desktop-application-style interface.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Roundcube is a free, open-source, browser-based IMAP webmail client with a desktop-style interface and a large plugin ecosystem.$q$,
  og_description = $q$Roundcube is a free, open-source, browser-based IMAP webmail client with a desktop-style interface and a large plugin ecosystem.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eb4553dc-a02b-4c01-a2c6-6a0dc57786d4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Desktop-style IMAP client in the browser$q$, $q$Provides an application-like interface for browsing, composing, and managing IMAP mailboxes from any modern browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Address book with LDAP support$q$, $q$Built-in contact management that can connect to LDAP directories in addition to local contacts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Plugin and skin architecture$q$, $q$A documented plugin API and skin system let administrators extend functionality and customize the interface without modifying core code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$PGP encryption support$q$, $q$Supports PGP-based message encryption and signing through its plugin ecosystem for users who need end-to-end encrypted email.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Drag-and-drop message management$q$, $q$Messages can be organized between folders using drag-and-drop, similar to a desktop mail client.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Multi-database backend support$q$, $q$Works with MariaDB, MySQL, PostgreSQL, or SQLite for storing user preferences, contacts, and cached data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Mature, widely deployed project with a large plugin ecosystem$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Desktop-like usability inside a browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Free, open source, self-hostable alongside any IMAP mail server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Actively maintained with regular security updates$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Multilingual interface$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Requires a separate IMAP/SMTP mail server; Roundcube itself is only the webmail front end$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Default skin looks dated unless a modern theme/plugin is applied$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Plugin quality varies since many are third-party contributions$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Self-hosting requires ongoing maintenance (PHP, database, security patches)$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Is Roundcube free?$q$, $q$Yes, Roundcube is free, open-source software licensed under GPLv3 with a plugin exception.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Does Roundcube include its own mail server?$q$, $q$No, Roundcube is a webmail client only — it connects to an existing IMAP/SMTP mail server such as Dovecot and Postfix.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Can Roundcube be extended with plugins?$q$, $q$Yes, it has a documented plugin API and skin system used by a large ecosystem of community plugins.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$How is Roundcube typically deployed?$q$, $q$It's commonly deployed from source packages or as a Docker container on a server that already runs an IMAP mail service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Webmail for self-hosted mail servers$q$, $q$Organizations running their own IMAP/SMTP infrastructure can offer users a browser-based inbox without relying on third-party webmail.$q$, $q$IT admins and hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$Privacy-conscious email access$q$, $q$Users who want browser-based access to a self-hosted mailbox with optional PGP support can use Roundcube instead of a cloud webmail provider.$q$, $q$Privacy-focused individuals and small organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Roundcube is a browser-based, multilingual IMAP email client designed to feel like a desktop application. It offers drag-and-drop message handling, full MIME and HTML message support, an address book with LDAP connectors, spell checking, PGP encryption support, and a responsive layout for different screen sizes.$q$, $q$The software is free and open source, licensed under GPLv3 with a plugin exception that lets developers build plugins and skins without triggering GPL obligations on their own code. Roundcube is written in PHP and JavaScript, stores its data in MariaDB, MySQL, PostgreSQL, or SQLite, and is commonly deployed via source packages or Docker containers alongside a mail server such as Dovecot or Postfix.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Roundcube is one of the most widely deployed self-hosted webmail clients, used by hosting providers, businesses, and individuals who run their own mail servers and want a modern, plugin-extensible browser interface for their users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb4553dc-a02b-4c01-a2c6-6a0dc57786d4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SnappyMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SnappyMail is a free, self-hosted, lightweight webmail client forked from RainLoop for modern browsers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SnappyMail is a free, open-source, lightweight self-hosted webmail client forked from RainLoop for modern browsers.$q$,
  og_description = $q$SnappyMail is a free, open-source, lightweight self-hosted webmail client forked from RainLoop for modern browsers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6bf9cca5-6080-4b58-bce7-1bc8b964a3f8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Lightweight, fast client$q$, $q$Small compressed download size and strong Lighthouse performance scores keep the interface responsive, especially on modest hardware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$IMAP and SMTP support$q$, $q$Connects to standard IMAP mailboxes and sends mail over SMTP; POP3 was removed after the RainLoop fork.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Sieve filter editor$q$, $q$Includes an advanced editor for managing server-side Sieve filtering rules directly from the webmail interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$PGP encryption$q$, $q$Supports PGP-based message encryption and signing for users who need encrypted email.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$No database required$q$, $q$Can be installed and run without setting up a separate database server, simplifying deployment.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Privacy-focused design$q$, $q$Avoids integrations such as Gravatar and social-media widgets to limit third-party data exposure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Very lightweight and fast compared to heavier webmail clients$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$No database dependency, simplifying self-hosted setup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Actively maintained continuation of the popular RainLoop project$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Free and open source under AGPLv3$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Privacy-conscious defaults with no tracking integrations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$No POP3 support, which was dropped from the original RainLoop codebase$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Smaller plugin/theme ecosystem than Roundcube$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Requires a modern browser (2020+); older browsers, including legacy Edge and IE, aren't supported$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Still requires a separate IMAP/SMTP mail server to connect to$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Is SnappyMail free?$q$, $q$Yes, SnappyMail is free, open-source software licensed under AGPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Is SnappyMail related to RainLoop?$q$, $q$Yes, it's a fork and continuation of RainLoop Webmail, rebuilt and modernized for current browsers after RainLoop's development stalled.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Does SnappyMail need a database?$q$, $q$No, it can be installed and run without a separate database server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$What PHP version does SnappyMail require?$q$, $q$PHP 7.4 or higher, with the mbstring extension enabled.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Fast webmail for self-hosted mail servers$q$, $q$Admins who want a responsive, low-overhead webmail front end for an existing IMAP/SMTP mail server can deploy SnappyMail instead of heavier alternatives.$q$, $q$Self-hosters and small hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$Privacy-focused email access$q$, $q$Users who want a webmail client without tracking integrations, plus optional PGP encryption, can use SnappyMail for day-to-day email access.$q$, $q$Privacy-conscious individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SnappyMail is a lightweight, self-hosted webmail client maintained by djmaze as a fork and continuation of the discontinued RainLoop project. It focuses on speed and a small footprint, with the client reported to download around 138 KB with Brotli compression and to score highly on Lighthouse performance audits.$q$, $q$It supports IMAP and SMTP (POP3 support was removed from the RainLoop codebase), a Sieve script editor for server-side filtering, PGP encryption, and dark mode, while deliberately avoiding tracking features like Gravatar or social-media integrations. It runs on PHP 7.4+ with the mbstring extension and needs no database to install, and is licensed under AGPLv3.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SnappyMail suits self-hosters and small mail providers who want a fast, minimal webmail client with modern browser support rather than a heavier, more feature-dense option like Roundcube.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf9cca5-6080-4b58-bce7-1bc8b964a3f8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SquirrelMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SquirrelMail is a long-running, free, open-source webmail client, now maintained only through occasional SVN snapshots.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SquirrelMail is a free, open-source webmail client with a long history, now maintained only through occasional SVN snapshots.$q$,
  og_description = $q$SquirrelMail is a free, open-source webmail client with a long history, now maintained only through occasional SVN snapshots.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Plugin-based architecture$q$, $q$Functionality such as authentication options, attachment handling, and message composition tools is added through a plugin system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$S/MIME support via plugins$q$, $q$Security-related plugins add capabilities like S/MIME message verification.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Low resource footprint$q$, $q$Designed to run with minimal server resources, which historically made it popular on shared hosting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Multiple folder support$q$, $q$Supports IMAP folder browsing and per-user preference configuration.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Extremely lightweight with minimal server resource requirements$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Long history and broad familiarity from its widespread past adoption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Free and open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Plugin system allows some functional customization$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$No official numbered release since 2011; current code ships only as SVN development snapshots$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Development activity is minimal compared to actively maintained clients like Roundcube$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Several hosting providers have dropped support and recommend migrating away from it$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Dated user interface compared to modern webmail clients$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Is SquirrelMail still maintained?$q$, $q$Only minimally — there has been no numbered release since 1.4.22 in 2011, though the project continues to publish SVN snapshots for PHP compatibility and occasional fixes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Is SquirrelMail free?$q$, $q$Yes, it is free, open-source software; the project also accepts donations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Should I choose SquirrelMail for a new deployment?$q$, $q$Given its limited ongoing maintenance, most new self-hosted webmail deployments are better served by an actively developed alternative such as Roundcube or SnappyMail.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Does SquirrelMail support plugins?$q$, $q$Yes, a range of community plugins extend authentication, attachments, composition, and security features.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Maintaining legacy webmail deployments$q$, $q$Organizations already running SquirrelMail can keep it operating on updated PHP versions using the current SVN snapshots.$q$, $q$Sysadmins maintaining existing SquirrelMail installs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Minimal-resource webmail experiments$q$, $q$Hobbyists on very constrained hosting can use SquirrelMail's lightweight footprint for a basic webmail front end.$q$, $q$Hobbyist self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SquirrelMail is a browser-based email client, branded 'Webmail for Nuts!', that has been used to add a web front end to IMAP mailboxes since the early 2000s. It supports a plugin system covering authentication methods, attachment handling, message composition, and security features such as S/MIME verification.$q$, $q$The project has not had a numbered release since version 1.4.22 in 2011. Since then it has continued only as SVN snapshots aimed at keeping the codebase compatible with newer PHP versions, and some hosting providers have publicly announced they no longer support it. Prospective users should weigh this against more actively developed alternatives such as Roundcube or SnappyMail.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SquirrelMail is now relevant mainly to legacy deployments that already run it and to hobbyists interested in a very lightweight, dependency-light webmail client — new self-hosted mail projects should generally consider a more actively maintained client.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ergo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ergo is a free, open-source IRC server written in Go that bundles services and bouncer-style history into one binary.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ergo is a free, open-source IRC server written in Go that bundles account services and bouncer-style chat history into one binary.$q$,
  og_description = $q$Ergo is a free, open-source IRC server written in Go that bundles account services and bouncer-style chat history into one binary.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ccc97952-4222-4741-b1ae-b6303ffa2241';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ccc97952-4222-4741-b1ae-b6303ffa2241' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Integrated services$q$, $q$NickServ, ChanServ, and HostServ are built into the server, so account registration and channel management don't require a separate services package.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Bouncer-style message history$q$, $q$Stores and replays chat history, letting multiple clients or reconnects pick up recent conversation like a bouncer would.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Modern IRCv3 support$q$, $q$Implements a broad set of IRCv3 specifications, positioning Ergo as a reference implementation for modern IRC clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Single-binary deployment$q$, $q$Ships as a self-contained Go binary, simplifying installation compared to multi-component IRC stacks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Runtime-reloadable YAML config$q$, $q$Server configuration is defined in YAML and can be reloaded without restarting the server.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$SASL and optional LDAP auth$q$, $q$Supports SASL authentication and can integrate with LDAP for account verification.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Single binary bundles ircd, services, and bouncer-like history in one deployment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Modern IRCv3 support suitable as a reference implementation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Free, open source under the permissive MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Runtime-reloadable configuration reduces downtime for config changes$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Built-in TLS, SASL, and Tor hidden service support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$IRC as a protocol has a smaller mainstream user base than modern chat platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$No official managed hosting; operators run and maintain their own server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Bundling services into the ircd is a different architecture than the traditional ircd + services split, which may not fit networks wanting that separation$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Documentation and community are smaller than long-established IRC servers like InspIRCd$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Is Ergo free to use?$q$, $q$Yes, Ergo is free, open-source software licensed under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$What language is Ergo written in?$q$, $q$Go, which lets it ship as a single self-contained binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Does Ergo include IRC services like NickServ?$q$, $q$Yes, NickServ, ChanServ, and HostServ are built directly into the server rather than requiring a separate services package.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Can Ergo replay chat history like a bouncer?$q$, $q$Yes, it includes bouncer-style history storage and replay, and supports multiple clients sharing a nickname.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Running a small-to-mid IRC community$q$, $q$Communities can stand up a modern IRC network with accounts, channel registration, and history in one deployment instead of assembling separate ircd and services software.$q$, $q$IRC network operators and community admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$Self-hosted team chat over IRC$q$, $q$Technical teams that prefer IRC over modern chat apps can run Ergo for lightweight, persistent group chat with bouncer-style history.$q$, $q$Technical teams and open-source projects$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ergo is a modern IRC server (IRCd) written in Go, distributed under the MIT license. It combines traditional server functionality with integrated services — NickServ for account management, ChanServ for channel registration, and HostServ for vanity hosts — plus bouncer-style features that store and replay message history and let multiple clients share a nickname.$q$, $q$The project emphasizes simple deployment as a single binary, broad IRCv3 protocol support intended to make it usable as a reference implementation, and runtime-reloadable YAML configuration. It supports SASL authentication, optional LDAP integration, TLS with client certificates, IP cloaking, and Tor hidden service compatibility.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Ergo is aimed at communities and administrators who want to run a modern, easy-to-deploy IRC network with built-in account services and message history, without stitching together a separate ircd, services daemon, and bouncer.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ccc97952-4222-4741-b1ae-b6303ffa2241', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── InspIRCd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$InspIRCd is a free, open-source, modular IRC server (IRCv3-compliant) for UNIX-like systems and Windows.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$InspIRCd is a free, open-source, modular IRCv3-compliant IRC server for UNIX-like systems and Windows, used by 1,000+ networks.$q$,
  og_description = $q$InspIRCd is a free, open-source, modular IRCv3-compliant IRC server for UNIX-like systems and Windows, used by 1,000+ networks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3277e798-0260-4d98-ba6f-cc95e7dc5b48';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3277e798-0260-4d98-ba6f-cc95e7dc5b48' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Modular architecture$q$, $q$Server features are provided as modules, so operators can enable exactly the functionality their network needs and keep the core lightweight.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$IRCv3 compliance$q$, $q$Supports all ratified IRCv3 specifications, keeping the server compatible with modern IRC clients and bouncers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Cross-platform support$q$, $q$Runs on UNIX-like systems as well as Windows, with documented install paths for Debian, Ubuntu, RHEL, Docker, and source builds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Proven at scale$q$, $q$Powers over 1,000 IRC networks, including established communities like Snoonet and HybridIRC.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Active release cadence$q$, $q$Maintained by the InspIRCd Contributors with regular version releases and up-to-date documentation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Docker deployment$q$, $q$Official Docker support simplifies containerized deployment for self-hosters.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Modular design keeps footprint lean while allowing extensive customization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Runs on both UNIX-like systems and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Proven in production on networks with large user bases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Actively maintained with regular releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Free and open source under GPLv2$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Configuration and module system have a learning curve for first-time IRC operators$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$IRC networks still require separate services software (like Anope or Atheme) for account/channel registration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Documentation is comprehensive but geared toward operators already familiar with IRC concepts$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$No official managed hosting; operators self-host and maintain their own servers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Is InspIRCd free?$q$, $q$Yes, InspIRCd is free, open-source software licensed under GPLv2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Does InspIRCd run on Windows?$q$, $q$Yes, it officially supports both UNIX-like systems and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$How many networks use InspIRCd?$q$, $q$The project reports more than 1,000 IRC networks running InspIRCd, including HybridIRC, Snoonet, and Teranova.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Is InspIRCd IRCv3 compliant?$q$, $q$Yes, it supports all ratified IRCv3 specifications.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Running an established IRC network$q$, $q$Network operators managing large or growing communities can rely on InspIRCd's modular design and track record for stability at scale.$q$, $q$IRC network operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$Cross-platform self-hosted chat infrastructure$q$, $q$Teams needing an IRC server that runs on both Linux and Windows infrastructure can standardize on InspIRCd across environments.$q$, $q$IT teams managing mixed-OS infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$InspIRCd is a high-performance IRC server (IRCd) for UNIX-like and Windows systems, licensed under GPLv2. It's built around a modular architecture, so administrators enable only the modules they need, and it supports the ratified IRCv3 specifications for compatibility with modern IRC clients.$q$, $q$The project provides installation paths for Debian, Ubuntu, RHEL, Docker, Windows, and source builds, and is maintained by the InspIRCd Contributors with ongoing releases — version 4.11.0 shipped in June 2026. InspIRCd powers more than 1,000 IRC networks, including HybridIRC, Snoonet, and Teranova.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$InspIRCd is aimed at network operators who want a stable, modular, actively maintained IRC server that runs on both Linux/Unix and Windows and can scale to large, established networks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3277e798-0260-4d98-ba6f-cc95e7dc5b48', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Kiwi IRC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kiwi IRC is a free, open-source, browser-based IRC client that connects to networks without any download or plugin.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kiwi IRC is a free, open-source, browser-based IRC client used by several established networks, deployable as static files.$q$,
  og_description = $q$Kiwi IRC is a free, open-source, browser-based IRC client used by several established networks, deployable as static files.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c54263d-78af-448f-8e86-9807365dad70';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c54263d-78af-448f-8e86-9807365dad70' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Static-file deployment$q$, $q$The client is entirely static files, so it can be hosted on any web server or CDN without a dedicated backend for the front end.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Multiple connection modes$q$, $q$Connects via websocket IRC servers, the webircgateway proxy, or KiwiBNC for persistent bouncer-style sessions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Theming and layout options$q$, $q$Includes multiple layout choices along with light and dark themes for the interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Desktop notifications$q$, $q$Supports browser desktop notifications for new messages and mentions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Plugin system$q$, $q$Extensible with plugins, including community additions for file uploads and video conferencing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Single JSON runtime config$q$, $q$Client behavior and network settings are configured through one JSON file, applied at runtime.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$No installation required for end users — runs entirely in the browser$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Free, open source under a permissive Apache-2.0 license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Simple, static-file deployment on any web host or CDN$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Used and battle-tested by several large, established IRC networks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Extensible through a plugin system$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Requires a compatible connection method (websocket IRC server, webircgateway, or KiwiBNC) on the server side$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$No official managed/paid hosting; operators host and configure it themselves$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$As a client only, it depends on a separate IRC server or bouncer for the actual network$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Advanced customization requires editing the JSON runtime config$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Is Kiwi IRC free?$q$, $q$Yes, Kiwi IRC is free, open-source software licensed under Apache-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Do I need to install anything to use Kiwi IRC?$q$, $q$No, it runs entirely in the browser as a web-based client with no download or plugin required by end users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$What IRC networks use Kiwi IRC?$q$, $q$It has been used as the embedded web client for several established networks, including EFnet, DALnet, Snoonet, and Rizon, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Does Kiwi IRC need its own server?$q$, $q$It needs a compatible backend connection — a websocket-capable IRC server, the webircgateway proxy, or KiwiBNC — since Kiwi IRC itself is only the client.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$In-browser chat widget for an IRC network$q$, $q$Network operators can embed Kiwi IRC on their website so visitors can join channels instantly without installing a separate IRC client.$q$, $q$IRC network operators and community sites$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$Lightweight team chat over IRC$q$, $q$Teams that already run an IRC server can give members a friendly, no-install web client instead of requiring a desktop IRC app.$q$, $q$Self-hosted IRC communities and teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kiwi IRC is an open-source, web-based IRC client, licensed under Apache-2.0 and built with Vue.js. It's made up entirely of static files, so it can be deployed on any web server or CDN without a backend application server for the client itself. It connects through websocket-enabled IRC servers, the webircgateway proxy, or KiwiBNC for persistent, bouncer-like connections.$q$, $q$The client offers multiple layout options, light and dark themes, desktop notifications, text styling, and a plugin system that supports extensions like file uploading and video conferencing. It's used as the embedded web client by a number of established IRC networks, including Freenode (historically), EFnet, DALnet, Snoonet, and Rizon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Kiwi IRC is built for IRC network operators who want to offer visitors an in-browser chat client without requiring a desktop app, and for anyone who wants to join an IRC channel instantly from a web page.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c54263d-78af-448f-8e86-9807365dad70', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ngircd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ngIRCd is a free, open-source, lightweight IRC server for small or private networks, maintained since 2001.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ngIRCd is a free, open-source, lightweight IRC server for small or private networks, maintained since 2001 and available for Linux, macOS, BSD, and Windows.$q$,
  og_description = $q$ngIRCd is a free, open-source, lightweight IRC server for small or private networks, maintained since 2001 and available for Linux, macOS, BSD, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9bad036a-a837-4c1f-9a3f-9f0c17e20ff1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$IPv6 and SSL/TLS support$q$, $q$Supports modern IPv6 connectivity alongside encrypted SSL/TLS client connections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$PAM authentication$q$, $q$Can authenticate users against the system's PAM stack in addition to standard IRC password auth.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Host cloaking$q$, $q$Provides cloaking functionality to hide users' real hostnames or IP addresses for privacy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Works with dynamic IPs$q$, $q$Designed to keep operating cleanly on connections with dynamic (changing) IP addresses, common on home networks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Cross-platform C codebase$q$, $q$Portable C source runs on Linux, macOS, BSD variants, and Windows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Server clustering$q$, $q$Can run as a standalone server or be linked with other ngIRCd instances into a network cluster.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Simple to set up, with the project citing a working server in about five minutes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Low resource requirements, suited to small or home servers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Long-running, stable project maintained continuously since 2001$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Cross-platform, including native Windows support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Free and open source under the GPL$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Aimed at small/private networks rather than large public IRC networks with heavy services needs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$No built-in NickServ/ChanServ-style services; those require separate software$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Smaller community and ecosystem than more widely used ircd projects$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Documentation is functional but less extensive than larger IRC server projects$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Is ngIRCd free?$q$, $q$Yes, ngIRCd is free, open-source software licensed under the GPL.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$How long has ngIRCd been developed?$q$, $q$It has been maintained by Alexander Barton and contributors since 2001.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Does ngIRCd run on Windows?$q$, $q$Yes, along with Linux, macOS, and BSD variants, thanks to its portable C codebase.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Is ngIRCd suited to large public IRC networks?$q$, $q$It's primarily designed for small or private networks; very large public networks typically use servers built for that scale, like InspIRCd or Ergo.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Private IRC server for a small community$q$, $q$Hobbyists or small groups can run a lightweight, low-maintenance IRC server for private chat without the overhead of a large network stack.$q$, $q$Hobbyists and small communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$Home lab or self-hosted network chat$q$, $q$Self-hosters running services on dynamic home IP addresses can use ngIRCd's dynamic-IP handling for a personal or family IRC server.$q$, $q$Home lab and self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ngIRCd is a lightweight, open-source IRC server aimed at small or private networks, able to run standalone or as part of a server cluster. It's licensed under the GPL and has been maintained by Alexander Barton and contributors since 2001, giving it a long track record of steady, incremental development.$q$, $q$The server supports IPv6 and SSL/TLS connections, PAM-based authentication, standard user and channel modes, host cloaking for privacy, and works with dynamic IP addresses, which suits home or small-office deployments. Written in portable C, it runs on Linux, macOS, BSD variants, and Windows, and the project states a basic setup can be ready for use in about five minutes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ngIRCd is aimed at hobbyists, small communities, and admins who want a simple, low-maintenance IRC server for a private or small network rather than a large public IRC network with heavy services requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bad036a-a837-4c1f-9a3f-9f0c17e20ff1', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Quassel IRC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A cross-platform, distributed IRC client that splits into a core and client so you stay connected and pick up history anywhere.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Quassel IRC is a free, open-source, cross-platform IRC client with a persistent core so you never lose channel history.$q$,
  og_description = $q$Quassel IRC is a free, open-source, cross-platform IRC client with a persistent core so you never lose channel history.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2fb7e2c0-a5af-47c6-b92d-1e035732d406';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2fb7e2c0-a5af-47c6-b92d-1e035732d406' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Core/client split$q$, $q$A persistent core stays connected to IRC servers while GUI clients attach and detach independently.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Cross-platform clients$q$, $q$Native clients are available for Linux, Windows, macOS, and Android.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Backlog sync$q$, $q$Chat history is stored on the core and synchronized to any client that connects, so nothing is missed while offline.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$IRCv3 support$q$, $q$Supports modern IRCv3 capabilities alongside classic IRC formatting and features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Multiple network connections$q$, $q$Connect to and manage many IRC networks and channels simultaneously from one core.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Always-on core means you never miss channel history$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Native, full-featured GUI rather than a web wrapper$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Free, open source (GPL), and self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Mobile client available for Android$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Requires you to run and maintain a separate core process/server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$No official iOS client$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Interface is more IRC-power-user oriented than beginner friendly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Is Quassel IRC free?$q$, $q$Yes. Quassel is free and open-source software released under the GPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Do I need to self-host the core?$q$, $q$Yes, the core is a separate process you run (typically on a server you control) that your clients connect to.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Does Quassel work on mobile?$q$, $q$There is a native Android client; there is no official first-party iOS client.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$What platforms are supported?$q$, $q$Official clients are available for Linux, Windows, macOS, and Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Always-connected IRC presence$q$, $q$Run the core on a VPS so you stay connected to your networks and never lose channel backlog, then attach a client whenever you're online.$q$, $q$IRC users and community members$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$Multi-device chat continuity$q$, $q$Switch between a desktop client at work and an Android client on the go while staying on the same channels with shared history.$q$, $q$Developers and open-source contributors$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Quassel IRC is an open-source IRC client built around a core-and-client architecture: a lightweight core process stays connected to IRC networks around the clock, while one or more graphical clients attach to and detach from that core at will. It's conceptually similar to running a text client inside a terminal multiplexer, but with a full Qt-based graphical interface instead.$q$, $q$Because the core keeps running independently of any client, users can close their laptop, switch to a phone, or open a second window on another machine and pick up exactly where they left off, with backlog and channel state preserved on the core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Quassel suits IRC users who want a persistent presence on multiple channels without running a separate bouncer and client, and who prefer a native desktop or mobile app over a browser-based interface. It's commonly self-hosted on a small VPS or home server as the always-on core, with the GUI client running locally on whatever device is in use.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fb7e2c0-a5af-47c6-b92d-1e035732d406', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Robust IRC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, self-hostable IRC network implementation in Go that eliminates netsplits using the Raft consensus algorithm.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$RobustIRC is a free, open-source IRC network implementation using Raft consensus to eliminate netsplits, used in production by hackint.$q$,
  og_description = $q$RobustIRC is a free, open-source IRC network implementation using Raft consensus to eliminate netsplits, used in production by hackint.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '979bd91f-de34-4fc6-a7cd-59bb08136756';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '979bd91f-de34-4fc6-a7cd-59bb08136756' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Netsplit-free architecture$q$, $q$Uses the Raft consensus algorithm across a server cluster so users don't get disconnected during node maintenance or failures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Client bridge$q$, $q$A bridge component lets existing IRC clients like WeeChat and irssi connect without modification.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Transparent server rollout$q$, $q$New server versions can be rolled out to the cluster without users noticing a connectivity interruption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$RFC 2812 compatibility$q$, $q$Implements the standard IRC protocol at the bridge layer for compatibility with existing tooling.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Removes netsplits, a long-standing pain point of traditional IRC networks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Free, open source, written in Go$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Proven in production on the hackint network$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Works with existing IRC clients via its bridge$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Aimed at operators running a whole network, not individual end users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Requires running and understanding a Raft-based server cluster$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Smaller community and documentation base than mainstream IRCds$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Is RobustIRC a replacement for my IRC client?$q$, $q$No. RobustIRC replaces the server side of an IRC network; you continue to use standard clients like WeeChat or irssi through its bridge.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Is RobustIRC free?$q$, $q$Yes, it is open-source software available on GitHub at no cost.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Who uses RobustIRC in production?$q$, $q$The hackint IRC network, used by parts of the European hacker community, runs on RobustIRC.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$How does it avoid netsplits?$q$, $q$It runs the network as a Raft consensus cluster, so nodes can be restarted or fail without disconnecting users from the network.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$Running a resilient community IRC network$q$, $q$Operate a multi-node IRC network where server maintenance and node failures don't disconnect users.$q$, $q$IRC network operators and hacker/tech communities$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RobustIRC is an open-source reimplementation of the server side of IRC, designed to remove the connectivity disruptions ('netsplits') that traditional multi-server IRC networks are prone to. It uses the Raft consensus algorithm across a cluster of servers so that node maintenance, restarts, and brief outages happen transparently to connected users.$q$, $q$Rather than replacing IRC clients, RobustIRC tunnels standard IRC traffic through its own RobustSession protocol via a bridge, so existing clients such as WeeChat or irssi continue to work unchanged. The project implements RFC 2812 compatibility at the bridge layer.$q$, $q$The software is actively developed on GitHub and is the technology behind the hackint IRC network used by parts of the European hacker/CCC community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RobustIRC is aimed at organizations or communities running their own IRC network who want server upgrades and node failures to be invisible to users, rather than individuals looking for a simple personal IRC client or bouncer.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('979bd91f-de34-4fc6-a7cd-59bb08136756', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── The Lounge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A self-hosted, always-online web IRC client with push notifications, file uploads, and multi-device sync.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$The Lounge is a free, self-hosted web IRC client with push notifications, file uploads, and always-online connectivity.$q$,
  og_description = $q$The Lounge is a free, self-hosted web IRC client with push notifications, file uploads, and always-online connectivity.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Always-online connection$q$, $q$Runs server-side so you stay connected to IRC channels even when your browser is closed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Push notifications$q$, $q$Sends browser and mobile push notifications for mentions and messages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$File uploads and link previews$q$, $q$Supports uploading files and shows inline previews for shared links.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$IRCv3 support$q$, $q$Implements modern IRCv3 protocol capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Multi-user support$q$, $q$A single self-hosted instance can serve multiple user accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Responsive web UI$q$, $q$Works across desktop, tablet, and smartphone browsers with a responsive layout.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$No native client needed; works entirely from a browser$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Free and open source under the MIT license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Acts as both bouncer and client in one deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Multi-user support makes it easy to share among a small group$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Requires self-hosting on infrastructure you manage (Node.js runtime)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$You are responsible for uptime and security of your own instance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$No official hosted/managed offering$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Is The Lounge free?$q$, $q$Yes, The Lounge is free, open-source software licensed under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Do I need a separate IRC bouncer?$q$, $q$No, The Lounge's server component stays connected to IRC on your behalf, functioning as its own bouncer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$What do I need to run it?$q$, $q$A server with Node.js where you can run and expose the web application.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Can multiple people use one instance?$q$, $q$Yes, The Lounge supports multiple user accounts on a single deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Personal always-on IRC access$q$, $q$Self-host an instance to stay connected to IRC channels from any browser without running a desktop client.$q$, $q$Individual IRC users and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Shared community access point$q$, $q$Deploy one instance for a small group or team to give everyone browser-based IRC access with their own account.$q$, $q$Small teams and open-source communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$The Lounge is a self-hosted, modern IRC client that runs as a web application, so a browser is the only client needed. Because the server component stays connected to IRC networks continuously, it doubles as a bouncer, meaning you don't need to run a separate bouncer alongside a traditional client.$q$, $q$It supports IRCv3 features, link previews, file uploads, and push notifications, and lets multiple people share a single deployment via multi-user support. Chat history and connection state persist across devices, so a session started on desktop can be picked up on a phone or tablet without losing context.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$The Lounge is a good fit for anyone who wants a persistent, always-connected IRC presence accessible from any device with a browser, without installing native software, and for small groups or communities that want to share a self-hosted IRC access point.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── UnrealIRCd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source IRC server with IRCv3 support, TLS, anti-flood/anti-spam tools, and a JSON-RPC API, in development since 1999.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$UnrealIRCd is a free, open-source IRC server with IRCv3 support, TLS, anti-spam tools, and a JSON-RPC API for Linux, macOS, and Windows.$q$,
  og_description = $q$UnrealIRCd is a free, open-source IRC server with IRCv3 support, TLS, anti-spam tools, and a JSON-RPC API for Linux, macOS, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a4646d4-397c-4756-8f0b-985b9dce7a8e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a4646d4-397c-4756-8f0b-985b9dce7a8e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$IRCv3 protocol support$q$, $q$Implements modern IRCv3 capabilities alongside classic IRC.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$TLS/SSL and cloaking$q$, $q$Supports encrypted connections and hostname cloaking to protect user privacy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Anti-flood and anti-spam$q$, $q$Built-in systems to throttle abusive connections and filter spam, including a spamfilter engine.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$GeoIP support$q$, $q$Can apply rules and restrictions based on connecting clients' geographic location.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$JSON-RPC API and webhooks$q$, $q$Exposes a JSON-RPC interface and webhook support for integrating with external tools and bots.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Module system$q$, $q$Extensible via C modules, with published module API documentation for third-party development.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Free and fully open source with over two decades of active development$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Runs on Linux, macOS, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Rich built-in anti-abuse tooling (flood/spam/GeoIP)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Modular architecture with an API for automation and bots$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Configuration and operation require IRC server administration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Web admin panel is a separate companion project, not bundled by default$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Maintained largely by volunteers, funded by donations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Is UnrealIRCd free?$q$, $q$Yes, UnrealIRCd is completely free and open source, maintained by volunteers and supported through donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$What platforms does it run on?$q$, $q$UnrealIRCd runs on Linux, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Does UnrealIRCd have an API?$q$, $q$Yes, it provides a JSON-RPC API and webhook support for integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Can I extend UnrealIRCd's functionality?$q$, $q$Yes, through its C module system, documented via a published module API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Running a public or community IRC network$q$, $q$Self-host an IRC server with modern protocol support and built-in abuse protection for a public or private community.$q$, $q$IRC network operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$Automating IRC network operations$q$, $q$Use the JSON-RPC API and webhooks to integrate bots, moderation tools, or monitoring with the IRC server.$q$, $q$Developers building IRC bots and integrations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$UnrealIRCd is an open-source IRC server (IRCd) that has been developed since 1999. It provides full IRCv3 protocol support, TLS/SSL encryption, hostname cloaking, and built-in anti-flood and anti-spam systems, along with GeoIP-based features and remote configuration includes.$q$, $q$Beyond core IRC serving, UnrealIRCd exposes a JSON-RPC API and supports webhooks, and it can be paired with a separate web administration panel for managing the server without editing configuration files directly. Its module system allows operators and third-party developers to extend server behavior in C.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$UnrealIRCd is built for people and organizations who want to run their own IRC network or server rather than connect as clients to an existing one — from small community networks to larger public IRC services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a4646d4-397c-4756-8f0b-985b9dce7a8e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Weechat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A fast, extensible terminal-based chat client for IRC with scripting in eight languages and remote access from browsers or mobile.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$WeeChat is a free, open-source, terminal-based IRC client with scripting in eight languages and remote relay access.$q$,
  og_description = $q$WeeChat is a free, open-source, terminal-based IRC client with scripting in eight languages and remote relay access.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee6c8b88-f000-4f14-8c23-19ab2bda304c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee6c8b88-f000-4f14-8c23-19ab2bda304c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Multi-server IRC support$q$, $q$Connect to and manage many IRC servers simultaneously, with proxy support and IPv6.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Scripting in 8 languages$q$, $q$Built-in script manager supports extensions in Python, Perl, Ruby, Lua, Tcl, Scheme, JavaScript, and PHP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Remote relay access$q$, $q$Connect to a running WeeChat instance from a browser, smartphone, GUI client, or another WeeChat via its relay protocol.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Customizable terminal UI$q$, $q$Horizontal/vertical window splits, smart filtering, customizable bars, and 256-color support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$SASL authentication$q$, $q$Supports SASL for secure authentication to IRC networks.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Free and open source, actively developed since 2003$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Extremely lightweight and fast, ideal for always-on server sessions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Highly scriptable and customizable$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Remote access via relay means it can double as a bouncer$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Terminal-based interface has a learning curve for non-CLI users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$No official native GUI client for desktop; relies on relay clients for a graphical experience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Scripting/plugin power comes with more setup than plug-and-play chat apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Is WeeChat free?$q$, $q$Yes, WeeChat is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Can I use WeeChat on mobile?$q$, $q$Yes, via relay clients that connect to a running WeeChat instance, including Android apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$What scripting languages does it support?$q$, $q$WeeChat's script manager supports Python, Perl, Ruby, Lua, Tcl, Scheme, JavaScript, and PHP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Does WeeChat work like a bouncer?$q$, $q$When run persistently on a server, its relay protocol lets other clients connect remotely, giving bouncer-like always-on behavior.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Persistent server-side IRC session$q$, $q$Run WeeChat inside a terminal multiplexer on a remote server to stay connected to IRC around the clock.$q$, $q$Developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$Scripted automation and bots$q$, $q$Write scripts in a supported language to automate notifications, filtering, or custom IRC behavior.$q$, $q$Power users and script developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$WeeChat (Wee Enhanced Environment for Chat) is a free, open-source chat client that has been in development since 2003. It's designed to be fast and lightweight, running in a terminal with support for multiple IRC servers, IPv6, SASL authentication, a nicklist, DCC, and 256-color display with customizable, splittable windows.$q$, $q$A built-in script manager supports extensions written in eight scripting languages, and WeeChat's relay protocol lets you connect to a running WeeChat instance remotely from a web browser, smartphone app, GUI client, Emacs, or even another WeeChat session — similar in spirit to a bouncer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$WeeChat suits power users and developers comfortable in a terminal who want a highly scriptable, low-resource IRC client, often run persistently inside a terminal multiplexer (like screen or tmux) on a remote server and accessed from multiple devices via its relay protocol.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee6c8b88-f000-4f14-8c23-19ab2bda304c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── ZNC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source IRC bouncer that stays connected to IRC networks so any client can disconnect and reconnect without losing history.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ZNC is a free, open-source IRC bouncer that keeps you connected to IRC and buffers activity for any client to catch up later.$q$,
  og_description = $q$ZNC is a free, open-source IRC bouncer that keeps you connected to IRC and buffers activity for any client to catch up later.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1f9434f4-e927-45b2-a88a-bd4e32807373';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1f9434f4-e927-45b2-a88a-bd4e32807373' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Always-connected buffering$q$, $q$Stays connected to IRC while you're offline and replays missed activity when you reconnect.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Multi-client, multi-user support$q$, $q$Multiple clients can connect to the same account simultaneously, and a single ZNC instance can host multiple users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Encrypted connections$q$, $q$Supports SSL/TLS for both the listening port and connections to IRC servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Module system$q$, $q$Extend functionality with dynamically loaded modules in C++, Perl, Python, or Tcl.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Per-channel playback buffer$q$, $q$Retains channel history per channel so clients can catch up after reconnecting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Transparent DCC bouncing$q$, $q$Bounces DCC file transfer connections through the bouncer transparently.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Works with any standard IRC client rather than requiring a specific one$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Mature project with two decades of development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Extensible via modules in multiple languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Requires self-hosting and server administration to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$No built-in graphical client; you still need a separate IRC client$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Configuration is done via config files/CLI, which has a learning curve$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Is ZNC free?$q$, $q$Yes, ZNC is free, open-source software licensed under Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Do I still need an IRC client with ZNC?$q$, $q$Yes, ZNC is a bouncer that sits between your IRC client and the IRC network; it does not replace your client.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Can multiple people share one ZNC install?$q$, $q$Yes, ZNC supports multiple user accounts on a single instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$What languages can I write ZNC modules in?$q$, $q$C++, Perl, Python, or Tcl.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Always-on IRC bouncer$q$, $q$Self-host ZNC so your IRC presence stays connected and you can catch up on channel history whenever you reconnect with your client.$q$, $q$IRC users who want a persistent connection$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$Shared bouncer for a small community$q$, $q$Run one ZNC instance with multiple user accounts to give a small group persistent IRC access.$q$, $q$Small teams and open-source communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ZNC is an advanced IRC bouncer, in development since 2004, that sits between an IRC network and one or more IRC clients. It stays connected to IRC even while a user is offline, buffering channel activity so that reconnecting later replays what was missed, including retaining nickname and operator status.$q$, $q$ZNC supports multiple users and multiple simultaneous client connections to the same account, SSL/TLS encryption, IPv6, and transparent DCC bouncing. It's written in C++ and extensible through dynamically loaded modules written in C++, Perl, Python, or Tcl.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ZNC is aimed at IRC users who want to pair their existing client of choice (irssi, WeeChat, HexChat, etc.) with an always-connected bouncer, rather than replacing the client itself — useful for individuals or small groups self-hosting shared bouncer access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f9434f4-e927-45b2-a88a-bd4e32807373', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Asterisk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source framework for building PBX and communications applications, sponsored by Sangoma since 1999.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Asterisk is a free, open-source framework for building PBX and telephony applications, sponsored by Sangoma since 1999.$q$,
  og_description = $q$Asterisk is a free, open-source framework for building PBX and telephony applications, sponsored by Sangoma since 1999.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Call routing and dialplan$q$, $q$A flexible dialplan engine controls how calls are routed, transferred, and handled.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$SIP and legacy telephony support$q$, $q$Interoperates with VoIP/SIP endpoints as well as traditional telephony hardware via interface cards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Voicemail and IVR$q$, $q$Built-in voicemail system and tools for building interactive voice response menus.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Conferencing$q$, $q$Supports multi-party audio conferencing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Extensible module architecture$q$, $q$Core functionality can be extended and customized through modules and APIs.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Free and open source under GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Extremely flexible for building custom telephony applications$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Backed by an active project sponsored by Sangoma and a large community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Works with both legacy telephony hardware and modern VoIP$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Raw Asterisk requires significant telephony and Linux expertise to configure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$No built-in graphical administration interface (typically paired with FreePBX for that)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Commercial modules and support are sold separately by Sangoma$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Is Asterisk free?$q$, $q$Yes, Asterisk is open-source software released under the GPLv2 license and free to download and use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Who maintains Asterisk?$q$, $q$Development is sponsored by Sangoma Technologies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Do I need FreePBX to use Asterisk?$q$, $q$No, FreePBX is an optional web GUI for managing Asterisk; Asterisk can be configured directly via its dialplan and config files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$What can Asterisk be used for?$q$, $q$Building PBX systems, call routing applications, voicemail, conferencing, and other telephony/communications applications.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Building a custom business phone system$q$, $q$Use Asterisk as the core engine for a self-hosted PBX with custom call routing, voicemail, and conferencing.$q$, $q$Telecom integrators and IT administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Developing communications applications$q$, $q$Build custom voice applications, IVR systems, or call center tooling on top of the Asterisk framework.$q$, $q$Developers building telephony software$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Asterisk is an open-source framework for building telephony and communications applications, created in 1999 by Mark Spencer and released under the GPLv2 license. It provides the building blocks for a software PBX: call routing, voicemail, conferencing, IVR, and interoperability with both legacy telephony hardware and VoIP/SIP endpoints.$q$, $q$Development is sponsored by Sangoma, which also produces the FreePBX web GUI for managing Asterisk and commercial products such as PBXact built on top of the open-source core. Asterisk itself remains free to download, run, and modify.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Asterisk is aimed at developers, integrators, and telecom-savvy administrators who want to build or run a custom phone system or communications application from the ground up, rather than a plug-and-play office phone solution — it's frequently deployed underneath GUI tools like FreePBX for less technical administration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Flexisip ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A modular, open-source SIP server suite from Belledonne Communications for self-hosted voice, video, and messaging services.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Grenoble, France$q$,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Flexisip is an open-source SIP server suite from Belledonne Communications for self-hosted voice, video, and messaging.$q$,
  og_description = $q$Flexisip is an open-source SIP server suite from Belledonne Communications for self-hosted voice, video, and messaging.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a1e7307b-a3f8-4883-8420-6b25b0764ca6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a1e7307b-a3f8-4883-8420-6b25b0764ca6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$SIP proxy and media relay$q$, $q$Routes calls and relays media between SIP endpoints.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Push notification gateway$q$, $q$Delivers push notifications to mobile SIP clients to wake them for incoming calls and messages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Presence server$q$, $q$Tracks and distributes user online/status information.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Conference server$q$, $q$Handles group audio/video calls and group chat.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$SIP/PSTN bridge$q$, $q$Connects the SIP network to traditional phone (PSTN) infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Account management (FlexiAPI)$q$, $q$Provides an API-driven account management layer for provisioning users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Open-source AGPLv3 option available at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Complete suite covering proxy, presence, conferencing, and push notifications in one project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Runs on small hardware like a Raspberry Pi as well as production servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Backed by Belledonne Communications, an established SIP/VoIP vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$AGPLv3 requires sharing modifications if you distribute a modified version, unless you buy the proprietary license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Setting up a full SIP communications stack requires telephony expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Support contracts and the proprietary license are paid add-ons$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Is Flexisip open source?$q$, $q$Yes, it's available under the GNU AGPLv3 license, with a paid proprietary license also offered for closed-source use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Who makes Flexisip?$q$, $q$Belledonne Communications, a Grenoble, France-based company also known for the Linphone softphone.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$What can Flexisip be deployed on?$q$, $q$It runs on Linux and can be deployed on small embedded devices like a Raspberry Pi as well as standard servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Does Flexisip include a phone client?$q$, $q$No, Flexisip is server-side infrastructure; it's typically paired with SIP clients such as Linphone.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Self-hosted unified communications backend$q$, $q$Deploy Flexisip to run your own voice, video, presence, and messaging infrastructure over SIP.$q$, $q$IT teams building private communications systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$SIP-to-PSTN bridging$q$, $q$Use the SIP/PSTN bridge to connect a SIP-based deployment to traditional telephone lines.$q$, $q$Organizations integrating VoIP with legacy phone systems$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Open Source (AGPLv3)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full Flexisip source code","Self-managed deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$Proprietary License + Support$q$, $q$Custom$q$, $q$Contract$q$, $q$["Closed-source modification rights","Vendor support contract","Deployment services from Belledonne Communications"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Flexisip is a complete, modular SIP server suite built by Belledonne Communications, the France-based makers of the Linphone softphone. It provides the server-side infrastructure for unified communications over SIP, including a proxy for call routing and media relay, a push notification gateway for mobile clients, a presence server, a conference server for group calls and chat, and a SIP/PSTN bridge for connecting to traditional phone networks.$q$, $q$Flexisip is dual-licensed: it's available under the GNU AGPLv3 open-source license, or under a proprietary license for organizations that want to keep their modifications closed-source. Belledonne Communications also sells support contracts and deployment services around it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Flexisip is aimed at organizations that want to self-host a full SIP-based communications backend — voice, video, presence, and messaging — often alongside Linphone clients, ranging from small deployments on devices like a Raspberry Pi to larger production infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1e7307b-a3f8-4883-8420-6b25b0764ca6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Freepbx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source, web-based GUI from Sangoma for managing and configuring an Asterisk phone system.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FreePBX is a free, open-source web GUI for managing Asterisk phone systems, with optional paid commercial modules from Sangoma.$q$,
  og_description = $q$FreePBX is a free, open-source web GUI for managing Asterisk phone systems, with optional paid commercial modules from Sangoma.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a33553b-3246-4484-92da-a333ec40b5e4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a33553b-3246-4484-92da-a333ec40b5e4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Web-based Asterisk administration$q$, $q$Configure extensions, trunks, and call routing through a browser instead of editing config files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$IVR and voicemail management$q$, $q$Build interactive voice response menus and manage voicemail through the GUI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Commercial module marketplace$q$, $q$Optional paid modules extend the free base with features like call recording and reporting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Distribution/appliance option$q$, $q$A ready-to-install FreePBX distribution bundles Asterisk and the GUI for simpler deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Frequent updates$q$, $q$The open-source base is updated regularly to track Asterisk changes and compatibility.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Free, open-source base software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Removes the need to hand-edit Asterisk configuration files$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Large, active user community and long track record$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Commercial modules available for teams that need extra features or support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Advanced features require paid commercial modules or licenses$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Long-term licenses require purchasing support renewal to keep receiving updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Still requires Asterisk/telephony knowledge for non-trivial deployments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Is FreePBX free?$q$, $q$The base FreePBX software is free and open source; some advanced features are sold as optional commercial modules.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Do I need Asterisk separately?$q$, $q$FreePBX is a GUI layer on top of Asterisk; the FreePBX distribution bundles both together for convenience.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Who develops FreePBX?$q$, $q$It's maintained under the sponsorship of Sangoma Technologies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$What are commercial modules?$q$, $q$Optional paid add-ons — such as advanced call recording or queue reporting — that extend the free FreePBX base.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Self-hosted business phone system$q$, $q$Deploy FreePBX with Asterisk to run a full-featured office phone system managed through a web GUI.$q$, $q$Small and mid-sized business IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Managed telephony for clients$q$, $q$IT service providers deploy FreePBX instances for clients, optionally adding commercial modules for advanced features.$q$, $q$Managed service providers and telecom integrators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$FreePBX Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["Web-based Asterisk administration","Core telephony features","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$Commercial Modules$q$, $q$Varies$q$, $q$One-time or annual license$q$, $q$["Advanced call recording","Queue and reporting tools","Vendor support options"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FreePBX is an open-source, web-based graphical interface for configuring and managing an Asterisk-based phone system. It lets administrators set up extensions, trunks, call routing, IVR menus, voicemail, and more without editing Asterisk's dialplan and configuration files by hand.$q$, $q$The core FreePBX software is free to download and use, updated frequently by a community maintained under Sangoma's sponsorship. Sangoma also sells optional commercial modules — such as advanced call recording or queue reporting — and bundles or licenses that add support and extra functionality on top of the free base.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FreePBX is aimed at businesses and IT administrators who want the flexibility of Asterisk as a phone system but prefer a graphical interface over hand-editing Asterisk configuration, ranging from small offices to larger deployments that add commercial modules for extra capability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a33553b-3246-4484-92da-a333ec40b5e4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── FreeSWITCH ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source communications framework for building voice, video, and messaging infrastructure, sponsored by SignalWire.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FreeSWITCH is an open-source communications framework for building voice, video, and messaging systems, sponsored by SignalWire.$q$,
  og_description = $q$FreeSWITCH is an open-source communications framework for building voice, video, and messaging systems, sponsored by SignalWire.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '359edbcb-cdb7-4e0e-96ec-f81303289aa2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '359edbcb-cdb7-4e0e-96ec-f81303289aa2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$SIP and RTP control$q$, $q$Direct management of SIP signaling, RTP media, codecs, and dialplan routing logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Modular architecture$q$, $q$Load only the modules you need and build custom extensions on the core.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Scalable conferencing$q$, $q$Supports multi-party audio and video conferences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$APIs for integration$q$, $q$Provides APIs that can be used to integrate transcription, automation, and other services.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Commercially licensed codec modules$q$, $q$Optional paid modules such as G.729A and AMD (answering machine detection) are available for purchase per instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Free and open source core framework$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Fine-grained control over media and signaling for custom telephony builds$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Backed by SignalWire, founded by the project's original developers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Widely deployed in large-scale telephony infrastructure$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Requires significant telephony/SIP expertise to deploy and configure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$No built-in graphical administration interface out of the box$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Some codec modules and the supported 'Advantage' distribution require a paid license$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Is FreeSWITCH free?$q$, $q$Yes, the core FreeSWITCH framework is free and open source, licensed under the Mozilla Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Who maintains FreeSWITCH?$q$, $q$SignalWire, a company founded by FreeSWITCH's original core developers, sponsors and maintains the project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Are there paid options?$q$, $q$Yes, SignalWire offers a commercially licensed 'FreeSWITCH Advantage' distribution, some commercially licensed codec modules, and paid cloud APIs, in addition to the free open-source core.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$What is FreeSWITCH typically used to build?$q$, $q$Custom voice, video, and messaging systems, including PBX platforms, conferencing, and carrier-grade telephony infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Building custom telephony platforms$q$, $q$Use FreeSWITCH's low-level SIP/RTP control to build a bespoke voice or video communications system.$q$, $q$Telecom developers and engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Carrier and enterprise-scale voice infrastructure$q$, $q$Deploy FreeSWITCH as the media/signaling core of large-scale telephony infrastructure, optionally on the supported Advantage distribution.$q$, $q$Enterprises and telecom carriers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$Open Source Core$q$, $q$Free$q$, $q$N/A$q$, $q$["Full FreeSWITCH source code","Community support","Modular SIP/RTP framework"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$FreeSWITCH Advantage$q$, $q$Custom$q$, $q$Subscription$q$, $q$["Commercially supported distribution","Scheduled releases and security updates","Vendor support from SignalWire"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FreeSWITCH is an open-source communications framework, originally announced in January 2006 by Anthony Minessale II, Brian West, and Michael Jerris, that gives developers direct control over SIP signaling, RTP media, codecs, and call routing to build custom telephony and real-time communications infrastructure.$q$, $q$Its modular architecture lets you load only the components you need and extend it with custom modules, including support for scalable audio/video conferencing. FreeSWITCH is free and open source; SignalWire, founded by its core developers, sponsors and maintains the project and additionally offers a commercially licensed 'FreeSWITCH Advantage' distribution with scheduled releases and security updates, along with paid cloud APIs and select commercially licensed codec modules (such as G.729A and AMD).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FreeSWITCH is aimed at developers and telecom engineers building custom voice, video, or messaging platforms who need low-level control over media and signaling, rather than administrators looking for a plug-and-play office phone system with a graphical UI.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('359edbcb-cdb7-4e0e-96ec-f81303289aa2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── FusionPBX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted multi-tenant PBX and telephony platform built on FreeSWITCH for calls, voicemail, and call centers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FusionPBX is a free, open-source multi-tenant PBX built on FreeSWITCH for self-hosted calls, voicemail, and call centers.$q$,
  og_description = $q$FusionPBX is a free, open-source multi-tenant PBX built on FreeSWITCH for self-hosted calls, voicemail, and call centers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Multi-tenant PBX$q$, $q$Domain-based multi-tenant architecture lets a single install host many independent organizations or clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Call center and queues$q$, $q$Includes call queues, call parking, and call center tooling for support and sales teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Voicemail with transcription$q$, $q$Voicemail-to-email plus call recording transcription and summaries, with text-to-speech for greetings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Real-time WebSocket dashboards$q$, $q$Live dashboards driven by WebSocket integration for monitoring calls and system status.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Built on FreeSWITCH$q$, $q$Runs on the FreeSWITCH media server, a scalable, multi-platform communications engine.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Security tooling$q$, $q$Advanced security features, including the Event Guard fraud/abuse protection module.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Free and open source with no per-seat licensing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Feature-rich: call center, fax, conferencing, and voicemail in one stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Built on the proven, actively developed FreeSWITCH core$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Multi-tenant support suits hosting providers and MSPs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Active community and documentation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Requires solid Linux and FreeSWITCH administration skills to deploy and secure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Configuration and call-routing logic has a steep learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Official structured training and support are paid$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Admin GUI is functional but dated compared to modern SaaS UIs$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Is FusionPBX free to use?$q$, $q$Yes, the FusionPBX software itself is open source and free to download, install, and run on your own infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$What does FusionPBX run on?$q$, $q$FusionPBX is a web-based management layer built on top of the FreeSWITCH media server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Can FusionPBX host multiple tenants?$q$, $q$Yes, it supports single-tenant or domain-based multi-tenant deployments, making it suitable for hosting providers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Is paid support available?$q$, $q$FusionPBX offers a separate paid membership program with training videos, documentation, and continuing education for teams that want structured support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Business phone system$q$, $q$Self-hosted PBX with extensions, voicemail, and conferencing for a single organization.$q$, $q$Small and medium businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Managed telecom hosting$q$, $q$Domain-based multi-tenancy lets a provider run many customer PBXs from one deployment.$q$, $q$MSPs and VoIP hosting providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$Call center deployment$q$, $q$Queues, call recording, and reporting support inbound support and sales teams.$q$, $q$Call center operators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FusionPBX is an open-source communications platform built on top of the FreeSWITCH media server. It describes itself as a highly available, single- or domain-based multi-tenant PBX, carrier-grade switch, call center server, fax server, VoIP server, voicemail server, conference server, and voice application platform.$q$, $q$The system provides unlimited extensions, voicemail-to-email, music on hold, call parking, call queues, phone auto-provisioning, call recording with transcription and summaries, text-to-speech for voicemail greetings, and a WebSocket-driven admin dashboard, all managed through a self-hosted web GUI.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FusionPBX targets small, medium, and large businesses and hosting providers that want enterprise-grade telephony features without commercial PBX licensing costs, provided they have the Linux and FreeSWITCH skills needed to run and secure their own deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6af40cc9-6b3d-4091-aefc-36c2ec0b3cb8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Kamailio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source SIP server for building high-capacity VoIP, WebRTC, and messaging infrastructure at carrier scale.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kamailio is a free, open-source SIP server for carrier-grade VoIP, WebRTC, and messaging infrastructure, self-hosted on Linux.$q$,
  og_description = $q$Kamailio is a free, open-source SIP server for carrier-grade VoIP, WebRTC, and messaging infrastructure, self-hosted on Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9f4e2487-8444-49f1-b4b1-729b8e49b3c9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9f4e2487-8444-49f1-b4b1-729b8e49b3c9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$High-throughput SIP proxy$q$, $q$Handles thousands of call setups per second with asynchronous TCP/UDP/SCTP networking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$WebRTC and WebSocket support$q$, $q$Native WebSocket support enables browser-based WebRTC signaling alongside traditional SIP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$TLS and IPv4/IPv6$q$, $q$Secure transport and dual-stack networking for modern carrier deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Database and directory integration$q$, $q$Connects to MySQL, PostgreSQL, Oracle, RADIUS, and LDAP for routing, auth, and provisioning data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Presence and instant messaging$q$, $q$Built-in support for SIP presence and IM alongside voice/video signaling.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Interoperates with Asterisk and FreeSWITCH$q$, $q$Commonly deployed as a front-end proxy/load balancer in front of media servers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Free, GPL-licensed, with fully public source code$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Battle-tested lineage dating back to the SER/OpenSER projects$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Scales to thousands of calls per second on modest hardware$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Highly modular and scriptable routing logic$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Large community and extensive module ecosystem$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$No built-in graphical admin interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Configuration language has a steep learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Requires solid SIP protocol knowledge to operate safely$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Self-hosted deployment means you own scaling, security, and upgrades$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Is Kamailio free?$q$, $q$Yes, Kamailio is open source under the GPLv2+ license and free to deploy on your own servers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Does Kamailio include a media server?$q$, $q$No, Kamailio is a SIP signaling proxy/registrar; it's commonly paired with a media server such as Asterisk or FreeSWITCH.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Does Kamailio support WebRTC?$q$, $q$Yes, via native WebSocket support for browser-based SIP/WebRTC signaling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Who maintains Kamailio?$q$, $q$It is developed by an open-source community and is available for review and contribution on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$Carrier SIP proxy and registrar$q$, $q$Route and load-balance high volumes of SIP traffic across a telecom network.$q$, $q$Telecom carriers and VoIP providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$WebRTC signaling gateway$q$, $q$Bridge browser-based WebRTC clients into a SIP network via WebSocket support.$q$, $q$Developers building real-time communication apps$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$SIP-to-PSTN gateway front-end$q$, $q$Sit in front of Asterisk or FreeSWITCH to handle routing, load balancing, and security.$q$, $q$Enterprises with self-hosted telephony$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kamailio is an open-source SIP (Session Initiation Protocol) server designed to handle high-volume call signaling. The project traces its lineage to SIP Express Router (SER) and OpenSER, and today is released under the GPLv2+ license with development on GitHub.$q$, $q$Written in C for Unix/Linux, Kamailio can process thousands of call setups per second and supports VoIP, WebRTC, instant messaging, and presence, with asynchronous TCP/UDP/SCTP protocols, TLS, IPv4/IPv6, and WebSocket support. It integrates with databases such as MySQL and PostgreSQL, authentication backends like RADIUS and LDAP, and media servers such as Asterisk and FreeSWITCH.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Kamailio is aimed at telecom carriers, VoIP providers, and enterprises building unified communications infrastructure — for example, SIP load balancing, least-cost routing, SIP-to-PSTN gateways, and WebRTC signaling — who need a self-hosted, highly scriptable proxy rather than a managed service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f4e2487-8444-49f1-b4b1-729b8e49b3c9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── openSIPS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source SIP proxy server for voice, video, messaging, and presence, built for carrier- and enterprise-scale telecom platforms.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$openSIPS is a free, open-source SIP proxy server for carrier-grade VoIP, SBC, and telecom routing, self-hosted on your own servers.$q$,
  og_description = $q$openSIPS is a free, open-source SIP proxy server for carrier-grade VoIP, SBC, and telecom routing, self-hosted on your own servers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9571c8ca-968b-4f1b-93a0-ecf103c67bfa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9571c8ca-968b-4f1b-93a0-ecf103c67bfa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$120+ modules$q$, $q$Modular architecture covers SIP routing, NAT traversal, accounting, presence, and backend integrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Massive throughput$q$, $q$Designed to handle tens of thousands of calls per second and millions of concurrent calls.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Custom scripted routing$q$, $q$Flexible routing logic through openSIPS's own scripting language.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$SBC and load balancing$q$, $q$Can be deployed as a session border controller or SIP load balancer in front of media servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Class 4/5 softswitch support$q$, $q$Used to build wholesale (Class 4) and retail (Class 5) telecom platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Commercial support option$q$, $q$Paid support and consulting are available alongside the free, open-source core.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Free and open source with no licensing fees for the core platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Proven at very large call volumes for carriers and ITSPs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Highly modular; only load the functionality you need$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Commercial support and consulting available if needed$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Long track record in production telecom deployments$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Requires deep SIP and telecom protocol expertise to configure safely$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$No polished built-in web GUI for the core proxy$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Self-hosted operation means you manage scaling and security$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Scripting-based routing has a learning curve for newcomers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Is openSIPS free?$q$, $q$Yes, the core openSIPS SIP server is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Can openSIPS act as a session border controller?$q$, $q$Yes, openSIPS supports SBC use cases including a dedicated community SBC solution.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Is commercial support available?$q$, $q$Yes, paid support and consulting are offered for organizations that need professional services on top of the free software.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$What scale can openSIPS handle?$q$, $q$It's designed for tens of thousands of calls per second and millions of simultaneous calls in carrier-grade deployments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Wholesale/retail softswitch$q$, $q$Build Class 4 (wholesale) or Class 5 (retail) telecom platforms on open-source infrastructure.$q$, $q$Telecom carriers and ITSPs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$Enterprise SIP trunking$q$, $q$Route and manage SIP trunks for enterprise voice infrastructure.$q$, $q$Enterprises with in-house telephony$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$SIP load balancing / SBC$q$, $q$Front media servers with a scalable SIP proxy for load balancing and edge security.$q$, $q$VoIP platform operators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$openSIPS is an open-source SIP proxy server used as a signaling layer for voice, video, instant messaging, presence, and other SIP-based communications. It offers over 120 modules covering SIP handling, backend integration, and routing logic, and is capable of handling tens of thousands of call attempts per second with millions of simultaneous calls.$q$, $q$Common deployment patterns include Class 4/5 softswitch platforms, SIP trunking, enterprise PBX front-ends, session border controllers, and SIP load balancing. The core software is open source; the project also offers a community SBC solution, donation-funded development, and commercial support through affiliated organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$openSIPS is built for carriers, telecoms, and ITSPs (Internet Telephony Service Providers) that need a highly scalable, self-hosted SIP routing layer, as well as enterprises building their own VoIP infrastructure who want scriptable, module-based control over call routing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9571c8ca-968b-4f1b-93a0-ecf103c67bfa', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Routr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-native, open-source SIP proxy, location server, and registrar built for Docker and Kubernetes VoIP infrastructure.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Routr is a free, open-source, cloud-native SIP proxy and registrar built for Docker and Kubernetes VoIP infrastructure.$q$,
  og_description = $q$Routr is a free, open-source, cloud-native SIP proxy and registrar built for Docker and Kubernetes VoIP infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Docker/Kubernetes-native$q$, $q$Built to be deployed and orchestrated in containerized environments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$REST API control$q$, $q$Manage the SIP server programmatically through a RESTful API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Web GUI and CLI$q$, $q$Configure and monitor the server through a web interface or command-line tooling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$SDKs for integration$q$, $q$SDKs are provided to help developers integrate Routr into VoIP applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Lightweight proxy/registrar$q$, $q$Focused feature set as a SIP proxy, location server, and registrar rather than a full PBX.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Designed from the ground up for containers and Kubernetes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Multiple control surfaces: CLI, REST API, and web GUI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Actively maintained with releases and issue activity into late 2025$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Smaller community and ecosystem than Kamailio or openSIPS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Requires container/Kubernetes operational knowledge to run in production$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Less enterprise tooling and third-party documentation than more established SIP servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Is Routr free to use?$q$, $q$Yes, Routr is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Does Routr require Kubernetes?$q$, $q$It's designed to run well on Docker and Kubernetes, though it can be run in other Docker-based setups as well.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Can I manage Routr without the CLI?$q$, $q$Yes, it also offers a RESTful API and a web GUI for remote management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Who builds Routr?$q$, $q$Routr is developed by Fonoster and maintained as an open-source project on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Containerized SIP infrastructure$q$, $q$Run a SIP proxy/registrar as part of a Kubernetes-based telephony stack.$q$, $q$DevOps teams running cloud-native telecom platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$Carrier SIP registrar$q$, $q$Handle SIP registration and routing for a carrier or CSP network.$q$, $q$Telephony carriers and service providers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Routr is a cloud-native SIP server created by Fonoster, described on its site as a lightweight SIP proxy, location server, and registrar for building telephony infrastructure. It's designed to run on Docker and Kubernetes and can be controlled remotely via a command-line interface, a RESTful API, and a web GUI.$q$, $q$The project is open source and hosted on GitHub, where it has continued to receive releases and issue activity through late 2025, indicating ongoing maintenance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Routr targets telephony carriers, communication service providers, and integrators or developers who want a container-native, API-driven SIP server rather than a traditional monolithic softswitch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bf0f90f-c3ae-4dd2-8a3a-1395bd5e1b1c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SIP3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Real-time VoIP and RTC traffic monitoring platform with a free, open-source Community Edition for troubleshooting call quality.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Community Edition)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SIP3 is a real-time VoIP and RTC monitoring platform with a free, open-source, self-hosted Community Edition for troubleshooting.$q$,
  og_description = $q$SIP3 is a real-time VoIP and RTC monitoring platform with a free, open-source, self-hosted Community Edition for troubleshooting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d6bc0d1-04aa-46ba-873c-4820037e561d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d6bc0d1-04aa-46ba-873c-4820037e561d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Real-time call analytics$q$, $q$Dashboard for monitoring and troubleshooting live VoIP/RTC calls as they happen.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$OpenAPI integrations$q$, $q$OpenAPI-based interface for connecting SIP3 to third-party tools and infrastructure-as-code workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Historical and trend analysis$q$, $q$Store and query historical call data to spot trends and recurring issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Custom search for call flows$q$, $q$Search and troubleshoot non-standard or unusual call flows quickly.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Event-driven processing pipeline$q$, $q$Captain, Twig, and Salto components form a scalable capture-and-query pipeline for high traffic volumes.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Community Edition is free, open source, and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Purpose-built for VoIP/RTC quality troubleshooting, not generic monitoring$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$High-performance pipeline designed for large traffic volumes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$OpenAPI support fits infrastructure-as-code workflows$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Full commercial features and vendor support require a paid plan with pricing not publicly listed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Narrower focus than general-purpose network/APM monitoring tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Requires deploying separate capture agents alongside the core platform$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Is SIP3 free?$q$, $q$The SIP3 Community Edition is open source and free to self-host; commercial editions with vendor support are also available but pricing isn't publicly listed.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$What does SIP3 monitor?$q$, $q$It monitors SIP signaling and RTC media traffic in real time for VoIP troubleshooting and quality analysis.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Can SIP3 integrate with other tools?$q$, $q$Yes, it exposes an OpenAPI interface for third-party and infrastructure-as-code integrations.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Live call troubleshooting$q$, $q$Diagnose call quality and signaling issues in real time as they occur.$q$, $q$VoIP NOC and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Traffic trend analysis$q$, $q$Review historical VoIP/RTC data to spot recurring problems.$q$, $q$VoIP service providers and carriers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted deployment","Core capture and monitoring pipeline (Captain, Twig, Salto)","OpenAPI access"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SIP3 monitors VoIP and RTC traffic in real time, giving teams a dashboard to troubleshoot live calls, search non-standard call flows, and review historical and trending call data. It is built from three main components — Captain (capture agent/data adapter), Twig (query/aggregation API), and Salto (the event-driven processing pipeline) — with an OpenAPI-based interface for integrations.$q$, $q$The SIP3 Community Edition components are published as open source on GitHub under the sip3io organization and can be self-hosted for free. SIP3 also offers commercial editions with vendor support for organizations that need it, though public pricing for those tiers is not published.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SIP3 is aimed at VoIP service providers, contact centers, and enterprises with high call volumes who need real-time visibility into SIP/RTC traffic to reduce troubleshooting and support-ticket resolution time.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d6bc0d1-04aa-46ba-873c-4820037e561d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── SIPCAPTURE Homer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$100% open-source SIP, VoIP, and RTC packet capture and monitoring platform built around the HEP capture protocol.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SIPCAPTURE Homer is a free, open-source SIP/VoIP/RTC packet capture and monitoring platform built on the HEP protocol.$q$,
  og_description = $q$SIPCAPTURE Homer is a free, open-source SIP/VoIP/RTC packet capture and monitoring platform built on the HEP protocol.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c77c93d7-d6d3-492d-95bf-b629ef60e4c2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$HEP/EEP capture protocol$q$, $q$Mirrors SIP, RTP, and RTCP traffic for analysis without modifying the original packets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Native agent support$q$, $q$Native HEP integration is built into OpenSIPS, Kamailio, Asterisk, and FreeSWITCH.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$HEPlify and CaptAgent$q$, $q$Dedicated capture agents (Go-based HEPlify, C-based CaptAgent) for near-zero-config or complex deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Carrier-grade scale$q$, $q$Designed to capture, index, and analyze SIP/RTP/RTCP traffic at large scale.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Docker deployment$q$, $q$Deployable via Docker with a web interface for browsing captured traffic.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Fully open source and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Native integration with the most common open-source SIP platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Scales to carrier-grade traffic volumes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Docker-based deployment simplifies setup$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Requires deploying and configuring separate capture agents$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Best suited to teams that already run OpenSIPS/Kamailio/Asterisk/FreeSWITCH$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$No official commercial support tier evident on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Is HOMER free?$q$, $q$Yes, HOMER and the broader SIPCAPTURE stack are 100% open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$What is the HEP protocol?$q$, $q$HEP (Homer Encapsulation Protocol) mirrors packet data for capture and analysis without altering the original traffic.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Which platforms does HOMER integrate with?$q$, $q$It has native support in OpenSIPS, Kamailio, Asterisk, and FreeSWITCH, plus standalone capture agents for other setups.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$SIP/VoIP troubleshooting$q$, $q$Capture and inspect SIP signaling and RTP/RTCP media to diagnose call issues.$q$, $q$VoIP and telecom engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$Carrier traffic monitoring$q$, $q$Monitor large-scale SIP traffic across a carrier network for QoS and security analysis.$q$, $q$Carriers and large VoIP platform operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HOMER, part of the SIPCAPTURE project, is a fully open-source SIP, VoIP, and RTC packet capture and monitoring system. It's a carrier-grade, modular capture framework used for analysis and monitoring, natively supporting major open-source voice platforms.$q$, $q$HOMER is built around the HEP/EEP capture protocol, which mirrors SIP/RTP/RTCP packets without altering the original traffic. Capture agents include HEPlify (written in Go) and CaptAgent (written in C), and native HEP support is built into OpenSIPS, Kamailio, Asterisk, and FreeSWITCH. HOMER can be deployed via Docker, with a web UI and HEP listeners on dedicated ports.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HOMER is aimed at VoIP engineers, carriers, and platform operators who run OpenSIPS, Kamailio, Asterisk, or FreeSWITCH and need packet-level capture and monitoring for troubleshooting and analysis.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c77c93d7-d6d3-492d-95bf-b629ef60e4c2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Wazo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, API-first platform for building carrier-grade, programmable IP communication infrastructure.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Wazo Platform is a free, open-source, API-first system for building programmable, carrier-grade IP communication infrastructure.$q$,
  og_description = $q$Wazo Platform is a free, open-source, API-first system for building programmable, carrier-grade IP communication infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '688d8396-0ab3-420a-ba26-729121f64809';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '688d8396-0ab3-420a-ba26-729121f64809' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$API-first design$q$, $q$REST APIs, WebSockets, and webhooks with OpenAPI specifications for building custom communication apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$WebRTC calling$q$, $q$Native WebRTC support for browser and mobile audio/video calling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Built on proven OSS telecom stack$q$, $q$Combines Asterisk, Kamailio, and RTPEngine with RabbitMQ and PostgreSQL under the hood.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Call center and voicemail$q$, $q$Includes call center features and voicemail alongside core calling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Flexible deployment$q$, $q$Runs on bare metal, VMs, or containers, giving operators control over infrastructure.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Fully open source under GPLv3, no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$API-first architecture makes it easy to build custom integrations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Built on proven, well-established open-source telecom components$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Deployment flexibility across bare metal, VM, or container environments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Requires Linux/Debian systems administration skills to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Microservices architecture adds operational complexity versus a single-binary PBX$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Smaller ecosystem and community than Asterisk alone$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Is Wazo free?$q$, $q$Yes, Wazo Platform is open source under the GPLv3 license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$What is Wazo built on?$q$, $q$It's built on established open-source components including Asterisk, Kamailio, RTPEngine, RabbitMQ, PostgreSQL, and Nginx.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Does Wazo support WebRTC?$q$, $q$Yes, WebRTC is supported natively for browser and mobile calling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$How is Wazo deployed?$q$, $q$It can run on bare metal, virtual machines, or containers, depending on your infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Programmable business phone system$q$, $q$Build a customizable, API-driven communication platform in-house.$q$, $q$Developers and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$Custom UCaaS product$q$, $q$Use Wazo's APIs and OSS stack as the foundation for a branded communications product.$q$, $q$Telecom product builders and integrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Wazo Platform is an open-source project for building carrier-grade, programmable IP communication infrastructure. It provides audio/video calling, chat, call center, and voicemail functionality through a microservices architecture written in Python with OpenAPI-documented interfaces.$q$, $q$The platform is built on proven open-source telecom components, including Asterisk, Kamailio, RTPEngine, RabbitMQ, PostgreSQL, and Nginx, and exposes WebRTC, REST APIs, WebSockets, and webhooks for mobile and web integration. It's released under the GPLv3 license and can be deployed on bare metal, virtual machines, or containers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Wazo is aimed at developers and organizations that want to build customizable, programmable telecom products without vendor lock-in — using Wazo's APIs and open-source stack instead of a proprietary UCaaS platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('688d8396-0ab3-420a-ba26-729121f64809', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Yeti-Switch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source SIP Session Border Controller, softswitch, and real-time VoIP billing system for carrier interconnection.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Yeti-Switch is a free, open-source SIP SBC, softswitch, and real-time billing system for carrier and VoIP interconnection.$q$,
  og_description = $q$Yeti-Switch is a free, open-source SIP SBC, softswitch, and real-time billing system for carrier and VoIP interconnection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8734f0fa-231e-48e0-b9b8-faa68fe18c4b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8734f0fa-231e-48e0-b9b8-faa68fe18c4b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$SBC and softswitch in one$q$, $q$Combines session border control with Class 4 softswitch routing on the SEMS SIP/RTP stack.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Real-time billing$q$, $q$Integrated wholesale and retail billing tied directly to call routing and CDRs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Dynamic routing$q$, $q$Least-cost routing, load balancing, and capacity management across carrier trunks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$STIR/SHAKEN authentication$q$, $q$Supports STIR/SHAKEN for call authentication and caller ID verification.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Microsoft Teams Direct Routing$q$, $q$Compatible with Teams Direct Routing for enterprise voice integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$REST API and customer portal$q$, $q$Automate operations via REST API and give customers self-service access through a web portal.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Combines SBC, softswitch, and billing in one open-source stack$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$STIR/SHAKEN and Microsoft Teams Direct Routing support built in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$REST API enables automation of routing and provisioning$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Includes a customer-facing self-service portal$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Steep learning curve for teams without carrier/telecom background$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Requires self-hosted infrastructure and SEMS stack expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Documentation is technical and aimed at telecom engineers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Is Yeti-Switch free?$q$, $q$Yes, it's open source and free to self-host; no licensing fee is listed on the official site.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Does Yeti-Switch include billing?$q$, $q$Yes, it includes integrated real-time billing for wholesale and retail VoIP services.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Does it support STIR/SHAKEN?$q$, $q$Yes, STIR/SHAKEN call authentication is supported for caller ID verification and robocall mitigation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Can I try Yeti-Switch before deploying?$q$, $q$Yes, the official site offers a live demo and installation documentation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Wholesale transit routing$q$, $q$Route and bill for wholesale VoIP transit traffic between carriers.$q$, $q$Wholesale VoIP carriers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$Retail VoIP service billing$q$, $q$Combine SBC, routing, and real-time billing for retail VoIP customers.$q$, $q$Retail VoIP service providers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Yeti-Switch is an open-source SIP Session Border Controller, softswitch, and real-time VoIP billing system built on the SEMS SIP/RTP stack. It unifies carrier interconnection, dynamic routing (least-cost routing, load balancing, capacity management), and real-time billing for wholesale and retail telecom services in a single platform.$q$, $q$The platform includes a number portability database, STIR/SHAKEN call authentication support, Microsoft Teams Direct Routing compatibility, a REST API for automation, and a customer-facing web portal, with installation docs, a live demo, and community forum support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Yeti-Switch targets telecom carriers and VoIP providers running Class 4 softswitch operations — both wholesale transit and retail service providers — who need combined routing, SBC, and billing functionality without stitching together separate commercial products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8734f0fa-231e-48e0-b9b8-faa68fe18c4b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Akkoma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted ActivityPub microblogging server forked from Pleroma, compatible with Mastodon apps.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Akkoma is a free, open-source, self-hosted ActivityPub server forked from Pleroma, compatible with Mastodon apps.$q$,
  og_description = $q$Akkoma is a free, open-source, self-hosted ActivityPub server forked from Pleroma, compatible with Mastodon apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$ActivityPub federation$q$, $q$Interoperates with the wider Fediverse, including Mastodon, through the ActivityPub protocol.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Mastodon client compatibility$q$, $q$Works with existing Mastodon apps and frontends for posting and browsing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Custom emoji reactions$q$, $q$React to posts with custom emoji beyond a simple like/favorite.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Rich post formatting$q$, $q$Misskey-Flavoured Markdown with animation support for expressive posts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Unlimited edits and quote posts$q$, $q$Edit published posts without limit and quote other posts, plus create polls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Faster than Pleroma$q$, $q$The project reports meaningfully faster performance than Pleroma for common operations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Full control over your own social media server via self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Compatible with the broader Mastodon/Fediverse app ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$More frequent releases and richer formatting than upstream Pleroma$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$No centralized authority controlling your account or data$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Requires server administration skills to self-host and moderate$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Smaller install base and plugin/theme ecosystem than Mastodon$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Relies on community/donation-based development and support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Is Akkoma free?$q$, $q$Yes, Akkoma is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Is Akkoma the same as Mastodon?$q$, $q$No, it's a separate ActivityPub server forked from Pleroma, but it works with Mastodon-compatible client apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Can Akkoma communicate with Mastodon users?$q$, $q$Yes, because it implements ActivityPub, Akkoma servers federate with Mastodon and other Fediverse platforms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Do I need to self-host Akkoma?$q$, $q$Yes, Akkoma is self-hosted software; you (or a host you choose) run the server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Independent social media community$q$, $q$Run a self-hosted microblogging server for a community or interest group.$q$, $q$Community admins and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Personal Fediverse presence$q$, $q$Host a personal instance to post and follow others across the Fediverse.$q$, $q$Individuals wanting platform independence$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Akkoma is a decentralized, self-hostable social networking server and part of the Fediverse — a network of independently operated servers that interoperate through the ActivityPub protocol. It's a specialized fork of Pleroma, developed with faster release cycles and feature choices that lean closer to Misskey.$q$, $q$Akkoma supports posting statuses with unlimited media attachments, following users on any ActivityPub-compatible service, custom emoji reactions, Misskey-Flavoured Markdown with animations, unlimited post editing, quote posts, and polls. It is compatible with existing Mastodon client apps and frontends, and its own site claims meaningfully faster performance than Pleroma for common operations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Akkoma is for individuals, communities, and organizations that want to run their own social media server rather than relying on a centralized platform — particularly Pleroma admins who want a faster-moving fork with richer post formatting and reaction features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Answer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted Q&A platform under the Apache Software Foundation for building forums and knowledge bases.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Apache Answer is a free, open-source, self-hosted Q&A platform for building community forums and knowledge bases.$q$,
  og_description = $q$Apache Answer is a free, open-source, self-hosted Q&A platform for building community forums and knowledge bases.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Voting and commenting Q&A$q$, $q$Community members ask questions, post answers, vote, and comment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Tagging and search$q$, $q$Intuitive tagging system for organizing and finding content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Plugin extensibility$q$, $q$Plugin support extends functionality and connects Answer to other tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Reputation and badges$q$, $q$Gamification through reputation points and badges rewards active, helpful users.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Apache-licensed open source$q$, $q$Free to use and modify under the Apache License 2.0.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Free, Apache 2.0-licensed open source software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Purpose-built Q&A format suits knowledge bases and support forums$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Plugin system allows extending core functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Built-in gamification (reputation, badges) encourages participation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Backed by the Apache Software Foundation's governance model$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Newer project with a smaller plugin/theme ecosystem than long-established forum software$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Requires self-hosting infrastructure; no managed/cloud hosting mentioned by the project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Best suited to structured Q&A rather than free-form discussion threads$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Is Apache Answer free?$q$, $q$Yes, it's open source and free to use under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Is Apache Answer self-hosted?$q$, $q$Yes, you deploy and run it on your own infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$What's it used for?$q$, $q$It's used to build community forums, help centers, and internal knowledge bases with a voting-driven Q&A format.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Can I extend Apache Answer's functionality?$q$, $q$Yes, it supports plugins to add features and integrate with other tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Internal knowledge base$q$, $q$Let employees ask and answer questions in a searchable, tagged Q&A format.$q$, $q$Internal IT and knowledge management teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Public community forum$q$, $q$Run a public Q&A community around a product, project, or topic.$q$, $q$Open-source projects and product communities$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Customer support Q&A$q$, $q$Offer a self-hosted support forum where customers and staff can answer questions.$q$, $q$Support and customer success teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache Answer is a free, open-source Q&A platform for teams of any scale, usable as a community forum, help center, or knowledge management system. It provides community-driven question-and-answer functionality with voting and commenting, an intuitive tagging system for organizing and searching content, and reputation points and badges to reward participation.$q$, $q$The project is licensed under the Apache License, Version 2.0, supports self-hosting on your own infrastructure, and offers plugin support for extending functionality and connecting to other tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Apache Answer suits organizations of any size that want to build an internal knowledge base, a public community forum, or a customer support Q&A site, and prefer a self-managed, customizable platform over a hosted third-party forum service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Artalk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A self-hosted, Go-powered comment system that adds Disqus-style commenting to any website without third-party tracking.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Artalk is a free, self-hosted comment system written in Go with Markdown, moderation, and notification support for any website.$q$,
  og_description = $q$Artalk is a free, self-hosted comment system written in Go with Markdown, moderation, and notification support for any website.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Comment moderation & spam interception$q$, $q$Built-in content detection, rate limiting, and captcha challenges to filter spam.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Multi-channel notifications$q$, $q$Email alerts with customizable templates plus additional push notification channels for new comments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Markdown & LaTeX support$q$, $q$Commenters can format replies with Markdown syntax and render math formulas.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Image uploads with lightbox$q$, $q$Attach images to comments with configurable storage and a built-in image viewer.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Multi-site admin dashboard$q$, $q$Manage comments across multiple websites from a single centralized admin panel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Social login$q$, $q$Visitors can sign in with third-party accounts instead of creating a new login.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Comment voting, sorting & search$q$, $q$Readers can upvote comments, sort threads, and search through comment history.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Page view counter$q$, $q$Tracks and displays page view statistics alongside comments.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Fully self-hosted, so comment data never leaves your own server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Lightweight Go backend and a small vanilla-JS widget keep resource usage low$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Free and open source under the MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Actively maintained with frequent releases and an OpenAPI-documented API$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Works with any blog, static site generator, or web app regardless of platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Requires running and maintaining your own backend service (Go binary or Docker container)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Smaller ecosystem and community than mainstream hosted options like Disqus$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Primary documentation and community threads are bilingual (English/Chinese), which can be harder to follow for some users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Is Artalk free to use?$q$, $q$Yes, Artalk is free, open-source software licensed under MIT. You self-host it, so the only cost is your own server infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$What do I need to run Artalk?$q$, $q$Artalk's backend is a single Go binary or Docker container; the frontend is a small JavaScript snippet you embed on your site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Can I migrate comments from another system?$q$, $q$Artalk documents data migration tooling for importing existing comments from other platforms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Does Artalk support moderation?$q$, $q$Yes — it includes spam and content detection, captcha, and an admin sidebar for reviewing and managing comments across sites.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Self-hosted blog comments$q$, $q$Bloggers using static site generators can embed Artalk's lightweight widget to add commenting without relying on Disqus.$q$, $q$Bloggers and static site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Multi-site publishers$q$, $q$Site owners running several blogs or docs sites can manage comments across all of them from one Artalk admin dashboard.$q$, $q$Developers managing multiple websites$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Artalk is an open-source, self-hosted comment system built to give website owners a Disqus-like commenting experience without handing visitor data to a third party. The backend is written in Go and ships as a single lightweight binary or Docker image, while the embeddable frontend widget is built in vanilla JavaScript with no framework dependency, keeping the client-side footprint small.$q$, $q$The project's GitHub repository was created in 2018 and remains actively developed, with documentation and community support maintained in both English and Chinese.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Artalk targets bloggers, documentation sites, and developers who run static sites or CMS-driven blogs and want full control over comment data and moderation, rather than outsourcing to a hosted SaaS commenting service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AsmBB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A lightweight, self-hosted forum engine written entirely in x86-64 assembly language for minimal resource use.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Russian$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$AsmBB is a free, open-source forum engine written in x86-64 assembly with SQLite storage, tagging, and BBCode support.$q$,
  og_description = $q$AsmBB is a free, open-source forum engine written in x86-64 assembly with SQLite storage, tagging, and BBCode support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Tag-based organization$q$, $q$Threads are organized with a flexible tagging system rather than rigid sub-forum categories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$BBCode formatting$q$, $q$Posts support BBCode markup for text formatting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$User registration & authentication$q$, $q$Built-in account system for community members.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Email integration$q$, $q$Supports email-based notifications and account features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Multi-language interface$q$, $q$UI available in multiple languages, including Russian and Chinese, alongside English.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Theme/skin customization$q$, $q$Multiple visual skins can be applied to a board.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$File attachments$q$, $q$Users can attach files to forum posts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Assembly-based performance$q$, $q$The engine compiles to native x86-64 code via the Fresh IDE toolchain, minimizing runtime overhead.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Extremely lightweight and fast due to native assembly implementation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Free and open source under the EUPL license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Low resource requirements, suitable for small VPS instances$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Simple SQLite-based storage with no heavyweight database server needed$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Written in assembly language, making it very difficult for most developers to customize, audit, or contribute to$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Small maintainer base, primarily one developer, which is a risk for long-term support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Limited plugin and theme ecosystem compared to mainstream forum software like Discourse or phpBB$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Building from source requires the niche Fresh IDE toolchain$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$What language is AsmBB written in?$q$, $q$AsmBB is written in x86-64 assembly language, built using the Fresh IDE toolchain.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Is AsmBB free?$q$, $q$Yes, it's open source under the European Union Public License (EUPL).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$What database does AsmBB use?$q$, $q$SQLite.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Who maintains AsmBB?$q$, $q$It's developed and maintained by John Found, with an official demo community running at board.asm32.info.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Assembly and systems-programming communities$q$, $q$Technical communities centered on low-level programming can run a forum that reflects the same performance philosophy as their subject matter.$q$, $q$Assembly language and systems programmers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Resource-constrained self-hosting$q$, $q$Operators wanting a discussion board that runs comfortably on minimal VPS resources without a heavy database server.$q$, $q$Self-hosters with limited server resources$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AsmBB is an open-source forum and bulletin-board engine notable for being written entirely in x86-64 assembly language rather than a conventional web framework, using SQLite as its datastore. It is developed and maintained by John Found, and the project's own community board (board.asm32.info) runs on the software itself.$q$, $q$The engine is built with the Fresh IDE toolchain and organizes discussions with a flexible tagging system instead of rigid sub-forum categories.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AsmBB suits developers and technical hobbyist communities — particularly assembly-language and systems-programming forums — who want a minimal-footprint, fast-loading discussion board and don't mind trading a large plugin ecosystem for raw performance and a tiny codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── BuddyPress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free WordPress plugin that turns any WordPress site into a full-featured social community with profiles, groups, and activity streams.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$BuddyPress is a free, open-source WordPress plugin that adds member profiles, groups, activity streams, and messaging to any site.$q$,
  og_description = $q$BuddyPress is a free, open-source WordPress plugin that adds member profiles, groups, activity streams, and messaging to any site.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9bcf631f-554c-4a18-befe-b606018906d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9bcf631f-554c-4a18-befe-b606018906d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Extended member profiles$q$, $q$Customizable profile fields beyond the standard WordPress user profile.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Activity streams$q$, $q$A real-time feed of member activity, similar to a social network timeline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$User groups$q$, $q$Members can create and join public or private groups for sub-communities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Private messaging$q$, $q$Built-in direct messaging between members.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Notifications$q$, $q$In-app and email notifications for social activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$bbPress forum integration$q$, $q$Connects with the bbPress plugin to add discussion forums to groups.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Modular components$q$, $q$Individual features such as groups, messaging, and activity can be enabled or disabled independently.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$REST API$q$, $q$Exposes BuddyPress data through the WordPress REST API for custom integrations and apps.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Free and open source (GPL), with no licensing cost regardless of site size$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Deep integration with the existing WordPress ecosystem of themes, plugins, and users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Modular design lets administrators enable only the features they need$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Long track record since 2008 with an active core team and large community of extensions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Backed institutionally via the WordPress Foundation and long-term contributors like Automattic$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Requires a self-managed WordPress installation and hosting, not a hosted SaaS product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Can add meaningful overhead to a WordPress site as more components and plugins are enabled$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Community and social features often require additional theme and plugin work to look polished out of the box$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Smaller dedicated plugin marketplace compared to standalone community platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Is BuddyPress free?$q$, $q$Yes, BuddyPress is free, open-source software released under the GPL, available directly from WordPress.org.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Do I need WordPress to use BuddyPress?$q$, $q$Yes, BuddyPress is a WordPress plugin and requires an existing or new WordPress installation to run.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Does BuddyPress include forums?$q$, $q$Discussion forums are added through integration with the companion bbPress plugin.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Who maintains BuddyPress?$q$, $q$It's maintained by a volunteer core team, including long-time leads John James Jacoby, Boone B. Gorges, and Paul Gibbs, under the WordPress Foundation, with contributions from companies like Automattic and WebDevStudios.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Education and alumni networks$q$, $q$Universities and schools use BuddyPress to run private social networks for students, staff, or alumni on top of their existing WordPress site.$q$, $q$Educational institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$Membership and niche communities$q$, $q$Site owners running interest-based or membership communities can add profiles, groups, and activity feeds without leaving WordPress.$q$, $q$Community and membership site owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BuddyPress is a free WordPress plugin, first released in 2008 by Andy Peatling, that adds social-networking features — member profiles, activity streams, groups, and private messaging — on top of any WordPress installation. Stewardship passed from Automattic to the WordPress Foundation in 2010, and the plugin remains under active community development, with releases tested against current WordPress versions.$q$, $q$BuddyPress is modular: administrators can enable only the components they want, and the interface adapts to show just those features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$BuddyPress is aimed at WordPress site owners who want to build a community around their site — universities running alumni or student networks, companies building internal communication tools, or niche communities and membership sites — without switching away from WordPress.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bcf631f-554c-4a18-befe-b606018906d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Coral ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source commenting and community platform built for news publishers, self-hostable or offered as a managed service by Vox Media.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Coral is an open-source, self-hostable commenting platform built for news publishers, with moderation tools and an optional managed hosting service.$q$,
  og_description = $q$Coral is an open-source, self-hostable commenting platform built for news publishers, with moderation tools and an optional managed hosting service.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '67b35559-aa14-4347-b26e-f153e6e02e8c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '67b35559-aa14-4347-b26e-f153e6e02e8c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Moderation tooling$q$, $q$Dashboards for reviewing, filtering, and moderating comments, including AI-assisted moderation aids.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Live Q&A$q$, $q$A real-time question-and-answer format for reader engagement events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Identity & reputation tools$q$, $q$Commenter verification, muting, and history tracking for moderators.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$GraphQL API$q$, $q$The platform is built around a GraphQL API for customization and integration into publisher workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$No ads or trackers$q$, $q$The comment stream carries no advertising or third-party tracking scripts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Notifications$q$, $q$Alerts for commenters on replies and moderation actions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Mobile-responsive embed$q$, $q$The comment stream is designed to work across device sizes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Open-source (Apache 2.0) and free to self-host with no per-comment or per-user licensing fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Purpose-built for journalism and news use cases, with moderation features tuned for high-volume public commenting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Backed by an established media company (Vox Media) with an optional managed-hosting path for teams that don't want to run their own infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$No ads or tracking scripts embedded in the comment experience$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Self-hosting requires a Node.js/GraphQL stack plus MongoDB and Redis, which adds real operational overhead$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Narrower focus than general-purpose community platforms, built specifically around article commenting rather than broader social features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Managed hosting and support pricing from Vox Media isn't publicly listed and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Is Coral free?$q$, $q$The core software is free and open source (Apache 2.0); Vox Media also offers a paid managed-hosting option for publishers who don't want to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$What do I need to self-host Coral?$q$, $q$A server running Node.js, MongoDB, and Redis. The project recommends deploying via Docker to bundle these dependencies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Who built Coral?$q$, $q$It originated as The Coral Project (Mozilla, The New York Times, The Washington Post, funded by the Knight Foundation) in 2014, and has been maintained by Vox Media since 2019.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Does Coral support live events?$q$, $q$Yes, it includes a live Q&A tool for real-time reader engagement.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Newsroom comment sections$q$, $q$Publishers replace generic comment widgets with a moderation-first, ad-free comment stream tailored to news articles.$q$, $q$News organizations and digital publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Reader Q&A events$q$, $q$Outlets running live coverage or AMA-style events use Coral's live Q&A tool to manage reader questions in real time.$q$, $q$Editorial and engagement teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Full open-source codebase","Self-managed hosting","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$Managed by Vox Media$q$, $q$Contact for pricing$q$, NULL, $q$["Hosted infrastructure","Vendor support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Coral began in 2014 as "The Coral Project," a collaboration between Mozilla, The New York Times, and The Washington Post funded by the Knight Foundation to build open-source tools for online comments. Mozilla continued the project after 2017, and Vox Media acquired it in 2019, where it's maintained today as an open-source commenting and community platform for news organizations, alongside an optional Vox-Media-hosted managed offering.$q$, $q$Self-hosting Coral requires Node.js, MongoDB, and Redis, with Docker recommended to bundle those dependencies for deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Coral is purpose-built for newsrooms and publishers that want moderation-heavy, ad-free, tracker-free commenting on their articles — from small independent outlets self-hosting the open-source code to larger publishers using Vox Media's managed hosting and support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67b35559-aa14-4347-b26e-f153e6e02e8c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── diaspora* ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A privacy-focused, decentralized social network made of independently run, federated pods rather than one central server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$diaspora* is a free, open-source decentralized social network made of federated pods, giving users control over their own data and audience.$q$,
  og_description = $q$diaspora* is a free, open-source decentralized social network made of federated pods, giving users control over their own data and audience.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8116962c-5001-43e3-b838-698a93f20293';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8116962c-5001-43e3-b838-698a93f20293' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Aspect-based sharing$q$, $q$Posts can be shared with specific defined groups of contacts ("aspects") rather than an all-or-nothing audience.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Federation across pods$q$, $q$Independently hosted pods interconnect so users on different pods can still follow and interact with each other.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$No ads or tracking by design$q$, $q$The platform's stated philosophy excludes advertising and third-party tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Hashtag following$q$, $q$Users can follow hashtags across the federated network, not just people.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Polls$q$, $q$Built-in support for posting polls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Photo & video sharing$q$, $q$Native media attachments in posts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Public API$q$, $q$diaspora* exposes an API that third-party clients and integrations can build on.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Fully decentralized, with no single company or server controlling the network$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Free, open source (AGPL-3.0), and can be joined via an existing public pod without running your own server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Granular "aspects" sharing gives fine control over who sees each post$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Long-running project since 2010 with an established, if small, community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Much smaller active user base than mainstream or newer federated platforms like Mastodon$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Development pace is slow, and its federation protocol predates and differs from ActivityPub, limiting interoperability with the wider fediverse$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Self-hosting a pod requires operating a Ruby on Rails stack, which is more involved than simpler tools$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Choosing and trusting a pod operator matters if not self-hosting, since pod admins can see hosted user data$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Do I need to run my own server to use diaspora*?$q$, $q$No — you can join any existing public pod, or self-host your own pod if you want full control.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Is diaspora* free?$q$, $q$Yes, it's free and open source under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$How is diaspora* different from Mastodon?$q$, $q$diaspora* uses its own federation protocol and organizes sharing around "aspects" (custom audience groups) rather than the ActivityPub-based follow model most fediverse apps use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Who maintains diaspora*?$q$, $q$The nonprofit Diaspora Foundation, part of the Free Software Support Network.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Privacy-focused social networking$q$, $q$Individuals wanting to leave centralized social platforms can join a community-run pod or host their own.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$Community-run networks$q$, $q$Groups can operate their own diaspora* pod to host a self-governed social space for their members.$q$, $q$Communities and organizations wanting an independent social network$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$diaspora* launched in 2010 after a Kickstarter campaign by four NYU students — Dan Grippi, Maxwell Salzberg, Raphael Sofaer, and Ilya Zhitomirskiy — with the goal of building a decentralized alternative to centralized social networks. The network runs as a collection of independently operated 'pods' that federate with one another over diaspora*'s own protocol, so no single company controls the whole network.$q$, $q$The project is now stewarded by the nonprofit Diaspora Foundation and continues to receive updates, though at a slower pace than newer fediverse projects.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8116962c-5001-43e3-b838-698a93f20293', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$diaspora* is aimed at privacy-conscious users and communities who want to run or join a social network outside of a corporate platform's data-collection model, and at self-hosters comfortable operating a Ruby on Rails application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8116962c-5001-43e3-b838-698a93f20293', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8116962c-5001-43e3-b838-698a93f20293', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8116962c-5001-43e3-b838-698a93f20293', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8116962c-5001-43e3-b838-698a93f20293', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Elgg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source PHP framework for building custom social networking and community platforms.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Elgg is a free, open-source PHP framework for building custom social networking and community platforms, maintained by the Elgg Foundation.$q$,
  og_description = $q$Elgg is a free, open-source PHP framework for building custom social networking and community platforms, maintained by the Elgg Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '52d15888-e7a1-4bf4-a86f-407a65530036';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '52d15888-e7a1-4bf4-a86f-407a65530036' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Plugin/extension architecture$q$, $q$A modular plugin system with a large library of community-built plugins.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Composer-based packaging$q$, $q$Dependencies and plugins are managed through Composer.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Entity system$q$, $q$A flexible data model for defining custom content types.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Access control & groups$q$, $q$Fine-grained, per-item access permissions and built-in user groups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Event & hook system$q$, $q$Developers can tap into Elgg's event and view hooks to customize behavior without modifying core.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$File storage & notifications$q$, $q$Built-in file handling and a notification system.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Internationalization$q$, $q$Core support for translating the platform into multiple languages.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Security protections$q$, $q$Built-in CSRF and XSS protections.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Free and open source, dual-licensed under GPLv2 and MIT$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Highly extensible plugin and event architecture suited to building bespoke community platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Long track record since 2004 with a stable nonprofit steward, the Elgg Foundation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Strong access-control model for building platforms with complex privacy requirements$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$It's a framework, not an out-of-the-box social network — real use requires development effort to configure plugins and design an experience$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$PHP/MySQL stack and smaller community than newer JavaScript-based community platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Has a learning curve around its plugin, event, and hook system for new developers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Is Elgg free?$q$, $q$Yes, Elgg is free and open source, dual-licensed under GPLv2 and MIT.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Do I need to know how to code to use Elgg?$q$, $q$Elgg is a development framework — building a full community site typically requires PHP development or configuring existing community plugins.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$What does Elgg run on?$q$, $q$Elgg is written in PHP and uses a MySQL-compatible database, running on a standard Apache or Nginx web server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Who maintains Elgg?$q$, $q$The nonprofit Elgg Foundation, which took over stewardship in 2010.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Organizational intranets$q$, $q$Companies and NGOs build internal community and knowledge-sharing platforms on top of Elgg's plugin system.$q$, $q$Enterprises and NGOs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$Educational communities of practice$q$, $q$Universities and training organizations use Elgg to build learning-focused social platforms.$q$, $q$Educational institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Elgg is an open-source social networking engine, originally created in 2004 by Ben Werdmuller and Dave Tosh, that developers use as a framework or toolkit to build custom community platforms rather than a turnkey social network. Governance moved to the nonprofit Elgg Foundation in 2010, and the project has continued through major PHP-based version releases since, with version 7 as its current line.$q$, $q$Rather than shipping a fixed set of social features, Elgg provides a plugin, entity, and event-hook architecture that developers extend to fit a specific community's needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Elgg is aimed at developers and organizations — universities, NGOs, government agencies, and enterprises — that need to build a bespoke social or community platform, such as intranets, communities of practice, or learning networks, and want a modular, extensible PHP foundation rather than starting from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('52d15888-e7a1-4bf4-a86f-407a65530036', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Enigma 1/2 BBS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A modern, cross-platform bulletin board system server that recreates the classic dial-up terminal community experience over Telnet and SSH.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ENiGMA half BBS is a free, open-source BBS server supporting Telnet, SSH, and WebSocket access, ANSI art, door games, and FidoNet networking.$q$,
  og_description = $q$ENiGMA half BBS is a free, open-source BBS server supporting Telnet, SSH, and WebSocket access, ANSI art, door games, and FidoNet networking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fcc4c746-3637-450b-9b93-e0c4703382b5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fcc4c746-3637-450b-9b93-e0c4703382b5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Multi-protocol access$q$, $q$Supports Telnet, SSH, and WebSocket connections for terminal clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$ANSI/ASCII art support$q$, $q$Renders ANSI, CP437, and UTF-8 art, including SAUCE metadata.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$FidoNet/BinkP networking$q$, $q$Can participate in FidoNet-style inter-BBS message networks over BinkP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Door game support$q$, $q$Runs classic DOS door games via built-in x86 emulation, plus Z-Machine interactive fiction.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$File areas$q$, $q$A searchable file base with HTTP download links for uploaded files.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Customizable menus & mods$q$, $q$JavaScript-based menu system and "mods" for building custom BBS experiences and themes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Security$q$, $q$PBKDF2 password hashing with two-factor authentication support.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Built-in extra servers$q$, $q$Includes its own HTTPS web server plus Gopher and NNTP servers.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Free and open source under the BSD-2-Clause license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Actively maintained, with a large commit history and recent releases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Rich protocol support spanning Telnet, SSH, WebSocket, FidoNet, Gopher, and NNTP, beyond a typical single-purpose BBS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Highly customizable via a JavaScript-based menu and mod system$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Aimed at a niche, retro-computing audience rather than mainstream community-building use cases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Requires comfort running and administering a Node.js server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$No polished graphical installer — setup is config-file driven (HJSON)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Is ENiGMA½ free?$q$, $q$Yes, it's free and open source under the BSD-2-Clause license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$What do I need to run it?$q$, $q$A server running Node.js; data is stored in SQLite, and configuration is done through HJSON files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Can users connect the same way they did to classic BBSes?$q$, $q$Yes — ENiGMA½ supports Telnet and SSH connections in addition to modern WebSocket access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Does it support door games?$q$, $q$Yes, including native DOS door game emulation and Z-Machine interactive fiction support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$Retro BBS communities$q$, $q$Hobbyists stand up a classic-style multi-node bulletin board reachable over Telnet/SSH for message boards and file sharing.$q$, $q$BBS hobbyists and sysops$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$FidoNet-connected boards$q$, $q$Operators link their board into the wider FidoNet message network using built-in BinkP support.$q$, $q$FidoNet community operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ENiGMA½ (ENiGMA 1/2) is an open-source BBS server, first published on GitHub in 2015 by developer NuSkooler, that lets operators run a modern, multi-node terminal community reachable over Telnet, SSH, and WebSockets. It brings the retro dial-up bulletin board format — message boards, file areas, door games — to contemporary server infrastructure built on Node.js.$q$, $q$The project remains actively maintained, with a large commit history and ongoing releases, and is highly configurable through JavaScript-based menus, themes, and "mods."$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ENiGMA½ is built for BBS hobbyists, sysops, and retrocomputing/ANSI-art communities who want to run a multi-node terminal bulletin board rather than a web-based forum.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcc4c746-3637-450b-9b93-e0c4703382b5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── GoToSocial ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A lightweight, self-hosted ActivityPub server that provides Mastodon-API-compatible federated social networking with a small resource footprint.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GoToSocial is a free, open-source, lightweight ActivityPub server with a Mastodon-compatible API, built for small fediverse instances.$q$,
  og_description = $q$GoToSocial is a free, open-source, lightweight ActivityPub server with a Mastodon-compatible API, built for small fediverse instances.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f9ddf754-14b8-4ba3-b736-ca0959c8894d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f9ddf754-14b8-4ba3-b736-ca0959c8894d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Chronological timelines$q$, $q$No algorithmic ranking; posts appear in time order.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Granular visibility controls$q$, $q$Public, unlisted, followers-only, and direct-message-style post visibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Reply-interaction policies$q$, $q$Fine-grained control over who can reply to a given post.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Mastodon-API compatibility$q$, $q$Existing Mastodon-compatible mobile and desktop apps can connect to a GoToSocial account.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Markdown post formatting$q$, $q$Posts can be composed using Markdown.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Theming$q$, $q$Custom CSS and profile theming options.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Built-in HTTPS$q$, $q$Automatic HTTPS/Let's Encrypt certificate handling.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$OIDC integration$q$, $q$Supports OpenID Connect for external authentication.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Free and open source under the AGPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Very low resource requirements, roughly 250-350MB of RAM, making it cheap to self-host on small VPS instances$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Compatible with existing Mastodon apps via its Mastodon-API-compatible REST API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Actively developed with frequent releases and a small, focused core team$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Still in beta as of its current release cycle, not yet a "1.0" stable release$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Smaller feature set than Mastodon by design, such as no nested boosting and limited discovery tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$No built-in algorithmic discovery, which reflects the project's philosophy but may not suit everyone$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Is GoToSocial free?$q$, $q$Yes, it's free and open source under the AGPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Can I use Mastodon apps with GoToSocial?$q$, $q$Yes — GoToSocial implements a Mastodon-API-compatible REST API, so most existing Mastodon apps work with it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Is GoToSocial stable and production-ready?$q$, $q$It's in active beta; the project has not yet declared a 1.0 stable release.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$What database does GoToSocial use?$q$, $q$SQLite by default, with optional PostgreSQL support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Personal fediverse server$q$, $q$An individual runs their own single-user ActivityPub server with a Mastodon-compatible app instead of joining a large instance.$q$, $q$Individuals wanting an independent fediverse presence$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$Small-group or community instances$q$, $q$Small communities run a low-resource federated server for their members without operating a full Mastodon deployment.$q$, $q$Small communities and groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GoToSocial is an open-source ActivityPub server, started as a solo project around 2021 by a small team known as Super Serious Business, designed to be a lightweight alternative to Mastodon for running a single-user or small-group fediverse server. It's written in Go and is explicitly built around the idea of running "many small, weird, specialist servers" rather than large centralized instances.$q$, $q$The project has been in beta since late 2024 and continues active development toward a stable release, with its canonical codebase hosted on Codeberg.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GoToSocial suits individuals and small communities who want to self-host a fediverse presence with minimal server resources, without the algorithmic-feed and large-instance dynamics of bigger platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9ddf754-14b8-4ba3-b736-ca0959c8894d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Hatsu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A self-hosted bridge that adds automated ActivityPub/Fediverse federation to any static blog or website.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Hatsu is a free, open-source, self-hosted bridge that adds ActivityPub/Fediverse federation to any static blog using its existing feed.$q$,
  og_description = $q$Hatsu is a free, open-source, self-hosted bridge that adds ActivityPub/Fediverse federation to any static blog using its existing feed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ef53b6f-d698-4b20-ab83-57c388a50f2d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ef53b6f-d698-4b20-ab83-57c388a50f2d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Feed-based federation$q$, $q$Consumes a site's RSS, Atom, or JSON feed to detect new posts and federate them automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Follow handling$q$, $q$Accepts and manages Fediverse follow requests on behalf of the static site.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Reply backfeed$q$, $q$Captures replies made from the Fediverse and surfaces them back to the site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Fediverse discovery redirects$q$, $q$Resolves Fediverse handle and URL lookups to the correct Hatsu-hosted resource.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Static-site agnostic$q$, $q$Works with any static site generator or static hosting provider, since it only needs a feed URL.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Docker deployment$q$, $q$Ships as a self-hosted, Docker-deployable service.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$ActivityPub-focused$q$, $q$Implements ActivityPub federation specifically; it does not bridge to Nostr or AT Protocol/Bluesky.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Free and open source under the AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Requires no changes to an existing static site beyond having a syndication feed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Written in Rust and designed to be lightweight to self-host$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Actively maintained with recent commits$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Explicitly labeled a work in progress by its own maintainers, so expect rough edges$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Supports ActivityPub only, not other decentralized-social protocols$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Smaller community and ecosystem than more established fediverse tools like GoToSocial or Mastodon$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Requires self-hosting know-how, including Docker and DNS/HTTPS setup, to federate correctly$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Is Hatsu free?$q$, $q$Yes, it's free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Do I need to change my static site to use Hatsu?$q$, $q$No — Hatsu only needs your site's existing RSS, Atom, or JSON feed to detect and federate new posts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$What protocol does Hatsu support?$q$, $q$ActivityPub, the protocol used by Mastodon and most of the Fediverse; it does not support Nostr or Bluesky's AT Protocol.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Is Hatsu production-ready?$q$, $q$The project's own documentation describes it as still a work in progress, so expect ongoing changes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Static blog federation$q$, $q$Bloggers on Hugo, Jekyll, Eleventy, or similar static generators can gain Fediverse followers and replies by pointing Hatsu at their feed.$q$, $q$Static-site and blog owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$Fediverse reach without a CMS switch$q$, $q$Sites that don't want to move to a dynamic, federation-native CMS can still reach Mastodon and ActivityPub users.$q$, $q$Independent publishers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Hatsu is an open-source tool, with its GitHub repository created in mid-2023, that lets owners of static sites and blogs gain Fediverse followers and replies without building ActivityPub federation into their site themselves. It reads a site's existing RSS, Atom, or JSON feed as its data source and handles the federation protocol work — accepting follows, pushing new posts to followers, and feeding Fediverse replies back to the site — as a self-hosted, Docker-deployable service.$q$, $q$The project's own site describes Hatsu as still a work in progress, and it is explicitly scoped to ActivityPub rather than other decentralized-social protocols like Nostr or Bluesky's AT Protocol.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Hatsu is for static-site and blog owners on any site generator or static host who want their content to reach Mastodon and other ActivityPub-based Fediverse users without adopting a full dynamic CMS or federation-capable platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ef53b6f-d698-4b20-ab83-57c388a50f2d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Hubzilla ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A decentralized social networking and publishing platform with nomadic identity that lets accounts move or clone across independently run servers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Hubzilla is a free, open-source federated platform combining social networking, blogging, wikis, and cloud storage with nomadic identity.$q$,
  og_description = $q$Hubzilla is a free, open-source federated platform combining social networking, blogging, wikis, and cloud storage with nomadic identity.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a66fca94-72b5-448d-a986-f5944ee873d8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a66fca94-72b5-448d-a986-f5944ee873d8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Nomadic identity$q$, $q$User identities can be cloned or relocated across different Hubzilla servers while retaining connections and content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Fine-grained permissions$q$, $q$Per-post, per-file, or per-group access control rather than simple public/private toggles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Federated single sign-on$q$, $q$Authentication that carries across federated hubs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Built-in blogging & wikis$q$, $q$Native long-form publishing and collaborative wiki pages alongside social posts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Cloud file storage$q$, $q$Permission-based file storage and sharing built into the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Discussion groups$q$, $q$Built-in group discussion spaces.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Multi-protocol federation$q$, $q$Interoperates with ActivityPub, Diaspora, and its own Zot protocol, reaching users on Mastodon, Misskey, PeerTube, and other federated platforms.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Content filtering$q$, $q$Tools for filtering and blocking unwanted content or contacts.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Broader feature set than single-purpose fediverse tools, combining social, storage, wikis, and blogging in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Nomadic identity is a distinctive feature that avoids full lock-in to any one server operator$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Interoperates with multiple federation protocols, Zot, ActivityPub, and Diaspora, reaching a wide range of fediverse platforms$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Requires PHP/MySQL-compatible hosting, a steeper setup than some newer Go-based fediverse tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Smaller mindshare and community than Mastodon or other more mainstream fediverse platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$The breadth of features spanning social, storage, wikis, and blogging can mean a steeper learning curve for new users and admins$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Community-led development pace can be slower than commercially backed alternatives$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Is Hubzilla free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$What is nomadic identity?$q$, $q$It's Hubzilla's system for letting a user's account, connections, and content be cloned or moved to a different Hubzilla server without starting over.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$What do I need to self-host Hubzilla?$q$, $q$A PHP environment with a MySQL-compatible database, such as MariaDB, and a standard web server like Apache.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Does Hubzilla work with Mastodon?$q$, $q$Yes — Hubzilla supports ActivityPub federation alongside its own Zot protocol, so it can interact with Mastodon, Misskey, PeerTube, and other ActivityPub-based platforms.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$All-in-one community hub$q$, $q$Organizations run a single federated platform that combines social feed, file storage, wikis, and blogging for their members.$q$, $q$Communities and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$Portable social identity$q$, $q$Users who want to avoid being locked into one server operator can use nomadic identity to move their account between hubs.$q$, $q$Privacy- and portability-focused users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Hubzilla traces its lineage to Mike Macgirvin's 2010 "Mistpark"/Friendika work, which was forked into "Red"/"RedMatrix" in 2012 and renamed Hubzilla in 2015. It combines social networking, blogging, wikis, and cloud file storage into one federated platform, built around a distinctive "nomadic identity" system that lets a user's account be cloned or moved between independently run Hubzilla servers, called hubs, without losing their connections.$q$, $q$Development has been community-led since 2015, with the codebase hosted on Framagit and ongoing releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Hubzilla suits communities and organizations that want an all-in-one federated platform combining a social feed, file storage, wikis, and publishing, with strong, granular privacy controls, rather than a single-purpose microblogging server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66fca94-72b5-448d-a986-f5944ee873d8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Iceshrimp.NET ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted ActivityPub microblogging server built from scratch in .NET for performance and maintainability.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Iceshrimp.NET is a free, open-source ActivityPub server rewritten in .NET, offering Mastodon-compatible fediverse federation for self-hosters.$q$,
  og_description = $q$Iceshrimp.NET is a free, open-source ActivityPub server rewritten in .NET, offering Mastodon-compatible fediverse federation for self-hosters.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc45a7d5-8397-4680-90b5-60974a154019';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc45a7d5-8397-4680-90b5-60974a154019' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$ActivityPub federation$q$, $q$Interoperates with Mastodon, Misskey, Akkoma and other fediverse servers over the open ActivityPub standard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Mastodon-compatible API$q$, $q$Supports many existing Mastodon-client apps (Elk, Tusky, Ice Cubes and others) without requiring a dedicated client.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$.NET backend$q$, $q$Rewritten from the ground up in C# for improved performance and resource efficiency compared to the original Iceshrimp-JS.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Blazor WASM frontend$q$, $q$Web client built with Blazor WebAssembly, served directly from the instance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Configurable public preview$q$, $q$Instance operators can configure what an anonymous HTML preview of posts looks like to non-federated visitors and crawlers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Migration tooling$q$, $q$Provides a path for existing Iceshrimp-JS instances to migrate their data to Iceshrimp.NET.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Free, open-source and self-hosted with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Performance-focused rewrite aimed at lower resource usage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Federates with the broader ActivityPub fediverse$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Compatible with popular existing Mastodon client apps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Documented migration path from Iceshrimp-JS$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Still beta software with no official flagship instance to try first$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Requires self-hosting and server administration skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Smaller ecosystem and community than Mastodon or Misskey$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Is Iceshrimp.NET free?$q$, $q$Yes, it is fully open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Can I use my existing Mastodon app with Iceshrimp.NET?$q$, $q$Yes, it exposes a Mastodon-compatible API, so apps like Elk, Tusky and Ice Cubes can connect to an instance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Is there an official public instance to join?$q$, $q$No, the project does not operate a flagship instance; you need to self-host or find a community-run instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$What is Iceshrimp.NET a rewrite of?$q$, $q$It is a from-scratch rewrite of the earlier Iceshrimp-JS project, moving the backend to .NET.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Self-hosted fediverse instance$q$, $q$Run a personal or community ActivityPub server without depending on a third-party host.$q$, $q$Server administrators and privacy-focused communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$Migrating from Iceshrimp-JS$q$, $q$Move an existing Iceshrimp-JS community onto a more performant, maintainable backend.$q$, $q$Existing Iceshrimp instance operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Iceshrimp.NET is a complete rewrite of the earlier Iceshrimp-JS project, built on a new .NET backend with a Blazor WASM frontend. It is a decentralized, self-hosted microblogging server that speaks ActivityPub, letting an instance federate with Mastodon, Misskey, Akkoma and the wider fediverse.$q$, $q$The project positions itself as a community-centric alternative to the larger ActivityPub server projects, with a stated focus on performance, resource efficiency and long-term maintainability rather than rapid feature sprawl. It ships a Mastodon-compatible API so existing third-party apps such as Elk, Tusky and Ice Cubes can connect to an instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Server administrators who already run or want to run their own fediverse instance and prefer a lighter, more efficient backend than existing ActivityPub servers, plus users who want to migrate an existing Iceshrimp-JS community onto a more maintainable codebase.$q$, $q$The project explicitly does not run a flagship public instance, so it's aimed at operators willing to self-host rather than end users looking for a ready-made account to sign up to.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc45a7d5-8397-4680-90b5-60974a154019', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Isso ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, self-hosted comment server written in Python, built as a privacy-friendly alternative to Disqus.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Isso is a free, open-source, self-hosted commenting server for blogs, offering Markdown comments and a lightweight JavaScript embed.$q$,
  og_description = $q$Isso is a free, open-source, self-hosted commenting server for blogs, offering Markdown comments and a lightweight JavaScript embed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45e476ca-e137-4841-abde-19c6273464c0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45e476ca-e137-4841-abde-19c6273464c0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Markdown comments$q$, $q$Visitors can format comments using Markdown.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Self-edit and delete window$q$, $q$Commenters can edit or delete their own comment within a configurable time window (15 minutes by default).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Moderation queue$q$, $q$New comments can be held for moderator approval before appearing publicly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Disqus and WordPress import$q$, $q$Existing comment threads can be migrated in from Disqus or WordPress.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Minimal JS client$q$, $q$A single small JavaScript file embeds the comment widget on any page.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$SQLite storage$q$, $q$No separate database server is required; comments are stored in a SQLite file.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Very small JavaScript footprint on embedding pages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$No external database dependency to manage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Straightforward migration from Disqus or WordPress comments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Keeps visitor comment data off third-party platforms$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Requires self-hosting a Python service, not a plug-and-play SaaS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Fewer built-in integrations than commercial commenting platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$No official managed hosting option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Is Isso free?$q$, $q$Yes, Isso is open-source software and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$What database does Isso use?$q$, $q$Isso stores comments in a local SQLite database, so no separate database server is needed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Can I migrate comments from Disqus?$q$, $q$Yes, Isso provides import support for existing Disqus and WordPress comment data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$What browsers does the comment widget support?$q$, $q$The embeddable JavaScript client supports Firefox, Safari, Chrome and Edge.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Blog comments without third-party tracking$q$, $q$Add a comment section to a personal or company blog while keeping visitor data on your own server.$q$, $q$Bloggers and independent publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$Replacing Disqus$q$, $q$Migrate an existing Disqus-powered comment section to a self-hosted alternative.$q$, $q$Site owners moving away from ad-supported comment platforms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Isso is a small, self-hosted commenting server that site owners embed into blogs and articles instead of using a third-party service like Disqus. The server is written in Python and stores comments in a SQLite database, keeping the deployment footprint small.$q$, $q$The embeddable client is a single JavaScript file (around 65KB, 20KB gzipped), which keeps page-weight impact low compared to many commercial commenting widgets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bloggers and site operators who want comments on their static or dynamic sites without sending visitor data to a third-party ad-supported platform, and who are comfortable self-hosting a small Python service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e476ca-e137-4841-abde-19c6273464c0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Misago ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modern, self-hosted forum platform built with Django and React, designed to be fast, scalable and customizable.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Misago is a free, open-source, self-hosted forum platform built with Django and React, featuring Docker deployment and a plugin system.$q$,
  og_description = $q$Misago is a free, open-source, self-hosted forum platform built with Django and React, featuring Docker deployment and a plugin system.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2b43eeda-4ceb-459a-a73d-d764275698c6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2b43eeda-4ceb-459a-a73d-d764275698c6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Docker deployment$q$, $q$Ships with Docker support for streamlined installation and updates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Admin control panel$q$, $q$Web-based ACP for managing users, permissions and forum settings.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Theming and branding$q$, $q$Custom styling and page header/branding options.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Plugin architecture$q$, $q$Extensible via plugins for adding functionality beyond the core.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$User permission system$q$, $q$Granular permission groups control what members can see and do.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Internationalization$q$, $q$Interface has been translated into languages beyond English, including German.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Free and open source with an active GitHub project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Modern React-based frontend rather than legacy PHP templating$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Docker support simplifies self-hosted deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Plugin system for extending functionality$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Active community forum for support and translations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Requires comfort running a Django/Python stack to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Smaller plugin ecosystem than long-established forum software like phpBB or SMF$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$No official managed/hosted version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Is Misago free to use?$q$, $q$Yes, Misago is open-source software, free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$What tech stack does Misago use?$q$, $q$A Django (Python) backend with a React frontend.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Can I deploy Misago with Docker?$q$, $q$Yes, the project supports Docker-based deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Does Misago support plugins?$q$, $q$Yes, it has a plugin architecture for extending the admin control panel and forum functionality.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Community discussion forum$q$, $q$Run a self-hosted forum for a community, product or hobby group with a modern web interface.$q$, $q$Community managers and forum administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$Customizable branded forum$q$, $q$Build a forum with custom theming and plugins tailored to a specific organization.$q$, $q$Developers and technical site owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Misago is an open-source forum application built on Django with a React frontend, started by developer Rafał Pitoń in 2012. It aims to be a modern alternative to older PHP forum software, with Docker-based deployment, a plugin-friendly admin control panel, and a responsive interface.$q$, $q$The project is actively maintained, with ongoing releases and a community forum where translation, styling and plugin discussions happen alongside support threads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Community managers and developers who want a self-hosted discussion forum with a modern JavaScript frontend and are comfortable deploying and customizing a Django application, typically via Docker.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b43eeda-4ceb-459a-a73d-d764275698c6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Movim ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source XMPP-based social platform combining chat, communities, blogs and video calls in one self-hostable app.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Movim is a free, open-source XMPP-based social platform with chat, communities, blogs and video calls, self-hostable on your own server.$q$,
  og_description = $q$Movim is a free, open-source XMPP-based social platform with chat, communities, blogs and video calls, self-hostable on your own server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4bb6de5a-4c58-4a03-a3da-62dde82c521f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4bb6de5a-4c58-4a03-a3da-62dde82c521f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$End-to-end encrypted chat$q$, $q$Supports OMEMO encryption for private one-to-one messaging.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Communities and Spaces$q$, $q$Group discussion areas for organizing communities around topics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Blog publishing$q$, $q$Users can publish blog-style posts with a real-time feed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Disappearing stories$q$, $q$Photo/text stories that expire after 24 hours.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Audio/video calling$q$, $q$One-to-one and group video calls with screen sharing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$XMPP interoperability$q$, $q$Works alongside other XMPP clients like Conversations and Dino, and runs on standard servers such as ejabberd or Prosody.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Free and open source, built on an open decentralized protocol$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Combines chat, blogging, communities and video calls in one app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Interoperates with the wider XMPP client ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Progressive web app installs on phones, tablets and desktops$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Supports end-to-end encrypted messaging via OMEMO$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Requires an XMPP server (ejabberd/Prosody) to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Smaller mainstream user base than commercial social networks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Project relies on donations for ongoing hosting and development$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Is Movim free?$q$, $q$Yes, Movim is free and open-source software; the project accepts optional donations to fund hosting and development.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$What protocol does Movim use?$q$, $q$It's built on XMPP, an open, decentralized messaging standard.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Can I use Movim with other XMPP clients?$q$, $q$Yes, a Movim account works with other XMPP clients such as Conversations and Dino.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Does Movim support video calls?$q$, $q$Yes, it supports one-to-one and group video calls with screen sharing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Decentralized community platform$q$, $q$Run a self-hosted social space for a community without relying on a corporate-controlled network.$q$, $q$Privacy-focused communities and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$Unified XMPP client$q$, $q$Use Movim as a full-featured web client for an existing XMPP/Jabber account.$q$, $q$XMPP users wanting chat, blogging and calls in one interface$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Movim, started by Timothée Jaussoin in 2010, is a web-based social and communication platform built on the open XMPP protocol rather than a proprietary backend. It combines one-to-one and group chat, community 'Spaces', blog-style posts, 24-hour disappearing stories, and audio/video calling in a single progressive web app.$q$, $q$Because it's built on XMPP, a Movim account can interoperate with other XMPP clients such as Conversations and Dino, and instances can be run on standard XMPP servers like ejabberd or Prosody.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-conscious individuals, communities, classrooms and organizations that want a decentralized alternative to mainstream social platforms and are comfortable running or joining an XMPP-based server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4bb6de5a-4c58-4a03-a3da-62dde82c521f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OSSN ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source PHP script for building self-hosted social networking sites, communities and membership platforms.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OSSN is a free, open-source PHP script for building self-hosted social networks, communities and membership platforms with full data ownership.$q$,
  og_description = $q$OSSN is a free, open-source PHP script for building self-hosted social networks, communities and membership platforms with full data ownership.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f05bad91-5d44-4ab8-bd64-a36e981b6349';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f05bad91-5d44-4ab8-bd64-a36e981b6349' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$User profiles and timelines$q$, $q$Chronological activity timelines and customizable member profiles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Groups and messaging$q$, $q$Group spaces plus private messaging and notifications between members.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Photo albums$q$, $q$Members can upload and organize photo albums.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$REST API$q$, $q$Production-ready REST APIs for building integrations or custom clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Component marketplace$q$, $q$Hundreds of add-ons available to extend the base platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Redis caching support$q$, $q$Can be optimized with Redis and caching for performance at scale.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Free, open-source core with no per-user licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Extensible via a large component/add-on marketplace$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Full data ownership since it runs on your own infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Mobile-responsive out of the box$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$REST API available for custom integrations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Requires self-hosting a PHP application and its infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$UI conventions feel dated compared to newer social platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Some add-ons and support options are paid rather than included$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Is OSSN free?$q$, $q$Yes, the core OSSN script is free and open source; some add-ons and managed hosting options are offered separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$What language is OSSN written in?$q$, $q$PHP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Can I extend OSSN with plugins?$q$, $q$Yes, it has a component marketplace and a hook/event system for extending functionality without modifying core files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Does OSSN have an API?$q$, $q$Yes, it provides REST APIs for integrations and custom clients.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Niche community site$q$, $q$Launch a dedicated social network for a hobby, interest group or fan community.$q$, $q$Community founders and site operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$Internal collaboration network$q$, $q$Run a private, self-hosted social space for an organization or membership group.$q$, $q$Enterprises, associations and educational institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OSSN (Open Source Social Network) is a PHP-based script that lets operators stand up their own branded social networking site, online community, membership platform or private collaboration space. It's distributed as free, open-source software with no artificial user limits or licensing fees for the core product.$q$, $q$The project provides user profiles, timelines, groups, messaging, notifications and photo albums out of the box, and can be extended through a component marketplace of add-ons and a hook/event system that avoids modifying core files.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Community builders, membership organizations, educational institutions, alumni associations and enterprises that want to run their own social network on infrastructure they control, rather than building on a third-party social platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f05bad91-5d44-4ab8-bd64-a36e981b6349', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── PieFed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, federated link-aggregator and forum platform, an ActivityPub-based alternative to Reddit and Lemmy.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PieFed is a free, open-source, ActivityPub-federated link aggregator and forum platform, an alternative to Reddit and Lemmy.$q$,
  og_description = $q$PieFed is a free, open-source, ActivityPub-federated link aggregator and forum platform, an alternative to Reddit and Lemmy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$ActivityPub federation$q$, $q$Interoperates with Lemmy, Mbin and other fediverse platforms, sharing posts, votes and comments across servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$No ads or tracking$q$, $q$The platform does not run advertising or engagement-optimization algorithms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$User-built feeds$q$, $q$Feeds are curated by communities rather than an opaque recommendation algorithm.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Mobile app compatibility$q$, $q$Works with existing Lemmy-compatible mobile apps via its federated API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Self-hostable$q$, $q$Documented installation process (INSTALL.md) for running your own instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Python/Flask codebase$q$, $q$Open, developer-friendly codebase for contributions and customization.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Federates with Lemmy and Mbin, extending reach beyond a single instance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$No advertising or engagement-manipulation algorithms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Can join an existing instance or self-host independently$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Compatible with existing Lemmy mobile apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Smaller user base than Reddit or established Lemmy instances$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Self-hosting requires Python/Flask server administration skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Federated moderation and content policies vary by instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Is PieFed free?$q$, $q$Yes, PieFed is free, open-source software licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Is PieFed compatible with Lemmy?$q$, $q$Yes, it federates over ActivityPub and shares posts, votes and comments with Lemmy and Mbin instances.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Can I self-host PieFed?$q$, $q$Yes, the project provides installation documentation for running your own instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Who created PieFed?$q$, $q$PieFed was created by Rimu Atkinson, with development starting in mid-2023.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Ad-free link aggregation community$q$, $q$Join or host a Reddit-style discussion community without ads or algorithmic feeds.$q$, $q$Communities seeking a decentralized Reddit alternative$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$Federated forum for a niche topic$q$, $q$Run a self-hosted instance focused on a specific topic that still interoperates with the broader fediverse.$q$, $q$Server administrators and topical communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PieFed is an open-source link aggregator and forum platform created by Rimu Atkinson, with its first commit made in July 2023. Written in Python with Flask, it federates over ActivityPub, sharing posts, votes and comments with Lemmy, Mbin and other fediverse platforms, making it directly interoperable with those existing communities.$q$, $q$The project is licensed under AGPL-3.0 and is positioned as a community-governed, ad-free alternative to centralized link-aggregation sites like Reddit, run either on the flagship piefed.social instance or self-hosted independently.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Communities and individuals who want a Reddit-style discussion and link-sharing platform without corporate ownership, algorithmic feeds or advertising, and who value interoperability with the wider Lemmy/Mbin fediverse.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecbe2f92-cfc5-4dba-ba88-7a0b655ae0ed', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── qpixel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Ruby on Rails Q&A software that powers the Codidact network of community knowledge-sharing sites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$qpixel is the free, open-source Ruby on Rails Q&A platform that powers Codidact, self-hostable for your own community knowledge base.$q$,
  og_description = $q$qpixel is the free, open-source Ruby on Rails Q&A platform that powers Codidact, self-hostable for your own community knowledge base.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6f591ae-29a7-48f3-86f6-535c814b5f34';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6f591ae-29a7-48f3-86f6-535c814b5f34' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Question-and-answer format$q$, $q$Community knowledge-sharing structured as questions, answers and voting, similar to Stack Exchange-style sites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Multi-community network support$q$, $q$Powers the multiple distinct topical communities that make up the Codidact network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Docker deployment option$q$, $q$Community-contributed Docker configuration supports containerized self-hosting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$AGPL licensing$q$, $q$Fully open-source under the AGPL, with source available on GitHub.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Ruby on Rails codebase$q$, $q$Built on Rails, with an active develop branch for contributions.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Free and fully open source under AGPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Powers a real, active production network (Codidact)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Can be self-hosted independently of Codidact.com$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Active open-source contributor community and documented setup process$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Primarily documented for the Codidact use case rather than as a generic drop-in product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Self-hosting requires Ruby on Rails deployment experience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Smaller ecosystem than mainstream Q&A platforms like Stack Exchange$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Is qpixel free?$q$, $q$Yes, it is open-source software licensed under AGPL.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$What does qpixel power?$q$, $q$It's the software behind the Codidact network of community Q&A sites.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Can I self-host qpixel outside of Codidact?$q$, $q$Yes, the GitHub repository documents how to run a local or Docker-based instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$What is qpixel built with?$q$, $q$Ruby on Rails.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Running a community Q&A site$q$, $q$Self-host a Stack Exchange-style question-and-answer community for a specific topic.$q$, $q$Community organizers and technical communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$Contributing to Codidact$q$, $q$Develop features for or study the codebase behind the existing Codidact network.$q$, $q$Open-source contributors and Rails developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$QPixel is the open-source, Ruby on Rails-based software that powers Codidact, a community-run network of question-and-answer sites covering topics like software development, writing, and more. It's built and maintained by the Codidact community itself and is licensed under AGPL.$q$, $q$The project can be self-hosted independently of Codidact's own network; the GitHub repository includes setup instructions for a local instance, and community-contributed Docker configuration is available for containerized deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Communities and developers who want to run their own Stack Exchange-style Q&A site under their own governance, or who want to contribute to or study the software behind the Codidact network.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6f591ae-29a7-48f3-86f6-535c814b5f34', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── remark42 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, privacy-focused commenting engine written in Go, with social login, moderation and no external tracking.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Remark42 is a free, open-source, self-hosted commenting engine written in Go, offering social login, moderation and no external tracking.$q$,
  og_description = $q$Remark42 is a free, open-source, self-hosted commenting engine written in Go, offering social login, moderation and no external tracking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f1b6cce1-f828-4060-b252-e9dae59643ea';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f1b6cce1-f828-4060-b252-e9dae59643ea' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Nested comment threads$q$, $q$Multi-level nested comments with both tree and plain display modes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Social login$q$, $q$Sign-in via Google, Facebook, Microsoft, GitHub, Apple, Yandex, Patreon, Discord, Telegram or custom OAuth2.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Markdown editor$q$, $q$Comment composer with a Markdown formatting toolbar.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Image uploads$q$, $q$Drag-and-drop image uploads directly in comments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Moderation tools$q$, $q$Remove comments, block users, and manage a voting and pinning system.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Notification channels$q$, $q$Sends notifications via Telegram, Slack, email or webhooks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$No external database$q$, $q$All data is stored in a single embedded data file, simplifying backup and deployment.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$No external database to provision or manage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Privacy-focused: minimal data collection, encrypted/hashed storage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Runs as a single Docker container or standalone binary on Linux, Windows or macOS$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Supports many social login providers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Requires self-hosting and basic server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$No managed/hosted SaaS version offered by the project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Fewer built-in analytics/reporting features than commercial comment platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Is remark42 free?$q$, $q$Yes, it is open-source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$What language is remark42 written in?$q$, $q$Go.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Does remark42 need a separate database?$q$, $q$No, it stores everything in a single embedded data file.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Can users comment anonymously?$q$, $q$Yes, anonymous commenting can be enabled alongside social login options.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Privacy-respecting blog comments$q$, $q$Add a full-featured comment section to a blog without third-party ad-network tracking.$q$, $q$Bloggers and independent publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$Multi-site comment hosting$q$, $q$Manage comments for several websites from a single self-hosted instance.$q$, $q$Site operators running multiple properties$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Remark42, created by developer Umputun, is a self-hosted comment engine written in Go, built as a lightweight alternative to Disqus that doesn't track or profile visitors. It embeds into blogs, articles or any page needing a comment section, and stores everything in a single embedded data file with no external database required.$q$, $q$It supports social login through Google, Facebook, Microsoft, GitHub, Apple, Yandex, Patreon, Discord, Telegram and custom OAuth2 providers, alongside optional anonymous commenting, and can manage multiple sites from one instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bloggers, publishers and site operators who want a full-featured comment system with moderation and voting, but without sending reader data to a third-party advertising-funded platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1b6cce1-f828-4060-b252-e9dae59643ea', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Scoold ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted Q&A platform and knowledge base for teams, free as open source with paid Pro and Cloud tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Scoold is a self-hosted Q&A platform and knowledge base for teams, free as open source with paid Pro licenses and a managed Cloud option.$q$,
  og_description = $q$Scoold is a self-hosted Q&A platform and knowledge base for teams, free as open source with paid Pro licenses and a managed Cloud option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c4424b7-aba0-4e04-9853-edd33d4b7072';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c4424b7-aba0-4e04-9853-edd33d4b7072' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Full-text search$q$, $q$Search across all questions, answers and comments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Enterprise SSO$q$, $q$SAML 2.0, LDAP, OAuth 2.0 and SCIM user provisioning available on Pro tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Gamification$q$, $q$Reputation points and badges to encourage participation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$REST API$q$, $q$API access for building integrations and custom tooling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Multiple spaces$q$, $q$Isolated spaces/sub-communities within a single instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Chat tool integrations$q$, $q$Connects with Slack, Microsoft Teams, Mattermost, Zapier and n8n.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Flexible deployment$q$, $q$Runs as a Docker container, standalone JAR, or native executable on any cloud or on-premises.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Free, open-source Community edition under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Data stays fully on-premises when self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Enterprise SSO and SCIM available for organizations that need it$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Flexible deployment options (Docker, JAR, native executable)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Long track record with 5M+ Docker Hub downloads$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Enterprise SSO, file uploads and unlimited spaces require a paid Pro license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Pro licenses are one-time fees with only 12 months of included updates/support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Cloud (managed hosting) pricing isn't published on the pricing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Is Scoold free?$q$, $q$Yes, the Community edition is free and open source under Apache 2.0. Paid Pro and Cloud tiers add enterprise features and managed hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$How much does Scoold Pro cost?$q$, $q$Scoold Pro is a one-time fee of €499, and Pro + Source (with full source code access) is €1,999, per the official pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Can I self-host Scoold?$q$, $q$Yes, it can be deployed via Docker, a standalone JAR, or a native executable on any cloud provider or private infrastructure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Does Scoold integrate with Slack or Teams?$q$, $q$Yes, Pro tiers include integrations with Slack, Microsoft Teams, Mattermost, Zapier and n8n.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Internal team knowledge base$q$, $q$Capture and organize institutional knowledge with a searchable Q&A format.$q$, $q$Internal IT, engineering and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Developer support hub$q$, $q$Run a self-hosted Q&A community for a product's developers or users.$q$, $q$Product and developer relations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Scoold (Community)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full-featured Q&A platform","Full-text search","Social login, OAuth 2.0, LDAP","Custom themes and branding","Unlimited users","REST API"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Scoold Pro$q$, $q$€499$q$, $q$one-time$q$, $q$["Everything in Community","SAML 2.0 SSO","SCIM user provisioning","File uploads","Teams/Mattermost/Slack integrations","Unlimited spaces and admins","12 months of updates and support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Pro + Source$q$, $q$€1,999$q$, $q$one-time$q$, $q$["Everything in Scoold Pro","Full source code access","Custom feature development allowed","Architecture consulting","VAT invoicing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$Scoold Cloud$q$, NULL, $q$subscription$q$, $q$["Managed Scoold Pro hosting"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Scoold is a self-hosted Q&A platform, forum and knowledge base that teams use to capture and organize internal knowledge. The open-source Community edition is free under Apache 2.0 and can be deployed as a Docker container, standalone JAR, or native executable on any cloud provider or private infrastructure, keeping data on-premises.$q$, $q$Beyond the free edition, Scoold sells one-time-fee 'Pro' and 'Pro + Source' licenses that add enterprise SSO, file uploads, chat-tool integrations and unlimited spaces, plus a subscription-based 'Scoold Cloud' managed-hosting option. The project reports over 1,000 deployed instances and more than 5 million Docker Hub downloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Teams and organizations that want an internal knowledge base, developer Q&A hub, support center or issue tracker with data kept fully on their own infrastructure, and that need enterprise features like SAML SSO once they outgrow the free tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c4424b7-aba0-4e04-9853-edd33d4b7072', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Simple Machines Forum ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source PHP and MySQL forum software for running a self-hosted online community.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Simple Machines Forum (SMF) is free, open-source PHP and MySQL forum software for running a self-hosted online community.$q$,
  og_description = $q$Simple Machines Forum (SMF) is free, open-source PHP and MySQL forum software for running a self-hosted online community.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Package Manager$q$, $q$Install community-built modifications and themes directly from within the admin panel.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Permission and user group management$q$, $q$Fine-grained control over what different member groups can see and do.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Multi-language support$q$, $q$Can run multiple language packs simultaneously on the same forum.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Unread topic tracking$q$, $q$Tracks new and unread topics beyond just a user's last visit.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Multiple database support$q$, $q$Works with MySQL, PostgreSQL or SQLite.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Multi-format output$q$, $q$Supports XHTML, XML, RSS and WAP output formats.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Free and open source under the 3-clause BSD license (v2.0+)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Large, mature ecosystem of themes and modifications via the Package Manager$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Runs efficiently on modest shared hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Supports multiple database backends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Long track record dating back over two decades$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Interface conventions feel dated compared to newer forum software$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Requires self-managed PHP/MySQL hosting and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$No official managed/hosted SaaS version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Is Simple Machines Forum free?$q$, $q$Yes, SMF is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$What license does SMF use?$q$, $q$Versions 2.0 and 2.1 are licensed under the 3-clause BSD license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$What databases does SMF support?$q$, $q$MySQL, PostgreSQL and SQLite.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Can I extend SMF with plugins?$q$, $q$Yes, the built-in Package Manager lets you install community modifications and themes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Traditional online community forum$q$, $q$Stand up a classic bulletin-board style forum for a hobby, brand or interest community.$q$, $q$Forum administrators and community operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$Migrating from legacy forum software$q$, $q$Move an existing PHP-based forum to a maintained, actively developed codebase.$q$, $q$Site owners with established forum communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Simple Machines Forum (SMF) is a free, open-source community forum package written in PHP, with its first branded release (SMF 1.0 Beta 1a) shipping in September 2003 as a rewrite of the earlier YaBB SE project. Versions 2.0 and later are licensed under the 3-clause BSD license.$q$, $q$It supports MySQL, PostgreSQL and SQLite, includes a Package Manager for installing hundreds of community-built modifications and themes, and is designed to run with a light footprint on shared or self-managed hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Community operators who want a traditional, feature-rich bulletin-board style forum with a large library of existing themes and modifications, and who are comfortable self-hosting a PHP/MySQL application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ab9e86a-5b4d-418a-bbf7-fa7413ce25bd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Socialhome ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted federated personal profile that lets you publish content and connect with the fediverse via ActivityPub and Diaspora.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Socialhome is an open-source, self-hosted federated profile platform that connects to the fediverse via ActivityPub and Diaspora.$q$,
  og_description = $q$Socialhome is an open-source, self-hosted federated profile platform that connects to the fediverse via ActivityPub and Diaspora.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Federated profile$q$, $q$Your profile is the home for your content, federating to contacts and other fediverse servers over ActivityPub and Diaspora.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Rich content authoring$q$, $q$Posts support Markdown, and trusted users can embed HTML, JS, and CSS for custom layouts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Content visibility controls$q$, $q$Choose the visibility of individual posts, from public to limited audiences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Streams and tags$q$, $q$Follow tags and streams to organize incoming federated content by topic.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Self-hosted deployment$q$, $q$Runs as a self-hosted Django application, with Docker images provided for installation.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Fully open source (AGPLv3) with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Broad interoperability with the wider fediverse via ActivityPub and Diaspora$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Lets users own and control their own content on their own server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Actively maintained codebase on Codeberg$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Requires self-hosting knowledge (server, Docker, updates)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Smaller community than mainstream fediverse platforms like Mastodon$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$No official hosted/managed offering from the project itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Is Socialhome free to use?$q$, $q$Yes. Socialhome is free, open-source software licensed under AGPLv3. You run your own instance, so the only cost is your own server hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Can Socialhome talk to Mastodon or Diaspora?$q$, $q$Yes. Socialhome federates using both the ActivityPub protocol (used by Mastodon and many other fediverse apps) and the Diaspora protocol.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Do I need to run my own server?$q$, $q$You can either self-host an instance yourself using the provided Docker images, or join an existing open-registration Socialhome instance run by someone else.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Personal fediverse home page$q$, $q$Use Socialhome as a public, content-rich personal profile that federates posts across the fediverse.$q$, $q$Individuals who want a self-owned social presence$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Community instance$q$, $q$Run a shared Socialhome instance for a group or community that wants to interact with the wider fediverse.$q$, $q$Self-hosting communities and small groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Socialhome is an open-source, self-hosted platform that combines a personal profile page with social networking features. Content you post — text, images, and rich Markdown or HTML/CSS/JS for trusted users — is pinned to your own profile and federates out to other users and platforms.$q$, $q$Rather than building a closed network, Socialhome speaks the ActivityPub and Diaspora federation protocols, so posts, replies, and shares can reach and be received from other fediverse software (such as Mastodon, Friendica, and Diaspora) as well as other Socialhome instances.$q$, $q$The project is maintained on Codeberg under the AGPLv3 license, with a Python/Django backend and a Vue.js frontend, and can be deployed via Docker.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Socialhome suits individuals and communities who want a personal, content-first home base on the fediverse rather than a chronological feed-only timeline, and who are comfortable running or joining a self-hosted instance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Talkyard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source community platform blending forum Q&A, blog comments, and chat, available self-hosted or as hosted plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Talkyard is an open-source community platform combining forum Q&A, blog comments, and chat — self-hosted for free or via hosted plans from €1.90/month.$q$,
  og_description = $q$Talkyard is an open-source community platform combining forum Q&A, blog comments, and chat — self-hosted for free or via hosted plans from €1.90/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1345ae06-82b8-4acb-9958-4dfcce5198b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1345ae06-82b8-4acb-9958-4dfcce5198b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Forum and Q&A$q$, $q$Threaded discussions with instant answers and upvoting, similar to StackOverflow-style knowledge bases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Blog comments$q$, $q$Embeddable comment widget for blogs with built-in user accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Ideation and voting$q$, $q$Vote-based idea and feature-request boards designed to surface good ideas and reduce groupthink.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Single Sign-On and API$q$, $q$OpenID Connect login, Single Sign-On, and API access included across plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Self-hosting$q$, $q$Deploy Talkyard on your own infrastructure with automatic updates and daily off-site backups.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Open source (AGPLv3) and self-hostable at no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Combines forum, Q&A, chat, and comments in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Built-in SSO/OIDC and API access on all plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$One installation can host multiple separate communities$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Hosted plans have per-plan storage and post-volume caps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Built-in chat is more basic than dedicated chat tools like Slack$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Self-hosting requires managing your own server and upgrades$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Is Talkyard free?$q$, $q$Talkyard is open source and free to self-host. Hosted plans start at a low monthly price for small communities, with paid tiers for higher admin counts, storage, and volume.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Can Talkyard replace Disqus for blog comments?$q$, $q$Yes, Talkyard offers an embeddable, open-source blog comments widget as an alternative to Disqus.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Does Talkyard support Single Sign-On?$q$, $q$Yes, all plans include OpenID Connect login and Single Sign-On support.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Internal knowledge base$q$, $q$Run a Q&A style forum where coworkers ask questions and upvote the best answers.$q$, $q$Internal teams and companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Blog comments$q$, $q$Embed Talkyard's comment widget on a blog as an open-source Disqus alternative.$q$, $q$Bloggers and website owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Feature idea board$q$, $q$Collect and vote on product ideas from customers or team members.$q$, $q$Product teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Open-source AGPLv3 software","Run on your own server","Full feature set"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Almost Free$q$, $q$€1.90/month$q$, $q$monthly$q$, $q$["3 admins","Unlimited members","250 MB storage","Up to 1,500 new replies and 20 new pages per month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Startup$q$, $q$€29/month$q$, $q$monthly$q$, $q$["3 admins","Unlimited members","5 GB storage","Up to 1,500 new replies and pages per month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Standard$q$, $q$€59/month$q$, $q$monthly$q$, $q$["6 admins","Unlimited members","10 GB storage"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$Business$q$, $q$€95/month$q$, $q$monthly$q$, $q$["10 admins","Unlimited members","20 GB storage"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Talkyard is an open-source community discussion platform created by Magnus Lindberg that brings together features found across StackOverflow-style Q&A, Slack-like chat, Reddit-style voting, Discourse-style forums, and Disqus-style blog comments in one system.$q$, $q$It can be self-hosted on your own servers with automatic updates, Single Sign-On (including OpenID Connect), and API access, or used via Talkyard's hosted plans. A single installation can support multiple communities.$q$, $q$Common uses include internal coworker forums and knowledge bases, idea/feature voting boards, and embeddable blog comment widgets, all built around threaded discussions with upvoting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Talkyard suits teams and companies that want an internal knowledge base or Q&A forum, website owners who want an open-source Disqus alternative for blog comments, and organizations that want ideation/voting boards without relying on closed SaaS platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1345ae06-82b8-4acb-9958-4dfcce5198b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── yarn.social ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Decentralized, self-hosted microblogging ecosystem built on the plain-text twtxt protocol, with no central server or company.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$yarn.social is a decentralized, self-hosted microblogging ecosystem built on the plain-text twtxt protocol, with no central server or company.$q$,
  og_description = $q$yarn.social is a decentralized, self-hosted microblogging ecosystem built on the plain-text twtxt protocol, with no central server or company.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '656d2c55-b8db-44a2-823d-f15eac0f5ffb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '656d2c55-b8db-44a2-823d-f15eac0f5ffb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Plain-text feeds$q$, $q$Posts live in a simple twtxt.txt file that can be hosted on any web server you control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$yarnd pod server$q$, $q$Self-hosted, Docker-deployable server for running a multi-user Yarn.social community pod.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$twtd single-user server$q$, $q$Lightweight server for publishing a single personal twtxt feed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Federation bridges$q$, $q$Interoperates with ActivityPub-based fediverse apps and RSS/Atom feeds.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Feed discovery$q$, $q$Search and crawler tooling for finding and following feeds across independently run pods.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$No central company or server — content lives in plain text you control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Fully open source under AGPLv3$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Lightweight protocol that's easy to inspect and self-host$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Bridges to the wider fediverse and RSS/Atom$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Requires self-hosting to participate fully$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Much smaller community than mainstream social networks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Plain-text protocol has fewer built-in features than full social platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Do I need to sign up for a Yarn.social account?$q$, $q$No. There is no central Yarn.social service to sign up for — you either self-host your own feed/pod or join an independently run pod such as twtxt.net.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$What is twtxt?$q$, $q$twtxt is the minimal, plain-text protocol behind Yarn.social: each post is one line in a text file containing a timestamp and a message.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Is Yarn.social free?$q$, $q$Yes, the software is free and open source (AGPLv3); the project accepts optional donations via OpenCollective.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Self-hosted microblog$q$, $q$Publish short posts from a personal twtxt feed hosted on your own web server.$q$, $q$Individuals who want to own their posts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$Community pod$q$, $q$Run a yarnd server as a shared community pod for multiple users.$q$, $q$Small communities and self-hosting groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Yarn.social is a decentralized ecosystem for social micro-blogging built around the twtxt specification — a minimal plain-text format where each post is a single line containing a timestamp and a message, stored in a `twtxt.txt` file hosted wherever the author chooses.$q$, $q$There is no central Yarn.social server to sign up for. Instead, the project provides open-source software — including twtd (a single-user feed server) and yarnd (a multi-user 'pod' server) — that anyone can self-host to publish and follow feeds.$q$, $q$The ecosystem also bridges to other formats, including ActivityPub-based fediverse platforms and RSS/Atom feeds, and includes a search/crawler tool for discovering feeds across the network. It is created and maintained by James Mills (prologic), operator of the twtxt.net pod.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Yarn.social suits people who want to own their social posts as plain text on infrastructure they control, and developers or communities interested in a lightweight, decentralized alternative to mainstream microblogging platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('656d2c55-b8db-44a2-823d-f15eac0f5ffb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Janus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted WebRTC gateway server from Meetecho for building custom real-time audio, video, and data applications.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Janus is a free, open-source, self-hosted WebRTC gateway from Meetecho used to build custom video, audio, and SIP communication applications.$q$,
  og_description = $q$Janus is a free, open-source, self-hosted WebRTC gateway from Meetecho used to build custom video, audio, and SIP communication applications.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fabd1ffb-a233-4c33-bb07-50f94bcfa2d0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Plugin architecture$q$, $q$Core gateway stays lightweight; functionality such as video rooms, recording, or SIP is added via server-side plugins.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$VideoRoom plugin$q$, $q$Multi-party audio/video conference bridge plugin, one of the most widely used Janus plugins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$SIP gateway plugin$q$, $q$Bridges WebRTC clients to SIP-based telephony infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Recording and streaming$q$, $q$Plugins for recording sessions and streaming pre-recorded or live media.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Lightweight C core$q$, $q$Designed to run efficiently from cloud servers down to small embedded devices.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Free, open-source, and self-hosted with no per-user licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Highly modular plugin system keeps deployments lean$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Scales from small embedded setups to large cloud deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Actively maintained by Meetecho, its original developers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Not a turnkey end-user product — requires development work to build an application on top$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Operating and scaling a production WebRTC server requires networking/ops expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Documentation assumes familiarity with WebRTC concepts$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Is Janus a video conferencing app I can use directly?$q$, $q$Not by itself. Janus is a WebRTC server/toolkit — developers use its plugins (such as VideoRoom) as building blocks for their own conferencing or streaming applications.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Is Janus free?$q$, $q$Yes, Janus is free, open-source software that you self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Who maintains Janus?$q$, $q$Janus is developed and maintained by Meetecho, the organization that originally created it.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$Custom video conferencing backend$q$, $q$Use the VideoRoom plugin as the media server for a custom-built conferencing product.$q$, $q$Developers building WebRTC applications$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$WebRTC-to-SIP bridging$q$, $q$Connect browser-based WebRTC clients to existing SIP telephony systems.$q$, $q$Telecom and unified communications teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Janus (Janus Gateway) is a general-purpose, open-source WebRTC server developed by Meetecho, written in C for a lightweight footprint. Rather than shipping as a finished conferencing app, it acts as middleware that relays RTP/RTCP media and JSON signaling between browsers and server-side logic.$q$, $q$Its architecture is plugin-based: Janus itself is protocol-agnostic, and specific capabilities — such as echo tests, conference bridges (videoroom), media recording/streaming, and SIP gateways — are provided by loadable server-side plugins, so deployments only include the functionality they need.$q$, $q$Because it is self-hosted and highly modular, Janus is commonly used as a building block for custom video conferencing, streaming, and real-time communication products rather than as an out-of-the-box end-user application.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Janus is aimed at developers and organizations that need to build custom WebRTC-based communication features — video conferencing, streaming, or SIP integration — on infrastructure they control, rather than end users looking for a ready-made meeting app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fabd1ffb-a233-4c33-bb07-50f94bcfa2d0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── MiroTalk C2C ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted, end-to-end encrypted peer-to-peer video calling app for 1-to-1 'cam-to-cam' calls, embeddable via iframe.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MiroTalk C2C is a free, open-source, self-hosted peer-to-peer video calling app for encrypted 1-to-1 cam-to-cam calls, embeddable via iframe.$q$,
  og_description = $q$MiroTalk C2C is a free, open-source, self-hosted peer-to-peer video calling app for encrypted 1-to-1 cam-to-cam calls, embeddable via iframe.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '71c7930e-f978-4543-907b-1d45df9c86d7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '71c7930e-f978-4543-907b-1d45df9c86d7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Two-participant rooms$q$, $q$Each room is strictly limited to two people, designed for focused 1-to-1 calls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$End-to-end encryption$q$, $q$Peer-to-peer WebRTC calls with end-to-end encryption between the two participants.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Screen sharing$q$, $q$Share your screen alongside camera video during a call.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Iframe embedding$q$, $q$Drop the calling widget into any website via a simple iframe.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Self-hosted deployment$q$, $q$Deployable via Node.js or Docker/docker-compose on your own server.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Free and open source (AGPLv3), self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$No account or download required for participants$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Simple, focused use case (1-to-1 calls) with minimal setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Easy to embed into an existing website$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Hard two-participant limit, unlike other MiroTalk products$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Peer-to-peer architecture depends on both users' network conditions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Requires self-hosting and server maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$How many people can join a MiroTalk C2C call?$q$, $q$MiroTalk C2C rooms are limited to exactly two participants; it is designed specifically for 1-to-1 calls.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Is MiroTalk C2C free?$q$, $q$Yes, it is free and open source under AGPLv3. A commercial license is also available for closed-source/commercial use via CodeCanyon.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Can I embed MiroTalk C2C on my website?$q$, $q$Yes, it can be embedded into any website using a simple iframe.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$1:1 support or consultation calls$q$, $q$Embed a private, two-person video call directly into a support or booking page.$q$, $q$Support teams and consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$Private personal calls$q$, $q$Self-host a simple, encrypted video call room for two people without third-party services.$q$, $q$Privacy-focused individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MiroTalk C2C ('cam-to-cam') is a self-hosted, open-source WebRTC video calling app built by Miroslav Pejic for one-to-one real-time communication. Unlike the broader MiroTalk conferencing products, each C2C room is limited to exactly two participants, which is used as a security and simplicity measure.$q$, $q$Calls are peer-to-peer and end-to-end encrypted, with screen sharing supported alongside camera video. The app requires only a room name to join and can be embedded into any website with a simple iframe.$q$, $q$It is part of the wider MiroTalk suite (which also includes P2P, SFU, and other products) and is released under the AGPLv3 license, with a commercial license also available for closed-source use via CodeCanyon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MiroTalk C2C fits use cases that need a simple, private, two-person video call embedded into a site or app — such as 1:1 support calls, interviews, or telehealth-style consultations — run on self-hosted infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('71c7930e-f978-4543-907b-1d45df9c86d7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MiroTalk P2P ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted peer-to-peer video conferencing app with screen sharing, chat, whiteboard, and recording.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MiroTalk P2P is a free, open-source, self-hosted peer-to-peer video conferencing app with screen sharing, whiteboard, recording, and a REST API.$q$,
  og_description = $q$MiroTalk P2P is a free, open-source, self-hosted peer-to-peer video conferencing app with screen sharing, whiteboard, recording, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0650c50c-6e38-47ff-9b1c-ad5c7004e35a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0650c50c-6e38-47ff-9b1c-ad5c7004e35a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Peer-to-peer calling$q$, $q$Media streams flow directly between participants for low latency and no central media server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Screen and webcam sharing$q$, $q$Share your screen or webcam at up to 8K resolution and 60fps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Interactive whiteboard$q$, $q$Built-in collaborative whiteboard for drawing and explaining ideas during a call.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Meeting recording$q$, $q$Record screen, webcam, and audio directly from the browser.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$REST API$q$, $q$API access for integrating room creation and management into other applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$AI chat assistant$q$, $q$Built-in ChatGPT-based assistant available during calls.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Free and open source (AGPLv3), fully self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$No login or download required to join a call$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Low-latency peer-to-peer architecture for small groups$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Feature-rich for a free tool: whiteboard, recording, chat, file sharing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Peer-to-peer architecture scales poorly for larger group calls (unlike SFU-based tools)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Call quality depends on each participant's own network and device$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Requires self-hosting and server maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Is MiroTalk P2P free?$q$, $q$Yes, it is free and open source under AGPLv3, with an optional commercial license available via CodeCanyon for closed-source use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$How is MiroTalk P2P different from MiroTalk SFU?$q$, $q$MiroTalk P2P connects participants directly to each other (peer-to-peer), which suits smaller calls, while MiroTalk SFU routes media through a Selective Forwarding Unit server, which scales better to larger meetings.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Do participants need to create an account?$q$, $q$No, MiroTalk P2P can be joined directly in a browser without a login or download.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Small-team video calls$q$, $q$Host quick, private calls for small groups without a third-party conferencing service.$q$, $q$Small teams and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$Embedded calling widget$q$, $q$Use the REST API to integrate MiroTalk P2P calling into another application or website.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MiroTalk P2P is a free, open-source, browser-based video conferencing app built on peer-to-peer WebRTC architecture, requiring no download, plugin, or login to join a call.$q$, $q$Because media flows directly between participants rather than through a media server, MiroTalk P2P is aimed at smaller calls where it can offer low latency and high video quality (up to 8K/60fps) with end-to-end encryption. It includes public and private chat, an interactive whiteboard, meeting recording, and file sharing over DTLS-encrypted transfer.$q$, $q$It is released under the AGPLv3 license and is self-hosted via Node.js or Docker; a commercial license is also available through CodeCanyon for closed-source use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MiroTalk P2P suits small teams or individuals who want a free, self-hosted, privacy-focused video calling tool for small-group calls without relying on a third-party SaaS provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0650c50c-6e38-47ff-9b1c-ad5c7004e35a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── MiroTalk SFU ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted video conferencing platform built on a Mediasoup SFU for scalable group calls with recording and streaming.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MiroTalk SFU is a free, open-source, self-hosted video conferencing platform built on Mediasoup for scalable group calls with recording and streaming.$q$,
  og_description = $q$MiroTalk SFU is a free, open-source, self-hosted video conferencing platform built on Mediasoup for scalable group calls with recording and streaming.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b7e3dfde-b66e-49af-b87b-8a41ddca3f88' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Mediasoup SFU architecture$q$, $q$Routes media through a Selective Forwarding Unit server, allowing larger group calls than peer-to-peer connections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$RTMP streaming$q$, $q$Stream meetings out to RTMP-compatible platforms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Virtual backgrounds and AI avatars$q$, $q$Apply virtual backgrounds or AI-generated avatars during calls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Recording and whiteboard$q$, $q$Record meetings and collaborate on a built-in shared whiteboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$REST API$q$, $q$Programmatic access for creating and managing rooms from other applications.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Free and open source (AGPLv3), fully self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$SFU architecture scales to larger group calls than peer-to-peer tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Unlimited rooms/users and no call-time limits when self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Rich feature set including streaming, recording, and whiteboard$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Requires more server resources than the peer-to-peer MiroTalk product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Self-hosting and scaling the SFU requires ops expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$AI features depend on external services (e.g. ChatGPT) being configured$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Is MiroTalk SFU free?$q$, $q$Yes, it is free and open source under AGPLv3, with unlimited rooms and users when self-hosted; a commercial license is also available via CodeCanyon.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$How is MiroTalk SFU different from MiroTalk P2P?$q$, $q$MiroTalk SFU routes media through a Mediasoup Selective Forwarding Unit server, which scales to larger group calls, whereas MiroTalk P2P connects participants directly to each other and suits smaller calls.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Does MiroTalk SFU support streaming?$q$, $q$Yes, it supports RTMP streaming of meetings to external platforms.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Self-hosted group video conferencing$q$, $q$Replace a commercial conferencing SaaS with a self-hosted SFU-based alternative for team meetings.$q$, $q$Organizations wanting data control$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$Live streamed events$q$, $q$Stream a meeting or webinar out via RTMP to other platforms.$q$, $q$Event hosts and educators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MiroTalk SFU is a free, open-source, browser-based video conferencing platform that uses Mediasoup as its Selective Forwarding Unit (SFU), allowing it to scale to larger group meetings than the peer-to-peer MiroTalk product.$q$, $q$It supports up to 8K/60fps video, screen sharing, echo-cancelled audio, chat, meeting recording, a collaborative whiteboard, file sharing, RTMP streaming, and virtual backgrounds, and offers optional ChatGPT integration and AI avatars. Media streams are encrypted with SRTP.$q$, $q$Like the rest of the MiroTalk suite, it is released under AGPLv3 for self-hosting, with a commercial license available via CodeCanyon, and exposes a REST API for building integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MiroTalk SFU suits organizations that need self-hosted group video conferencing at larger scale than a pure peer-to-peer tool can support, including teams that want streaming or recording built in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7e3dfde-b66e-49af-b87b-8a41ddca3f88', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── plugNmeet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted WebRTC conferencing platform built on LiveKit and NATS, with recording, streaming, and AI meeting tools.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$plugNmeet is an open-source, self-hosted WebRTC conferencing platform built on LiveKit and NATS with recording, streaming, and AI meeting tools.$q$,
  og_description = $q$plugNmeet is an open-source, self-hosted WebRTC conferencing platform built on LiveKit and NATS with recording, streaming, and AI meeting tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6bb04494-9b4c-4959-9345-35cb07ffe59d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6bb04494-9b4c-4959-9345-35cb07ffe59d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$LiveKit/NATS backend$q$, $q$Built in Go on LiveKit and NATS, deployed as a single binary designed for horizontal scaling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$HD recording and streaming$q$, $q$Record meetings in HD and stream out via RTMP or WHIP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Collaboration tools$q$, $q$Built-in whiteboard and shared notepad for real-time collaboration during meetings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$AI Meeting Agent$q$, $q$Optional AI features for live translation, transcription, and meeting summaries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$End-to-end encryption$q$, $q$Encrypts meeting media for privacy.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Free, open source, and self-hostable on-premise$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Designed to be embedded/customized into other products$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Built for horizontal scaling as a single Go binary$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Includes AI transcription/translation and summary tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Requires self-hosting and infrastructure management (Go, LiveKit, NATS)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$AI meeting features likely require additional configuration/external services$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Smaller community than mainstream conferencing platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Is plugNmeet free?$q$, $q$Yes, plugNmeet is open-source software that you self-host on your own infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$What is plugNmeet built on?$q$, $q$Its backend is written in Go and uses LiveKit and NATS, deploying as a single binary designed for horizontal scaling.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Can plugNmeet transcribe or summarize meetings?$q$, $q$Yes, its AI Meeting Agent feature can provide live translation, transcription, and meeting summaries.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$Embedded conferencing$q$, $q$Integrate self-hosted video conferencing directly into an existing website or application.$q$, $q$Product and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$On-premise meetings$q$, $q$Run video meetings entirely on infrastructure the organization controls.$q$, $q$Organizations with data-control requirements$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$plugNmeet is an open-source, self-hosted WebRTC conferencing platform maintained by Mynaparrot, built to be embedded into websites and applications rather than used only as a standalone app. Its backend is written in Go and runs on LiveKit and NATS, deploying as a single binary designed for horizontal scaling.$q$, $q$It offers HD recording, RTMP/WHIP streaming, real-time collaboration tools such as whiteboards and shared notepads, end-to-end encryption, and adaptive quality for varying network conditions. A newer 'AI Meeting Agent' feature adds live translation, transcription, and meeting summaries.$q$, $q$Because it is self-hosted and on-premise, plugNmeet is positioned as an alternative to third-party conferencing SaaS for organizations that want to keep meeting data under their own control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$plugNmeet suits businesses and platforms that want to embed customizable, self-hosted video conferencing directly into their own product, and organizations that need on-premise control over meeting data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bb04494-9b4c-4959-9345-35cb07ffe59d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── ejabberd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted XMPP server, MQTT broker, and SIP service from ProcessOne, built for large-scale real-time messaging.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2002,
  company_size = $q$11-50 employees$q$,
  headquarters = $q$Paris, France$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ejabberd is an open-source, self-hosted XMPP server, MQTT broker, and SIP service from ProcessOne, free as Community Server or paid as Business Edition.$q$,
  og_description = $q$ejabberd is an open-source, self-hosted XMPP server, MQTT broker, and SIP service from ProcessOne, free as Community Server or paid as Business Edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7060eb6f-8b75-4dcd-b7ed-90b63b5d8986' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$XMPP server$q$, $q$Full-featured XMPP server supporting over 400 protocol extensions including group chat, message archiving, and push notifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$MQTT broker$q$, $q$Built-in MQTT support for IoT device messaging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$SIP/WebRTC service$q$, $q$Voice and video signaling support alongside messaging.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Matrix federation$q$, $q$Federates with Matrix-based messaging networks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Clustering and scalability$q$, $q$Supports clustering for fault tolerance and massive concurrent connection counts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$REST API and admin tools$q$, $q$REST APIs, a web admin interface, and command-line tools for management.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Free, open-source Community Server (GPLv2) with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Extremely mature project with over two decades of development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Proven at very large scale in production$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Broad protocol support: XMPP, MQTT, SIP/WebRTC, Matrix$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Business Edition and Fluux hosted plans are priced for enterprise budgets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Erlang-based stack has a smaller talent pool than more common languages$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Advanced clustering/scaling setups require Erlang/OTP operational knowledge$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Is ejabberd free?$q$, $q$The ejabberd Community Server is free and open source under GPLv2. ProcessOne also offers a paid Business Edition and a Fluux managed hosting option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$What protocols does ejabberd support?$q$, $q$ejabberd supports XMPP (with over 400 extensions), MQTT, SIP/WebRTC, and Matrix federation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$How well does ejabberd scale?$q$, $q$ProcessOne states ejabberd has handled over 2 million concurrent sessions on a single node in production deployments, with clustering for further scale.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Who makes ejabberd?$q$, $q$ejabberd is developed by ProcessOne, a Paris-based messaging infrastructure company that has maintained it since 2002.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Chat application backend$q$, $q$Power the messaging backend for a chat app using XMPP with self-hosted infrastructure.$q$, $q$App developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$IoT device messaging$q$, $q$Use the built-in MQTT broker to handle messaging between IoT devices.$q$, $q$IoT platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Enterprise messaging at scale$q$, $q$Run large-scale, clustered real-time messaging infrastructure with LTS support via the Business Edition.$q$, $q$Enterprises with mission-critical messaging needs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Community Server$q$, $q$Free$q$, $q$N/A$q$, $q$["Open-source GPLv2 core","XMPP, MQTT, SIP/WebRTC support","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Business Edition$q$, $q$From €16,000/year$q$, $q$annual$q$, $q$["2-node cluster license","LTS support","Enterprise modules"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$Fluux (managed hosting)$q$, $q$From €200/month$q$, $q$monthly$q$, $q$["Managed SaaS hosting of ejabberd"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ejabberd is an open-source messaging platform built in Erlang by ProcessOne, functioning as an XMPP server, MQTT broker, and SIP/WebRTC service for real-time communication. It has been developed by ProcessOne since 2002.$q$, $q$It supports over 400 XMPP extensions (including MUC group chat, MAM message archiving, PubSub, message carbons, push notifications, and OMEMO encryption), along with MQTT for IoT use cases, SIP/WebRTC for voice and video, and Matrix federation. Built-in clustering, REST APIs, web administration, and command-line tools are included.$q$, $q$The Community Server is free and open source under GPLv2. ProcessOne also offers a paid Business Edition with LTS support and enterprise modules, and Fluux, a managed SaaS hosting option. ejabberd is used at large scale by organizations including WhatsApp (in its early infrastructure) and others.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ejabberd suits organizations that need a robust, self-hosted messaging backend — for chat apps, IoT device messaging, or SIP/WebRTC voice and video — at scales ranging from small deployments to millions of concurrent connections.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7060eb6f-8b75-4dcd-b7ed-90b63b5d8986', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── MongooseIM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted, Erlang-based XMPP messaging server from Erlang Solutions built for scalable instant messaging.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MongooseIM is a free, open-source, self-hosted XMPP messaging server from Erlang Solutions, built for scalable, multi-protocol instant messaging.$q$,
  og_description = $q$MongooseIM is a free, open-source, self-hosted XMPP messaging server from Erlang Solutions, built for scalable, multi-protocol instant messaging.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c477791e-4aea-459c-b6d0-e2247ad6316f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c477791e-4aea-459c-b6d0-e2247ad6316f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$XMPP server core$q$, $q$Full XMPP protocol support as the primary messaging backbone.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Multi-protocol interfaces$q$, $q$Additional REST, MQTT, and AMQP interfaces alongside XMPP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$GraphQL admin API$q$, $q$Administer and manage the server via a GraphQL API, configured through TOML files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Push notifications$q$, $q$Mobile push notification support via the companion MongoosePush service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Horizontal and vertical scaling$q$, $q$Designed to scale across distributed data centers to support millions of concurrent users.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Free and open source, self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Built by Erlang Solutions, an established Erlang/OTP specialist company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Supports multiple protocols (XMPP, REST, MQTT, AMQP) beyond raw XMPP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Designed for large-scale, distributed deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Erlang-based stack has a smaller developer talent pool than more mainstream languages$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$No published self-serve pricing for professional support/consulting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Requires self-hosting and operational expertise to run at scale$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Is MongooseIM free?$q$, $q$Yes, MongooseIM is a free and open-source product that you self-host on your own infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Who develops MongooseIM?$q$, $q$MongooseIM is developed and maintained by Erlang Solutions, a London-based Erlang/OTP consultancy founded in 1999.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$What protocols does MongooseIM support?$q$, $q$MongooseIM is primarily an XMPP server, and also exposes REST, MQTT, and AMQP interfaces, plus a GraphQL admin API.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Large-scale messaging backend$q$, $q$Run a horizontally scaled XMPP messaging backend for a chat product with many concurrent users.$q$, $q$Engineering teams at scale-focused companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$Regulated-industry messaging$q$, $q$Self-host messaging infrastructure to meet data-control and GDPR requirements in healthcare or fintech.$q$, $q$Healthcare and fintech organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MongooseIM is a free, open-source instant messaging server built on Erlang by Erlang Solutions, a London-headquartered company founded in 1999 that also offers Erlang/OTP consulting and support services.$q$, $q$It functions primarily as an XMPP server, additionally exposing REST, MQTT, and AMQP interfaces, with a GraphQL admin API and TOML-based configuration. Features include end-to-end encryption support, group chat, delivery confirmations, push notifications via the companion MongoosePush service, and video/voice signaling coordination.$q$, $q$MongooseIM is designed for horizontal and vertical scaling across distributed data centers, and Erlang Solutions markets it toward organizations needing to support large numbers of concurrent connections, including in healthcare and fintech settings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MongooseIM suits engineering teams that need a self-hosted, horizontally scalable XMPP-based messaging backend, particularly in regulated industries like healthcare and fintech where data control and GDPR compliance matter.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c477791e-4aea-459c-b6d0-e2247ad6316f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Openfire ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted XMPP/Jabber server with a web-based admin console, REST API plugin, and clustering support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Openfire is a free, open-source, self-hosted XMPP server with a web admin console, REST API plugin, and plugin ecosystem.$q$,
  og_description = $q$Openfire is a free, open-source, self-hosted XMPP server with a web admin console, REST API plugin, and plugin ecosystem.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '46b963c1-7eca-4b94-ade9-a168bc61594e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '46b963c1-7eca-4b94-ade9-a168bc61594e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$XMPP-standard messaging$q$, $q$Implements the open XMPP protocol for instant messaging, presence, and multi-user chat rooms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Web-based admin console$q$, $q$Configure users, groups, chat rooms, and server settings through a browser interface, without editing config files directly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$REST API plugin$q$, $q$An official plugin exposes a RESTful API (JSON or XML) for managing users, groups, rosters, and chat rooms from external applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Plugin ecosystem$q$, $q$Extend the server with community and Ignite Realtime plugins covering monitoring, clustering, gateways, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Multi-database support$q$, $q$Works with MySQL, PostgreSQL, MariaDB, Firebird, and CockroachDB as the storage backend.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Security hardening$q$, $q$Includes SASL channel binding, TLS/certificate management, and other protocol-level security options.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Mature project with roots going back over two decades$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Free and fully self-hosted — no per-user licensing cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Web admin console makes day-to-day management accessible without CLI work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Extensible via an official plugin catalog and REST API$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Requires the operator to handle their own hosting, updates, and TLS certificates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$XMPP client apps (for end users) must be installed separately from the server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Community-maintained, so support depends on forums rather than a paid SLA by default$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Is Openfire free to use?$q$, $q$Yes. Openfire is licensed under the Apache License 2.0 and is free to download, run, and modify.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$What operating systems does Openfire run on?$q$, $q$Openfire runs on Windows, Linux, Unix, and Mac OS X.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Does Openfire have an API?$q$, $q$Yes. Ignite Realtime publishes an official REST API plugin that lets other systems manage users, groups, and chat rooms over HTTP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$What chat clients work with Openfire?$q$, $q$Any standards-compliant XMPP client can connect to Openfire, including Converse.js for web-based chat.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Internal team messaging$q$, $q$Run a private, self-hosted instant messaging service for an organization instead of relying on a third-party chat provider.$q$, $q$IT and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$Custom messaging integrations$q$, $q$Use the REST API plugin to provision users and manage chat rooms programmatically from internal tools.$q$, $q$Developers building internal apps$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Openfire is a real-time collaboration server that implements the XMPP (Extensible Messaging and Presence Protocol) standard, released under the Apache License 2.0. The project began in 2002 as Jive Messenger, was renamed Wildfire in 2005, and became Openfire in 2007 after Jive Software handed it to the community; it is now maintained by the Ignite Realtime Foundation.$q$, $q$Administrators install Openfire on their own Windows, Linux, Unix, or Mac OS X servers and manage it through a browser-based admin console. It supports MySQL, PostgreSQL, MariaDB, Firebird, and CockroachCB as backing databases, and its functionality can be extended through an official plugin catalog, including a REST API plugin for programmatic administration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Openfire suits IT teams and developers who need an internal, self-hosted messaging and presence server — for example, organizations that want group chat, one-to-one messaging, and multi-user chat rooms without routing traffic through a third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('46b963c1-7eca-4b94-ade9-a168bc61594e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Prosody IM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, open-source XMPP server designed for easy setup, low resource use, and Lua-based module extensibility.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Prosody IM is a free, open-source, self-hosted XMPP server known for easy setup, low resource use, and modular Lua extensibility.$q$,
  og_description = $q$Prosody IM is a free, open-source, self-hosted XMPP server known for easy setup, low resource use, and modular Lua extensibility.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd57f5a1-59c8-4b23-bc86-a81e777d5f57' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Standard XMPP server$q$, $q$Implements core XMPP messaging, presence, and multi-user chat over the open Jabber/XMPP protocol.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Server-to-server federation$q$, $q$Connects with other Prosody installations and any XMPP-compatible service for cross-server messaging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Module system$q$, $q$A modular architecture written in Lua lets developers add or customize functionality and prototype new XEP extensions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Low resource footprint$q$, $q$Designed to run efficiently on modest hardware, making it viable for small self-hosted deployments.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Simple to install and configure compared to some other XMPP server implementations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$MIT-licensed and completely free to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Powers production services like Jitsi Meet and Snikket, showing real-world scale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Modular Lua codebase is approachable for writing custom extensions$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Windows support is deprecated; it's best run on Linux/BSD systems$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Requires comfort with server administration and config files$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$No official hosted/managed version — self-hosting is the only option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Is Prosody free?$q$, $q$Yes, Prosody is open-source software under the MIT License with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$What platforms does Prosody support?$q$, $q$Prosody runs on Linux, macOS, FreeBSD, OpenBSD, and NetBSD. Windows support is deprecated.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Can Prosody talk to other XMPP servers?$q$, $q$Yes, it supports server-to-server federation, allowing users on different Prosody or XMPP servers to message each other.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Personal or family messaging server$q$, $q$Run a small, private XMPP server for a household or group of friends who want an alternative to centralized chat apps.$q$, $q$Privacy-conscious individuals and small groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$Backend for other products$q$, $q$Use Prosody as the underlying messaging server for a larger product, as Jitsi Meet and Snikket do.$q$, $q$Developers building messaging or video products$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Prosody is a modern XMPP communication server started by Matthew Wild in August 2008, with its first public release in December 2008. It is released under the MIT License and written in Lua, which keeps its codebase compact and makes it straightforward to write custom modules.$q$, $q$Prosody is designed to be simple to install and configure while still supporting server-to-server federation with other XMPP-compatible services. It powers, or forms part of the backend for, several well-known projects, including Jitsi Meet and Snikket.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Prosody fits sysadmins and developers who want a lean, self-hosted XMPP server for personal, family, or organizational messaging, or as a federation-capable backend component for another product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd57f5a1-59c8-4b23-bc86-a81e777d5f57', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Snikket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, privacy-focused group messaging built on XMPP, with dedicated iOS and Android apps and no ads or tracking.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free (self-hosted)$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Snikket is a free, open-source, self-hosted XMPP messaging platform with native iOS and Android apps and no ads or tracking.$q$,
  og_description = $q$Snikket is a free, open-source, self-hosted XMPP messaging platform with native iOS and Android apps and no ads or tracking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e600f81d-f148-4525-b8ff-0baa4cd86eab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e600f81d-f148-4525-b8ff-0baa4cd86eab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Group messaging and calling$q$, $q$Supports one-to-one and group chats plus audio/video calling within the mobile apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$"Circles" for organizing contacts$q$, $q$Lets admins group members into circles so people can find and message each other without sharing phone numbers or address books.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Native iOS and Android apps$q$, $q$Dedicated open-source apps for both major mobile platforms, derived from established XMPP clients (Siskin IM and Conversations).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Self-hosted or managed server$q$, $q$Run your own Snikket server for full control, or subscribe to Snikket Hosting for a managed instance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$No ads or data sale$q$, $q$The project states it does not show ads or sell user data on self-hosted or hosted instances.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Purpose-built for non-technical users compared to raw XMPP server setup$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Native mobile apps for both iOS and Android$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Federated design avoids lock-in to a single company's servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Self-hosting remains free and fully open source$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$iOS app is currently English-only, unlike the more widely translated Android app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Managed hosting has no free tier — only a 14-day trial$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Smaller ecosystem and userbase than mainstream chat apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Is Snikket free?$q$, $q$The Snikket server and apps are free, open-source software you can self-host. Snikket Hosting, an optional managed hosting service, is a paid product starting around $6/month depending on region, with a 14-day trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$What apps does Snikket offer?$q$, $q$Snikket provides open-source iOS and Android apps, available through the App Store, Google Play, and F-Droid.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Can Snikket users message people on other servers?$q$, $q$Yes, because Snikket is built on XMPP, users can message people on other Snikket instances or compatible XMPP servers.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Family or friend group chat$q$, $q$Set up a private messaging space for a household or friend group without going through a big tech company.$q$, $q$Families and friend groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Small organization communication$q$, $q$Give a club or small organization its own private messaging network with circles for different topics or teams.$q$, $q$Clubs and small organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full server and app source available","Run on your own hardware or VPS","No user limit set by Snikket"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$Snikket Hosting$q$, $q$From around $6/month (varies by region)$q$, $q$Monthly or annual$q$, $q$["Managed instance for up to 10 active users","14-day trial","No server maintenance required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Snikket is an open-source messaging platform first previewed in early 2020 as a self-hosted alternative to centralized apps like WhatsApp or Telegram. It bundles existing open-source XMPP components — the Prosody server, an Android client based on Conversations, and an iOS client based on Siskin IM — into a package that's easy for a non-expert to run.$q$, $q$Rather than a single company controlling all accounts, Snikket is designed as a federated network: anyone can run their own server (or use a Snikket-hosted instance) while still being able to message people on other Snikket or XMPP servers. In March 2024 the project launched Snikket Hosting, an optional paid managed-hosting service for people who don't want to run their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Snikket targets families, friend groups, clubs, and small organizations that want private group messaging and calling without their data being monetized, whether they self-host or pay for managed hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e600f81d-f148-4525-b8ff-0baa4cd86eab', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Tigase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modular, Java-based XMPP/Jabber server built to scale from small deployments to millions of concurrent users.$q$,
  pricing_model = $q$Free (open source), commercial license available$q$,
  starting_price = $q$Free (AGPLv3)$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = $q$San Francisco, California, US$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tigase is an open-source, Java-based XMPP server built for large-scale, self-hosted messaging deployments, with AGPL and commercial licensing.$q$,
  og_description = $q$Tigase is an open-source, Java-based XMPP server built for large-scale, self-hosted messaging deployments, with AGPL and commercial licensing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '93755188-c1ee-4269-9581-f911c716c21f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '93755188-c1ee-4269-9581-f911c716c21f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Modular Java architecture$q$, $q$A component-based design lets operators enable only the modules they need.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Clustering and load balancing$q$, $q$Supports distributed deployments with near-linear scalability and automatic cluster reconfiguration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Administration tooling$q$, $q$Includes command-line tools, a web UI, and runtime performance metrics for monitoring the server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Small footprint$q$, $q$Core binary under 3MB and capable of running with minimal RAM for lightweight deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Dual licensing$q$, $q$Free under AGPL-3.0, with a commercial license option from Tigase, Inc. for closed-source use.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Designed and tested for very large-scale deployments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Low resource requirements for smaller instances$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Commercial support available through Tigase, Inc. for organizations that need it$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Long track record dating back to 2004$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$AGPL-3.0 licensing requires attention to compliance for SaaS/hosted use cases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Java-based stack may be heavier to operate than lighter alternatives for small hobby deployments$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Commercial pricing is not published and requires contacting Tigase, Inc.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Is Tigase free?$q$, $q$The core Tigase XMPP Server is free and open source under AGPL-3.0. Tigase, Inc. also sells a commercial license for cases where AGPL terms aren't suitable.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$What platforms does Tigase run on?$q$, $q$As a Java application, it runs anywhere a JVM is supported, including on-premises servers and major cloud providers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Does Tigase support clustering?$q$, $q$Yes, it's built for distributed deployments with load balancing and near-linear scalability.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Large-scale messaging infrastructure$q$, $q$Run a self-hosted XMPP backend intended to serve very large numbers of concurrent users.$q$, $q$Enterprises and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$Embedded messaging in a product$q$, $q$License Tigase commercially to embed XMPP messaging in a closed-source product.$q$, $q$Companies building messaging-enabled apps$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tigase XMPP Server is a Java-based, open-source XMPP/Jabber server started by Artur Hefczyc in October 2004. It's released under the AGPL-3.0 license, with Tigase, Inc. also offering a commercial license for organizations that can't use AGPL terms.$q$, $q$The project emphasizes performance and low footprint: its core binary is under 3MB, it can run with as little as 10MB of RAM for basic setups, and the vendor reports deployments handling large volumes of traffic with near-linear scalability across clustered nodes. Being JVM-based, it can be deployed on-premises or on any cloud provider that supports Java.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Tigase suits engineering teams building large-scale or high-uptime messaging infrastructure — from self-hosted community servers up to enterprise deployments needing clustering and detailed runtime metrics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('93755188-c1ee-4269-9581-f911c716c21f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Converse.js ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, browser-based XMPP chat client that can run as a full-page app, embedded widget, or overlay on any site.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Converse.js is a free, open-source, browser-based XMPP chat client that works with any XMPP server and embeds into any website.$q$,
  og_description = $q$Converse.js is a free, open-source, browser-based XMPP chat client that works with any XMPP server and embeds into any website.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b2670c3-5248-4140-a4b2-ade8ee34ed2b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b2670c3-5248-4140-a4b2-ade8ee34ed2b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Multiple deployment modes$q$, $q$Use it as a standalone full-page app, an embeddable widget, or an overlay chat window on an existing site.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$OMEMO end-to-end encryption$q$, $q$Supports OMEMO for encrypted one-to-one and group conversations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Multi-user chatrooms$q$, $q$Supports XMPP MUC group chats alongside direct messaging.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Broad server compatibility$q$, $q$Works with any XMPP server, including Openfire, Prosody, and ejabberd.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Wide translation coverage$q$, $q$Localized into more than 30 languages by the community.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$File sharing$q$, $q$Supports HTTP file upload for sharing images and documents in chat.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$No server-side component required — runs entirely client-side against any XMPP server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Flexible embedding options (widget, overlay, or full app)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$MPLv2 license avoids vendor lock-in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Already integrated into several other open-source projects$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Requires a separate XMPP server (e.g. Prosody or Openfire) to actually send messages$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$End users need some XMPP account/server setup, which is less turnkey than closed SaaS chat widgets$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Official commercial support is provided by a separate consultancy (Opkode), not the core project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Is Converse.js free?$q$, $q$Yes, it's open-source software under the Mozilla Public License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Does Converse.js need its own server?$q$, $q$No, it's a client only — it connects to any existing XMPP server such as Prosody, Openfire, or ejabberd.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Can I embed Converse.js in my website?$q$, $q$Yes, it supports being embedded as a widget or chat overlay, in addition to running as a standalone app.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Add chat to a website$q$, $q$Embed Converse.js as a widget or overlay to give visitors real-time chat backed by an XMPP server.$q$, $q$Web developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$Self-hosted team or community chat UI$q$, $q$Pair Converse.js with a self-hosted XMPP server like Prosody or Openfire for a fully self-hosted messaging stack.$q$, $q$Organizations avoiding third-party chat SaaS$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Converse.js is a client-side XMPP chat application written in JavaScript, created by JC Brand starting in 2012 and released under the Mozilla Public License 2.0 (MPLv2). Because it runs entirely in the browser, it can connect to any standards-compliant XMPP server, including Openfire, Prosody, and ejabberd, without vendor lock-in.$q$, $q$It supports direct messages, group chats (multi-user chatrooms), OMEMO end-to-end encryption, HTTP file upload, message archiving, and translations into more than 30 languages. Converse can be deployed as a full-page web app, embedded as a widget in an existing site, or overlaid as a chat popup, and it has been integrated into projects such as PeerTube, WordPress, and Roundcube.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Converse.js is aimed at developers who need to add real-time chat to a website or product and want a self-hosted, open-source client rather than a proprietary embedded widget.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b2670c3-5248-4140-a4b2-ade8ee34ed2b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Salut à Toi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Decentralized, XMPP-based communication and collaboration suite (now renamed Libervia) with web, desktop, mobile, and CLI clients.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Salut à Toi (now Libervia) is a free, open-source, decentralized XMPP suite for messaging, blogging, calendars, and file sharing.$q$,
  og_description = $q$Salut à Toi (now Libervia) is a free, open-source, decentralized XMPP suite for messaging, blogging, calendars, and file sharing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0da45043-d5e4-43e0-b1d2-e47565c3ce95';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0da45043-d5e4-43e0-b1d2-e47565c3ce95' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$End-to-end encrypted messaging$q$, $q$Supports OMEMO and OpenPGP encryption for one-to-one and group conversations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Multi-user chat and calls$q$, $q$Group chat (MUC) plus one-on-one and multi-participant audio/video calls using peer-to-peer or SFU routing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Pubsub-based blogging and calendars$q$, $q$Publish blog posts and calendar events with RSVP over XMPP Pubsub nodes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Decentralized lists$q$, $q$Shared task lists, tickets, and grocery lists that sync across a user's devices and contacts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$ActivityPub gateway$q$, $q$Bridges XMPP conversations and content with fediverse platforms that speak ActivityPub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Multiple client interfaces$q$, $q$Available as a web app (Libervia Web), desktop client, experimental Android app, CLI, and terminal UI.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Goes well beyond chat into blogging, calendars, and file/task sharing on a single decentralized protocol$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Multiple client types (web, desktop, CLI, TUI) for different workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$AGPL-licensed and self-hostable$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Built-in bridge to the ActivityPub fediverse$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Android support is still experimental and there's no stable iOS app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Smaller community and documentation base than mainstream XMPP clients$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Project rename (Salut à Toi to Libervia) can make it harder to find current resources$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Is Salut à Toi the same as Libervia?$q$, $q$Yes. As of version 0.8, the project itself was renamed Libervia; the nonprofit association behind it retains the name Salut à Toi.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Is it free to use?$q$, $q$Yes, nearly all of the codebase is released under AGPL v3+ and is free to self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Does it only do chat?$q$, $q$No, it also supports Pubsub-based blogging, calendars, photo albums, task/grocery lists, and file sharing on top of XMPP.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Federated personal communication$q$, $q$Use it as a decentralized alternative to mainstream chat and social apps, hosted on your own or a trusted XMPP server.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$Lightweight collaboration$q$, $q$Coordinate shared calendars, task lists, and blogs with a group over XMPP instead of separate SaaS tools.$q$, $q$Small groups and communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Salut à Toi is a decentralized communication and collaboration project built on the XMPP protocol, maintained by a French nonprofit (association loi 1901) led by developer Goffi. As of version 0.8, the software itself was renamed Libervia — the association behind the project keeps the name Salut à Toi, but the project and its interfaces are now branded Libervia.$q$, $q$Most of the codebase is released under AGPL v3+. It goes beyond instant messaging to cover blogging (via Pubsub nodes), calendar events, photo albums, decentralized task lists and grocery lists, and file sharing, with interfaces for the web (Libervia Web), desktop, an experimental Android app, a CLI, and a terminal UI. It also offers an ActivityPub gateway to bridge XMPP conversations with the fediverse.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It suits users and developers who want a federated, self-hostable alternative to mainstream messaging and social platforms, and who need more than chat — such as shared calendars, blogs, or task lists — built on an open protocol they can run themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0da45043-d5e4-43e0-b1d2-e47565c3ce95', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── ACP Admin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source management platform for Community Supported Agriculture groups, covering members, deliveries, and billing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted)$q$,
  founded_year = 2014,
  company_size = $q$Solo/independent maintainer$q$,
  headquarters = $q$Switzerland$q$,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$]::text[],
  seo_meta_description = $q$ACP Admin (CSA Admin) is open-source software for managing Community Supported Agriculture groups: members, deliveries, and invoicing.$q$,
  og_description = $q$ACP Admin (CSA Admin) is open-source software for managing Community Supported Agriculture groups: members, deliveries, and invoicing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Member and waitlist management$q$, $q$Handles member registration, subscription management, and GDPR-compliant waitlists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Delivery scheduling$q$, $q$Supports flexible delivery frequencies and basket content tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Automated invoicing$q$, $q$Generates invoices with QR codes and tracks payments, including EBICS integration for Swiss bank reconciliation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Annual renewal workflows$q$, $q$Simplifies the yearly process of renewing member subscriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Online shop add-on$q$, $q$Sells supplementary products alongside regular baskets, with inventory tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Member communication tools$q$, $q$Customizable email and newsletter tools for keeping members informed.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Purpose-built for CSA/ACP operations rather than generic e-commerce$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Free to self-host under the O'Saasy License$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Managed hosting option removes the need to run infrastructure yourself$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Proven at scale with 140,000+ baskets managed annually across multiple organizations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Managed hosting pricing is usage-based (percentage of invoiced amount), which can be harder to budget than a flat fee$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$The O'Saasy License restricts reselling it as a competing hosted service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Maintained largely by a single developer rather than a company or large team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Is ACP Admin free?$q$, $q$Self-hosting the software is free under the O'Saasy License. The maintainer's managed hosting service charges 1% of the amount invoiced through the platform per year, capped at 2,400 CHF/EUR, with no setup fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$What is the difference between ACP Admin and CSA Admin?$q$, $q$They are the same software; "ACP" is the French term used in French-speaking regions, while "CSA" is the English term for Community Supported Agriculture.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Can I self-host ACP Admin?$q$, $q$Yes, the O'Saasy License explicitly permits free self-hosting; the maintainer's managed hosting is an optional paid alternative.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Running a CSA/ACP subscription program$q$, $q$Manage member subscriptions, delivery schedules, and basket invoicing for a produce cooperative.$q$, $q$CSA/ACP organizers and cooperatives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Multi-organization farm networks$q$, $q$Coordinate several affiliated CSA groups on shared or self-hosted infrastructure.$q$, $q$Regional food networks$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code available on GitHub","No usage cap","Requires own hosting and maintenance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Managed hosting$q$, $q$1% of amount invoiced per year, capped at 2,400 CHF/EUR$q$, $q$Annual$q$, $q$["GDPR/nLPD-compliant hosting","Security updates and backups included","No setup fees"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ACP Admin — also published under the name CSA Admin, since "ACP" (Agriculture Contractuelle de Proximité) is the French-language term for Community Supported Agriculture (CSA) — is a web application originally built by developer Thibaud Guillaume-Gentil to manage Rage de Vert, a CSA group in Neuchâtel, Switzerland. It has been used by organizations since 2014 and now serves more than 30 organizations across Switzerland, Germany, and the Netherlands, managing over 140,000 basket deliveries a year.$q$, $q$The source is released under the O'Saasy License, which permits free self-hosting for any purpose but reserves the right to resell the software as a competing hosted service to the original author. The maintainer also offers a managed hosting option with GDPR/nLPD-compliant infrastructure, backups, and updates included.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's built for CSA/ACP organizers — associations, cooperatives, or small businesses running subscription-based produce delivery — who need to manage members, waitlists, delivery schedules, invoicing, and a supplementary online shop in one system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── FoodCoopShop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source ordering and billing platform for food cooperatives, organic shops, and farm stores.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2014,
  company_size = $q$Solo/independent maintainer$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$FoodCoopShop is free, open-source software for food cooperatives and farm shops to manage collective ordering and producer billing.$q$,
  og_description = $q$FoodCoopShop is free, open-source software for food cooperatives and farm shops to manage collective ordering and producer billing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '640f5401-b849-4bad-b457-90e05c828c55';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '640f5401-b849-4bad-b457-90e05c828c55' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Collective ordering$q$, $q$Members place orders from a shared catalog sourced from multiple producers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Producer login area$q$, $q$Gives producers direct access to manage their own products and availability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Flexible delivery schedules$q$, $q$Supports different delivery/pickup schedules per cooperative.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Credit/balance billing$q$, $q$Automates member billing through a running credit and balance system rather than per-order invoicing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Docker-based dev environment$q$, $q$Ships with Docker tooling to simplify setting up a local development or self-hosted instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Free, open-source, and self-hostable under CakePHP/MySQL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Purpose-built for the specific workflow of food co-ops with multiple producers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Producer-facing login reduces manual coordination work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Active maintenance with at least one release per year$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Primarily documented and used in German-speaking markets, though English is supported$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Self-hosting requires PHP/MySQL server administration skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Maintained mainly by its original developer rather than a large team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Is FoodCoopShop free?$q$, $q$Yes, it's free and open source. Paid support and hosting services are available separately from the creator.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$What is FoodCoopShop built with?$q$, $q$It's built on CakePHP and MySQL, with Docker support for setting up a development environment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Who is FoodCoopShop for?$q$, $q$Food cooperatives, organic shops (Bioläden), and farm stores (Hofläden) that need collective ordering and producer coordination.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Cooperative food ordering$q$, $q$Run a shared online ordering system for a food cooperative sourcing from multiple local producers.$q$, $q$Food cooperative organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$Farm/organic shop management$q$, $q$Give a farm shop or organic store an online ordering and billing system tailored to direct-marketing sales.$q$, $q$Farm shops and organic retailers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FoodCoopShop is an open-source web application, started by developer Mario Rothauer in 2014, for managing regional food orders from direct marketers. It's built on CakePHP and MySQL and is free to download and self-host, with Docker support for local development.$q$, $q$The software gives producers a dedicated login to manage their own product listings while giving cooperative members a shared ordering interface with support for different delivery schedules and an automated credit/balance billing system. According to the project's own site, over 50 initiatives are currently using it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's aimed at food cooperatives, organic stores (Bioläden), and farm shops (Hofläden) — mainly in German-speaking regions — that need collective ordering and producer coordination without building custom software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640f5401-b849-4bad-b457-90e05c828c55', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Foodsoft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source web app for running a non-profit food cooperative: product catalog, ordering, accounting, and job scheduling.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Foodsoft is free, open-source software for running a non-profit food cooperative: catalog, ordering, accounting, and job scheduling.$q$,
  og_description = $q$Foodsoft is free, open-source software for running a non-profit food cooperative: catalog, ordering, accounting, and job scheduling.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1807f881-55e3-4c8e-81e1-3548278fad9e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1807f881-55e3-4c8e-81e1-3548278fad9e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Shared product catalog$q$, $q$Maintains a coop-wide catalog of products sourced from chosen suppliers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Online member ordering$q$, $q$Members place and track their own orders through the web app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Coop accounting$q$, $q$Tracks member balances and coop-level accounting tied to orders.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Volunteer job scheduling$q$, $q$Coordinates the shifts and tasks members take on as part of running the coop.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Self-hosted or hosted deployment$q$, $q$Can be run on your own infrastructure or through third-party Foodsoft Hosting providers.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Free and open source, purpose-built for non-profit food coop operations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Covers ordering, accounting, and job scheduling in one system rather than several tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Long-running project with an established community of food coops using it$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Hosting options exist for coops that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Documentation and community are strongest in German-speaking regions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Self-hosting requires Ruby on Rails server administration knowledge$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Volunteer-maintained pace of development can vary over time$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Is Foodsoft free?$q$, $q$Yes, Foodsoft is open-source software and free to self-host. Some third-party providers also offer paid Foodsoft Hosting for coops that don't want to manage a server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$What does Foodsoft manage?$q$, $q$It manages a coop's product catalog, member ordering, accounting, and volunteer job scheduling.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Who maintains Foodsoft?$q$, $q$It's maintained as a community open-source project on GitHub under the foodcoops organization.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$Running a member-owned food coop$q$, $q$Coordinate product ordering, accounting, and volunteer scheduling for a non-profit, member-run food cooperative.$q$, $q$Food cooperative members and organizers$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Foodsoft is an open-source, web-based application for running a non-profit food cooperative — a group of members who buy directly from suppliers of their own choosing, effectively operating a collective do-it-yourself supermarket. It's maintained on GitHub under the foodcoops organization and has a long history within the German and European food-coop community.$q$, $q$The software covers the core operational needs of a coop: maintaining a shared product catalog, taking member orders online, tracking accounting/balances, and scheduling the volunteer jobs members take on to keep the coop running. It can be self-hosted, and the project also lists third-party "Foodsoft Hosting" options for coops that don't want to run their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Foodsoft is built for member-run, non-profit food cooperatives that need to coordinate ordering, accounting, and volunteer job scheduling across a group of members rather than a traditional retail storefront.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1807f881-55e3-4c8e-81e1-3548278fad9e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

