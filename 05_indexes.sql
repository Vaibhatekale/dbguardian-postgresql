CREATE INDEX idx_db_metrics_time ON db_metrics_raw(captured_at);

CREATE INDEX idx_query_stats_time ON query_stats_raw(captured_at);

CREATE INDEX idx_api_logs_time ON api_request_logs(requested_at);

CREATE INDEX idx_incidents_severity ON incidents(severity);

CREATE INDEX idx_incidents_status ON incidents(status);

CREATE INDEX idx_api_logs_trace_id ON api_request_logs(trace_id);

CREATE INDEX idx_incident_evidence_incident_id ON incident_evidence(incident_id);