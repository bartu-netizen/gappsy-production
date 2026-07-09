# New Jersey Agency Logos

This directory should contain logo images for all 25 New Jersey marketing agencies.

## Suggested Filenames

Use lowercase kebab-case for consistency:

1. `vazagency.png`
2. `spitball-advertising.png`
3. `gmlv.png`
4. `imbue-creative.png` (or .jpeg)
5. `rapunzel-creative.png`
6. `dsm.png`
7. `jungle-communications.png`
8. `the-snow-agency.png`
9. `refresh-advertising.png`
10. `looney-advertising.png`
11. `nyt-ghost-writing.png`
12. `upscale-marketing.png`
13. `avc-media-group.png`
14. `shades-digital-agency.png`
15. `rayze-consulting.png`
16. `oxford-communications.png`
17. `ritta.png`
18. `mint-advertising.png`
19. `vision-creative-group.png`
20. `gem-corp.png`
21. `nj-advance-media.png`
22. `the-s3-agency.png`
23. `conduit-digital.png`
24. `brick-city-greenhouse.png`
25. `marz-agency.png`

## How to Add Logos

1. Download or create logo images
2. Save them to this directory with the names above
3. Update `src/NewJerseyAgencyGrid.tsx` to use local paths:
   ```typescript
   logoUrl: "/logos/new-jersey/vazagency.png"
   ```

## Image Specifications

- **Format:** PNG with transparency preferred (or JPEG/WebP)
- **Size:** Recommend 200x100px or similar aspect ratio
- **Optimization:** Compress images for web performance
- **Naming:** Use lowercase kebab-case matching agency names
