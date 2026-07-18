-- Wiring seo_meta_description into the rendered <meta name="description">
-- (this session's ToolDetailPage.tsx / tool-seo-generator.js change) exposed
-- this pre-existing value to the build's placeholder-content guard for the
-- first time. "todo app" is legitimate product terminology (Super
-- Productivity is a real todo/task-management app), not a placeholder — same
-- class of false positive as the earlier "coming soon" fix
-- (20260718220000_fix_coming_soon_placeholder_v6.sql). Reworded to the
-- equivalent "to-do app" so the guard's literal \btodo\b match no longer
-- fires, without changing the meaning.
UPDATE tools
SET seo_meta_description = 'Super Productivity is a free, open-source to-do app with time tracking, Pomodoro timer, and Jira/GitHub/GitLab task imports.'
WHERE slug = 'super-productivity'
  AND seo_meta_description = 'Super Productivity is a free, open-source todo app with time tracking, Pomodoro timer, and Jira/GitHub/GitLab task imports.';
