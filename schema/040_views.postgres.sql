-- Auto-generated from schema-views-postgres.yaml (map@sha1:A35B3CB52780A1043442511D947A51BA2C27622C)
-- engine: postgres
-- table:  magic_links

-- Contract view for [magic_links]
CREATE OR REPLACE VIEW vw_magic_links AS
SELECT
  id,
  fingerprint,
  subject,
  user_id,
  context,
  expires_at,
  created_at
FROM magic_links;
