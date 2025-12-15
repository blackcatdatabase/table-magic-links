-- Auto-generated from schema-map-postgres.yaml
-- engine: postgres
-- table:  magic_links

ALTER TABLE magic_links ADD CONSTRAINT fk_magic_links_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
