/*
  # Add user fields to admin_sessions table

  1. Changes
    - Add `user_id` column (text, nullable with default 'admin')
    - Add `email` column (text, nullable with default 'admin@gappsy.com')

  2. Notes
    - These fields support the session token validation flow
    - Defaults ensure backward compatibility with existing sessions
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'admin_sessions' AND column_name = 'user_id'
  ) THEN
    ALTER TABLE admin_sessions ADD COLUMN user_id text DEFAULT 'admin';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'admin_sessions' AND column_name = 'email'
  ) THEN
    ALTER TABLE admin_sessions ADD COLUMN email text DEFAULT 'admin@gappsy.com';
  END IF;
END $$;

UPDATE admin_sessions SET user_id = 'admin' WHERE user_id IS NULL;
UPDATE admin_sessions SET email = 'admin@gappsy.com' WHERE email IS NULL;