CREATE TABLE db_metrics_raw (
    id SERIAL PRIMARY KEY,
    captured_at TIMESTAMP,
    active_connections INT,
    idle_connections INT,
    blocked_queries INT,
    deadlocks INT,
    avg_query_ms FLOAT,
    p95_query_ms FLOAT
);

CREATE TABLE query_stats_raw (
    id SERIAL PRIMARY KEY,
    captured_at TIMESTAMP,
    query_text TEXT,
    calls INT,
    total_exec_ms FLOAT,
    mean_exec_ms FLOAT,
    rows_processed INT
);

CREATE TABLE incidents (
    id SERIAL PRIMARY KEY,
    title TEXT,
    severity TEXT,
    status TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    description TEXT
);

CREATE TABLE incident_evidence (
    id SERIAL PRIMARY KEY,
    incident_id INT,
    evidence_type TEXT,
    details TEXT,
    created_at TIMESTAMP
);

CREATE TABLE rca_reports (
    id SERIAL PRIMARY KEY,
    incident_id INT,
    root_cause TEXT,
    recommendation TEXT,
    created_at TIMESTAMP
);

CREATE TABLE api_request_logs (
    id SERIAL PRIMARY KEY,
    requested_at TIMESTAMP,
    route TEXT,
    method TEXT,
    status_code INT,
    latency_ms INT,
    db_time_ms INT,
    trace_id TEXT
);

CREATE TABLE recommendations (
    id SERIAL PRIMARY KEY,
    suggestion TEXT,
    severity TEXT,
    created_at TIMESTAMP
);