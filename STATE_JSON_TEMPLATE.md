# State JSON Data Structure Template

This document defines the required and optional fields for each state's JSON data file.

## File Location
Place JSON files in: `/public/data/{state-slug}.json`

Example: `/public/data/new-jersey.json`, `/public/data/california.json`

## Required Fields

### Basic Info
```json
{
  "state": "new-jersey",           // State slug (lowercase, hyphenated)
  "stateName": "New Jersey",       // Full state name for display
  "agencies": []                   // Array of agency objects (see below)
}
```

### Agency Object Structure
```json
{
  "rank": 1,                       // Position in top 25 (1-25)
  "name": "Agency Name",           // Agency name
  "website": "https://...",        // Agency website URL
  "logoUrl": "https://...",        // Logo URL
  "description": "...",            // Brief description (1-2 sentences)
  "services": ["SEO", "PPC"],      // Array of service offerings
  "isPaid": false,                 // Whether agency has paid placement
  "city": "City Name"              // Optional: City location
}
```

## Optional But Recommended Fields

### Hero Section Content
```json
{
  "hero_intro": "Full intro text that appears in the hero section. Should mention the state name, number of agencies, and key industries.",
  "hero_intro_short": "Shorter version for mobile display (optional, will auto-truncate if not provided)"
}
```

### Top 25 Section Content
```json
{
  "state_intro_short": "Brief description that appears at the top of the Top 25 list. Usually mentions expertise, client results, innovation, and reputation.",
  "state_intro_full": "Optional expanded content that appears when user clicks 'Read more'. Can include multiple paragraphs about the state's marketing scene."
}
```

### SEO Metadata
```json
{
  "seo": {
    "title": "Top 25 Marketing Agencies in {State}",
    "meta_description": "Looking for Marketing Agencies in {State}? Here are the best ones listed just for you.",
    "canonical_url": "https://www.gappsy.com/marketing-agencies-in-{state-slug}-united-states/",
    "og_title": "Top 25 Marketing Agencies in {State}",
    "og_description": "Looking for Marketing Agencies in {State}? Here are the best ones listed just for you.",
    "og_image": "https://..."  // Optional OG image URL
  }
}
```

### FAQ Section
```json
{
  "faqs": [
    {
      "question": "Which Services do Marketing Agencies in {State} Offer?",
      "answer": "Marketing agencies in {State} offer..."
    },
    {
      "question": "How can I assess the level of expertise of a digital marketing agency in {State}?",
      "answer": "Assessing the level of expertise..."
    }
  ]
}
```

## Default Fallbacks

If optional fields are not provided, the system will:

1. **SEO Data**: Auto-generate based on state name
2. **hero_intro**: Use generic template with state name
3. **hero_intro_short**: Auto-truncate hero_intro at 140 characters
4. **state_intro_short**: Generate generic ranking description
5. **state_intro_full**: Show nothing (Read more won't expand)
6. **faqs**: Use New Jersey default FAQs (not recommended for production)

## Complete Example

```json
{
  "state": "california",
  "stateName": "California",
  "lastUpdated": "2025-12-09",
  "hero_intro": "Discover California's leading marketing agencies. With over 5,000 marketing agencies in California serving diverse industries including technology, entertainment, and e-commerce, we've compiled the definitive list of the top 25 agencies that are driving innovation and delivering exceptional results.",
  "hero_intro_short": "Discover California's leading marketing agencies serving technology, entertainment, and e-commerce industries.",
  "state_intro_short": "Our comprehensive ranking of California's top marketing agencies, based on expertise, client results, innovation, and industry reputation.",
  "state_intro_full": "California's marketing agency landscape is among the most competitive and innovative in the world. From Silicon Valley tech giants to Hollywood entertainment powerhouses, these agencies serve a diverse clientele across multiple industries. With a strong focus on digital innovation, creative excellence, and data-driven strategies, California's top agencies are setting the standard for marketing excellence nationwide.",
  "seo": {
    "title": "Top 25 Marketing Agencies in California | 2025 Rankings",
    "meta_description": "Discover California's best marketing agencies. Comprehensive rankings of top-rated firms serving tech, entertainment, and e-commerce industries.",
    "canonical_url": "https://www.gappsy.com/marketing-agencies-in-california-united-states/",
    "og_title": "Top 25 Marketing Agencies in California",
    "og_description": "Discover California's best marketing agencies serving tech, entertainment, and e-commerce."
  },
  "agencies": [
    {
      "rank": 1,
      "name": "Example Agency",
      "website": "https://example.com",
      "logoUrl": "https://example.com/logo.png",
      "description": "A leading full-service digital marketing agency specializing in tech startups.",
      "services": ["SEO", "PPC", "Social Media Marketing", "Content Marketing"],
      "isPaid": false,
      "city": "San Francisco"
    }
  ],
  "faqs": [
    {
      "question": "What makes California marketing agencies unique?",
      "answer": "California marketing agencies are known for their cutting-edge digital strategies, creative innovation, and deep understanding of tech and entertainment industries."
    }
  ]
}
```

## Notes for Creating State Data

1. **Consistency**: Keep naming conventions consistent across all states
2. **Quality**: Ensure descriptions are unique and relevant to each state
3. **SEO**: Use state-specific keywords in descriptions
4. **Accuracy**: Verify all URLs and data before deployment
5. **Completeness**: Include all 25 agencies for each state
6. **Services**: Use consistent service names across states for better filtering

## URL Structure

State pages are accessible at:
`/marketing-agencies-in-{state-slug}-united-states`

Examples:
- `/marketing-agencies-in-california-united-states`
- `/marketing-agencies-in-texas-united-states`
- `/marketing-agencies-in-new-york-united-states`
