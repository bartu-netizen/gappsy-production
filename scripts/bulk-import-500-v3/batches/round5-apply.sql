-- Enrichment batch: Toast Tables, SevenRooms, OpenTable, Resy, Tock, Eat App, Tablein, TheFork Manager, Lightspeed Restaurant, Lavu, GoTab, MarginEdge, MarketMan, Restaurant365, Craftable, Apicbase, Meez, Galley, Choco, BlueCart, Order.co, Precoro, Procurify, Tradogram, Zip, Vendr, Tropic, Sastrify, Vertice, PayEm, Soldo, Found, Lili, Bluevine, Arc, Pipe, Capchase, Founderpath, Clearco, Numeral, Anrok, Zamp, TaxJar, Avalara, Quaderno, Fonoa, Lago, OpenMeter, Amberflo, m3ter, Zenskar, Tabs, Sequence, Subskribe, Ordway, DealHub CPQ, Salesbricks, MonetizeNow, Nue, Subskribe CPQ, Qobra, QuotaPath, CaptivateIQ, Everstage, Forma.ai, Performio, Xactly Incent, Sales Cookie, Plecto, Ambition, Spinify, SalesScreen
-- Publishes 72 bulk-imported tool(s) with full editorial content.

-- ── Toast Tables ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Reservation, waitlist, and table management software integrated with the Toast restaurant POS platform.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$50/month$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$Boston, Massachusetts, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Toast Tables adds reservations, waitlists, and floor plan management to Toast POS, starting at $50/month with no per-cover fees.$q$,
  og_description = $q$Toast Tables adds reservations, waitlists, and floor plan management to Toast POS, starting at $50/month with no per-cover fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5a648195-23d1-462c-80b6-a9d18bdb505a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5a648195-23d1-462c-80b6-a9d18bdb505a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Live floor plan sync$q$, $q$An automatically updated floor plan shows each table's status, including whether guests have ordered and if those orders have been fulfilled.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Waitlist & reservation booking$q$, $q$Guests can join a waitlist or book a table directly from the restaurant's website, Google, or the Local by Toast app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Automated guest notifications$q$, $q$Automated messaging updates guests on seating status and table changes to help reduce no-shows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Guest notes synced to POS$q$, $q$Guest notes, special requests, and visit history from Toast Tables and Guestbook flow automatically into the POS and handheld devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Server roster tracking$q$, $q$A synced server roster shows time since last seating, total covers, and active covers per server.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Flat monthly pricing with no per-cover fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Guest data and visit history flow directly into Toast POS and handhelds$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Automated guest messaging helps cut down on no-shows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Booking available through the restaurant's own site, Google, and the Local by Toast app$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Designed to run within the Toast POS ecosystem rather than as a fully standalone tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Entry-level tier caps reservations at 25 per month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Full pricing and reservation-heavy functionality requires the higher $199/month Plus tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$How much does Toast Tables cost?$q$, $q$Toast Tables is priced at $50/month for restaurants seating on a first-come, first-served basis (unlimited waitlist, 25 reservations/month), or $199/month for Toast Tables Plus, which includes unlimited waitlist and reservations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Does Toast Tables charge per-cover fees?$q$, $q$No. Toast Tables is sold as a flat monthly price with no fees per cover.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Where can guests book a table?$q$, $q$Guests can book directly from the restaurant's website, through Google, or via the Local by Toast mobile app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Does Toast Tables work with Toast POS?$q$, $q$Yes, guest notes, special requests, and visit history sync automatically between Toast Tables, Guestbook, and the Toast POS and handhelds.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Walk-in-first restaurants$q$, $q$Restaurants that primarily seat guests on a first-come, first-served basis can use the $50/month tier for waitlist management.$q$, $q$Casual and quick-service restaurants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Reservation-based dining$q$, $q$Restaurants taking a high volume of reservations can use Toast Tables Plus for unlimited bookings and waitlist entries.$q$, $q$Full-service and fine dining restaurants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Toast Tables$q$, $q$$50/month$q$, $q$monthly$q$, $q$["Unlimited waitlist","25 reservations per month","No per-cover fees"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$Toast Tables Plus$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Unlimited waitlist","Unlimited reservations","No per-cover fees"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$overview$q$, $q$What is Toast Tables?$q$, 2, ARRAY[$q$Toast Tables is a reservation, waitlist, and table management add-on built into the Toast restaurant point-of-sale platform, made by Boston-based Toast, Inc. It connects guest bookings, host workflows, floor plans, and seating data into a single system that syncs with the POS.$q$, $q$The product is sold in two flat-rate tiers: a $50/month option for restaurants that seat primarily on a first-come, first-served basis with an unlimited waitlist and 25 reservations per month, and a $199/month Toast Tables Plus tier with unlimited waitlist entries and reservations, both with no per-cover charges.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', $q$who-its-for$q$, $q$Who Toast Tables is for$q$, 2, ARRAY[$q$Toast Tables is built for restaurants already running on, or considering, the Toast POS platform that want reservation and waitlist tools tied directly to their point-of-sale and guest data, rather than a separate standalone reservation system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a648195-23d1-462c-80b6-a9d18bdb505a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SevenRooms ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hospitality platform for reservations, guest CRM, and marketing automation, now owned by DoorDash.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$New York City, New York, United States$q$,
  languages = '{}',
  seo_meta_description = $q$SevenRooms is a reservation, guest CRM, and marketing platform for restaurants, hotels, and venues, acquired by DoorDash in 2025.$q$,
  og_description = $q$SevenRooms is a reservation, guest CRM, and marketing platform for restaurants, hotels, and venues, acquired by DoorDash in 2025.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2d77d287-461d-4b2b-b185-9fa78b3a2e55' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Multi-channel reservations$q$, $q$Take reservations from the restaurant's own website, DoorDash Reservations, Deliveroo Reservations, Google, Instagram, and Yelp.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$AI-powered table management$q$, $q$Smart seating, pacing controls, cover forecasting, and waitlist automation aimed at seating guests faster.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Voice AI for phone bookings$q$, $q$Voice technology designed to capture call-in reservations so calls aren't missed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Guest data and CRM$q$, $q$Automatically captures and unifies guest data across every booking, visit, and order.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Marketing automation$q$, $q$Automated email, SMS, and campaign journeys designed to drive repeat visits.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Events and experiences management$q$, $q$Tools for managing ticketed events and reservation add-ons.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Reputation management$q$, $q$Aggregates guest feedback across channels.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Distributes reservations through DoorDash and Deliveroo in addition to Google, Instagram, and Yelp$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$AI table management and voice AI aimed at reducing missed reservations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Serves a wide range of venue types beyond restaurants, including hotels, clubs, and wineries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Used by over 15,000 restaurants globally, per the company$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$No public pricing; requires booking a demo to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Now part of DoorDash following its 2025 acquisition, which could shift product priorities$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Enterprise-oriented feature set may be more than small independent restaurants need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Who owns SevenRooms?$q$, $q$SevenRooms is owned by DoorDash, which completed its acquisition of the company in June 2025.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$What types of venues use SevenRooms?$q$, $q$SevenRooms serves restaurants, restaurant groups, hotels, membership clubs, nightclubs and bars, sports and entertainment venues, and breweries and wineries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Does SevenRooms have AI features?$q$, $q$Yes. It includes AI-powered table management for seating optimization and Voice AI for handling call-in reservations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Is SevenRooms pricing public?$q$, $q$No, SevenRooms directs prospective customers to request a demo rather than publishing pricing on its site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Multi-location restaurant groups$q$, $q$Unified guest data and marketing automation across multiple venues.$q$, $q$Restaurant groups and multi-location operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Hotel food and beverage outlets$q$, $q$Reservation and guest management for hotel restaurants and bars.$q$, $q$Hotels and hospitality groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$Nightlife and entertainment venues$q$, $q$Table and guest management for clubs, bars, and entertainment venues.$q$, $q$Nightclubs, bars, and entertainment venues$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$overview$q$, $q$What is SevenRooms?$q$, 2, ARRAY[$q$SevenRooms is a hospitality management platform combining reservations, guest data and CRM, marketing automation, and table operations tools. Founded in 2011 and headquartered in New York City, it was acquired by DoorDash in June 2025.$q$, $q$The platform distributes reservations across a restaurant's own website as well as DoorDash Reservations, Deliveroo Reservations, Google, Instagram, and Yelp, and layers in AI-powered table management and voice AI for phone bookings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', $q$who-its-for$q$, $q$Who SevenRooms is for$q$, 2, ARRAY[$q$SevenRooms is aimed at restaurants, restaurant groups, hotels, membership clubs, nightlife venues, sports and entertainment venues, and breweries and wineries that want reservations, guest data, and marketing unified in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d77d287-461d-4b2b-b185-9fa78b3a2e55', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── OpenTable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Global restaurant reservation platform, owned by Booking Holdings, used by more than 65,000 restaurants.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$149/month$q$,
  founded_year = 1998,
  company_size = NULL,
  headquarters = $q$San Francisco, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$OpenTable for Restaurants offers reservations, table management, and diner insights, with plans from $149/month plus per-cover fees.$q$,
  og_description = $q$OpenTable for Restaurants offers reservations, table management, and diner insights, with plans from $149/month plus per-cover fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae9d7434-92d8-4d57-91cd-e0572dbd91d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Online reservations and booking widget$q$, $q$Lets diners book directly through a restaurant profile, booking widget, or the OpenTable network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Table and floor plan management$q$, $q$Live table availability, floor plans, guest notes, and waitlist management for front-of-house staff.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Guest insights and CRM$q$, $q$Detailed guest data to inform tailored hospitality, plus reports on cover trends, reservation sources, and guest spend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Benchmarking$q$, $q$Compares a restaurant's performance against other local restaurants on metrics like seated guests and no-shows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$200+ integrations$q$, $q$Connects with more than 200 restaurant tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Reminders and rewards management$q$, $q$Email reminders and rewards program management aimed at reducing no-shows and encouraging repeat visits.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Access to OpenTable's large existing network of diners as part of Booking Holdings$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Only charges per-cover fees for diners sourced through OpenTable's network on Core and Pro plans, not for direct bookings$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Integrates with more than 200 restaurant tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$24/7 support from the company, with a reported 92% customer satisfaction score from restaurant partners$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Plans start at $149/month, with per-cover fees on top for diners discovered via OpenTable$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Benchmarking and advanced reporting features require the higher Core or Pro tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$As part of Booking Holdings, a large public company, the platform may offer less flexibility than smaller independent tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$How much does OpenTable cost?$q$, $q$OpenTable for Restaurants pricing starts at $149/month for the Basic plan, with Core at $299/month and Pro at $499/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Does OpenTable charge per-cover fees?$q$, $q$On the Core and Pro plans, OpenTable only charges cover fees for diners who discover the restaurant through OpenTable's website, app, or affiliate network; diners who book directly through the restaurant's own website or by phone aren't charged a fee.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Who owns OpenTable?$q$, $q$OpenTable is owned by Booking Holdings, which acquired it in 2014.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$How many restaurants use OpenTable?$q$, $q$OpenTable states it helps more than 65,000 restaurants worldwide fill reservations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Independent restaurants seeking diner discovery$q$, $q$Restaurants that want exposure to OpenTable's existing diner network and app.$q$, $q$Independent restaurants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Multi-location groups wanting benchmarking$q$, $q$Groups that want to compare performance across locations and against local competitors.$q$, $q$Restaurant groups$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Basic$q$, $q$$149/month$q$, $q$monthly$q$, $q$["Restaurant profile","Booking widget","Review management","Digital advertising"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Core$q$, $q$$299/month$q$, $q$monthly$q$, $q$["Basic plan features","Per-cover fees only on OpenTable-sourced diners","Additional reporting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$Pro$q$, $q$$499/month$q$, $q$monthly$q$, $q$["Core plan features","Expanded capabilities for larger operations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$overview$q$, $q$What is OpenTable?$q$, 2, ARRAY[$q$OpenTable is a restaurant reservation and table management platform founded in 1998 and headquartered in San Francisco. It has been owned by Booking Holdings, the parent company of Priceline, since 2014.$q$, $q$The platform centralizes online reservations, live table availability, floor plans, guest notes, and waitlists, and integrates with more than 200 restaurant tools. Pricing runs from a $149/month Basic plan up to a $499/month Pro plan, with additional per-cover fees on Core and Pro plans for diners sourced through OpenTable's network.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae9d7434-92d8-4d57-91cd-e0572dbd91d6', $q$who-its-for$q$, $q$Who OpenTable is for$q$, 2, ARRAY[$q$OpenTable suits restaurants that want visibility to a large, established network of diners in addition to managing their own bookings, floor plans, and guest data in one system.$q$]::text[], 1);


-- ── Resy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Restaurant reservation and operations platform owned by American Express, with flat monthly pricing and no cover fees.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$249/month$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = $q$New York City, New York, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Resy is a reservation and table management platform owned by American Express, with plans from $249/month and no per-cover fees.$q$,
  og_description = $q$Resy is a reservation and table management platform owned by American Express, with plans from $249/month and no per-cover fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de627a61-90d5-4b28-8678-2d3f4251e213';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de627a61-90d5-4b28-8678-2d3f4251e213' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Table and reservation management$q$, $q$Real-time reservation tracking and customizable booking parameters for front-of-house staff.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Web booking and mobile app$q$, $q$Guests can book through the restaurant's own site or the Resy consumer app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Waitlist management$q$, $q$Automated walk-in waitlist tools alongside standard reservations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Guest CRM$q$, $q$Guest profiles and dining history to support personalized service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$No-show protection$q$, $q$Credit card holds and deposits available to reduce no-shows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Tock-powered plans$q$, $q$Essential and Premium tiers run on Tock's platform, adding advanced customization and event ticketing.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Flat monthly fee with no per-cover charges on any plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Backed by American Express, giving restaurants access to the Amex Card Member diner network$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Offers both Resy-powered and Tock-powered plan tiers depending on feature needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Used by roughly 16,000 restaurants globally$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Starting price of $249/month is higher than some competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Tock-powered Essential and Premium plans carry additional prepayment processing fees of 2-3%$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Feature set is split across two different underlying platforms (Resy-branded vs. Tock-powered), which adds some complexity when choosing a plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Does Resy charge per-cover fees?$q$, $q$No. Resy charges one flat monthly fee per plan and does not charge fees on a per-reservation basis.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Who owns Resy?$q$, $q$Resy was acquired by American Express in 2019, in a deal reported at approximately $400 million.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$What plans does Resy offer?$q$, $q$Resy offers Platform ($249/month) and Platform 360 ($399/month) plans powered by Resy, plus Essential ($269/month) and Premium ($399/month) plans powered by Tock, which carry prepayment fees of 3% and 2% respectively.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$When was Resy founded?$q$, $q$Resy was founded in 2014 by Gary Vaynerchuk, Ben Leventhal, and Michael Montero, and is headquartered in New York City.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Restaurants seeking Amex diner exposure$q$, $q$Restaurants that want visibility to American Express Card Member dining benefits and the Resy consumer network.$q$, $q$Restaurants and hospitality groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Venues needing ticketed events$q$, $q$Hospitality businesses that want to sell ticketed dining experiences via the Tock-powered plans.$q$, $q$Fine dining restaurants and wineries$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Platform$q$, $q$$249/month$q$, $q$monthly$q$, $q$["Reservation and table management","POS integrations","Powered by Resy"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Platform 360$q$, $q$$399/month$q$, $q$monthly$q$, $q$["All Platform features","Advanced analytics","Automated guest insights"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Essential$q$, $q$$269/month$q$, $q$monthly$q$, $q$["Reservation and table management","Advanced customization","Event ticketing","3% prepayment fee","Powered by Tock"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$Premium$q$, $q$$399/month$q$, $q$monthly$q$, $q$["All Essential features","Lower 2% prepayment fee","POS integrations","Premium phone support","Powered by Tock"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$overview$q$, $q$What is Resy?$q$, 2, ARRAY[$q$Resy is a restaurant reservation and operations platform founded in 2014 by Gary Vaynerchuk, Ben Leventhal, and Michael Montero, and headquartered in New York City. American Express acquired Resy in 2019.$q$, $q$The platform charges a flat monthly fee with no per-cover charges. It offers two Resy-branded plans (Platform and Platform 360) as well as two Tock-powered plans (Essential and Premium) that add event ticketing and carry separate prepayment processing fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de627a61-90d5-4b28-8678-2d3f4251e213', $q$who-its-for$q$, $q$Who Resy is for$q$, 2, ARRAY[$q$Resy is built for restaurants, hospitality groups, hotels, and wineries that want reservation and guest management tools alongside exposure to American Express's dining network.$q$]::text[], 1);


-- ── Tock ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Reservation and event ticketing platform for restaurants and wineries, now owned by American Express.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = $q$Chicago, Illinois, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Tock is a flat-rate reservation and event ticketing platform with no cover fees, used in 30+ countries and owned by American Express.$q$,
  og_description = $q$Tock is a flat-rate reservation and event ticketing platform with no cover fees, used in 30+ countries and owned by American Express.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3b848b09-87f9-4b49-ae0b-1296d600f752';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3b848b09-87f9-4b49-ae0b-1296d600f752' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$No-Show Elimination Suite$q$, $q$Offers free, deposit, prepaid, and credit card hold reservation types to reduce no-shows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Walk-in waitlist and table management$q$, $q$Included in Tock's base plan alongside guest and event management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Event and experience ticketing$q$, $q$Lets venues sell reservations alongside unique experiences such as a chef's counter, cocktail class, or happy hour.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Guest notes and dining history$q$, $q$Guest notes, tags, and dining history to help personalize service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Two-way SMS communication$q$, $q$Built-in SMS messaging with guests alongside chat and email support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Third-party integrations$q$, $q$Integrates with Toast, WineDirect, Commerce7, Tripleseat, and Upserve, among others.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Flat-rate pricing model with no per-cover fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Deposit and prepayment tools built specifically to reduce no-shows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Supports ticketed dining experiences, not just standard reservations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Used by hospitality businesses in more than 30 countries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Pricing is not published on the official site and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Ownership has changed twice in recent years (sold to Squarespace in 2021, then acquired by American Express in 2024 from Squarespace)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Ticketed-experience features are geared more toward chef-driven and fine-dining concepts than casual restaurants$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Who owns Tock?$q$, $q$Tock was founded in 2014 by Nick Kokonas and Brian Fitzpatrick, sold to Squarespace in 2021, and acquired by American Express from Squarespace in 2024.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Does Tock charge per-cover fees?$q$, $q$No, Tock uses a flat-rate pricing model and does not charge cover fees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$What is the No-Show Elimination Suite?$q$, $q$It's Tock's set of reservation types, including free, deposit, prepaid, and credit card hold bookings, designed to reduce no-shows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$What does Tock integrate with?$q$, $q$Tock integrates with platforms including Toast, WineDirect, Commerce7, Tripleseat, and Upserve.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Fine dining with ticketed reservations$q$, $q$Restaurants that sell reservations as tickets, including deposits or prepayment, to reduce no-shows.$q$, $q$Fine dining and chef-driven restaurants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$Wineries and experience-based venues$q$, $q$Venues selling tastings, classes, or other ticketed experiences alongside standard bookings.$q$, $q$Wineries and hospitality groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$overview$q$, $q$What is Tock?$q$, 2, ARRAY[$q$Tock is a reservation, waitlist, and event ticketing platform founded in 2014 by Nick Kokonas and Brian Fitzpatrick in Chicago. It was sold to Squarespace in 2021 and acquired by American Express in 2024.$q$, $q$The platform is built around a No-Show Elimination Suite that lets restaurants require free, deposit, prepaid, or credit-card-hold reservations, and it supports selling ticketed experiences like chef's counters or classes alongside standard bookings. It integrates with tools including Toast, WineDirect, Commerce7, Tripleseat, and Upserve.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b848b09-87f9-4b49-ae0b-1296d600f752', $q$who-its-for$q$, $q$Who Tock is for$q$, 2, ARRAY[$q$Tock is aimed at restaurants, wineries, and hospitality businesses that want to reduce no-shows through deposits and prepayment, or that sell ticketed dining experiences in addition to standard reservations.$q$]::text[], 1);


-- ── Eat App ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Restaurant and hotel reservation platform offering commission-free bookings, CRM, and marketing tools.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$99/month$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$Dubai, United Arab Emirates$q$,
  languages = '{}',
  seo_meta_description = $q$Eat App offers commission-free restaurant reservations, table management, and CRM, with plans starting at $99/month.$q$,
  og_description = $q$Eat App offers commission-free restaurant reservations, table management, and CRM, with plans starting at $99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '58340ae3-bb72-49c9-8eb1-38e05b4918b4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '58340ae3-bb72-49c9-8eb1-38e05b4918b4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Commission-free online reservations$q$, $q$Accepts bookings from Instagram, Google, and the restaurant's website without commission charges.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Table management$q$, $q$Visual table management tools to help fill more seats and turn tables faster.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Guest database and CRM$q$, $q$Builds a guest database automatically from reservation and visit activity.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Automated confirmations and reminders$q$, $q$Sends reservation confirmations and reminders to save staff time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Pay-at-table via QR code$q$, $q$Payment processing at the table through QR codes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Email marketing suite$q$, $q$Built-in email marketing with campaign capabilities.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$WhatsApp messaging$q$, $q$Integrated WhatsApp messaging with guests.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Review management$q$, $q$Post-dining surveys and review collection tools.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Reservations from Instagram, Google, and the restaurant's own site are commission-free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Available on iPhone, Android, web browsers, and iPad$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Plans scale from a 300-cover Starter tier to unlimited covers on Essential and Pro$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Pro tier includes a dedicated success manager$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Starter plan is capped at 300 covers per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Some marketing and loyalty tools are limited to higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$AI is listed as a feature on the site but specific AI capabilities aren't detailed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$How much does Eat App cost?$q$, $q$Eat App's plans are Starter at $99/month (up to 300 covers/month), Essential at $199/month (unlimited covers), and Pro at $389/month (unlimited covers plus a dedicated success manager).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Does Eat App charge commission on reservations?$q$, $q$No, Eat App advertises commission-free reservations from Instagram, Google, and the restaurant's website.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$What platforms does Eat App support?$q$, $q$Eat App is available synced across iPhone, Android, web browsers, and iPad.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Where is Eat App based?$q$, $q$Eat App is headquartered in Dubai, United Arab Emirates, and was founded in 2015.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Independent restaurants and cafes$q$, $q$Restaurants, cafes, and bars managing reservations and walk-ins without paying commission.$q$, $q$Independent restaurants, cafes, and bars$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Hotel food and beverage outlets$q$, $q$Hotels and hospitality groups managing restaurant reservations across properties.$q$, $q$Hotels and hospitality groups$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Starter$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Up to 300 covers/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Essential$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Unlimited covers/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$Pro$q$, $q$$389/month$q$, $q$monthly$q$, $q$["Unlimited covers/month","Dedicated success manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$overview$q$, $q$What is Eat App?$q$, 2, ARRAY[$q$Eat App is a restaurant and hotel reservation management platform founded in 2015 and headquartered in Dubai. It covers reservation management, marketing, reviews, and a payment suite in one system.$q$, $q$The platform accepts commission-free bookings from Instagram, Google, and a restaurant's own website, and is available synced across iPhone, Android, web browsers, and iPad. Pricing runs from a $99/month Starter plan capped at 300 covers to a $389/month Pro plan with unlimited covers and a dedicated success manager.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', $q$who-its-for$q$, $q$Who Eat App is for$q$, 2, ARRAY[$q$Eat App is built for restaurants, cafes, bars, breweries, nightclubs, and hotel food and beverage operations that want commission-free reservations alongside CRM and marketing tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('58340ae3-bb72-49c9-8eb1-38e05b4918b4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Tablein ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based table booking system for independent restaurants, with all features included on every plan.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$79/month$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$Kaunas, Lithuania$q$,
  languages = '{}',
  seo_meta_description = $q$Tablein is a cloud table booking system for restaurants, with plans from $79/month and no commission or add-on fees.$q$,
  og_description = $q$Tablein is a cloud table booking system for restaurants, with plans from $79/month and no commission or add-on fees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c81486a4-91b4-43a3-938b-cb4a8e444d88';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c81486a4-91b4-43a3-938b-cb4a8e444d88' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Digital reservation book$q$, $q$Calendar views and floor plan visualization of the restaurant's table layout.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Online booking widget$q$, $q$An embeddable reservation tool for the restaurant's website, allowing bookings even when the restaurant is closed.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Guest database$q$, $q$Tracks guest preferences, dietary restrictions, past orders, and visit frequency.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Automated notifications$q$, $q$Booking confirmations, reminders, and automated email/chat replies to reduce no-shows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Payment integration$q$, $q$Integrates with Stripe and other payment gateways for deposits and no-show fees.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Website builder$q$, $q$Builds a restaurant website including food and drink menus.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Reporting and analytics$q$, $q$Dashboards and data reports to support business decisions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$All plans include the full feature set with no add-on fees or commission charges$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Used by restaurants, bars, and clubs in more than 50 countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Named 'Best Booking System' for 2023 by Investopedia$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Used by hotel brands including Hilton and Corinthia Hotels$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Starter and Growth plans charge per-reservation overage fees once the included booking count is exceeded$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$No AI features are mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Smaller brand recognition than larger competitors such as OpenTable or Resy$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$How much does Tablein cost?$q$, $q$Tablein has three plans: Starter at roughly €67/month ($79 USD) with 50 reservations included, Growth at roughly €117/month ($139 USD) with 150 reservations included, and Success at roughly €177/month ($209 USD) with unlimited reservations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Does Tablein charge commission on bookings?$q$, $q$No, Tablein states its plans include all features with no additional paid add-ons or commission charges.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$What payment processors does Tablein support?$q$, $q$Tablein integrates with Stripe and other payment gateways for deposits and no-show fees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Where is Tablein based?$q$, $q$Tablein was founded in 2015 and is headquartered in Kaunas, Lithuania.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Independent restaurants replacing paper booking$q$, $q$Restaurants moving from a paper reservation book to a digital, multi-device system.$q$, $q$Small and independent restaurants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Hotel restaurants and membership clubs$q$, $q$Hospitality venues needing table booking alongside a guest database.$q$, $q$Hotel restaurants and membership clubs$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Starter$q$, $q$€67/month (~$79 USD)$q$, $q$monthly$q$, $q$["50 reservations included","€0.67 per extra reservation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Growth$q$, $q$€117/month (~$139 USD)$q$, $q$monthly$q$, $q$["150 reservations included","€0.37 per extra reservation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$Success$q$, $q$€177/month (~$209 USD)$q$, $q$monthly$q$, $q$["Unlimited reservations","Annual plans available"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$overview$q$, $q$What is Tablein?$q$, 2, ARRAY[$q$Tablein is a cloud-based table booking system founded in 2015 and headquartered in Kaunas, Lithuania. It digitizes reservation management for restaurants, replacing paper booking systems with tools accessible by staff across devices.$q$, $q$Every plan, from the €67/month Starter tier to the €177/month unlimited Success tier, includes the same full feature set with no separate add-on fees or commission charges.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c81486a4-91b4-43a3-938b-cb4a8e444d88', $q$who-its-for$q$, $q$Who Tablein is for$q$, 2, ARRAY[$q$Tablein targets individual restaurants, restaurant groups, hotel restaurants, bars, pubs, clubs, and event or catering businesses looking for an affordable, full-featured booking system.$q$]::text[], 1);


-- ── TheFork Manager ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Restaurant management and reservation software from TheFork, owned by TripAdvisor and used across Europe.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = $q$Paris, France$q$,
  languages = '{}',
  seo_meta_description = $q$TheFork Manager is TripAdvisor-owned restaurant management software with reservations, no-show tools, and analytics, priced by quote.$q$,
  og_description = $q$TheFork Manager is TripAdvisor-owned restaurant management software with reservations, no-show tools, and analytics, priced by quote.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd454fe2-fd4b-4e4f-9816-8a9c32182617';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd454fe2-fd4b-4e4f-9816-8a9c32182617' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Smart floorplan$q$, $q$Table optimization tools built into a digital floorplan.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$No-show reduction tools$q$, $q$Credit card guarantees and pre-payments to reduce no-shows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Customizable booking flow$q$, $q$Configurable reservation flow for the restaurant's booking process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Performance analytics with peer comparisons$q$, $q$Advanced analytics including comparisons against peer restaurants.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$AI-powered review summaries$q$, $q$Guest communication tools including AI-generated summaries of reviews.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Multi-channel booking integration$q$, $q$Bookings integrated across Google, Tripadvisor, MICHELIN, and Meta, among others.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Guest data collection$q$, $q$Builds a guest database to support loyalty and retention.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Direct bookings from the restaurant's own website, Instagram, and Facebook are included at no extra fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Distribution through TheFork's consumer platform, reported at 20M+ monthly visits, and the TripAdvisor network$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Used by 2,500+ Michelin-listed restaurants and 55,000 restaurant partners overall, per the company$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Enterprise tier adds multi-location management and centralized analytics$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Pricing isn't published for either plan; both require contacting TheFork Manager for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Bookings sourced from TheFork, TripAdvisor, and partner platforms are charged as a percentage of the average bill per guest$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Primary market focus is Europe, operating across 11 European countries$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$How is TheFork Manager priced?$q$, $q$TheFork Manager offers Performance and Enterprise plans, both priced by custom quote. Bookings from TheFork, TripAdvisor, and partner platforms are charged as a percentage of the average bill per guest, while bookings from the restaurant's own website, Instagram, and Facebook are included.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Who owns TheFork Manager?$q$, $q$TheFork Manager is operated by LaFourchette SAS, which was acquired by TripAdvisor in 2014.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$What channels does TheFork Manager integrate with?$q$, $q$It integrates with Google, Tripadvisor, MICHELIN, and Meta, among other channels.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Does TheFork Manager support multiple locations?$q$, $q$Yes, the Enterprise plan adds multi-location management, centralized analytics, and cross-venue guest data sharing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Restaurants wanting TheFork/TripAdvisor exposure$q$, $q$Independent restaurants looking to be discovered through TheFork's diner platform and TripAdvisor.$q$, $q$Independent restaurants in Europe$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Multi-location restaurant groups$q$, $q$Groups needing centralized data and analytics across venues.$q$, $q$Restaurant groups across Europe$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Performance$q$, $q$Custom quote$q$, NULL, $q$["Smart floorplan","No-show reduction tools","Customizable booking flow","Advanced performance analytics","AI-powered review summaries","Guest data collection"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["All Performance features","Multi-location management","Centralized data and analytics","Cross-venue guest data sharing","Tailored email campaign builder"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$overview$q$, $q$What is TheFork Manager?$q$, 2, ARRAY[$q$TheFork Manager is restaurant management software from TheFork, operated by Paris-based LaFourchette SAS, which was acquired by TripAdvisor in 2014. It combines table reservations, order management, and service coordination.$q$, $q$The product is sold in two custom-quoted tiers, Performance and Enterprise, with fees on bookings sourced from TheFork, TripAdvisor, and partner platforms based on a percentage of the average bill, while direct bookings from the restaurant's own channels are included.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', $q$who-its-for$q$, $q$Who TheFork Manager is for$q$, 2, ARRAY[$q$TheFork Manager is aimed at restaurants operating in Europe, from new independents to Michelin-starred establishments and multi-location groups, that want to be discovered through TheFork's diner platform and TripAdvisor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd454fe2-fd4b-4e4f-9816-8a9c32182617', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Lightspeed Restaurant ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based restaurant POS from Lightspeed Commerce, deployed in about 150,000 locations worldwide.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$Montreal, Quebec, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Lightspeed Restaurant is a cloud POS for order management, inventory, and multi-location restaurants, priced by custom quote.$q$,
  og_description = $q$Lightspeed Restaurant is a cloud POS for order management, inventory, and multi-location restaurants, priced by custom quote.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ed66bad-7bcf-4b57-a6f5-992c5dbb3327' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Online, tableside, and QR ordering$q$, $q$Multiple order channels including online ordering, tableside ordering, and QR code ordering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Multi-location management$q$, $q$Manage multiple locations or revenue centers from one platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Offline functionality$q$, $q$Continues to operate if the restaurant experiences connectivity issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Kitchen Display System$q$, $q$Connects front-of-house and back-of-house teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Ingredient-level inventory tracking$q$, $q$Tracks inventory down to the ingredient level.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Real-time data analytics$q$, $q$Insights for menu optimization and customer behavior tracking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Third-party integrations$q$, $q$Integrates with tools including 7shifts for scheduling and OpenTable for reservations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Continues working offline during connectivity issues$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Used by more than 200 Michelin-starred restaurants, per the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Deployed in roughly 150,000 locations across more than 100 countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Runs on iPad-based POS hardware with a cloud backend$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Specific plan pricing is not published; Starter, Essential, and Premium tiers require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Details on 'Lightspeed AI' capabilities are not disclosed on the product page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Some product marketing images are AI-generated or AI-edited rather than actual product screenshots, per the site's own disclosure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$How much does Lightspeed Restaurant cost?$q$, $q$Lightspeed does not publish specific prices for its Starter, Essential, or Premium restaurant POS plans on this page; pricing requires contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Does Lightspeed Restaurant work offline?$q$, $q$Yes, the system can continue to operate if the restaurant experiences internet connectivity issues.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$What does Lightspeed Restaurant integrate with?$q$, $q$It integrates with tools such as 7shifts for scheduling and payroll and OpenTable for reservations, among a wider partner network.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Who makes Lightspeed Restaurant?$q$, $q$Lightspeed Restaurant is made by Lightspeed Commerce, founded in 2005 and headquartered in Montreal, Quebec, Canada.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Multi-location restaurant groups$q$, $q$Managing multiple locations or revenue centers from a single platform.$q$, $q$Multi-location restaurant groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Fine dining and Michelin-starred kitchens$q$, $q$Restaurants needing detailed inventory and kitchen display coordination.$q$, $q$Fine dining restaurants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Quick-service and cafe operations$q$, $q$Venues needing QR code and tableside ordering options.$q$, $q$Quick-service restaurants and cafes$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Starter$q$, $q$Custom quote$q$, NULL, $q$["Single location","Straightforward operations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$Essential / Premium$q$, $q$Custom quote$q$, NULL, $q$["Multiple locations","Omni-channel ordering needs"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$overview$q$, $q$What is Lightspeed Restaurant?$q$, 2, ARRAY[$q$Lightspeed Restaurant is a cloud-based point-of-sale system for restaurants made by Lightspeed Commerce, founded in 2005 and headquartered in Montreal, Quebec, Canada. It covers order management, payment processing, and inventory tracking.$q$, $q$The system supports online, tableside, and QR code ordering, multi-location management, an offline mode for connectivity issues, and ingredient-level inventory tracking, with pricing organized into Starter, Essential, and Premium tiers priced by custom quote.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', $q$who-its-for$q$, $q$Who Lightspeed Restaurant is for$q$, 2, ARRAY[$q$Lightspeed Restaurant serves full-service and quick-service restaurants, fine dining, bars, breweries, cafes, and hotels, including more than 200 Michelin-starred restaurants and roughly 150,000 locations worldwide, per the company.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ed66bad-7bcf-4b57-a6f5-992c5dbb3327', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Lavu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lavu is a cloud-based iPad point-of-sale system for restaurants with AI-driven financial and operations tools.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lavu is an iPad restaurant POS with AI agents for finance, marketing, menu, labor, and inventory management.$q$,
  og_description = $q$Lavu is an iPad restaurant POS with AI agents for finance, marketing, menu, labor, and inventory management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa214254-dedb-418f-829f-a286a6fdbeb5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa214254-dedb-418f-829f-a286a6fdbeb5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$iPad Point of Sale$q$, $q$Cloud-based POS software built to run on iPad devices for restaurant front-of-house operations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Kitchen Display System$q$, $q$Digital kitchen display system (KDS) for routing and tracking orders in the kitchen.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Marty AI agents$q$, $q$Six AI agents covering marketing, menu, labor, inventory, server, and finance tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Payment processing$q$, $q$Built-in payment processing with contactless payment options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Online ordering$q$, $q$Online ordering capability integrated with the POS platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Payroll management$q$, $q$Payroll management functionality offered as part of the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Cross-POS financial reporting$q$, $q$Financial insight reports (e.g. 'Morning Deposit') that can connect to other POS systems including Toast, Square, Clover, and Aloha.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Offers AI-driven financial insights (Marty AI, six specialized agents)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Can connect to and report on data from other POS systems (Toast, Square, Clover, Aloha)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Bundles payroll and marketing automation alongside POS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Includes built-in kitchen display and online ordering features$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Pricing is not published on the website and requires contacting sales or requesting a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Core POS runs on iPad hardware, requiring Apple devices$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$No free trial or free plan is stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$What is Lavu?$q$, $q$Lavu is a cloud-based restaurant POS system that runs on iPad and includes AI-powered financial and operations tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Does Lavu offer AI features?$q$, $q$Yes, Lavu includes 'Marty AI' with six agents covering marketing, menu, labor, inventory, server, and finance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$What other POS systems can Lavu connect to?$q$, $q$Lavu's site mentions compatibility with Toast, Square, Clover, and Aloha for financial reporting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Is Lavu's pricing publicly listed?$q$, $q$No, the website does not list specific pricing and directs visitors to buy directly, request a demo, or call sales.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$What hardware does Lavu run on?$q$, $q$Lavu's POS is primarily built for iPad.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Full-service restaurant POS$q$, $q$Running front-of-house ordering and payments on iPad hardware.$q$, $q$Restaurant owners and operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Cross-platform financial insight$q$, $q$Getting AI-generated financial reports even when using a different existing POS system.$q$, $q$Restaurant finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$Automated marketing and labor tools$q$, $q$Using AI agents to help with marketing campaigns, menu decisions, and labor management.$q$, $q$Restaurant managers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$overview$q$, $q$What is Lavu?$q$, 2, ARRAY[$q$Lavu is a cloud-based restaurant point-of-sale system built primarily for iPad, offering ordering, kitchen display, payments, and payroll tools.$q$, $q$The platform includes 'Marty AI,' a set of six AI agents focused on marketing, menu, labor, inventory, server, and finance tasks, and can generate financial reports even when connected to other POS systems like Toast, Square, Clover, or Aloha.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', $q$who-its-for$q$, $q$Who Lavu is for$q$, 2, ARRAY[$q$Lavu is aimed at restaurant owners and operators who want an iPad-based POS combined with AI-assisted financial reporting, marketing automation, and payroll management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa214254-dedb-418f-829f-a286a6fdbeb5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── GoTab ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GoTab is a POS and mobile order-and-pay platform for restaurants, breweries, and hospitality venues.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$]::text[],
  seo_meta_description = $q$GoTab offers POS, QR mobile ordering, and kitchen display tools for restaurants and breweries from $15/month.$q$,
  og_description = $q$GoTab offers POS, QR mobile ordering, and kitchen display tools for restaurants and breweries from $15/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a57ea53a-5e59-4850-be73-20f61d1184e1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a57ea53a-5e59-4850-be73-20f61d1184e1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Point of sale system$q$, $q$Core POS system for order entry and payment processing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Mobile order & payment$q$, $q$QR-code based mobile ordering and payment for guests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Kitchen Display System$q$, $q$Digital KDS available as an add-on for order routing in the kitchen.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Handheld / Pocket POS$q$, $q$Handheld POS devices for tableside or counter service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Self-ordering kiosks$q$, $q$Self-service ordering kiosks available as an add-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Loyalty & marketing tools$q$, $q$Loyalty and marketing features available as an add-on on Pro and Sync plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Gift cards, memberships & subscriptions$q$, $q$Support for gift cards, memberships, and subscription offerings.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Manager dashboard$q$, $q$Dashboard for venue managers to oversee operations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Low-cost entry point with a $15/month Basic plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Runs on Android, iOS, and Windows tablets, plus web access$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Supports English and Spanish$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Higher tiers bundle 24/7 support, accounting integration, and Easy Tab at no extra add-on cost$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Company states it processes over $1B in annual transactions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Many features (KDS, kiosk, extra terminals, loyalty, fraud protection) are paid add-ons on the Basic and Pro plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Full feature set (on-premise server, fraud protection, 24/7 support) requires the $229/month Sync plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Card processing starts at 2.40% + $0.15, with additional surcharges for Amex, JCB, corporate cards, and international transactions$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Setup fees are custom-quoted rather than published$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$What is GoTab?$q$, $q$GoTab is a POS and mobile order-and-pay platform used by restaurants, breweries, food halls, hotels, and similar venues.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$How much does GoTab cost?$q$, $q$GoTab offers Basic ($15/month), Pro ($99/month), and Sync ($229/month) plans, with several features available as paid add-ons.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$What payment processing rate does GoTab charge?$q$, $q$GoTab states card processing starts at 2.40% + $0.15 for in-person transactions, with extra surcharges for Amex, JCB, corporate cards, and international payments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$What languages does GoTab support?$q$, $q$GoTab's site states support for English and Spanish.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$What devices does GoTab run on?$q$, $q$GoTab supports Android and iOS devices as well as Windows tablets, plus web access.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$QR mobile ordering for breweries and food halls$q$, $q$Letting guests order and pay via QR code at the table or counter.$q$, $q$Brewery and food hall operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Multi-location venue management$q$, $q$Managing POS operations across multiple locations using the Pro or Sync plan add-on.$q$, $q$Multi-location restaurant and venue groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Loyalty and membership programs$q$, $q$Running gift card, membership, and loyalty programs through the platform.$q$, $q$Hospitality venues focused on repeat guests$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Basic$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Core POS platform access","Additional POS terminal, KDS, self-ordering kiosk, Easy Tab, 24/7 support, and accounting integration available as paid add-ons"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Pro$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Includes Easy Tab","Includes 24/7 support","Includes accounting integration","Optional add-ons: on-premise server (+$75/mo), loyalty & memberships (+$35/mo), fraud protection (+$35/mo), multi-location management (+$50/mo)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$Sync$q$, $q$$229/month$q$, $q$monthly$q$, $q$["Includes cloud and on-premises capability","Includes 24/7 support, accounting integration, and fraud protection","Optional add-ons: loyalty & memberships (+$35/mo), multi-location management (+$50/mo)"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$overview$q$, $q$What is GoTab?$q$, 2, ARRAY[$q$GoTab is a POS and mobile order-and-pay platform for restaurants, breweries, food halls, hotels, and similar venues, combining a core point-of-sale system with QR-code mobile ordering.$q$, $q$Pricing starts at $15/month for a Basic plan, with Pro ($99/month) and Sync ($229/month) tiers adding features like 24/7 support, accounting integration, and on-premise server capability; many features such as kitchen display, kiosks, and loyalty tools are available as paid add-ons.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', $q$who-its-for$q$, $q$Who GoTab is for$q$, 2, ARRAY[$q$GoTab is aimed at restaurants, breweries, food halls, and hospitality venues that want mobile QR ordering alongside traditional POS, with the ability to add features like kiosks, loyalty programs, and multi-location management as needed.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57ea53a-5e59-4850-be73-20f61d1184e1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MarginEdge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Restaurant back-office software that automates invoice processing, food cost tracking, and daily P&L reporting.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$350/month per location$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Arlington, VA, United States$q$,
  languages = '{}',
  seo_meta_description = $q$MarginEdge automates restaurant invoice processing, food costing, and daily P&L reporting for independent and multi-unit operators.$q$,
  og_description = $q$MarginEdge automates restaurant invoice processing, food costing, and daily P&L reporting for independent and multi-unit operators.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'adae3e2d-9b36-4cc0-8d29-a710afd0f677';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'adae3e2d-9b36-4cc0-8d29-a710afd0f677' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Automated Invoice Processing$q$, $q$Digitizes and processes vendor invoices automatically; MarginEdge has processed more than 5.0 million invoices to date.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Daily P&L Reporting$q$, $q$Generates daily profit-and-loss reports to give operators real-time visibility into restaurant performance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Food Cost Control$q$, $q$Tracks food costs and usage across locations to help operators control margins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Recipe Cost Calculations$q$, $q$Calculates recipe costs to support menu pricing decisions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Menu Engineering & Analysis$q$, $q$Analyzes menu item profitability metrics to support menu engineering decisions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Bill Payment Automation$q$, $q$Automates bill payment workflows for restaurant accounts payable.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Inventory Management$q$, $q$Tracks inventory and food usage across locations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Multi-Location Transfer Management$q$, $q$Manages internal inventory transfers between locations for multi-unit restaurant groups.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Processes invoices automatically, reducing manual back-office paperwork$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Provides daily (not just monthly) P&L reporting for faster decision-making$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Integrates with POS systems (Square, 7shifts, SpotOn), accounting software (Sage), and food distributors (Gordon Food Service, BEK)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Reports 97% customer satisfaction and a 4.5-star rating on Capterra$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$No long-term contracts; plans can be canceled anytime$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Pricing starts at $350/month per location, which can add up for multi-unit operators$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Toast POS integration requires an additional $50/month per location fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Liquor management (Freepour) is a paid add-on rather than included by default$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$No free trial is advertised on the pricing page$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$How much does MarginEdge cost?$q$, $q$MarginEdge starts at $350 per month per location, with a $500/month per location bundle available that adds the Freepour liquor management feature.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Does MarginEdge integrate with my POS?$q$, $q$MarginEdge integrates with POS systems including Square, 7shifts, and SpotOn.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Does MarginEdge offer a free trial?$q$, $q$MarginEdge's pricing page does not list a free trial; plans instead include unlimited invoice processing, unlimited U.S. bill payments, and 1:1 training with no contracts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$How many restaurants use MarginEdge?$q$, $q$MarginEdge reports serving more than 11,000 clients and has processed over 5.0 million invoices.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Where is MarginEdge based?$q$, $q$MarginEdge is headquartered in Arlington, VA.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Independent restaurant back-office automation$q$, $q$Single-location restaurant operators use MarginEdge to automate invoice processing and get daily P&L visibility instead of manual bookkeeping.$q$, $q$Independent restaurant owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Multi-unit food cost control$q$, $q$Multi-location restaurant groups use MarginEdge's transfer management and food cost tracking to standardize costs across units.$q$, $q$Multi-unit restaurant operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$Restaurant accounting firm support$q$, $q$Accounting professionals serving restaurant clients use MarginEdge's automated invoice and bill pay tools, with special pricing available for accounting firms.$q$, $q$Restaurant accounting firms and bookkeepers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$MarginEdge$q$, $q$$350/month per location$q$, $q$monthly$q$, $q$["Unlimited invoice processing","Unlimited U.S. bill payments","Unlimited email support","1:1 software training","No contracts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$MarginEdge + Freepour$q$, $q$$500/month per location$q$, $q$monthly$q$, $q$["All MarginEdge features","Freepour smart scale for liquor counting"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$overview$q$, $q$What is MarginEdge?$q$, 2, ARRAY[$q$MarginEdge is restaurant back-office software that automates invoice processing, food cost tracking, and daily profit-and-loss reporting for restaurant operators.$q$, $q$The platform has processed more than 5.0 million invoices and reports serving over 11,000 restaurant clients, with pricing starting at $350 per month per location.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', $q$who-its-for$q$, $q$Who MarginEdge is for$q$, 2, ARRAY[$q$MarginEdge is built for independent restaurant owners, multi-unit restaurant groups, and accounting professionals who manage restaurant finances and need automated invoice processing and daily cost visibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adae3e2d-9b36-4cc0-8d29-a710afd0f677', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MarketMan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based restaurant inventory management platform for purchasing, recipe costing, and COGS automation.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$199/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MarketMan offers cloud-based restaurant inventory, purchasing, and recipe costing software starting at $199/month, used by 15,000+ restaurants.$q$,
  og_description = $q$MarketMan offers cloud-based restaurant inventory, purchasing, and recipe costing software starting at $199/month, used by 15,000+ restaurants.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Inventory Management$q$, $q$Provides real-time, web and mobile inventory management for restaurants.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Purchase Order Automation$q$, $q$Enables purchase order placement and receiving directly through the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Price Tracking & Alerts$q$, $q$Tracks vendor pricing and sends alerts on price changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Recipe Costing$q$, $q$Calculates recipe costs and profitability analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Waste Tracking$q$, $q$Tracks food waste as part of inventory management on the Growth plan and above.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$AI-Powered Ordering$q$, $q$Uses AI-powered automation and predictive analytics for demand forecasting and ordering recommendations on the Enterprise plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Vendor Management$q$, $q$Automates vendor management workflows on the Growth plan and above.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$COGS Automation$q$, $q$Automatically calculates cost of goods sold (COGS).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Used by more than 15,000 restaurants worldwide$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Offers dedicated iOS and Android mobile apps alongside the web app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Integrates with major POS platforms (Lightspeed, TouchBistro, Toast, Square), accounting software (QuickBooks, Xero), and distributors (US Foods, Sysco, PFG)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Includes AI-powered recipe creation and AI ordering on higher-tier plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Customers report typical 3-5% COGS reduction and 100+ hours saved monthly$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Starter plan limits invoice scanning to 50 scans/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$AI ordering and some vendor integrations are reserved for the custom-priced Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$No free trial is advertised on the pricing page$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Enterprise pricing is custom and not published$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$How much does MarketMan cost?$q$, $q$MarketMan's Starter plan is $199/month, Growth is $249/month, and Enterprise pricing is custom.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Does MarketMan have a mobile app?$q$, $q$Yes, MarketMan offers a web application plus iOS and Android mobile apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$What POS systems does MarketMan integrate with?$q$, $q$MarketMan integrates with POS platforms including Lightspeed, TouchBistro, Toast, and Square.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Does MarketMan use AI?$q$, $q$MarketMan includes AI-powered automation such as unlimited AI-powered recipe creation on the Growth plan and AI ordering with predictive analytics on the Enterprise plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$How many restaurants use MarketMan?$q$, $q$MarketMan reports being used by more than 15,000 restaurants worldwide.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Single-location inventory control$q$, $q$Independent restaurants use the Starter plan for purchase order placement, price tracking, and live inventory management.$q$, $q$Independent restaurant operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Recipe costing and waste reduction$q$, $q$Restaurants on the Growth plan use automatic COGS calculation, waste tracking, and AI-powered recipe creation to control food costs.$q$, $q$Full-service restaurants and cafes$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Multi-vendor enterprise purchasing$q$, $q$Large multi-unit chains use the Enterprise plan's AI ordering and multiple vendor integrations to manage purchasing at scale.$q$, $q$Multi-unit restaurant chains$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Starter$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Web & mobile app","Purchase order placement & receiving","Price tracking & alerts","Live inventory management","POS & accounting integrations","50 invoice scans/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Growth$q$, $q$$249/month$q$, $q$monthly$q$, $q$["All Starter features","Automatic vendor management","Inventory waste tracking","Unlimited AI-powered recipe creation","Real-time recipe costing","Automatic COGS calculation","Unlimited invoice scans","1 core add-on included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["All Growth features","AI ordering","2 included vendor integrations","Order by recipe","All core add-ons included"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$overview$q$, $q$What is MarketMan?$q$, 2, ARRAY[$q$MarketMan is a cloud-based restaurant management platform for inventory control, purchasing, expense tracking, and recipe costing.$q$, $q$The platform is used by more than 15,000 restaurants worldwide, with plans starting at $199/month for the Starter tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', $q$who-its-for$q$, $q$Who MarketMan is for$q$, 2, ARRAY[$q$MarketMan serves quick-service restaurants, full-service dining establishments, cafes, bars, and ghost kitchens, from single-location operators to large multi-unit chains.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9de17dd-4f9b-4e9c-970b-67a6e9b13dd3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Restaurant365 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based restaurant accounting, inventory, and workforce management platform used by more than 52,000 restaurants.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Irvine, CA, United States$q$,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$]::text[],
  seo_meta_description = $q$Restaurant365 provides cloud accounting, inventory, and workforce management for restaurants, with custom pricing and R365 AI tools.$q$,
  og_description = $q$Restaurant365 provides cloud accounting, inventory, and workforce management for restaurants, with custom pricing and R365 AI tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9db567bc-79c1-40cb-a4a7-632f1cdc6fde';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9db567bc-79c1-40cb-a4a7-632f1cdc6fde' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Accounting & AP Automation$q$, $q$Provides accounts payable automation, banking, financial reporting, budgeting, and bookkeeping tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Inventory & Purchasing$q$, $q$Manages inventory, recipes, purchasing, receiving, and cash management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Workforce Scheduling$q$, $q$Offers scheduling, sales forecasting, employee training, and time/attendance tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Payroll & HR$q$, $q$Handles hiring, onboarding, HR, and payroll processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$R365 AI$q$, $q$An AI intelligence engine described by Restaurant365 as built on the full restaurant P&L, with capabilities like automated schedule generation, recipe integration, and expense variance detection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Modular Platform$q$, $q$Accounting, Inventory & Purchasing, Workforce Management, and Payroll & HR modules can be selected individually.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Used by more than 52,000 restaurants$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Supports English and Spanish$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Reports claimed benefits including 50% reduction in accounting time and 5% lower food costs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Modular structure lets operators adopt only the modules they need$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Includes R365 AI for schedule generation and expense variance detection$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Pricing is entirely custom/quote-based and not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$No free trial is mentioned; a demo must be requested$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Requires contacting sales for a custom quote before pricing is known$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$How much does Restaurant365 cost?$q$, $q$Restaurant365 uses custom pricing; the company directs prospective customers to request a custom quote from its sales team rather than publishing plan prices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$What does Restaurant365 include?$q$, $q$Restaurant365 offers modular Accounting, Inventory & Purchasing, Workforce Management, and Payroll & HR modules that can be selected individually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$How many restaurants use Restaurant365?$q$, $q$Restaurant365 states that more than 52,000 restaurants use the platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$What languages does Restaurant365 support?$q$, $q$Restaurant365 supports English and Spanish.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Where is Restaurant365 headquartered?$q$, $q$Restaurant365 lists offices in Irvine, CA; Austin, TX; Mexico City; Akron, OH; and Nablus, Palestine.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Restaurant accounting automation$q$, $q$Restaurant groups use Restaurant365's accounting module for AP automation, budgeting, and financial reporting to reduce manual bookkeeping.$q$, $q$Multi-location restaurant groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Franchise operations management$q$, $q$Franchise brands use Restaurant365's inventory, purchasing, and workforce modules to standardize operations across locations.$q$, $q$Franchise brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$Restaurant accounting firm services$q$, $q$Accounting firms and bookkeepers serving restaurant clients use Restaurant365's accounting and reporting tools.$q$, $q$Accounting firms and bookkeepers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$overview$q$, $q$What is Restaurant365?$q$, 2, ARRAY[$q$Restaurant365 is a cloud-based management system offering integrated accounting, inventory, workforce scheduling, and payroll for restaurants.$q$, $q$The platform reports more than 52,000 restaurant users and offers modular Accounting, Inventory & Purchasing, Workforce Management, and Payroll & HR products with custom pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', $q$who-its-for$q$, $q$Who Restaurant365 is for$q$, 2, ARRAY[$q$Restaurant365 serves small business restaurants, multi-location restaurant groups, franchise brands, and accounting firms across restaurant styles including QSR, casual dining, fast casual, fine dining, coffee shops, and pizza concepts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9db567bc-79c1-40cb-a4a7-632f1cdc6fde', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Craftable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Back-office platform for hospitality businesses covering purchasing, inventory, recipe costing, and AP automation.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Craftable is back-office software for restaurants and hotels, unifying purchasing, inventory, recipe costing, and AP automation.$q$,
  og_description = $q$Craftable is back-office software for restaurants and hotels, unifying purchasing, inventory, recipe costing, and AP automation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b5712ae-a2d8-4a37-a333-309ad689655d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b5712ae-a2d8-4a37-a333-309ad689655d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Intelligent Ordering$q$, $q$Manages vendor orders and flags price discrepancies during purchasing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Inventory & Recipe Management$q$, $q$Tracks inventory in real time and connects it to recipes and theoretical usage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$AP Automation$q$, $q$Uses AI-powered invoice processing with PO matching and three-way reconciliation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Daily Actionable Insights$q$, $q$Provides a unified dashboard combining food cost, labor, and purchasing data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Operator AI$q$, $q$Surfaces daily ranked insights across operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Invoice AI$q$, $q$Automates scanning and processing of vendor invoices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Crafty AI Assistant$q$, $q$In-app AI assistant for answering recipe profitability questions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Combines purchasing, inventory, recipe costing, and AP automation in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Reports 1,000+ POS, EDI, and API integrations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$SOC 2 compliant with SSO support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Used by 10,000+ operators including bartaco, Jim's Steakout, PopStroke, and Sugarfire Smokehouse$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Includes AI-driven invoice processing and operational insights$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$No public pricing; requires a demo/sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$No mobile app mentioned on the official site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Supported languages are not documented publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Does Craftable publish pricing online?$q$, $q$No, Craftable does not display pricing publicly; it uses a demo-based sales process.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$What types of businesses use Craftable?$q$, $q$Full-service and limited-service restaurants, fast-casual chains, hotels, resorts, and entertainment venues.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Does Craftable offer AI features?$q$, $q$Yes, including Operator AI for insights, Invoice AI for automated invoice processing, and Crafty, an in-app AI assistant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Is Craftable SOC 2 compliant?$q$, $q$Yes, Craftable states it is SOC 2 compliant and supports SSO.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$How many integrations does Craftable support?$q$, $q$Craftable states it has 1,000+ POS, EDI, and API integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Multi-location restaurant purchasing$q$, $q$Centralizes vendor ordering and flags price discrepancies across locations.$q$, $q$Restaurant chains and multi-unit operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Recipe cost control$q$, $q$Connects real-time inventory data to recipes to track theoretical usage and food cost.$q$, $q$Restaurant and hotel kitchen operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$Invoice and AP automation$q$, $q$Automates invoice scanning, PO matching, and reconciliation to reduce manual AP work.$q$, $q$Hospitality finance and accounting teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$overview$q$, $q$What is Craftable?$q$, 2, ARRAY[$q$Craftable is back-office software for hospitality businesses that consolidates purchasing, inventory, accounts payable, and financial reporting into a single platform.$q$, $q$The platform is operated by FNBTech, Inc. and is used by full-service and limited-service restaurants, fast-casual chains, hotels, resorts, and entertainment venues, with named customers including bartaco, Jim's Steakout, PopStroke, and Sugarfire Smokehouse.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', $q$who-its-for$q$, $q$Who Craftable is for$q$, 2, ARRAY[$q$Craftable targets multi-unit and enterprise hospitality operators that need to unify purchasing, inventory, recipe costing, and invoice processing across locations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b5712ae-a2d8-4a37-a333-309ad689655d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Apicbase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Multi-site F&B operations platform for recipe management, inventory, purchasing, and menu engineering.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Belgium$q$,
  languages = ARRAY[$q$English$q$, $q$Dutch$q$, $q$French$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Apicbase is a multi-site F&B management platform for recipe standardization, inventory, purchasing, and menu engineering.$q$,
  og_description = $q$Apicbase is a multi-site F&B management platform for recipe standardization, inventory, purchasing, and menu engineering.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Recipe Management$q$, $q$Standardizes recipes with automatic dietary data completion and allergen compliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Menu Engineering$q$, $q$Analyzes profitability using sales data and AI-driven forecasting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Inventory Management$q$, $q$Tracks inventory in real time across kitchens and outlets, including barcode and voice-based counting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Purchasing & Receiving$q$, $q$Generates smart order suggestions and handles invoice matching and spend controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Group-wide Analytics$q$, $q$Provides group-wide reporting and demand forecasting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Compliance Tools$q$, $q$Supports HACCP, traceability, allergen communication, and audit-ready reporting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Sustainability Tracking$q$, $q$Tracks carbon, waste, water, and land usage metrics.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Covers recipe management, purchasing, inventory, and compliance in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Supports multiple languages: English, Dutch, French, and German$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Includes a mobile app on the Growth plan and higher$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Used across 1,000+ outlets and by named customers including Vermaat, Loetje, citizenM, and Compass Group$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Tiered plans (Growth, Professional, Enterprise) scale features with business size$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$No specific dollar pricing published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Monthly billing carries an additional 15% fee versus annual billing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Growth plan requires a minimum of 5 outlets$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Advanced features like demand forecasting and SSO are reserved for higher-tier plans$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Does Apicbase publish its pricing?$q$, $q$Apicbase does not list specific dollar prices publicly; annual billing is standard, with a 15% additional fee for monthly billing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$What is the minimum plan size for Apicbase?$q$, $q$The Growth plan starts from 5 outlets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$What languages does Apicbase support?$q$, $q$Apicbase's site is available in English, Dutch, French, and German.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Where is Apicbase headquartered?$q$, $q$Apicbase is headquartered in Belgium, with an extensive remote team.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Does Apicbase offer a mobile app?$q$, $q$Yes, a mobile app is included starting with the Growth plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Multi-site recipe standardization$q$, $q$Standardizes recipes and automates dietary and allergen data across many locations.$q$, $q$Multi-unit restaurant and catering chains$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Menu profitability analysis$q$, $q$Analyzes sales data to optimize menu pricing and profitability with AI-driven forecasting.$q$, $q$Restaurant and hospitality menu managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Group-wide inventory and purchasing$q$, $q$Centralizes inventory counting and purchasing with order suggestions and invoice matching across outlets.$q$, $q$Operations and procurement teams at large F&B groups$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Compliance and sustainability reporting$q$, $q$Tracks HACCP compliance, traceability, and environmental metrics like carbon and waste.$q$, $q$Compliance and sustainability teams at foodservice companies$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Growth$q$, NULL, $q$annual$q$, $q$["Menu Engineering","Procurement","Inventory Management","Sales Analytics","Mobile App","Order to Par","Detailed Insights","Starting from 5 outlets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Professional$q$, NULL, $q$annual$q$, $q$["Everything in Growth","Demand Forecasting","BOM Ordering","User Management","Custom Fields","SSO & 2FA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Enterprise$q$, NULL, $q$annual$q$, $q$["Everything in Professional","99% Uptime SLA","Dedicated CS Manager","Increased API limits","Custom Integrations","More Storage","Bulk discount applies"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$overview$q$, $q$What is Apicbase?$q$, 2, ARRAY[$q$Apicbase is a multi-site food and beverage operations platform that centralizes recipe management, purchasing, inventory, and cost management for distributed restaurant, catering, and hotel businesses.$q$, $q$The company is headquartered in Belgium and serves 1,000+ outlets globally, with named customers including Vermaat, Loetje, citizenM, and Compass Group.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$who-its-for$q$, $q$Who Apicbase is for$q$, 2, ARRAY[$q$Apicbase is built for multi-unit and enterprise foodservice operators that need standardized recipes, group-wide inventory and purchasing control, and compliance reporting across many locations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Meez ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Recipe management and food costing software that helps culinary teams organize recipes, calculate margins, and train kitchen staff.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Meez is a recipe management and food costing platform for chefs and multi-unit restaurant teams, starting at $19/month.$q$,
  og_description = $q$Meez is a recipe management and food costing platform for chefs and multi-unit restaurant teams, starting at $19/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6cf21005-e4bd-49c2-a890-817f14482aab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6cf21005-e4bd-49c2-a890-817f14482aab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Recipe Organization$q$, $q$Searchable, version-controlled recipe hub with support for photos and videos.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Automatic Food Costing$q$, $q$Calculates food costs automatically, accounting for yields, unit of measure, and prep loss.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Recipe Scaling & Conversions$q$, $q$One-click recipe scaling with automatic unit conversions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Kitchen Training$q$, $q$Visual, step-by-step recipe training designed for consistent back-of-house onboarding.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Menu Engineering$q$, $q$Real-time profitability analysis and scenario modeling for menu items.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Allergen Management$q$, $q$Automatically tags allergens in every recipe.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Nutrition Labeling$q$, $q$Built-in database of 2,500+ ingredients for nutrition label generation.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$AI Recipe Import$q$, $q$Uses AI to capture and digitize recipes with built-in yields.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Tiered pricing starting at an accessible rate for individual chefs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Native integrations with Restaurant365, MarketMan, MarginEdge, Ottimate, and Over Easy Office$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$AI-assisted recipe import reduces manual data entry$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Used by 35,000+ culinary professionals including named brands like José Andrés Group and True Food Kitchen$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Covers the full workflow from recipe creation to menu engineering and allergen compliance$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Higher-tier plans (Premium, Enterprise) require custom quotes or significant monthly spend$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Backoffice system connections and invoice processing are limited to higher-priced plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Add-ons like extra cost feeds and data warehouse sync carry additional monthly fees$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$How much does Meez cost?$q$, $q$Meez's Starter plan starts at $19/month billed annually (or $24/month billed monthly); Pro and Premium plans cost more and include additional devices and features, while Enterprise pricing is custom.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Does Meez offer a free trial?$q$, $q$Yes, Meez plans can be tried for free before committing to a paid subscription.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Does Meez integrate with other restaurant software?$q$, $q$Yes, Meez has native integrations with Restaurant365, MarketMan, MarginEdge, Ottimate, and Over Easy Office.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Can Meez calculate food costs automatically?$q$, $q$Yes, Meez automatically calculates food costs based on yields, unit of measure, and prep loss.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Does Meez support allergen and nutrition labeling?$q$, $q$Yes, Meez can automatically tag allergens and includes a database of 2,500+ ingredients for nutrition labeling, available on higher-tier plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Independent chef recipe organization$q$, $q$Individual chefs use the Starter plan to organize recipes and calculate basic food costs.$q$, $q$Independent chefs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Single-kitchen training and costing$q$, $q$Single kitchen teams use Meez for staff training, prep standardization, and food costing.$q$, $q$Restaurant operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Multi-location menu engineering$q$, $q$Hospitality groups use Meez for menu engineering, nutrition labeling, and allergen compliance across multiple locations.$q$, $q$Multi-unit restaurant and hospitality groups$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Starter$q$, $q$$19/month$q$, $q$annual$q$, $q$["Unlimited recipes","AI recipe import","Recipe scaling","Basic costing","Automated yields","Margin calculator","Order lists"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Starter (monthly)$q$, $q$$24/month$q$, $q$monthly$q$, $q$["Unlimited recipes","AI recipe import","Recipe scaling","Basic costing","Automated yields","Margin calculator","Order lists"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Pro$q$, $q$$89/month$q$, $q$annual$q$, $q$["Everything in Starter","5 active devices","Inventory management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Pro (monthly)$q$, $q$$119/month$q$, $q$monthly$q$, $q$["Everything in Starter","5 active devices","Inventory management"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Premium$q$, $q$$179/month$q$, $q$annual$q$, $q$["5 active devices","Backoffice system connections","1 costing feed","Invoice processing"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Premium (monthly)$q$, $q$$199/month$q$, $q$monthly$q$, $q$["5 active devices","Backoffice system connections","1 costing feed","Invoice processing"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Menu engineering","Nutrition labels","Allergen tagging","POS integration","Data warehouse sync","Priority support","Dedicated managers"]$q$::jsonb, 6);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$overview$q$, $q$What is Meez?$q$, 2, ARRAY[$q$Meez is a recipe management and food costing platform built for culinary teams. It gives chefs and operators a centralized, searchable hub for recipes, complete with automatic food cost calculations that account for yields, unit of measure, and prep loss.$q$, $q$Beyond recipe storage, Meez supports kitchen training, menu engineering, allergen tagging, and nutrition labeling, with native integrations to accounting and inventory platforms like Restaurant365, MarketMan, and MarginEdge.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', $q$who-its-for$q$, $q$Who Meez is for$q$, 2, ARRAY[$q$Meez serves everyone from independent chefs organizing their own recipes to multi-unit hospitality groups managing menu engineering, nutrition compliance, and allergen tracking across dozens of locations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf21005-e4bd-49c2-a890-817f14482aab', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Galley ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Culinary resource planning platform for recipe management, menu planning, and food cost insights used by chefs and foodservice operators.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Galley is a culinary resource planning platform offering recipe management, menu planning, and real-time food cost insights, with a free trial.$q$,
  og_description = $q$Galley is a culinary resource planning platform offering recipe management, menu planning, and real-time food cost insights, with a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '81547fe6-0936-48d6-be6a-e999e7dcc1ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '81547fe6-0936-48d6-be6a-e999e7dcc1ec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Recipe Management & Scaling$q$, $q$Centralized recipe management with tools to scale recipes for different production needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Menu Planning Optimization$q$, $q$Tools to plan and optimize menus based on cost and operational data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Real-Time Cost Insights$q$, $q$Provides real-time visibility into food costs to support financial accuracy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Allergen Tracking Automation$q$, $q$Automates allergen tracking across recipes and menus.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Kitchen Workflow Optimization$q$, $q$Supports optimization of kitchen workflows for operational efficiency.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Free trial available to test the platform before purchase$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Rated 4.8 out of 5 on Capterra$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Used to create 150,000+ recipes and support 5 million+ meals served across customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Reported to save operators 45+ hours per week$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Serves multiple roles including chefs, foodservice operators, and dietitians$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Pricing details are not published on the website and require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Platform support beyond web (e.g. iOS/Android) is not documented on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Founding year, headquarters, and detailed integrations are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Does Galley offer a free trial?$q$, $q$Yes, Galley's website states you can "Try it today for free!"$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$How much does Galley cost?$q$, $q$Galley does not publish pricing on its website; pricing requires contacting the company directly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$What is Galley used for?$q$, $q$Galley is used for recipe management, menu planning, real-time food cost insights, and allergen tracking in commercial kitchens.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Who uses Galley?$q$, $q$Galley is used by chefs, foodservice operators, and dietitians.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$What rating does Galley have on Capterra?$q$, $q$Galley has a 4.8 out of 5 rating on Capterra, according to its website.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Recipe standardization and scaling$q$, $q$Culinary teams use Galley to manage and scale recipes consistently across a kitchen operation.$q$, $q$Chefs and culinary teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Menu cost planning$q$, $q$Foodservice operators use Galley to plan menus with real-time cost insights.$q$, $q$Foodservice operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$Allergen and nutrition tracking$q$, $q$Dietitians and operators use Galley's allergen tracking automation to manage compliance.$q$, $q$Dietitians and foodservice compliance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$overview$q$, $q$What is Galley?$q$, 2, ARRAY[$q$Galley describes itself as "culinary resource planning for every kitchen," a platform combining recipe management, menu planning, and real-time food cost insights for commercial kitchens.$q$, $q$The platform reports supporting the creation of 150,000+ recipes and 5 million+ meals served across its customer base, with a free trial available to new users.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', $q$who-its-for$q$, $q$Who Galley is for$q$, 2, ARRAY[$q$Galley is built for chefs, foodservice operators, and dietitians who need to manage recipes, plan menus, and track food costs and allergens in a centralized system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('81547fe6-0936-48d6-be6a-e999e7dcc1ec', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Choco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI platform for food & beverage wholesalers that automates order capture, sales, and ecommerce.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Choco is an AI platform for food & beverage distributors that automates order processing, sales tools, and ecommerce for wholesalers.$q$,
  og_description = $q$Choco is an AI platform for food & beverage distributors that automates order processing, sales tools, and ecommerce for wholesalers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$OrderAgent$q$, $q$AI-powered order capture that reads incoming voicemails, emails, texts, and handwritten notes and turns them into digital orders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$eCommerce platform$q$, $q$A branded online storefront for distributors with personalized product recommendations for buyers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$SalesHub$q$, $q$Mobile-first tools for wholesale sales reps to manage accounts and orders in the field.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$CustomerHub$q$, $q$A foodservice CRM giving distributors real-time insight into buyer activity and account health.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$ERP and accounting integrations$q$, $q$Connects with systems including NetSuite, QuickBooks, Microsoft Dynamics, Sage, and Odoo.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$AI order capture reduces manual entry from phone, email, and handwritten orders$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Combines ordering, sales, and CRM tools in one platform built specifically for food & beverage distribution$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Used by a large network of distributors and connects to major ERP and accounting systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Mobile-first tools support field sales reps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$No public pricing; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Built specifically for food & beverage wholesale, not a general-purpose ordering tool$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Founding year and headquarters are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Who is Choco built for?$q$, $q$Choco is built for food and beverage wholesale distributors and the restaurants and foodservice businesses that order from them.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Does Choco use AI?$q$, $q$Yes. Choco's OrderAgent uses AI to convert orders received by voicemail, email, text, or handwritten note into digital orders automatically.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$What systems does Choco integrate with?$q$, $q$Choco integrates with ERP and accounting systems including NetSuite, QuickBooks, Microsoft Dynamics, Sage, and Odoo, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Is Choco pricing public?$q$, $q$No, Choco does not publish pricing on its website; prospective customers need to request a demo or quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Automating incoming wholesale orders$q$, $q$Distributors use OrderAgent to digitize orders that arrive by phone, email, or handwritten note, reducing manual data entry.$q$, $q$Food & beverage distributors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Running a digital wholesale storefront$q$, $q$Distributors give restaurant buyers a branded ecommerce experience with personalized recommendations.$q$, $q$Wholesale distributors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$Field sales management$q$, $q$Sales reps use SalesHub to manage accounts and place orders while visiting customers.$q$, $q$Wholesale sales teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$overview$q$, $q$What is Choco?$q$, 2, ARRAY[$q$Choco is an AI platform built for food and beverage wholesalers. It automates order processing from channels like voicemail, email, text, and handwritten notes, and pairs that with sales and ecommerce tools for distributors.$q$, $q$The platform includes OrderAgent for AI-driven order capture, an ecommerce storefront with personalized recommendations, SalesHub for field sales teams, and CustomerHub, a foodservice CRM. Choco integrates with ERP and accounting systems such as NetSuite, QuickBooks, Microsoft Dynamics, Sage, and Odoo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', $q$who-its-for$q$, $q$Who Choco is for$q$, 2, ARRAY[$q$Choco is aimed at food and beverage wholesale distributors that want to reduce manual order entry, give buyers a digital ordering experience, and equip sales reps with mobile tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0f1e2f2-b93c-47f1-8795-6a8abd9a82c6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── BlueCart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An ecommerce and order-management platform connecting food & beverage distributors with restaurants and foodservice buyers.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BlueCart is a wholesale ordering and ecommerce platform for food & beverage distributors and their restaurant and foodservice buyers.$q$,
  og_description = $q$BlueCart is a wholesale ordering and ecommerce platform for food & beverage distributors and their restaurant and foodservice buyers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c1947c7c-e691-4991-bc52-01c2627b4ff1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c1947c7c-e691-4991-bc52-01c2627b4ff1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Digital catalog management$q$, $q$Distributors build online product catalogs with images for buyers to browse and order from.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Pricing Insights$q$, $q$A tool for comparing and setting competitive pricing across products.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Order management dashboard$q$, $q$Centralized dashboard for processing wholesale orders from restaurant and foodservice buyers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$CRM for buyer relationships$q$, $q$Tracks buyer accounts and order history to support account management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Invoicing and payment collection$q$, $q$Handles invoice generation and payment collection for wholesale orders.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Route and delivery zone management$q$, $q$Distributors can set customizable delivery zones and manage delivery routes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Used by a large network of businesses, with the site citing $2B+ in transaction volume$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Covers the full order lifecycle: catalog, ordering, invoicing, and payment collection$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Includes iOS and Android apps in addition to the web platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Purpose-built for food & beverage wholesale rather than general ecommerce$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$No public pricing; not stated whether there is a free plan or trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Founding year, headquarters, and company size are not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Integration list is not detailed on the marketing site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Who uses BlueCart?$q$, $q$BlueCart is used by food and beverage wholesale distributors and by restaurants, cafes, hotels, and other foodservice buyers that order from them.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Does BlueCart have a mobile app?$q$, $q$Yes, BlueCart offers iOS and Android apps in addition to its web platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Can I see BlueCart's pricing online?$q$, $q$No, BlueCart does not publish pricing on its website; you need to contact them directly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$What does BlueCart help distributors do?$q$, $q$It helps distributors manage digital catalogs, set pricing, take orders, collect payments, and manage delivery routes and buyer relationships.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Digital wholesale ordering$q$, $q$Distributors move buyers from phone/email ordering to a digital storefront with catalogs and pricing tools.$q$, $q$Food & beverage distributors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Restaurant and foodservice purchasing$q$, $q$Restaurants, hotels, and cafes order supplies from distributors through the BlueCart platform.$q$, $q$Restaurants and foodservice businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$Delivery and route management$q$, $q$Distributors configure delivery zones and manage routes for order fulfillment.$q$, $q$Wholesale operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$overview$q$, $q$What is BlueCart?$q$, 2, ARRAY[$q$BlueCart is an ecommerce and order-management platform that connects food and beverage distributors with the restaurants, hotels, cafes, and other foodservice businesses that buy from them.$q$, $q$The platform covers digital catalogs, competitive pricing tools, an order management dashboard, invoicing and payment collection, delivery route management, and a CRM for tracking buyer relationships. It offers web, iOS, and Android access, and the company states its network has processed over $2B in transaction volume across more than 100,000 businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', $q$who-its-for$q$, $q$Who BlueCart is for$q$, 2, ARRAY[$q$BlueCart is built for wholesale food and beverage distributors that want to digitize ordering, as well as the foodservice buyers who purchase from them.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1947c7c-e691-4991-bc52-01c2627b4ff1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Order.co ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI-powered procurement and spend management platform that automates purchasing, payments, and reconciliation.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Order.co is an AI procurement platform that automates purchasing, accounts payable, virtual cards, and spend management for businesses.$q$,
  og_description = $q$Order.co is an AI procurement platform that automates purchasing, accounts payable, virtual cards, and spend management for businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a442a095-0271-47c3-9bde-0e4be198b2c6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a442a095-0271-47c3-9bde-0e4be198b2c6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Procurement automation$q$, $q$Automates the requisition-to-payment process, from catalog ordering to supplier sourcing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Accounts payable automation$q$, $q$Automates AP workflows and reconciliation, with the company citing up to an 80% reduction in manual reconciliation tasks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Virtual cards with budget enforcement$q$, $q$Issues virtual cards with built-in budget and policy controls for purchasing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Order.co AI$q$, $q$AI capabilities covering catalog management, supplier sourcing, approval workflows, order tracking, and payment processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$AI Command Center (beta)$q$, $q$A centralized AI-driven view for managing procurement operations, currently in beta.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Spend visibility$q$, $q$Real-time tracking of spend across teams and locations with pre-approval controls.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Combines procurement, AP automation, and virtual cards in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$AI handles catalog creation, supplier sourcing, and payment reconciliation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Integrates with major accounting systems (QuickBooks Online, NetSuite, Sage Intacct) and SSO providers (Okta, Ping Identity)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Company states customers see average hard-dollar savings of around 5%, up to 10% in some categories$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$No public pricing; requires scheduling a demo to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$AI Command Center is still in beta$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Founding year, headquarters, and platform/mobile support are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$What does Order.co do?$q$, $q$Order.co is an AI-powered platform that automates business purchasing, accounts payable, virtual card spending, and spend reconciliation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Does Order.co use AI?$q$, $q$Yes. Order.co AI handles catalog management, supplier sourcing, approval routing, order tracking, and payment reconciliation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$What accounting systems does Order.co integrate with?$q$, $q$Order.co integrates with QuickBooks Online, NetSuite, and Sage Intacct, along with SSO providers like Okta and Ping Identity.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Is Order.co pricing public?$q$, $q$No, Order.co does not list pricing publicly; you need to schedule a demo to get a quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Automating purchasing and AP$q$, $q$Finance teams automate requisition-to-payment and accounts payable workflows to cut manual work.$q$, $q$Finance and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Controlling spend with virtual cards$q$, $q$Teams issue virtual cards with built-in budget enforcement to control purchasing at the point of transaction.$q$, $q$Multi-location businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$Centralizing supplier ordering$q$, $q$Businesses consolidate ordering across suppliers into a single catalog and approval workflow.$q$, $q$Operations teams at growing and enterprise businesses$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$overview$q$, $q$What is Order.co?$q$, 2, ARRAY[$q$Order.co is an AI-powered procurement and spend management platform that automates the purchasing, accounts payable, and payment reconciliation process for businesses.$q$, $q$It offers virtual cards with budget enforcement, real-time spend visibility, and Order.co AI, which handles catalog management, supplier sourcing, approval workflows, and payment reconciliation. Order.co integrates with accounting systems such as QuickBooks Online, NetSuite, and Sage Intacct, and with SSO providers including Okta and Ping Identity.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', $q$who-its-for$q$, $q$Who Order.co is for$q$, 2, ARRAY[$q$Order.co serves growing businesses and larger enterprises across industries such as coworking, hospitality, technology, healthcare, retail, nonprofits, and property management that want to automate purchasing and reduce manual spend management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a442a095-0271-47c3-9bde-0e4be198b2c6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Precoro ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A procure-to-pay platform with AI-assisted purchasing, invoicing, and spend management, from $499/month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$499/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Precoro is a procure-to-pay platform for purchase requests, orders, invoicing, and vendor management, starting at $499/month.$q$,
  og_description = $q$Precoro is a procure-to-pay platform for purchase requests, orders, invoicing, and vendor management, starting at $499/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b529879-d2eb-436f-9583-eb2ecac8f8c7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b529879-d2eb-436f-9583-eb2ecac8f8c7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Purchase requests and orders$q$, $q$Creates and routes purchase requisitions and purchase orders through customizable approval workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Invoice matching and AP automation$q$, $q$Supports 2- and 3-way invoice matching plus Intelligent AP Automation and e-invoicing on higher tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Contract Agent$q$, $q$An AI feature that extracts key terms, obligations, and renewal dates from contracts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$AI document scanning$q$, $q$Uses AI to read invoice layouts and convert them into digital records automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Vendor management$q$, $q$Tracks supplier information, onboarding, and a supplier portal on higher-tier plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Real-time budget tracking$q$, $q$Monitors spend against budgets in real time on the Automation plan and above.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Mobile app$q$, $q$A mobile app is available for on-the-go approvals and procurement tasks.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Transparent starting price of $499/month, unlike many procurement competitors that are quote-only$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$AI features (Contract Agent, AI Assistant, document scanning) are included starting on the Automation tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Integrates with QuickBooks Online, Xero, Sage Intacct, NetSuite, Microsoft Dynamics 365, BILL, Slack, and Power BI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Company reports over 1,000 customers managing $150B in spend across 80+ countries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$SOC 2 and GDPR compliant, and B Corp certified$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Core plan lacks AI Assistant, e-invoicing, and inventory features found on Automation and Enterprise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Enterprise tier pricing is custom and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Founding year and headquarters are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$How much does Precoro cost?$q$, $q$Precoro's Core plan starts at $499/month billed annually, the Automation plan starts at $999/month billed annually, and Enterprise is custom-priced.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Does Precoro use AI?$q$, $q$Yes. Precoro includes AI document scanning for invoices, a Contract Agent that extracts key contract terms, and an AI Assistant for answering questions about POs and invoices on the Automation and Enterprise plans.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$What accounting systems does Precoro integrate with?$q$, $q$Precoro integrates with QuickBooks Online, Xero, Sage Intacct, NetSuite, Microsoft Dynamics 365 Business Central, and BILL, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Is there a Precoro mobile app?$q$, $q$Yes, Precoro offers a mobile app included across its plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Is Precoro compliant with security standards?$q$, $q$Precoro states it is SOC 2 and GDPR compliant and is B Corp certified.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Purchase order and requisition management$q$, $q$Teams create, route, and approve purchase requests and orders with customizable workflows.$q$, $q$Mid-sized companies with distributed operations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Automating accounts payable$q$, $q$Finance teams use the AP Module or Automation plan to automate invoice matching and e-invoicing.$q$, $q$Finance and AP teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Contract and vendor management$q$, $q$Procurement teams track vendors and use Contract Agent to monitor obligations and renewal dates.$q$, $q$Procurement teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Core$q$, $q$$499/month$q$, $q$annual$q$, $q$["Purchase requisitions and orders","Receipts and invoices","2- and 3-way matching","Automated approvals","Vendor management","Contract repository","Expense management","QuickBooks Online/Xero/Slack integrations","Mobile app"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Automation$q$, $q$$999/month$q$, $q$annual$q$, $q$["Everything in Core","Intelligent AP Automation","E-invoicing","Intake management","Inventory","PunchOuts","AI document scanning","Vendor onboarding","Supplier portal","RFPs","Real-time budget tracking","AI Assistant","API access","SSO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Automation","Unlimited users","Advanced admin controls","ERP system integrations","Custom-built integrations","Regional server selection (US/EU)","IP whitelisting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$AP Module$q$, $q$$499/month$q$, $q$annual$q$, $q$["Invoice management","Intelligent AP Automation","E-invoicing","Budget management","AI expenses","Payments","AI Assistant","Vendor management","Automated approvals","API access","SSO","Mobile app"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$overview$q$, $q$What is Precoro?$q$, 2, ARRAY[$q$Precoro is a procure-to-pay platform that centralizes purchase requests, purchase orders, invoicing, and vendor management, with AI features layered on top for document scanning, contract review, and Q&A about spend.$q$, $q$Plans start at $499/month for the Core tier, with the Automation tier at $999/month adding AI-powered AP automation, e-invoicing, inventory, and API access. An Enterprise tier offers custom pricing with additional admin, security, and integration options. Precoro integrates with accounting systems such as QuickBooks Online, Xero, Sage Intacct, and NetSuite.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', $q$who-its-for$q$, $q$Who Precoro is for$q$, 2, ARRAY[$q$Precoro targets mid-sized companies with distributed operations, and finance and procurement teams that need to track, control, and reduce purchasing costs across multiple locations or business units.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b529879-d2eb-436f-9583-eb2ecac8f8c7', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Procurify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI-powered procurement, accounts payable, and expense platform for mid-market organizations.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Procurify is an AI-powered intake-to-pay platform combining purchasing, accounts payable, and expense management for mid-market companies.$q$,
  og_description = $q$Procurify is an AI-powered intake-to-pay platform combining purchasing, accounts payable, and expense management for mid-market companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c43b72a7-6804-4129-86f6-0b65715b2b9b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c43b72a7-6804-4129-86f6-0b65715b2b9b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Purchase request intake and approvals$q$, $q$AI-assisted intake and approval workflows for purchase requests.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Invoice processing and 3-way matching$q$, $q$Automates invoice processing with three-way matching against purchase orders and receipts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$AI Spend Analyst$q$, $q$Lets users query spend data in natural language and get forecasting insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Vendor management$q$, $q$Tracks and manages supplier information and relationships.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Contract management$q$, $q$Centralizes contract tracking alongside procurement data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Expense and purchasing card management$q$, $q$Manages employee expense reports and purchasing card spend.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Receiving and inventory tracking$q$, $q$Tracks received goods and inventory levels tied to purchase orders.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Combines purchasing, AP, contracts, and expense management in one modular platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$AI Spend Analyst allows natural-language queries and forecasting on spend data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Integrates with QuickBooks Online, QuickBooks Desktop, NetSuite, Sage Intacct, and Microsoft Dynamics 365$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Offers iOS and Android mobile apps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Company reports over 30,000 platform users and manages over $100B in customer spend$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$No public pricing; the site states pricing is flexible and based on features and support needs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$A one-time implementation fee applies, with the amount depending on use case and integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Founding year, headquarters, and company size (employee count) are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$How much does Procurify cost?$q$, $q$Procurify does not publish pricing publicly. It offers modular, flexible pricing based on the features and support a customer needs, plus a one-time implementation fee.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Does Procurify charge per user?$q$, $q$Procurify directs prospective customers to contact its team for per-user pricing details rather than publishing a standard rate.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Does Procurify use AI?$q$, $q$Yes. Procurify uses AI for automated data capture from invoices, AI-powered approval routing, and its AI Spend Analyst for natural-language spend queries and forecasting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$What accounting systems integrate with Procurify?$q$, $q$Procurify integrates with QuickBooks Online, QuickBooks Desktop, NetSuite, Sage Intacct, and Microsoft Dynamics 365.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Is there a Procurify mobile app?$q$, $q$Yes, Procurify offers both iOS and Android mobile apps.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Consolidating intake-to-pay$q$, $q$Mid-market organizations bring purchase requests, approvals, AP, and payments into one platform.$q$, $q$Mid-market finance and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Analyzing spend with AI$q$, $q$Finance teams use the AI Spend Analyst to ask natural-language questions about spend and get forecasts.$q$, $q$Finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$Managing purchasing cards and expenses$q$, $q$Organizations track employee purchasing card spend and expense reports alongside procurement.$q$, $q$Operations and finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$overview$q$, $q$What is Procurify?$q$, 2, ARRAY[$q$Procurify is an AI-powered procurement platform that consolidates purchasing, accounts payable, contracts, and expense management into a single intake-to-pay solution.$q$, $q$It includes AI-assisted approval routing, automated invoice matching, an AI Spend Analyst for natural-language spend queries, and vendor and contract management. Procurify integrates with accounting systems including QuickBooks, NetSuite, Sage Intacct, and Microsoft Dynamics 365, and offers iOS and Android apps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', $q$who-its-for$q$, $q$Who Procurify is for$q$, 2, ARRAY[$q$Procurify targets mid-market organizations across industries such as technology, healthcare, biotech, manufacturing, education, and nonprofits that want to consolidate purchasing, AP, and expense processes.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c43b72a7-6804-4129-86f6-0b65715b2b9b', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Tradogram ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An all-in-one procurement platform with a free plan and paid tiers starting at $225/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$225/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tradogram is an all-in-one procurement platform with purchase orders, RFQs, and budget tracking, with a free plan and paid tiers from $225/month.$q$,
  og_description = $q$Tradogram is an all-in-one procurement platform with purchase orders, RFQs, and budget tracking, with a free plan and paid tiers from $225/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f5fd302-9cde-4c0c-9ce1-23c0223b163f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Purchase orders, requisitions, and RFQs/RFPs$q$, $q$Digitizes the full purchasing workflow from request through sourcing and ordering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Approval workflows$q$, $q$Configurable multi-level approval routing for purchase requests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Budget management and tracking$q$, $q$Tracks spend against budgets across the organization.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Invoice reconciliation$q$, $q$Supports 3-way matching between orders, receipts, and invoices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Inventory control$q$, $q$Tracks inventory levels tied to purchasing activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Contract management$q$, $q$Centralizes supplier contracts alongside procurement records.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Reporting and spend analytics$q$, $q$Provides reporting on purchasing activity and spend.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Offers a free Basic plan (1 user, 5 transactions/month) with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Paid plans have transparent published pricing starting at $225/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$All paid tiers include unlimited transactions, items, suppliers, and categories$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Integrates with QuickBooks Online, QuickBooks Desktop, Xero, NetSuite, Sage Intacct, and Microsoft Dynamics 365$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$iOS and Android mobile apps are available$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$No setup fees, and billing can switch between monthly and annual$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Free plan is limited to one user and five transactions per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Premium plan requires a minimum of 10 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Enterprise tier requires a custom quote$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Founding year, headquarters, and company size are not published on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Does Tradogram have a free plan?$q$, $q$Yes, Tradogram offers a free Basic plan limited to one user and five transactions per month with no time limit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$How much does Tradogram cost?$q$, $q$Paid plans start at $225/month billed annually for the PRO plan (1 user minimum), with PREMIUM at $425/month (10 user minimum) and a custom-quoted Enterprise tier (20 user minimum).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$What accounting systems does Tradogram integrate with?$q$, $q$Tradogram integrates with QuickBooks Online, QuickBooks Desktop, Xero, NetSuite, Sage Intacct, and Microsoft Dynamics 365.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Does Tradogram charge setup fees?$q$, $q$No, Tradogram states there are no setup fees, and only active users are billed.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Is there a Tradogram mobile app?$q$, $q$Yes, Tradogram offers mobile apps for iOS and Android.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Small team procurement on a free plan$q$, $q$A single user can manage a limited volume of purchase orders and requisitions at no cost.$q$, $q$Very small teams or solo procurement users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Multi-user purchasing workflows$q$, $q$Growing teams use the PRO or PREMIUM plans for unlimited transactions, RFQs, and approval workflows.$q$, $q$Organizations across education, healthcare, construction, and other sectors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Multi-location procurement$q$, $q$The PREMIUM plan supports multiple companies or locations with white-label options.$q$, $q$Multi-entity organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$Basic (Free)$q$, $q$$0$q$, NULL, $q$["1 user","5 transactions/month","Limited items and suppliers","PO management","Receiving tracking","AP invoice matching","No time limit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$PRO$q$, $q$$225/month$q$, $q$annual$q$, $q$["1 user minimum","All core modules included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$PREMIUM$q$, $q$$425/month$q$, $q$annual$q$, $q$["10 user minimum","Priority support","Multiple companies/locations","Custom white-label options"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$ENTERPRISE$q$, $q$Custom$q$, NULL, $q$["20 user minimum","Dedicated account manager","Unlimited user options","Custom integrations","Multi-region or private cloud hosting"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$overview$q$, $q$What is Tradogram?$q$, 2, ARRAY[$q$Tradogram is an all-in-one procurement platform covering purchase orders, requisitions, RFQs/RFPs, approval workflows, budget tracking, inventory control, and invoice reconciliation.$q$, $q$It offers a free Basic plan for a single user with limited monthly transactions, along with paid PRO, PREMIUM, and custom-quoted Enterprise tiers. Paid plans include unlimited transactions, items, and suppliers, and Tradogram integrates with QuickBooks, Xero, NetSuite, Sage Intacct, and Microsoft Dynamics 365.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', $q$who-its-for$q$, $q$Who Tradogram is for$q$, 2, ARRAY[$q$Tradogram serves organizations across sectors including education, healthcare, construction, non-profits, technology, hospitality, manufacturing, and food & beverage that need digital purchase order and spend management, from single users on the free plan to larger teams on paid tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f5fd302-9cde-4c0c-9ce1-23c0223b163f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Zip ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI procurement platform that orchestrates intake-to-pay, sourcing, and vendor risk with governed AI agents.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$San Francisco, CA$q$,
  languages = '{}',
  seo_meta_description = $q$Zip is an AI procurement platform offering intake-to-procure, procure-to-pay, sourcing, and vendor risk orchestration for enterprises.$q$,
  og_description = $q$Zip is an AI procurement platform offering intake-to-procure, procure-to-pay, sourcing, and vendor risk orchestration for enterprises.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0302fe96-81fa-4f14-b5ac-8414fede5b87';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0302fe96-81fa-4f14-b5ac-8414fede5b87' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Intake-to-Procure$q$, $q$Guides employees through purchase requests and routes them for approval.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Procure-to-Pay$q$, $q$Automates purchase order creation and invoice processing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Sourcing$q$, $q$Manages RFx (RFP/RFQ) processes for vendor sourcing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Global Payments and Vendor Cards$q$, $q$Supports global payment processing and issues vendor cards for controlled spend.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Risk Orchestration$q$, $q$Coordinates supplier risk assessments and compliance checks during onboarding.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$AI Contract Orchestration$q$, $q$Uses AI to manage contract workflows tied to procurement.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Zip Superagents$q$, $q$Governed AI agents that run procurement tasks such as approvals and policy enforcement.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Broad platform covering intake, sourcing, payments, and vendor risk in one system$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Named a Visionary in a 2026 Gartner Magic Quadrant for Source-to-Pay Suites$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Governed AI agents (Zip Superagents) automate procurement workflows while enforcing policy controls$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Serves organizations from startups to enterprise$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$No public pricing; enterprise-focused sales process$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Specific integrations are not detailed on the marketing site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Company size and supported platforms/languages are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$When was Zip founded and where is it based?$q$, $q$Zip was founded in 2020 and is headquartered in San Francisco, CA.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$What does Zip's AI do?$q$, $q$Zip uses governed AI agents, called Zip Superagents, to run procurement tasks such as approvals, policy enforcement, and spend insights.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Does Zip handle sourcing and payments as well as purchasing?$q$, $q$Yes, Zip's platform covers intake-to-procure, procure-to-pay, sourcing (RFx), global payments, vendor cards, and supplier risk orchestration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Is Zip's pricing public?$q$, $q$No, Zip does not publish pricing; it is positioned for enterprise, mid-market, and startup customers who need to contact sales.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Governing procurement with AI agents$q$, $q$Organizations use Zip Superagents to automate approval routing and policy enforcement across purchasing.$q$, $q$Procurement, finance, and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Vendor risk and onboarding$q$, $q$Security and legal teams use Risk Orchestration to manage supplier risk assessments during onboarding.$q$, $q$Security and legal teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$Sourcing and RFx management$q$, $q$Teams run RFP/RFQ processes for vendor sourcing within the platform.$q$, $q$Sourcing and procurement teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$overview$q$, $q$What is Zip?$q$, 2, ARRAY[$q$Zip is an AI procurement platform, founded in 2020 and headquartered in San Francisco, that orchestrates the intake-to-pay process using governed AI agents it calls Zip Superagents.$q$, $q$The platform spans intake-to-procure request guidance, procure-to-pay automation, RFx sourcing, global payments and vendor cards, supplier risk orchestration, and AI-driven contract orchestration. Zip has been recognized as a Visionary in a 2026 Gartner Magic Quadrant for Source-to-Pay Suites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', $q$who-its-for$q$, $q$Who Zip is for$q$, 2, ARRAY[$q$Zip serves procurement, finance, accounting, IT, security, and legal teams at enterprise, mid-market, and startup organizations that want to centralize and automate purchasing, sourcing, and vendor risk management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0302fe96-81fa-4f14-b5ac-8414fede5b87', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Vendr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI platform providing SaaS pricing intelligence and autonomous negotiation for procurement teams, now part of Vertice.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vendr offers AI-driven software pricing intelligence and autonomous negotiation to help procurement teams cut SaaS costs.$q$,
  og_description = $q$Vendr offers AI-driven software pricing intelligence and autonomous negotiation to help procurement teams cut SaaS costs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '47c26ff2-e8f9-4fe3-9718-d79f6a0f9407' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Pricing benchmarking$q$, $q$Benchmarks software pricing against a dataset the company describes as billions of dollars in real B2B software spend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Negotiation insights$q$, $q$Draws on a claimed 130,000+ real negotiations to inform vendor negotiation strategy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Autonomous negotiation agent$q$, $q$An AI agent that conducts email-based negotiations with vendors on the customer's behalf.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Contract review and analysis$q$, $q$Analyzes vendor contracts to flag overcharges and negotiable terms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Renewal tracking$q$, $q$Tracks and manages upcoming software renewals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Chrome extension$q$, $q$Provides access to Vendr's tools directly in the browser.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Offers a free tier to try the platform ('Try for Free')$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$AI negotiation agent automates vendor email negotiations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Claims $1.4B+ in cumulative customer savings and 5,000+ teams served$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Useful for teams without a dedicated procurement function$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$No public pricing tiers disclosed on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Now operates as part of Vertice, which may affect long-term product direction$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Founding year, headquarters, and detailed integrations are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Is Vendr still an independent company?$q$, $q$Vendr is now part of Vertice, according to its website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Does Vendr have a free plan?$q$, $q$The site offers a 'Try for Free' option, though specific free-tier limits are not detailed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$What does Vendr's AI negotiation agent do?$q$, $q$It conducts autonomous, email-based negotiations with software vendors on behalf of the customer, informed by pricing benchmarks and past negotiation data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$How does Vendr help with SaaS costs?$q$, $q$Vendr benchmarks software pricing, reviews contracts for overcharges and negotiable terms, and tracks renewals to help teams manage and reduce SaaS spend.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Benchmarking software pricing$q$, $q$Teams compare their software costs against Vendr's dataset of real B2B spend to identify overpayment.$q$, $q$Finance and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Automating vendor negotiations$q$, $q$Teams use the autonomous negotiation agent to handle email-based negotiations with software vendors.$q$, $q$Procurement teams without dedicated negotiation staff$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$Managing renewals$q$, $q$Teams track upcoming software renewals to avoid missed negotiation windows.$q$, $q$IT and finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$overview$q$, $q$What is Vendr?$q$, 2, ARRAY[$q$Vendr is an AI-powered platform that provides software pricing intelligence and negotiation support for B2B procurement teams, now operating as part of Vertice.$q$, $q$It benchmarks pricing against a large dataset of real B2B software spend, analyzes contracts for overcharges and negotiable terms, tracks renewals, and includes an autonomous AI agent that can conduct email-based negotiations with vendors. Vendr reports $1.4B+ in cumulative customer savings across more than 5,000 teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', $q$who-its-for$q$, $q$Who Vendr is for$q$, 2, ARRAY[$q$Vendr is aimed at finance and procurement teams, including those without a dedicated procurement function, that want to reduce software spend through pricing benchmarks and vendor negotiation support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47c26ff2-e8f9-4fe3-9718-d79f6a0f9407', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Tropic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI-powered procurement platform, founded in 2019, that provides spend intelligence and agentic negotiation support.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tropic is an AI procurement platform, founded in 2019, offering spend intelligence, negotiation support, and vendor management.$q$,
  og_description = $q$Tropic is an AI procurement platform, founded in 2019, offering spend intelligence, negotiation support, and vendor management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Pricing intelligence and benchmarks$q$, $q$Proprietary data used to benchmark what a company should pay for software and vendor contracts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Negotiation playbooks$q$, $q$Strategies and guidance for negotiating vendor contracts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Renewal Agent$q$, $q$An AI agent that manages upcoming contract renewals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Proposal Agent$q$, $q$An AI agent involved in negotiating vendor proposals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Contract compliance monitoring$q$, $q$Monitors vendor contracts for compliance issues.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Usage and overlap detection$q$, $q$Identifies underused or overlapping software licenses across the organization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Vendor management and intake workflows$q$, $q$Manages vendor requests and intake for new purchases.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Founded in 2019 with disclosed funding history (Seed, Series A, Series B)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Over 75 integrations listed, including Salesforce, Oracle, Ironclad, Okta, Coupa, and Workday$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$AI agents (Renewal Agent, Proposal Agent) automate parts of the renewal and negotiation process$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Offers free tools such as savings analysis and negotiation playbooks alongside the paid platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Reports serving 500+ finance and procurement teams$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$No free tier for the core platform; requires a demo or trial request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$No public pricing disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Headquarters and company size (employee count) are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$When was Tropic founded?$q$, $q$Tropic was founded in 2019.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Does Tropic offer a free plan?$q$, $q$The core platform is not free; access requires a demo or trial request, though Tropic offers some free tools such as savings analysis and negotiation playbooks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$What systems does Tropic integrate with?$q$, $q$Tropic lists over 75 integrations, including Salesforce, Oracle, Ironclad, Okta, Coupa, QuickBooks, Google, Workday, and DocuSign.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$How does Tropic use AI?$q$, $q$Tropic uses AI agents, including a Renewal Agent and a Proposal Agent, along with agentic execution workflows and proactive insights for procurement tasks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Benchmarking software spend$q$, $q$Procurement teams use Tropic's pricing intelligence to see whether they are paying market rates for software.$q$, $q$Finance and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Automating renewals and negotiations$q$, $q$Teams use the Renewal Agent and Proposal Agent to manage contract renewals and vendor negotiations.$q$, $q$Procurement teams managing multiple vendor renewals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$Reducing software overlap$q$, $q$Organizations use usage and overlap detection to identify redundant or underused software licenses.$q$, $q$IT and finance teams managing SaaS stacks$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$overview$q$, $q$What is Tropic?$q$, 2, ARRAY[$q$Tropic, founded in 2019, is an AI-powered procurement platform that provides spend intelligence, negotiation support, and agentic automation to help companies manage and reduce software and vendor costs.$q$, $q$The platform includes pricing benchmarks, negotiation playbooks, an AI Renewal Agent and Proposal Agent, contract compliance monitoring, and usage/overlap detection. Tropic lists more than 75 integrations, including Salesforce, Oracle, Ironclad, Okta, Coupa, and Workday, and reports serving over 500 finance and procurement teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', $q$who-its-for$q$, $q$Who Tropic is for$q$, 2, ARRAY[$q$Tropic serves finance and procurement teams of all sizes, from small businesses without a dedicated procurement function to enterprises managing complex software and vendor stacks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6bc3cd59-7fc3-4389-bfc4-17fcf18c8ed8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sastrify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An AI-powered software management platform that gives IT and finance teams visibility into SaaS spend and shadow IT.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Sastrify is an AI-powered SaaS management platform for shadow IT detection, license optimization, and software cost savings.$q$,
  og_description = $q$Sastrify is an AI-powered SaaS management platform for shadow IT detection, license optimization, and software cost savings.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a1fdc49-4c8e-46b7-aa0e-d428cafa9212' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Shadow IT detection$q$, $q$Discovers software in use across the organization that IT and finance may not be tracking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Usage analytics and license optimization$q$, $q$Analyzes software usage to identify underused licenses and optimization opportunities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Risk management and compliance monitoring$q$, $q$Tracks vendor risk and compliance documentation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Intake-to-procure workflow automation$q$, $q$Automates the process of requesting and approving new software purchases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Renewal management$q$, $q$Sends automated alerts ahead of software contract renewals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Pricing benchmarks and negotiation support$q$, $q$Provides vendor pricing benchmarks to support negotiation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$AI co-pilot$q$, $q$An AI assistant that provides suggestions for software cost optimization.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Combines shadow IT discovery, usage analytics, and renewal management in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$AI co-pilot provides optimization suggestions and pricing benchmarks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Company claims 90% vendor visibility within 7 days and average savings of 30%$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Reports mapping over 15,000 vendors for pricing benchmarks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Available in English and German$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$No public pricing; no free or freemium tier mentioned$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Specific integrations are not detailed on the marketing site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Founding year, headquarters, and company size are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$What does Sastrify do?$q$, $q$Sastrify is an AI-powered software management platform that gives IT, procurement, and finance teams visibility into SaaS spend, detects shadow IT, and helps optimize software costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Does Sastrify have AI features?$q$, $q$Yes, Sastrify includes an AI co-pilot for software management that provides optimization suggestions and pricing benchmarks against vendor data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Is Sastrify pricing public?$q$, $q$No, Sastrify does not publish pricing; a pricing page exists but rates are not disclosed without contacting the company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$What savings does Sastrify claim?$q$, $q$Sastrify states customers can achieve 90% vendor visibility within 7 days and cites average savings of around 30%.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Discovering shadow IT$q$, $q$IT teams use Sastrify to find software purchased outside official procurement channels.$q$, $q$IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Optimizing software licenses$q$, $q$Finance and procurement teams identify underused licenses to cut unnecessary SaaS spend.$q$, $q$Finance and procurement teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$Managing renewals and vendor risk$q$, $q$Teams use automated renewal alerts and vendor risk/compliance tracking to avoid surprise costs.$q$, $q$Procurement and compliance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$overview$q$, $q$What is Sastrify?$q$, 2, ARRAY[$q$Sastrify is an AI-powered software management and procurement platform that gives organizations visibility into their software landscape, including shadow IT, usage patterns, and vendor risk.$q$, $q$It includes an AI co-pilot for optimization suggestions, pricing benchmarks drawn from a database the company says covers 15,000+ vendors, automated renewal alerts, and intake-to-procure workflow automation. The platform is available in English and German.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', $q$who-its-for$q$, $q$Who Sastrify is for$q$, 2, ARRAY[$q$Sastrify is built for IT, procurement, and finance teams that need to track software spend, uncover shadow IT, and reduce SaaS costs across their organization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a1fdc49-4c8e-46b7-aa0e-d428cafa9212', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Vertice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vertice is an AI-powered procurement platform that automates SaaS purchasing, negotiation, and spend management.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = $q$400+ employees$q$,
  headquarters = $q$London, UK$q$,
  languages = '{}',
  seo_meta_description = $q$Vertice review: AI procurement platform for intake-to-procure workflows, SaaS purchasing negotiation, and vendor spend benchmarking.$q$,
  og_description = $q$Vertice review: AI procurement platform for intake-to-procure workflows, SaaS purchasing negotiation, and vendor spend benchmarking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd50136a3-8630-4296-8f4b-59bd6b9e6dfe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Intake-to-Procure$q$, $q$Automated request capture, routing, and approval workflows for procurement requests.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$SaaS Purchasing$q$, $q$Expert-led negotiation support backed by pricing benchmarks across 32,000+ vendors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Vertice AI$q$, $q$AI agents trained to complete procurement tasks such as intake triage and vendor research.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Vendor Management$q$, $q$Vendor onboarding and supplier tracking in a central system of record.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Contract Management$q$, $q$Risk identification and renewal tracking across the contract lifecycle.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Budget and Risk Management$q$, $q$Modules for tracking departmental budgets and flagging procurement risk.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Pricing benchmark data spans 32,000+ vendors for negotiation leverage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Combines workflow automation with human-led SaaS negotiation services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Expanded scale after acquiring Vendr$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Used by companies including Santander, The AA, and ClearScore$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$No public pricing; requires booking a demo to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Aimed at mid-to-large enterprise procurement teams, not solo buyers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Savings and ROI figures are Vertice's own marketing claims$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$What is Vertice?$q$, $q$Vertice is an AI-powered procurement platform that automates purchasing workflows and combines SaaS spend benchmarking with expert-led vendor negotiation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Does Vertice publish its pricing?$q$, $q$No. Vertice does not list public pricing; prospective customers need to book a demo or contact sales for a quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Has Vertice acquired other companies?$q$, $q$Yes, Vertice has acquired Vendr, another SaaS spend management provider, expanding its scale.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Where is Vertice based?$q$, $q$Vertice is headquartered in London, UK, with additional offices including New York, Sydney, Johannesburg, Brno, and Linz.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$SaaS spend negotiation$q$, $q$Finance teams use Vertice's benchmarking data and negotiation service to reduce software costs.$q$, $q$Finance and procurement leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Centralizing purchase intake$q$, $q$Procurement teams route and approve purchase requests through a single intake-to-procure workflow.$q$, $q$Procurement teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$Vendor risk tracking$q$, $q$IT and security teams monitor vendor contracts for renewal dates and risk exposure.$q$, $q$IT and security leaders$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$overview$q$, $q$What is Vertice?$q$, 2, ARRAY[$q$Vertice is a procurement platform that automates purchasing workflows from intake through completion, combining request routing and approvals with vendor pricing benchmarks and contract management.$q$, $q$The platform pairs its software with a human negotiation service for SaaS purchases, using pricing data drawn from more than 32,000 vendors to help finance and procurement teams reduce software spend.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', $q$who-its-for$q$, $q$Who Vertice is for$q$, 2, ARRAY[$q$Vertice is built for finance, procurement, IT, security, and legal teams at mid-to-large enterprises that manage significant SaaS and cloud spend and want centralized intake, contract tracking, and negotiation support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d50136a3-8630-4296-8f4b-59bd6b9e6dfe', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── PayEm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$PayEm is a global spend and procurement platform combining PO creation, AP automation, and corporate cards for finance teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$New York, NY$q$,
  languages = '{}',
  seo_meta_description = $q$PayEm review: global spend and procurement platform with PO creation, AI invoice matching, corporate cards, and ERP integrations.$q$,
  og_description = $q$PayEm review: global spend and procurement platform with PO creation, AI invoice matching, corporate cards, and ERP integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9fb63e7-99e8-49e3-bc28-86d9d078e3d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$PO creation$q$, $q$Automates and customizes request and approval workflows, then creates purchase orders synced with the ERP.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$AP automation$q$, $q$Uses AI-powered OCR to match incoming invoices against their corresponding purchase orders automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Corporate cards$q$, $q$Issues virtual and physical corporate cards, including dedicated vendor cards for SaaS subscriptions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Spend controls$q$, $q$Sets spending limits, enforces policies, and monitors transactions in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$ERP integrations$q$, $q$Syncs with ERPs such as NetSuite to keep procurement and accounting data aligned.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Approval workflows in Slack and email$q$, $q$Routes requests and approvals through Slack and email in addition to the PayEm platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Cross-border payments$q$, $q$Supports cross-border payment and reconciliation for global vendor relationships.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Unifies procurement, AP automation, and corporate cards in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$AI-powered OCR automatically matches invoices to purchase orders$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Dedicated vendor cards give control over individual SaaS subscriptions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Syncs directly with NetSuite and other ERPs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$No public pricing; requires a sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Aimed at company-wide procurement and finance teams rather than solo users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Website provides limited self-serve product documentation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$What is PayEm?$q$, $q$PayEm is a global spend and procurement platform that automates the request-to-reconciliation process, combining purchase orders, AP automation, and corporate cards.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Does PayEm integrate with ERPs?$q$, $q$Yes, PayEm syncs purchase orders and spend data with ERPs such as NetSuite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Does PayEm use AI?$q$, $q$Yes, PayEm uses AI-powered OCR to automatically match invoices against their corresponding purchase orders.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Where is PayEm based?$q$, $q$PayEm is headquartered in New York, NY, and was founded in 2019.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Automating purchase orders$q$, $q$Procurement teams route requests through approval workflows that automatically generate ERP-synced POs.$q$, $q$Procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$AP invoice matching$q$, $q$Finance and AP teams use AI OCR to match vendor invoices to open purchase orders and reconcile spend.$q$, $q$Finance and accounts payable teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$Controlling SaaS vendor spend$q$, $q$Teams issue a dedicated virtual card per vendor to cap and track individual subscription costs.$q$, $q$IT and finance teams managing SaaS spend$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$overview$q$, $q$What is PayEm?$q$, 2, ARRAY[$q$PayEm is a global spend and procurement platform that automates the request-to-reconciliation process for finance and procurement teams, combining purchase order creation, AP automation, and corporate cards in one system.$q$, $q$The platform uses AI-powered OCR to match invoices against purchase orders automatically, and it syncs with ERPs such as NetSuite while routing approvals through Slack and email.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', $q$who-its-for$q$, $q$Who PayEm is for$q$, 2, ARRAY[$q$PayEm suits finance and procurement teams that want to consolidate purchase requests, invoice matching, vendor cards, and ERP-synced spend data into a single workflow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9fb63e7-99e8-49e3-bc28-86d9d078e3d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Soldo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Soldo is a UK-based spend management platform offering company cards, bank transfers, and automated expense tracking.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$£21/month + VAT$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$London, UK$q$,
  languages = ARRAY[$q$English$q$, $q$Italian$q$]::text[],
  seo_meta_description = $q$Soldo review: spend management with physical and virtual company cards, OCR receipt capture, and real-time budget controls.$q$,
  og_description = $q$Soldo review: spend management with physical and virtual company cards, OCR receipt capture, and real-time budget controls.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ce12cf9-c098-4e09-ae5e-0c9a0e32199a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Spend limits and approvals$q$, $q$Sets proactive spending limits and approval workflows before money leaves the business.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Cards and transfers$q$, $q$Issues physical and virtual debit/prepaid cards and supports outbound bank transfers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$OCR receipt capture$q$, $q$Mobile app automatically captures and matches receipts to transactions using OCR.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Real-time reporting$q$, $q$Gives finance teams real-time visibility into spend and budgets across teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Accounting integrations$q$, $q$Automates reconciliation with integrations into major accounting platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Multi-entity hierarchy$q$, $q$Manages wallets, teams, and role-based access across multiple entities or locations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Regulated as an Electronic Money Institution by the UK Financial Conduct Authority$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Serves 25,000+ businesses across 31 European countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Rated 'Excellent' on G2, Capterra, and Trustpilot$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Independent Forrester study found 358% ROI with under 6-month payback$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Entry-level Standard plan is capped at 3 users and 3 cards$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Unlimited plan requires a custom quote rather than listed pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Pricing is quoted in GBP plus VAT, which may complicate budgeting outside the UK/EU$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$What is Soldo?$q$, $q$Soldo is a spend management platform that combines company cards, bank transfers, and automated expense tracking with real-time budget controls.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$How much does Soldo cost?$q$, $q$Soldo's Standard plan starts at £21/month + VAT, Plus is £33/month + VAT, and Unlimited requires a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Is there a free trial?$q$, $q$Yes, Soldo offers a free 30-day trial across its plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Is Soldo regulated?$q$, $q$Yes, Soldo is regulated as an Electronic Money Institution by the UK's Financial Conduct Authority, with additional entities in Italy and Ireland.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Decentralized team spending$q$, $q$Finance leaders issue cards with preset limits to teams or locations while keeping central control.$q$, $q$CFOs and finance leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Automated receipt reconciliation$q$, $q$Employees capture receipts via mobile app, which Soldo matches to card transactions using OCR.$q$, $q$Operations and finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Multi-entity budget management$q$, $q$Organizations with multiple entities or countries manage separate wallets and role-based access.$q$, $q$Multi-entity or multi-country businesses$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Standard$q$, $q$£21/month + VAT$q$, $q$monthly$q$, $q$["1 wallet, 3 users, 3 cards","Up to 20 outbound bank transfers/month","Basic spend management and receipt capture","Accounting software integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Plus$q$, $q$£33/month + VAT$q$, $q$monthly$q$, $q$["3 company wallets, 3 users, 3 cards","Up to 30 outbound bank transfers/month","Multi-currency spending","OCR receipt capture","Amazon Business integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$Unlimited$q$, $q$Custom$q$, NULL, $q$["Unlimited wallets, users, and cards","Unlimited bank transfers","Role-based access and controls at scale","100+ software integrations","Dedicated Customer Success team"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$overview$q$, $q$What is Soldo?$q$, 2, ARRAY[$q$Soldo is a spend management platform that gives businesses physical and virtual company cards alongside bank transfers, with proactive spending limits and approval workflows to control company spend before it happens.$q$, $q$The platform automates expense capture through OCR receipt scanning, provides real-time reporting, and is regulated as an Electronic Money Institution by the UK's Financial Conduct Authority.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', $q$who-its-for$q$, $q$Who Soldo is for$q$, 2, ARRAY[$q$Soldo is aimed at CFOs, finance leaders, and operations teams at small-to-enterprise businesses that need to decentralize spending across teams or locations while retaining central visibility and control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ce12cf9-c098-4e09-ae5e-0c9a0e32199a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Found ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Found is a US business banking platform combining checking, bookkeeping, tax estimates, and contractor payments for the self-employed.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$San Francisco, CA$q$,
  languages = '{}',
  seo_meta_description = $q$Found review: free business checking with automatic bookkeeping, tax write-offs, invoicing, and contractor payments.$q$,
  og_description = $q$Found review: free business checking with automatic bookkeeping, tax write-offs, invoicing, and contractor payments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '22c9265b-8d90-4eb5-973c-a18df96a2516';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '22c9265b-8d90-4eb5-973c-a18df96a2516' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Business checking$q$, $q$Online business checking account with a Mastercard business debit card, check deposits, and wires.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Automatic bookkeeping$q$, $q$Categorizes expenses automatically and generates financial reports with custom tags and rules.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Tax tools$q$, $q$Calculates automatic write-offs, tax estimates, and generates tax forms including 1099-NEC filings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Contractor payments$q$, $q$Pays an unlimited number of contractors with no per-contractor fees and collects W-9s automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Team cards$q$, $q$Issues team debit cards with spend controls for up to 10 physical and 20 virtual cards.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$AI assistant$q$, $q$A beta AI feature lets users query their finances and delegate certain financial tasks.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Free Core plan with no monthly fee, minimum balance, or credit check$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Combines banking, bookkeeping, and tax tools in a single app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Unlimited contractor payments with no per-contractor fees and free 1099-NEC generation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Rated 4.8 on the App Store (26K+ ratings) and 4.7 on Google Play (16K+ reviews)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Banking services are provided by a third-party bank (Lead Bank), not Found directly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Higher APY, cash back, and a dedicated account manager require the paid Found Plus or Pro tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$AI assistant is still in beta$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Is Found free to use?$q$, $q$Found's Core plan is free, with optional paid Found Plus ($35/month) and Found Pro ($80/month) tiers for higher interest rates and extra features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Does Found charge fees for paying contractors?$q$, $q$No, Found offers unlimited contractor payments with no per-contractor fees and free 1099-NEC generation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Is Found a bank?$q$, $q$No, Found is a financial technology company; banking services are provided by Lead Bank, a member FDIC institution.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$What tax tools does Found include?$q$, $q$Found automatically tracks write-offs, estimates taxes, tracks mileage, and generates tax forms including 1099-NEC filings for contractors.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Consolidating banking and bookkeeping$q$, $q$Self-employed business owners manage checking, expense categorization, and reporting in one app.$q$, $q$Solopreneurs and self-employed business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Tax preparation$q$, $q$Freelancers track automatic write-offs and quarterly tax estimates throughout the year.$q$, $q$Freelancers and contractors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Paying contractors$q$, $q$Small businesses pay an unlimited number of contractors and generate 1099-NEC forms without per-payment fees.$q$, $q$Small businesses that hire contractors$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Core$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Business checking account","Automatic bookkeeping and expense tracking","Unlimited invoicing","Contractor payments with no per-contractor fees"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Found Plus$q$, $q$$35/month or $315/year$q$, $q$monthly$q$, $q$["1.50% APY on balances up to $20,000","All Core features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$Found Pro$q$, $q$$80/month or $720/year$q$, $q$monthly$q$, $q$["2.50% APY on all balances, no cap","1% cash back on qualifying card transactions","Dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$overview$q$, $q$What is Found?$q$, 2, ARRAY[$q$Found is a business banking platform that pairs an online business checking account with built-in bookkeeping, tax estimation, invoicing, and contractor payment tools in a single app.$q$, $q$The free Core plan includes checking, automatic expense categorization, and unlimited contractor payments, while paid Found Plus and Found Pro tiers add higher APY, cash back, and a dedicated account manager.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', $q$who-its-for$q$, $q$Who Found is for$q$, 2, ARRAY[$q$Found is built for self-employed individuals, freelancers, and small business owners who want banking, bookkeeping, and tax preparation combined into one platform instead of stitching together separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22c9265b-8d90-4eb5-973c-a18df96a2516', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Lili ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lili is a US business banking platform offering fee-free checking, high-yield savings, and integrated bookkeeping tools.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY$q$,
  languages = '{}',
  seo_meta_description = $q$Lili review: no-fee business checking, high-yield savings up to 4.00% APY, and built-in bookkeeping and tax tools.$q$,
  og_description = $q$Lili review: no-fee business checking, high-yield savings up to 4.00% APY, and built-in bookkeeping and tax tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a9a8cf9-4012-4a32-af0c-34784bc34030';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a9a8cf9-4012-4a32-af0c-34784bc34030' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Business checking$q$, $q$Core account with no monthly fee and a Visa business debit card.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$High-yield savings$q$, $q$Savings feature offering up to 4.00% APY on balances up to $1M with no minimums or lockups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Extended FDIC coverage$q$, $q$FDIC insurance up to $3M through a sweep network of partner banks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Payments$q$, $q$Express ACH transfers and international wires in 130+ currencies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Business credit$q$, $q$Access to business lines of credit up to $250,000.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Bookkeeping and invoicing$q$, $q$Built-in invoicing, bill pay, bookkeeping, and tax preparation tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Integrations$q$, $q$Connects with QuickBooks, Xero, Stripe, Shopify, and Gusto.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Core checking account has no monthly fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Serves over 200,000 businesses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Rated 4.7/5 on Trustpilot from 3,900+ reviews$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Live customer support available 7 days a week$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Pricing for the paid Pro, Smart, and Premium tiers is not publicly disclosed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Banking services are provided by a partner bank (Sunrise Banks, N.A.), not Lili directly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Specific savings APY tiers and requirements are not fully detailed on the homepage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Is Lili a bank?$q$, $q$No, Lili is a financial technology company; banking services are provided by Sunrise Banks, N.A., a member FDIC institution.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Does Lili charge monthly fees?$q$, $q$The Core account has no monthly fee; Pro, Smart, and Premium tiers carry fees that are not disclosed on the homepage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$How much can I earn with Lili savings?$q$, $q$Lili advertises up to 4.00% APY on savings balances up to $1M with no minimums or lockups.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$What accounting tools does Lili integrate with?$q$, $q$Lili integrates with QuickBooks, Xero, Stripe, Shopify, and Gusto.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Fee-free business banking$q$, $q$Small business owners open a no-monthly-fee checking account with a Visa debit card.$q$, $q$Solopreneurs and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Earning yield on cash reserves$q$, $q$Businesses hold operating cash in a high-yield savings account with extended FDIC coverage.$q$, $q$Businesses managing cash reserves$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$International payments$q$, $q$Businesses send international wires in 130+ currencies alongside domestic ACH transfers.$q$, $q$Businesses with international vendors or clients$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Core$q$, $q$$0/month$q$, $q$monthly$q$, $q$["No monthly fee","Visa business debit card"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Pro$q$, NULL, $q$monthly$q$, $q$[]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Smart$q$, NULL, $q$monthly$q$, $q$[]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$Premium$q$, NULL, $q$monthly$q$, $q$[]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$overview$q$, $q$What is Lili?$q$, 2, ARRAY[$q$Lili is a business banking platform offering a no-fee Core checking account alongside high-yield savings, extended FDIC coverage, and access to business lines of credit up to $250,000.$q$, $q$The platform also includes invoicing, bill pay, bookkeeping, and tax preparation tools, with integrations into QuickBooks, Xero, Stripe, Shopify, and Gusto.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', $q$who-its-for$q$, $q$Who Lili is for$q$, 2, ARRAY[$q$Lili is designed for small business owners and entrepreneurs, from solopreneurs to scaling companies, who want fee-free banking combined with bookkeeping and tax tools in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a9a8cf9-4012-4a32-af0c-34784bc34030', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bluevine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bluevine is a US digital business banking platform offering fee-free checking, tiered APY, and lines of credit.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bluevine review: business checking with up to 3.0% APY, lines of credit up to $250,000, and invoicing with Tap to Pay.$q$,
  og_description = $q$Bluevine review: business checking with up to 3.0% APY, lines of credit up to $250,000, and invoicing with Tap to Pay.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7e483d96-1e11-493c-b7e9-c3b377066d91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7e483d96-1e11-493c-b7e9-c3b377066d91' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Business checking$q$, $q$Digital checking account with tiered APY and no monthly fee on the Standard plan.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Lines of credit$q$, $q$Access to business lines of credit up to $250,000 or term loans up to $500,000 through lending partners.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Invoicing and payment links$q$, $q$Manage invoices and accept payments via shareable payment links.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Tap to Pay$q$, $q$In-person card payments powered by Stripe.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Accounts payable automation$q$, $q$Automates money movement and bill payments for the business.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Security$q$, $q$Two-factor authentication, data encryption, and real-time fraud alerts.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Standard plan has no monthly fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Premier plan offers up to 3.0% APY with no balance cap$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$FDIC insurance protection up to $3 million$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Better Business Bureau A+ rating$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Plus and Premier plans carry monthly fees ($30 and $95) unless waived$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Standard plan's APY requires meeting card spend or deposit thresholds$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Lending products are issued through third-party bank partners, not Bluevine directly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Does Bluevine charge monthly fees?$q$, $q$The Standard plan has no monthly fee; the Plus ($30/month) and Premier ($95/month) plans carry fees that can be waived under certain conditions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$What interest rate does Bluevine offer?$q$, $q$Bluevine offers tiered APY ranging from 1.3% on the Standard plan up to 3.0% uncapped on the Premier plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Can I get a business loan through Bluevine?$q$, $q$Yes, Bluevine offers lines of credit up to $250,000 or term loans up to $500,000 through lending partners.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Does Bluevine support in-person payments?$q$, $q$Yes, Bluevine offers Tap to Pay for in-person card payments, powered by Stripe.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Fee-free checking with interest$q$, $q$Small businesses open a no-monthly-fee checking account that earns tiered interest.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Accessing working capital$q$, $q$Businesses apply for a line of credit or term loan to fund growth or cover cash flow gaps.$q$, $q$Businesses needing working capital$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Accepting in-person payments$q$, $q$Businesses use Tap to Pay to accept card payments in person via Stripe.$q$, $q$Businesses with in-person sales$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Standard$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1.3% APY up to $250,000 in eligible balances","Requires $500/month card spend or $2,500/month in customer payments","No overdraft fees","Unlimited transactions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Plus$q$, $q$$30/month$q$, $q$monthly$q$, $q$["1.75% APY up to $250,000, no eligibility requirements","Discounts on standard payment fees"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$Premier$q$, $q$$95/month$q$, $q$monthly$q$, $q$["3.0% APY on all balances, no cap","Advanced ACH debit controls","Preauthorized payees"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$overview$q$, $q$What is Bluevine?$q$, 2, ARRAY[$q$Bluevine is a digital business banking platform offering checking accounts with tiered interest rates, lines of credit and term loans through lending partners, invoicing, and in-person payment acceptance via Tap to Pay.$q$, $q$The Standard plan has no monthly fee, while Plus and Premier plans raise the available APY in exchange for a monthly fee that can be waived under certain conditions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', $q$who-its-for$q$, $q$Who Bluevine is for$q$, 2, ARRAY[$q$Bluevine targets small businesses in the United States looking for a digital-first alternative to traditional business banking, with access to working capital and interest-earning checking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7e483d96-1e11-493c-b7e9-c3b377066d91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Arc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Arc is a cash management and capital markets platform for technology companies, offering yield, cards, and debt financing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$San Francisco, CA and New York, NY$q$,
  languages = '{}',
  seo_meta_description = $q$Arc review: cash management platform for tech companies with brokerage yield, a business card, and AI-powered CFO tools.$q$,
  og_description = $q$Arc review: cash management platform for tech companies with brokerage yield, a business card, and AI-powered CFO tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b1475af-f4bc-459d-ac77-e29162361ec3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Cash management$q$, $q$Treasury dashboard for managing operating cash and brokerage balances in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Yield on cash$q$, $q$Brokerage net yield ranging up to roughly 4.6% depending on the membership tier.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Business card$q$, $q$Card with cashback rewards that scale from 1.0% to 2.0% by tier.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Debt capital raising$q$, $q$Marketplace and tools for raising venture debt directly through the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$CFO Agent$q$, $q$AI-powered assistant for financial tasks, with unlimited access on the Premium tier.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Free Essentials tier requires no paid membership to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Enterprise tier offers up to roughly 4.57% net yield and 2.0% cashback$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Unlimited AI CFO Agent access included on the Premium tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Combines cash management, a business card, and debt fundraising in one platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Higher yield and cashback tiers require a paid annual membership$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Axos Financial announced an agreement to acquire Arc in July 2026, which may bring platform changes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Specific account minimums and fees are not disclosed on the pricing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$What is Arc?$q$, $q$Arc is a cash management and capital markets platform for technology companies, offering brokerage yield, a business card, debt capital raising, and AI-powered financial tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Is Arc free to use?$q$, $q$Arc offers a free Essentials tier, with paid Premium and Enterprise tiers unlocking higher yield, more cashback, and dedicated support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Is Arc being acquired?$q$, $q$Yes, Axos Financial announced a definitive agreement in July 2026 to acquire Arc Technologies, Inc.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$What is Arc's CFO Agent?$q$, $q$CFO Agent is Arc's AI-powered financial assistant; Premium members get unlimited access.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Managing idle cash for yield$q$, $q$Tech companies hold operating cash in Arc's brokerage sweep to earn a net yield instead of sitting idle.$q$, $q$Startups and technology companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Raising venture debt$q$, $q$Finance teams use Arc's debt marketplace to raise capital directly through the platform.$q$, $q$Finance teams at venture-backed companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$AI-assisted finance tasks$q$, $q$Teams use the CFO Agent to handle financial tasks and questions through an AI assistant.$q$, $q$Finance teams wanting AI assistance$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Essentials$q$, $q$Free$q$, NULL, $q$["Up to 4.12% net yield on brokerage","1.0% cashback on card spending","Core cash management and treasury features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Premium$q$, $q$Custom (annual membership)$q$, $q$annual$q$, $q$["Up to 4.52% net yield on brokerage","1.5% cashback on card spending","Dedicated relationship manager","Unlimited CFO Agent access","Reduced Debt Marketplace fees"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$Enterprise$q$, $q$Custom (annual membership)$q$, $q$annual$q$, $q$["Up to 4.57% net yield on brokerage","2.0% cashback on card spending","Dedicated support team","Customized implementation"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$overview$q$, $q$What is Arc?$q$, 2, ARRAY[$q$Arc is a cash management and capital markets platform built for technology companies, combining brokerage yield on idle cash, a business card, and tools for raising venture debt in one dashboard.$q$, $q$Arc offers a free Essentials tier plus paid Premium and Enterprise membership tiers that unlock higher yield, more cashback, and access to its AI-powered CFO Agent. In July 2026, Axos Financial announced a definitive agreement to acquire Arc.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', $q$who-its-for$q$, $q$Who Arc is for$q$, 2, ARRAY[$q$Arc is aimed at startups and technology companies that want to earn yield on operating cash, raise debt capital, and get AI-assisted financial support without stitching together multiple treasury tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b1475af-f4bc-459d-ac77-e29162361ec3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pipe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pipe is an embedded financial operating system that lets software platforms offer capital and payment tools to their business customers.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$Miami, FL$q$,
  languages = '{}',
  seo_meta_description = $q$Pipe review: embedded financial OS letting SaaS platforms offer their customers capital based on transaction data.$q$,
  og_description = $q$Pipe review: embedded financial OS letting SaaS platforms offer their customers capital based on transaction data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '61d2abfe-020b-44ad-8493-bab43284c852';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '61d2abfe-020b-44ad-8493-bab43284c852' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Embedded capital offers$q$, $q$Generates pre-approved capital offers for platform customers based on their transaction data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Sales-based repayment$q$, $q$Repayment scales with sales activity, with no fixed monthly minimums.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Low-code embedding$q$, $q$Integrates into a partner's product with a small number of code snippets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Industry-specific risk models$q$, $q$Tailors underwriting to different platform types, including vertical SaaS, payment facilitators, and marketplaces.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Partner analytics$q$, $q$Reports activation rate, conversion rate, and customer growth metrics to partners.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Reports a 61% average conversion rate and an 80 Net Promoter Score across partners$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Used by known partners including Uber Eats, GoCardless, and Housecall Pro$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Sales-based repayment avoids fixed monthly minimums for end customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Designed for quick embedding with minimal code$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Pricing is not publicly disclosed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Built for platforms to embed, not something an individual business signs up for directly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Requires a partnership and sales engagement to implement$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$What is Pipe?$q$, $q$Pipe is an embedded financial operating system that lets software platforms offer capital and payment tools to their business customers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Who uses Pipe?$q$, $q$Pipe is used by vertical SaaS platforms, payment facilitators, and marketplaces, with partners including Uber Eats, GoCardless, and Housecall Pro.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$How does repayment work?$q$, $q$Pipe's capital product uses sales-based repayment tied to a business's transaction volume, with no fixed monthly minimums.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Where is Pipe headquartered?$q$, $q$Pipe Technologies Inc. is headquartered in Miami, Florida, and was founded in 2019.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Embedding capital in a SaaS product$q$, $q$Vertical SaaS platforms embed Pipe's capital offers directly into their product for customers.$q$, $q$Vertical SaaS platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Boosting payment facilitator retention$q$, $q$Payment facilitators offer embedded financial tools to increase customer retention and revenue.$q$, $q$Payment facilitators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$Marketplace seller financing$q$, $q$Marketplaces offer embedded capital to sellers to increase loyalty and platform usage.$q$, $q$Marketplace operators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$overview$q$, $q$What is Pipe?$q$, 2, ARRAY[$q$Pipe is an embedded financial operating system that software platforms integrate into their own products so they can offer capital and payment tools to their business customers.$q$, $q$The platform generates pre-approved capital offers based on a customer's transaction data, with sales-based repayment and no fixed monthly minimums, and it applies industry-specific risk models for vertical SaaS, payment facilitators, and marketplaces.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', $q$who-its-for$q$, $q$Who Pipe is for$q$, 2, ARRAY[$q$Pipe is built for software platforms — vertical SaaS products, payment facilitators, and marketplaces — that want to embed financial tools for their end customers rather than for individual businesses signing up directly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61d2abfe-020b-44ad-8493-bab43284c852', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Capchase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Capchase is a vendor financing platform that pays B2B tech vendors upfront while buyers pay for software over time.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$New York, NY$q$,
  languages = '{}',
  seo_meta_description = $q$Capchase review: vendor financing for B2B tech, with instant underwriting and Salesforce-embedded deal workflows.$q$,
  og_description = $q$Capchase review: vendor financing for B2B tech, with instant underwriting and Salesforce-embedded deal workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53147b31-f2fc-40d8-abf5-b79accdf962a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53147b31-f2fc-40d8-abf5-b79accdf962a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Instant underwriting$q$, $q$Decisions roughly 97% of applications within 30 seconds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Salesforce integration$q$, $q$Embeds buyer qualification and loan document generation directly into Salesforce.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Flexible payment terms$q$, $q$Offers monthly, quarterly, or extended installment terms for buyers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Multi-party deal management$q$, $q$Collaboration portal for deals involving vendors, buyers, and channel partners.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Automated billing$q$, $q$Automates billing and offers buy-now-pay-later style options for financed purchases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Multi-currency coverage$q$, $q$Supports financing across 9 countries in multiple currencies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Fast underwriting, with most applications decisioned within 30 seconds$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Embeds directly into Salesforce sales workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Supports multi-currency financing across 9 countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Reports a 25% increase in client deal win rates$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Pricing is not publicly disclosed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Financing is aimed at enterprise vendors and buyers, not individual consumers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Requires sales engagement to set up vendor financing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$What is Capchase?$q$, $q$Capchase is a vendor financing platform that lends directly to buyers and pays B2B tech vendors upfront, letting buyers pay over time.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$How fast is Capchase's underwriting?$q$, $q$Capchase states that about 97% of applications receive a decision within 30 seconds.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Does Capchase integrate with Salesforce?$q$, $q$Yes, Capchase embeds buyer qualification and loan document generation into Salesforce.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Where is Capchase based?$q$, $q$Capchase was founded in Boston in 2020 and is now headquartered in New York, NY, with additional offices.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Increasing deal velocity$q$, $q$Sales teams offer buyers financing to close enterprise deals faster.$q$, $q$Sales teams at tech vendors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Getting paid upfront$q$, $q$Finance departments receive upfront payment on contracts that buyers pay off over time.$q$, $q$Finance teams at software or hardware vendors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$Multi-party deal financing$q$, $q$Channel partners and resellers manage financed deals involving multiple parties through a shared portal.$q$, $q$Channel partners and resellers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$overview$q$, $q$What is Capchase?$q$, 2, ARRAY[$q$Capchase is a vendor financing platform for B2B software and hardware purchases: it lends directly to buyers, pays vendors upfront, and lets buyers repay over flexible monthly, quarterly, or extended terms.$q$, $q$The platform embeds into Salesforce for buyer qualification and loan document generation, offers instant underwriting decisions, and supports multi-party deals with channel partners and resellers across 9 countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', $q$who-its-for$q$, $q$Who Capchase is for$q$, 2, ARRAY[$q$Capchase is built for B2B tech vendor sales and finance teams that want to close larger deals faster by offering buyers financing, while still getting paid in full upfront.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53147b31-f2fc-40d8-abf5-b79accdf962a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Founderpath ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Founderpath provides non-dilutive revenue financing, term loans, and merchant cash advances to software and CPG founders.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Founderpath offers non-dilutive revenue financing, term loans, and cash advances so founders raise capital without giving up equity.$q$,
  og_description = $q$Founderpath offers non-dilutive revenue financing, term loans, and cash advances so founders raise capital without giving up equity.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '806674db-f3e6-419b-a6a4-aa3e4199d96e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '806674db-f3e6-419b-a6a4-aa3e4199d96e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Revenue financing$q$, $q$Discount rates starting from 7% for companies with $1M-$3M ARR, with funding available in as little as 24 hours.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Term loans$q$, $q$Interest rates starting from 15% for companies with $3M+ revenue, with repayment terms of up to 4 years.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Merchant cash advance$q$, $q$Repayment set from 5% of monthly revenue, designed for seasonal businesses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Data-driven underwriting$q$, $q$Qualification is based on business data rather than a pitch deck, with fast underwriting in 24-48 hours.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$No personal guarantees or board seats$q$, $q$Financing is secured by a lien on business assets only, without personal guarantees, board seats, or warrants.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Early repayment without penalty$q$, $q$Founders can repay financing early without incurring additional penalty fees.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Non-dilutive capital that preserves founder equity$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Funding decisions and disbursement can happen within 24-48 hours$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$No personal guarantees, board seats, or warrants required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Multiple financing structures (revenue financing, term loans, cash advances) for different business stages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$4.9/5 rating on Trustpilot from over 113 verified founder reviews$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Term loan interest rates start at 15%, which is high relative to traditional bank financing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Requires a minimum of $500K in last-year revenue to qualify$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Pricing and eligibility are underwriting-based rather than published as fixed plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Headquarters and team size are not disclosed on the website$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$What types of financing does Founderpath offer?$q$, $q$Founderpath offers revenue financing, term loans, and merchant cash advances, each structured differently depending on company revenue and business type.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Does Founderpath require equity or a pitch deck?$q$, $q$No. Founderpath uses data-driven underwriting instead of a pitch deck and provides non-dilutive capital that does not require giving up equity.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$How fast can I get funded?$q$, $q$Revenue financing can be funded in as little as 24 hours after underwriting is complete.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Who is eligible for Founderpath financing?$q$, $q$Founderpath targets software, brick-and-mortar, and CPG businesses with at least $500K in last-year revenue, healthy retention, and recurring or repeat revenue.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Are there penalties for paying off financing early?$q$, $q$No, Founderpath allows early repayment without penalty.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Growth financing for SaaS companies$q$, $q$SaaS founders use revenue financing to fund growth initiatives without diluting ownership.$q$, $q$SaaS founders with recurring revenue$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Acquisition and expansion loans$q$, $q$Founders use term loans to fund larger capital needs like acquisitions or expansion over multi-year repayment terms.$q$, $q$Founders of $3M+ revenue businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$Bridging seasonal cash flow$q$, $q$Seasonal CPG and brick-and-mortar businesses use merchant cash advances tied to a percentage of monthly revenue.$q$, $q$Seasonal or CPG business owners$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$overview$q$, $q$What is Founderpath?$q$, 2, ARRAY[$q$Founderpath is a financing platform that provides non-dilutive capital to founders through revenue financing, term loans, and merchant cash advances. Instead of requiring equity, a pitch deck, or personal guarantees, Founderpath underwrites deals using business data and discloses rates upfront.$q$, $q$The company, founded in 2021, has funded over 740 companies and deployed more than $271M to date, according to figures published on its site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', $q$who-its-for$q$, $q$Who Founderpath is for$q$, 2, ARRAY[$q$Founderpath is aimed at software, brick-and-mortar, and CPG business owners with at least $500K in last-year revenue and recurring or repeat revenue streams who want capital without giving up equity or control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('806674db-f3e6-419b-a6a4-aa3e4199d96e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Clearco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Clearco provides non-dilutive funding structures for DTC ecommerce and SaaS businesses without equity, personal guarantees, or liens.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Clearco offers non-dilutive funding for DTC ecommerce and SaaS brands, with fast approvals and no equity, personal guarantees, or liens.$q$,
  og_description = $q$Clearco offers non-dilutive funding for DTC ecommerce and SaaS brands, with fast approvals and no equity, personal guarantees, or liens.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dadc676c-ec7c-4645-a7c6-759360a99282';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dadc676c-ec7c-4645-a7c6-759360a99282' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Rolling and Fixed Funding Capacity$q$, $q$Businesses can draw non-dilutive capital through rolling or fixed funding structures based on their revenue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Cash Advance and Invoice Funding$q$, $q$Additional funding structures cover cash advances and invoice-based financing needs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Fast approvals$q$, $q$Clearco advertises approvals in as little as 24 hours using AI-supported underwriting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Capped weekly payments$q$, $q$Repayment schedules use capped weekly payments with transparent, foreseeable terms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Early payment option$q$, $q$Businesses can choose estimated 4, 5, or 6-month payment terms and pay early.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Platform integrations$q$, $q$Connects with Amazon, Stripe, BigCommerce, Square, Shopify, and PayPal to evaluate funding eligibility.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$No equity dilution, personal guarantees, or blanket liens required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Approvals advertised in as little as 24 hours$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Multiple funding structures to match different cash-flow needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Integrates directly with major ecommerce and payment platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Over $3B deployed to more than 10,000 funded brands, per company figures$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Requires 12+ months of consistent revenue and $100,000+ in monthly revenue to qualify$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Limited to businesses incorporated in the U.S. with a U.S. business bank account$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Specific rates and fees are not published and depend on underwriting$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$What types of businesses does Clearco fund?$q$, $q$Clearco funds DTC ecommerce brands and SaaS businesses with at least 12 months of consistent revenue.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$What is the minimum revenue requirement?$q$, $q$Businesses generally need $100,000+ in monthly revenue and U.S. incorporation with an active U.S. business bank account.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Does Clearco require equity or collateral?$q$, $q$No. Clearco funding is non-dilutive and does not require collateral or personal guarantees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$How fast can a business get funded?$q$, $q$Clearco states approvals can happen in as little as 24 hours using AI-supported underwriting.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$What platforms does Clearco integrate with?$q$, $q$Clearco integrates with Amazon, Stripe, BigCommerce, Square, Shopify, and PayPal.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Inventory and ad-spend funding for ecommerce brands$q$, $q$DTC ecommerce brands draw rolling or fixed funding capacity to finance inventory and marketing spend.$q$, $q$DTC ecommerce operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Non-dilutive growth capital for SaaS$q$, $q$SaaS businesses use funding structures to grow without giving up equity.$q$, $q$SaaS founders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$Smoothing cash flow with invoice funding$q$, $q$Businesses with outstanding invoices use invoice funding to access capital sooner.$q$, $q$B2B and ecommerce finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$overview$q$, $q$What is Clearco?$q$, 2, ARRAY[$q$Clearco provides non-dilutive funding for direct-to-consumer ecommerce and SaaS businesses through structures including Rolling Funding Capacity, Fixed Funding Capacity, Cash Advance, and Invoice Funding. The company says funding decisions can happen in as little as 24 hours using AI-supported underwriting.$q$, $q$Clearco reports having deployed over $3B to more than 10,000 funded brands, with a stated 65% customer repeat rate.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', $q$who-its-for$q$, $q$Who Clearco is for$q$, 2, ARRAY[$q$Clearco is built for U.S.-incorporated DTC ecommerce brands and SaaS businesses with at least 12 months of consistent revenue and $100,000+ in monthly revenue who want capital without diluting ownership.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dadc676c-ec7c-4645-a7c6-759360a99282', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Numeral ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Numeral automates sales tax compliance, including nexus monitoring, registration, filing, and remittance, for ecommerce and SaaS companies.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$75 per filing$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, California$q$,
  languages = '{}',
  seo_meta_description = $q$Numeral automates sales tax nexus monitoring, registration, filing, and remittance for ecommerce and SaaS businesses in the US and 80+ countries.$q$,
  og_description = $q$Numeral automates sales tax nexus monitoring, registration, filing, and remittance for ecommerce and SaaS businesses in the US and 80+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c9efa528-a016-40bf-b672-db270aa7c09d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c9efa528-a016-40bf-b672-db270aa7c09d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Nexus monitoring$q$, $q$24/7 monitoring that automatically flags and registers a business when it crosses new economic nexus thresholds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Tax filing and remittance$q$, $q$Automated return preparation and on-time payment processing across US states.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Tax calculation API$q$, $q$Real-time tax rate calculation for checkout integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Exemption certificate management$q$, $q$Collection, validation, and verification of customer exemption certificates, with a free tier for up to 50 certificates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Virtual mailboxes$q$, $q$Scans and helps respond to government tax correspondence on the business's behalf.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Compliance guarantee$q$, $q$Covers penalties and interest if Numeral misses a filing deadline.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Free Monitoring plan covers nexus auditing and alerting with no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$No long-term contracts; billing is month-to-month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Filing guarantee covers penalties and interest for missed deadlines$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Integrates with major ecommerce, billing, and accounting platforms including Stripe, Shopify, Amazon, and NetSuite$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Global coverage in 80+ countries available on the Pro plan$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Per-filing and per-registration fees can add up for sellers registered in many states$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Advanced features like exemption certificate management and API access require the custom-priced Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Founding year is not disclosed on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Some states charge separate registration fees on top of Numeral's fees$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Does Numeral have a free plan?$q$, $q$Yes. Numeral's Monitoring plan is free and includes nexus auditing, physical and economic nexus monitoring, and alerts when a business crosses into new states.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$How much does filing cost with Numeral?$q$, $q$The Standard plan charges $75 per filing and $150 per registration, billed month-to-month with no long-term contract.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$What does the Pro plan add?$q$, $q$The custom-priced Pro plan adds exemption certificate management, API access, voluntary disclosure agreements, sales tax expert access, and coverage in 80+ countries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$What integrations does Numeral support?$q$, $q$Numeral integrates with Stripe, Shopify, Amazon, Walmart, NetSuite, QuickBooks, eBay, WooCommerce, Orb, Chargebee, and other platforms.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$What happens if Numeral misses a filing deadline?$q$, $q$Numeral's compliance guarantee covers penalties and interest if a filing is missed.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Multi-state nexus monitoring$q$, $q$Ecommerce and SaaS companies use Numeral's free monitoring to track when they cross economic nexus thresholds in new states.$q$, $q$Finance teams at growing ecommerce and SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Automated filing and remittance$q$, $q$Businesses use the Standard plan to automate filing and remittance across all US states they're registered in.$q$, $q$Companies with multi-state sales tax obligations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Global tax compliance$q$, $q$Companies expanding internationally use the Pro plan for coverage across 80+ countries and exemption certificate management.$q$, $q$Global SaaS and ecommerce companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Monitoring$q$, $q$Free$q$, $q$monthly$q$, $q$["Nexus auditing","Physical and economic nexus monitoring","Alerts when crossing into new states"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Standard$q$, $q$$75 per filing / $150 per registration$q$, $q$monthly$q$, $q$["Filing and remittance across all states","Autofile and Autoregister","Virtual mailbox","Automatic tax code classification","Numeral Guarantee"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$Pro$q$, $q$Custom$q$, NULL, $q$["Everything in Standard","Exemption certificate management","API access","Voluntary disclosure agreements","Sales tax expert access","Global coverage in 80+ countries"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$overview$q$, $q$What is Numeral?$q$, 2, ARRAY[$q$Numeral is sales tax compliance software that automates nexus monitoring, registration, calculation, filing, and remittance for ecommerce and SaaS businesses across US jurisdictions and 80+ countries for VAT. It was founded by Sam Ross and Matt DuVall, a former Stripe and Notion engineer.$q$, $q$The platform is free for nexus monitoring and charges per filing and per registration on its Standard plan, with a custom-priced Pro plan for exemption certificates, API access, and global coverage.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', $q$who-its-for$q$, $q$Who Numeral is for$q$, 2, ARRAY[$q$Numeral is built for ecommerce brands and SaaS companies that need to track multi-state nexus and automate sales tax filing without a long-term contract.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9efa528-a016-40bf-b672-db270aa7c09d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Anrok ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Anrok is a global sales tax and VAT compliance platform covering nexus monitoring, registration, calculation, filing, and remittance.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$50/market/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Anrok automates global sales tax and VAT compliance for SaaS and ecommerce, from nexus monitoring to filing, across 100+ countries.$q$,
  og_description = $q$Anrok automates global sales tax and VAT compliance for SaaS and ecommerce, from nexus monitoring to filing, across 100+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06b10ebd-3c73-4f10-9bef-ad204412b1f3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Nexus monitoring and registration$q$, $q$Real-time monitoring of economic and physical nexus with automated registration across 100+ countries and 13,000+ US jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Real-time tax calculation$q$, $q$AI-powered tax calculation applied at checkout.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Automated filing and remittance$q$, $q$Handles filing and remittance across jurisdictions where a business is registered.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Reconciliation$q$, $q$Reconciles tax data across a company's financial systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Anrok Atlas AI assistant$q$, $q$An AI assistant that answers sales tax questions reasoned over a company's own account data and Anrok's tax knowledge base.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$40+ native integrations$q$, $q$Connects with billing, ERP, ecommerce, and HRIS platforms including Stripe, NetSuite, Salesforce, Zuora, Chargebee, QuickBooks, Workday, Shopify, and WooCommerce.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Starter plans available for both SaaS ($100/market/month) and ecommerce ($50/market/month)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Anrok Atlas AI assistant answers tax questions grounded in a company's own account data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$40+ native integrations across billing, ERP, ecommerce, and HRIS systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Claims less than 1% of returns require revisions versus a stated industry average of 3%$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Used by companies like Notion, Jasper, Vanta, and Anthropic, per case studies on the site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Per-market pricing means costs scale as a business expands into new tax jurisdictions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Advanced features (multi-entity management, priority support, SSO) require the custom-priced plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Founding year, headquarters, and team size are not disclosed on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$High-volume Starter plan sellers may incur additional fees$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$How much does Anrok cost?$q$, $q$Anrok's Starter plan is $100/market/month for SaaS companies and $50/market/month for ecommerce, with a per-market fee added for each new market activated. A Custom plan with volume-based pricing is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$What is Anrok Atlas?$q$, $q$Anrok Atlas is an AI assistant that answers sales tax questions using a company's own account data combined with Anrok's tax knowledge base.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$What jurisdictions does Anrok cover?$q$, $q$Anrok covers 100+ countries and more than 13,000 US tax jurisdictions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$What platforms does Anrok integrate with?$q$, $q$Anrok offers 40+ native integrations, including Stripe, NetSuite, Salesforce, Zuora, Chargebee, QuickBooks, Workday, Shopify, and WooCommerce.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Does Anrok support ecommerce, not just SaaS?$q$, $q$Yes, Anrok expanded to support physical goods and ecommerce sellers in addition to SaaS billing models.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Sales tax compliance for SaaS billing$q$, $q$SaaS companies use Anrok to monitor nexus and automate tax calculation, filing, and remittance tied to subscription billing.$q$, $q$SaaS finance and revenue teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$Multi-market ecommerce tax compliance$q$, $q$Ecommerce sellers use the ecommerce Starter plan to register and calculate tax as they expand into new markets.$q$, $q$Ecommerce operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$AI-assisted tax research$q$, $q$Finance teams use Anrok Atlas to get answers to sales tax questions grounded in their own account data.$q$, $q$In-house finance and tax teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$SaaS Starter$q$, $q$$100/market/month$q$, $q$monthly$q$, $q$["Global exposure monitoring","Real-time tax calculation","Filing and remittance","Exemption certificate management","Physical nexus tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$SaaS Custom$q$, $q$Custom, scales with transaction volume$q$, NULL, $q$["Everything in Starter","Advanced integrations","Multi-billing system support","Multi-entity management","Reconciliation tool","Anrok Atlas AI assistant","SSO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$eCommerce Starter$q$, $q$$50/market/month$q$, $q$monthly$q$, $q$["Registration","Real-time tax calculation","Filing and remittance","Exemption certificate management","Economic and physical nexus monitoring","Shopify and WooCommerce support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$eCommerce Custom$q$, $q$Custom, scales with transaction volume$q$, NULL, $q$["Same enhanced features as SaaS Custom"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$overview$q$, $q$What is Anrok?$q$, 2, ARRAY[$q$Anrok is a sales tax and VAT compliance platform that manages the full lifecycle of tax compliance, from nexus monitoring and registration to real-time calculation, filing, remittance, and reconciliation, across more than 100 countries and 13,000 US jurisdictions.$q$, $q$The platform includes Anrok Atlas, an AI assistant that answers tax questions using a company's own account data, and offers separate pricing plans for SaaS and ecommerce businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', $q$who-its-for$q$, $q$Who Anrok is for$q$, 2, ARRAY[$q$Anrok is aimed at fast-growing SaaS, ecommerce, and AI companies that need to manage sales tax and VAT compliance across many jurisdictions and billing systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06b10ebd-3c73-4f10-9bef-ad204412b1f3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Zamp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zamp is a managed sales tax compliance service combining software with a dedicated tax expert team for registrations, filings, and notices.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Miami, Florida$q$,
  languages = '{}',
  seo_meta_description = $q$Zamp combines software and a dedicated tax team to manage sales tax registrations, filings, calculations, and notices for growing businesses.$q$,
  og_description = $q$Zamp combines software and a dedicated tax team to manage sales tax registrations, filings, calculations, and notices for growing businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ca461870-55b1-4c9b-a8d8-8006576315c0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ca461870-55b1-4c9b-a8d8-8006576315c0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Rooftop-level tax calculations$q$, $q$Calculates sales tax accuracy down to the exact customer address.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Nexus assessment$q$, $q$Reviews where a business has sales tax obligations, included in the free plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Notice management$q$, $q$Handles resolution of state tax notices on the business's behalf.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$State registration handling$q$, $q$Manages state sales tax registrations for the business.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Dedicated tax specialists$q$, $q$Includes a team of tax specialists, including former auditors, for expert support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Canada tax coverage$q$, $q$The U.S. + Canada plan adds GST/HST/PST/QST calculations and Canadian filing and reporting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Free plan offers a nexus assessment, product taxability review, and a 30-minute expert consultation at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Two service models (fully managed "done for you" or reviewed "done with you") let businesses choose their level of involvement$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Dedicated tax specialists, including former auditors, support notice resolution$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Integrates with major platforms including Shopify, NetSuite, QuickBooks Online, Stripe, and Xero$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Reports $300M+ in sales tax remitted and 100K+ on-time filings$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Specific dollar pricing for the paid U.S. and U.S. + Canada plans is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Founding year and company size are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$SOC 2 compliance is listed as in progress rather than completed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Does Zamp have a free plan?$q$, $q$Yes, Zamp's free plan includes a nexus assessment, product taxability review, a 30-minute expert consultation, and API sandbox access.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$How much do Zamp's paid plans cost?$q$, $q$Zamp does not publish fixed prices for its U.S. and U.S. + Canada plans; pricing is scoped based on a business's footprint and compliance needs via a sales conversation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$What is the difference between 'done for you' and 'done with you'?$q$, $q$"Done for you" is a fully managed service, while "done with you" prepares filings for client review before submission.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Does Zamp support Canadian sales tax?$q$, $q$Yes, the U.S. + Canada plan adds GST/HST/PST/QST calculations and Canadian filing, reporting, and specialist support.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$What platforms does Zamp integrate with?$q$, $q$Zamp integrates with Adobe Commerce, BigCommerce, Microsoft Dynamics 365, NetSuite, QuickBooks Online, Shopify, Stripe, WooCommerce, Xero, and a proprietary API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Assessing sales tax exposure$q$, $q$Businesses use the free plan to get a nexus assessment and product taxability review before committing to a paid plan.$q$, $q$Finance teams evaluating tax exposure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Fully managed multi-state compliance$q$, $q$Growing digital businesses use the 'done for you' service so Zamp's team fully manages registrations and filings.$q$, $q$E-commerce and SaaS finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Notice resolution$q$, $q$Businesses facing state tax notices use Zamp's specialist team to manage and resolve them.$q$, $q$Companies with existing sales tax notices$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$Free$q$, $q$$0$q$, NULL, $q$["Nexus assessment","Product taxability review","30-minute expert consultation","API sandbox access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$U.S.$q$, $q$Custom$q$, NULL, $q$["Rooftop-accurate tax calculations","Nexus monitoring","Automated filings","Notice management","Dedicated tax expertise"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$U.S. + Canada$q$, $q$Custom$q$, NULL, $q$["All U.S. plan features","GST/HST/PST/QST calculations","Canadian filing and reporting","Canadian tax specialist support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$overview$q$, $q$What is Zamp?$q$, 2, ARRAY[$q$Zamp is a sales tax compliance service based in Miami, Florida, that pairs software with a dedicated team of tax specialists to handle registrations, filings, notices, and tax calculations for growing businesses.$q$, $q$The company offers a free plan with a nexus assessment and expert consultation, plus custom-priced U.S. and U.S. + Canada plans, and reports serving 1,200+ finance and accounting teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', $q$who-its-for$q$, $q$Who Zamp is for$q$, 2, ARRAY[$q$Zamp targets growing small-to-mid-size digital businesses in ecommerce, SaaS, and digital services that want a managed approach to sales tax compliance rather than handling filings entirely in-house.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ca461870-55b1-4c9b-a8d8-8006576315c0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── TaxJar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TaxJar automates sales tax calculation, reporting, and filing across sales channels, and is now owned by Stripe.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TaxJar automates sales tax calculations, reporting, and multi-state filing for ecommerce and SaaS sellers, backed by a 30-day free trial.$q$,
  og_description = $q$TaxJar automates sales tax calculations, reporting, and multi-state filing for ecommerce and SaaS sellers, backed by a 30-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Real-time sales tax calculations$q$, $q$Calculates sales tax in real time across sales channels.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$AutoFile$q$, $q$Automated filing and remittance of sales tax returns, with a set number of free AutoFile credits per plan per year.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Nexus insights$q$, $q$Tracks economic nexus and alerts sellers as they approach new state thresholds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$AI-driven product categorization$q$, $q$Uses AI to automatically categorize products for accurate tax treatment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$State registration assistance$q$, $q$Helps sellers register for sales tax permits in new states.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Flex fees$q$, $q$Allows temporary upgrades during high-sales months without a permanent plan change.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$30-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Acquired by Stripe in 2021, backing it with additional resources and integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Serves over 20,000 businesses across 11,000+ jurisdictions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$4.7/5 rating on G2 with multiple G2 awards including Highest User Adoption and Fastest Implementation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Reports 100% on-time filing rate in 2025 and 99.999% historical uptime$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Starter plan is capped at 200 orders/month and only 3 import integrations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Additional AutoFile credits cost $50-$55 each beyond the plan's free allotment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Headquarters location is not disclosed on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Phone support is limited to the higher-priced Professional plan$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Does TaxJar offer a free trial?$q$, $q$Yes, TaxJar offers a 30-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$How much does TaxJar cost?$q$, $q$The Starter plan is $39/month and the Professional plan is $99/month, both covering up to 200 orders/month, with a 10%+ discount for annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Who owns TaxJar?$q$, $q$TaxJar was acquired by Stripe in 2021 but continues to operate under the TaxJar name.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$What does AutoFile include?$q$, $q$AutoFile automates return preparation and filing; the Starter plan includes 2 free AutoFile credits per year and Professional includes 4, with additional credits available for a fee.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$What integrations does TaxJar support?$q$, $q$TaxJar integrates with Amazon, Shopify, WooCommerce, and offers a flexible API for custom integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Multichannel sales tax calculation$q$, $q$Multichannel sellers use TaxJar to calculate accurate sales tax across each of their sales channels.$q$, $q$Multichannel ecommerce sellers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Automated multi-state filing$q$, $q$Growing businesses use AutoFile to automate return preparation and filing across the states where they're registered.$q$, $q$Finance teams managing multi-state compliance$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Nexus threshold tracking$q$, $q$Sellers use nexus insights to get alerted before crossing economic nexus thresholds in new states.$q$, $q$Ecommerce and SaaS finance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Starter$q$, $q$$39/month$q$, $q$monthly$q$, $q$["Up to 200 orders/month","Up to 3 import integrations","2 free AutoFile credits per year","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Professional$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Up to 200 orders/month","Up to 10 total integrations","10,000 API calls/minute","4 free AutoFile credits per year","Email and phone support","Dedicated onboarding and Customer Success Manager"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$overview$q$, $q$What is TaxJar?$q$, 2, ARRAY[$q$TaxJar is a sales tax compliance platform, founded in 2013, that automates calculations, reporting, and multi-state filing for ecommerce and SaaS sellers. Stripe acquired TaxJar in 2021, and the product continues to operate under the TaxJar name.$q$, $q$TaxJar offers a 30-day free trial, followed by Starter ($39/month) and Professional ($99/month) plans, and reports serving more than 20,000 businesses across 11,000+ tax jurisdictions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$who-its-for$q$, $q$Who TaxJar is for$q$, 2, ARRAY[$q$TaxJar is built for small and mid-market multichannel sellers across retail, food and beverage, medical, SaaS, and services industries that need automated sales tax calculation and filing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Avalara ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Avalara automates tax calculation, filing, classification, and compliance management across 190+ countries and multiple tax types.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Avalara automates tax calculation, filing, and compliance across sales/use, VAT, communications, and property tax in 190+ countries.$q$,
  og_description = $q$Avalara automates tax calculation, filing, and compliance across sales/use, VAT, communications, and property tax in 190+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e671dda-5728-40ae-ba4d-0e752a749848' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Multi-tax-type calculation$q$, $q$Calculates sales/use, property, VAT, communications, and occupancy taxes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Automated returns and filing$q$, $q$Prepares and files tax returns automatically across jurisdictions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$E-invoicing and live reporting$q$, $q$Supports compliant e-invoicing and live tax reporting requirements.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Exemption certificate management$q$, $q$Manages collection and validation of customer exemption certificates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Business license registration$q$, $q$Helps businesses register for required business licenses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$AI-powered classification$q$, $q$Uses AI agents, described as trained on billions of real-world transactions via Avalara's ALFA AI foundry, for item and tariff code classification.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Covers tax compliance across 190+ countries and multiple tax types beyond just sales tax$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Over 1,400 partner integrations including Shopify, NetSuite, SAP, Salesforce, and Oracle$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$AI-powered classification for item and tariff codes via its ALFA AI foundry$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Serves segments from small business to enterprise across many industries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Reports 54B+ transactions processed annually with a stated 99.999% accuracy rate$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Pricing is not published; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Founding year, headquarters, and company size are not disclosed on the pages reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Enterprise-oriented feature set and integration breadth may be more than smaller businesses need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$How much does Avalara cost?$q$, $q$Avalara does not publish fixed pricing on its site; businesses need to contact sales for a quote based on their needs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$What tax types does Avalara support?$q$, $q$Avalara supports sales/use, property, VAT, communications, and occupancy tax calculation and compliance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Does Avalara use AI?$q$, $q$Yes, Avalara offers AI agents built on its ALFA AI foundry, which the company says incorporates 40+ models for tax calculation and item/tariff classification.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$What systems does Avalara integrate with?$q$, $q$Avalara has more than 1,400 partner integrations, including Shopify, Microsoft Dynamics, NetSuite, SAP, QuickBooks, Sage, Adobe Commerce, Salesforce, and Oracle.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$How many countries does Avalara cover?$q$, $q$Avalara says it can calculate, file, classify, and manage compliance across 190+ countries.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Enterprise multi-tax compliance$q$, $q$Enterprises use Avalara to manage sales/use, VAT, and other tax types across many jurisdictions from one platform.$q$, $q$Enterprise finance and tax teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$ERP-embedded tax calculation$q$, $q$Businesses embed Avalara's tax calculation into ERPs and billing systems like NetSuite, SAP, and Salesforce.$q$, $q$Companies running major ERP/billing platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$Automated item classification$q$, $q$Retailers and manufacturers use AI-powered classification to assign accurate tax and tariff codes to large product catalogs.$q$, $q$Retail and manufacturing businesses$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$overview$q$, $q$What is Avalara?$q$, 2, ARRAY[$q$Avalara is a tax compliance platform that automates calculation, filing, classification, and compliance management across sales/use, property, VAT, communications, and occupancy taxes in more than 190 countries.$q$, $q$The platform integrates with over 1,400 partner systems, including major ERPs and ecommerce platforms, and uses AI agents built on its ALFA AI foundry for classification and calculation tasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', $q$who-its-for$q$, $q$Who Avalara is for$q$, 2, ARRAY[$q$Avalara serves businesses of varying sizes, from small business to enterprise, across industries including retail, manufacturing, software, construction, hospitality, and accounting firms that need multi-jurisdiction tax compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e671dda-5728-40ae-ba4d-0e752a749848', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Quaderno ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Quaderno automates sales tax, VAT, and GST compliance and invoicing for online businesses across 12,000+ tax jurisdictions.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$]::text[],
  seo_meta_description = $q$Quaderno automates sales tax, VAT, and GST compliance, real-time rate calculation, and localized invoicing for online businesses.$q$,
  og_description = $q$Quaderno automates sales tax, VAT, and GST compliance, real-time rate calculation, and localized invoicing for online businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3daa81ad-63b3-4469-9a34-5214e31502af';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3daa81ad-63b3-4469-9a34-5214e31502af' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Tax registration tracking$q$, $q$Automatically tracks registration status and monitors nexus across jurisdictions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Real-time tax calculation$q$, $q$Calculates tax rates in real time across 12,000+ jurisdictions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Automated filing and reporting$q$, $q$Generates tax filing reports for over 12,000 jurisdictions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Localized invoicing$q$, $q$Auto-generates localized, tax-compliant invoices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Tax-compliant checkout$q$, $q$Integrates tax calculation directly into checkout flows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$API access$q$, $q$Provides an API for developers to build custom tax and invoicing workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$7-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Plans automatically upgrade to the next tier instead of charging surprise overage fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Lower-tier plans (Startup and above) include unlimited users, jurisdictions, and integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Integrates with WooCommerce, Shopify, Stripe, GoCardless, PayPal, and Kajabi$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Supports both English and Spanish$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Entry-level Hobby plan is capped at just 25 transactions/month and 1 jurisdiction$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Businesses over 2,500 transactions/month must contact sales for Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Does Quaderno offer a free trial?$q$, $q$Yes, Quaderno offers a 7-day free trial that doesn't require a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$How much does Quaderno cost?$q$, $q$Plans range from $29/month (Hobby, 25 transactions) to $149/month (Growth, 2,500 transactions), with custom Enterprise pricing above that.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$What happens if I exceed my plan's transaction limit?$q$, $q$Quaderno automatically upgrades the account to the next subscription tier rather than charging overage fees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$What counts as a transaction?$q$, $q$A transaction is any sale, refund, or purchase recorded within the app.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$What integrations does Quaderno support?$q$, $q$Quaderno integrates with WooCommerce, Shopify, Stripe, GoCardless, PayPal, and Kajabi, plus spreadsheet uploads and API access.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Tax compliance for digital creators$q$, $q$Digital creators use Quaderno to handle VAT/GST compliance and generate localized invoices for global customers.$q$, $q$Digital creators and small online sellers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Automated invoicing for SaaS$q$, $q$SaaS companies use Quaderno to auto-generate compliant invoices tied to subscription billing.$q$, $q$SaaS businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Multi-jurisdiction tax reporting for marketplaces$q$, $q$Marketplaces and platforms use Quaderno's unlimited-jurisdiction plans to manage tax reporting across many regions.$q$, $q$Marketplace and platform operators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Hobby$q$, $q$$29/month$q$, $q$monthly$q$, $q$["25 transactions/month","1 user","1 jurisdiction","1 integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Startup$q$, $q$$49/month$q$, $q$monthly$q$, $q$["250 transactions/month","Unlimited users","Unlimited jurisdictions","Unlimited integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1,000 transactions/month","Unlimited users","Unlimited jurisdictions","Unlimited integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Growth$q$, $q$$149/month$q$, $q$monthly$q$, $q$["2,500 transactions/month","Unlimited users","Unlimited jurisdictions","Unlimited integrations"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["For businesses with 2,500+ transactions/month"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$overview$q$, $q$What is Quaderno?$q$, 2, ARRAY[$q$Quaderno is worldwide tax compliance software for online businesses, automating sales tax, VAT, and GST compliance, real-time rate calculation, and invoicing across more than 12,000 tax jurisdictions.$q$, $q$The platform offers a 7-day free trial and tiered monthly plans from $29 to $149 based on transaction volume, with unlimited users, jurisdictions, and integrations on all but its entry-level plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', $q$who-its-for$q$, $q$Who Quaderno is for$q$, 2, ARRAY[$q$Quaderno is aimed at digital creators, ecommerce businesses, SaaS companies, platforms, marketplaces, and accountants who need tax-compliant invoicing and real-time tax calculation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3daa81ad-63b3-4469-9a34-5214e31502af', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Fonoa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fonoa is an AI-driven tax technology platform for global indirect tax, covering VAT/GST calculation, e-invoicing, and returns.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Dublin, Ireland$q$,
  languages = '{}',
  seo_meta_description = $q$Fonoa provides AI-driven infrastructure for global indirect tax: ID validation, tax calculation, e-invoicing, returns, and audit tools.$q$,
  og_description = $q$Fonoa provides AI-driven infrastructure for global indirect tax: ID validation, tax calculation, e-invoicing, returns, and audit tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3cfd8357-fdc8-4d45-99e4-e5c8d322206d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Validate$q$, $q$Tax ID validation across 120+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Tax Engine$q$, $q$Automated tax calculation in 100+ jurisdictions with sub-200ms response times.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$E-Invoicing$q$, $q$A unified API for compliant e-invoicing across 150+ countries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Tax Returns$q$, $q$Automated multi-country tax return filing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Knowledge$q$, $q$Real-time monitoring of tax legislation changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Audit$q$, $q$Tax data analysis tools to support audit readiness.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$API-first architecture covering the full indirect tax lifecycle: validation, calculation, e-invoicing, returns, and audit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Sub-200ms tax calculation response times, per the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Broad jurisdiction coverage: 120+ countries for ID validation and 150+ for e-invoicing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Reports 100% customer retention and a 4.6/5 Gartner Peer Insights rating$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Backed by recent growth, including a $110M raise and acquisition of PwC's Indirect Tax Edge$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Pricing is not published on the site; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$AI Agents product is not yet available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Founding year and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$How much does Fonoa cost?$q$, $q$Fonoa does not publish pricing on its site; businesses need to contact the company directly for a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$What does Fonoa's Tax Engine do?$q$, $q$Fonoa's Tax Engine automates tax calculation across 100+ jurisdictions with sub-200ms response times.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Does Fonoa support e-invoicing?$q$, $q$Yes, Fonoa offers a unified API for compliant e-invoicing across 150+ countries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Where is Fonoa headquartered?$q$, $q$Fonoa is registered and headquartered in Dublin, Ireland.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Is Fonoa's AI Agents product available now?$q$, $q$No, Fonoa's AI-driven compliance automation Agents product is listed as not yet available on its site.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Global e-invoicing compliance$q$, $q$Global businesses use Fonoa's E-Invoicing API to stay compliant across 150+ countries without building custom infrastructure per market.$q$, $q$Global finance and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Real-time indirect tax calculation$q$, $q$Companies embed Fonoa's Tax Engine into checkout or billing flows for real-time VAT/GST/sales tax calculation.$q$, $q$SaaS and marketplace platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$Multi-country tax return filing$q$, $q$Businesses use Fonoa's Tax Returns product to automate filing across multiple countries.$q$, $q$Global tax compliance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$overview$q$, $q$What is Fonoa?$q$, 2, ARRAY[$q$Fonoa is a Dublin, Ireland-based tax technology platform providing API-first infrastructure for global indirect tax, including tax ID validation, real-time tax calculation, e-invoicing, automated tax returns, legislation monitoring, and audit-readiness tools.$q$, $q$The company has raised $110M and acquired Indirect Tax Edge from PwC, and reports serving customers including Fin, Coda, Wellhub, and Remote.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', $q$who-its-for$q$, $q$Who Fonoa is for$q$, 2, ARRAY[$q$Fonoa is built for global businesses, including SaaS, marketplace, and platform companies, that need to automate indirect tax compliance such as VAT, GST, and e-invoicing across many jurisdictions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3cfd8357-fdc8-4d45-99e4-e5c8d322206d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Lago ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lago is an open-source billing platform for usage metering, invoicing, entitlements, and complex subscription pricing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Paris, France$q$,
  languages = '{}',
  seo_meta_description = $q$Lago is an open-source billing platform offering usage metering, invoicing, and revenue analytics for scaling any pricing model.$q$,
  og_description = $q$Lago is an open-source billing platform offering usage metering, invoicing, and revenue analytics for scaling any pricing model.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd422245-3239-421a-87c7-ef20ba5506e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd422245-3239-421a-87c7-ef20ba5506e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Usage metering$q$, $q$Real-time usage ingestion and metering to support flexible, consumption-based pricing models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Billing and invoicing$q$, $q$Automated invoice generation, credit notes, and support for progressive billing as an add-on.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Entitlements and plan management$q$, $q$Configure plans, entitlements, prepaid credits, coupons, and custom contracts for customers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Payment and accounting integrations$q$, $q$Connects to payment providers (Stripe, Adyen, GoCardless), accounting systems (NetSuite, Xero), and tax software (Avalara, Anrok).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Revenue analytics$q$, $q$Dashboards for tracking billing and revenue performance across customers and plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Dunning and alerting$q$, $q$Automatic dunning workflows and real-time alerts for usage and payment events.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Lago AI$q$, $q$AI-powered billing intelligence built into the platform.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Self-hosted or cloud deployment$q$, $q$Deployable via the open-source self-hosted edition or through Lago Cloud, avoiding vendor lock-in.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Open-source with a public GitHub repository (10,223+ stars), allowing self-hosting and code inspection$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$SOC 2 Type II certified with regular third-party penetration testing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Handles high scale, reportedly processing 1M events per second and $829M in invoices monthly (as of October 2025)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Broad integration ecosystem spanning payments, accounting, tax, CRM, data, and automation tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Supports hybrid pricing that combines subscriptions and usage-based billing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$No public pricing for Lago Premium/Cloud — requires contacting sales or booking a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Some features, such as progressive billing, tax integrations, dunning, and 24/7 support, are offered as paid add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Free usage is effectively limited to the self-hosted open-source edition, which requires infrastructure to run$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Is Lago open source?$q$, $q$Yes, Lago's code is open source and publicly available on GitHub, with over 10,223 stars, and can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Does Lago have a free plan?$q$, $q$Lago can be run for free via self-hosted open-source deployment. The Lago Premium/Cloud offering is quote-based, with pricing available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$What integrations does Lago support?$q$, $q$Lago integrates with payment providers like Stripe, Adyen, and GoCardless, accounting tools like NetSuite and Xero, tax software like Avalara and Anrok, CRMs like HubSpot and Salesforce, data platforms like S3 and ClickHouse, and automation tools like Zapier and n8n.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Is Lago secure and compliant?$q$, $q$Lago is SOC 2 Type II certified, undergoes regular third-party penetration tests, and supports SSO (including Okta), RBAC, and audit logs.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Can Lago be self-hosted?$q$, $q$Yes, Lago offers both self-hosted deployment (on-premises or in your own cloud) and a managed Lago Cloud option.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Usage-based billing for AI and API companies$q$, $q$Meter real-time usage and convert it into flexible, consumption-based invoices.$q$, $q$AI companies and API-first businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Compliant billing for fintechs and banks$q$, $q$Manage complex billing structures with the compliance controls needed in regulated financial services.$q$, $q$Fintechs and banks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Telecom and IoT usage billing$q$, $q$Handle high-volume, real-time usage metering and invoicing for connected devices and telecom services.$q$, $q$IoT and telecom providers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Self-hosted billing infrastructure$q$, $q$Deploy an open-source billing system in-house to avoid vendor lock-in and retain full data control.$q$, $q$Engineering teams that want to own their billing infrastructure$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Open Source (self-hosted)$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment on your own infrastructure","Access to Lago's open-source codebase on GitHub","Core billing and usage metering functionality"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$Lago Premium$q$, $q$Custom (contact sales)$q$, NULL, $q$["Billable metrics and usage ingestion with real-time alerts","Entitlements, plan configuration, customer portals, prepaid credits","Invoice generation, credit notes, and progressive billing (add-on)","Payment integrations, automatic dunning, analytics dashboard, AI assistants","API key permissions, RBAC, and SSO via Okta"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$overview$q$, $q$What is Lago?$q$, 2, ARRAY[$q$Lago is an open-source billing platform that gives teams transparency, control, and flexibility to manage and scale pricing models. It provides infrastructure for usage metering, invoicing, entitlements, and revenue analytics.$q$, $q$The platform supports hybrid pricing that combines subscriptions with usage-based billing, along with coupons, prepaid credits, and custom contracts. Lago can be deployed as a self-hosted open-source instance or through the managed Lago Cloud, and it is SOC 2 Type II certified.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', $q$who-its-for$q$, $q$Who Lago is for$q$, 2, ARRAY[$q$Lago is built for engineering and finance teams at AI companies, enterprises, fintechs, banks, and IoT/telecom providers that need complex, compliant billing without relying on a third-party black box or building billing infrastructure from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd422245-3239-421a-87c7-ef20ba5506e5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenMeter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, real-time usage metering and billing platform for usage-based pricing, now operating as part of Kong, Inc.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenMeter: open-source, real-time usage metering and billing for usage-based pricing, now part of Kong, Inc.$q$,
  og_description = $q$OpenMeter: open-source, real-time usage metering and billing for usage-based pricing, now part of Kong, Inc.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2df1bf37-9d52-4951-9c51-d887b5e883c4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2df1bf37-9d52-4951-9c51-d887b5e883c4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Real-time metering$q$, $q$Processes events at high throughput (millions of events per second) to track customer usage as it happens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Usage limits and gating$q$, $q$Enforces usage limits and quotas with low-latency checks on edge infrastructure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Flexible product catalog$q$, $q$Supports plans, credits, usage-based pricing, and commitments for structuring billable products.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Revenue insights$q$, $q$Surfaces expansion opportunities and identifies fast-growing customers from usage data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$CRM integration$q$, $q$Pushes revenue and usage signals into CRM platforms so sales teams can act on them.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Self-service billing changes$q$, $q$Lets teams deploy pricing changes in minutes without a full engineering cycle.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Open-source self-hosting$q$, $q$Available on GitHub under the Apache 2.0 license for teams that want to self-host instead of using the managed cloud.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$SOC2-compliant cloud$q$, $q$Cloud deployments are SOC2-compliant with role-based access control (RBAC) and single sign-on (SSO).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Open-source under Apache 2.0, so it can be self-hosted at no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Built for high-throughput, real-time event processing (millions of events per second)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$SOC2-compliant cloud offering with RBAC and SSO$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Integrates with common data infrastructure: Kubernetes, Amazon S3, OpenTelemetry, Stripe, and CRM platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Used in production by companies such as Trigger.dev, Beam, Requestly, and Traceloop$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Detailed cloud pricing tiers are not published; the pricing page directs visitors to contact sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$As of September 2025, OpenMeter was acquired by Kong, Inc., and its pricing page now routes signups through Kong Metering & Billing, which may signal future changes to the standalone product$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$No publicly stated founding year, headquarters, or team size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Is OpenMeter open source?$q$, $q$Yes, OpenMeter is available on GitHub under the Apache 2.0 license for self-hosted deployments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Does OpenMeter offer a free tier?$q$, $q$Yes, OpenMeter Cloud offers a free tier for getting started, alongside paid plans available by contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Who owns OpenMeter?$q$, $q$OpenMeter joined Kong, Inc. in September 2025. OpenMeter Cloud continues to operate for existing and new customers under this new ownership.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$What SDKs or languages does OpenMeter support?$q$, $q$OpenMeter provides SDKs/clients for TypeScript/Node.js, Python, and Go, plus a cURL-accessible REST API.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Is OpenMeter secure and compliant?$q$, $q$OpenMeter's cloud deployments are described as SOC2-compliant and support RBAC and SSO.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Metering AI and API usage for billing$q$, $q$Tracks per-event or per-token usage from APIs and AI products in real time to feed usage-based billing.$q$, $q$SaaS and AI product teams charging based on usage$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Enforcing usage limits and quotas$q$, $q$Applies low-latency usage gating so products can cut off or throttle access once a customer's quota is reached.$q$, $q$Product and engineering teams needing real-time quota enforcement$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Surfacing revenue expansion opportunities$q$, $q$Feeds usage trends into CRM systems to flag fast-growing accounts to sales and revenue operations.$q$, $q$Revenue operations and sales teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Apache 2.0 licensed","Self-hosted deployment","Available on GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Cloud Free Tier$q$, $q$Free$q$, NULL, $q$["Managed OpenMeter Cloud","Free tier to get started"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$Cloud / Enterprise$q$, $q$Contact sales$q$, NULL, $q$["SOC2-compliant deployment","RBAC and SSO","High-availability infrastructure"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$overview$q$, $q$What is OpenMeter?$q$, 2, ARRAY[$q$OpenMeter is an open-source usage metering and billing platform that turns events, logs, and metrics into billable revenue. It processes usage data in real time — at a scale of millions of events per second — so teams can track consumption, enforce usage limits, and power usage-based pricing.$q$, $q$The product is available both as a managed OpenMeter Cloud offering (SOC2-compliant, with RBAC and SSO) and as a self-hosted, open-source deployment under the Apache 2.0 license. In September 2025, OpenMeter joined Kong, Inc., though OpenMeter Cloud continues to serve existing and new customers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', $q$who-its-for$q$, $q$Who OpenMeter is for$q$, 2, ARRAY[$q$OpenMeter is aimed at developers, product teams, and revenue operations staff at SaaS, API, and AI companies that need to meter usage and bill for it — including teams that want to self-host via its open-source SDKs (TypeScript/Node.js, Python, Go) rather than rely solely on a managed cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2df1bf37-9d52-4951-9c51-d887b5e883c4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Amberflo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Amberflo is a usage metering and AI monetization platform with an AI Gateway for 1,500+ LLM models and usage-based billing.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Amberflo: usage metering and AI cost monetization platform with an AI Gateway and usage-based billing. Plans start at $99/month.$q$,
  og_description = $q$Amberflo: usage metering and AI cost monetization platform with an AI Gateway and usage-based billing. Plans start at $99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '244bf9a5-5a31-4fb4-9a33-bdfd960154d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Real-time usage metering$q$, $q$Tracks usage of APIs, tokens, and events across services in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$AI cost tracking and governance$q$, $q$Provides operational controls such as Cost Guards and Budgets to manage and cap AI spend.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$AI Gateway$q$, $q$Offers unified access to more than 1,500 LLM models with built-in retries and fallbacks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Intelligent Model Router$q$, $q$Routes requests across models for cost optimization and prompt optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Credits system$q$, $q$Supports prepaid credit drawdowns with automated tracking against usage.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Flexible billing models$q$, $q$Supports usage-based, outcome-based, and subscription pricing structures.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Revenue recognition automation$q$, $q$Automates revenue recognition workflows to support compliance and audit readiness.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Per-unit cost and margin tracking$q$, $q$Calculates per-unit cost and margin per customer for profitability analysis.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Dedicated AI Gateway supports 1,500+ LLM models with built-in retries and fallbacks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Publishes concrete entry-level pricing ($99/month Startups plan) rather than quote-only pricing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$30-day free trial available to evaluate the gateway and baseline FinOps visibility$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Supports multiple billing models (usage-based, outcome-based, subscription) in one platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Enterprise tier includes SSO and role-based access control$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Entry-level Startups plan caps at $10,000 billing volume and 10k meter events per month before overage applies$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Growth plan pricing rises quickly with request volume, from $599/month up to $1,499/month depending on tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Enterprise pricing is quote-only and requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$No publicly stated founding year, headquarters, or team size$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Does Amberflo offer a free trial?$q$, $q$Yes, a 30-day free trial is available to evaluate the AI Gateway and baseline FinOps visibility.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$How much does Amberflo cost?$q$, $q$The Startups plan starts at $99/month (up to $10,000 billing volume and 10k meter events/month). The Growth plan ranges from $599 to $1,499/month depending on request volume, and Enterprise pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$How many LLM models does Amberflo's AI Gateway support?$q$, $q$The AI Gateway provides unified access to more than 1,500 LLM models with built-in retries and fallbacks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$What billing models does Amberflo support?$q$, $q$Amberflo supports usage-based, outcome-based, and subscription pricing, plus a prepaid credits system.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Does Amberflo's Enterprise plan include security features like SSO?$q$, $q$Yes, the Enterprise/Custom plan includes single sign-on (SSO) and role-based access control.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Controlling AI/LLM spend$q$, $q$Uses Cost Guards and Budgets to monitor and cap variable AI and LLM costs in real time.$q$, $q$AI-native companies managing variable LLM costs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Automating usage-based billing$q$, $q$Meters usage and automates invoicing for usage-based, outcome-based, or subscription pricing.$q$, $q$SaaS and infrastructure platforms billing on consumption$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Routing across multiple LLM providers$q$, $q$Uses the AI Gateway and Model Router to access 1,500+ models with retries, fallbacks, and cost/prompt optimization.$q$, $q$Engineering teams building products on multiple LLM providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Free Trial$q$, $q$Free for 30 days$q$, NULL, $q$["Evaluate the AI Gateway","Baseline FinOps visibility"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Startups$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Up to $10,000 billing volume per month","Up to 10k meter events per month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Growth$q$, $q$From $599/month (tiered up to $1,499/month by request volume)$q$, $q$monthly$q$, $q$["Everything in Startups","Up to $100,000 billing volume per month","Up to 500k meter events per month","0.54% fee on additional billing volume","$5 per additional 10k meter events"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$Enterprise$q$, $q$Custom / contact sales$q$, NULL, $q$["For $1M+ billing volume per month","Bulk discounts available","Unlimited workflows","Single sign-on (SSO)","Role-based access","Everything in Growth"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$overview$q$, $q$What is Amberflo?$q$, 2, ARRAY[$q$Amberflo is a usage metering and AI monetization platform that unifies metering, cost attribution, and billing operations. It tracks usage of APIs, tokens, and events in real time, and pairs that with an AI Gateway offering access to more than 1,500 LLM models with built-in retries and fallbacks.$q$, $q$Beyond metering, Amberflo provides AI cost governance tools (Cost Guards, Budgets), a prepaid credits system, and support for usage-based, outcome-based, and subscription billing models, along with revenue recognition automation and per-customer margin tracking.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', $q$who-its-for$q$, $q$Who Amberflo is for$q$, 2, ARRAY[$q$Amberflo is built for AI-native companies, infrastructure providers, and SaaS platforms that need to track and control variable AI/LLM costs while billing customers on usage-based, outcome-based, or hybrid pricing models.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('244bf9a5-5a31-4fb4-9a33-bdfd960154d2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── m3ter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Usage-based billing infrastructure that processes usage data, rates bills, and automates quote-to-cash for B2B SaaS.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$York, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$m3ter is usage-based billing infrastructure for B2B SaaS, automating rating, invoicing, and quote-to-cash. Now part of Salesforce.$q$,
  og_description = $q$m3ter is usage-based billing infrastructure for B2B SaaS, automating rating, invoicing, and quote-to-cash. Now part of Salesforce.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a6963e7b-5db0-4f3f-a759-a0c758f52263' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Usage data ingestion$q$, $q$Ingests and processes raw usage data at scale to feed downstream billing calculations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Advanced rating engine$q$, $q$Performs bill calculations with flexible pricing logic to support complex usage-based pricing models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Revenue leakage prevention$q$, $q$Aims to reduce under-billing, which m3ter states can cost companies 4-7% of revenue.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Billing automation$q$, $q$Automates quote-to-cash workflows to reduce manual billing operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Real-time usage dashboards$q$, $q$Provides reporting and dashboards for monitoring usage and billing in real time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$CRM/ERP integration$q$, $q$Connects with existing systems such as Salesforce, NetSuite, and Looker rather than replacing them.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Purpose-built for complex, usage-based B2B SaaS pricing models$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Integrates with existing CRM/ERP systems (Salesforce, NetSuite, Looker) instead of requiring a rip-and-replace$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Founded by team with prior usage-based pricing experience from GameSparks (acquired by Amazon)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Backed by Salesforce following its acquisition of m3ter$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$No public pricing; requires a demo or sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$No free trial or free plan advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Now owned by Salesforce, which may affect long-term product roadmap and independence$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Designed primarily for mid-size and large B2B SaaS companies, less suited to very small teams$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Is m3ter free to use?$q$, $q$No public free plan or free trial is listed. Pricing is based on a custom quote after scheduling a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Who owns m3ter?$q$, $q$m3ter is now part of Salesforce, following a definitive acquisition agreement announced by the company.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Does m3ter replace my CRM or ERP?$q$, $q$No. m3ter is built to work alongside existing systems such as Salesforce, NetSuite, and Looker rather than replace them.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Who is m3ter built for?$q$, $q$m3ter targets mid-size and large B2B SaaS companies that need to operationalize usage-based pricing strategies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Usage-based billing operations$q$, $q$Finance and billing operations teams use m3ter to process usage data and calculate accurate, complex bills.$q$, $q$Finance and billing operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Launching new pricing models$q$, $q$Product and engineering leaders use m3ter to implement and test new usage-based pricing strategies without building billing infrastructure in-house.$q$, $q$Product and engineering leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$Preventing revenue leakage$q$, $q$Companies use m3ter's rating engine to reduce under-billing errors that m3ter states can cost 4-7% of revenue.$q$, $q$Revenue and finance teams at B2B SaaS companies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$overview$q$, $q$What is m3ter?$q$, 2, ARRAY[$q$m3ter is usage-based billing infrastructure that processes usage data, performs advanced rating calculations, and automates quote-to-cash operations for B2B SaaS companies. It is designed to sit alongside existing CRM and ERP systems, such as Salesforce, NetSuite, and Looker, to handle the complexity that legacy systems struggle with when pricing is usage-based.$q$, $q$m3ter was founded in 2020 by John Griffin and Griffin Parry, who previously built GameSparks (acquired by Amazon in 2017) and brought their usage-based pricing experience into m3ter. The company is now part of Salesforce, following a definitive acquisition agreement.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', $q$who-its-for$q$, $q$Who m3ter is for$q$, 2, ARRAY[$q$m3ter is aimed at mid-size and large B2B SaaS companies with usage-based or hybrid pricing models. It is used by finance and billing operations teams to automate rating and invoicing, by product and engineering teams to launch new pricing strategies, and by sales and customer success organizations that need accurate, real-time usage and billing data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6963e7b-5db0-4f3f-a759-a0c758f52263', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zenskar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native revenue automation platform for billing, revenue recognition, collections, and usage metering.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, NY, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Zenskar automates billing, revenue recognition, collections, and usage metering for finance teams with complex pricing models.$q$,
  og_description = $q$Zenskar automates billing, revenue recognition, collections, and usage metering for finance teams with complex pricing models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de85e666-3a6a-4ce4-b304-a77397acde17';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de85e666-3a6a-4ce4-b304-a77397acde17' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Billing automation$q$, $q$Automates invoicing for subscription, usage-based, hybrid, and value-based pricing models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Revenue recognition$q$, $q$Generates audit-ready revenue recognition compliant with ASC 606 and IFRS 15 without manual spreadsheets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Collections and dunning$q$, $q$Manages receivables and automated dunning to help collect payments faster.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Usage metering$q$, $q$Sends, aggregates, and monitors usage data to feed metered and hybrid billing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Contracts Agent$q$, $q$AI-powered agent that processes contracts to automate downstream billing terms and generate invoices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Entitlements management$q$, $q$Automates and manages customer credits and entitlements without requiring developer involvement.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Customer portal$q$, $q$Low-code customer portal that customers can use to view invoices and billing details.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Analytics$q$, $q$Tracks SaaS metrics and revenue insights, with natural-language querying of billing data.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$All plans include the same feature set; the company states it does not gatekeep features by plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Over 100 integrations, including HubSpot, Stripe, Avalara, and NetSuite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$AI Contracts Agent automates invoice generation from contract terms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$SOC 2, ISO 27001, and GDPR compliant$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Offers a free pilot program and sandbox environment for evaluation before purchase$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$No public pricing; all three plans (Starter, Standard, Enterprise) require a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$No self-serve free plan; access requires going through a sales-driven pilot process$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Founding year and company size are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Does Zenskar have a free plan?$q$, $q$Zenskar does not offer a public free plan, but it provides a free pilot program of flexible duration and a sandbox environment for testing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$What are Zenskar's pricing tiers?$q$, $q$Zenskar offers three tiers — Starter, Standard, and Enterprise — all with custom, quote-based pricing rather than public rates.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Do all Zenskar plans include the same features?$q$, $q$Zenskar states it does not gatekeep features by plan; core modules like billing, revenue recognition, collections, and usage metering are available on all plans, with differences mainly in support level and SLAs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Where is Zenskar based?$q$, $q$Zenskar's headquarters is listed at 169 Madison Avenue #2201, New York, NY 10016.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Does Zenskar use AI?$q$, $q$Yes. Zenskar includes an AI-powered Contracts Agent for automating invoice generation from contract terms, an AI agents marketplace, and natural-language querying of billing data.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Automated invoicing for complex pricing$q$, $q$Finance teams use Zenskar to automate invoicing across subscription, usage-based, and hybrid pricing models without manual workarounds.$q$, $q$Finance and billing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Audit-ready revenue recognition$q$, $q$Controllers use Zenskar's RevRec module to produce ASC 606/IFRS 15 compliant revenue recognition without spreadsheets.$q$, $q$Finance controllers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Usage-based product monetization$q$, $q$Engineering and product leaders use Zenskar's usage metering and entitlements to launch and manage usage-based or credit-based pricing.$q$, $q$Product and engineering leaders$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Faster collections$q$, $q$Finance teams use Zenskar's dunning and collections tools to reduce days sales outstanding.$q$, $q$Accounts receivable and collections teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Starter$q$, $q$Custom pricing$q$, NULL, $q$["Basic support","Basic integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Standard$q$, $q$Custom pricing$q$, NULL, $q$["Premium support","All integrations","Hands-on implementation","99.9% SLAs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["24x7 dedicated support","On-demand integrations","White-glove implementation","99.9% SLAs"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$overview$q$, $q$What is Zenskar?$q$, 2, ARRAY[$q$Zenskar is an AI-native revenue automation platform that covers the order-to-cash cycle, including billing, revenue recognition, collections, usage metering, and analytics. It is designed to replace manual billing workarounds and spreadsheets for companies with complex pricing models such as subscriptions, usage-based, and value-based billing.$q$, $q$The company is headquartered in New York and has raised a $15M Series A. Zenskar reports customer outcomes including faster month-end close and reduced time spent on invoicing, and connects to more than 100 external systems, including HubSpot, Stripe, Avalara, and NetSuite.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', $q$who-its-for$q$, $q$Who Zenskar is for$q$, 2, ARRAY[$q$Zenskar serves finance teams, controllers, and founders at SaaS, cloud infrastructure, AI, fintech, e-learning, dev tools, CPaaS, and retail tech companies that need to automate billing and revenue recognition for complex or usage-based pricing without relying on spreadsheets.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de85e666-3a6a-4ce4-b304-a77397acde17', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Tabs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native revenue automation platform for B2B billing, collections, and ASC 606 revenue recognition.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$2,000/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tabs automates B2B billing, collections, and ASC 606 revenue recognition with AI included in every plan.$q$,
  og_description = $q$Tabs automates B2B billing, collections, and ASC 606 revenue recognition with AI included in every plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '97ea30fd-29e7-475a-a5ab-0fa38bf0a882' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Automated billing$q$, $q$Generates invoices for subscription, usage-based, and hybrid billing models without custom logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Collections$q$, $q$Automates payment collection and cash application to accelerate cash flow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Revenue recognition$q$, $q$ASC 606-compliant revenue recognition automation for finance teams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Reporting$q$, $q$Real-time revenue analytics and custom reporting options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Contract management$q$, $q$Manages contract terms so billing stays accurate against what was agreed.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$AI agents$q$, $q$Purpose-built AI automation for billing workflows and collections, included in every plan at no extra cost.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Accounting integrations$q$, $q$Connects with QuickBooks Online, NetSuite, Sage Intacct, Oracle, Rillet, and HubSpot, plus a developer API.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$AI capabilities are included in every plan at no additional cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Implementation is positioned as fast ("live in weeks, not quarters")$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Handles complex hybrid and usage-based billing models without custom logic$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$SOC 2 compliant with audit-ready controls$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Integrates with major accounting platforms (QuickBooks Online, NetSuite, Sage Intacct, Oracle, Rillet)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Pricing is only public for the entry-level Launch tier; Growth, Scale, and Enterprise tiers require a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$No free trial or free plan is offered$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Entry price of $2,000/month may be out of reach for very small businesses$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Add-ons like custom reporting, advanced API support, and multi-entity/international support carry additional tier-based pricing$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$What does Tabs do?$q$, $q$Tabs is an AI-native revenue automation platform that manages billing, invoicing, collections, and ASC 606 revenue recognition for B2B companies.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$How much does Tabs cost?$q$, $q$The Launch plan starts at $2,000/month for companies with up to $5M in annual revenue and up to 100 active contracts. Growth, Scale, and Enterprise plans are custom-priced based on revenue and contract volume.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Does Tabs offer a free trial?$q$, $q$No free trial or free plan is listed on the Tabs pricing page.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Does Tabs include AI features?$q$, $q$Yes, Tabs states that AI is included in every plan at no additional cost, used for billing workflow and collections automation.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$What accounting tools does Tabs integrate with?$q$, $q$Tabs integrates with QuickBooks Online, NetSuite, Sage Intacct, Oracle, Rillet, and HubSpot, among 14 total listed integrations, plus a developer-friendly API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Subscription and usage-based billing$q$, $q$Automates invoice generation for companies running subscription, usage-based, or hybrid billing models.$q$, $q$B2B SaaS finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$ASC 606 revenue recognition$q$, $q$Automates revenue recognition to stay compliant with ASC 606 while reducing manual close work.$q$, $q$RevOps and accounting teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Collections and cash application$q$, $q$Automates collections to accelerate cash flow and reduce billing errors at scale.$q$, $q$Finance teams managing complex billing$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Multi-system accounting integration$q$, $q$Connects billing data with existing accounting stacks like QuickBooks Online, NetSuite, and Sage Intacct.$q$, $q$Accounting partners and controllers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Launch$q$, $q$$2,000/month$q$, $q$monthly$q$, $q$["Up to $5M annual revenue","Up to 100 active contracts","AI included","Contract processing and automated billing","Collections and cash application","ASC 606 revenue recognition and reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Growth$q$, $q$Custom$q$, NULL, $q$["$5M–$20M annual revenue","Up to 500 active contracts","AI included","Most popular tier"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Scale$q$, $q$Custom$q$, NULL, $q$["$20M–$50M annual revenue","Up to 2,000 active contracts","AI included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["$50M+ annual revenue","Unlimited active contracts","AI included","Custom workflows and multi-entity support available"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$overview$q$, $q$What is Tabs?$q$, 2, ARRAY[$q$Tabs is an AI-native revenue automation platform built for B2B companies that need to manage the full billing and revenue lifecycle, from contracts and invoicing to collections and revenue recognition.$q$, $q$The platform automates invoice generation across subscription, usage-based, and hybrid billing models, and includes ASC 606-compliant revenue recognition, real-time reporting, and AI-driven automation for billing workflows and collections, included in every plan at no extra cost.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', $q$who-its-for$q$, $q$Who Tabs is for$q$, 2, ARRAY[$q$Tabs is aimed at B2B finance and RevOps teams handling complex or high-volume billing, ranging from companies with up to $5M in annual revenue on its Launch plan to enterprises with $50M+ in revenue and unlimited contracts on its top tier.$q$, $q$It connects with existing accounting stacks such as QuickBooks Online, NetSuite, Sage Intacct, Oracle, and Rillet, making it suited to teams that need billing automation layered on top of their current finance systems rather than a full accounting system replacement.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97ea30fd-29e7-475a-a5ab-0fa38bf0a882', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Sequence ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sequence is a CPQ, billing, and revenue recognition platform built for B2B finance teams to automate revenue operations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$799/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$London, UK and New York, US$q$,
  languages = '{}',
  seo_meta_description = $q$Sequence combines CPQ, billing, and revenue recognition for B2B finance teams, with published plans starting at $799/month.$q$,
  og_description = $q$Sequence combines CPQ, billing, and revenue recognition for B2B finance teams, with published plans starting at $799/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Native invoicing$q$, $q$Automated invoicing built into the platform for recurring and custom B2B deals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Usage metering$q$, $q$Tracks usage to support consumption-based and usage billing models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Advanced pricing models$q$, $q$Supports bespoke contract terms and custom pricing scenarios for complex B2B deals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Revenue recognition$q$, $q$Available as an add-on on Core and Scale plans for automated revenue recognition.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$ERP/CRM integrations$q$, $q$Connects with systems such as NetSuite and Salesforce to sync billing and revenue data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Sales tax integrations$q$, $q$Included on the Core and Scale plans to handle tax calculation on invoices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Custom reporting dashboard$q$, $q$Optional add-on across all plans for tailored revenue reporting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Compliance certifications$q$, $q$Platform supports ISO 27001, SOC 2, and GDPR compliance across all tiers.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Publishes a fixed starting price ($799/month) for its entry-level Growth plan, unlike many competitors that are fully quote-only$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Combines CPQ, billing, usage metering, and revenue recognition in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Backed by well-known investors including Andreessen Horowitz and Salesforce Ventures$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Supports ISO 27001, SOC 2, and GDPR compliance across all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Higher tiers add dedicated onboarding, migration services, and custom integrations for scaling companies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Core and Scale tiers require bespoke, quote-based pricing rather than published rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$No free trial or free plan is mentioned on the pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Revenue recognition is an optional add-on rather than included by default on the Growth plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Specific AI capabilities behind the "AI Revenue platform" positioning are not detailed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Does Sequence offer a free trial or free plan?$q$, $q$No free trial or free plan is listed on the Sequence pricing page; the site directs visitors to book a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$How much does Sequence cost?$q$, $q$The Growth plan is published at $799/month for startups with under $1M in annual revenue. The Core and Scale plans use bespoke pricing based on billed revenue and required features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Where is Sequence based?$q$, $q$Sequence describes itself as built in London and New York.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$What compliance standards does Sequence support?$q$, $q$Sequence states support for ISO 27001, SOC 2, and GDPR across all plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Can I add revenue recognition to any plan?$q$, $q$Revenue recognition is available as an optional add-on on the Core and Scale plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Early-stage billing for startups$q$, $q$The Growth plan targets startups under $1M in annual revenue that need native invoicing, usage metering, and bespoke contract terms.$q$, $q$Early-stage B2B startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Mid-market revenue operations$q$, $q$The Core plan adds sales tax integrations and NetSuite/Salesforce connections for companies with $1-10M in annual revenue.$q$, $q$Mid-market finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Scaling enterprise revenue automation$q$, $q$The Scale plan adds dedicated onboarding, migration services, and custom integrations for companies with $10M+ in annual revenue.$q$, $q$Finance teams at scaling B2B companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Growth$q$, $q$$799/month$q$, $q$monthly$q$, $q$["Native invoicing","Usage metering","Advanced pricing models","Bespoke contract terms","ERP/CRM integrations","Basic support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Core$q$, $q$Custom$q$, NULL, $q$["All Growth features","Sales tax integrations","NetSuite integration","Salesforce integration","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$Scale$q$, $q$Custom$q$, NULL, $q$["All Core features","Dedicated onboarding manager","Migration services","Engineer support","Shared Slack channel","Custom integrations","Custom pricing scenarios","Support SLAs"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$overview$q$, $q$What is Sequence?$q$, 2, ARRAY[$q$Sequence is a revenue operations platform that unifies CPQ (Configure Price Quote), billing, and revenue recognition for B2B companies. It markets itself as an "AI Revenue platform for Next Gen Finance teams," positioning the product around automating revenue collection for custom deals at scale.$q$, $q$The platform is built and operated out of London and New York, and is backed by investors including Andreessen Horowitz and Salesforce Ventures. Its plans support ISO 27001, SOC 2, and GDPR compliance across all tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', $q$who-its-for$q$, $q$Who Sequence is for$q$, 2, ARRAY[$q$Sequence is aimed at B2B finance teams managing complex, custom deals rather than simple flat-rate subscriptions. Its Growth plan targets startups under $1M in annual revenue, while Core and Scale serve companies from $1M up through $10M+ in annual revenue that need sales tax handling, ERP/CRM integrations, and dedicated onboarding support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bebdc0d9-dc28-4a58-9339-bc9aa1c7b0ba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Subskribe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Subskribe is a Quote-to-Revenue platform combining CPQ, subscription billing, and revenue recognition for SaaS companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Ramon, California, US$q$,
  languages = '{}',
  seo_meta_description = $q$Subskribe offers CPQ, subscription billing, and ASC 606/IFRS 15 revenue recognition for SaaS companies, now part of DealHub.$q$,
  og_description = $q$Subskribe offers CPQ, subscription billing, and ASC 606/IFRS 15 revenue recognition for SaaS companies, now part of DealHub.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0a76343-e065-4813-8f8c-fb490cece33b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Subskribe CPQ$q$, $q$Quote generation with multilevel discounting and configurable approval workflows for complex deals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Subskribe Billing$q$, $q$Subscription management, usage-based billing, multi-currency support, and automated dunning.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Revenue Recognition$q$, $q$Automated revenue recognition for complex deals, supporting ASC 606 and IFRS 15 compliance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$DealDesk AI$q$, $q$AI-powered guided selling with smart summarization, conversational support, and intelligent sales rooms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$E-signature$q$, $q$Built-in e-signature for finalizing quotes and contracts without a separate tool.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Advanced Analytics$q$, $q$Dashboards for SaaS metrics and reporting across the quote-to-revenue lifecycle.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Business rules engine (Zeppa)$q$, $q$Configurable rules engine supporting ramp deals and approval logic.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Integrations$q$, $q$Connects with Salesforce, HubSpot, NetSuite, QuickBooks, Stripe, DocuSign, Avalara, Anrok, and Slack, included at no extra charge.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$CPQ and Billing modules can be purchased individually rather than only as a full bundle$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$All integrations (Salesforce, NetSuite, Stripe, Avalara, and others) are included at no extra charge$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Recognized as a G2 High Performer for 7 consecutive quarters in CPQ, Subscription Billing, and Revenue Management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Revenue recognition supports ASC 606 and IFRS 15 compliance$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$DealDesk AI adds AI-powered guided selling and intelligent sales rooms on top of core CPQ$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$All plans use custom, quote-based pricing with no published rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$No free trial or free plan is mentioned on the pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Acquired by DealHub in November 2025, which may affect long-term product direction even though Subskribe continues operating under its own name$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$A sample pricing calculator estimate (around $140,000/year) suggests the platform targets mid-market and larger revenue tiers rather than very small teams$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Does Subskribe offer a free trial or free plan?$q$, $q$No free trial or free plan is listed on the pricing page; pricing is provided through a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$How much does Subskribe cost?$q$, $q$Pricing is custom and based on product selection, term length, number of seats, and annual billing amount. A sample calculator estimate shows roughly $140,000/year for a mid-market company with $100M+ revenue and 101-200 seats.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Can I buy CPQ and Billing separately?$q$, $q$Yes, Subskribe CPQ and Subskribe Billing are available as individual modules in addition to the full Quote-to-Revenue platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Are integrations included in the price?$q$, $q$Yes, Subskribe states that all integrations are included free of charge.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Is Subskribe still an independent company?$q$, $q$Subskribe was acquired by DealHub in November 2025 but continues to operate and deliver its product under the Subskribe name.$q$, 4);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$What revenue recognition standards does Subskribe support?$q$, $q$Subskribe's revenue recognition module supports ASC 606 and IFRS 15 compliance.$q$, 5);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Complex B2B quoting$q$, $q$Subskribe CPQ handles multilevel discounting, approval workflows, and e-signature for complex enterprise deals.$q$, $q$Sales operations teams at SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Automated revenue recognition$q$, $q$Finance teams use Subskribe's revenue recognition module to automate ASC 606 and IFRS 15 compliant reporting for complex deals.$q$, $q$Finance and accounting teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Unified quote-to-revenue workflow$q$, $q$The full Quote-to-Revenue platform combines CPQ, billing, and revenue recognition to reduce manual reconciliation from quote to cash.$q$, $q$RevOps teams at growing SaaS companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Subskribe CPQ$q$, $q$Custom$q$, NULL, $q$["Complex deal support","Multilevel discounting","Approval workflows","E-signature","Salesforce/HubSpot integration","Subscription management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Subskribe Billing$q$, $q$Custom$q$, NULL, $q$["Subscription management","Usage-based billing","Multi-currency support","Automated dunning","ERP integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$Subskribe Quote-to-Revenue$q$, $q$Custom$q$, NULL, $q$["CPQ","Billing","Revenue Recognition","Zero reconciliation from quote to revenue"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$overview$q$, $q$What is Subskribe?$q$, 2, ARRAY[$q$Subskribe is an adaptive Quote-to-Revenue platform that combines CPQ, subscription billing, and revenue recognition for SaaS and enterprise companies. Its DealDesk AI feature adds AI-powered guided selling, smart summarization, and intelligent sales rooms to the quoting process.$q$, $q$The company is headquartered in San Ramon, California, and was acquired by DealHub in November 2025. Subskribe continues to operate and deliver its product under its own name following the acquisition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', $q$who-its-for$q$, $q$Who Subskribe is for$q$, 2, ARRAY[$q$Subskribe serves fast-growing SaaS companies and enterprises with complex deal structures, including customers such as Chainguard, Zip, Beamery, Vivun, Merge, TrustArc, Torq, and Cognigy. It suits sales operations teams needing multilevel discounting and approval workflows, and finance teams needing ASC 606/IFRS 15 compliant revenue recognition, either as standalone modules or a combined platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0a76343-e065-4813-8f8c-fb490cece33b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ordway ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ordway is a subscription billing and revenue automation platform for SaaS, AI, and fintech companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Washington, DC, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Ordway automates subscription billing, invoicing, and revenue recognition for SaaS, AI, and fintech companies.$q$,
  og_description = $q$Ordway automates subscription billing, invoicing, and revenue recognition for SaaS, AI, and fintech companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cf66e303-0e7b-4d2e-b35e-ae3a7ac44901' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Flexible billing models$q$, $q$Supports subscription, usage-based, and transaction-based pricing models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Automated invoicing and payment collection$q$, $q$Generates invoices and collects payments automatically, reducing manual billing work.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Revenue recognition$q$, $q$Automates revenue recognition in compliance with ASC 606 and IFRS 15.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Accounts receivable automation$q$, $q$Includes dunning workflows to manage overdue accounts and collections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$SaaS metrics reporting$q$, $q$Reports on MRR/ARR, net dollar retention, churn, and other subscription metrics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Contract modification automation$q$, $q$Automates changes to existing customer contracts as deals evolve.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Customer self-service portal$q$, $q$Gives customers a portal to manage billing and account details themselves.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$AI agentic workflows$q$, $q$Offers AI-driven workflows and a natural language interface for billing and metrics reporting.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Automates the full quote-to-cash workflow, replacing spreadsheet-based billing processes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Supports complex pricing models including subscription, usage-based, and transaction pricing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Built-in revenue recognition compliance for ASC 606 and IFRS 15$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Includes AI agentic workflows and a natural language interface for reporting$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Provides a customer self-service portal to reduce support overhead$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Pricing is not publicly disclosed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$No free trial or free plan is mentioned on the website$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Specific third-party integrations are not detailed on the homepage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$What is Ordway used for?$q$, $q$Ordway is a billing and revenue automation platform used by SaaS, AI, and fintech companies to manage invoicing, payment collection, and revenue recognition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Does Ordway offer a free trial?$q$, $q$Ordway's website does not mention a free trial or free plan; pricing and access require contacting the company.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Where is Ordway headquartered?$q$, $q$Ordway is headquartered in Washington, DC.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Does Ordway support usage-based billing?$q$, $q$Yes, Ordway supports subscription, usage-based, and transaction pricing models.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Does Ordway include AI features?$q$, $q$Yes, Ordway offers AI agentic workflows and a natural language interface for billing and accounting reporting.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Automating quote-to-cash for SaaS companies$q$, $q$Replaces manual, spreadsheet-based billing and invoicing processes with automated workflows.$q$, $q$Finance teams at SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Revenue recognition compliance$q$, $q$Automates revenue recognition calculations in line with ASC 606 and IFRS 15 standards.$q$, $q$Accounting and controller teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$Usage-based billing for AI and fintech products$q$, $q$Handles metered and usage-based pricing structures common among AI and fintech companies.$q$, $q$AI and fintech billing teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$overview$q$, $q$What is Ordway?$q$, 2, ARRAY[$q$Ordway is a subscription billing and revenue automation platform built for SaaS, AI, and fintech companies. It automates the quote-to-cash process, including invoicing, payment collection, revenue recognition, and financial reporting.$q$, $q$The platform supports subscription, usage-based, and transaction pricing models, and includes AI agentic workflows along with a natural language interface for billing and accounting reporting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', $q$who-its-for$q$, $q$Who Ordway is for$q$, 2, ARRAY[$q$Ordway is aimed at finance and accounting teams at scaling SaaS, AI, and fintech companies that need to move off spreadsheet-based billing and revenue recognition processes toward automated workflows compliant with ASC 606 and IFRS 15.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cf66e303-0e7b-4d2e-b35e-ae3a7ac44901', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── DealHub CPQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DealHub CPQ is an agentic quote-to-revenue platform combining quoting, contracts, billing, and buyer collaboration.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DealHub CPQ unifies quoting, contract management, subscription billing, and AI-driven deal workflows in one platform.$q$,
  og_description = $q$DealHub CPQ unifies quoting, contract management, subscription billing, and AI-driven deal workflows in one platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Configure Price Quote (CPQ)$q$, $q$Automates the creation of quotes and subscription proposals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Contract Lifecycle Management (CLM)$q$, $q$Streamlines contract creation, approvals, and signing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$DealRoom$q$, $q$A digital sales proposal platform for buyer collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Subscription billing$q$, $q$Manages recurring revenue billing as part of the quote-to-revenue workflow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Revenue intelligence$q$, $q$Provides reporting aimed at aligning CRO and CFO teams on revenue data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Document generation and eSign$q$, $q$Generates deal documents and supports electronic signature within the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Guided selling and workflow approvals$q$, $q$Directs sales reps through configured selling paths with built-in approval workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$DealHub AI$q$, $q$Uses governed execution with conditional logic to automate deal-flow decisions.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Integrates quoting, contracts, billing, and buyer collaboration into a single workflow$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Includes DealHub AI for governed, automated deal-flow decision-making$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Integrates with major CRMs (Salesforce, HubSpot, Microsoft Dynamics 365) and NetSuite ERP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Holds multiple security and compliance certifications, including SOC 2 Type II and ISO 27001$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Used by notable companies such as Intuit, HP, Braze, and Zapier$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Pricing is not publicly disclosed and requires requesting a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$No free trial or free plan is mentioned on the website$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Company founding year, headquarters, and team size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$What is DealHub CPQ used for?$q$, $q$DealHub CPQ is used to manage the quote-to-revenue process, including quoting, contracts, subscription billing, and buyer collaboration.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Does DealHub offer a free trial?$q$, $q$DealHub's website does not mention a free trial or free plan; pricing requires contacting sales for a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$What CRMs does DealHub integrate with?$q$, $q$DealHub integrates with Salesforce, HubSpot, and Microsoft Dynamics 365, along with NetSuite ERP, DocuSign, Gong, and Slack.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Does DealHub include AI features?$q$, $q$Yes, DealHub AI uses governed execution with conditional logic to automate and customize deal workflows.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$What compliance certifications does DealHub hold?$q$, $q$DealHub holds ISO 27001, ISO 27701, ISO 22301, and ISO 42001 certifications, along with SOC 1 Type II and SOC 2 Type II, and is GDPR and CCPA compliant.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Automating sales quoting$q$, $q$Configures and generates accurate quotes and subscription proposals for sales teams.$q$, $q$Sales and revenue operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Managing contract lifecycles$q$, $q$Streamlines contract approvals and signing within a single revenue workflow.$q$, $q$Legal and sales operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$Subscription billing management$q$, $q$Manages recurring revenue billing alongside quoting and contracts.$q$, $q$Finance and billing teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$overview$q$, $q$What is DealHub CPQ?$q$, 2, ARRAY[$q$DealHub CPQ is an agentic quote-to-revenue platform that brings quoting, approvals, contracts, subscriptions, billing, and buyer collaboration into a single workflow.$q$, $q$The platform includes DealHub AI, which uses governed execution and conditional logic to automate and customize deal flows, and integrates with CRMs such as Salesforce, HubSpot, and Microsoft Dynamics 365.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', $q$who-its-for$q$, $q$Who DealHub CPQ is for$q$, 2, ARRAY[$q$DealHub CPQ is aimed at sales, revenue operations, and finance teams that need to unify quoting, contract management, and subscription billing into one governed revenue workflow, and is used by companies including Intuit, HP, Braze, and Zapier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('67e99a7f-6ac4-41d8-bead-00bd3c3b6aaa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Salesbricks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Salesbricks is a B2B revenue platform for quoting, closing, billing, and collecting payments on SaaS deals in one system.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$500/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Salesbricks review: CPQ, contracts, billing, and payments for B2B SaaS revenue teams. Pricing starts at $500/month billed annually.$q$,
  og_description = $q$Salesbricks review: CPQ, contracts, billing, and payments for B2B SaaS revenue teams. Pricing starts at $500/month billed annually.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ba708a7-67bb-4103-86f5-6ecb278ba497';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ba708a7-67bb-4103-86f5-6ecb278ba497' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$CPQ (Configure, Price, Quote)$q$, $q$Configure product pricing and packaging, manage legal terms such as MSAs, DPAs, and SLAs, and shape deals with discounts, free periods, and custom billing schedules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Contracts and e-signature$q$, $q$Generate sales contracts and collect e-signatures as part of the deal-closing workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Checkout and order management$q$, $q$Provide a checkout flow for buyers and manage orders, including expansion controls for upsells and add-ons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Automated billing and payments$q$, $q$Automate billing for varied deal structures and process payments with flexible payment options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$APIs and integrations$q$, $q$Connect via APIs and webhooks, plus native integrations with Salesforce, HubSpot, Attio, QuickBooks, Slack, Sphere, and Lightfield.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$BrIQ AI search$q$, $q$AI-powered search that surfaces instant answers across contracts, invoices, and payment records.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Revenue reporting and system of record$q$, $q$Centralizes customer and revenue data, auto-generates entitlements from transactions, and organizes a financial timeline for reporting.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Combines CPQ, contracts, billing, and payments in a single revenue platform rather than separate point tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Native integrations with common CRMs (Salesforce, HubSpot, Attio) and accounting tools (QuickBooks)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$SOC 2 Type II certified with 99.999% uptime claimed since launch$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Built-in AI search (BrIQ) for querying contracts, invoices, and payments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Growth and Enterprise tiers add ERP integration and a dedicated customer success manager$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$No free trial or free plan is advertised on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Pricing combines a flat monthly fee with percentage-based fees on invoice value, which can be harder to predict than flat SaaS pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Enterprise-level features like ERP integration require the highest, custom-priced tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Founding year, headquarters, and company size are not published on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Does Salesbricks offer a free trial?$q$, $q$The Salesbricks website does not mention a free trial or free plan; plans start at a paid monthly rate.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$How much does Salesbricks cost?$q$, $q$The Startup plan starts at $500/month billed annually for up to $300k in transaction volume, with a Growth plan at $1,500/month and custom Enterprise pricing above that. Salesbricks also charges a fee based on the value of invoices generated.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$What integrations does Salesbricks support?$q$, $q$Salesbricks integrates with Salesforce, HubSpot, Attio, QuickBooks, Slack, Sphere, and Lightfield, with an additional Reevo integration listed as upcoming.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Is Salesbricks secure and reliable?$q$, $q$Salesbricks states it is SOC 2 Type II certified and claims 99.999% uptime since launch.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Does Salesbricks include AI features?$q$, $q$Yes, Salesbricks offers BrIQ AI search for instant answers across contracts, invoices, and payments; an AI Agent for automating renewals and collections is listed as an upcoming addition.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Closing complex B2B SaaS deals$q$, $q$Sales teams use the CPQ tools to configure pricing, packaging, and legal terms, then generate contracts and collect e-signatures to close deals faster.$q$, $q$B2B SaaS sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Automating billing and collections$q$, $q$Finance teams automate invoicing and billing schedules for varied deal structures and process customer payments within the same platform.$q$, $q$Finance and billing operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Centralizing revenue data$q$, $q$RevOps teams use the system of record to unify customer and revenue data, auto-generate entitlements, and build revenue reports.$q$, $q$Revenue operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Startup$q$, $q$$500/month$q$, $q$annual$q$, $q$["Up to $300k transaction volume","Up to 5 app users","Limited reports & analytics","CRM integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Growth$q$, $q$$1,500/month$q$, $q$annual$q$, $q$["$300k-$2M transaction volume","Unlimited app users","Full scope reports & analytics","CRM integration","Dedicated CSM","Scoped migrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["$300k-$2M+ transaction volume","Unlimited app users","Full scope reports & analytics","CRM integration","ERP integration","Dedicated CSM","Scoped migrations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$overview$q$, $q$What is Salesbricks?$q$, 2, ARRAY[$q$Salesbricks is a revenue platform built for B2B SaaS companies that combines CPQ, contracts, billing, and payment collection into a single system, positioned to let teams quote, close, bill, and collect cash from deals.$q$, $q$The platform is organized around three layers: a CPQ system for configuring pricing and legal terms, a system of action for contracts, checkout, billing, and payments, and a system of record that centralizes customer and revenue data with automatically generated entitlements.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', $q$who-its-for$q$, $q$Who Salesbricks is for$q$, 2, ARRAY[$q$Salesbricks targets B2B SaaS sales, finance, and revenue operations teams that need to manage complex pricing, contracts, and billing without stitching together separate CPQ, e-signature, and invoicing tools. Its tiered pricing, based on transaction volume, is structured for companies processing meaningful SaaS revenue through the platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba708a7-67bb-4103-86f5-6ecb278ba497', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MonetizeNow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MonetizeNow is a unified quote-to-cash platform for B2B SaaS companies, combining CPQ, billing, and usage metering.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MonetizeNow: an enterprise quote-to-cash platform unifying CPQ, subscription and usage billing, and real-time metering for B2B SaaS.$q$,
  og_description = $q$MonetizeNow: an enterprise quote-to-cash platform unifying CPQ, subscription and usage billing, and real-time metering for B2B SaaS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba9cd538-3337-4088-b4ee-274f06f95fe4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Quote Builder & Guided Selling$q$, $q$Configure quotes with guided selling workflows, CRM automation, and product information management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Subscription & Usage Billing$q$, $q$Automates subscription and usage-based billing, payment management, and revenue recognition.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Real-Time Usage Metering$q$, $q$Tracks usage in real time at a scale described as billions of daily events, supporting minimum commitments and pre-paid credit models.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Dunning & Credit Management$q$, $q$Handles credit and debit notes along with automated dunning management for failed or overdue payments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$No-Code Rules Engine$q$, $q$A no-code rules engine automates quoting and billing workflows without custom development.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$CRM & eSignature Integrations$q$, $q$Integrates with CRM systems and eSignature tools to support end-to-end deal execution.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Multi-Currency Payments$q$, $q$Supports multi-currency payment processing for global enterprise customers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Unifies CPQ, billing, and usage metering under a single product catalog instead of separate point solutions.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Built to handle complex enterprise pricing scenarios, including ramp deals.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Real-time usage metering designed to handle billions of daily events.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Recognized with multiple G2 awards, including High Performer and Best Support.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$API-first architecture with real-time hourly data exports.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$No public pricing information is available; pricing requires a demo or sales conversation.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$No free trial or free plan is advertised on the website.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Company headquarters and team size are not disclosed on the site.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Is there a free trial for MonetizeNow?$q$, $q$The website does not advertise a free trial or free plan; access is offered through a demo request and login.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$What does MonetizeNow's pricing look like?$q$, $q$MonetizeNow does not publish pricing tiers on its website, so exact costs are not publicly available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$What core functions does MonetizeNow cover?$q$, $q$It covers selling (quoting and CRM automation), billing (subscription and usage-based), and real-time usage metering in one platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$When was MonetizeNow founded?$q$, $q$MonetizeNow was founded in 2019.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Has MonetizeNow won any industry awards?$q$, $q$The site lists multiple G2 awards, including High Performer, Momentum Leader, Easiest to Do Business With, and Best Support.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Unifying CPQ and Billing for B2B SaaS$q$, $q$Replaces disconnected CPQ and billing point solutions with a single unified product catalog.$q$, $q$B2B SaaS revenue and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Usage-Based and Hybrid Monetization$q$, $q$Supports usage-based, subscription, and hybrid pricing models with real-time metering for high-event-volume products.$q$, $q$SaaS companies with usage-based pricing$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$Enterprise Deal Structuring$q$, $q$Handles complex enterprise contract scenarios such as ramp deals and multi-currency payments.$q$, $q$Enterprise sales operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$overview$q$, $q$What is MonetizeNow?$q$, 2, ARRAY[$q$MonetizeNow is an enterprise monetization platform that automates the revenue process from quotes to payments for B2B SaaS companies, streamlining quoting, billing, and usage tracking in one unified system.$q$, $q$Founded in 2019, the company was built around the idea that point solutions for CPQ and billing, each with their own incompatible product catalogs, create friction for SaaS revenue teams. MonetizeNow instead offers a single unified product catalog with an API-first design.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', $q$who-its-for$q$, $q$Who MonetizeNow is for$q$, 2, ARRAY[$q$MonetizeNow is aimed at B2B SaaS enterprises that need to manage complex pricing models, ramp deals, and usage-based billing at scale, replacing separate CPQ and billing tools with a single revenue platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba9cd538-3337-4088-b4ee-274f06f95fe4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Nue ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nue is an omnichannel quote-to-cash platform offering AI-driven CPQ, billing, usage monetization, and revenue analytics.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$90+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nue offers a Salesforce-native, AI-driven quote-to-cash platform for CPQ, billing, usage monetization, and revenue analytics.$q$,
  og_description = $q$Nue offers a Salesforce-native, AI-driven quote-to-cash platform for CPQ, billing, usage monetization, and revenue analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ec4f000a-01b3-43af-b663-6371cea0d208';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ec4f000a-01b3-43af-b663-6371cea0d208' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Agentic CPQ$q$, $q$AI-driven product and pricing configuration with guided selling, built natively for Salesforce with drag-and-drop quoting and approvals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Lifecycle Manager$q$, $q$Manages amendments, upgrades, and renewals, including mid-cycle changes to products, pricing, terms, and quantities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Usage, Commits & Credits Monetization$q$, $q$Rates real-time or batch usage against credits, commits, tiers, and overages, with customer-facing visibility into balances.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Billing & Collections Automation$q$, $q$Consolidates invoicing across subscriptions, usage, credits, and one-time charges, with automated payments, collections, and dunning.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Self-Serve APIs$q$, $q$Enables website and in-app purchase flows through plug-and-play UI components or custom-built integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Revenue Analytics (Lifecycle Intelligence)$q$, $q$Provides real-time revenue data, NRR and delta ARR reporting, and Salesforce-native dashboards.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Native Salesforce Integration$q$, $q$Offers drag-and-drop quoting with guardrails and built-in advanced approvals directly inside Salesforce.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Founded by a team with prior experience building Zuora, Anaplan, and Salesforce Steelbrick (now Salesforce CPQ).$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Deep, native Salesforce integration for CPQ and reporting.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Supports omnichannel monetization across direct sales, website checkout, in-app self-serve, and partner or reseller portals.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$SOC 2 Type II certified and GDPR compliant.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Customer base includes notable companies such as OpenAI, Jasper, and Superhuman.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$No public pricing information is available on the website.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$No free trial or free plan is advertised.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Company founding year and headquarters are not stated on the site.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Does Nue offer a free trial?$q$, $q$A free trial or free plan is not advertised on the Nue website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$What is Nue's pricing?$q$, $q$Nue does not publish pricing plans or costs on its website.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Is Nue built on Salesforce?$q$, $q$Nue offers native CPQ for Salesforce plus self-serve APIs for website and in-app purchase flows outside Salesforce.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Who founded Nue?$q$, $q$Nue was founded by a team that previously built Zuora, Anaplan, and Salesforce Steelbrick, now known as Salesforce CPQ.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Is Nue compliant with security and privacy standards?$q$, $q$Nue states it is SOC 2 Type II certified and GDPR compliant.$q$, 4);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$How large is Nue's team?$q$, $q$Nue's company page states it has 90+ employees across 8+ countries and 6+ regions.$q$, 5);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Enterprise Salesforce-Native Quoting$q$, $q$Provides drag-and-drop CPQ with guardrails and approvals built directly into Salesforce.$q$, $q$Sales operations teams running deals through Salesforce$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Usage-Based and Hybrid Monetization$q$, $q$Rates usage against credits, commits, and tiers for hybrid subscription and consumption pricing.$q$, $q$RevOps and finance teams billing usage-based products$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$Omnichannel Revenue Operations$q$, $q$Supports selling through direct sales, self-serve website and in-app checkout, and partner or reseller channels.$q$, $q$Go-to-market teams managing multiple sales channels$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$overview$q$, $q$What is Nue?$q$, 2, ARRAY[$q$Nue is a unified platform for configure-price-quote (CPQ), billing, and revenue lifecycle management aimed at SaaS companies, combining pricing, product configuration, analytics, and transactional capabilities.$q$, $q$The company was founded by a team that previously built Zuora, Anaplan, and Salesforce Steelbrick (now Salesforce CPQ), and its investors include Information Venture Partners, NextWorld Capital, and SV Technology.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', $q$who-its-for$q$, $q$Who Nue is for$q$, 2, ARRAY[$q$Nue is built for go-to-market teams, RevOps, finance, and product teams at SaaS and enterprise organizations that sell through Salesforce, self-serve web and in-app channels, and partner or reseller networks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ec4f000a-01b3-43af-b663-6371cea0d208', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Subskribe CPQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Subskribe CPQ is a quote-to-revenue platform combining CPQ, subscription billing, and revenue recognition for SaaS companies.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$San Ramon, California$q$,
  languages = '{}',
  seo_meta_description = $q$Subskribe CPQ unifies quoting, subscription billing, and revenue recognition for SaaS companies; acquired by DealHub in 2024.$q$,
  og_description = $q$Subskribe CPQ unifies quoting, subscription billing, and revenue recognition for SaaS companies; acquired by DealHub in 2024.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '989b012e-a050-497e-8c08-30d43f45ccd1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$CPQ$q$, $q$Quote generation and approval workflows for configuring and pricing deals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Subscription Billing$q$, $q$Subscription management, invoicing, and payment processing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Revenue Recognition$q$, $q$Automated revenue recognition for complex deals, including subscription ramps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Advanced Analytics$q$, $q$SaaS metrics dashboards including ARR classifications and cohort reporting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$E-signature$q$, $q$Built-in document signing for finalizing quotes and contracts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$DealDesk AI$q$, $q$AI-powered guided selling, deal summarization, and conversational support for deal desks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Zeppa Business Rules Engine$q$, $q$A configuration tool for custom quoting logic and business rules.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Unifies CPQ, billing, and revenue recognition in one system rather than requiring separate tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Named a G2 High Performer for seven consecutive quarters across CPQ, Subscription Billing, and Revenue Management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Supports complex deal structures such as subscription ramps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Integrates with major CRM, accounting, tax, and e-signature tools (Salesforce, HubSpot, NetSuite, QuickBooks, Avalara, Anrok, DocuSign)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Backed by fresh capital following DealHub's $100M funding round after acquiring Subskribe$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$No public pricing; requires contacting sales or using an online estimate calculator$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$No free trial or free plan is offered$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Recently acquired by DealHub (2024), which may bring product-direction changes$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$An example pricing-calculator estimate ($140,000/year for a mid-market company) suggests it is priced for mid-market and enterprise buyers rather than small teams$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Does Subskribe offer a free trial?$q$, $q$No free trial or free plan is mentioned on the Subskribe website; pricing requires contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$How much does Subskribe cost?$q$, $q$Subskribe uses custom pricing based on company size, billing volume, seats, and product selection; an online calculator gives estimates, such as roughly $140,000/year for a mid-market company.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Can I buy just the CPQ module?$q$, $q$Yes, Subskribe states customers may purchase Subskribe CPQ or Subskribe Billing individually, in addition to the full Quote-to-Revenue platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Is Subskribe still an independent company?$q$, $q$No, Subskribe was acquired by DealHub in 2024 as part of a funding round in which DealHub secured $100 million in new investment.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$What systems does Subskribe integrate with?$q$, $q$Subskribe integrates with tools including Salesforce, HubSpot, NetSuite, QuickBooks, Avalara, Anrok, DocuSign, Stripe, and Slack.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Quote-to-revenue automation$q$, $q$Manage the full cycle from quote configuration through billing and revenue recognition in one platform.$q$, $q$SaaS revenue operations and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Complex deal quoting$q$, $q$Configure and approve quotes involving subscription ramps and custom business rules via the Zeppa engine.$q$, $q$Sales and deal desk teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$Revenue recognition compliance$q$, $q$Automate revenue recognition for subscription and usage-based contracts.$q$, $q$Finance and accounting teams at SaaS companies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$overview$q$, $q$What is Subskribe CPQ?$q$, 2, ARRAY[$q$Subskribe, founded in 2020, describes itself as an adaptive quote-to-revenue platform that combines CPQ, subscription billing, and revenue recognition in a single system for SaaS companies.$q$, $q$The platform includes DealDesk AI for guided selling and summarization, a Zeppa business rules engine for custom quoting logic, and analytics for SaaS metrics such as ARR and cohort reporting. In 2024, Subskribe was acquired by DealHub as part of a $100 million funding round, though it continues to operate under the Subskribe name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', $q$who-its-for$q$, $q$Who Subskribe CPQ is for$q$, 2, ARRAY[$q$Subskribe is aimed at SaaS companies that need to unify quoting, billing, and revenue recognition, including customers referenced on its site such as Chainguard, Zip, Beamery, Vivun, Merge, and Torq. Pricing is custom and quote-based, positioning it primarily for mid-market and enterprise buyers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('989b012e-a050-497e-8c08-30d43f45ccd1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Qobra ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Qobra is sales commission management software that automates commission plan calculations for RevOps, Finance, and Sales teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Ukrainian$q$]::text[],
  seo_meta_description = $q$Qobra automates sales commission calculations, plan design, and real-time payout tracking for RevOps and Finance teams.$q$,
  og_description = $q$Qobra automates sales commission calculations, plan design, and real-time payout tracking for RevOps and Finance teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3a3af62-0fd4-4596-b2b3-6e071269284c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Commission Automation$q$, $q$Real-time automation of sales commission plan calculations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$No-Code Plan Design$q$, $q$Build and adjust commission plans through a no-code interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$QobrAI Agents$q$, $q$Three AI agents — the Architect for plan building, the Analyst for data insights, and the Sales Coach for shadow-accounting elimination.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Real-Time Rep Visibility$q$, $q$Sales reps get real-time access to targets, commissions, and incentives.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Security & Governance$q$, $q$Validation workflows, audit trails, custom roles, and SSO/Google sign-in.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Analytics$q$, $q$Incentive insights to support commission-related decisions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$CRM Integrations$q$, $q$Native CRM connections, including a Salesforce embed, plus data warehouse and API integrations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Mobile App$q$, $q$A mobile experience for sales teams to track commissions on the go.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$High third-party ratings: 4.8/5 on G2 and 4.9/5 on Capterra$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$AI agents assist with plan building, data analysis, and coaching$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Native Salesforce embed and API/data warehouse integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Multi-currency support for global sales teams$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Used by 30,000+ users according to the company$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Named customers report measurable results, such as GoCardless reducing commission processing from 3-4 days to a maximum of 1 day$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$No public pricing page; pricing requires requesting a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$No free trial or free plan is mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Founding year, headquarters, and company size are not published on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Does Qobra offer a free trial?$q$, $q$The Qobra website does not mention a free trial or free plan; prospects are directed to request a demo and pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$How much does Qobra cost?$q$, $q$Qobra does not publish pricing; the site directs visitors to request pricing via a demo booking.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$What languages does Qobra support?$q$, $q$The Qobra website offers a language selector for English, French, and Ukrainian.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Does Qobra use AI?$q$, $q$Yes, Qobra offers QobrAI, three AI agents named the Architect, the Analyst, and the Sales Coach, for plan building, data insights, and coaching.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$What does Qobra integrate with?$q$, $q$Qobra offers native CRM connections including a Salesforce embed, plus data warehouse, API, HRIS, and Slack integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Commission plan automation$q$, $q$Automate complex commission calculations to reduce manual errors and processing time.$q$, $q$RevOps and sales operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Accurate, timely payouts$q$, $q$Ensure commission payouts are calculated correctly and paid on time.$q$, $q$Finance departments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$Rep motivation and transparency$q$, $q$Give sales reps real-time visibility into targets and earned commissions.$q$, $q$Sales representatives and managers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$overview$q$, $q$What is Qobra?$q$, 2, ARRAY[$q$Qobra is a sales compensation platform that automates commission plan design, calculation, and payout tracking for RevOps, Finance, and Sales teams.$q$, $q$The platform includes QobrAI, a set of three AI agents for building commission plans, analyzing data, and coaching sales reps, along with native Salesforce integration, multi-currency support, and security features like SSO and audit trails.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', $q$who-its-for$q$, $q$Who Qobra is for$q$, 2, ARRAY[$q$Qobra is built for operations and finance teams that need reliable, automated commission calculations, and for sales reps who want real-time visibility into their earnings. The company cites customers including ElevenLabs, Make, GoCardless, and DataSnipper, and reports serving over 30,000 users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3a3af62-0fd4-4596-b2b3-6e071269284c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── QuotaPath ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$QuotaPath is an AI-native sales commission tracking and compensation management platform for RevOps, sales, and finance teams.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$35/user/month + $525/month platform fee (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$QuotaPath: AI-powered sales commission tracking and compensation management software with plan design, automation, and analytics.$q$,
  og_description = $q$QuotaPath: AI-powered sales commission tracking and compensation management software with plan design, automation, and analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0d09ae62-a1c6-4ce0-8abc-c1f4abd82023' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$AI-powered Plan Builder$q$, $q$Upload compensation documents or use a guided builder to set up quotas, accelerators, and commission rates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Commission Automation$q$, $q$Automates payout eligibility rules, dispute resolution, and commission payout calculations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Compensation Analytics$q$, $q$Provides real-time performance measurement to help teams evaluate and optimize commission strategy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Atlas AI Revenue Strategist$q$, $q$An add-on AI tool that analyzes attainment distribution and payout efficiency and recommends plan improvements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Collaborative Workspace$q$, $q$A shared environment for Sales, RevOps, and Finance to align on commission plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Compensation Benchmarking$q$, $q$Compares OTE, pay mix, and quota-to-OTE ratios against market data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$CRM and Finance Integrations$q$, $q$Connects with CRMs such as Salesforce, HubSpot, Close, Pipedrive, Zoho, and Copper, plus accounting, ERP/BI, and payroll tools like Rippling.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Free trial available before committing to a paid plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Integrates with a wide range of CRMs (Salesforce, HubSpot, Close, Pipedrive, Zoho, Copper) and finance/ERP systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Includes ledger and ASC 606 support for revenue recognition compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Optional Atlas AI add-on for deeper compensation strategy analysis$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Paid plans include dedicated implementation and account management support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Pricing combines a per-user fee with a separate monthly platform fee, adding cost complexity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Paid plans are billed annually rather than month-to-month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Atlas AI is a separate paid add-on starting at $5k, not included in base plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$The Strategic plan is not yet available$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Implementation can take 45-90 days depending on plan tier$q$, 4);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Does QuotaPath offer a free trial?$q$, $q$Yes, QuotaPath offers a free trial ('Try for Free') before requiring a paid subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$How is QuotaPath priced?$q$, $q$QuotaPath charges a per-user monthly fee plus a separate monthly platform fee; the Growth plan starts at $35/user/month plus a $525/month platform fee, billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$What CRMs does QuotaPath integrate with?$q$, $q$QuotaPath integrates with CRMs including Salesforce, HubSpot, Close, Pipedrive, Zoho, and Copper, along with accounting, ERP/BI, and payroll systems such as Rippling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Does QuotaPath include AI features?$q$, $q$Yes, QuotaPath includes an AI-powered Plan Builder for setting up compensation plans, and offers Atlas, an AI Revenue Strategist add-on, for additional strategy analysis.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Is there an enterprise plan?$q$, $q$QuotaPath lists a Strategic plan with custom pricing and bundled Atlas AI features, but it is noted as not yet available.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Commission plan design and automation$q$, $q$Teams use QuotaPath to build, automate, and manage sales commission and quota plans.$q$, $q$RevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Sales and finance alignment$q$, $q$A shared workspace lets Sales, RevOps, and Finance collaborate on and verify commission plans.$q$, $q$Sales leadership and finance departments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Compensation benchmarking$q$, $q$Companies compare OTE, pay mix, and quota-to-OTE ratios against market data to design competitive plans.$q$, $q$High-growth B2B SaaS companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Growth$q$, $q$$35/user/month + $525/month platform fee$q$, $q$annual$q$, $q$["Quota management","Leaderboards and contests","Manager plans","Plan verification","Calculated fields","Ledger & ASC 606 support","CRM integrations (Salesforce, HubSpot, Close, Pipedrive, Zoho, Copper)","1:1 implementation and dedicated account manager"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Premium$q$, $q$$50/user/month + $800/month platform fee$q$, $q$annual$q$, $q$["Everything in Growth","Plan modeling","Multi-level approvals","Custom reporting","Automated payroll sync","API access","SSO","Multi-source payouts","Dedicated data engineer and priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$Strategic$q$, $q$Custom (not yet available)$q$, NULL, $q$["Dedicated comp analyst","End-to-end plan design","Monthly commission runs","Dispute resolution","Scenario modeling","Benchmark recommendations","Bundled Atlas AI"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$overview$q$, $q$What is QuotaPath?$q$, 2, ARRAY[$q$QuotaPath is an AI-native sales commission tracking system that lets organizations design, run, and optimize sales compensation plans.$q$, $q$The platform automates commission calculations and payout eligibility, and includes an optional Atlas AI Revenue Strategist add-on that analyzes attainment distribution and payout efficiency to recommend plan improvements.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', $q$who-its-for$q$, $q$Who QuotaPath is for$q$, 2, ARRAY[$q$QuotaPath is built for RevOps teams, sales leadership, and finance departments, particularly at high-growth B2B SaaS companies that need to manage complex commission structures across CRM, ERP, and payroll systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d09ae62-a1c6-4ce0-8abc-c1f4abd82023', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── CaptivateIQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CaptivateIQ automates sales commission calculations and incentive compensation management for finance and RevOps teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CaptivateIQ automates commission calculations, sales planning, and incentive compensation with a no-code plan builder and real-time analytics.$q$,
  og_description = $q$CaptivateIQ automates commission calculations, sales planning, and incentive compensation with a no-code plan builder and real-time analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '171030c2-a2f0-41bf-b969-187ee5d4f56b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '171030c2-a2f0-41bf-b969-187ee5d4f56b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$SmartGrid calculation engine$q$, $q$Processes data from multiple source systems in real time to run accurate, auditable commission calculations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$No-code plan builder$q$, $q$Logic-based workbooks let compensation and RevOps teams modify commission plans without engineering support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Sales planning$q$, $q$Supports capacity planning, quota setting, and territory management alongside commission calculation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Predictive modeling$q$, $q$Uses machine learning to forecast payouts and flag anomalies before they reach payroll.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$AI agents$q$, $q$Natural-language tools help troubleshoot commission plans and surface optimization suggestions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Real-time reporting$q$, $q$Dashboards give sales, finance, and rep-level visibility into performance trends and payouts.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$No-code workbook builder reduces reliance on engineering for plan changes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Real-time commission calculation and payout transparency for reps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Named a Leader in the 2026 Gartner Magic Quadrant for Sales Performance Management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Connects to common CRM, ERP, and HCM systems including Salesforce and NetSuite$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Pricing is custom and not published, requiring a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$No free trial or freemium tier is offered$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Aimed at organizations with complex compensation needs, which may be more than small teams require$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$What does CaptivateIQ do?$q$, $q$It automates sales commission calculations, incentive compensation management, and sales planning for finance and revenue operations teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Is there a free trial?$q$, $q$The website does not advertise a free trial or freemium plan; pricing is custom based on payees, complexity, and integrations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$What systems does CaptivateIQ integrate with?$q$, $q$It connects with CRM, ERP, and HCM systems such as Salesforce, HubSpot, NetSuite, and Workday via APIs and data imports.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Who uses CaptivateIQ?$q$, $q$Compensation professionals, finance and accounting teams, and sales/revenue operations at enterprise and mid-market companies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Automating commission calculations$q$, $q$Replace spreadsheet-based commission processes with an auditable, real-time calculation engine.$q$, $q$Finance and compensation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$Sales capacity and territory planning$q$, $q$Set quotas and manage territories alongside compensation plans in one platform.$q$, $q$Revenue operations teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$overview$q$, $q$What is CaptivateIQ?$q$, 2, ARRAY[$q$CaptivateIQ is a sales performance management platform that automates commission calculations, sales planning, and incentive compensation administration. It is built to handle complex compensation plans, quota setting, and territory management without requiring heavy IT involvement.$q$, $q$The platform includes a no-code workbook builder, real-time calculation engine, and predictive modeling tools, and it connects to CRM, ERP, and HCM systems to pull the data needed for commission runs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', $q$who-its-for$q$, $q$Who CaptivateIQ is for$q$, 2, ARRAY[$q$CaptivateIQ is aimed at compensation, finance, and revenue operations teams at enterprise and mid-market organizations managing complex or high-volume commission structures.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('171030c2-a2f0-41bf-b969-187ee5d4f56b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Everstage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Everstage automates sales commission tracking, planning, and CPQ for revenue operations and finance teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Everstage automates sales commission tracking with live forecasting, a self-serve plan builder, and territory and quota planning tools.$q$,
  og_description = $q$Everstage automates sales commission tracking with live forecasting, a self-serve plan builder, and territory and quota planning tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '087b7f82-9397-45ec-9b2b-8507a996af85';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '087b7f82-9397-45ec-9b2b-8507a996af85' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Crystal Commissions$q$, $q$Gives sales reps live, pipeline-based forecasting of their expected commissions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Plan simulation$q$, $q$Lets teams test compensation rule changes and preview outcomes before deploying a plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Self-serve plan builder$q$, $q$A drag-and-drop interface lets non-technical staff build and manage commission plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Planning module$q$, $q$Handles territory and quota planning alongside incentive compensation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$CPQ$q$, $q$Generates quotes with AI assistance as part of the broader Everstage product suite.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Rated 4.8/5 on G2 and 4.7/5 on Gartner based on 2,500+ reviews$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Self-serve plan builder reduces dependency on technical teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Live, pipeline-based commission forecasting for reps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Recognized as a Challenger in the 2026 Gartner Magic Quadrant$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$No free trial or freemium tier advertised$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$What does Everstage do?$q$, $q$It automates sales commission tracking, incentive planning, and quote generation for revenue operations and finance teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Does Everstage offer live commission forecasting?$q$, $q$Yes, its Crystal Commissions feature gives reps pipeline-based forecasts of expected commissions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Is Everstage rated well by users?$q$, $q$It holds a 4.8/5 rating on G2 and 4.7/5 on Gartner based on more than 2,500 reviews.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Is there public pricing for Everstage?$q$, $q$No, pricing is custom and available on request.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Commission forecasting for reps$q$, $q$Give sales reps real-time visibility into projected commissions based on pipeline data.$q$, $q$Sales representatives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$Self-serve compensation plan management$q$, $q$Let RevOps and compensation teams build and adjust plans without engineering support.$q$, $q$RevOps and compensation teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$overview$q$, $q$What is Everstage?$q$, 2, ARRAY[$q$Everstage is a sales compensation platform that automates commission tracking, planning, and quoting for sales organizations. It combines an incentives module, a territory and quota planning module, and CPQ into one system.$q$, $q$Its Crystal Commissions feature gives reps live, pipeline-based forecasts of their earnings, and a self-serve, drag-and-drop plan builder lets non-technical teams manage compensation logic directly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', $q$who-its-for$q$, $q$Who Everstage is for$q$, 2, ARRAY[$q$Everstage is built for RevOps, sales compensation, finance, and HR teams at companies including SaaS, telecommunications, manufacturing, and medical device businesses.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b7f82-9397-45ec-9b2b-8507a996af85', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Forma.ai ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Forma.ai is an AI-powered sales compensation platform unifying incentive management, territory planning, and quota setting.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Toronto, Canada$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Forma.ai unifies incentive compensation, territory planning, and quota setting with AI-assisted plan design and 600+ pre-built integrations.$q$,
  og_description = $q$Forma.ai unifies incentive compensation, territory planning, and quota setting with AI-assisted plan design and 600+ pre-built integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd52f8727-8700-449a-a039-f5c8df0a1fe0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Forma Operator (ICM)$q$, $q$Automates incentive compensation management with flexible, configurable plan design.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Forma Architect$q$, $q$Handles territory and quota planning as part of the broader compensation platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Forma Prophet$q$, $q$Provides sales planning advisory backed by machine learning analytics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$AI-enabled plan configuration$q$, $q$Guided templates and natural-language input help build incentive structures.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Pre-built integrations$q$, $q$Over 600 pre-built integrations sync data across CRM, ERP, and other source systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Real-time modeling engine$q$, $q$Runs financial projections for compensation scenarios.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Combines incentive compensation, territory planning, and quota setting in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$600+ pre-built integrations for data synchronization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Featured positively in the Forrester Wave Report Q1 2025$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Used by enterprises managing billions in commission spend$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$No free trial or freemium tier is advertised$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Founding year and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$What does Forma.ai do?$q$, $q$It is an AI-powered sales performance management platform that unifies incentive compensation, territory planning, quota setting, and sales analytics.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Where is Forma.ai headquartered?$q$, $q$Forma.ai is headquartered in Toronto, Ontario, Canada.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$How many integrations does Forma.ai offer?$q$, $q$The company states it offers more than 600 pre-built integrations for data synchronization.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Is Forma.ai pricing public?$q$, $q$No, pricing is not published on the website and requires contacting sales.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Enterprise incentive compensation management$q$, $q$Automate the design, calculation, and administration of complex commission plans.$q$, $q$Sales compensation and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$Territory and quota planning$q$, $q$Plan sales territories and quotas using machine learning-backed analytics.$q$, $q$Sales operations and RevOps leaders$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$overview$q$, $q$What is Forma.ai?$q$, 2, ARRAY[$q$Forma.ai is an AI-powered sales performance management platform that unifies incentive compensation, territory planning, quota setting, and sales analytics in one system. It is headquartered in Toronto, Canada.$q$, $q$Its product suite includes Forma Operator for incentive compensation management, Forma Architect for territory and quota planning, and Forma Prophet for machine learning-backed sales planning advisory, connected through more than 600 pre-built integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', $q$who-its-for$q$, $q$Who Forma.ai is for$q$, 2, ARRAY[$q$Forma.ai targets sales compensation professionals, RevOps leaders, sales leadership, and finance and HR teams at enterprise organizations with complex sales structures.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d52f8727-8700-449a-a039-f5c8df0a1fe0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Performio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Performio calculates complex sales commission plans with real-time visibility for companies with 70+ commissionable employees.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Performio calculates complex sales commission plans, offers a no-code plan builder, and gives real-time payout visibility with embedded AI.$q$,
  og_description = $q$Performio calculates complex sales commission plans, offers a no-code plan builder, and gives real-time payout visibility with embedded AI.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bac928b-8b56-4410-b495-f9ee3e28df6b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bac928b-8b56-4410-b495-f9ee3e28df6b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Incentive compensation management$q$, $q$Calculates complex commission plans with accuracy across large commissionable populations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Analytics Studio$q$, $q$Provides real-time insights and reporting on commission and plan performance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$No-code plan builder$q$, $q$Lets teams update compensation plans without requiring IT support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Data integrations$q$, $q$Pulls data from CRM, ERP, HRIS, and finance systems for calculations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Seller dashboards$q$, $q$Give reps real-time visibility into commission earnings.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Automated approval workflows$q$, $q$Streamlines end-to-end commission approval processes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Built for organizations with 70+ commissionable employees and complex plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$No-code plan builder reduces dependence on IT$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Recognized as a Momentum Leader and Enterprise Leader on G2 (Summer 2026)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Integrates with CRM, ERP, HRIS, and finance systems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Targeted at larger commissionable populations, less suited to very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Founding year and headquarters are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$What does Performio do?$q$, $q$It is a sales commission and incentive compensation management platform that calculates complex commission plans and provides real-time payout visibility.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Who is Performio built for?$q$, $q$Organizations with 70 or more commissionable employees running complex commission plans, across industries like manufacturing, MedTech, and SaaS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Does Performio need IT support to change plans?$q$, $q$No, its no-code plan builder lets teams update compensation plans without IT involvement.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Is Performio pricing public?$q$, $q$No, pricing details are not published on the website.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Enterprise commission calculation$q$, $q$Automate complex commission plan calculations for large commissionable populations.$q$, $q$Finance and compensation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$Real-time payout visibility$q$, $q$Give sales reps dashboards showing commission earnings as they accrue.$q$, $q$Sales representatives and managers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$overview$q$, $q$What is Performio?$q$, 2, ARRAY[$q$Performio is a sales commission and incentive compensation management platform that calculates complex commission plans and provides real-time visibility into payouts. It is designed for organizations with 70 or more commissionable employees.$q$, $q$The platform includes a no-code plan builder, an Analytics Studio for reporting, embedded AI capabilities, and integrations with CRM, ERP, HRIS, and finance systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', $q$who-its-for$q$, $q$Who Performio is for$q$, 2, ARRAY[$q$Performio serves enterprise and mid-market companies with large sales teams and complex commission structures, across industries such as manufacturing, MedTech, transportation, banking, insurance, SaaS, and telecommunications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bac928b-8b56-4410-b495-f9ee3e28df6b', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Xactly Incent ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Xactly Incent automates sales commission design, calculation, and compliance for enterprise revenue teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Xactly Incent automates incentive compensation, real-time commission transparency, ASC 606 compliance, and AI anomaly detection.$q$,
  og_description = $q$Xactly Incent automates incentive compensation, real-time commission transparency, ASC 606 compliance, and AI anomaly detection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be3d358d-02c4-42e2-b373-1d918d655065';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be3d358d-02c4-42e2-b373-1d918d655065' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Compensation Configurator$q$, $q$Builds complex compensation plans from reusable elements and AI-trained logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Real-time transparency$q$, $q$Gives sales reps instant access to commission dashboards and earnings statements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Automated calculations$q$, $q$Handles complex mechanics including split commissions, accelerators, and clawbacks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Compliance automation$q$, $q$Supports ASC 606 and IFRS 15 compliance with audit trails.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Data integration$q$, $q$Connects with CRM, ERP, and HCM systems including Salesforce, ServiceNow, and NetSuite.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$AI anomaly detection$q$, $q$Flags unusual payouts before processing so errors are caught prior to payroll.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Mobile access$q$, $q$Native Android and iOS apps give reps access to commission data on the go.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Named a Leader in the 2026 Gartner Magic Quadrant for Sales Performance Management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Reports 99.6% commission forecasting accuracy and 99.8% on-time payment accuracy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$AI anomaly detection catches payout errors before payroll processing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Native iOS and Android apps for reps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Won the TrustRadius Buyer's Choice Award 2026$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Founding year and headquarters are not disclosed on this page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Built for enterprise-scale compensation needs, which may exceed small business requirements$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$What does Xactly Incent do?$q$, $q$It automates the design, calculation, and administration of sales commissions and bonuses, replacing manual spreadsheet-based processes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Does Xactly Incent support compliance requirements?$q$, $q$Yes, it includes compliance automation for ASC 606 and IFRS 15 with audit trails.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Is Xactly Incent available on mobile?$q$, $q$Yes, it offers native Android and iOS apps for sales reps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$What accuracy does Xactly Incent report?$q$, $q$The company states 99.6% commission forecasting accuracy and 99.8% on-time payment accuracy.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Enterprise commission automation$q$, $q$Replace manual spreadsheet processes with automated commission design and calculation.$q$, $q$Compensation administrators and finance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$Compliance-driven compensation$q$, $q$Maintain ASC 606 and IFRS 15 compliance with automated audit trails.$q$, $q$Finance and compliance teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$overview$q$, $q$What is Xactly Incent?$q$, 2, ARRAY[$q$Xactly Incent is an incentive compensation management platform that automates the design, calculation, and administration of sales commissions and bonuses, replacing manual spreadsheet-based processes.$q$, $q$It includes a Compensation Configurator for building complex plans, AI anomaly detection to catch payout errors before payroll, and compliance automation for standards like ASC 606 and IFRS 15, alongside native mobile apps for reps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', $q$who-its-for$q$, $q$Who Xactly Incent is for$q$, 2, ARRAY[$q$Xactly Incent is built for compensation administrators, sales managers, HR, finance, and RevOps teams at enterprise organizations managing complex commission structures.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be3d358d-02c4-42e2-b373-1d918d655065', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Sales Cookie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sales Cookie is a cloud-based platform that automates sales commission calculations and gives reps real-time payout visibility.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Spokane, Washington, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sales Cookie automates sales commission calculations with claw-backs, true-ups, multi-currency support, and real-time rep dashboards.$q$,
  og_description = $q$Sales Cookie automates sales commission calculations with claw-backs, true-ups, multi-currency support, and real-time rep dashboards.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a5b12745-37b0-4202-a0e1-39121d42e60e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a5b12745-37b0-4202-a0e1-39121d42e60e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$AI-powered commission administration$q$, $q$Supports AI-assisted queries for managing commission plans and data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Claw-back and true-up support$q$, $q$Handles commission adjustments including claw-backs and true-ups automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Manager override plans$q$, $q$Supports complex crediting logic for manager-level overrides.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Double-payment detection$q$, $q$Flags and prevents duplicate commission payouts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Multi-currency support$q$, $q$Calculates commissions across multiple currencies for global sales teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Rep dashboards$q$, $q$Show goals, commissions, and pending payouts in real time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Free trial with instant access and no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Handles complex commission logic including claw-backs, true-ups, and manager overrides$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Integrates with CRM, accounting, and BI tools including Salesforce, HubSpot, NetSuite, and QuickBooks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Designed for both simple and complex commission structures$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Pricing tiers and exact costs are not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Founding year and company size are not disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Primarily positioned for SMB sales teams, which may limit enterprise-scale fit$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$What does Sales Cookie do?$q$, $q$It is a cloud-based platform that automates sales commission calculations, replacing manual spreadsheets with real-time, transparent payout tracking.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Does Sales Cookie offer a free trial?$q$, $q$Yes, it offers a free trial with instant access and no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$What integrations does Sales Cookie support?$q$, $q$It integrates with systems including Salesforce, HubSpot, NetSuite, QuickBooks, Xero, Stripe, PayPal, Power BI, Tableau, and Zapier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Where is Sales Cookie based?$q$, $q$The company is based in Spokane, Washington, USA.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$SMB commission automation$q$, $q$Replace spreadsheet-based commission tracking with an automated, transparent system.$q$, $q$Small and medium-sized sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$Multi-currency commission calculation$q$, $q$Calculate and track commissions for global sales teams across currencies.$q$, $q$International sales organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$overview$q$, $q$What is Sales Cookie?$q$, 2, ARRAY[$q$Sales Cookie is a cloud-based SaaS platform that automates sales commission management and calculation, replacing manual spreadsheets with automated calculations and real-time transparency for reps.$q$, $q$It supports claw-backs, true-ups, manager override plans, double-payment detection, and multi-currency calculations, and connects with CRM, accounting, and BI tools such as Salesforce, HubSpot, NetSuite, and QuickBooks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', $q$who-its-for$q$, $q$Who Sales Cookie is for$q$, 2, ARRAY[$q$Sales Cookie is aimed at small to medium-sized businesses with sales teams that need automated commission management, whether their compensation structures are simple or complex.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a5b12745-37b0-4202-a0e1-39121d42e60e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Plecto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Plecto is a real-time KPI dashboard and gamification platform that centralizes sales and service data to motivate teams.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$300/month (billed yearly)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Denmark$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Plecto centralizes sales and service data into real-time dashboards with gamification, coaching tools, and 150+ integrations.$q$,
  og_description = $q$Plecto centralizes sales and service data into real-time dashboards with gamification, coaching tools, and 150+ integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '794737f5-a11c-4c4b-bd01-c5bd60d80316';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '794737f5-a11c-4c4b-bd01-c5bd60d80316' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Real-time dashboards$q$, $q$Centralizes data from multiple sources into live KPI dashboards and TV displays.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Customizable KPI building$q$, $q$Lets teams define and track the metrics that matter to their business.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Gamification$q$, $q$Includes contests, achievements, and notifications to boost team motivation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$150+ integrations$q$, $q$Connects with CRM, helpdesk, and telephony systems to pull performance data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Coaching and training tools$q$, $q$Supports one-on-ones and quizzes for employee development via an add-on module.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$AI-powered dashboard creation$q$, $q$Uses Model Context Protocol (MCP) to help build dashboards with AI assistance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$14-day free trial available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$150+ integrations with CRM, helpdesk, and telephony systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Gamification features like contests and a reward store are included on higher tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$GDPR compliant, with headquarters in the EU$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Contests, spinning wheel, and reward store features require the Large plan or above$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Dynamic Dashboards and Coaching modules are paid add-ons with separate monthly fees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Enterprise features like custom integrations require custom/quote-only pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$What does Plecto do?$q$, $q$It is a KPI dashboard platform that centralizes data from multiple sources into real-time dashboards, with gamification features to motivate sales and service teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$How much does Plecto cost?$q$, $q$The Medium plan starts at $300/month billed yearly for 10 tracked licenses, and the Large plan starts at $465/month billed yearly for 10 licenses; Enterprise pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Does Plecto offer a free trial?$q$, $q$Yes, Plecto offers a 14-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Where is Plecto based?$q$, $q$Plecto is headquartered in Denmark and is GDPR compliant.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Sales team gamification$q$, $q$Motivate sales reps with contests, achievements, and real-time leaderboards.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Contact center performance monitoring$q$, $q$Track KPIs like call volume and response time on live dashboards.$q$, $q$Customer service and contact center teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Medium$q$, $q$$300/month$q$, $q$annual$q$, $q$["10 tracked licenses ($30/license)","Unlimited dashboards","Unlimited data sources","Chat and email support","API access","SSO (SAML2)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Large$q$, $q$$465/month$q$, $q$annual$q$, $q$["10 tracked licenses ($46.5/license)","Customer success manager","Contests and reward store","SQL integrations","Custom themes","Custom permission profiles"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["On-site setup","Volume discount","Custom integrations","Custom NDA and DPA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$overview$q$, $q$What is Plecto?$q$, 2, ARRAY[$q$Plecto is a dashboard platform that enables sales and customer service teams to monitor KPI data in real time. It centralizes data from multiple sources and visualizes metrics on dashboards and TV displays.$q$, $q$The platform incorporates gamification elements such as contests, achievements, and a reward store to boost team motivation, alongside coaching tools and more than 150 integrations with CRM, helpdesk, and telephony systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', $q$who-its-for$q$, $q$Who Plecto is for$q$, 2, ARRAY[$q$Plecto is used by sales teams, customer service representatives, and contact centers across industries including telecom, insurance, retail, eCommerce, real estate, energy, and SaaS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('794737f5-a11c-4c4b-bd01-c5bd60d80316', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Ambition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ambition is a sales performance and coaching platform that combines real-time leaderboards with automated coaching orchestration.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$45/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ambition combines real-time sales leaderboards with automated coaching orchestration and AI-driven performance insights.$q$,
  og_description = $q$Ambition combines real-time sales leaderboards with automated coaching orchestration and AI-driven performance insights.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Coaching Orchestration$q$, $q$Automates coaching cadences and structured 1:1 meetings with centralized documentation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Sales Activation$q$, $q$Provides top-down visibility, focus alignment, and coaching frameworks for execution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Performance Intelligence$q$, $q$Surfaces risk detection and forecasting through context-aware insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Agentic AI$q$, $q$Offers context-aware AI recommendations on performance, available as an add-on.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Real-time leaderboards$q$, $q$Tracks activity and objective scorecards with automated accolades.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Salesforce integration and SSO$q$, $q$All tiers include API access, dashboards, Salesforce integration, and SAML/SSO.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Clear, published per-user pricing across three tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Used by notable organizations including the Dallas Mavericks and T-Mobile$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Recognized as a Notable Vendor in the Forrester Revenue Enablement Landscape Report Q1 2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Reported customer results include 7 hours of weekly time savings for managers and 33% faster rep ramp time$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$AI Insights and AI Actions are paid add-ons on top of base per-user pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Standard contracts are structured with a two-year annual term$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$What does Ambition do?$q$, $q$It is a performance orchestration platform that operationalizes sales execution and coaching using real-time leaderboards and automated coaching workflows.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$How much does Ambition cost?$q$, $q$Pricing starts at $45/user/month for the Starter tier, $65/user/month for Pro, and $75/user/month for Enterprise, with optional AI Insights and AI Actions add-ons.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$What is Ambition's contract term?$q$, $q$Contracts are structured annually, with a two-year term as the standard.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Does Ambition integrate with Salesforce?$q$, $q$Yes, Salesforce integration is included across all pricing tiers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Sales coaching orchestration$q$, $q$Automate coaching cadences and structured 1:1 meetings with centralized documentation.$q$, $q$Sales managers and enablement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Performance visibility and gamification$q$, $q$Track rep activity and results on real-time leaderboards and scorecards.$q$, $q$Sales leadership and reps$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Starter - Seller Activation$q$, $q$$45/user/month$q$, $q$monthly$q$, $q$["Real-time leaderboards","Activity and objective scorecards","Automated accolades","Productivity quadrant"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Pro - Coaching Orchestration$q$, $q$$65/user/month$q$, $q$monthly$q$, $q$["Coaching pre-reads","Calendar sync integration","Pipeline snapshot","Conversation data"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$Enterprise - Revenue Execution System$q$, $q$$75/user/month$q$, $q$monthly$q$, $q$["Coaching analytics","Conversational intelligence","Private hosting","Sandbox environments"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$overview$q$, $q$What is Ambition?$q$, 2, ARRAY[$q$Ambition is a performance orchestration platform designed to operationalize sales execution and coaching across revenue teams. It unifies strategy and activity data to deliver actionable insights and automate coaching workflows.$q$, $q$The platform is offered in three tiers -- Starter, Pro, and Enterprise -- priced per user per month, with optional AI Insights and AI Actions add-ons and standard two-year annual contracts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', $q$who-its-for$q$, $q$Who Ambition is for$q$, 2, ARRAY[$q$Ambition targets sales leadership, CROs, sales enablement professionals, revenue operations teams, and inside sales and sales development teams at enterprise organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b9d911e-cdb9-4f76-b94a-b0fe00d5f0fb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Spinify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Spinify turns CRM data into real-time sales leaderboards, gamified competitions, and AI-powered recognition and coaching.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Spinify transforms CRM data into real-time leaderboards, gamified competitions, and AI-powered coaching and recognition for sales teams.$q$,
  og_description = $q$Spinify transforms CRM data into real-time leaderboards, gamified competitions, and AI-powered coaching and recognition for sales teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$AI-powered gamification$q$, $q$Creates dynamic competitions with real-time leaderboards and personalized rewards.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$AI coaching$q$, $q$Delivers personalized, scalable coaching sessions for individual reps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Team recognition$q$, $q$Surfaces real-time achievement recognition with customizable rewards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Brand customization$q$, $q$Incorporates company branding into leaderboards and celebrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Multi-platform access$q$, $q$Displays leaderboards and competitions on TV, web, and mobile.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Reward stores$q$, $q$Personalized reward stores are available on higher-tier plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Rated 4.6/5 from 980+ reviews and ranked #1 in G2's Sales Gamification category$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Reports powering more than 1.5 million competitions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Wide integration support including Salesforce, HubSpot, Microsoft Dynamics, and Slack$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$30-day money-back guarantee on annual plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Used by notable brands including Coca-Cola, Prudential, Cisco, and Deloitte$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Exact per-user pricing is not published on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real Estate Starter and Agency editions require minimum user counts (5 and 50 respectively)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Enterprise tier requires a minimum of 200+ seats$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Founding year and headquarters are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$What does Spinify do?$q$, $q$It is a sales gamification platform that transforms CRM data into real-time leaderboards, automated competitions, and recognition systems to motivate sales teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$What integrations does Spinify support?$q$, $q$Spinify integrates with Salesforce, HubSpot, Microsoft Dynamics, Microsoft Teams, Excel, Google Sheets, Salesloft, Tableau, Pipedrive, Outreach, and Slack, among others.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Does Spinify offer a money-back guarantee?$q$, $q$Yes, it offers a 30-day money-back guarantee on annual plans with full product access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$How is Spinify rated?$q$, $q$It holds a 4.6/5 rating from more than 980 G2 reviews and is ranked #1 in G2's Sales Gamification category.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Sales team gamification$q$, $q$Run automated competitions and real-time leaderboards to motivate reps.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real estate agency performance$q$, $q$Track competitions and goals across real estate agent teams with a dedicated edition.$q$, $q$Real estate agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Business Edition$q$, $q$Per user/month, billed annually$q$, $q$annual$q$, $q$["Unlimited TV displays and competitions","3 AI agents (Sidekick, Recognition, Coaching)","50+ integrations","Personalized reward stores"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real Estate Edition - Starter$q$, $q$Per user/month, billed annually (5-user minimum)$q$, $q$annual$q$, $q$["10 active competitions","3 TV displays","20+ ways to compete","Connect up to 3 data sources"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real Estate Edition - Agency$q$, $q$Per user/month, billed annually (50-user minimum)$q$, $q$annual$q$, $q$["Unlimited active competitions","Unlimited TV displays","5 personalized reward stores","Unlimited data sources"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Enterprise$q$, $q$Custom flat rate (200+ seats)$q$, NULL, $q$["SSO","Dedicated success partner with SLAs","Full API access","Global rollout support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$overview$q$, $q$What is Spinify?$q$, 2, ARRAY[$q$Spinify is a sales gamification platform that transforms CRM data into real-time leaderboards, automated competitions, and recognition systems to motivate sales teams and drive performance.$q$, $q$It offers AI-powered gamification and coaching agents, brand-customizable leaderboards, and access across TV, web, and mobile, with integrations including Salesforce, HubSpot, and Microsoft Dynamics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$who-its-for$q$, $q$Who Spinify is for$q$, 2, ARRAY[$q$Spinify serves sales teams across industries including SaaS, insurance, recruitment, real estate, call centers, and financial services, supporting both remote and in-office teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SalesScreen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SalesScreen combines AI-driven activity insights with sales gamification to surface performance signals and drive behavior.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Norway$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SalesScreen uses AI to scan sales activity data and pairs it with gamified competitions, missions, and coaching tools.$q$,
  og_description = $q$SalesScreen uses AI to scan sales activity data and pairs it with gamified competitions, missions, and coaching tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Scout AI$q$, $q$Continuously scans calls, meetings, follow-ups, and pipeline movement to identify risk and momentum before revenue metrics are affected.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Agentic gamification$q$, $q$Suggests competitions, missions, streaks, and rewards tailored to drive specific behaviors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Real-time activity tracking$q$, $q$Monitors daily rep actions and provides visibility into what drives results.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Performance coaching$q$, $q$Offers context-aware coaching tools and personalized recognition.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$CRM integration$q$, $q$Sits across existing sales tools including CRM and conversation intelligence platforms.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$30-day free trial with no credit card required (Essentials plan)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$AI-driven activity monitoring flags risk before it shows up in revenue metrics$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Reported customer results include a 61% increase in middle performer KPIs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Enterprise tier includes a 99.5% uptime SLA$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Exact per-user pricing for Scale and Pro plans is not published on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Scale and Pro plans require minimum team sizes of 10 and 15 users respectively$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Coaching and Scorecards is a paid add-on at $5/user/month$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Founding year and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$What does SalesScreen do?$q$, $q$It is a sales gamification and performance management platform that uses AI to surface early performance signals and automate targeted interventions like competitions and missions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Does SalesScreen offer a free trial?$q$, $q$Yes, its Essentials plan is free for 30 days with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$What is Scout AI?$q$, $q$Scout AI is SalesScreen's feature that continuously scans activity data such as calls, meetings, and pipeline movement to identify risk and momentum early.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Where is SalesScreen based?$q$, $q$The company operates as Dogu SalesScreen AS, registered in Norway.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Early performance risk detection$q$, $q$Use AI to spot declining activity trends before they affect revenue.$q$, $q$Sales managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Sales gamification and recognition$q$, $q$Run competitions, missions, and reward programs to reinforce productive behaviors.$q$, $q$Sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Essentials$q$, $q$Free for 30 days$q$, NULL, $q$["Up to 4 metrics","Basic competitions","Interactive feed","10 achievements"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Scale$q$, $q$Per user/month (10+ users)$q$, $q$monthly$q$, $q$["Up to 8 metrics","Targets on metrics","Missions","XP/levels","One premium integration add-on"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Pro$q$, $q$Per user/month (15+ users)$q$, $q$monthly$q$, $q$["Unlimited metrics","Metric funnels","All competition types","Customizable reward shop","Unlimited integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Private database","UI customization","Multiple accounts","99.5% uptime SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$overview$q$, $q$What is SalesScreen?$q$, 2, ARRAY[$q$SalesScreen is a sales gamification and performance management platform that combines AI-driven insights with motivational game mechanics to drive consistent sales team performance.$q$, $q$Its Scout AI feature scans activity data such as calls, meetings, and pipeline movement to identify risk and momentum before it shows up in revenue numbers, while agentic gamification suggests competitions, missions, and rewards tailored to specific behaviors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', $q$who-its-for$q$, $q$Who SalesScreen is for$q$, 2, ARRAY[$q$SalesScreen is used by sales managers and frontline sales teams across industries including insurance, financial services, real estate, software, recruitment, and call centers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfe49e03-fbc6-4c28-83dc-fa4e4e5939d7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

