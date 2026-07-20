-- Fill the 14 published tool_categories rows that never got an icon
-- assigned (CategoryTile.tsx now actually renders tool_categories.icon —
-- previously every category showed the same generic FolderTree glyph
-- regardless of this column, so these gaps went unnoticed). Purely a data
-- update to an existing column, no schema change.

UPDATE tool_categories SET icon = 'Server' WHERE slug = 'ai-infrastructure';
UPDATE tool_categories SET icon = 'Users' WHERE slug = 'community';
UPDATE tool_categories SET icon = 'FileSignature' WHERE slug = 'documents-esignature';
UPDATE tool_categories SET icon = 'Building2' WHERE slug = 'erp';
UPDATE tool_categories SET icon = 'Gamepad2' WHERE slug = 'gaming';
UPDATE tool_categories SET icon = 'HeartPulse' WHERE slug = 'healthcare';
UPDATE tool_categories SET icon = 'Wifi' WHERE slug = 'iot';
UPDATE tool_categories SET icon = 'Music' WHERE slug = 'media-tools';
UPDATE tool_categories SET icon = 'Mic' WHERE slug = 'podcast-hosting';
UPDATE tool_categories SET icon = 'Receipt' WHERE slug = 'procurement';
UPDATE tool_categories SET icon = 'HardHat' WHERE slug = 'field-service';
UPDATE tool_categories SET icon = 'Star' WHERE slug = 'reputation-management';
UPDATE tool_categories SET icon = 'Store' WHERE slug = 'retail-pos';
UPDATE tool_categories SET icon = 'Timer' WHERE slug = 'time-tracking';
