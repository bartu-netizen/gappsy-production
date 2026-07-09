# Logo Migration Guide

## Current Status

All 25 New Jersey agencies are currently using external logo URLs from `gappsy.com`. Some of these URLs may fail to load, causing the fallback initial to display instead.

## Migration to Local Logos

### Directory Structure

Logos should be stored in:
```
/public/logos/new-jersey/
```

### Steps to Add Local Logos

1. **Download Logo Images**
   - Visit each agency's current gappsy.com URL
   - Save the logo image to `/public/logos/new-jersey/`
   - Use lowercase kebab-case filenames (e.g., `vazagency.png`, `spitball-advertising.png`)

2. **Update the Data**
   - Open `src/NewJerseyAgencyGrid.tsx`
   - Find the agency in the `newJerseyAgencies` array
   - Update `logoUrl` from external URL to local path:
     ```typescript
     logoUrl: "/logos/new-jersey/vazagency.png"
     ```

3. **For Missing Logos**
   - If you cannot obtain a logo, set:
     ```typescript
     logoUrl: null
     ```
   - The card will display the agency's first initial as a fallback

### Agency List

Here are all 25 agencies currently using external logos:

1. Vazagency - `/wp-content/uploads/2024/03/Vazagency-Logo-Black-Transparent.png`
2. Spitball Advertising - `/wp-content/uploads/2023/11/Spitball-Advertising-.png`
3. GMLV - `/wp-content/uploads/2023/11/GMLV-.png`
4. Imbue Creative - `/wp-content/uploads/2023/11/Imbue-Creative-.jpeg`
5. Rapunzel Creative Marketing Agency - `/wp-content/uploads/2023/11/Rapunzel-Creative-Marketing-Agency-.png`
6. DSM - `/wp-content/uploads/2023/11/DSM-.png`
7. Jungle Communications, Inc. - `/wp-content/uploads/2023/11/Jungle-Communications-.png`
8. The Snow Agency - `/wp-content/uploads/2023/11/The-Snow-Agency-.png`
9. Refresh Advertising - `/wp-content/uploads/2023/11/Refresh-Advertising-.png`
10. Loone3y Advertising - `/wp-content/uploads/2023/11/Looney-Advertising-.png`
12. NYT Ghost Writing - `/wp-content/uploads/2023/11/NYT-Ghost-Writing.png`
13. Upscale Marketing - `/wp-content/uploads/2023/11/Upscale-Marketing.png`
14. AVC Media Group - `/wp-content/uploads/2023/11/AVC-Media-Group.png`
15. Shades Digital Agency - `/wp-content/uploads/2023/11/Shades-Digital-Agency.png`
16. Rayze Consulting - `/wp-content/uploads/2023/11/Rayze-Consulting.png`
17. Oxford Communications - `/wp-content/uploads/2023/11/Oxford-Communications.png`
18. RITTA - `/wp-content/uploads/2023/11/RITTA.png`
19. Mint Advertising - `/wp-content/uploads/2023/11/Mint-Advertising.png`
20. Vision Creative Group - `/wp-content/uploads/2023/11/Vision-Creative-Group.png`
21. GEM Corp - `/wp-content/uploads/2023/11/GEM-Corp.png`
22. NJ Advance Media - `/wp-content/uploads/2023/11/NJ-Advance-Media.png`
23. The S3 Agency - `/wp-content/uploads/2023/11/The-S3-Agency.png`
24. Conduit Digital - `/wp-content/uploads/2023/11/Conduit-Digital.png`
25. Brick City Greenhouse - `/wp-content/uploads/2023/11/Brick-City-Greenhouse.png`
26. MARZ AGENCY - `/wp-content/uploads/2023/11/MARZ-AGENCY.png`

### Testing

After updating logo paths:
1. Run `npm run build` to ensure no errors
2. Check the preview to verify logos display correctly
3. For any broken logos, either fix the path or set to `null`

### Benefits of Local Logos

- ✅ Faster loading (no external requests)
- ✅ More reliable (no dependency on external site)
- ✅ Offline functionality
- ✅ Full control over assets
- ✅ No CORS issues
- ✅ Better performance
