-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  magic_links

CREATE TABLE IF NOT EXISTS magic_links (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  fingerprint CHAR(64) NOT NULL,
  subject VARCHAR(128) NOT NULL,
  user_id BIGINT UNSIGNED NULL,
  context JSON NULL,
  expires_at DATETIME(6) NOT NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  UNIQUE KEY ux_magic_links_fingerprint (fingerprint),
  INDEX idx_magic_links_user (user_id),
  INDEX idx_magic_links_subject (subject),
  INDEX idx_magic_links_expires (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
