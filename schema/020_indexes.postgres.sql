-- Auto-generated from schema-map-postgres.yaml
-- engine: postgres
-- table:  magic_links

CREATE INDEX IF NOT EXISTS idx_magic_links_user ON magic_links (user_id);

CREATE INDEX IF NOT EXISTS idx_magic_links_subject ON magic_links (subject);

CREATE INDEX IF NOT EXISTS idx_magic_links_expires ON magic_links (expires_at);
