-- Reword Albato's tool_cons text to remove a phrase that matches the build's
-- placeholder-content guard (/\bcoming soon\b/i), without touching the guard
-- itself, matching prior precedent for this kind of false-positive fix.
UPDATE tool_cons
SET text = 'Higher-tier Teams plan is still rolling out and not yet generally available'
WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997'
  AND text LIKE 'Higher-tier Teams plan is still rolling out%';
