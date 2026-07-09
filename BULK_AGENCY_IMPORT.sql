-- Bulk Agency Import - Multiple Sample Agencies
-- This adds diverse examples across different states

-- California Agency - Not Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Digital Wave Marketing',
  'digital-wave-marketing-california',
  'California',
  'california',
  'San Francisco',
  'https://digitalwavemarketing.com',
  ARRAY['SEO', 'PPC', 'Social Media Marketing', 'Content Marketing'],
  'Startups and small businesses',
  'California & West Coast',
  false,
  'San Francisco, CA',
  ARRAY[
    'Limited case study documentation',
    'No public pricing structure',
    'Team size not disclosed',
    'Minimal awards or recognition'
  ],
  ARRAY[
    'Strong focus on tech startups',
    'Modern digital approach',
    'Local Bay Area presence'
  ],
  ARRAY[
    'Unproven track record with larger clients',
    'Limited geographic experience',
    'Unclear scalability'
  ],
  ARRAY[
    'Early-stage tech startups',
    'Companies with limited marketing budgets',
    'Bay Area-focused businesses'
  ],
  'Digital Wave Marketing is a boutique digital marketing agency based in San Francisco. They specialize in helping tech startups establish their online presence through SEO, PPC, and social media marketing.

The agency targets early-stage companies in the San Francisco Bay Area, offering services tailored to the fast-paced startup environment.'
);

-- Texas Agency - Top 25 Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, case_studies_status, pricing_transparency, team_information,
  independent_recognition, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Lone Star Digital Solutions',
  'lone-star-digital-solutions-texas',
  'Texas',
  'texas',
  'Austin',
  'https://lonestardigital.com',
  ARRAY['Full-service digital marketing', 'Brand strategy', 'Web development', 'Analytics'],
  'Mid-sized to enterprise businesses',
  'Texas and Southwest US',
  true,
  'Austin, TX',
  'Extensive public portfolio',
  'Transparent tier-based pricing',
  'Full team directory available',
  'Multiple industry awards',
  ARRAY[],
  ARRAY[
    'Proven track record with 50+ documented case studies',
    'Transparent pricing and processes',
    'Award-winning team',
    'Strong local and regional presence',
    'Excellent client testimonials'
  ],
  ARRAY[],
  ARRAY[
    'Growing businesses seeking proven results',
    'Mid-market companies',
    'Enterprise clients in Texas',
    'Businesses requiring full-service digital support'
  ],
  'Lone Star Digital Solutions is an award-winning full-service digital marketing agency headquartered in Austin, Texas. With over 10 years of experience, they serve mid-sized to enterprise businesses across Texas and the Southwest.

The agency has earned recognition from multiple industry organizations and maintains a portfolio of 50+ documented case studies demonstrating measurable results for clients.'
);

-- Florida Agency - Not Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Sunshine Marketing Group',
  'sunshine-marketing-group-florida',
  'Florida',
  'florida',
  'Miami',
  'https://sunshinemarketinggroup.com',
  ARRAY['Social media management', 'Influencer marketing', 'Brand partnerships'],
  'E-commerce and retail businesses',
  'Florida and Southeast',
  false,
  'Miami, FL',
  ARRAY[
    'No verified case studies available',
    'Pricing not disclosed',
    'Team credentials unclear',
    'Limited third-party validation'
  ],
  ARRAY[
    'Focus on social media and influencer marketing',
    'Understanding of e-commerce space',
    'Miami market knowledge'
  ],
  ARRAY[
    'Lack of proven results documentation',
    'Narrow service offering',
    'Uncertain agency maturity'
  ],
  ARRAY[
    'Small e-commerce businesses',
    'Instagram-focused brands',
    'Miami-area retailers'
  ],
  'Sunshine Marketing Group is a Miami-based agency specializing in social media management and influencer marketing. They primarily work with e-commerce and retail businesses looking to expand their social media presence.

The agency focuses heavily on Instagram and TikTok marketing, with an emphasis on the lifestyle and retail sectors.'
);

-- Illinois Agency - Top 25 Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, case_studies_status, pricing_transparency, team_information,
  independent_recognition, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Windy City Marketing Partners',
  'windy-city-marketing-partners-illinois',
  'Illinois',
  'illinois',
  'Chicago',
  'https://windycitymarketing.com',
  ARRAY['Integrated marketing', 'B2B lead generation', 'Marketing automation', 'Analytics'],
  'B2B companies and professional services',
  'Midwest and National',
  true,
  'Chicago, IL',
  'Comprehensive case study library',
  'Published pricing packages',
  'Experienced leadership team public',
  'Clutch top-rated agency',
  ARRAY[],
  ARRAY[
    'B2B marketing specialization',
    'Strong lead generation track record',
    'Transparent operations',
    'National client base',
    'Industry-recognized expertise'
  ],
  ARRAY[],
  ARRAY[
    'B2B companies seeking lead generation',
    'Professional services firms',
    'Mid-market manufacturers',
    'Technology companies'
  ],
  'Windy City Marketing Partners is a Chicago-based B2B marketing agency with over 15 years of experience. They specialize in lead generation, marketing automation, and integrated marketing campaigns for professional services and technology companies.

The agency has been recognized by Clutch as a top B2B marketing partner and maintains a comprehensive library of case studies demonstrating ROI for clients.'
);

-- Washington Agency - Not Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Pacific Northwest Digital',
  'pacific-northwest-digital-washington',
  'Washington',
  'washington',
  'Seattle',
  'https://pacificnwdigital.com',
  ARRAY['SEO', 'Local search', 'Google Ads'],
  'Local service businesses',
  'Washington State',
  false,
  'Seattle, WA',
  ARRAY[
    'Very limited online presence',
    'No published case studies',
    'Unclear company history',
    'No team information available'
  ],
  ARRAY[
    'Local market focus',
    'Service business specialization'
  ],
  ARRAY[
    'Lack of online credibility signals',
    'Extremely limited service scope',
    'Uncertain business stability'
  ],
  ARRAY[
    'Very small local service businesses',
    'Budget-conscious startups'
  ],
  'Pacific Northwest Digital is a Seattle-based agency offering basic SEO and Google Ads services to local service businesses. Information about the agency is limited, with minimal online presence and no published case studies or team information.'
);

-- Massachusetts Agency - Top 25 Ranked
INSERT INTO agency_reviews (
  agency_name, agency_slug, state_name, state_slug, city, website_url,
  services_offered, target_clients, geographic_reach, is_top_25_ranked,
  headquarters, case_studies_status, pricing_transparency, team_information,
  independent_recognition, concerns, strengths, risk_factors, fit_for,
  about_description
) VALUES (
  'Boston Marketing Collective',
  'boston-marketing-collective-massachusetts',
  'Massachusetts',
  'massachusetts',
  'Boston',
  'https://bostonmarketingcollective.com',
  ARRAY['Full-service marketing', 'Healthcare marketing', 'Financial services marketing', 'Higher education marketing'],
  'Healthcare, finance, and education sectors',
  'Northeast US and National',
  true,
  'Boston, MA',
  'Extensive vertical-specific case studies',
  'Custom pricing with published ranges',
  'Senior team with industry credentials',
  'Multiple industry-specific awards',
  ARRAY[],
  ARRAY[
    'Deep healthcare and financial services expertise',
    'Proven regulatory compliance knowledge',
    'Long-term client relationships',
    'Industry-specific thought leadership',
    'Strong regional and national reputation'
  ],
  ARRAY[],
  ARRAY[
    'Healthcare organizations',
    'Financial services firms',
    'Higher education institutions',
    'Regulated industries'
  ],
  'Boston Marketing Collective is a specialized marketing agency serving healthcare, financial services, and higher education clients. With over 20 years of experience, they understand the unique challenges of marketing in highly regulated industries.

The agency has earned multiple industry-specific awards and maintains long-term relationships with major healthcare systems, financial institutions, and universities across the Northeast.'
);

-- Quick query to see all agencies
-- SELECT agency_name, state_name, is_top_25_ranked FROM agency_reviews ORDER BY state_name, agency_name;
