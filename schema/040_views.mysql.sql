-- Auto-generated from schema-views-mysql.yaml (map@sha1:39CF23914A48753BF55EEB1F38DDBA21AB1DBBB7)
-- engine: mysql
-- table:  magic_links

-- Contract view for [magic_links]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_magic_links AS
SELECT
  id,
  fingerprint,
  subject,
  user_id,
  context,
  expires_at,
  created_at
FROM magic_links;
