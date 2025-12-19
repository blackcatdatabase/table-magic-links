-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
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
