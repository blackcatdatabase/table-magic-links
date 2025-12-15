# magic_links

One-time magic-link tokens (fingerprint-only, server-side stored).

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |
| fingerprint | CHAR(64) | NO |  | HMAC fingerprint of the magic-link token. |
| subject | VARCHAR(128) | NO |  | Subject identifier (typically users.id). |
| user_id | BIGINT | YES |  | Optional FK users.id for convenience joins. |
| context | mysql: JSON / postgres: JSONB | YES |  | Context metadata (e.g., redirect) as JSON. |
| expires_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO |  | Expiration timestamp (UTC). |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| ux_magic_links_fingerprint | fingerprint |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_magic_links_expires | expires_at | INDEX idx_magic_links_expires (expires_at) |
| idx_magic_links_subject | subject | INDEX idx_magic_links_subject (subject) |
| idx_magic_links_user | user_id | INDEX idx_magic_links_user (user_id) |
| ux_magic_links_fingerprint | fingerprint | UNIQUE KEY ux_magic_links_fingerprint (fingerprint) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_magic_links_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| ux_magic_links_fingerprint | fingerprint |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_magic_links_expires | expires_at | CREATE INDEX IF NOT EXISTS idx_magic_links_expires ON magic_links (expires_at) |
| idx_magic_links_subject | subject | CREATE INDEX IF NOT EXISTS idx_magic_links_subject ON magic_links (subject) |
| idx_magic_links_user | user_id | CREATE INDEX IF NOT EXISTS idx_magic_links_user ON magic_links (user_id) |
| ux_magic_links_fingerprint | fingerprint | CONSTRAINT ux_magic_links_fingerprint UNIQUE (fingerprint) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_magic_links_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_magic_links | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_magic_links | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
