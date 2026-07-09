/*
  # Fix New Jersey intro — remove casino/gambling text, replace with clean exact copy

  ## Problem
  The state_content row for state_slug = 'new-jersey' contained injected spam/SEO text
  referencing "casino zonder registratie", "online gambling", and casino brands. This text
  appeared in ALL four intro fields: hero_intro, hero_intro_short, state_intro_short,
  state_intro_full.

  ## Changes
  - Updates state_content WHERE state_slug = 'new-jersey'
  - Sets hero_intro, hero_intro_short, state_intro_short, state_intro_full to the exact
    approved marketing-agencies intro text (verbatim, no modifications)
  - Sets updated_at to now()

  ## Fields updated
  1. hero_intro — full intro text (3 paragraphs)
  2. hero_intro_short — same exact text (no abbreviated version)
  3. state_intro_short — same exact text
  4. state_intro_full — same exact text

  ## Security note
  No forbidden keywords (casino, gambling, slots, free spins, slot machine) remain in any
  NJ intro field after this migration.

  ## Verification
  Run after applying:
    SELECT state_slug FROM state_content
    WHERE state_slug = 'new-jersey'
      AND (hero_intro ILIKE '%casino%' OR hero_intro ILIKE '%gambling%'
        OR hero_intro_short ILIKE '%casino%' OR hero_intro_short ILIKE '%gambling%'
        OR state_intro_short ILIKE '%casino%' OR state_intro_short ILIKE '%gambling%'
        OR state_intro_full ILIKE '%casino%' OR state_intro_full ILIKE '%gambling%');
  -- Expected: 0 rows
*/

UPDATE state_content
SET
  hero_intro = 'New Jersey''s marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting. With over 1000 marketing agencies operating in New Jersey, our curated list aims to simplify your search, connecting you with a New Jersey-based agency that aligns with your marketing objectives.

The Garden State''s marketing firms reflect its unique blend of bustling metropolitan areas, like Newark and Jersey City, and its quieter, suburban localities. This diversity enables New Jersey''s agencies to offer a broad range of services, from cutting-edge digital marketing to traditional advertising and branding strategies. They cater to a diverse clientele, including everything from burgeoning local startups to well-established companies in sectors like pharmaceuticals, finance, and telecommunications, which are prominent in New Jersey.

What sets New Jersey''s marketing agencies apart is their ability to navigate a state that is both a major business hub and a neighbor to the media capital of the world, New York City. This proximity influences their approaches, often blending aggressive metropolitan marketing tactics with a nuanced understanding of local New Jersey markets. Additionally, there is a strong focus on innovation and digital trends, owing to the state''s growing tech sector. This positions New Jersey''s marketing agencies as not just service providers, but as strategic partners capable of guiding businesses through both regional market nuances and broader, global market trends. Without further ado lets dive into the top 25 marketing agencies in New Jersey.',

  hero_intro_short = 'New Jersey''s marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting. With over 1000 marketing agencies operating in New Jersey, our curated list aims to simplify your search, connecting you with a New Jersey-based agency that aligns with your marketing objectives.

The Garden State''s marketing firms reflect its unique blend of bustling metropolitan areas, like Newark and Jersey City, and its quieter, suburban localities. This diversity enables New Jersey''s agencies to offer a broad range of services, from cutting-edge digital marketing to traditional advertising and branding strategies. They cater to a diverse clientele, including everything from burgeoning local startups to well-established companies in sectors like pharmaceuticals, finance, and telecommunications, which are prominent in New Jersey.

What sets New Jersey''s marketing agencies apart is their ability to navigate a state that is both a major business hub and a neighbor to the media capital of the world, New York City. This proximity influences their approaches, often blending aggressive metropolitan marketing tactics with a nuanced understanding of local New Jersey markets. Additionally, there is a strong focus on innovation and digital trends, owing to the state''s growing tech sector. This positions New Jersey''s marketing agencies as not just service providers, but as strategic partners capable of guiding businesses through both regional market nuances and broader, global market trends. Without further ado lets dive into the top 25 marketing agencies in New Jersey.',

  state_intro_short = 'New Jersey''s marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting. With over 1000 marketing agencies operating in New Jersey, our curated list aims to simplify your search, connecting you with a New Jersey-based agency that aligns with your marketing objectives.

The Garden State''s marketing firms reflect its unique blend of bustling metropolitan areas, like Newark and Jersey City, and its quieter, suburban localities. This diversity enables New Jersey''s agencies to offer a broad range of services, from cutting-edge digital marketing to traditional advertising and branding strategies. They cater to a diverse clientele, including everything from burgeoning local startups to well-established companies in sectors like pharmaceuticals, finance, and telecommunications, which are prominent in New Jersey.

What sets New Jersey''s marketing agencies apart is their ability to navigate a state that is both a major business hub and a neighbor to the media capital of the world, New York City. This proximity influences their approaches, often blending aggressive metropolitan marketing tactics with a nuanced understanding of local New Jersey markets. Additionally, there is a strong focus on innovation and digital trends, owing to the state''s growing tech sector. This positions New Jersey''s marketing agencies as not just service providers, but as strategic partners capable of guiding businesses through both regional market nuances and broader, global market trends. Without further ado lets dive into the top 25 marketing agencies in New Jersey.',

  state_intro_full = 'New Jersey''s marketing agency scene is as dynamic and diverse as the state itself, offering a plethora of options for businesses seeking to enhance their market presence. However, navigating this landscape to find the ideal agency for your specific needs can be daunting. With over 1000 marketing agencies operating in New Jersey, our curated list aims to simplify your search, connecting you with a New Jersey-based agency that aligns with your marketing objectives.

The Garden State''s marketing firms reflect its unique blend of bustling metropolitan areas, like Newark and Jersey City, and its quieter, suburban localities. This diversity enables New Jersey''s agencies to offer a broad range of services, from cutting-edge digital marketing to traditional advertising and branding strategies. They cater to a diverse clientele, including everything from burgeoning local startups to well-established companies in sectors like pharmaceuticals, finance, and telecommunications, which are prominent in New Jersey.

What sets New Jersey''s marketing agencies apart is their ability to navigate a state that is both a major business hub and a neighbor to the media capital of the world, New York City. This proximity influences their approaches, often blending aggressive metropolitan marketing tactics with a nuanced understanding of local New Jersey markets. Additionally, there is a strong focus on innovation and digital trends, owing to the state''s growing tech sector. This positions New Jersey''s marketing agencies as not just service providers, but as strategic partners capable of guiding businesses through both regional market nuances and broader, global market trends. Without further ado lets dive into the top 25 marketing agencies in New Jersey.',

  updated_at = now()
WHERE state_slug = 'new-jersey';
