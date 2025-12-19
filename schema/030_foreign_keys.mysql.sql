-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  magic_links

ALTER TABLE magic_links ADD CONSTRAINT fk_magic_links_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
