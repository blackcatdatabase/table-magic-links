-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  magic_links

CREATE INDEX IF NOT EXISTS idx_magic_links_user ON magic_links (user_id);

CREATE INDEX IF NOT EXISTS idx_magic_links_subject ON magic_links (subject);

CREATE INDEX IF NOT EXISTS idx_magic_links_expires ON magic_links (expires_at);
