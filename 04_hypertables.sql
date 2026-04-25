SELECT create_hypertable('db_metrics_raw', 'captured_at', migrate_data => TRUE, if_not_exists => TRUE);
SELECT create_hypertable('query_stats_raw', 'captured_at', migrate_data => TRUE, if_not_exists => TRUE);
SELECT create_hypertable('api_request_logs', 'requested_at', migrate_data => TRUE, if_not_exists => TRUE);