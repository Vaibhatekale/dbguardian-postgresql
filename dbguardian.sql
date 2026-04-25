--
-- PostgreSQL database dump
--

\restrict J8senP1EBM5wmRqmYYWehp14FeqCshdLbZk6SXhbgApWMzP8DM7fKNrbe8Ur03H

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-04-25 15:14:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 41969)
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- TOC entry 5855 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data (Community Edition)';


--
-- TOC entry 3 (class 3079 OID 42871)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 5856 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 318 (class 1259 OID 42961)
-- Name: db_metrics_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.db_metrics_raw (
    id integer NOT NULL,
    captured_at timestamp without time zone NOT NULL,
    active_connections integer,
    idle_connections integer,
    blocked_queries integer,
    deadlocks integer,
    avg_query_ms double precision,
    p95_query_ms double precision
);


ALTER TABLE public.db_metrics_raw OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 43086)
-- Name: _hyper_2_1_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_2_1_chunk (
    CONSTRAINT constraint_1 CHECK (((captured_at >= '2026-04-09 00:00:00'::timestamp without time zone) AND (captured_at < '2026-04-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.db_metrics_raw);


ALTER TABLE _timescaledb_internal._hyper_2_1_chunk OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 42969)
-- Name: query_stats_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query_stats_raw (
    id integer NOT NULL,
    captured_at timestamp without time zone NOT NULL,
    query_text text,
    calls integer,
    total_exec_ms double precision,
    mean_exec_ms double precision,
    rows_processed integer
);


ALTER TABLE public.query_stats_raw OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 43098)
-- Name: _hyper_3_2_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_3_2_chunk (
    CONSTRAINT constraint_2 CHECK (((captured_at >= '2026-04-09 00:00:00'::timestamp without time zone) AND (captured_at < '2026-04-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.query_stats_raw);


ALTER TABLE _timescaledb_internal._hyper_3_2_chunk OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 43009)
-- Name: api_request_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_request_logs (
    id integer NOT NULL,
    requested_at timestamp without time zone NOT NULL,
    route text,
    method text,
    status_code integer,
    latency_ms integer,
    db_time_ms integer,
    trace_id text
);


ALTER TABLE public.api_request_logs OWNER TO postgres;

--
-- TOC entry 333 (class 1259 OID 43114)
-- Name: _hyper_4_3_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_4_3_chunk (
    CONSTRAINT constraint_3 CHECK (((requested_at >= '2026-03-19 00:00:00'::timestamp without time zone) AND (requested_at < '2026-03-26 00:00:00'::timestamp without time zone)))
)
INHERITS (public.api_request_logs);


ALTER TABLE _timescaledb_internal._hyper_4_3_chunk OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 43124)
-- Name: _hyper_4_4_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_4_4_chunk (
    CONSTRAINT constraint_4 CHECK (((requested_at >= '2026-04-09 00:00:00'::timestamp without time zone) AND (requested_at < '2026-04-16 00:00:00'::timestamp without time zone)))
)
INHERITS (public.api_request_logs);


ALTER TABLE _timescaledb_internal._hyper_4_4_chunk OWNER TO postgres;

--
-- TOC entry 335 (class 1259 OID 43134)
-- Name: _hyper_4_5_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_4_5_chunk (
    CONSTRAINT constraint_5 CHECK (((requested_at >= '2026-03-12 00:00:00'::timestamp without time zone) AND (requested_at < '2026-03-19 00:00:00'::timestamp without time zone)))
)
INHERITS (public.api_request_logs);


ALTER TABLE _timescaledb_internal._hyper_4_5_chunk OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 43144)
-- Name: _hyper_4_6_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_4_6_chunk (
    CONSTRAINT constraint_6 CHECK (((requested_at >= '2026-03-26 00:00:00'::timestamp without time zone) AND (requested_at < '2026-04-02 00:00:00'::timestamp without time zone)))
)
INHERITS (public.api_request_logs);


ALTER TABLE _timescaledb_internal._hyper_4_6_chunk OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 43154)
-- Name: _hyper_4_7_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_4_7_chunk (
    CONSTRAINT constraint_7 CHECK (((requested_at >= '2026-04-02 00:00:00'::timestamp without time zone) AND (requested_at < '2026-04-09 00:00:00'::timestamp without time zone)))
)
INHERITS (public.api_request_logs);


ALTER TABLE _timescaledb_internal._hyper_4_7_chunk OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 43008)
-- Name: api_request_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_request_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_request_logs_id_seq OWNER TO postgres;

--
-- TOC entry 5857 (class 0 OID 0)
-- Dependencies: 327
-- Name: api_request_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_request_logs_id_seq OWNED BY public.api_request_logs.id;


--
-- TOC entry 313 (class 1259 OID 42928)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name text,
    region text,
    signup_date timestamp without time zone
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 42960)
-- Name: db_metrics_raw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.db_metrics_raw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.db_metrics_raw_id_seq OWNER TO postgres;

--
-- TOC entry 5858 (class 0 OID 0)
-- Dependencies: 317
-- Name: db_metrics_raw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.db_metrics_raw_id_seq OWNED BY public.db_metrics_raw.id;


--
-- TOC entry 324 (class 1259 OID 42989)
-- Name: incident_evidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident_evidence (
    id integer NOT NULL,
    incident_id integer,
    evidence_type text,
    details text,
    created_at timestamp without time zone
);


ALTER TABLE public.incident_evidence OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 42988)
-- Name: incident_evidence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incident_evidence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incident_evidence_id_seq OWNER TO postgres;

--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 323
-- Name: incident_evidence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_evidence_id_seq OWNED BY public.incident_evidence.id;


--
-- TOC entry 322 (class 1259 OID 42979)
-- Name: incidents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incidents (
    id integer NOT NULL,
    title text,
    severity text,
    status text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    description text
);


ALTER TABLE public.incidents OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 42978)
-- Name: incidents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incidents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.incidents_id_seq OWNER TO postgres;

--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 321
-- Name: incidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incidents_id_seq OWNED BY public.incidents.id;


--
-- TOC entry 315 (class 1259 OID 42944)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    quantity integer,
    total_amount integer,
    order_status text,
    order_date timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 42952)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    order_id integer,
    payment_method text,
    payment_status text,
    paid_amount integer,
    paid_at timestamp without time zone
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 42936)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name text,
    category text,
    price integer,
    stock_quantity integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 42968)
-- Name: query_stats_raw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.query_stats_raw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.query_stats_raw_id_seq OWNER TO postgres;

--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 319
-- Name: query_stats_raw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.query_stats_raw_id_seq OWNED BY public.query_stats_raw.id;


--
-- TOC entry 326 (class 1259 OID 42999)
-- Name: rca_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rca_reports (
    id integer NOT NULL,
    incident_id integer,
    root_cause text,
    recommendation text,
    created_at timestamp without time zone
);


ALTER TABLE public.rca_reports OWNER TO postgres;

--
-- TOC entry 325 (class 1259 OID 42998)
-- Name: rca_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rca_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rca_reports_id_seq OWNER TO postgres;

--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 325
-- Name: rca_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rca_reports_id_seq OWNED BY public.rca_reports.id;


--
-- TOC entry 330 (class 1259 OID 43019)
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    id integer NOT NULL,
    suggestion text,
    severity text,
    created_at timestamp without time zone
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 43018)
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recommendations_id_seq OWNER TO postgres;

--
-- TOC entry 5863 (class 0 OID 0)
-- Dependencies: 329
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;


--
-- TOC entry 312 (class 1259 OID 42920)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    full_name text,
    email text,
    city text,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 5514 (class 2604 OID 43089)
-- Name: _hyper_2_1_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_2_1_chunk ALTER COLUMN id SET DEFAULT nextval('public.db_metrics_raw_id_seq'::regclass);


--
-- TOC entry 5515 (class 2604 OID 43101)
-- Name: _hyper_3_2_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_3_2_chunk ALTER COLUMN id SET DEFAULT nextval('public.query_stats_raw_id_seq'::regclass);


--
-- TOC entry 5516 (class 2604 OID 43117)
-- Name: _hyper_4_3_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_3_chunk ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5517 (class 2604 OID 43127)
-- Name: _hyper_4_4_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_4_chunk ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5518 (class 2604 OID 43137)
-- Name: _hyper_4_5_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_5_chunk ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5519 (class 2604 OID 43147)
-- Name: _hyper_4_6_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_6_chunk ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5520 (class 2604 OID 43157)
-- Name: _hyper_4_7_chunk id; Type: DEFAULT; Schema: _timescaledb_internal; Owner: postgres
--

ALTER TABLE ONLY _timescaledb_internal._hyper_4_7_chunk ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5512 (class 2604 OID 43012)
-- Name: api_request_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_request_logs ALTER COLUMN id SET DEFAULT nextval('public.api_request_logs_id_seq'::regclass);


--
-- TOC entry 5507 (class 2604 OID 42964)
-- Name: db_metrics_raw id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.db_metrics_raw ALTER COLUMN id SET DEFAULT nextval('public.db_metrics_raw_id_seq'::regclass);


--
-- TOC entry 5510 (class 2604 OID 42992)
-- Name: incident_evidence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_evidence ALTER COLUMN id SET DEFAULT nextval('public.incident_evidence_id_seq'::regclass);


--
-- TOC entry 5509 (class 2604 OID 42982)
-- Name: incidents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidents ALTER COLUMN id SET DEFAULT nextval('public.incidents_id_seq'::regclass);


--
-- TOC entry 5508 (class 2604 OID 42972)
-- Name: query_stats_raw id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_stats_raw ALTER COLUMN id SET DEFAULT nextval('public.query_stats_raw_id_seq'::regclass);


--
-- TOC entry 5511 (class 2604 OID 43002)
-- Name: rca_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rca_reports ALTER COLUMN id SET DEFAULT nextval('public.rca_reports_id_seq'::regclass);


--
-- TOC entry 5513 (class 2604 OID 43022)
-- Name: recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);


--
-- TOC entry 5458 (class 0 OID 41996)
-- Dependencies: 256
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, status) FROM stdin;
2	public	db_metrics_raw	_timescaledb_internal	_hyper_2	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
3	public	query_stats_raw	_timescaledb_internal	_hyper_3	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
4	public	api_request_logs	_timescaledb_internal	_hyper_4	1	_timescaledb_functions	calculate_chunk_interval	0	0	\N	0
\.


--
-- TOC entry 5464 (class 0 OID 42089)
-- Dependencies: 264
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped, status, osm_chunk, creation_time) FROM stdin;
1	2	_timescaledb_internal	_hyper_2_1_chunk	\N	f	0	f	2026-04-13 11:48:54.120996+05:30
2	3	_timescaledb_internal	_hyper_3_2_chunk	\N	f	0	f	2026-04-13 11:50:04.475861+05:30
3	4	_timescaledb_internal	_hyper_4_3_chunk	\N	f	0	f	2026-04-13 11:51:15.647735+05:30
4	4	_timescaledb_internal	_hyper_4_4_chunk	\N	f	0	f	2026-04-13 11:51:15.656756+05:30
5	4	_timescaledb_internal	_hyper_4_5_chunk	\N	f	0	f	2026-04-13 11:51:15.671786+05:30
6	4	_timescaledb_internal	_hyper_4_6_chunk	\N	f	0	f	2026-04-13 11:51:15.683168+05:30
7	4	_timescaledb_internal	_hyper_4_7_chunk	\N	f	0	f	2026-04-13 11:51:15.697328+05:30
\.


--
-- TOC entry 5468 (class 0 OID 42142)
-- Dependencies: 268
-- Data for Name: chunk_column_stats; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_column_stats (id, hypertable_id, chunk_id, column_name, range_start, range_end, valid) FROM stdin;
\.


--
-- TOC entry 5460 (class 0 OID 42046)
-- Dependencies: 260
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, compress_interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
2	2	captured_at	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
3	3	captured_at	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
4	4	requested_at	timestamp without time zone	t	\N	\N	\N	604800000000	\N	\N	\N
\.


--
-- TOC entry 5462 (class 0 OID 42070)
-- Dependencies: 262
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
1	2	1775692800000000	1776297600000000
2	3	1775692800000000	1776297600000000
3	4	1773878400000000	1774483200000000
4	4	1775692800000000	1776297600000000
5	4	1773273600000000	1773878400000000
6	4	1774483200000000	1775088000000000
7	4	1775088000000000	1775692800000000
\.


--
-- TOC entry 5466 (class 0 OID 42122)
-- Dependencies: 265
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
1	1	constraint_1	\N
2	2	constraint_2	\N
3	3	constraint_3	\N
4	4	constraint_4	\N
5	5	constraint_5	\N
6	6	constraint_6	\N
7	7	constraint_7	\N
\.


--
-- TOC entry 5481 (class 0 OID 42402)
-- Dependencies: 286
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression, numrows_frozen_immediately) FROM stdin;
\.


--
-- TOC entry 5480 (class 0 OID 42390)
-- Dependencies: 285
-- Data for Name: compression_settings; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.compression_settings (relid, compress_relid, segmentby, orderby, orderby_desc, orderby_nullsfirst, index) FROM stdin;
\.


--
-- TOC entry 5473 (class 0 OID 42273)
-- Dependencies: 277
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, parent_mat_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, direct_view_schema, direct_view_name, materialized_only, finalized) FROM stdin;
\.


--
-- TOC entry 5482 (class 0 OID 42426)
-- Dependencies: 287
-- Data for Name: continuous_agg_migrate_plan; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan (mat_hypertable_id, start_ts, end_ts, user_view_definition) FROM stdin;
\.


--
-- TOC entry 5483 (class 0 OID 42437)
-- Dependencies: 289
-- Data for Name: continuous_agg_migrate_plan_step; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan_step (mat_hypertable_id, step_id, status, start_ts, end_ts, type, config) FROM stdin;
\.


--
-- TOC entry 5474 (class 0 OID 42310)
-- Dependencies: 278
-- Data for Name: continuous_aggs_bucket_function; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_bucket_function (mat_hypertable_id, bucket_func, bucket_width, bucket_origin, bucket_offset, bucket_timezone, bucket_fixed_width) FROM stdin;
\.


--
-- TOC entry 5477 (class 0 OID 42351)
-- Dependencies: 281
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- TOC entry 5475 (class 0 OID 42327)
-- Dependencies: 279
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- TOC entry 5478 (class 0 OID 42358)
-- Dependencies: 282
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- TOC entry 5479 (class 0 OID 42369)
-- Dependencies: 283
-- Data for Name: continuous_aggs_materialization_ranges; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_materialization_ranges (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- TOC entry 5476 (class 0 OID 42339)
-- Dependencies: 280
-- Data for Name: continuous_aggs_watermark; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.continuous_aggs_watermark (mat_hypertable_id, watermark) FROM stdin;
\.


--
-- TOC entry 5472 (class 0 OID 42254)
-- Dependencies: 275
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
install_timestamp	2026-04-13 09:40:32.634045+05:30	t
timescaledb_version	2.24.0	f
exported_uuid	6647e3b0-caf0-4646-91c8-a484a5f6255b	t
\.


--
-- TOC entry 5459 (class 0 OID 42029)
-- Dependencies: 258
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: postgres
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- TOC entry 5471 (class 0 OID 42168)
-- Dependencies: 270
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: postgres
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, fixed_schedule, initial_start, hypertable_id, config, check_schema, check_name, timezone) FROM stdin;
\.


--
-- TOC entry 5843 (class 0 OID 43086)
-- Dependencies: 331
-- Data for Name: _hyper_2_1_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_2_1_chunk (id, captured_at, active_connections, idle_connections, blocked_queries, deadlocks, avg_query_ms, p95_query_ms) FROM stdin;
1	2026-04-13 10:30:35.32196	20	0	0	0	0	0
2	2026-04-13 12:05:13.814303	17	7	0	0	11.874445568585644	652.9927964285715
\.


--
-- TOC entry 5844 (class 0 OID 43098)
-- Dependencies: 332
-- Data for Name: _hyper_3_2_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_3_2_chunk (id, captured_at, query_text, calls, total_exec_ms, mean_exec_ms, rows_processed) FROM stdin;
1	2026-04-13 10:41:32.663172	SELECT pg_sleep(5);	1	0	0	0
2	2026-04-13 11:39:28.427618	SELECT speed, "timestamp" FROM vehicle_logs WHERE speed > $1 ORDER BY "timestamp" DESC	2	3345.0442000000003	1672.5221000000001	240296
3	2026-04-13 11:39:28.442801	SELECT job_type, jsonb_object_agg(sqlerrcode, count) FROM(\tSELECT (\t\tCASE \t\t\tWHEN proc_schema = $1 \t\t\tAND proc_name ~ $2 \t\t\tTHEN proc_name \t\t\tELSE $3\t\tEND\t) as job_type, \tsqlerrcode, \tpg_catalog.COUNT(*) \tFROM \ttimescaledb_information.job_errors \tWHERE sqlerrcode IS NOT NULL \tGROUP BY job_type, sqlerrcode \tORDER BY job_type) q GROUP BY q.job_type	1	3.0495	3.0495	0
4	2026-04-13 11:39:28.443092	SELECT job_type, jsonb_object_agg(sqlerrcode, count) FROM(\tSELECT (\t\tCASE \t\t\tWHEN proc_schema = $1 \t\t\tAND proc_name ~ $2 \t\t\tTHEN proc_name \t\t\tELSE $3\t\tEND\t) as job_type, \tsqlerrcode, \tpg_catalog.COUNT(*) \tFROM \ttimescaledb_information.job_errors \tWHERE sqlerrcode IS NOT NULL \tGROUP BY job_type, sqlerrcode \tORDER BY job_type) q GROUP BY q.job_type	1	2.2748999999999997	2.2748999999999997	0
5	2026-04-13 11:39:28.443259	SELECT (\tCASE \t\tWHEN j.proc_schema = $1 AND j.proc_name ~ $2 \t\tTHEN j.proc_name::TEXT \t\tELSE $3 \tEND)  AS job_type, \tSUM(total_runs)::BIGINT AS total_runs, \tSUM(total_successes)::BIGINT AS total_successes, \tSUM(total_failures)::BIGINT AS total_failures, \tSUM(total_crashes)::BIGINT AS total_crashes, \tSUM(total_duration) AS total_duration, \tSUM(total_duration_failures) AS total_duration_failures, \tMAX(consecutive_failures) AS max_consecutive_failures, \tMAX(consecutive_crashes) AS max_consecutive_crashes FROM \t_timescaledb_internal.bgw_job_stat s \tJOIN _timescaledb_config.bgw_job j on j.id = s.job_id GROUP BY job_type ORDER BY job_type	1	0.42910000000000004	0.42910000000000004	2
6	2026-04-13 11:39:28.443403	SELECT amname AS name, sum(relpages) AS pages, count(*) AS instances FROM pg_class JOIN pg_am ON relam = pg_am.oid GROUP BY amname	1	0.331	0.331	2
7	2026-04-13 14:17:18.986814	SELECT speed, "timestamp" FROM vehicle_logs WHERE speed > $1 ORDER BY "timestamp" DESC	128	120903.80399999999	944.5609687500001	15378944
8	2026-04-13 14:17:18.997802	SELECT create_hypertable($1, $2, migrate_data => $3, if_not_exists => $4)	3	226.12210000000002	75.37403333333334	3
9	2026-04-13 14:17:18.998219	SELECT set_config($1,$2,$3) FROM pg_show_all_settings() WHERE name = $4	9	67.759	7.528777777777778	9
10	2026-04-13 14:17:18.998461	SELECT set_config($1,$2,$3) FROM pg_show_all_settings() WHERE name = $4	5	39.4951	7.89902	5
11	2026-04-13 14:17:18.998619	SELECT set_config($1,$2,$3) FROM pg_show_all_settings() WHERE name = $4	4	31.247899999999994	7.8119749999999994	4
12	2026-04-13 14:24:32.313564	SELECT o.order_id, o.total_amount, p.product_name\nFROM orders o\nJOIN products p ON o.product_id = p.product_id\nWHERE o.total_amount > $1\nORDER BY o.total_amount DESC	1	3.8204	3.8204	932
\.


--
-- TOC entry 5845 (class 0 OID 43114)
-- Dependencies: 333
-- Data for Name: _hyper_4_3_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_4_3_chunk (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
1	2026-03-20 12:35:14.54846	/api/customers	GET	400	1791	864	69ae0c73-89b6-433f-8038-308e99a6c478
3	2026-03-20 14:19:49.54886	/api/orders	POST	200	1685	250	718376e0-80b2-4415-81b8-3fc3e1caea8b
7	2026-03-21 03:48:18.548893	/api/customers	POST	200	508	209	c4e60f76-7048-4070-821c-65eeabfb5a78
8	2026-03-25 20:02:58.548901	/api/products	GET	200	1100	85	9caa8193-632d-467e-a131-aa5bace7c954
9	2026-03-25 12:48:41.548908	/api/payments	POST	500	203	200	b7b81684-939a-4f33-9802-f34a64a8d252
10	2026-03-19 05:48:09.548915	/api/payments	GET	200	1717	499	cd89519a-8374-46f6-ba27-06558de338a4
14	2026-03-20 20:57:18.548944	/api/payments	GET	400	55	18	6d1afae2-83af-454c-bc12-c235d33844c6
21	2026-03-23 23:07:32.54899	/api/orders	POST	200	1819	703	2f087162-cd8e-4847-9b87-c2e86405e678
24	2026-03-19 23:46:39.54901	/api/customers	GET	400	221	21	ee08bbbb-3675-4f39-9b46-633577a6619c
39	2026-03-20 03:40:39.549112	/api/customers	POST	200	453	290	507776a2-e93b-4b02-b661-e837a1315054
51	2026-03-21 17:56:26.549187	/api/orders	GET	500	266	163	0ee05957-aaaa-4d9b-b666-ecfd3e630d64
55	2026-03-23 12:38:20.549215	/api/orders	POST	400	792	420	1c5fbd27-634a-48bf-b96f-8e45ca0c3f82
59	2026-03-25 03:24:24.549239	/api/customers	GET	200	405	319	61c13fe3-c2ff-4d88-8239-4aa60b67aa4f
63	2026-03-21 17:46:37.549265	/api/payments	GET	200	1180	685	2046182c-d7a9-455c-a0dc-a068af25dfc9
65	2026-03-20 09:40:28.54928	/api/customers	POST	200	833	422	6464ae7a-d1a3-4a4d-8ba6-20cec5fde752
70	2026-03-21 11:37:38.549314	/api/orders	POST	200	630	220	c4f5e0e6-ae3b-4295-bbf1-f97173b26558
71	2026-03-19 19:46:40.54932	/api/orders	GET	201	1554	1412	e2cf7833-a258-49c1-860b-c35ff0e68bbb
72	2026-03-22 00:31:22.549341	/api/orders	GET	404	1210	661	50f4d3cf-52ca-450d-83f7-11b4c91ae273
74	2026-03-19 08:25:01.549353	/api/orders	GET	200	1253	437	4650dc80-ba06-491f-8147-4925000b2301
75	2026-03-21 07:46:24.54936	/api/products	POST	500	1710	407	f276a8d5-def9-4966-9259-e18983cb651e
81	2026-03-20 04:52:45.549399	/api/products	POST	201	425	153	9da24ba4-a436-4622-b6a1-f9ba2329ec31
90	2026-03-22 18:40:18.549456	/api/customers	GET	200	823	797	34221fa5-bf73-49bd-a590-340fe1551e86
95	2026-03-23 10:59:10.549486	/api/orders	POST	200	141	111	1ba2f36e-0413-43a4-a2d1-93e443564391
96	2026-03-22 18:36:06.549492	/api/orders	POST	400	1419	259	49e16e63-92c2-4f51-8b52-5e8090de94f7
97	2026-03-19 14:15:42.549498	/api/payments	GET	200	1550	1250	be9beaae-0f9f-424b-b21f-d1cc62218557
100	2026-03-23 04:25:39.549518	/api/products	POST	400	1003	115	50a7ba7e-b922-4502-901f-be6d63b7edfc
112	2026-03-20 04:10:27.549595	/api/payments	POST	200	1069	734	1c053e28-09bc-47d1-be7b-f0ce158c28bc
118	2026-03-21 12:36:03.549633	/api/customers	POST	200	359	119	62aca258-e755-49b3-884a-856e02d7d53c
125	2026-03-23 05:18:09.549678	/api/products	POST	400	544	99	c5360f38-cc92-4f2c-a5ae-d62c6418b56f
133	2026-03-22 18:14:05.549729	/api/customers	POST	200	1259	1062	b090c6ee-db9f-45b0-ae46-4a22a137c915
150	2026-03-21 14:31:47.549834	/api/customers	POST	400	1681	1045	491a7f10-fc10-4461-9221-08d408086fa6
152	2026-03-23 10:37:18.549847	/api/payments	POST	200	794	533	3ca64903-21a0-4d0f-96d5-bdb4e78bf8b0
154	2026-03-22 05:46:49.549859	/api/customers	POST	400	1803	1171	24a70feb-f96d-464c-86f0-fd32a47bc507
156	2026-03-22 22:20:51.549871	/api/payments	GET	500	1940	1516	27fe20bd-d58e-4386-968d-bac35f0abb57
160	2026-03-25 01:10:58.549897	/api/orders	GET	400	1128	1026	c68d3fd7-62e4-4480-9c25-2bc5529d241c
172	2026-03-19 18:54:24.549973	/api/payments	GET	201	1747	211	f7196182-ccfd-4e88-bdb5-ea798a0a3e7f
173	2026-03-23 23:19:28.549979	/api/orders	POST	200	350	252	55d1a2b1-a641-4385-ab58-50097fe185ee
174	2026-03-19 07:20:16.549986	/api/orders	GET	200	564	341	176ea3c1-f8c7-43c1-b272-3007389c6f4a
175	2026-03-22 15:41:14.549992	/api/payments	POST	200	1939	606	b53c3cfc-4305-46b0-81b6-bc4e365cf4f8
180	2026-03-21 15:38:55.550028	/api/payments	POST	200	1767	533	84f687f4-fc64-4f4c-9b83-61b6a757ed1d
190	2026-03-23 14:18:12.550108	/api/customers	POST	400	1037	884	b6187448-a7b5-45b2-83a4-45d3ce011af7
191	2026-03-20 08:57:57.550115	/api/payments	POST	200	1337	871	a7f07af9-eaf7-4490-a62b-cfae185f5a3a
193	2026-03-21 06:14:19.550127	/api/orders	POST	400	128	106	54c9f217-ac17-4cab-8cb7-a03f5532d5ea
199	2026-03-24 05:12:28.550169	/api/payments	GET	400	560	181	b6b7b339-a95a-4a03-b579-abe29dfcc7df
202	2026-03-24 10:37:11.550188	/api/payments	GET	201	1641	1636	a232f446-c7f7-4f2e-aafb-9034de2e5536
203	2026-03-25 23:50:55.550194	/api/orders	POST	200	1831	1493	117c8dcf-7771-4e9b-99d2-4c71f16ddc4e
204	2026-03-21 07:30:00.550201	/api/orders	GET	200	546	163	ffd8b01c-a501-48bb-8f3c-fdb7227c97ef
208	2026-03-19 10:11:51.550225	/api/products	GET	200	186	103	cdd2ec18-6413-4a7b-93c0-6b71cf7e4ffa
213	2026-03-25 05:02:27.550255	/api/payments	GET	200	1462	1379	8d731806-1ea7-42d2-b2a1-6d25c335f139
222	2026-03-20 21:36:45.550312	/api/orders	GET	200	881	447	188c5cbd-cc60-4c6e-8ea3-d8daa6ba3409
228	2026-03-20 21:11:10.55035	/api/products	POST	200	54	29	d7591910-c0be-4128-b804-133f2450330a
233	2026-03-21 05:37:47.55038	/api/payments	POST	400	1423	491	0b02ee8f-b08d-45eb-8c56-2b391defd2c3
234	2026-03-19 06:02:15.550387	/api/customers	POST	400	524	46	fe9049d3-2bd8-4083-ad31-69afb6cd4b4a
237	2026-03-24 20:55:54.550406	/api/payments	POST	400	1467	1008	779b5d7d-b623-457c-b152-da1fb0989838
238	2026-03-21 14:24:02.550413	/api/customers	POST	201	249	216	6d6ea306-1162-4ff3-a836-32bea6e2225c
242	2026-03-22 15:08:38.550439	/api/customers	POST	201	264	99	dca4a775-0113-460c-8b4c-e10ce3dea97b
247	2026-03-22 02:09:18.55047	/api/customers	GET	500	962	476	afb0c991-bd5b-41b1-aae7-4165ff428c23
248	2026-03-25 03:45:43.550476	/api/orders	POST	200	731	526	7316a87a-750c-43a3-bbbe-a8ca8e3c951e
249	2026-03-23 06:23:49.550482	/api/payments	POST	500	286	276	d3aee684-aec7-42c5-823b-48bcd566a2ba
253	2026-03-25 16:52:44.550507	/api/products	GET	200	75	71	e66ecb55-f27b-4726-b6d6-96941cef3a4a
254	2026-03-21 04:23:15.550513	/api/products	POST	200	548	424	331c83bd-f415-4ff1-8a6b-9ac2c26e58c8
261	2026-03-24 07:14:31.55056	/api/orders	POST	200	291	249	232af61e-27e0-4c55-9650-9a401dbb747c
265	2026-03-20 10:45:12.550585	/api/orders	POST	200	1069	73	0bc71777-1678-40c6-86d6-6e05cd2199fa
267	2026-03-23 09:42:42.550597	/api/customers	GET	404	1471	1355	f88c758d-4a2a-4ae4-83ce-e4704587ed1f
282	2026-03-19 03:16:03.550705	/api/products	GET	200	1761	614	806d8757-e281-41b2-9123-f2521df7d12d
286	2026-03-21 10:37:11.55073	/api/products	GET	200	409	251	f93f99d7-5a8f-460f-8d5a-31be4d61eb5f
293	2026-03-25 21:04:30.550774	/api/products	POST	500	906	551	4deb2c0e-c7d1-4bfd-a521-4b1dd4bacc60
297	2026-03-23 08:25:10.5508	/api/products	GET	200	1067	962	bccc0df5-2717-4547-a9d0-69f28a091980
301	2026-03-22 04:36:36.550824	/api/payments	GET	201	977	441	3a50932b-7969-4786-92dd-ef873489b66b
315	2026-03-20 02:54:36.55099	/api/products	POST	400	1645	399	c56715c2-48b3-41db-950e-f379efaf4e21
316	2026-03-23 20:26:20.550996	/api/products	POST	200	511	386	b6d266ad-3023-4014-98f9-a62cc31c45ff
319	2026-03-21 17:05:36.551017	/api/customers	POST	201	1994	1718	dd0ddd4b-7ab5-4895-a225-d2a104a153e0
320	2026-03-19 06:51:42.551028	/api/payments	GET	201	1903	528	5a69be22-05d7-4437-a23c-b30d71b0cbd0
322	2026-03-22 22:13:44.551055	/api/products	POST	200	1699	735	e30851f1-b540-4800-9e6e-c85de060f003
327	2026-03-21 17:43:59.551091	/api/products	GET	500	1679	1274	2aa40d23-471c-4fa7-9f2f-9bf3c07ce11c
328	2026-03-22 01:36:07.551098	/api/orders	GET	200	1191	339	7de2b2d0-b956-46eb-9ec1-deba602e1a07
330	2026-03-24 14:01:11.551111	/api/payments	GET	500	1565	703	4e969d9a-ab61-445f-be9e-ae11cb80775a
331	2026-03-19 20:12:30.551118	/api/products	GET	500	58	37	b2973d9b-3a8e-4395-8d97-00792aa44002
335	2026-03-22 20:32:16.551145	/api/products	GET	201	921	189	1db076b8-9c07-479e-81ae-374a04a69c47
337	2026-03-25 18:46:34.551157	/api/customers	POST	500	551	472	d838aeea-939a-488c-a6c2-b0a9ca68fbf7
347	2026-03-25 19:47:39.55122	/api/orders	GET	400	1939	1694	664a5a1e-80c8-456a-8814-591c116ac877
353	2026-03-22 02:50:36.55126	/api/payments	POST	400	1934	1836	35247058-bb59-437a-9ce4-25f9ba69271e
364	2026-03-22 17:58:52.551329	/api/products	GET	200	850	295	2b4e5a46-da38-4f90-b4ca-6ad30a589f1c
366	2026-03-23 05:56:44.551341	/api/payments	POST	201	1065	370	5f2137c5-0b69-45f1-a5a5-bbc344fc0b8d
373	2026-03-24 15:20:10.551389	/api/products	POST	404	1854	694	c6878a21-62b9-4935-9f85-263a3ea92926
374	2026-03-23 10:36:15.551395	/api/orders	GET	200	728	628	5b4b2299-6ce6-4507-bcc2-6d1799253098
379	2026-03-19 08:46:11.551429	/api/customers	GET	200	1558	1233	7a2d252d-8382-4493-96f6-c9614cc98264
382	2026-03-23 21:23:59.551448	/api/payments	POST	200	1819	278	477d87a5-5089-43d9-be83-3cf6e260fea3
383	2026-03-23 00:19:05.551454	/api/payments	GET	201	492	25	180f0adf-26f7-45ae-b8fb-2346c5453b2c
384	2026-03-23 02:46:27.55146	/api/products	GET	200	769	355	d52351cd-864e-4e7d-985a-aa1a7f873d2f
389	2026-03-24 22:41:23.551493	/api/orders	POST	500	70	70	f1253001-5951-4b2e-ab4d-4bd8df3c47f8
391	2026-03-24 23:15:21.551506	/api/payments	POST	201	1133	88	3abd8d61-b8b5-40e6-bfea-4c9a9d12057d
399	2026-03-22 21:09:30.551572	/api/payments	POST	200	1453	842	4b97ba48-c26e-4674-a725-21e9c5290023
400	2026-03-25 14:46:43.551578	/api/customers	POST	500	623	469	22f8221d-9eaf-4ce7-8bb2-45fce819c381
405	2026-03-22 17:16:59.551609	/api/payments	POST	500	1898	1183	0485710b-f8a4-4f1a-8427-68895bfcfce0
406	2026-03-22 05:05:46.551615	/api/payments	POST	400	375	297	b3e57e41-7e9e-43a6-9049-984009a647d9
416	2026-03-24 00:51:48.552318	/api/customers	GET	200	1408	747	37d6e8da-07b1-4626-b507-4c37b7f16d95
420	2026-03-19 15:05:06.552367	/api/customers	POST	201	1339	821	adbb2d5a-33e9-4bef-b1a1-21066ef3aa82
421	2026-03-19 21:12:20.552373	/api/orders	POST	200	549	15	9c16ea82-8d0f-4899-9d7c-fb5c97c26f3f
434	2026-03-25 01:33:49.552456	/api/customers	GET	200	1885	27	720fb8a3-063e-456a-bc27-f60430b3ac31
440	2026-03-19 22:07:08.552492	/api/payments	GET	400	1186	136	8821bd22-847b-404e-862b-83dd64b4676a
441	2026-03-25 23:27:54.552498	/api/products	GET	201	1224	666	0842bb62-13c0-457d-8db1-3e04cbc45d57
446	2026-03-21 07:31:39.552918	/api/customers	GET	404	99	81	d8806023-cf7d-4ed4-a0ae-66242483f15e
451	2026-03-23 18:58:56.552953	/api/products	GET	200	1226	931	4adaf0e0-84cb-4785-a402-6030be3e0ca0
453	2026-03-24 16:35:30.552966	/api/payments	POST	500	1511	743	461e12eb-a17f-4a9f-a790-16a5fd17786d
455	2026-03-21 05:03:43.552979	/api/payments	GET	404	708	547	cbeb5a37-38f1-40ed-88dd-90fbbd055834
459	2026-03-19 02:48:36.553006	/api/customers	GET	400	115	13	cdc31d78-1ec0-434a-81c6-94aae8fec07d
461	2026-03-23 00:14:07.553018	/api/products	POST	500	430	29	3880192d-481d-476f-80aa-294b3c5b76e1
462	2026-03-21 01:14:11.553031	/api/orders	POST	200	729	48	d345beb6-8953-44ec-ba7f-f3972f92dec1
464	2026-03-21 07:48:17.553044	/api/customers	GET	404	315	207	cc447c3d-e633-487c-8aca-99bd3c79d253
473	2026-03-19 07:26:38.553103	/api/orders	POST	200	768	476	e5122f4a-8c56-425a-87ca-d63fbb731add
474	2026-03-23 03:59:33.553109	/api/orders	POST	200	1102	218	99d0ad00-255e-478f-9c38-14d22235e0da
478	2026-03-23 03:45:45.553133	/api/orders	GET	400	1031	36	3caf5e85-02d5-4ac4-a615-1a6cfc1659d6
482	2026-03-22 12:11:07.553157	/api/orders	POST	400	655	541	33966086-41d8-4806-886a-3cf13ec00a0c
485	2026-03-20 09:39:08.553175	/api/orders	GET	200	865	380	e9290421-ddb0-4112-870f-8ec404bc30b8
490	2026-03-24 06:20:12.553206	/api/orders	POST	200	998	304	7d58ec86-8805-404f-b3ff-5a4d27178150
491	2026-03-24 07:14:42.553212	/api/orders	POST	404	551	473	93c4d11d-f668-464b-a580-3b40c0431c8b
493	2026-03-20 09:25:21.553224	/api/products	GET	500	1092	308	911943e9-01de-41de-acc9-a30eb61c755a
496	2026-03-20 13:24:27.553243	/api/customers	GET	400	1944	1450	0a6829ff-9949-4266-b165-bd3cb7f89fcc
500	2026-03-22 23:43:42.55327	/api/orders	POST	201	1476	664	f2c1886c-b9ed-40b1-b624-804db98d94c7
503	2026-03-19 11:13:21.553288	/api/customers	GET	500	1820	1344	b22a6682-36f0-454a-85f8-9dd722d07484
508	2026-03-24 11:09:00.553319	/api/payments	POST	200	163	44	6bad6ff4-3844-4c81-a713-de226e01630e
509	2026-03-23 03:15:37.553325	/api/products	POST	200	1081	330	abff5fbc-dc54-4998-8939-79cea6bfc49d
516	2026-03-20 00:47:07.553372	/api/payments	GET	200	1311	452	11729214-47bd-49ca-a3c3-b9ab994a57fc
519	2026-03-23 17:35:02.553391	/api/customers	POST	404	1930	1079	dedb1908-1e64-44cd-ad92-950ec909bf77
520	2026-03-25 16:03:47.553397	/api/products	POST	200	650	351	9a47f37c-e8aa-4d37-8f6a-8ecc5f7e69cc
526	2026-03-23 18:14:51.553435	/api/products	GET	200	1076	405	aac05c09-3b2f-4672-83af-a7b52978a2aa
530	2026-03-23 14:21:03.55346	/api/orders	POST	200	1346	266	270c5ca2-fda4-4ac8-b646-3e733faaedc1
532	2026-03-22 03:48:11.553473	/api/orders	POST	400	1831	88	e87e4bf7-e0b5-491b-b7eb-44d3a28ef070
533	2026-03-19 12:32:18.553479	/api/products	POST	500	828	828	6bd66607-984e-45c2-95e5-3579ee3e463c
542	2026-03-25 04:29:02.553532	/api/customers	GET	400	1735	307	d4ce1a04-c1db-4d70-a505-c50409921b22
543	2026-03-24 00:38:50.553538	/api/customers	POST	200	501	163	d7a4834c-4354-4cf6-aab7-3da032128f47
554	2026-03-20 06:44:31.553627	/api/payments	POST	400	558	325	fe1037ec-8594-43b4-9b0f-512298cce424
556	2026-03-22 10:37:55.553639	/api/payments	GET	400	1528	438	54bb3ea1-41fa-43f4-aef2-ee58394c956e
558	2026-03-24 17:51:16.553652	/api/products	GET	200	961	115	91b15b08-0dde-4c5b-82ae-5534415bd442
574	2026-03-24 06:46:09.553752	/api/orders	GET	404	1665	133	371ceee6-bda4-4e70-a734-19130dc23271
580	2026-03-19 00:03:45.55379	/api/customers	GET	200	784	509	1d74e3ef-582d-41cb-83f1-d536cc00e442
586	2026-03-21 15:35:45.553826	/api/orders	GET	200	1013	43	f572ebd4-65cb-44bf-9c10-aee47c2b4857
590	2026-03-19 05:51:27.553853	/api/payments	GET	500	664	105	80d93305-0f57-4e6f-a76c-06d32702bc3a
592	2026-03-20 06:28:29.553865	/api/customers	GET	400	1357	1057	ec99961c-18ad-417f-9fae-9a5b20fd00c6
610	2026-03-19 02:04:17.553978	/api/payments	GET	200	55	49	bcbf8fd5-1924-4ba8-9275-3364e6b2e349
612	2026-03-24 13:59:48.55399	/api/products	POST	500	982	743	258f17bb-f12e-48e7-945c-90deb1771fee
613	2026-03-25 08:25:03.553995	/api/customers	GET	201	209	37	0fc8863f-0358-4aa5-902f-56e75c0f4aa3
614	2026-03-20 00:56:26.554002	/api/customers	GET	500	1219	116	6859733a-d876-4df1-9472-c35035e2abb7
615	2026-03-25 01:14:38.554008	/api/orders	POST	200	1237	821	b0cfb1d4-e36b-40ef-a7c8-73a88988a5e0
627	2026-03-24 12:50:00.554088	/api/payments	POST	400	1774	1311	ad185577-290f-4281-8bfd-e3be27b3a3d1
628	2026-03-23 06:43:34.554094	/api/customers	POST	200	396	254	04e13803-98e0-4ee6-89bb-e11650087dd9
630	2026-03-20 03:45:34.554106	/api/payments	POST	404	761	332	e7a6cb70-f975-40de-be7f-2ee604054590
632	2026-03-21 09:30:54.554118	/api/orders	GET	400	1456	1210	b01d02b6-c931-4dc2-a4d1-f559e768c24a
634	2026-03-19 00:43:57.55413	/api/products	POST	400	1520	471	39267125-9b88-4fef-a8fc-a8b7f407b32c
635	2026-03-23 11:08:53.554136	/api/products	POST	200	1561	15	9f1ed162-e733-4e63-a4f2-f4681275bae6
638	2026-03-19 20:21:25.554154	/api/orders	GET	500	812	426	48c955af-51dc-4c9e-8118-2040fc1426d5
640	2026-03-22 00:16:40.554166	/api/products	POST	200	1928	1655	25255df4-a75f-43ad-becb-9c6a5786d2d8
646	2026-03-21 08:46:25.554204	/api/payments	GET	200	192	135	ea1ad4f8-e5cf-423e-a989-624b04ec2bca
658	2026-03-23 01:24:43.554278	/api/payments	GET	500	1843	484	8b6f89d5-2d82-4ba9-8412-42cb84a41b8b
666	2026-03-24 18:55:22.554327	/api/products	GET	200	254	236	697d7fbc-0af7-4934-939a-fc81d151ba79
668	2026-03-20 12:29:02.55434	/api/orders	GET	404	50	18	0ba883f1-94de-4e7f-8038-46227f35dedc
674	2026-03-25 06:03:31.554378	/api/customers	POST	500	1844	284	14a396ad-1726-41a6-9df9-9ade9577ab88
687	2026-03-24 12:02:02.55446	/api/customers	POST	404	79	35	98b681f8-0d1a-42b1-acd5-ffaaea386f0a
688	2026-03-20 16:35:08.554467	/api/customers	GET	400	1022	480	0c0b1fc9-0337-4760-96a0-c07dc5e90163
690	2026-03-23 20:37:40.554479	/api/products	GET	400	740	167	7b79716f-8673-4bde-bcbf-6ecab1e98bca
695	2026-03-25 13:23:25.554508	/api/customers	POST	200	279	211	52f12b60-51c4-4025-b759-bd4795a59f70
699	2026-03-23 00:05:15.554533	/api/payments	GET	200	1188	34	855be144-a0de-4885-b7bb-a57aba828e30
702	2026-03-21 00:52:32.554552	/api/products	GET	400	1602	1436	65dcf47d-2553-4c4e-b2eb-a33a78c1f30d
704	2026-03-20 16:03:07.554584	/api/products	GET	200	389	297	65d1963e-c650-4593-9124-81aadbde6e6b
706	2026-03-22 13:31:10.5546	/api/products	GET	500	147	119	ff7e729d-58e5-4e3b-ab96-3ec39d4dde4c
707	2026-03-21 04:27:42.554606	/api/orders	POST	200	1432	269	1dbef15b-3c1b-4553-8895-be83f7235eb2
711	2026-03-20 03:55:29.554631	/api/products	GET	500	1555	1131	0641bf31-3167-47c2-81d4-ee1d43d1f046
717	2026-03-25 20:54:24.554667	/api/orders	GET	200	1349	196	31049c28-7af7-4f7e-b9f0-d4f8383f2ec7
724	2026-03-23 09:14:30.554712	/api/customers	GET	400	1718	1587	74c868c7-22b9-48d7-950f-babe810254a2
728	2026-03-24 00:41:23.554737	/api/payments	POST	201	1676	1483	acecadee-54d9-4a43-9c5f-572bd1505ca4
731	2026-03-21 14:44:11.554756	/api/customers	GET	200	1098	589	8732e164-b53e-4d27-aa47-7d270a91d4f2
735	2026-03-19 07:55:25.55478	/api/orders	GET	200	1902	990	33729e02-cf48-4f0a-875f-45311f31635e
736	2026-03-23 03:23:19.554786	/api/products	GET	201	611	202	490aec3d-3e1b-4921-bfc3-91d9e1735a7c
737	2026-03-21 06:28:27.554792	/api/customers	POST	500	372	304	c550ce3e-9ec9-4ecf-9b95-aa6721f830b0
748	2026-03-23 23:45:37.55486	/api/orders	POST	500	314	268	e2bba81e-e21a-4730-906a-c09378b545ce
758	2026-03-23 12:48:06.554923	/api/orders	POST	201	1326	973	dda21cf6-c113-43c8-848d-ceaac0ac502a
759	2026-03-24 20:40:07.554929	/api/orders	POST	400	1900	1771	1457a2f1-e251-402d-9436-c9b66a8b9413
762	2026-03-19 04:49:39.554947	/api/products	GET	200	439	375	fe9c1cbe-f10b-4cfe-a9af-48b3eb7d8ce5
771	2026-03-19 18:43:56.555003	/api/customers	GET	200	411	73	0e2e77a6-0f8a-4f0d-83e1-35ed3aff8af9
798	2026-03-25 09:07:17.555174	/api/payments	GET	201	960	935	48a5ea86-7827-427a-85bd-256170aa3797
803	2026-03-21 02:57:39.55526	/api/products	GET	201	1045	568	60cd9dfd-4077-41be-8ac5-de66b159603a
805	2026-03-19 03:17:09.555272	/api/customers	GET	500	221	140	5930597f-30d2-4c98-8e9e-6f6170580633
806	2026-03-22 00:57:21.555278	/api/payments	POST	500	824	299	aa4252ce-bf3d-4608-a57b-d2a219d840aa
808	2026-03-24 15:17:40.55529	/api/payments	GET	400	1890	1512	0306fbd7-29f4-4448-9d53-af9e77b275c1
816	2026-03-23 19:02:47.55534	/api/orders	POST	200	1749	1546	e146a072-7118-48b9-b191-1d48b18d5d47
818	2026-03-24 06:04:22.555352	/api/products	GET	200	1251	1084	844415d7-76c0-44ce-b191-e116a63993e6
829	2026-03-19 03:01:35.555421	/api/products	GET	400	1058	1010	0e261228-6558-4f38-af67-c3a8b2c0c17f
832	2026-03-20 13:59:10.55544	/api/orders	POST	500	1650	1408	6f6d5ce8-ae57-4674-83ec-6c26cf3c6896
835	2026-03-22 09:23:26.555459	/api/orders	POST	200	1032	890	d50f8751-7da6-42e6-897d-c4c7b0c2e68e
836	2026-03-23 17:43:54.555465	/api/orders	POST	200	900	726	b043842b-e97b-4541-a9c1-58857332c577
840	2026-03-25 16:52:23.55549	/api/payments	POST	201	314	224	c973d07e-c503-418c-ab7a-5c25cf47f31b
844	2026-03-24 20:07:11.555515	/api/customers	GET	500	1864	1810	8b4a7d98-9a14-4cc7-b8e8-660059c53848
845	2026-03-24 16:23:53.555522	/api/orders	POST	200	1592	1500	7401d79b-ecd3-41e3-a5d8-50c20ec9e5e1
849	2026-03-25 05:13:37.555546	/api/orders	POST	201	1986	490	dd085627-28fd-4fd0-b21f-6298db5176af
850	2026-03-25 17:12:16.555552	/api/orders	GET	200	1404	677	d0c29448-6af7-4b54-a771-c34ddfc33983
856	2026-03-23 16:15:11.555601	/api/orders	POST	404	1235	582	70d6977c-1882-4c11-a79f-97efcca9b33b
859	2026-03-23 17:16:49.55562	/api/customers	GET	201	1125	332	1609ecd1-82b6-41a3-9d42-f58bdf62b3c6
861	2026-03-23 06:33:53.555633	/api/orders	GET	200	734	319	f4aaa77f-6c19-48a3-8e0f-4b6fb1d47dc0
874	2026-03-21 21:19:26.555711	/api/products	POST	404	788	716	db506f2c-d285-463a-a30f-4796b6959a49
876	2026-03-24 08:47:13.555723	/api/payments	GET	400	1296	600	9c68801e-90df-40b5-80d2-4c68bc5cd968
877	2026-03-21 05:50:41.555729	/api/payments	GET	400	59	25	160cab8b-3b3e-44f7-b958-41bee3f9e582
900	2026-03-20 20:05:09.555874	/api/products	POST	404	1958	942	c2dc6ee0-62e4-4790-aef4-bb23f62dc34e
907	2026-03-21 21:31:45.555919	/api/products	GET	500	429	127	e6a0a0f2-379d-4da0-b3f5-1f49c8388800
912	2026-03-25 14:36:22.555951	/api/payments	POST	201	1134	61	d01d5880-f5d6-40c1-89ac-8cd7a0b426aa
914	2026-03-25 07:52:26.555963	/api/customers	POST	200	1428	1419	7728e905-25bb-4826-8b21-f9c42d8b5544
915	2026-03-21 07:03:06.555969	/api/products	POST	200	280	212	2323f9d3-27ad-4422-b194-7beed08aa63f
921	2026-03-22 19:14:23.556007	/api/products	POST	400	1289	270	6f12bcca-27cd-4e00-a91b-ce98415cb571
927	2026-03-22 14:56:09.556055	/api/customers	POST	200	1038	622	c5b7cdf1-7077-443e-ae92-c27084bde54e
930	2026-03-20 10:49:05.556075	/api/customers	POST	200	1176	81	c2f863ae-b775-4d02-9064-980834956e72
936	2026-03-25 07:58:58.556112	/api/products	GET	200	298	247	33086229-4cea-476c-83d0-45ea3fd6687b
941	2026-03-21 11:23:38.556145	/api/products	POST	200	690	575	98f62299-c992-4af6-a9f8-4e6d3769d4f2
946	2026-03-19 18:53:27.556176	/api/payments	POST	201	1148	912	26cdf5b4-5dc3-49cf-b7d2-4582e7613689
963	2026-03-23 17:47:53.556285	/api/orders	POST	500	1404	130	9e2f9195-d715-4c41-ac6c-d1f7aeef9f48
971	2026-03-21 20:21:46.556334	/api/products	POST	201	676	625	b6cc9241-e2e4-4f5a-8e05-abdbfec0642e
978	2026-03-19 01:05:20.55638	/api/products	GET	200	1141	375	93e5b557-d8e1-4e0e-864e-7d76463c8d89
980	2026-03-23 20:37:48.556392	/api/products	GET	200	126	48	1171e3ad-3008-4a4a-adc9-413a9d855143
983	2026-03-20 23:39:35.556413	/api/orders	POST	500	1664	1185	fe2de411-82ef-43fa-863f-32cca784f676
985	2026-03-19 07:34:53.556426	/api/products	POST	404	722	659	b71290de-0aec-4fc9-9365-0564ecbd4e82
990	2026-03-21 21:14:07.556457	/api/orders	GET	400	387	289	5a1c6dd6-415d-41eb-87b2-34f514192907
992	2026-03-19 23:44:27.55647	/api/payments	GET	500	1959	877	501d0fe7-37f6-4909-90e4-cb2823d40d85
995	2026-03-19 20:11:54.556488	/api/customers	GET	200	1974	1007	9f363288-5ef8-4bcd-bb4c-1c86cd41812a
998	2026-03-23 08:20:27.556507	/api/orders	GET	200	922	550	5b66860d-a323-4e5a-ac8d-e445e778e391
\.


--
-- TOC entry 5846 (class 0 OID 43124)
-- Dependencies: 334
-- Data for Name: _hyper_4_4_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_4_4_chunk (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
2	2026-04-09 21:57:12.548842	/api/customers	POST	400	1349	847	579eb441-e0ae-45d0-b764-11bd5c396143
13	2026-04-12 21:48:04.548938	/api/customers	GET	200	1742	948	5bf9a012-1f6a-4dcc-a77e-600df5cd66c5
18	2026-04-10 10:57:54.54897	/api/orders	POST	400	670	49	97be2ba9-a095-4e03-a093-60cfd6f87056
23	2026-04-11 20:28:25.549003	/api/products	GET	200	425	360	d8c79254-ae19-4615-abe5-6ed0e2550665
31	2026-04-11 20:56:29.549061	/api/orders	POST	200	1645	917	90d752f0-d490-440b-9c7a-e221f5b66779
32	2026-04-10 21:54:53.549067	/api/orders	POST	200	1907	967	e182e66f-b0ad-422d-b104-c633b898da7b
34	2026-04-12 09:54:15.549079	/api/customers	POST	200	758	102	30d7b56c-7f89-4318-818a-a963778db75d
37	2026-04-11 15:25:10.549098	/api/orders	POST	200	1161	932	cc435c83-f420-4184-a044-16fe904a37ae
41	2026-04-10 03:06:00.549124	/api/products	GET	200	263	104	8ee90f80-dc60-49d5-a484-db819e1eb75f
54	2026-04-10 00:31:40.549208	/api/payments	GET	200	74	50	0b35d3a5-216f-497a-9166-ba1f97042ca2
57	2026-04-12 11:10:40.549227	/api/payments	POST	500	1301	808	d880778f-7240-424a-90d2-24d966d007af
58	2026-04-11 19:10:19.549233	/api/orders	GET	200	1873	1500	c2185b17-30ae-4a3a-9332-ac0747d9520a
76	2026-04-13 07:26:51.549366	/api/products	GET	200	350	141	2f9ef05d-2130-4708-901d-809657bcb1a5
79	2026-04-11 19:55:21.549386	/api/payments	GET	500	1747	1290	102774df-c997-4838-9053-20080141e269
84	2026-04-11 19:59:17.549418	/api/customers	GET	500	271	101	96b44850-e237-4093-b9a7-538497c62b10
87	2026-04-13 01:49:05.549436	/api/customers	GET	201	1597	830	77b045c8-9880-4f22-bbe4-154e8eba1d04
92	2026-04-09 22:30:34.549468	/api/customers	GET	200	1125	804	291f12da-1d5a-4472-ade8-25a8199e9db5
99	2026-04-09 15:36:14.54951	/api/products	POST	200	1157	631	359622a3-ac57-4a29-b75e-04cf0ecb3f90
101	2026-04-11 06:46:11.549525	/api/customers	POST	201	691	469	440ea52c-732c-4ce8-9a52-fe320de4460c
102	2026-04-09 12:01:03.549531	/api/payments	POST	400	1115	274	9a675cc1-c0c6-4b42-b1b2-9ff1850ab302
107	2026-04-12 18:41:22.549563	/api/orders	POST	404	430	323	79e1ad7c-cad8-4458-ba8e-f5c1d67370a8
110	2026-04-12 07:04:01.549583	/api/customers	POST	400	1761	1520	c3e19d93-d8c6-49db-a446-1604f48014e1
116	2026-04-09 15:15:40.549621	/api/products	POST	500	1396	379	a9baac23-b75a-4c30-ae5d-37c719dc446d
120	2026-04-12 02:57:33.549646	/api/orders	GET	200	1139	44	afc0392e-84bf-414f-81d7-1e8ed9d58153
128	2026-04-11 06:25:26.549696	/api/products	GET	500	347	72	da2236eb-0b78-4c5e-8989-843723e8d97e
136	2026-04-09 18:14:36.549747	/api/customers	POST	400	89	43	63a81b49-c5a5-45dd-8248-c660eede6f6e
148	2026-04-12 16:20:51.549822	/api/products	POST	200	951	697	fde8d513-86dc-4c15-a99b-29f879f63216
163	2026-04-10 13:45:08.549915	/api/payments	POST	404	295	234	b6a4ed3b-6dcb-489d-92e6-8fa4c0e6e232
166	2026-04-12 12:09:28.549935	/api/payments	POST	404	1008	381	2ae5daa7-4ad1-4bc1-bef6-1fa5c89a9dc5
183	2026-04-12 05:25:36.550063	/api/customers	POST	200	573	36	00ecce55-31ad-42db-a4a8-e8dc03352bce
184	2026-04-11 00:26:48.55007	/api/customers	GET	200	275	218	3e8b249c-d7fd-4e2a-a130-3c7d5a86c62c
185	2026-04-10 16:44:13.550076	/api/orders	POST	404	1407	568	3c1487dc-5e2e-4bc2-bf9c-910a34da0711
187	2026-04-09 15:47:03.550089	/api/customers	GET	200	1244	900	d8eadbc4-a896-4518-9957-e04b0d479aac
188	2026-04-11 18:16:44.550095	/api/payments	POST	404	1629	366	99e2867d-1078-47dd-919c-d43d47091b57
206	2026-04-12 16:45:10.550213	/api/orders	POST	200	1323	1072	7eb87cba-55d6-4191-8bdc-e1ad1a0571e4
207	2026-04-10 22:40:46.550219	/api/customers	GET	200	911	258	d1fe99cd-798e-4385-a2ac-534c6a8e359b
225	2026-04-10 00:25:22.550331	/api/orders	GET	200	1222	261	2f69ddf6-8743-4b53-ab28-c4827879f99f
227	2026-04-09 09:59:12.550343	/api/payments	POST	200	191	94	f3193e4d-bc49-464e-8882-00d621f47dfb
230	2026-04-13 00:53:23.550362	/api/payments	POST	200	1066	846	8c97514c-ce4d-456c-b527-e20dbff12dbb
235	2026-04-09 02:41:59.550393	/api/orders	GET	200	1883	1591	acbaf4f9-083f-4e17-98f2-4ea8c8ebf6f6
236	2026-04-13 07:17:02.550399	/api/products	POST	201	1940	307	d7b1b56c-5f3c-4654-9d2d-e3ad7df6ce49
239	2026-04-11 14:42:46.550418	/api/products	POST	200	867	835	3852933f-8afd-4714-a9fa-3ba3d4f6bd32
244	2026-04-10 20:35:30.550451	/api/customers	GET	500	745	609	e3ad775e-1441-47e4-9888-e02ecc8d7b80
257	2026-04-10 20:07:15.550534	/api/orders	GET	200	427	23	e0345678-0e8d-4ec0-b474-c073667c644d
264	2026-04-09 20:15:25.550579	/api/payments	GET	201	256	65	07322235-06b7-4357-8a90-47ce252d02ea
268	2026-04-10 19:46:39.550614	/api/orders	POST	200	1837	1453	5041663c-5733-4cda-88a9-b87ff3fa0b2f
273	2026-04-09 07:24:58.550648	/api/orders	POST	400	616	255	81fb9a5d-3e3e-4baf-b0da-21e7d11432be
280	2026-04-13 05:08:29.550692	/api/orders	POST	200	313	158	6219758a-65d1-4702-8187-16bbf012233f
285	2026-04-11 03:28:55.550723	/api/products	GET	200	1504	875	674f3191-fdf6-480b-a83f-3bca4038a24a
288	2026-04-13 00:23:25.550742	/api/customers	POST	200	533	515	dcdd4b1d-8af0-4575-bb2f-097a2f607f89
294	2026-04-09 06:11:33.55078	/api/payments	GET	201	1336	759	5b34ec99-35d9-4b9b-b7ec-c947a67651f3
295	2026-04-10 16:02:14.550788	/api/products	POST	200	353	286	11b6569f-b7f0-48ea-8d84-5845276793d5
324	2026-04-09 16:47:09.551071	/api/customers	GET	200	294	290	f44c73a2-497d-49f7-822e-cc38b6e07519
325	2026-04-11 20:09:49.551078	/api/payments	POST	200	1846	634	919795df-978a-4618-8ff2-fd7349dcdc00
329	2026-04-12 05:24:55.551105	/api/orders	POST	400	440	313	09c588d4-8c85-4e39-a15f-02ed85f3a94c
332	2026-04-10 12:30:04.551124	/api/products	GET	200	289	183	835cf344-18aa-44b2-abcc-d44378955088
342	2026-04-09 10:18:44.551188	/api/orders	GET	200	322	181	dcb8a1cd-feb7-4594-8a09-5563baf9d8fd
344	2026-04-10 17:38:20.551201	/api/customers	POST	404	729	421	3f2a4861-f68c-4d2e-8b8b-ae8b816e51b0
346	2026-04-11 21:52:20.551214	/api/payments	GET	404	1244	277	d2cf574c-704e-447f-9bd5-e59dcf1bb9d2
348	2026-04-09 17:34:46.551228	/api/customers	GET	500	650	54	94fe55d5-c82f-49f5-94cd-5dfed4925835
350	2026-04-13 09:34:33.55124	/api/payments	POST	404	857	402	9b765f2e-d780-4745-a2e9-7e9f29f212dc
365	2026-04-10 17:47:39.551335	/api/products	POST	200	1812	850	608d06dc-d60b-43e2-9dff-35162a3b9282
367	2026-04-13 04:12:46.551347	/api/orders	GET	200	1270	529	2a0ecba4-6ba0-4401-a776-3bb1e013ad9c
372	2026-04-09 15:27:28.551381	/api/products	POST	200	1611	214	c598a2be-1a14-4e58-8e6e-1a5a4aaff4a6
378	2026-04-10 16:36:55.551423	/api/customers	POST	404	1506	356	dac9edc7-d2f3-4182-98ce-e5e37f38d551
386	2026-04-09 00:13:09.551472	/api/orders	GET	200	1329	97	36b86e06-9bc9-4cd0-b8ec-08b5a18ef997
388	2026-04-13 03:39:41.551487	/api/payments	POST	404	477	256	5617a8ba-a744-4b70-a788-5569833b8881
390	2026-04-13 09:08:34.551499	/api/customers	GET	404	770	143	e60c78bf-a7c1-4a18-8d6a-d3a828b53410
395	2026-04-12 19:19:31.551547	/api/customers	POST	201	1964	1778	ff37150b-c113-48c5-9601-c50e7cfade9d
410	2026-04-12 02:41:41.551642	/api/payments	GET	200	711	275	b2e8848b-bf88-422f-b5dc-036839259d4f
417	2026-04-09 20:50:31.552345	/api/orders	POST	500	1223	210	d03d970e-17cd-4e4c-bf49-9569c95a9d59
422	2026-04-09 18:15:02.552379	/api/customers	GET	200	588	541	4245eebb-7272-49df-a89a-d35bd600e9ba
432	2026-04-09 07:29:28.552443	/api/products	POST	200	96	38	9a9ff207-f33c-4cce-af81-79b701a081bd
438	2026-04-10 14:28:25.55248	/api/orders	GET	201	148	13	e1e7a7fb-4ff9-4f96-8553-9b6e32533466
439	2026-04-12 11:08:25.552486	/api/products	POST	400	1133	275	662cacf5-5130-49b8-bbc7-3ea7cd01a5ec
442	2026-04-10 11:54:05.552884	/api/orders	POST	200	792	739	1e42d1ff-a30f-4e92-ae48-3a8409ce20b5
458	2026-04-10 12:29:50.553	/api/payments	GET	400	922	496	7d9a36e7-457a-4616-9049-6980254ad396
463	2026-04-12 04:48:54.553037	/api/products	POST	200	1580	188	e981f6d0-7a18-4239-942d-4a8209ae5b83
470	2026-04-12 19:33:13.55308	/api/customers	POST	200	501	74	781ab6c9-bf5e-457c-a681-96eab42a9920
472	2026-04-11 11:15:41.553096	/api/payments	GET	500	977	69	269aee08-db3f-4b7c-976f-c80d71409480
480	2026-04-11 00:51:43.553145	/api/customers	GET	200	1428	1069	3755fcf4-4cdc-4376-bed5-64d29d9cfc40
481	2026-04-12 04:27:56.553151	/api/products	GET	201	1879	476	9f5f69af-a1a8-4e7c-8905-4ffcd728aac6
487	2026-04-13 09:57:40.553187	/api/customers	POST	400	1080	41	b6d88a99-a16c-49e9-8d26-80fa1fa1dcb3
506	2026-04-09 03:47:08.553307	/api/payments	GET	200	1563	97	5bcfba01-cd83-40de-80f9-364adbad877d
507	2026-04-09 14:05:46.553313	/api/products	GET	400	1010	780	7c6ccbeb-f90f-4a30-8d04-a8d03f89f289
515	2026-04-10 07:44:04.553366	/api/payments	GET	201	1607	1369	22d0fc6c-4664-4c24-951e-902be236dbbe
518	2026-04-09 16:30:37.553385	/api/products	POST	200	419	201	98566444-d19f-441f-9fa3-55e8435f5d36
523	2026-04-09 14:21:20.553417	/api/orders	GET	500	985	511	d8f20080-50f3-4c8b-a466-3c0b42bdf002
528	2026-04-10 10:35:21.553447	/api/products	GET	404	1102	812	6e799360-874e-4f95-9779-d0c8e438c433
534	2026-04-11 08:17:14.553485	/api/products	POST	200	1861	975	a9c745ef-e4d2-4eea-881c-ef57d66c41e8
550	2026-04-12 11:05:25.553603	/api/products	POST	500	936	594	90788150-1f06-474c-a296-aebfe9da708c
553	2026-04-09 04:04:17.553621	/api/orders	GET	404	938	569	554bff3a-eef1-4253-9c3c-089318d320a1
571	2026-04-10 12:54:43.553732	/api/orders	GET	200	872	515	bf6790c5-9742-401a-8055-9846956381fd
581	2026-04-11 07:54:48.553796	/api/payments	POST	201	1226	924	538561a1-0fc5-45c1-ae65-e64bfd7f1535
587	2026-04-09 21:28:24.553832	/api/customers	POST	500	1620	760	4508195e-4b2f-4810-b3ab-b24a5e8ffeda
589	2026-04-12 11:55:09.553847	/api/customers	POST	201	1302	695	86d937c3-6147-498b-b0b5-a89bdce27b02
593	2026-04-09 17:13:57.553872	/api/orders	GET	200	280	151	48802b87-0126-433b-8ce5-dbd86415dce1
596	2026-04-09 02:49:22.55389	/api/customers	GET	400	973	935	bceadcf5-670e-4e76-b68e-8e699d175889
601	2026-04-11 11:20:00.553921	/api/payments	GET	200	648	297	51df380f-b8e1-4c1c-a9d2-95aa729aa9ab
603	2026-04-12 10:33:22.553934	/api/payments	GET	200	990	366	5494568b-1f10-4565-b086-e78abd8f6555
606	2026-04-12 09:49:17.553952	/api/payments	GET	500	1615	861	ec0e8199-583e-4a8a-92ab-c99026d217a0
624	2026-04-11 06:47:45.554069	/api/orders	POST	201	270	90	d8b90d47-447f-4931-b323-5d13c228a493
641	2026-04-10 23:05:52.554172	/api/products	POST	400	1425	407	f451d0b4-55d2-4e8a-9f3e-031b7c54a9aa
644	2026-04-11 11:10:40.554191	/api/products	POST	200	390	14	c2e0f180-dd9c-40da-a422-39b74719572e
648	2026-04-09 23:21:33.554216	/api/products	POST	200	1465	1307	43da6dc2-3511-480f-9e7f-f8a320d43238
653	2026-04-11 08:05:49.554248	/api/payments	POST	200	1694	1363	570952d7-432b-4474-82e1-5f3c2b40b57c
659	2026-04-13 06:19:20.554284	/api/payments	POST	500	1799	1410	2a0feba3-8093-49a3-b262-ea9ca0c4f997
660	2026-04-11 19:53:13.554291	/api/payments	POST	404	1877	695	abb3da1c-f46f-4f8a-a99d-62a2dd894e30
678	2026-04-09 22:47:38.554404	/api/payments	GET	200	1004	25	c5187d41-2bd8-43cd-92ce-5cb990675ade
685	2026-04-12 10:56:18.554448	/api/payments	GET	200	325	136	bf720555-4a91-4a38-9487-4c7cf021e6b6
689	2026-04-09 09:31:35.554473	/api/payments	GET	404	1651	281	ce1804dd-98b6-41ca-aab8-eff329f9da5a
693	2026-04-10 09:35:17.554496	/api/customers	POST	200	1361	1041	43d1ad91-0076-42a0-83e7-108e52a0feb8
705	2026-04-10 01:58:15.554592	/api/customers	POST	200	1361	68	5aee47aa-6163-4d16-a8d9-ec50ae4cbd3a
708	2026-04-09 15:56:36.554613	/api/customers	POST	500	1241	594	08d10af8-c143-4ee0-81fb-037df27002d2
710	2026-04-12 01:21:49.554625	/api/payments	GET	200	1518	468	9bb5144d-8538-4791-9c3c-a827c2dd4790
715	2026-04-11 18:43:36.554655	/api/orders	GET	400	1045	872	6e03d313-54fc-4b51-8e2e-0378b0ddcae8
722	2026-04-10 06:15:26.554698	/api/payments	GET	400	715	168	36098f06-b785-47a8-9a20-f7aa3e3db7bb
727	2026-04-11 01:19:05.554731	/api/products	POST	201	1080	268	04d26dd9-517c-434b-a632-7e2c6bec664c
729	2026-04-13 04:21:00.554743	/api/payments	GET	200	1081	917	e6316ee4-cf2d-4689-b0b3-db78abf283a9
738	2026-04-11 15:45:05.554799	/api/customers	GET	200	697	146	467b136a-d3f1-471e-b9ac-86651c9641f9
740	2026-04-10 23:18:08.554811	/api/products	POST	404	596	241	9b89f45c-6eee-41d7-aa63-f6897439183c
756	2026-04-10 23:18:37.554911	/api/orders	GET	201	497	183	76bb8097-dec6-4cee-8312-e1f8f1018693
765	2026-04-12 09:10:00.554966	/api/customers	GET	200	1465	682	727d2ded-f421-4c1f-9420-82a66fcd9c28
777	2026-04-09 22:31:20.555044	/api/products	POST	201	1961	1440	20623101-d4aa-4a7e-ac9e-ba9434d99146
778	2026-04-10 10:52:00.555052	/api/payments	POST	201	1156	1039	23bc3a2e-16a9-4b26-94e7-739388ccd59f
783	2026-04-12 19:43:42.555084	/api/products	GET	200	1843	1633	8c36a469-22f7-444a-8d98-3f5541efbbf0
801	2026-04-11 08:15:47.555192	/api/payments	POST	201	1797	1792	7058a67b-158d-4f39-a051-2bd7719ae6be
811	2026-04-13 02:25:49.555309	/api/payments	GET	200	763	457	c780eaf5-1f67-4d81-bf86-9ebb15735b22
817	2026-04-11 22:16:23.555346	/api/payments	GET	404	55	52	0f94bf15-8a00-4445-9901-fe3c24338245
828	2026-04-11 06:31:54.555414	/api/customers	GET	200	1750	1451	f6594e7e-c58c-49b2-91b1-fa9b565eb26c
838	2026-04-09 07:46:22.555477	/api/orders	POST	200	1063	297	acb7cc24-28d1-4ade-91e1-510303438194
852	2026-04-09 04:05:30.555574	/api/customers	POST	500	665	26	69c21d5f-ae27-456e-92fd-6e3b69746f29
855	2026-04-09 16:47:25.555595	/api/customers	POST	200	1877	1262	d79880cc-1d44-4eef-afe0-18d9606835f0
865	2026-04-09 20:20:44.555657	/api/products	POST	200	1760	1236	98f0cff7-76ab-4c1d-b9a7-71d5d2e169f2
869	2026-04-11 16:26:35.555681	/api/customers	POST	200	399	131	59860d62-9a69-45b6-9f32-905d5e50f308
881	2026-04-12 06:54:38.555757	/api/products	POST	404	1373	386	571d34e5-7e18-47e0-824d-2366ce742c5d
887	2026-04-11 04:48:52.555793	/api/products	GET	500	1298	539	ad61b13c-e41d-413d-97ea-7d908d8251df
895	2026-04-13 06:07:19.555841	/api/customers	GET	201	1883	1793	f61e5622-6915-4850-b469-8eb28964e320
909	2026-04-10 09:21:33.555932	/api/orders	POST	400	1486	1409	717c4444-c436-4745-b47b-f7cdcabb928c
911	2026-04-11 09:44:50.555945	/api/orders	POST	200	360	49	e8387b43-f62b-42ac-be06-181770af1218
913	2026-04-09 14:41:38.555957	/api/customers	GET	404	1567	851	6fc35a48-cdba-4336-af5d-7f3dca651a7f
920	2026-04-12 18:04:46.556001	/api/payments	POST	200	1991	254	c1c45a95-7e16-4c63-a6f9-b077060548a0
925	2026-04-13 07:12:28.556042	/api/products	GET	404	1834	948	745544f4-91dd-4392-b00b-832479907038
933	2026-04-12 03:09:34.556094	/api/payments	POST	500	866	528	e5cd4331-91b0-4c77-9b9f-e72e993898b1
934	2026-04-11 20:53:36.5561	/api/payments	POST	404	1761	969	1f6d82e2-0502-4667-be61-4d10db98acf5
935	2026-04-12 10:02:08.556106	/api/products	POST	201	1861	763	6580abee-cd8d-4f20-9b1e-1d92d2e49eab
944	2026-04-11 06:17:28.556163	/api/orders	POST	201	1016	61	1d3e153d-1b9c-497a-9611-08c5c20f5ecb
947	2026-04-10 01:25:35.556182	/api/products	POST	404	230	177	6929bde5-be66-4380-9819-222923d881c2
953	2026-04-12 18:26:46.556219	/api/products	POST	400	1285	822	c8ade0ab-e9ad-4780-aea5-0d206327f911
956	2026-04-09 07:14:23.556237	/api/payments	GET	200	713	488	f6611780-d4ae-4ef6-9596-e2b1261984e6
959	2026-04-11 20:00:29.556258	/api/customers	GET	200	1352	924	64c2d42d-6e86-4872-84b9-f9ab8fc43bcc
968	2026-04-10 23:47:01.556315	/api/payments	GET	404	1445	747	c69421cc-f7d8-46ac-9d69-7c603b064c39
996	2026-04-13 04:02:44.556494	/api/payments	GET	200	100	27	5696214d-1973-4756-ab2c-6934a9680f1a
\.


--
-- TOC entry 5847 (class 0 OID 43134)
-- Dependencies: 335
-- Data for Name: _hyper_4_5_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_4_5_chunk (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
4	2026-03-13 18:31:31.54887	/api/products	GET	200	763	435	170bb6c0-8c01-4a00-83fa-53621dcf15d8
5	2026-03-17 05:23:24.548878	/api/products	GET	200	1532	883	0de7b748-06bd-46a1-927b-892929a1d71a
12	2026-03-15 10:43:39.548931	/api/customers	POST	200	1224	977	73b77795-4052-4a9b-88f0-d0098fe8a615
22	2026-03-18 15:10:42.548997	/api/orders	POST	404	544	141	208423dc-44a4-4d34-94ee-5173e974c804
27	2026-03-16 10:36:22.549035	/api/payments	GET	200	1253	831	8f0c07bf-1cb2-4264-afe5-a1c77ad20f99
29	2026-03-16 11:37:22.549048	/api/orders	POST	400	1985	80	fed08cfb-1453-40ec-ac81-e6097c94b8ca
35	2026-03-18 17:31:19.549086	/api/products	GET	200	1279	250	f6e70efb-a5a4-4598-a6bd-9f156f4634bb
47	2026-03-13 16:55:15.549163	/api/orders	GET	200	1832	1103	cf6efff0-b280-4dfc-b343-c8f50d03d761
53	2026-03-17 06:10:10.5492	/api/products	POST	200	1020	435	7291dd70-d293-4ab9-9c0d-bffafb02c197
56	2026-03-18 17:25:49.549221	/api/payments	POST	400	841	350	c061a717-8135-4fb5-8b95-21a9550fbd4c
60	2026-03-14 10:51:02.549245	/api/products	POST	500	402	282	f78f3c69-618d-408b-a923-d6a3c3e3d66f
61	2026-03-16 17:01:49.549252	/api/customers	GET	201	429	19	2cf3e223-7410-42d9-a504-d77ddb018f36
66	2026-03-18 18:55:20.549287	/api/products	GET	200	1355	1112	3d90950d-e6d2-4115-9eba-355036c8b3c7
78	2026-03-13 12:01:37.54938	/api/products	GET	200	543	120	07e57a9a-d890-4687-92b6-37db926bcafa
85	2026-03-14 07:08:02.549424	/api/customers	GET	201	986	862	d311c2b6-36fc-4abf-9bb8-a30c4a192957
88	2026-03-15 18:34:56.549443	/api/payments	GET	400	448	68	a2562974-2fb1-4228-b67e-93f13c44e654
89	2026-03-15 08:24:57.54945	/api/products	GET	500	86	40	a0f0421f-7d40-467a-ade3-1d82c24df473
93	2026-03-17 23:18:19.549474	/api/products	GET	201	1979	896	88c96d41-38d1-4c66-8cec-cacfe02c05e0
106	2026-03-14 18:20:46.549557	/api/products	GET	200	1320	100	3282a36c-beeb-4cc1-8b68-37df98a2e46a
113	2026-03-17 21:40:59.549601	/api/payments	GET	400	260	125	0bf8ce84-e73e-4fb5-af8c-65f669f221cb
126	2026-03-18 03:43:26.549684	/api/orders	GET	200	1091	475	07af45a9-5ec7-4833-a01a-aa0192cbec12
138	2026-03-17 08:15:07.549759	/api/customers	POST	200	1737	1695	a03f39a1-1d12-44fe-b9d9-3a6f898ff392
146	2026-03-18 00:30:07.54981	/api/orders	POST	200	960	694	7e126bdf-7734-49f0-92ca-b2b5f01dd608
153	2026-03-17 11:38:59.549853	/api/orders	GET	200	1425	508	fe46834c-5ff7-49f2-b44e-2172726d336e
164	2026-03-17 22:35:34.549921	/api/products	GET	200	716	382	7ce7e7d4-83fc-438e-8d11-152f0bdcfcfd
177	2026-03-14 16:21:02.550005	/api/payments	POST	400	1612	1392	ad50e0bb-e224-4ed8-9798-96f0526dda4d
182	2026-03-18 22:25:06.550057	/api/orders	POST	200	856	144	d0dbd7ca-d37b-48ad-8e0c-dcf5f5742a44
194	2026-03-18 04:42:52.550133	/api/orders	POST	200	502	129	06fad73c-f101-4e82-8669-338e474e09ff
198	2026-03-17 11:20:14.550162	/api/payments	POST	404	381	343	f8948eec-496d-4c06-8a8a-682e58b36bf2
218	2026-03-15 15:24:48.550287	/api/payments	POST	400	1436	833	e073a5a9-aefa-4b02-b3fb-5666e2160b3f
221	2026-03-17 09:42:02.550306	/api/customers	GET	200	372	359	b2703358-069e-4aa4-b600-6988b18a19a1
224	2026-03-18 17:18:45.550325	/api/orders	POST	200	314	94	62dded41-1f09-49ed-8559-e8705ef748fa
241	2026-03-18 18:59:43.550431	/api/payments	GET	200	890	338	9e7ef52e-312a-447f-8d77-f2e2130ab008
256	2026-03-18 11:13:03.550527	/api/payments	POST	400	453	84	8e6b6397-bb2a-47fc-b216-141e9f9e5cdc
259	2026-03-14 11:43:03.550547	/api/customers	GET	400	1082	817	303db19a-51c5-4978-94e9-8974499bc39d
262	2026-03-18 23:35:51.550566	/api/orders	POST	200	700	192	d99727bf-f42c-40c6-b245-46dd0161df63
275	2026-03-14 09:10:11.55066	/api/products	POST	500	1849	1842	7746e07d-42b2-4da0-9228-431323190f8a
277	2026-03-16 08:49:24.550674	/api/products	GET	201	1225	471	59570362-d44c-4069-889b-577f456a7156
279	2026-03-18 09:46:27.550686	/api/payments	POST	500	507	240	5cf53866-66b7-4296-bb68-a86cd91038a9
281	2026-03-16 12:36:10.550699	/api/payments	POST	400	1139	821	b7dffb3e-bd5c-47be-9916-d2d68b681bbc
298	2026-03-16 17:36:52.550806	/api/products	POST	404	1509	1055	c696a5bd-9b2c-4c6a-8feb-9dd5ade1ef56
302	2026-03-14 15:04:22.55083	/api/orders	GET	201	331	69	507006be-c0b4-435a-ba2a-6c342f6e94fb
306	2026-03-18 12:11:24.550854	/api/products	GET	200	1059	971	4b34e51d-7971-4fd0-aa3f-34367f85a037
311	2026-03-17 15:47:48.550962	/api/customers	GET	200	559	409	960effa5-db10-434b-8929-4b8c6c2b678d
318	2026-03-14 23:37:05.551011	/api/products	GET	200	952	641	3f45ffd8-c065-4c2f-b4ea-47a33d9dbcd1
323	2026-03-16 07:50:33.551065	/api/products	POST	201	912	674	191812b8-1b02-4571-83b1-571e67a46d08
336	2026-03-14 10:23:57.551151	/api/products	GET	400	1351	723	8b7f43bc-75f9-4a86-8d5a-85b6cf80dc9e
341	2026-03-17 07:26:38.551182	/api/customers	GET	200	1897	1119	b7c17f21-6c48-4efe-99ac-f9a9478ae591
351	2026-03-17 16:57:36.551247	/api/products	GET	400	430	349	45cb58c8-3923-4aa7-8b49-72cf567c0fec
354	2026-03-14 23:40:59.551267	/api/orders	POST	400	501	345	861899fd-6b07-4ce8-bbc9-9ee747fdbd5b
355	2026-03-18 03:53:18.551273	/api/customers	GET	200	1932	1022	ec11316f-2e7e-41c9-a334-f422ff907921
357	2026-03-17 18:20:35.551286	/api/orders	GET	500	913	417	aedca4e1-c0d7-47e2-8533-f4ff69100541
361	2026-03-13 23:57:31.551311	/api/orders	GET	400	1989	484	eaf3cf1a-a8ec-49a1-98b1-b1eda9bf78ef
363	2026-03-18 20:34:42.551323	/api/payments	POST	400	71	20	03b9761f-22cc-4c2d-aef9-4c29927bc6e0
377	2026-03-15 13:56:01.551415	/api/payments	GET	400	844	105	5e32f412-c760-49f2-9fc1-bd06f1668c3b
380	2026-03-18 02:21:13.551435	/api/payments	GET	200	1496	260	fe52d6f4-9ce5-4f5a-8e5b-c263c1d9d5b3
381	2026-03-13 17:11:17.551441	/api/payments	GET	404	1381	105	2880faf7-e62c-42eb-b378-47b5e2f79518
401	2026-03-17 19:49:08.551584	/api/products	POST	200	1041	324	f7becc41-2b69-4d8a-9346-0de398ac8edc
408	2026-03-17 05:52:39.55163	/api/payments	GET	404	1866	535	f8f342d9-cafd-4141-bc3a-19f37827d7a5
426	2026-03-14 04:30:41.552404	/api/payments	POST	200	870	750	bec10510-a85d-4d1f-858e-ed87fdb8ac4f
431	2026-03-16 04:07:55.552435	/api/orders	GET	500	1116	144	e39d92f1-dbe0-4c50-b8af-0526f8a1389c
436	2026-03-15 10:30:01.552468	/api/products	POST	200	1288	1088	93f658ba-130f-4166-b3d4-f72561b6fb7e
448	2026-03-17 16:10:51.552931	/api/products	GET	200	1296	1225	e55721e4-06d9-4185-bcfe-fc6a36dc86f8
450	2026-03-13 13:29:06.552944	/api/payments	GET	400	1502	264	1c246c75-db88-4fc5-8e31-093c5c53c42b
468	2026-03-15 18:55:06.553068	/api/customers	GET	201	513	253	b2da9a32-86b6-4b2e-8aaf-3ded4520a7d7
479	2026-03-18 16:50:56.553139	/api/orders	POST	200	1246	804	0c144503-09df-4a85-8768-3da6ae1ca016
483	2026-03-14 23:51:03.553163	/api/orders	GET	200	1586	429	be827966-a510-421d-be37-d900678cba9c
486	2026-03-18 02:54:55.553181	/api/customers	GET	400	1041	1034	94b852d2-f30b-402b-bdc6-c05b51ff8b44
489	2026-03-15 09:06:47.553199	/api/orders	POST	200	829	543	a6e837b3-4e1c-43b4-97cf-b0c1185ec2b1
492	2026-03-18 05:40:59.553218	/api/products	POST	500	948	35	cdaef4b3-dc47-46c1-870e-7b06726c0fe6
495	2026-03-17 13:26:07.553237	/api/orders	GET	201	1576	719	5da6ca48-c319-4469-9b89-de91ae17c2c0
497	2026-03-14 18:21:22.55325	/api/products	POST	400	1068	862	515c9ba6-525d-43c4-85cd-29aa3ef2df30
512	2026-03-17 16:17:59.553346	/api/products	POST	200	1898	335	a489e80d-232d-4df8-8809-574ed756c911
522	2026-03-16 16:16:00.55341	/api/products	GET	500	1058	484	0d508dba-2a6f-468f-bcdf-db77c9b76641
524	2026-03-13 13:53:06.553422	/api/products	GET	200	134	27	ecc05115-192b-418a-8086-92fb475e4abf
525	2026-03-14 17:16:13.553428	/api/customers	POST	400	285	277	3370c615-4855-4404-98a3-683c4650997f
527	2026-03-16 02:44:35.553441	/api/products	POST	500	2000	1848	11ed2d1c-94c0-48b6-b532-56c1389a1198
531	2026-03-13 21:11:50.553467	/api/customers	GET	400	1800	21	f499b84a-c3db-4ba0-a17e-3231918a4b2f
545	2026-03-14 23:37:06.553551	/api/payments	POST	201	1223	1020	364cb788-8337-4f15-89b7-48fd304823de
560	2026-03-14 04:07:13.553664	/api/products	POST	201	365	218	80d3ebc0-e454-4ff7-a236-edcedafa22ee
561	2026-03-15 11:33:56.55367	/api/payments	POST	500	944	92	515f5444-f602-4502-b6a1-17d280eb8383
568	2026-03-16 21:04:35.553714	/api/customers	POST	400	1811	971	a444ad95-9d71-4aa8-ae6e-30db47f332a7
572	2026-03-14 18:55:13.553738	/api/customers	POST	400	697	140	c11b3f66-37fa-4793-8252-fbf310c52c45
576	2026-03-17 14:20:33.553765	/api/orders	GET	200	749	518	d5aaa520-da05-4817-bc82-434a4e2771ee
578	2026-03-13 21:34:54.553778	/api/payments	GET	404	1552	923	d5e6cb38-5da6-4a59-924e-190f5d43c13f
594	2026-03-16 20:18:52.553878	/api/products	GET	200	1732	1506	f8099607-70bb-43aa-a03b-b98b584bcf08
595	2026-03-17 08:18:43.553884	/api/customers	POST	200	1079	822	24f9605b-3afe-48cd-a18b-a42bb6c74b32
598	2026-03-14 09:20:40.553902	/api/orders	GET	200	1107	183	6907a5ff-1430-4ff3-a17b-20f5523df6f0
599	2026-03-14 17:00:12.553909	/api/payments	POST	500	391	304	7da07466-acc4-4eec-b9e2-df656d094d7c
600	2026-03-18 08:21:00.553915	/api/orders	POST	400	1055	853	5b3db610-11f8-4ea2-b7e8-780a79dad9ac
604	2026-03-16 17:40:57.55394	/api/orders	GET	200	1879	1744	62f4d154-f99d-4dad-b56e-457021a328bd
607	2026-03-18 20:02:07.553959	/api/products	GET	201	1148	164	cb79eeaa-5547-40cb-ab48-78a1b1a5a987
608	2026-03-16 08:52:13.553965	/api/payments	POST	200	87	62	0f5dc02b-1a97-47dc-98dd-0e616a5fd6aa
609	2026-03-14 12:35:39.553972	/api/customers	GET	400	152	82	536fcc1a-fd9f-400f-8714-edd39b233169
618	2026-03-16 06:14:05.55403	/api/payments	GET	200	886	365	cd82535f-8fff-41d7-b29b-2f15d48411e5
619	2026-03-13 16:20:24.554037	/api/orders	POST	200	1641	1377	7dc55d42-07e5-4752-9a38-0eaa2380d804
629	2026-03-17 09:44:52.5541	/api/customers	GET	500	1695	293	7b10f21a-ffe5-47a1-b3dc-327e829543b3
645	2026-03-16 15:03:58.554197	/api/customers	POST	200	810	407	4d12868c-7e1d-4e52-833e-aa8616435c3e
649	2026-03-15 12:50:43.554223	/api/customers	GET	500	1333	1097	aa82fcf1-4735-40d2-8fe4-5b8273f75916
651	2026-03-18 05:57:40.554236	/api/products	POST	200	1484	276	470bf10c-1842-4f49-abc9-69b6c096ace3
662	2026-03-17 22:46:53.554302	/api/products	POST	200	701	434	b150d014-cf2a-42b0-975f-73a42aa7910f
663	2026-03-16 06:32:49.554308	/api/customers	POST	201	894	162	9d36ffd3-ad6f-4bb6-aa1d-768e94da5c7e
665	2026-03-16 10:56:17.55432	/api/products	POST	500	1650	170	e76af17b-f8ea-442b-bdce-81443fe10dae
672	2026-03-17 03:29:14.554366	/api/customers	GET	500	1012	184	2b379356-4517-4fc9-9e5a-e97aa019a8e8
676	2026-03-13 15:49:21.554392	/api/customers	GET	400	163	98	701f13a6-c4b5-48ce-8142-3a1f0f21201a
692	2026-03-17 10:24:39.55449	/api/customers	POST	200	1958	1517	b51f11a3-0f36-4513-93f1-9cc7396bd382
700	2026-03-14 22:01:36.554539	/api/products	POST	200	1689	1392	223f9a62-2bda-485d-9a37-5816ed99f699
701	2026-03-16 06:48:37.554546	/api/customers	GET	200	1310	225	8f921eae-cb4d-45a3-a9c1-f5d0a5cac1dc
712	2026-03-16 20:19:02.554637	/api/orders	GET	400	375	367	fe9d4037-0ee9-4df7-9782-ce0034182593
714	2026-03-15 08:56:58.554649	/api/orders	POST	500	1304	37	0f7edf74-26c5-4eb5-b3b4-33b5915181a9
720	2026-03-14 15:10:10.554686	/api/customers	POST	500	1578	961	b634f9df-7b84-489c-88c6-2bee9fa02523
745	2026-03-17 14:11:26.554842	/api/customers	POST	200	1841	1228	ac036d1c-80d6-4e59-9d37-2b89135eeecf
746	2026-03-17 18:21:39.554848	/api/orders	POST	400	607	254	fd5c6314-876f-420d-b375-f0f3ef67682f
757	2026-03-17 01:52:07.554917	/api/customers	GET	404	1591	1218	36486b81-8b66-4f63-a8ed-e4a300da712e
763	2026-03-17 07:12:00.554954	/api/payments	GET	201	1329	1290	c5613212-2a56-4351-97e2-0269d699b42f
769	2026-03-16 02:48:45.554991	/api/orders	GET	200	549	541	eba48601-53f9-48eb-8dc9-ea3bf09ead67
774	2026-03-17 10:57:26.555022	/api/orders	GET	500	1506	684	5de6cbd1-62c6-4fdd-bff0-9211a30561bf
785	2026-03-15 01:46:20.555096	/api/customers	POST	200	640	42	fe43721e-f0f3-4313-a735-867ace194d46
791	2026-03-15 12:37:14.555132	/api/products	POST	200	1977	1466	b62893c2-aca0-4a32-9b0f-338da936aa6e
792	2026-03-15 23:25:00.555139	/api/customers	POST	200	957	610	5c1d80d0-ab52-4b74-8c5d-673c80ddbe3f
795	2026-03-15 20:59:15.555156	/api/products	POST	200	842	406	b28b83a6-6a68-4b22-93d5-e6bbeb58ea90
797	2026-03-15 22:33:24.555168	/api/orders	GET	404	639	148	4fd8f948-a70e-4096-a45e-64243224711c
799	2026-03-16 08:42:33.55518	/api/products	GET	200	1913	818	7b74b83f-1e38-4ed2-813a-ebac915c4b9e
804	2026-03-18 10:32:47.555266	/api/orders	POST	200	1188	21	68272f72-92ee-4219-890a-dced07a86739
807	2026-03-16 12:39:37.555284	/api/products	GET	201	1075	632	e078410d-f5bd-4102-b1b0-ee04f3b47b3b
809	2026-03-16 13:51:37.555297	/api/customers	GET	400	186	42	2610a527-cde0-4bc8-b78d-efe3ea451f0c
823	2026-03-16 01:57:13.555383	/api/products	GET	200	1638	844	9111e289-a0f7-4092-82dc-bc06dc501b03
825	2026-03-18 23:49:35.555395	/api/customers	GET	200	380	261	a7801cd5-9f3e-48cf-9b54-96c0015899bd
831	2026-03-15 06:46:12.555434	/api/products	GET	404	1006	957	5d53b9ad-7a6c-4781-9b0b-48c9e758aafc
834	2026-03-18 11:59:02.555453	/api/customers	POST	404	1766	1302	e1de47ce-9de4-4f45-8f13-ceeac0c4de65
846	2026-03-15 06:09:16.555528	/api/products	POST	200	1577	426	7ee5ecc9-7199-4170-b865-208c162c8a18
847	2026-03-15 10:58:08.555534	/api/payments	GET	200	1232	881	1eeb22a8-3e57-4f99-aaf8-c233080c5f79
848	2026-03-15 10:33:48.55554	/api/orders	POST	201	1781	410	d87ef899-90d2-4349-baab-a328c3264a1d
853	2026-03-16 00:20:43.555581	/api/customers	POST	400	130	68	eff3024b-7b15-408b-9398-48c5c38b1fba
854	2026-03-17 20:25:58.555589	/api/orders	GET	200	914	129	8d52942e-6472-4e06-ad14-7627674a1485
863	2026-03-18 09:43:00.555645	/api/payments	GET	404	284	192	31ba6ba4-2533-478d-bc90-c0da637aeb8e
867	2026-03-16 07:15:00.555669	/api/orders	POST	400	436	293	d876483d-0133-4556-88cc-d74761ace383
878	2026-03-15 14:26:27.555735	/api/orders	GET	200	568	356	f1bc1c36-a8e6-4b10-b679-482a3646db33
879	2026-03-15 18:37:33.555741	/api/customers	POST	200	718	678	076d9c86-edd1-4151-8efb-3af005d8291b
880	2026-03-18 02:41:28.55575	/api/customers	GET	404	1119	359	e7a7a4ea-543b-4011-b4d1-dcb5fa9f8475
884	2026-03-18 10:00:20.555775	/api/customers	POST	200	1284	917	2f72704f-b9cb-42ff-941b-25cbade9a278
886	2026-03-18 01:31:24.555787	/api/orders	GET	200	733	505	e6e36973-7af9-48b3-95ba-edd565086e8e
889	2026-03-18 02:35:52.555805	/api/payments	POST	500	911	48	f3ffd9ce-88b3-4634-be42-be934bea3f6f
890	2026-03-16 19:08:39.555811	/api/payments	POST	500	318	227	9353d454-0c4e-4ad6-ad36-36cfa0e0ceb6
891	2026-03-18 07:45:02.555817	/api/products	POST	500	691	234	0dcc068a-d3fd-4d1c-81ac-88e29b900c98
892	2026-03-13 16:16:54.555823	/api/customers	GET	201	396	217	57a4b3b4-04eb-4e8b-bc05-b3c12f6e255a
893	2026-03-15 06:37:41.555829	/api/payments	GET	200	657	635	46ff5fe2-18b9-4729-bee0-6358aa29b0ab
894	2026-03-13 21:15:43.555835	/api/customers	POST	400	710	203	eedb1c62-f54c-4e90-a85d-028101302b2e
896	2026-03-17 10:23:24.555848	/api/products	POST	500	1085	378	25dea5a4-953d-421e-bbce-8cad2766f06b
897	2026-03-13 19:35:25.555855	/api/orders	POST	201	1990	1588	3c1baa0d-a0ee-4ae4-96ab-28415372078d
906	2026-03-18 16:10:22.555913	/api/products	POST	200	687	213	16f6c46c-e5ed-48de-bdfb-ef53c1789e15
908	2026-03-16 13:37:21.555926	/api/customers	POST	201	316	121	1a0dfef1-ef6a-4021-9503-a4d4fc64b3c5
910	2026-03-16 06:35:39.555938	/api/orders	POST	200	1805	51	0ca23efd-d16f-4c00-9f6f-5f40791e7197
924	2026-03-17 11:21:23.556036	/api/customers	POST	404	952	601	12d1ed05-634e-4a1e-afeb-32253662ca65
928	2026-03-18 02:59:07.556061	/api/orders	GET	404	1703	1291	c8111c33-6bdf-4e4b-a8f4-81bfe656e453
938	2026-03-14 04:20:14.556125	/api/payments	POST	200	383	77	af0a4357-b420-44fe-a858-e2b9ecf25d1b
939	2026-03-18 09:30:51.556132	/api/orders	POST	400	1561	571	88b97468-c546-48e4-8717-31de2761d90e
948	2026-03-15 09:51:23.556188	/api/orders	POST	200	1021	156	b536b966-5158-4423-baf4-65f304760411
964	2026-03-14 09:33:56.556291	/api/products	GET	500	751	519	947bb386-d69a-4fa8-92e8-71c366527c07
965	2026-03-14 21:09:21.556297	/api/customers	POST	500	1857	1294	3c4e87e4-d52e-4da7-850d-f0d1b8804752
967	2026-03-15 16:32:13.556309	/api/orders	GET	200	389	128	d5f1fb35-efc6-4df9-9ec4-20b0e78cf17a
970	2026-03-15 23:10:40.556328	/api/customers	POST	400	190	137	0bc97e86-0dea-4fe3-8d73-45e15c1b81a6
972	2026-03-14 19:49:41.55634	/api/payments	GET	400	1384	115	03d13698-a67b-4651-9214-91454ea9805c
973	2026-03-17 16:28:41.556347	/api/payments	POST	200	1211	275	632d669a-adff-41db-b736-2e1e97f8431d
976	2026-03-14 10:20:34.556366	/api/customers	GET	200	73	17	fde70dae-8266-4b15-ad8c-3d033967330d
977	2026-03-17 02:30:22.556373	/api/orders	GET	200	1448	812	4efe8905-a90d-4f9d-82d8-8c288fce9b3b
984	2026-03-14 06:25:24.55642	/api/payments	POST	200	120	116	6bfcee5b-5b5d-4856-ab5a-8c412255f27a
986	2026-03-15 00:07:51.556433	/api/products	GET	200	257	18	60cc47a6-cf46-4aa7-a2d1-e8e48d09b7d4
\.


--
-- TOC entry 5848 (class 0 OID 43144)
-- Dependencies: 336
-- Data for Name: _hyper_4_6_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_4_6_chunk (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
6	2026-03-31 16:28:30.548885	/api/customers	POST	400	515	63	509f1c73-3f1a-43d4-b54c-74922348af2c
15	2026-03-28 07:36:40.548951	/api/orders	POST	400	1263	1042	fde6ac8d-78ab-4a1b-98ea-ea93669bd1a6
17	2026-04-01 05:12:58.548963	/api/orders	GET	200	904	707	2d3e16b9-5f15-4750-8194-8a650a7d4f33
25	2026-04-01 02:13:13.549016	/api/products	POST	200	1067	563	87cb3a40-f333-498a-a252-764e2dd10507
26	2026-04-01 01:43:36.549022	/api/products	GET	200	74	36	486fdd7b-5408-449b-8814-82b12057b080
33	2026-04-01 18:24:04.549073	/api/customers	GET	500	1513	877	45829446-a526-4ffa-a840-ef60c71d8f18
40	2026-04-01 20:06:59.549118	/api/products	POST	200	1577	658	d83e90bf-3071-47c2-b0c6-f18b17c61ab8
42	2026-03-27 22:54:24.549132	/api/orders	POST	201	517	237	029a8660-4bad-4f08-84db-dd97cee58880
43	2026-03-29 16:46:55.549139	/api/products	GET	404	1286	1210	f3ffb62a-7838-4d00-9498-d9f9c7428314
44	2026-03-26 02:31:53.549145	/api/orders	POST	200	866	445	fef95d5e-8056-44ee-807f-5b0c55a989a5
48	2026-03-28 20:04:08.549169	/api/products	GET	200	1110	902	5ee4ddc5-d060-4532-94e2-7d294f04f761
49	2026-03-28 18:50:57.549175	/api/payments	GET	200	414	234	8b9279d6-5183-44d3-b149-9c46be0d21ec
62	2026-03-31 15:14:55.549259	/api/products	GET	404	1189	298	50220191-b6a0-44de-bb77-686ecf0a6ae6
64	2026-03-28 21:10:14.549273	/api/products	POST	500	1301	26	0bc4ec7e-cfc6-4663-9d24-f050a75b4bd3
67	2026-03-31 09:39:55.549293	/api/payments	GET	200	1791	1579	c9081ec5-5d93-4eed-abfa-5f98fc761b84
69	2026-03-27 21:23:12.549307	/api/orders	POST	201	598	444	00c3d116-5da4-4fbc-a82a-4ff7cd9650e7
82	2026-03-31 02:52:03.549406	/api/customers	GET	200	1440	976	bc229526-e08e-4127-95ad-cc3e04922ae4
83	2026-03-28 23:21:36.549412	/api/customers	GET	201	729	621	207c1150-8c99-42f4-b574-5b7402a26a92
91	2026-04-01 20:10:23.549462	/api/products	POST	200	1386	142	aacaa05c-90b1-4109-9969-6767cd855c28
94	2026-03-31 00:12:36.549481	/api/products	POST	200	1739	875	3b5cf6e1-06c6-45e4-8707-c53be7da9339
98	2026-03-26 15:18:58.549504	/api/customers	GET	500	800	788	be453fd9-7070-4207-968b-aec1182d1d1e
103	2026-03-27 08:45:25.549538	/api/orders	POST	201	1422	35	07f07ad1-7357-4fd2-8e25-f34866f3d4cf
108	2026-03-28 22:08:40.549569	/api/orders	GET	200	1148	80	f3026ee2-3c7d-43e2-b83c-e83249eaa7c3
109	2026-03-27 08:21:05.549575	/api/products	GET	200	1611	88	0a80b4dd-2732-42ec-bf21-a9b8a4c4009a
111	2026-03-30 23:00:42.549589	/api/orders	POST	201	302	217	a2f12590-7bd3-42f8-b1a0-67f68972f5d3
117	2026-03-26 00:25:39.549627	/api/products	POST	500	1509	1297	21c35b0d-97e1-452a-9b6a-3871d1e38016
123	2026-03-30 07:36:30.549665	/api/products	GET	500	625	330	4e0b2446-b47b-4842-912a-e38f2606822e
131	2026-03-27 16:01:26.549715	/api/products	POST	400	1062	34	6f9b8769-3edd-4ac0-81c4-d58ef80a33b9
132	2026-03-27 21:52:19.549723	/api/products	POST	201	1681	1298	d6310e58-9023-4f6b-a4a8-e9406351b2f4
135	2026-03-31 16:57:42.549741	/api/payments	POST	500	1920	1668	7b3c16f7-0406-4388-ac94-25a89d637d15
139	2026-03-27 13:58:18.549767	/api/products	GET	400	1543	1391	d3b1a56a-2c59-4e84-a33c-a79e2d1ce739
140	2026-03-30 07:55:13.549774	/api/products	GET	200	865	227	01ea3013-33ea-452b-b2af-1319ce21d42d
141	2026-03-28 15:40:43.54978	/api/payments	GET	200	261	196	2549ee9d-1ca4-49d4-bb46-5b9be96463b8
145	2026-03-27 08:06:25.549804	/api/products	POST	200	1661	570	cfeb2ccf-49d4-4170-9013-dc58cac7b1ec
147	2026-04-01 16:25:32.549816	/api/orders	POST	200	212	20	1aa9323e-493d-4cff-8e89-d700c64ccd6e
149	2026-03-26 07:15:16.549828	/api/customers	POST	400	679	54	cd4fb408-cf1c-4648-8d7c-028c664e6529
151	2026-04-01 20:55:55.549841	/api/products	GET	201	440	97	1a2f6328-6d78-4eb1-949c-e9b096ebca0f
155	2026-03-27 22:01:20.549865	/api/products	POST	500	407	181	cd22e52f-d103-42d7-b9a3-07837e1565c0
158	2026-03-30 02:45:00.549884	/api/products	POST	200	1344	248	f3d1b1d3-622a-4c5a-8215-842189b4399c
161	2026-03-29 18:54:37.549903	/api/customers	POST	201	663	291	99e578c9-7baf-424b-9bff-4476e613ea7c
167	2026-03-29 05:57:47.549942	/api/payments	GET	404	521	13	ff0d31f8-db90-4c13-bfc7-691127651bf4
169	2026-03-30 04:57:58.549954	/api/payments	POST	200	554	542	d824721a-ffcd-4d9e-8ae0-0fe1c15744ac
170	2026-03-31 23:09:34.549961	/api/orders	GET	200	193	107	79367c38-2944-4acc-a956-46a4fc212ce7
176	2026-03-27 19:55:47.549999	/api/customers	GET	200	1561	1323	32e0c5a3-3acf-4bb4-ac42-4e63adff211f
178	2026-03-27 14:40:06.550012	/api/products	GET	200	1468	641	1dfbe6a7-f851-4e56-9d0e-18fd73729091
181	2026-04-01 19:29:20.550037	/api/payments	GET	201	798	91	7305bd71-0413-4225-b667-2b4d515c3f2c
186	2026-03-27 11:23:08.550083	/api/products	POST	404	716	185	3f66a9aa-03dc-4e29-a709-03cc457e7d71
192	2026-03-30 20:53:29.550121	/api/products	GET	200	213	181	6d4c9c92-6035-45ff-bf0e-2e3f1298d132
197	2026-03-30 03:18:40.550154	/api/orders	GET	200	406	111	9eeecbe1-a7e4-4434-b423-c8e6ee7ae6dd
200	2026-03-27 04:13:39.550175	/api/orders	GET	201	1686	1220	a1c11b0b-afc3-4e33-8882-d9d5e31915d4
209	2026-03-31 08:07:13.550231	/api/products	POST	400	62	47	19a97675-08ac-4b9e-8708-411c3181912b
210	2026-03-26 00:16:55.550237	/api/payments	GET	500	1072	99	a07996eb-b47a-49b3-b9dc-bdf616ebe9fc
211	2026-03-30 04:51:55.550243	/api/products	GET	200	1303	520	1d96d5fe-af93-4e7c-8c31-26cc926193ee
212	2026-03-30 07:58:02.550249	/api/customers	POST	201	1159	659	6c50db01-7be0-420f-935e-9de5354f519f
214	2026-04-01 08:00:17.550261	/api/customers	GET	201	1771	200	83666f74-1fc3-4bfb-a3cb-cac019c89745
217	2026-03-31 02:59:26.550281	/api/orders	GET	200	1904	169	b91e8738-79e1-4bf7-8605-dbae97416cc5
219	2026-03-30 15:52:39.550293	/api/products	POST	200	816	527	887ed32d-ec66-4f33-b56a-ab007edffbd6
229	2026-03-27 09:29:21.550356	/api/products	GET	500	891	635	d011e837-923a-42ea-9a0b-654ff5c12732
232	2026-03-31 19:52:50.550374	/api/products	POST	200	988	844	6b6b3534-7fef-4548-8458-c81c63405f72
243	2026-03-26 17:32:04.550445	/api/products	GET	200	1115	555	5e7e3d72-467d-4aaa-9529-e4eaba99565a
245	2026-03-29 08:25:26.550457	/api/products	GET	400	178	98	f6ca9b62-7700-4c96-9750-0e22e25fdf0b
250	2026-03-30 11:15:05.550488	/api/orders	GET	200	437	45	cc0b241b-21d2-4823-bea4-6d1e9feec384
255	2026-03-31 06:27:16.55052	/api/payments	POST	200	1257	1253	bba3c81c-938f-41d0-b2e1-e558935acd90
258	2026-03-26 20:09:21.55054	/api/customers	POST	200	1763	139	f5a2d44a-84ea-4755-9bd6-460c2f7f2ef1
263	2026-04-01 17:22:42.550573	/api/customers	GET	201	100	50	31d52255-e6fa-43ca-926a-62358a1cd3a1
266	2026-04-01 04:53:55.550591	/api/products	POST	404	253	136	5ce8ed10-1555-4fde-9fd2-8966af82d2d2
271	2026-03-31 21:41:16.550633	/api/payments	GET	200	1726	643	30f5bb8b-48dc-42ab-af51-e7f56d2bee72
272	2026-03-27 04:08:12.550641	/api/customers	POST	404	1016	651	3a28de35-8563-486b-9123-5501d7a17337
274	2026-04-01 02:36:49.550654	/api/customers	POST	404	1711	1163	38a69969-5c3f-48c4-8b20-20535c7712a6
278	2026-03-28 18:09:53.55068	/api/orders	GET	200	338	11	1c6d7dd1-a712-4fca-87b0-512dabc208d1
284	2026-04-01 01:14:31.550717	/api/products	POST	200	1267	1097	6c5060f7-5368-42bc-ab28-83e95d50df81
287	2026-03-30 10:23:48.550736	/api/products	POST	201	1890	708	98212357-1168-4997-9c37-4b85a0b11ae5
290	2026-03-27 22:24:15.550754	/api/payments	GET	200	1624	489	33a52120-1fa8-4252-91a6-a289b38fc745
291	2026-03-29 12:06:24.55076	/api/products	GET	500	1439	776	d3c6f825-e41f-434b-b731-5d86893ab16b
296	2026-03-28 17:58:20.550794	/api/payments	GET	404	1916	1571	2e448bd4-e270-4e67-a346-4e7f84e8230b
299	2026-04-01 12:01:37.550812	/api/customers	GET	400	1041	412	04a5ae9c-8a59-4e37-a78f-35df182998ea
300	2026-03-29 16:16:05.550818	/api/payments	POST	404	1338	606	cbd95d05-326b-4c29-b6db-0c9998d932a6
303	2026-03-30 12:06:27.550836	/api/products	POST	500	1271	757	a7e71215-cf61-4ae6-b093-6ba99f4d268f
305	2026-03-29 02:47:48.550848	/api/products	GET	404	1195	443	cf842490-cc93-411f-9b84-7e5cf06b2977
308	2026-03-26 17:48:54.550867	/api/orders	GET	500	1773	1385	b334e9c0-45c7-4fd7-9616-07227720f811
310	2026-03-28 03:48:58.550956	/api/customers	POST	200	210	207	6a0665b9-97bd-447b-9cfd-7421ea82b15e
317	2026-03-30 05:53:46.551003	/api/payments	GET	200	195	125	0ff0fa51-d77c-492d-81fc-04b622671651
333	2026-03-31 14:14:41.551131	/api/payments	POST	201	1804	1712	86542de9-e03d-405e-b923-8a17415f5ba6
343	2026-04-01 09:57:05.551194	/api/products	POST	201	552	41	4b2083f2-ff33-4eb2-b3bf-d2491f33308e
352	2026-03-27 17:22:50.551254	/api/orders	POST	200	1313	1304	7136f439-c236-49c5-a476-85e38c205b48
360	2026-03-27 15:05:28.551305	/api/products	POST	200	338	174	4dc96b01-f8f1-4646-877c-e773986d0f2c
362	2026-03-27 15:24:59.551317	/api/orders	GET	201	1738	703	2ddfaa5d-447c-4c99-87db-90681adad836
368	2026-03-29 13:28:54.551353	/api/products	GET	200	1345	248	bd78fa06-71fa-4d4e-a467-a4f66724415f
370	2026-04-01 17:21:37.551369	/api/payments	POST	201	303	288	4be31d3d-233e-41b0-af52-47e2e21c577d
375	2026-03-27 10:02:18.551401	/api/payments	GET	404	989	378	138fb43c-d584-4ca8-95a2-238609ebed95
376	2026-04-01 13:56:55.551408	/api/orders	POST	500	1220	383	d11fe0f2-07cc-44aa-94c8-6e1fc526f413
387	2026-03-26 15:41:53.55148	/api/products	POST	200	1989	1030	f81553e3-f59d-4afa-866b-3489e7e2f5cb
392	2026-03-28 21:41:52.551512	/api/orders	GET	400	1280	761	dd2dcb2c-5577-4825-bf49-7c1f803ae5dc
402	2026-03-29 11:57:46.551591	/api/orders	POST	200	1287	499	d5aef43a-4fad-4d24-bd94-234f3d3b431e
404	2026-04-01 07:43:58.551603	/api/payments	POST	200	1893	839	172f69d0-22c8-4d57-b414-e886e03128b3
407	2026-03-30 22:22:20.551621	/api/payments	GET	500	1956	1727	c9690865-3861-4f90-9ef9-31135551c52d
412	2026-03-27 03:03:41.552278	/api/orders	GET	201	528	240	50575d51-66fe-49df-b0a0-529f6c5deac2
414	2026-03-26 09:39:16.552305	/api/customers	GET	404	655	41	aa9afc3f-9f27-4179-8389-16899310b4e1
418	2026-03-30 10:03:16.552353	/api/payments	GET	200	226	89	51e2ac88-c84b-4b66-bf83-fa6b7f32e118
419	2026-03-31 10:24:06.552359	/api/orders	GET	200	1013	712	63df39fe-f225-415e-9b74-deb3882a37c6
423	2026-03-29 07:01:06.552385	/api/products	POST	400	195	33	f268e1ba-9c8c-4fe9-8f7d-949cea412e39
424	2026-03-31 11:10:43.552391	/api/orders	GET	201	1346	1043	aa324e0f-cd60-4fb3-88f3-679e48871d20
425	2026-04-01 08:20:59.552398	/api/payments	POST	400	804	314	e00330d3-7a3e-4a8f-b6d8-4d987ddd9cf8
428	2026-03-26 13:54:21.552417	/api/orders	GET	400	1558	458	686d1718-75cc-4c01-97f2-81196af2fcd6
429	2026-03-30 20:15:52.552423	/api/orders	POST	200	1174	603	02703384-45a1-4532-8ca5-18b349f2b372
433	2026-03-30 18:51:21.552449	/api/orders	POST	200	83	45	e299a6f2-1cd3-4142-8e21-384919627d8c
435	2026-04-01 16:37:20.552462	/api/products	POST	404	849	300	d27dec97-a1fe-4134-bd24-6707ab52cb60
443	2026-03-26 06:09:24.552896	/api/customers	GET	200	1071	232	4a8a679f-37d2-43e8-9493-99f4c374b4de
452	2026-03-27 12:55:57.55296	/api/payments	POST	200	1406	1342	1c17ad29-40e4-4001-8036-fd435ac96b31
454	2026-04-01 12:39:17.552973	/api/products	GET	404	1300	362	5f255b49-20af-4c1d-96eb-b8de586e80dc
460	2026-03-27 03:11:13.553012	/api/orders	POST	200	1832	226	aa76dae9-2218-4788-8b7d-69aed9468a93
465	2026-03-30 03:48:45.55305	/api/payments	POST	404	1517	314	604fa793-1655-4092-a7a8-10e518ebc10f
466	2026-04-01 07:39:32.553056	/api/customers	GET	200	958	425	429cbb6a-b9c3-4d75-ad81-2c43788f4f40
467	2026-03-28 10:32:22.553062	/api/orders	POST	201	1575	1235	770db29f-d62b-4067-95be-35115cbbd979
469	2026-03-27 17:16:05.553074	/api/customers	POST	200	728	614	9ac5ec87-cc95-4a49-ab3d-bd59e8a4f50c
475	2026-04-01 08:38:02.553115	/api/orders	POST	200	820	686	d6fce877-5e99-4046-bafa-318adf4de2ef
477	2026-03-31 23:01:51.553127	/api/orders	GET	201	1746	201	b5946641-676c-4eab-8a1a-d6ec68ca23a6
484	2026-04-01 11:22:34.553169	/api/payments	GET	200	97	62	48a2e907-3d84-4cd4-a044-6cf55656dc45
488	2026-03-31 02:19:30.553193	/api/products	GET	404	1582	480	732904f4-f858-4bee-88a8-270d837e43c3
494	2026-03-28 07:15:54.553231	/api/payments	POST	400	861	565	26e4e630-6892-4fd6-b842-e76fb1dfc40b
499	2026-03-30 04:41:25.553263	/api/orders	GET	500	1799	273	8f7cac4e-7aa8-44b1-b06b-702770141e34
501	2026-03-29 06:12:23.553276	/api/products	POST	500	1792	159	8ce78f57-c619-4ce0-8d34-1fef0ba0638e
502	2026-03-31 05:00:41.553282	/api/payments	POST	400	1345	601	4cffc2c4-2d8a-4d2c-8c67-dee47a852c67
505	2026-03-30 20:30:49.553301	/api/customers	GET	400	610	502	4a6bf1a5-6ce0-4cec-8ad8-66922b381e2a
510	2026-03-30 18:48:10.553334	/api/customers	POST	200	1559	1474	5669a6fe-e57e-4be4-b4ba-2673b352cb84
511	2026-03-27 15:15:51.55334	/api/products	POST	200	821	202	9cc7a018-2035-47e4-8697-860c3e90bb3c
521	2026-03-27 04:16:51.553403	/api/orders	GET	200	1891	168	a0ccc0fc-1636-4d3a-b3c9-411c245a5a7d
529	2026-03-28 04:12:27.553454	/api/payments	GET	200	93	46	4a262682-a632-4719-b24c-d5e62e185452
536	2026-03-27 11:24:19.553497	/api/customers	POST	400	1780	574	7662a4a9-4778-4d47-acb2-e3248dd6e374
537	2026-03-31 22:25:25.553503	/api/customers	POST	200	923	229	43c68c61-dd59-43b0-9587-5fcd21fc4434
541	2026-03-30 06:29:54.553526	/api/payments	POST	500	427	337	146d6da4-0d4a-4ea2-925b-f0c139e74312
544	2026-04-01 15:09:18.553545	/api/products	POST	200	467	294	10a5abff-2b01-4fe8-9879-b11ede4f4c52
547	2026-03-28 16:05:09.55358	/api/products	POST	200	909	135	ef2c0a51-4b0b-4f80-802a-cbffefb3046b
548	2026-04-01 04:16:23.553589	/api/orders	GET	400	1459	530	35961857-8dc8-4b6a-9aef-fdebbb50c2db
552	2026-04-01 20:05:08.553615	/api/payments	GET	201	576	258	09ac5a55-6c66-44ed-929e-b4d7c68a4e47
559	2026-03-26 04:48:21.553658	/api/orders	POST	404	79	72	54ec45cd-648a-4e94-941e-02efa0824362
564	2026-03-28 08:15:58.553688	/api/orders	POST	200	1487	748	24b8ee8f-71e2-4b0b-8564-15d82d96f686
566	2026-03-31 15:12:12.553701	/api/products	POST	200	1932	1408	d6c6255d-7bd0-4019-8882-f1b423977096
567	2026-03-31 17:44:16.553707	/api/customers	GET	201	247	158	59b45dae-3785-4519-8034-3fbb59f7e88a
569	2026-04-01 02:21:19.55372	/api/customers	POST	404	1421	569	e99571c8-df94-407e-b0f8-8e14fd3ad7d6
570	2026-03-29 06:48:28.553726	/api/products	POST	200	1838	23	4d78b143-d703-43b6-b77f-b6013f2f2bb4
573	2026-03-31 03:57:12.553744	/api/orders	POST	200	1127	910	1081d8b6-9493-4ebb-8e75-8de59846b4d1
575	2026-03-28 13:29:45.553758	/api/customers	POST	500	1268	167	05230ba0-3d2d-493a-9819-00d76f620af0
577	2026-03-29 20:12:40.55377	/api/orders	GET	200	1919	1353	1defda27-6682-4bd9-990d-b9f028501dc6
579	2026-03-28 15:23:22.553784	/api/orders	POST	500	675	657	40fd49bd-6f18-4ef9-8e3f-acb87b83ac84
582	2026-03-30 14:44:20.553802	/api/payments	GET	500	1013	226	44d7ac09-5d86-43da-aadb-feaee951110e
583	2026-03-29 16:06:38.553808	/api/orders	POST	200	1040	668	cc96b2ad-72bc-468e-920b-758ef3f9bdcb
584	2026-03-30 01:29:06.553814	/api/customers	GET	404	1142	430	86690f50-aa1a-4741-a0ec-9321f5ce84da
588	2026-03-30 01:54:49.553839	/api/customers	POST	404	584	413	97933f7e-f684-44bb-a300-eacacf38f8f0
597	2026-03-28 22:21:01.553896	/api/products	GET	200	1015	446	dd49336b-80d4-4246-85b2-96527a5ccde7
602	2026-04-01 09:00:39.553927	/api/orders	POST	200	1883	275	687b5048-c132-4e7c-83bd-a5bc266fbf93
626	2026-03-26 04:21:41.554081	/api/products	GET	200	365	64	e2719cec-4cfb-499a-afbe-12de7c5d399a
631	2026-03-26 02:29:00.554112	/api/orders	GET	400	527	208	6ffca905-fdb7-4610-9fa2-ac5619b57a17
633	2026-04-01 09:10:43.554124	/api/customers	GET	200	151	104	a2e8d927-3e82-47b0-8093-0d4cf627d2e2
639	2026-03-29 00:34:14.554159	/api/payments	GET	404	86	18	c68c322b-5431-4907-8b9d-0f2d26e8170a
643	2026-03-28 07:08:55.554185	/api/products	GET	200	1738	919	d5c735b5-e2ac-48f3-8541-fef23dc5cb67
652	2026-03-30 17:02:20.554242	/api/products	GET	200	1487	66	8ce14ab1-077a-4c27-827b-af047c7559fc
655	2026-03-28 08:16:19.55426	/api/orders	POST	200	1514	331	ae7ae9a0-0d4a-44a4-856c-b541d439e8ee
661	2026-04-01 22:33:27.554297	/api/products	GET	400	1867	1127	839da4dd-f8e0-40ed-93c9-4c3c08c4c84f
664	2026-04-01 04:39:48.554314	/api/payments	POST	400	1836	1023	871f8001-c686-4932-af40-7e3e06841974
667	2026-04-01 00:56:47.554334	/api/customers	GET	200	1262	1234	dba5ae0c-88e1-40c9-ae35-822cf999c8ef
669	2026-04-01 10:06:49.554347	/api/payments	POST	400	1444	1067	5a393493-7da7-492a-ae04-6301b8346b92
671	2026-03-29 08:39:19.554359	/api/customers	POST	400	1643	1622	b4d50120-44ed-4ed6-b349-b3ce383142d6
673	2026-03-30 03:07:24.554372	/api/products	POST	201	1163	1017	743c36b5-ffa1-48c0-b6b9-6937aa5193c8
675	2026-03-28 11:23:54.554384	/api/orders	POST	201	1170	826	1e539ea1-4f87-428d-b3b9-096b2d756b26
677	2026-04-01 18:06:18.554398	/api/payments	POST	200	786	545	a3ab358b-ee7e-421f-bb06-8156cba77723
679	2026-03-27 19:00:55.55441	/api/products	POST	200	1672	131	8c394672-6262-479b-8751-dce319343494
684	2026-03-31 06:41:25.554441	/api/orders	GET	200	769	245	6a351c15-dd37-4883-986c-346473e0babe
686	2026-03-28 17:45:58.554454	/api/orders	POST	404	1914	676	fa9919e2-4da9-4acc-9e82-c076dfe25842
694	2026-03-31 04:36:40.554502	/api/orders	GET	200	1525	249	9310815e-bd3f-469e-ae87-7c61b717e23e
697	2026-03-26 03:01:19.554521	/api/payments	POST	500	605	263	a2422637-b757-4d01-8743-11cad3d86341
698	2026-03-27 23:31:23.554527	/api/payments	GET	200	1849	579	a61e1feb-d754-4f93-87f9-4fd3ef3c5560
703	2026-03-26 15:37:03.554558	/api/products	GET	200	1751	1677	3756955f-0284-4677-804f-f528fc5514f8
713	2026-04-01 07:32:27.554643	/api/products	POST	200	826	70	81484213-ec1a-4c6c-a6a8-9827ed64cd2c
721	2026-04-01 01:26:34.554692	/api/products	POST	200	341	285	17e22055-16ed-4823-85ed-3d89c3fde514
734	2026-03-26 18:17:06.554774	/api/products	POST	200	720	498	9f01ffec-4560-472b-92e7-b363e61cbcc7
743	2026-04-01 01:33:02.554829	/api/products	POST	200	158	92	feadd59c-3d27-4761-bb75-43fa4fbdc0a1
744	2026-03-30 18:23:35.554836	/api/payments	GET	200	483	86	cb621a11-3233-4b56-807d-6ec10758fda4
747	2026-03-31 19:25:25.554854	/api/orders	POST	200	1918	1519	c14ee023-8258-4a37-ae61-a3371dc6e31a
749	2026-03-31 14:07:31.554866	/api/customers	GET	500	1892	446	4744f7e6-d68e-4028-a259-ef91fc665578
752	2026-03-27 20:58:15.554886	/api/customers	POST	200	1171	289	a33d134f-c43d-4e55-8482-4d56243aad7c
754	2026-03-29 16:04:09.554898	/api/customers	GET	200	552	471	fd98fa19-b7ff-49c4-8168-a0e766277d15
755	2026-03-26 00:45:10.554905	/api/payments	GET	200	1569	132	b3401674-7dc4-4cf2-a825-cbb17bc8bbd3
760	2026-04-01 19:19:49.554935	/api/orders	POST	404	1871	1179	8a8de200-eaae-415c-b186-a14abe00e780
767	2026-03-30 22:37:45.554978	/api/products	GET	404	78	29	6b642f07-ca36-4591-8630-723739d95771
772	2026-03-31 06:29:38.55501	/api/payments	GET	500	700	328	6906f178-78e6-4e7b-aafb-abd3371f2b42
773	2026-03-28 10:33:08.555016	/api/orders	GET	200	1227	1054	aafd99e6-0188-472e-aa03-1510e2cf2ff3
779	2026-03-30 10:08:52.555059	/api/products	POST	500	1686	1500	60fd762c-d464-4efe-87b5-e210448e2f59
780	2026-03-30 21:28:14.555065	/api/products	POST	500	1103	642	a004a238-71c6-4649-bb7c-764f708de489
781	2026-03-28 23:49:52.555071	/api/payments	POST	200	1910	1427	ce47d85a-8885-451a-846a-800f89d33b72
784	2026-03-27 23:12:26.55509	/api/orders	GET	200	1303	591	7af1dd35-b181-4e5d-93ee-58baaec84642
788	2026-03-30 00:56:34.555114	/api/payments	GET	201	1545	107	afc06e51-74eb-478a-b19c-2871fca4c09a
789	2026-03-30 23:44:55.55512	/api/payments	POST	201	1212	709	abcbf8e6-1393-4095-84d1-1e9b2cdd849b
790	2026-04-01 18:44:24.555126	/api/customers	POST	500	557	370	2f283524-8a50-414c-aef4-2a9b3d560128
796	2026-04-01 20:05:32.555162	/api/customers	GET	404	75	21	a733202b-cf46-46eb-a6e3-155cabf03908
802	2026-03-31 13:00:43.555251	/api/customers	POST	404	1772	1003	24f2a979-7eb1-42a3-95b7-195d1b69e739
826	2026-03-28 10:17:30.555401	/api/customers	POST	500	1050	286	9b65608b-b2de-4b7b-bdf8-0cb5b81c50bb
839	2026-03-29 07:08:27.555483	/api/payments	POST	200	623	174	ab3423b1-60cb-4ee2-88ea-519e7188d8de
841	2026-03-28 08:24:31.555497	/api/orders	POST	404	371	227	2cc32139-3895-4f3a-a9d6-a7431123d8dc
842	2026-03-29 09:22:21.555503	/api/products	POST	500	1682	839	123e8db0-1b61-4a37-934d-a235b95ef99a
851	2026-03-30 16:54:22.555557	/api/products	GET	201	1426	443	3623947e-4b06-47c3-8b2e-45061b6ac291
857	2026-03-29 23:13:54.555607	/api/customers	POST	200	660	93	56aee808-5020-482e-aafd-de0d4bb51bcf
860	2026-03-27 09:20:32.555625	/api/orders	POST	404	1312	1277	a002b18c-b40c-43c4-a86d-2ef72097dcad
864	2026-03-30 11:12:55.555651	/api/orders	GET	200	1061	506	6f598bc4-c375-41cc-8020-9391cff2d512
868	2026-03-30 07:18:06.555675	/api/payments	POST	404	1448	1414	99297956-31ff-4f36-9078-26ce44f991b0
870	2026-03-31 12:24:44.555687	/api/products	POST	400	1164	1100	21e0241d-97b3-4f99-b174-7253372d6738
871	2026-03-30 06:02:04.555693	/api/orders	POST	500	1448	788	c4c4a00d-345a-4955-a044-451bee17ecd7
873	2026-03-27 08:05:45.555705	/api/orders	GET	200	1800	1147	3dc0dccf-ae2c-4080-abc8-d4cad60693eb
885	2026-03-28 08:38:49.555781	/api/orders	POST	200	1578	107	e3f14511-a30a-4a61-9467-834f33aed008
898	2026-03-26 02:39:14.555861	/api/products	POST	201	822	660	45c6b37f-28fa-4df4-a719-d2c2d6278834
901	2026-03-27 21:22:19.55588	/api/customers	POST	400	1140	638	d4c8c1f5-be60-4669-ad1f-f0ba131ff522
905	2026-03-26 12:41:12.555905	/api/orders	POST	201	738	354	11c95fd2-d427-4b11-8526-7d2e94b17892
926	2026-03-30 02:11:44.556048	/api/orders	POST	200	1806	835	56919f94-3d47-4d29-8757-afb853af0c5f
937	2026-03-26 07:01:12.556118	/api/orders	GET	200	1474	1416	d54c1a67-dad7-46b7-932f-a2662cda30bb
940	2026-03-29 21:49:21.556138	/api/orders	POST	200	1055	332	38e48c35-0881-4b8a-93fb-43e9a13d4f19
943	2026-04-01 04:02:29.556157	/api/customers	POST	404	1532	1434	00201daa-0e1d-42ca-988b-509ef47cb51f
949	2026-03-31 01:00:15.556194	/api/products	GET	201	1665	776	ee025722-7cf3-480b-b054-14dc62e4ae7c
951	2026-03-28 09:15:29.556206	/api/customers	POST	200	1107	1045	0c5f3f3b-4c59-4b34-9de8-a2821a366d27
952	2026-03-31 04:28:49.556213	/api/products	POST	400	270	257	8b2ca0f6-f7aa-44bb-8ce2-a9317d501773
954	2026-03-30 20:24:26.556225	/api/products	POST	500	465	342	acaa5a10-eac7-4762-927d-1b36be3f1552
962	2026-03-30 03:11:01.556278	/api/customers	POST	200	1485	464	6563a40e-7a85-4796-becb-387ae8915965
966	2026-03-29 22:17:48.556303	/api/orders	GET	200	1710	720	d8ef1c0f-d137-4a16-bbe2-4bb7fe2336ec
974	2026-03-31 18:07:41.556354	/api/products	GET	200	1806	1221	57a790ad-5460-4e41-b415-f7b170e219f9
987	2026-03-31 03:56:24.556439	/api/orders	POST	500	559	388	c3c0edb0-9da6-43ae-a46f-d693698c9a7f
988	2026-03-28 22:07:55.556445	/api/payments	POST	201	55	49	2b0548e6-f4c9-48cc-a1c9-dcba0ccb21c6
994	2026-03-28 05:19:06.556482	/api/orders	POST	400	1895	1438	9f74f0a9-6a8d-45ab-a3b4-1e6c9a9b1197
997	2026-03-28 19:12:22.556501	/api/products	GET	200	647	287	471d2d2a-f7ce-49a2-ae4a-8bc4108426c1
999	2026-03-26 05:58:48.556513	/api/payments	POST	400	1005	632	6805a700-6b7b-46d1-b083-a0e10979643a
\.


--
-- TOC entry 5849 (class 0 OID 43154)
-- Dependencies: 337
-- Data for Name: _hyper_4_7_chunk; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: postgres
--

COPY _timescaledb_internal._hyper_4_7_chunk (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
11	2026-04-08 08:02:32.548921	/api/payments	GET	201	1932	45	0d5c8ea7-346d-443a-a409-ffac26750320
16	2026-04-07 18:38:28.548957	/api/products	POST	500	1904	1756	084584ae-8ba4-430d-83e4-4805b973157d
19	2026-04-04 08:18:43.548976	/api/orders	GET	200	642	211	db727035-2c5d-4bf0-8986-94cb4e1b8866
20	2026-04-06 00:46:21.548983	/api/payments	GET	404	1625	1312	ce706d2e-8dfd-41c9-860f-bd4c38cb4c04
28	2026-04-07 03:56:59.549042	/api/customers	GET	200	1520	157	7c0a8da5-1bd9-4353-8f57-56c339e01f1c
30	2026-04-02 15:16:31.549055	/api/payments	GET	200	511	428	3e085905-d7ef-43b5-9207-00fa87ebd7ac
36	2026-04-07 18:35:57.549092	/api/customers	GET	200	609	587	8b4e4c5f-65b3-4d2d-8b99-b4ea84d993aa
38	2026-04-07 20:26:51.549106	/api/products	POST	404	837	585	696ba982-820e-456a-887c-6b7c2723fcb3
45	2026-04-03 08:38:53.549151	/api/orders	POST	404	1477	559	46c2eca8-95a1-4fba-ad90-f5ca8a0c07d4
46	2026-04-06 15:30:25.549157	/api/orders	POST	404	885	321	994be817-d242-49ca-9062-53240b18d487
50	2026-04-07 01:49:28.549181	/api/products	GET	201	142	139	266c2ade-fdae-45d3-b287-d025e7c0f17e
52	2026-04-06 07:00:33.549193	/api/orders	GET	200	113	71	11fa7520-38fd-4882-a8c0-9aa0d36702cf
68	2026-04-07 00:07:38.549301	/api/payments	POST	200	1361	35	b19308f9-09f5-4a99-a990-67894b11a03e
73	2026-04-05 14:51:34.549347	/api/payments	POST	404	1788	1588	b8895405-cbf3-4384-9c51-a3779a9871fb
77	2026-04-06 16:07:08.549372	/api/products	GET	500	1983	1741	11fb195f-1f16-4d03-8714-589e67d5217f
80	2026-04-08 19:41:48.549392	/api/customers	GET	200	1250	868	b7ce0dfc-365b-4f82-8a50-a657201013c8
86	2026-04-07 13:14:18.54943	/api/products	GET	200	665	553	038b2bb3-c4b4-43c4-8bba-26ad8b5669a8
104	2026-04-03 23:15:12.549544	/api/products	POST	404	368	35	48934d9f-310f-48f4-b0aa-f3d741c2b120
105	2026-04-04 15:05:53.54955	/api/products	GET	200	1132	562	2ba3e01d-0726-485d-94af-64e033861417
114	2026-04-06 02:50:16.549608	/api/payments	GET	201	1868	1197	a6654dd7-c33d-4daa-847c-d0ac2b8150a6
115	2026-04-06 00:54:49.549614	/api/orders	POST	200	1462	785	fec5b9d5-a04e-4d95-bf9c-ee8c5a37a955
119	2026-04-04 02:23:54.549638	/api/products	GET	201	1037	979	3713e847-101d-4b3e-b072-f02c9523b072
121	2026-04-02 05:56:46.549652	/api/orders	POST	404	907	318	769510ce-c25f-4b6b-a484-8f6cff9beac5
122	2026-04-04 18:35:59.549659	/api/payments	POST	200	1958	849	91ede803-93aa-4272-9c29-4d54a179cacd
124	2026-04-02 11:02:15.549671	/api/products	GET	200	335	301	83c9c6c1-5502-41e0-90ce-16b81296145a
127	2026-04-06 02:48:03.54969	/api/orders	GET	200	1821	987	b07c74ad-b41e-4708-9c9a-e76cafef77ca
129	2026-04-02 22:09:09.549702	/api/products	GET	200	1184	284	4d4638fe-1b36-4602-a370-f4e2999f6e15
130	2026-04-07 11:53:43.549709	/api/customers	GET	201	1467	957	19f9d4c9-ff3d-4086-93b1-de6b05a104c5
134	2026-04-05 19:22:25.549735	/api/orders	POST	200	782	155	a79734f2-027c-45f7-afff-d3a0d2fc192d
137	2026-04-08 13:10:18.549753	/api/orders	GET	200	1940	1126	27a0d560-2212-4854-8cb1-c2b1a6ea8309
142	2026-04-03 16:26:52.549786	/api/customers	GET	201	517	399	f678dd43-d697-45b7-aa98-94e17ac278d1
143	2026-04-07 05:57:17.549792	/api/orders	GET	500	275	274	19ee7ea0-dffe-445c-8893-6370cf7178cd
144	2026-04-04 22:39:35.549798	/api/products	GET	200	1041	398	c6078bc7-fb26-4cfd-874c-8b8272ed5f68
157	2026-04-05 21:03:48.549878	/api/payments	GET	404	240	10	5fa634fa-55a2-4320-b77e-4f1465775d8c
159	2026-04-03 21:08:59.549891	/api/products	POST	201	317	270	86eefdfb-1c0f-4bfd-adee-67909f5291d1
162	2026-04-04 17:05:26.549909	/api/customers	GET	201	1689	1248	abc9caf3-4490-43f6-853a-66899e16a8a3
165	2026-04-02 23:52:10.549928	/api/customers	POST	500	1249	768	bce4d085-a38e-48a4-b393-94a8a5163245
168	2026-04-05 11:56:48.549948	/api/payments	POST	200	676	329	bd4c5ee4-96b2-487a-9ba6-1a921a338185
171	2026-04-03 12:01:13.549966	/api/orders	GET	400	312	284	854a225d-91ad-450c-bccb-5cbb8c4ebf38
179	2026-04-03 15:06:32.550018	/api/orders	GET	200	1214	834	4390a259-7520-49da-8bf5-6b3942c149b3
189	2026-04-08 22:28:50.550101	/api/products	GET	200	270	89	622acc9d-f763-451f-b433-e32ec717a6f0
195	2026-04-06 20:35:16.55014	/api/customers	GET	201	1389	879	0ef7811b-bd9a-46e7-88ed-7e9045559153
196	2026-04-07 01:19:36.550148	/api/customers	POST	200	1612	88	d220ca75-3edf-4203-9bf4-045ddfdf2b36
201	2026-04-02 22:56:08.550182	/api/orders	GET	201	1432	358	7bb45bfb-a0db-4517-b022-c72702a8e943
205	2026-04-06 18:09:36.550206	/api/orders	POST	201	477	33	eacd4f3d-ecb4-44ea-bec6-621b4607c3e1
215	2026-04-04 06:36:42.550267	/api/payments	GET	200	850	817	874c5656-4c68-4851-92ba-ab928a69cb33
216	2026-04-04 22:02:59.550274	/api/orders	GET	404	414	123	0b04e720-b80c-4a20-90d6-6477778e4420
220	2026-04-02 18:38:09.5503	/api/payments	GET	500	300	214	0e6e6c79-756a-4b1d-8bcd-3d319e7897b4
223	2026-04-06 03:09:40.550318	/api/products	GET	500	1878	789	a9e1c606-65ac-4c59-b525-3d7da393c111
226	2026-04-03 16:08:14.550337	/api/payments	POST	200	398	335	d96078f1-2f4a-41bb-9b18-29d52470f6f4
231	2026-04-02 09:05:30.550368	/api/customers	POST	200	253	222	2c33b8ac-42fc-4d90-9cba-06fef60dd567
240	2026-04-08 23:30:24.550425	/api/orders	GET	200	83	14	83d996ce-50de-46fc-b0c9-57d0cb2ed1ab
246	2026-04-05 12:42:30.550463	/api/customers	GET	404	803	238	33a7dbe4-4225-40da-b9ee-16a9b23337d7
251	2026-04-07 14:53:59.550495	/api/orders	POST	200	800	356	97b193bb-a5c8-4c52-b563-0929df330055
252	2026-04-06 18:39:54.550501	/api/customers	GET	400	791	607	540d8907-4237-4b44-bf00-806a526d4745
260	2026-04-08 07:13:39.550554	/api/payments	GET	201	1179	1030	4a4bfa69-1e42-4ea0-8f86-fb4fa7284325
269	2026-04-03 20:06:15.55062	/api/customers	GET	400	1758	916	39e2359f-a355-425e-a16e-4be8b3130fe6
270	2026-04-08 19:39:12.550627	/api/customers	POST	200	751	346	65dcc72c-dda7-4d3d-a581-0b4e605be4b4
276	2026-04-06 16:29:25.550667	/api/payments	POST	200	1351	286	85372c06-967c-42e0-a75e-58aaa6dc0a8e
283	2026-04-06 10:56:06.550711	/api/orders	GET	201	517	130	7437343f-a383-4934-a6f9-475427973e8e
289	2026-04-04 06:47:17.550748	/api/orders	GET	200	1090	57	b4024a9f-ba0b-45b5-b246-4129d33d34c2
292	2026-04-04 02:39:49.550767	/api/customers	POST	404	1205	422	fc95f297-4100-423d-8048-50297fcac5b2
304	2026-04-05 10:55:54.550842	/api/payments	GET	404	420	144	8d6298ca-6742-492f-ba14-44febd78902d
307	2026-04-06 19:04:45.550861	/api/customers	POST	500	1943	169	30a62fc0-c5bb-4c53-aa30-0c79537f9044
309	2026-04-03 01:39:18.550944	/api/products	GET	200	1166	678	d62b2659-2921-4983-8a1c-0323ddcb67d3
312	2026-04-05 07:38:01.550969	/api/payments	POST	201	920	899	9f1bb4f7-456b-4da2-8713-4c29ce8007ce
313	2026-04-06 22:02:28.550975	/api/customers	POST	404	412	126	546d0031-abc9-4f58-837b-743dc32c87ab
314	2026-04-03 18:20:02.550982	/api/products	POST	400	565	401	fe57b1a8-f1f1-469b-a389-4aafac290eae
321	2026-04-04 00:05:50.551036	/api/customers	POST	400	971	170	2254fcae-bb6c-4464-a976-68cf0aa11750
326	2026-04-08 02:10:35.551085	/api/payments	GET	404	1283	731	552e5435-364f-49e5-b662-48093dc397d0
334	2026-04-04 18:03:43.551138	/api/customers	GET	200	1181	1066	fa58ddd1-a7da-4617-8159-96a07c54e830
338	2026-04-06 14:28:45.551163	/api/payments	GET	200	1991	1519	8e324833-b573-464b-82a9-690673a66817
339	2026-04-08 22:50:52.55117	/api/products	POST	200	249	114	27b7e54a-045c-411f-ad69-a4d01959951c
340	2026-04-07 05:41:46.551176	/api/customers	POST	200	1545	450	87a50a21-c786-482e-b2d8-c9fe10a39826
345	2026-04-07 18:19:42.551208	/api/customers	GET	404	341	149	60844bf7-5cd0-4316-902f-6c6c348ba2ec
349	2026-04-06 04:45:45.551234	/api/customers	POST	200	1901	1447	49f42a15-0315-4e35-8830-9e09238c4ea2
356	2026-04-05 08:28:30.55128	/api/payments	POST	404	1855	28	1b5ad3af-a2f9-437a-87bf-ffe9dfababf5
358	2026-04-07 21:16:38.551292	/api/products	POST	201	741	202	0b8eb9b6-bdb9-4642-8221-0b891b932aa2
359	2026-04-05 07:44:26.551298	/api/products	GET	200	1532	103	e38244a1-ea18-4a43-bf14-7aefc94a40b6
369	2026-04-03 16:47:39.55136	/api/products	GET	200	272	198	e75def52-31c3-4963-9d1c-eb137bd1c462
371	2026-04-04 18:39:07.551375	/api/customers	GET	500	1412	797	7fe8ba2c-2675-48ca-bb67-9d14f9cfa01c
385	2026-04-03 17:00:30.551466	/api/orders	POST	200	594	127	20f06562-09d4-4b13-b471-963c3a92c0fe
393	2026-04-02 18:12:26.551519	/api/products	GET	200	1767	256	7d66143e-21c5-4f3c-91bd-6599ceb89640
394	2026-04-03 16:09:53.551526	/api/customers	GET	200	1618	1327	42bea120-7f47-45a5-baca-90c335822563
396	2026-04-06 22:56:49.551553	/api/products	GET	200	581	454	d4f82432-a1ef-4197-81bc-6892e7319de6
397	2026-04-08 22:44:43.551559	/api/products	GET	200	1563	620	080d1966-25d9-410a-914e-2939e02ba0ff
398	2026-04-03 08:03:30.551565	/api/customers	POST	200	228	108	8e98201c-a4f8-40b6-86f5-5fb43676da33
403	2026-04-07 15:20:51.551597	/api/customers	GET	200	1186	1084	176d2724-007e-46ed-b629-053aa37d93fc
409	2026-04-04 09:48:21.551636	/api/products	GET	200	1375	458	e557943f-5c70-4599-a18e-8368de8af012
411	2026-04-03 02:34:35.551649	/api/customers	GET	200	1536	952	a68d6ad6-2d88-4670-ac64-717c201acea3
413	2026-04-08 03:32:07.552297	/api/customers	GET	500	1193	281	9a5d684c-fa5f-4602-a92a-66e68765ac13
415	2026-04-03 06:40:51.552311	/api/payments	GET	404	944	848	454bdb91-bdb2-4d87-83c9-bbeb3c4e7ffa
427	2026-04-03 11:44:10.552411	/api/payments	GET	200	904	82	6a808d32-011f-428c-be31-4cf4eb1ab563
430	2026-04-06 02:14:26.552429	/api/payments	GET	201	1781	728	d5cec49c-a068-4e3c-ba4b-5fb12d3a7974
437	2026-04-08 09:20:56.552474	/api/customers	GET	200	921	324	eec6a46d-28ec-4a19-86ba-42961dabbb78
444	2026-04-06 21:36:28.552903	/api/orders	GET	400	1031	505	22f9611d-2ffe-490d-97f5-f29729d9b170
445	2026-04-06 17:04:39.552909	/api/payments	GET	200	1707	917	fb36015d-aa70-4520-8331-2219ccbe5c29
447	2026-04-07 22:32:53.552925	/api/payments	GET	400	323	155	58e1a198-bccc-4101-a710-441134c88506
449	2026-04-08 11:51:10.552938	/api/orders	POST	200	1596	560	75ccf02b-a234-4843-a176-df75cce08af7
456	2026-04-04 21:43:37.552986	/api/orders	POST	400	1014	75	3dac64eb-3858-4809-b877-ebf5e3a4b248
457	2026-04-06 07:56:11.552992	/api/products	GET	500	1184	515	e855d305-b6a9-42a7-bb07-323570f2e5aa
471	2026-04-02 21:52:43.553088	/api/orders	POST	200	1543	1194	2e013862-3556-4fed-b55d-22f94638f761
476	2026-04-06 16:49:40.553121	/api/payments	GET	200	1635	1376	393d38c9-77cc-48c6-b5b7-38a9b25e2f10
498	2026-04-04 10:43:33.553257	/api/orders	GET	200	1194	110	c4c32c08-c902-42c1-84c0-ba3f6174ab94
504	2026-04-04 05:14:54.553295	/api/payments	GET	200	1895	14	ed0f35c3-970b-4619-9a37-82980ffca49b
513	2026-04-08 08:39:07.553352	/api/payments	POST	200	259	218	19cfcb23-1ec6-488b-8b30-0a7426521ae8
514	2026-04-04 18:58:01.55336	/api/payments	POST	404	1867	1593	a554f2d3-462c-49b4-8b94-96d182a4f325
517	2026-04-06 17:17:46.553378	/api/products	GET	400	1924	599	289fe1d6-2346-4682-a62e-6cdb06dbdd4e
535	2026-04-06 08:48:12.553491	/api/orders	POST	201	1319	353	081247f9-8d32-483f-abd2-d81a9933a6fb
538	2026-04-06 07:48:35.553508	/api/customers	POST	404	1633	767	fda435b7-ba9c-4321-a229-64764fe80708
539	2026-04-05 03:39:17.553514	/api/orders	GET	500	1857	1001	1eabbe5d-98fd-4abd-b933-86f35b3b9e33
540	2026-04-07 13:50:02.55352	/api/orders	GET	500	398	284	0657ffa8-a430-4310-9e3d-04c286ee6695
546	2026-04-02 07:34:51.553556	/api/products	POST	500	1216	405	c5af9d57-235b-4c4f-a5fe-7ee36ad2c269
549	2026-04-04 09:46:30.553596	/api/products	GET	200	1043	300	8540e00a-f814-45d3-a8e3-1a0cfa4b29f7
551	2026-04-04 13:56:09.553609	/api/orders	GET	400	923	256	3c60bff9-6593-4e78-80dd-b2ba8ab76118
555	2026-04-06 23:15:20.553633	/api/payments	POST	200	815	722	2e7f7bb4-e8e0-41cf-9157-935d940ae6c0
557	2026-04-04 15:58:50.553646	/api/payments	POST	404	457	272	89151a3e-f6cb-4fc6-92e4-9bfc5232d0b8
562	2026-04-02 17:35:54.553676	/api/orders	POST	200	932	816	cd1272ec-f82b-4c35-91fb-bcc4cf8c4122
563	2026-04-02 19:29:35.553682	/api/orders	POST	500	1084	268	16ea8dbc-ffde-440e-a759-4b9dd0981e4e
565	2026-04-04 06:48:48.553695	/api/orders	POST	500	1015	92	a1858a11-99b1-4cbd-80a9-2888ecd9e819
585	2026-04-05 18:10:16.55382	/api/products	GET	500	1658	204	09b1eeb6-90c7-4d1c-8d56-3d675185cffe
591	2026-04-02 20:19:08.553859	/api/payments	POST	400	1700	1384	354bf119-28eb-4e2e-a8fb-5c37fd78e1d2
605	2026-04-08 06:44:10.553946	/api/customers	POST	400	1669	1593	d9c39ae3-acb2-4b2a-8190-e88007dad451
611	2026-04-05 23:56:54.553984	/api/payments	GET	201	1484	292	b4e3cd52-2b56-4167-9895-47e36f39afbe
616	2026-04-03 22:24:27.554014	/api/customers	POST	400	745	642	0a01e61d-c7dd-44cc-8371-1890085c7ca2
617	2026-04-08 09:25:53.55402	/api/payments	GET	200	1351	922	e7a56e1f-f43a-4cc9-bb96-7f035c846d94
620	2026-04-02 12:50:55.554043	/api/payments	GET	200	979	366	6d833938-6871-46d0-8992-e26158d202bc
621	2026-04-05 21:27:14.554049	/api/payments	GET	200	1264	512	3a7ffeb4-6f43-49b5-be6f-66b06b08b8a4
622	2026-04-07 19:09:38.554055	/api/customers	POST	500	550	15	830ea53f-8565-408a-8cbf-2fa7423b5a46
623	2026-04-06 19:04:03.554061	/api/customers	POST	200	652	545	0b7388f6-3e3b-477a-9f2e-9007419b36a9
625	2026-04-04 03:57:32.554075	/api/payments	POST	404	1472	135	aba9c2a7-0178-4ec2-835b-7a8308d05d71
636	2026-04-05 04:08:53.554142	/api/customers	GET	200	697	64	212c9335-748e-41af-9cf8-29b286ae0bb9
637	2026-04-08 20:37:44.554148	/api/payments	POST	404	1668	518	f30d54e6-bea7-4b48-81c8-1da4e8116f10
642	2026-04-04 12:57:46.554179	/api/customers	GET	500	1820	1284	6504215d-5716-42b9-907c-4b1f5f1de53f
647	2026-04-02 22:57:53.55421	/api/orders	GET	200	422	284	5ce124f2-dbc1-4088-a11a-77ba30792922
650	2026-04-02 06:05:35.55423	/api/payments	GET	200	704	264	0e99ca87-1956-4145-baf9-dd552e4908c4
654	2026-04-06 12:32:56.554254	/api/orders	GET	400	685	392	0899d427-e39a-4a21-a6c7-b0a7aeaeba9e
656	2026-04-02 14:24:23.554266	/api/customers	GET	200	1113	620	8119881b-7f03-458c-92a8-e78214f34605
657	2026-04-07 11:42:52.554272	/api/orders	POST	200	1908	1626	abc54161-7c9b-4188-abce-65f46cc1f120
670	2026-04-04 22:41:26.554353	/api/products	POST	200	1527	930	69e9dd2b-4682-4a15-96c8-1854b2edae42
680	2026-04-07 13:16:48.554416	/api/products	POST	500	1873	950	c52e37bf-aeec-4072-a496-159c63e21e52
681	2026-04-05 13:26:02.554423	/api/payments	GET	400	1451	590	460ad190-d08d-4808-a4df-f9ac8ccb8726
682	2026-04-02 03:38:51.554429	/api/products	GET	200	566	128	4371d030-83a9-45b1-af65-c0498993b4e9
683	2026-04-06 08:32:13.554435	/api/orders	POST	200	991	145	d020be44-cbd5-4713-a227-85e4a9aab1dc
691	2026-04-03 19:22:49.554485	/api/customers	POST	400	1874	644	f1ad10ff-ee93-4e3a-b3b1-a1d1cb1c465b
696	2026-04-06 05:44:15.554514	/api/products	GET	400	1159	137	2ec43f8e-8430-4530-900c-d02c0e3b4744
709	2026-04-04 04:31:02.554619	/api/products	POST	400	935	653	10fdb14c-3aaa-49a5-bf78-a06c9b21b50c
716	2026-04-08 09:26:45.554661	/api/customers	POST	200	1646	1342	357c76ab-794d-4738-94cb-5948f800af55
718	2026-04-08 01:54:18.554673	/api/orders	GET	200	208	14	0db6e4d1-d930-4b41-8129-7d93a95116d8
719	2026-04-08 07:30:11.55468	/api/products	GET	200	899	246	1a22d07a-a23a-4773-a5be-169d8bb85e11
723	2026-04-03 11:32:37.554704	/api/payments	GET	200	798	87	8fe05726-9a9a-4d2d-baaf-23fe0ffd968f
725	2026-04-08 16:04:42.554718	/api/customers	GET	200	1547	353	c6007cb4-bd2b-47a0-a902-cea20b57d47b
726	2026-04-05 15:10:44.554725	/api/orders	GET	400	1430	220	41d36313-56c7-4e1a-92d1-1e5d385c7d5d
730	2026-04-02 22:34:27.55475	/api/customers	GET	200	543	15	05abd23a-ebd0-4545-8bc1-1c61c47cb405
732	2026-04-08 22:46:19.554762	/api/payments	GET	404	957	515	8afb2e02-82fc-4c6a-b229-d756ebd82721
733	2026-04-03 02:15:29.554768	/api/orders	GET	500	1305	261	f396b646-a360-4fe7-a6ed-2c4dd7f5a055
739	2026-04-04 11:38:42.554804	/api/products	POST	404	1167	372	feff1713-be61-49bf-9faa-a714c3255f64
741	2026-04-05 23:21:34.554817	/api/orders	GET	200	1841	966	36437eca-7662-4631-99be-c9454ae8e5b4
742	2026-04-02 21:02:42.554823	/api/orders	GET	200	1851	1200	bb395373-4f13-49f2-a3ef-e991036a64a0
750	2026-04-02 02:35:53.554872	/api/orders	GET	200	713	564	c9b21446-f518-4240-bdb6-06d2866201a3
751	2026-04-03 15:26:28.554878	/api/customers	GET	200	1833	955	800bf110-d645-41ab-886d-b3dfc76bffce
753	2026-04-08 05:03:10.554892	/api/customers	POST	200	560	314	1c757b22-a851-4f4b-a324-2f6928a00fc7
761	2026-04-04 13:16:00.554941	/api/orders	POST	500	1983	1408	f19e8b8c-713e-4deb-8068-ede261f8c2f2
764	2026-04-03 19:49:21.55496	/api/orders	POST	200	1705	355	11b33cac-65ca-4ee6-b882-e3a977748e0f
766	2026-04-05 12:51:35.554972	/api/payments	POST	200	814	191	4d0d1080-cf33-4ea9-bcc8-02d1ed3cf0f3
768	2026-04-07 01:46:45.554984	/api/orders	POST	200	1441	989	efb7cde3-5743-4add-82b2-ab52e3c61d2e
770	2026-04-04 14:06:10.554997	/api/payments	POST	500	863	517	0365ccd7-7297-4c5e-b247-075705562605
775	2026-04-04 12:53:50.555032	/api/orders	POST	201	522	206	bd083142-2b61-40da-91e6-a5a9097ba090
776	2026-04-07 18:06:33.555038	/api/customers	POST	200	1949	1854	88251cc2-0855-4c8d-a8b9-7d06fd013515
782	2026-04-06 22:14:43.555077	/api/orders	POST	200	1620	1322	d086d281-eee5-44b7-9487-321b4ee7e3c7
786	2026-04-02 06:49:47.555102	/api/orders	POST	201	443	141	6504569d-5ccf-4f9a-9133-11c35477f110
787	2026-04-02 11:29:12.555108	/api/orders	GET	200	1552	1229	06b75dc4-db6e-45f0-8fcb-75d69ca2a6fb
793	2026-04-04 09:43:24.555145	/api/payments	POST	200	1105	941	7644955a-9298-440c-af49-c0d4efcca1c1
794	2026-04-07 00:20:53.555151	/api/customers	POST	200	522	80	95f17c2d-a395-4f59-9d45-2317f313b8f1
800	2026-04-03 14:51:11.555186	/api/orders	GET	404	824	331	b5e353a3-7a41-417b-8e9d-0d6b769aea65
810	2026-04-04 16:07:26.555303	/api/products	POST	200	448	263	eef6b27f-ffe2-431e-a55c-0eb6a8ce24a9
812	2026-04-05 07:47:23.555315	/api/products	GET	200	525	32	ab6c3a82-0678-494a-8089-4c42eaaed4f5
813	2026-04-05 21:13:49.555321	/api/orders	POST	400	1994	644	cc84f236-394f-4dbf-9b21-c70c4fd67c55
814	2026-04-05 01:27:10.555327	/api/orders	GET	200	1556	1481	1a474b53-6ea2-440e-90e2-54c2cdc19d69
815	2026-04-07 12:08:13.555333	/api/orders	GET	200	675	248	0036d56d-276d-4900-85ed-111ae79c0126
819	2026-04-06 22:04:15.555358	/api/products	GET	500	784	678	cfc6ca05-0b9c-4664-bdb3-959d0b1be572
820	2026-04-05 11:40:17.555364	/api/products	POST	200	1852	1102	ba1c6d89-7ac6-4310-b3f6-2c2870d065d7
821	2026-04-08 12:53:25.555369	/api/products	GET	200	360	171	0b8da701-d130-40b1-a0eb-dc6a93148d6b
822	2026-04-02 04:04:02.555376	/api/customers	POST	201	1207	65	06cee4c5-0824-4055-b355-27edfae6b9b7
824	2026-04-03 19:43:10.555389	/api/payments	POST	404	1878	1279	65a53623-6c62-4162-ae44-e56dee871202
827	2026-04-07 04:52:12.555407	/api/products	POST	400	291	226	4c736f68-ddd5-46c4-828e-e9aefa997ef1
830	2026-04-03 00:13:06.555427	/api/products	POST	201	637	236	7c54c29e-0c75-4298-afbc-8e99167fccb2
833	2026-04-03 18:20:20.555447	/api/orders	GET	400	587	419	8c23dc10-b204-4919-adc6-9f4f8be87a01
837	2026-04-07 20:35:48.555471	/api/customers	GET	200	863	99	7606fddd-f349-4dad-8816-d4a57520ab55
843	2026-04-03 19:08:28.555509	/api/orders	POST	500	67	67	cd951d12-a6f8-441b-aba1-23bc176e2b55
858	2026-04-04 09:09:48.555613	/api/products	GET	200	377	209	0f1e77f0-e8a4-4d87-8ac7-0b052e8846e9
862	2026-04-08 06:39:52.555639	/api/customers	GET	400	932	642	3a6e2c1e-e9b4-425b-87cc-b2feb44e5dcc
866	2026-04-02 17:39:37.555663	/api/products	POST	200	662	45	c0933f32-1947-436d-b19f-e793703269b6
872	2026-04-06 22:44:23.555699	/api/payments	POST	400	534	202	e3044fca-f233-4f38-9d6a-b8d05bc8c460
875	2026-04-07 21:17:38.555717	/api/payments	GET	404	434	163	0037e996-6d89-4ce4-b64f-ff3d40e85e39
882	2026-04-03 17:42:46.555763	/api/customers	POST	200	1497	1074	9480b96d-8fa7-4482-95b3-e4c0f078bc69
883	2026-04-06 23:39:18.555769	/api/products	GET	201	980	830	1403f8b9-070b-4a30-997e-c7f6c83abb6d
888	2026-04-05 17:45:34.555799	/api/products	GET	404	1026	547	ca94c555-62ef-4a1e-9bf1-b846946548b1
899	2026-04-07 12:32:24.555867	/api/orders	POST	200	1506	275	09d0c80e-1931-4476-b593-45253085c512
902	2026-04-06 21:33:36.555886	/api/customers	GET	500	1918	781	265024ad-de5c-49fe-8e6a-5ad7632a0267
903	2026-04-02 09:55:26.555892	/api/products	GET	200	1506	935	ef43ba83-a923-4302-a856-675530bbc3ea
904	2026-04-06 07:30:44.555898	/api/orders	POST	200	1186	70	832fbe2f-826d-4b21-a747-c21f21b3c7b7
916	2026-04-03 10:22:45.555975	/api/products	POST	201	784	286	3e1140ce-0d8a-4448-aaea-ef19c39e9cfd
917	2026-04-05 17:54:14.555981	/api/orders	GET	400	1266	286	85f5f53f-c9c9-4ba9-96f2-73ab9a55e745
918	2026-04-08 06:51:00.555987	/api/payments	GET	404	1570	1267	5fedee7b-7f28-4530-b394-736a3329f92f
919	2026-04-02 23:38:46.555995	/api/orders	POST	200	603	467	b6e7ce4b-39b8-4548-88f3-3a5434e70614
922	2026-04-04 14:17:50.556014	/api/products	POST	200	1487	1440	cb2f076e-a072-48b1-b8b4-6262472f3b45
923	2026-04-03 06:02:16.55602	/api/orders	GET	200	1505	407	e9c1e072-02da-4b4f-9098-441bf755e9eb
929	2026-04-05 19:41:36.556068	/api/orders	POST	200	888	358	65ba6f93-88b5-4148-8f95-e08436611c91
931	2026-04-08 20:05:19.556081	/api/payments	GET	404	1103	305	a72bc940-9f60-4701-a263-adbec03ae579
932	2026-04-05 11:11:07.556087	/api/products	GET	400	1970	1396	c3cf31cb-e100-4591-87cf-40f32df71ddc
942	2026-04-02 23:27:04.556151	/api/products	GET	200	114	86	5695c50f-ff25-4e8b-b19e-5e4fb105b250
945	2026-04-08 10:32:44.556169	/api/orders	GET	200	251	46	b09e5670-f935-4c67-a276-2a1c29610953
950	2026-04-08 06:14:43.5562	/api/orders	POST	201	547	536	9840839b-cc13-4d97-873a-312dfa2fe72d
955	2026-04-02 04:06:59.556231	/api/customers	GET	400	1003	806	15cc37ac-d80a-43cd-baeb-c13aa18ecd53
957	2026-04-06 15:04:28.556244	/api/products	GET	200	1335	417	dbf58b60-7e84-4303-9a7a-5facb99b4a76
958	2026-04-04 09:46:10.556251	/api/products	GET	400	577	262	25113443-35ce-471f-be3c-c7c044fa5aa8
960	2026-04-05 17:36:06.556264	/api/products	GET	201	1416	510	413a36e0-d732-431b-9d7f-51a230836ab5
961	2026-04-04 23:23:03.556272	/api/customers	POST	404	1961	1267	05e6c690-a44a-4632-9677-15a052dab6f0
969	2026-04-05 21:31:32.556322	/api/customers	GET	400	1424	1280	1ae78a9c-5e98-4297-8834-ab015a1d0b46
975	2026-04-05 00:34:42.55636	/api/customers	POST	404	486	172	028345a5-909e-45df-b49f-5f54806bd909
979	2026-04-03 20:03:33.556386	/api/products	GET	404	141	117	8097205c-eb1b-454c-b938-5b8afd433ce2
981	2026-04-07 14:55:02.556399	/api/products	POST	500	676	641	bb6aeeb4-d9f0-45c7-a44d-b217f4dfcad2
982	2026-04-08 06:52:34.556407	/api/products	POST	404	1473	1343	1e464d02-77e9-47c6-a560-0e4c51f8d122
989	2026-04-04 14:27:31.556451	/api/payments	POST	200	1804	1488	dc1bfb63-c0ac-4f2b-bf8d-5ea83ebf4f42
991	2026-04-06 03:15:25.556463	/api/products	POST	200	259	38	8ff4554c-5d4b-44b5-ba57-a336875d0c24
993	2026-04-06 22:42:34.556476	/api/orders	GET	201	740	309	66131e94-2c25-468d-af69-d805552e2d0c
1000	2026-04-05 19:54:32.556519	/api/payments	POST	400	1059	291	6b6c6e35-29f0-40ed-a577-69b38b12494d
\.


--
-- TOC entry 5840 (class 0 OID 43009)
-- Dependencies: 328
-- Data for Name: api_request_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_request_logs (id, requested_at, route, method, status_code, latency_ms, db_time_ms, trace_id) FROM stdin;
\.


--
-- TOC entry 5825 (class 0 OID 42928)
-- Dependencies: 313
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, region, signup_date) FROM stdin;
1	Customer 1	North	2025-04-15 15:59:36.479773
2	Customer 2	West	2024-07-16 10:46:32.479791
3	Customer 3	South	2025-10-29 04:00:05.479797
4	Customer 4	North	2025-10-11 09:57:10.479801
5	Customer 5	West	2024-05-27 10:05:16.479805
6	Customer 6	East	2025-10-31 11:50:07.47981
7	Customer 7	North	2024-12-18 02:43:39.479816
8	Customer 8	West	2025-04-20 00:03:41.479822
9	Customer 9	South	2025-08-28 09:14:19.479828
10	Customer 10	West	2025-05-12 01:01:27.479834
11	Customer 11	East	2025-04-18 13:24:06.47984
12	Customer 12	Central	2025-05-09 09:48:35.479846
13	Customer 13	East	2025-10-12 15:40:29.479851
14	Customer 14	North	2024-08-10 20:33:45.479856
15	Customer 15	East	2025-01-21 14:24:24.479861
16	Customer 16	West	2024-08-31 03:40:29.479866
17	Customer 17	West	2026-04-11 16:56:40.479871
18	Customer 18	Central	2024-05-27 03:33:04.479876
19	Customer 19	North	2024-06-01 23:17:11.479881
20	Customer 20	North	2025-06-09 17:36:49.479886
21	Customer 21	West	2025-05-13 21:12:13.479892
22	Customer 22	Central	2025-12-04 03:29:49.479897
23	Customer 23	West	2024-05-19 09:59:20.479903
24	Customer 24	Central	2024-09-08 00:30:56.479908
25	Customer 25	North	2025-06-06 00:43:04.479914
26	Customer 26	Central	2024-07-30 13:36:02.479919
27	Customer 27	West	2025-01-15 12:42:59.479924
28	Customer 28	West	2025-10-21 12:51:13.479929
29	Customer 29	Central	2024-06-02 13:17:10.479935
30	Customer 30	North	2025-08-15 12:37:17.479941
31	Customer 31	South	2025-11-14 09:54:16.479946
32	Customer 32	West	2024-07-27 07:27:05.479952
33	Customer 33	Central	2025-09-25 11:12:07.479958
34	Customer 34	West	2025-02-28 02:46:50.479964
35	Customer 35	North	2025-12-24 20:42:20.47997
36	Customer 36	Central	2024-12-24 08:21:16.479977
37	Customer 37	North	2025-01-01 05:05:02.479982
38	Customer 38	Central	2024-09-17 14:35:43.479988
39	Customer 39	West	2024-07-24 09:58:59.479993
40	Customer 40	West	2024-09-28 18:59:21.479999
41	Customer 41	West	2025-01-08 01:08:16.480005
42	Customer 42	East	2024-10-26 18:16:16.480013
43	Customer 43	East	2025-01-18 07:11:13.480017
44	Customer 44	South	2025-07-08 23:35:34.480021
45	Customer 45	Central	2026-01-21 05:47:17.480026
46	Customer 46	West	2025-11-07 11:43:27.480031
47	Customer 47	West	2025-02-19 23:22:02.480037
48	Customer 48	West	2026-02-09 03:03:05.480042
49	Customer 49	West	2024-08-22 11:54:37.480047
50	Customer 50	Central	2025-03-19 18:56:09.480053
51	Customer 51	East	2025-03-09 20:21:44.480058
52	Customer 52	Central	2024-08-04 02:25:17.480062
53	Customer 53	East	2025-01-21 18:55:07.480065
54	Customer 54	East	2024-05-28 12:05:06.480068
55	Customer 55	South	2024-12-21 05:16:57.480071
56	Customer 56	North	2025-03-05 15:19:49.480075
57	Customer 57	North	2026-01-17 13:29:23.480078
58	Customer 58	West	2025-10-09 08:40:07.480081
59	Customer 59	East	2025-09-08 19:36:10.480084
60	Customer 60	West	2025-07-02 20:39:38.480087
61	Customer 61	North	2024-12-18 09:08:57.480091
62	Customer 62	North	2025-04-20 02:15:27.480094
63	Customer 63	North	2026-03-13 02:43:38.480097
64	Customer 64	North	2024-07-16 05:41:23.4801
65	Customer 65	West	2024-05-28 06:20:18.480103
66	Customer 66	West	2025-07-24 22:45:53.48011
67	Customer 67	Central	2025-12-17 04:37:25.480113
68	Customer 68	Central	2026-03-18 00:19:48.480116
69	Customer 69	West	2025-03-02 11:44:27.480119
70	Customer 70	Central	2024-07-10 02:49:47.480122
71	Customer 71	East	2024-05-12 14:05:24.480126
72	Customer 72	Central	2026-03-01 22:22:04.480129
73	Customer 73	East	2026-02-01 17:15:10.480132
74	Customer 74	North	2025-02-06 18:50:04.480135
75	Customer 75	East	2024-07-01 19:11:22.480138
76	Customer 76	West	2025-10-14 10:22:50.480141
77	Customer 77	East	2024-07-21 16:07:01.480144
78	Customer 78	West	2025-01-21 10:19:14.480149
79	Customer 79	East	2025-08-05 07:38:35.480155
80	Customer 80	West	2025-08-06 19:19:52.481461
81	Customer 81	West	2025-05-04 09:24:37.481473
82	Customer 82	East	2025-10-08 18:43:09.481491
83	Customer 83	East	2025-04-30 00:59:53.481497
84	Customer 84	East	2024-09-21 09:23:19.481503
85	Customer 85	North	2025-08-08 10:30:00.481509
86	Customer 86	Central	2025-08-09 11:25:50.481514
87	Customer 87	West	2025-01-10 09:51:13.481519
88	Customer 88	South	2025-02-22 11:41:12.481525
89	Customer 89	Central	2025-03-31 18:20:58.48153
90	Customer 90	East	2025-02-01 10:21:10.481536
91	Customer 91	East	2025-01-04 01:37:15.481541
92	Customer 92	South	2025-12-10 10:44:11.481549
93	Customer 93	North	2024-10-11 11:45:19.481554
94	Customer 94	South	2024-12-04 01:09:54.481564
95	Customer 95	Central	2024-08-10 00:49:38.481571
96	Customer 96	South	2025-06-14 02:33:20.481583
97	Customer 97	East	2026-03-29 11:22:23.481589
98	Customer 98	East	2026-02-26 08:21:13.481595
99	Customer 99	South	2024-06-28 18:49:36.481601
100	Customer 100	North	2024-09-03 00:26:01.481607
101	Customer 101	West	2025-04-30 04:53:15.481613
102	Customer 102	West	2025-12-18 07:31:00.481619
103	Customer 103	North	2024-08-30 13:13:28.481625
104	Customer 104	South	2025-11-11 15:37:26.481631
105	Customer 105	South	2025-12-12 16:08:05.481636
106	Customer 106	Central	2024-08-10 14:41:42.481642
107	Customer 107	Central	2025-03-19 18:58:03.481648
108	Customer 108	East	2024-08-18 20:36:55.481654
109	Customer 109	Central	2026-02-10 14:09:25.48166
110	Customer 110	South	2024-07-12 03:39:49.481667
111	Customer 111	North	2025-11-04 02:44:56.481673
112	Customer 112	North	2025-11-04 09:30:03.481679
113	Customer 113	Central	2024-12-18 00:54:17.481685
114	Customer 114	East	2025-06-27 11:01:02.481691
115	Customer 115	North	2025-08-17 01:05:41.481698
116	Customer 116	Central	2024-06-05 03:29:24.481705
117	Customer 117	Central	2025-08-25 13:46:33.481711
118	Customer 118	East	2025-11-19 07:53:21.481717
119	Customer 119	East	2024-08-11 10:03:55.481724
120	Customer 120	East	2025-01-19 06:26:47.48173
121	Customer 121	East	2025-02-25 01:23:57.481735
122	Customer 122	West	2025-01-20 07:18:29.481741
123	Customer 123	West	2025-05-17 14:40:30.481746
124	Customer 124	North	2025-08-21 12:02:36.481752
125	Customer 125	Central	2024-08-20 09:07:48.481758
126	Customer 126	East	2024-08-31 08:07:43.481764
127	Customer 127	South	2024-12-17 17:15:03.48177
128	Customer 128	East	2025-10-09 15:28:51.481782
129	Customer 129	West	2026-01-09 18:34:05.481788
130	Customer 130	East	2025-05-19 12:49:37.481795
131	Customer 131	South	2025-05-10 20:12:00.481801
132	Customer 132	East	2024-06-03 21:03:43.481807
133	Customer 133	Central	2026-03-06 19:51:11.481814
134	Customer 134	East	2025-05-17 06:07:06.481821
135	Customer 135	Central	2026-04-11 12:00:57.481827
136	Customer 136	West	2025-02-14 08:43:58.481834
137	Customer 137	East	2024-07-14 18:16:03.48184
138	Customer 138	North	2025-09-17 01:21:23.481846
139	Customer 139	East	2025-01-19 11:25:24.481852
140	Customer 140	North	2024-07-06 14:05:16.481858
141	Customer 141	South	2025-05-29 16:55:56.481863
142	Customer 142	West	2026-01-08 02:02:33.481873
143	Customer 143	North	2024-12-27 06:14:38.481879
144	Customer 144	South	2024-11-18 11:37:59.481885
145	Customer 145	East	2025-02-11 18:26:16.481891
146	Customer 146	West	2024-09-26 05:32:19.481897
147	Customer 147	Central	2024-11-08 10:00:23.481903
148	Customer 148	North	2025-07-04 20:34:32.48191
149	Customer 149	Central	2025-07-14 09:37:45.481916
150	Customer 150	East	2024-08-19 15:14:00.481923
151	Customer 151	South	2025-01-10 16:26:09.481929
152	Customer 152	East	2024-09-24 16:32:02.481935
153	Customer 153	East	2025-10-01 11:40:55.48194
154	Customer 154	West	2025-08-16 20:54:11.481946
155	Customer 155	West	2025-03-18 21:13:41.481952
156	Customer 156	South	2024-11-22 08:47:59.481959
157	Customer 157	Central	2025-05-09 06:00:37.481964
158	Customer 158	West	2025-12-31 16:58:02.48197
159	Customer 159	North	2025-11-16 20:00:50.481975
160	Customer 160	South	2026-01-26 18:06:15.481982
161	Customer 161	East	2024-07-13 11:30:50.481988
162	Customer 162	North	2025-05-11 12:01:57.481993
163	Customer 163	West	2025-05-23 13:10:35.481998
164	Customer 164	West	2024-10-06 08:17:27.482003
165	Customer 165	South	2024-07-05 11:58:13.482009
166	Customer 166	South	2026-01-10 20:49:43.482014
167	Customer 167	North	2025-01-14 04:12:12.48202
168	Customer 168	North	2026-02-24 23:06:28.482025
169	Customer 169	East	2025-04-10 22:29:22.48203
170	Customer 170	South	2024-10-16 20:19:48.482035
171	Customer 171	South	2025-10-21 04:50:52.482042
172	Customer 172	West	2024-07-17 12:41:00.482048
173	Customer 173	Central	2025-11-18 02:26:51.482055
174	Customer 174	East	2024-12-29 01:14:31.482062
175	Customer 175	West	2025-06-22 12:22:21.482069
176	Customer 176	North	2025-01-15 22:19:12.482076
177	Customer 177	West	2025-07-30 19:02:12.482083
178	Customer 178	South	2025-03-15 18:50:16.482089
179	Customer 179	West	2024-09-04 22:20:13.482096
180	Customer 180	East	2026-03-21 12:31:14.482103
181	Customer 181	North	2024-09-10 12:06:44.482109
182	Customer 182	North	2024-07-31 10:24:38.482119
183	Customer 183	East	2025-08-20 14:05:09.482125
184	Customer 184	South	2024-07-01 03:17:15.482132
185	Customer 185	South	2024-07-09 05:58:51.482138
186	Customer 186	North	2025-05-31 19:53:54.482147
187	Customer 187	East	2025-11-30 06:58:13.482154
188	Customer 188	East	2025-02-12 04:44:23.48216
189	Customer 189	Central	2025-04-03 17:23:33.482166
190	Customer 190	East	2025-10-27 00:57:39.482188
191	Customer 191	West	2025-06-14 10:01:10.482195
192	Customer 192	North	2024-12-20 07:46:43.482202
193	Customer 193	South	2024-05-20 10:13:06.482208
194	Customer 194	Central	2025-04-04 07:06:06.482214
195	Customer 195	North	2025-07-16 16:49:02.48222
196	Customer 196	East	2024-05-24 10:13:15.482226
197	Customer 197	Central	2025-03-18 13:33:25.482232
198	Customer 198	South	2024-12-17 09:16:35.482245
199	Customer 199	Central	2025-05-12 14:41:50.482252
200	Customer 200	North	2024-07-01 18:57:47.482258
\.


--
-- TOC entry 5830 (class 0 OID 42961)
-- Dependencies: 318
-- Data for Name: db_metrics_raw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.db_metrics_raw (id, captured_at, active_connections, idle_connections, blocked_queries, deadlocks, avg_query_ms, p95_query_ms) FROM stdin;
\.


--
-- TOC entry 5836 (class 0 OID 42989)
-- Dependencies: 324
-- Data for Name: incident_evidence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident_evidence (id, incident_id, evidence_type, details, created_at) FROM stdin;
2	1	query_analysis_error	Query ID 5: analysis failed - there is no parameter $1\nLINE 1: ...LAIN ANALYZE SELECT ( CASE   WHEN j.proc_schema = $1 AND j.p...\n                                                             ^\n	2026-04-13 14:04:46.94498
3	1	query_analysis_error	Query ID 4: analysis failed - there is no parameter $1\nLINE 1: ...count) FROM( SELECT (  CASE    WHEN proc_schema = $1    AND ...\n                                                             ^\n	2026-04-13 14:04:46.950513
4	1	query_analysis	Query ID 12: Sequential scan detected; Large sort operation detected; Possible missing index	2026-04-13 14:34:17.955054
\.


--
-- TOC entry 5834 (class 0 OID 42979)
-- Dependencies: 322
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incidents (id, title, severity, status, created_at, updated_at, description) FROM stdin;
1	High Active Connections	high	open	2026-04-13 10:50:57.47893	2026-04-13 10:50:57.478954	Active connections exceeded threshold
2	High API Latency	medium	open	2026-04-13 10:50:57.485337	2026-04-13 10:50:57.485339	API latency exceeded threshold
3	High Active Connections	high	open	2026-04-13 14:55:04.60057	2026-04-13 14:55:04.600608	Active connections exceeded threshold
4	High API Latency	medium	open	2026-04-13 14:55:04.613445	2026-04-13 14:55:04.613449	API latency exceeded threshold
5	High Active Connections	high	open	2026-04-13 14:59:13.722311	2026-04-13 14:59:13.722342	Active connections exceeded threshold
6	High API Latency	medium	open	2026-04-13 14:59:13.725153	2026-04-13 14:59:13.725159	API latency exceeded threshold
7	Slow Queries Detected	high	open	2026-04-13 14:59:13.725439	2026-04-13 14:59:13.725439	One or more queries exceeded the execution time threshold
\.


--
-- TOC entry 5827 (class 0 OID 42944)
-- Dependencies: 315
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, product_id, quantity, total_amount, order_status, order_date) FROM stdin;
1	199	45	5	8440	delivered	2025-04-05 13:04:22.487725
2	38	33	2	1884	shipped	2026-01-14 14:46:43.487754
3	198	81	1	1551	cancelled	2025-08-18 15:07:54.487764
4	165	82	4	18896	delivered	2025-01-25 13:36:22.487773
5	121	57	4	2636	delivered	2025-03-02 01:19:28.48778
6	19	40	3	12768	cancelled	2025-08-25 08:53:08.487787
7	166	12	3	2184	cancelled	2025-08-19 15:20:41.487797
8	147	84	1	3784	shipped	2025-10-30 14:25:59.487805
9	116	14	2	1212	delivered	2025-04-13 07:23:50.487812
10	64	91	2	840	cancelled	2025-08-31 17:22:52.48782
11	96	37	2	6162	cancelled	2025-09-15 23:12:53.487839
12	17	43	1	2841	pending	2025-07-01 12:32:13.487854
13	86	11	3	3993	shipped	2024-12-29 22:36:50.487863
14	153	91	4	4624	pending	2025-11-05 16:31:50.487871
15	172	90	3	3438	pending	2025-05-17 12:28:59.487878
16	93	40	3	747	shipped	2024-12-13 03:34:42.48789
17	58	18	4	6688	shipped	2026-03-05 00:01:41.487897
18	198	70	1	4258	pending	2025-05-09 22:59:42.487905
19	153	49	5	5865	shipped	2026-01-20 04:02:47.487912
20	185	57	5	7280	pending	2025-09-14 22:12:45.48792
21	157	37	2	7476	cancelled	2025-12-14 16:41:12.487927
22	95	87	4	6756	cancelled	2025-08-20 00:07:07.487936
23	108	21	5	22100	shipped	2025-02-26 14:47:36.487943
24	165	62	3	1581	delivered	2025-07-04 06:10:37.48795
25	73	11	5	5605	shipped	2025-11-24 18:58:59.487962
26	24	29	2	7366	cancelled	2025-01-15 21:57:30.48797
27	102	65	4	2144	delivered	2025-12-13 21:51:08.487977
28	82	13	2	660	delivered	2025-03-04 05:48:29.487984
29	179	18	3	11910	cancelled	2025-08-26 14:55:34.487992
30	66	28	1	255	shipped	2025-07-06 10:17:58.488
31	199	37	4	4040	shipped	2025-11-10 06:53:16.488007
32	17	15	4	15376	cancelled	2025-06-11 16:54:51.488015
33	62	92	5	24050	shipped	2025-11-14 20:55:52.488023
34	147	54	3	6210	shipped	2025-05-07 12:50:58.48803
35	135	70	3	1962	pending	2025-09-25 18:53:51.488038
36	65	96	4	12632	pending	2025-10-13 07:34:16.488045
37	189	97	1	4866	delivered	2026-02-04 08:33:57.488053
38	200	88	3	4602	cancelled	2025-04-21 18:16:20.488061
39	184	100	2	1232	cancelled	2026-03-26 00:44:29.488069
40	81	40	2	886	cancelled	2025-02-19 16:26:15.488076
41	74	46	1	1665	pending	2025-01-24 13:35:14.488084
42	112	52	1	3114	cancelled	2025-01-09 21:35:20.488092
43	95	67	4	16700	delivered	2025-02-27 07:10:04.488099
44	155	24	1	3627	delivered	2025-10-31 06:51:11.488107
45	115	78	3	7830	cancelled	2026-01-17 11:28:09.488118
46	187	46	4	1784	cancelled	2025-11-23 13:06:28.488126
47	94	66	1	3427	shipped	2024-12-12 09:46:37.488133
48	9	17	5	18445	pending	2025-12-13 13:33:08.488141
49	9	78	4	18984	shipped	2025-04-30 19:33:08.488147
50	147	18	4	2916	delivered	2025-09-21 23:15:14.488154
51	7	95	2	2058	shipped	2025-07-31 17:31:33.48816
52	68	100	5	5320	delivered	2025-04-17 19:42:52.488167
53	52	16	3	12369	shipped	2025-02-01 07:28:20.488181
54	175	41	4	3276	delivered	2025-04-15 07:20:57.488189
55	41	92	3	7671	shipped	2025-03-02 22:24:17.488195
56	36	31	1	1746	cancelled	2026-03-30 22:20:55.488201
57	142	17	3	11784	pending	2026-03-11 00:30:46.488208
58	106	99	4	17624	cancelled	2025-02-15 15:52:23.488214
59	116	60	3	2121	delivered	2026-02-06 16:15:54.48822
60	111	65	2	2314	pending	2025-02-12 06:23:22.488226
61	42	42	3	4344	shipped	2025-10-17 16:59:13.488232
62	51	82	1	2152	delivered	2026-02-07 13:36:52.488238
63	129	83	5	4325	shipped	2025-06-13 15:47:21.488244
64	145	6	5	14325	pending	2026-03-03 08:14:42.488254
65	167	27	5	11340	cancelled	2025-05-31 13:55:00.488261
66	165	39	5	12360	cancelled	2025-12-08 12:31:12.488271
67	177	8	4	2788	shipped	2025-08-30 20:26:02.488279
68	156	19	2	5772	delivered	2025-01-26 11:35:45.488287
69	34	98	3	10098	delivered	2025-07-23 16:50:11.488296
70	32	35	2	7842	cancelled	2025-12-08 05:50:28.488304
71	158	54	3	9738	shipped	2024-12-07 04:04:11.488312
72	49	98	5	13305	shipped	2025-07-31 17:27:00.488321
73	6	12	3	12522	cancelled	2025-07-28 19:41:18.488329
74	13	7	5	14950	delivered	2025-08-02 13:59:38.488337
75	138	2	4	9760	pending	2025-09-05 05:00:15.488345
76	94	6	3	10209	cancelled	2026-03-17 15:21:19.488354
77	74	10	3	13896	cancelled	2025-07-28 19:07:56.488362
78	33	13	3	3219	cancelled	2025-10-03 23:21:08.488373
79	155	66	2	3460	cancelled	2025-07-31 08:54:29.488381
80	122	67	2	5656	cancelled	2026-01-26 13:58:59.488389
81	157	41	2	5572	shipped	2025-09-23 14:08:38.488399
82	87	65	3	14889	cancelled	2025-04-15 15:37:01.488407
83	85	87	1	3117	pending	2025-09-11 15:36:41.488414
84	122	34	1	4989	shipped	2025-04-09 08:19:01.488424
85	162	93	2	8788	cancelled	2026-01-27 12:41:29.488432
86	49	3	5	5000	cancelled	2025-11-03 20:47:05.488441
87	129	100	2	6922	cancelled	2025-01-21 10:10:28.488448
88	54	72	2	8698	delivered	2025-05-08 18:23:07.488457
89	118	69	3	4554	delivered	2025-07-07 22:12:42.488465
90	50	32	3	12198	delivered	2025-07-02 00:42:12.488472
91	177	91	3	5394	cancelled	2025-11-01 18:33:56.48848
92	32	74	3	7371	cancelled	2025-01-09 21:04:09.488489
93	11	37	2	4958	pending	2025-10-17 19:15:15.488497
94	52	69	4	7408	delivered	2024-12-21 16:12:14.488506
95	158	95	2	1988	shipped	2025-12-10 08:13:34.488514
96	164	30	5	9740	pending	2026-02-20 20:34:46.488522
97	175	99	4	3692	shipped	2026-04-10 15:57:21.488531
98	123	84	4	15984	shipped	2025-03-22 00:36:13.488539
99	167	74	1	832	shipped	2025-07-13 10:09:37.488547
100	107	23	1	1534	pending	2025-02-08 21:06:00.488555
101	10	2	2	4942	delivered	2025-06-26 14:49:32.488563
102	117	83	3	7293	cancelled	2025-01-13 05:01:59.488572
103	50	15	4	9340	delivered	2026-01-19 10:26:50.488581
104	4	95	3	4875	delivered	2025-03-05 00:19:48.488589
105	157	82	2	3074	cancelled	2025-02-13 20:24:11.4886
106	172	13	1	3383	shipped	2026-01-31 18:35:32.488608
107	67	50	2	310	shipped	2025-08-28 01:35:12.488615
108	3	34	5	23965	delivered	2025-04-24 02:52:49.488624
109	79	21	1	3912	cancelled	2025-04-26 16:56:34.488632
110	164	38	3	3183	delivered	2025-06-03 02:42:23.48864
111	117	96	4	5416	delivered	2025-09-12 11:20:33.488648
112	171	28	4	18012	shipped	2025-04-29 14:00:41.488656
113	115	68	1	4404	delivered	2026-03-04 15:49:28.488663
114	52	74	5	21200	shipped	2026-01-18 23:01:58.488673
115	175	27	4	4208	cancelled	2026-02-25 17:27:40.488681
116	34	66	1	3814	cancelled	2025-08-22 15:52:56.488688
117	186	3	4	10496	cancelled	2025-12-04 09:09:18.488696
118	12	55	5	3490	delivered	2025-04-20 07:22:28.488703
119	9	37	1	3967	cancelled	2026-01-11 05:06:50.488711
120	98	58	4	12668	cancelled	2025-10-03 07:12:49.48872
121	168	45	5	5945	pending	2026-01-11 16:30:58.488728
122	1	97	2	3848	pending	2024-11-29 00:26:48.488736
123	137	49	5	17870	shipped	2025-12-07 19:34:22.488745
124	186	98	3	4932	pending	2026-03-27 12:29:52.488752
125	53	9	1	2071	pending	2025-06-13 08:27:53.488759
126	190	6	1	2104	cancelled	2025-09-01 02:22:18.488772
127	129	38	1	1247	shipped	2025-02-19 10:20:11.48878
128	198	87	5	24990	delivered	2025-12-13 00:00:22.488792
129	106	39	5	9550	delivered	2026-03-12 16:18:35.488798
130	143	64	2	7198	pending	2024-12-01 22:14:49.488804
131	82	90	4	17584	cancelled	2025-09-16 05:37:07.48881
132	122	31	2	9012	shipped	2025-11-10 11:46:40.488816
133	144	53	4	2288	cancelled	2025-07-01 17:48:07.488823
134	53	43	2	4376	pending	2024-12-26 19:02:08.488829
135	186	25	1	4487	pending	2025-11-26 21:12:53.488836
136	19	25	5	2115	shipped	2025-08-11 03:00:33.488843
137	4	28	3	7749	shipped	2024-12-06 10:48:44.488849
138	179	78	4	8348	shipped	2025-09-22 02:21:11.488856
139	120	69	3	9654	delivered	2025-11-07 01:32:59.488863
140	26	93	4	15668	cancelled	2025-03-19 22:58:18.488869
141	106	6	3	7989	shipped	2025-03-30 05:55:15.488877
142	149	93	5	24420	cancelled	2025-11-13 05:44:10.488886
143	146	32	2	6422	cancelled	2025-07-05 13:13:10.488893
144	186	83	3	12306	cancelled	2025-08-21 04:09:41.488901
145	36	93	3	4458	cancelled	2026-01-08 16:15:28.488908
146	20	86	5	1885	pending	2025-03-18 09:30:23.488916
147	182	20	2	1312	pending	2025-12-22 17:27:08.488924
148	169	63	1	4058	pending	2026-04-09 16:21:05.488932
149	136	93	1	237	delivered	2025-07-13 00:54:59.488939
150	28	13	4	6272	shipped	2025-12-11 03:16:58.48895
151	69	51	3	9009	pending	2025-10-03 21:26:55.488957
152	77	88	2	3900	pending	2025-05-13 13:08:29.488962
153	98	49	1	3420	cancelled	2026-03-15 13:55:47.488968
154	128	56	2	1554	delivered	2025-06-28 05:58:58.488977
155	55	89	1	1982	cancelled	2025-11-26 07:57:27.488984
156	145	85	3	13644	pending	2026-01-11 23:55:18.488992
157	193	92	5	6405	cancelled	2024-12-24 07:37:21.488998
158	146	50	5	10345	delivered	2025-09-28 10:47:41.489007
159	191	45	1	4202	pending	2026-02-21 20:41:38.489014
160	155	99	1	2890	cancelled	2024-12-02 23:54:51.489021
161	126	30	3	11370	delivered	2025-07-03 21:29:20.489029
162	22	99	5	16065	delivered	2025-03-01 02:11:27.489039
163	40	49	1	2295	shipped	2025-03-30 21:36:08.489046
164	2	40	1	849	cancelled	2025-10-11 01:50:23.489053
165	111	58	1	1635	cancelled	2026-02-20 09:51:09.489062
166	153	77	5	4310	delivered	2025-01-25 21:56:13.489069
167	200	11	4	13104	shipped	2025-06-24 17:45:48.489077
168	36	35	4	5952	delivered	2025-11-26 18:47:27.489084
169	71	54	2	7320	delivered	2025-08-09 07:33:15.48909
170	153	79	2	8322	shipped	2025-08-22 06:48:12.489098
171	86	80	1	3341	cancelled	2025-02-25 23:28:10.489105
172	35	39	4	19876	delivered	2025-06-08 11:44:01.489114
173	102	41	3	4665	delivered	2025-04-01 11:16:00.489122
174	84	49	5	10425	delivered	2025-02-18 21:33:24.489131
175	152	70	5	8680	shipped	2025-04-28 16:54:45.489139
176	113	38	4	7268	pending	2025-02-17 20:13:00.489146
177	62	33	2	5160	shipped	2025-04-11 20:06:07.489154
178	154	62	1	3778	cancelled	2025-07-13 16:56:33.489161
179	10	47	4	18212	pending	2026-02-17 02:13:49.48917
180	166	79	3	4386	pending	2025-06-28 13:12:50.489178
181	111	14	4	11264	pending	2026-02-22 01:41:59.489187
182	149	89	5	23355	shipped	2025-08-27 22:31:02.489195
183	39	45	5	20995	pending	2025-08-09 06:38:05.489203
184	187	19	1	1050	delivered	2025-11-04 23:26:41.489211
185	124	45	2	8736	cancelled	2026-02-22 19:09:47.48922
186	18	39	4	10848	pending	2025-02-22 11:49:30.489229
187	174	22	3	2985	shipped	2025-07-23 04:21:21.489238
188	110	60	3	14058	shipped	2025-02-28 21:16:20.489245
189	102	4	2	7280	shipped	2025-08-25 15:29:07.489253
190	53	36	1	1859	pending	2025-06-22 06:04:36.489261
191	94	42	5	8155	shipped	2025-08-22 06:39:49.489268
192	164	41	4	17692	cancelled	2025-06-04 21:19:24.489277
193	118	80	3	8949	shipped	2025-02-20 12:10:40.489285
194	22	87	3	14802	shipped	2025-11-04 06:41:12.489293
195	96	89	1	1599	shipped	2025-07-25 21:29:53.489301
196	99	55	2	9616	shipped	2025-08-06 13:21:47.489307
197	43	63	2	9290	delivered	2026-02-01 04:35:38.489315
198	92	2	4	2156	cancelled	2026-02-03 03:04:07.489323
199	168	64	5	21200	cancelled	2025-04-27 18:29:46.489331
200	43	11	4	16412	pending	2025-03-02 02:38:29.489339
201	138	37	3	5823	shipped	2025-03-09 19:19:44.489349
202	131	15	4	18412	pending	2025-11-26 16:04:08.489359
203	195	93	5	2200	cancelled	2025-07-08 03:29:25.489368
204	9	58	2	5076	delivered	2025-10-17 07:27:36.489377
205	54	95	1	2041	delivered	2025-01-27 11:16:51.489385
206	158	18	4	5836	shipped	2025-02-21 03:05:28.489393
207	137	36	5	14865	shipped	2025-10-29 11:38:13.489401
208	132	87	5	11450	pending	2026-02-02 19:58:28.48941
209	180	17	3	3417	shipped	2026-01-28 11:35:38.48942
210	126	19	2	6634	delivered	2025-05-26 20:32:03.489428
211	104	66	1	862	delivered	2025-04-22 22:27:00.489436
212	1	100	3	14601	pending	2025-04-03 19:15:49.489444
213	137	51	3	1854	shipped	2024-12-03 20:04:18.489452
214	83	37	4	9196	delivered	2025-07-06 15:47:55.48946
215	175	98	4	11660	pending	2026-03-21 06:15:41.489468
216	32	21	4	932	cancelled	2025-08-23 09:29:19.489476
217	41	36	2	5144	pending	2025-05-12 22:40:26.489485
218	14	51	3	4365	delivered	2025-04-06 11:08:17.489493
219	181	13	4	3388	pending	2025-12-24 18:52:23.489501
220	133	88	5	9760	cancelled	2026-04-09 09:12:10.48951
221	178	17	1	3559	cancelled	2026-03-08 02:32:26.489517
222	81	48	1	945	delivered	2026-02-01 21:06:39.489525
223	18	68	2	2540	pending	2025-06-04 13:46:03.489533
224	161	96	3	5535	shipped	2024-12-28 20:16:48.489541
225	23	13	4	7516	shipped	2025-03-24 06:18:45.489549
226	110	41	4	11916	shipped	2025-12-08 01:15:26.489557
227	154	77	2	9266	delivered	2025-03-10 11:54:37.489566
228	133	78	3	5349	shipped	2025-03-26 21:37:50.489573
229	127	50	1	2060	pending	2025-12-10 18:15:53.489581
230	4	47	1	4427	delivered	2026-02-04 21:00:38.48959
231	94	70	5	17735	shipped	2025-03-18 18:07:27.489597
232	18	2	1	4911	delivered	2025-12-24 07:57:28.489605
233	74	81	4	17000	cancelled	2025-09-08 11:31:26.489612
234	158	20	5	22520	delivered	2026-03-02 00:50:59.489621
235	138	42	2	2744	cancelled	2025-06-16 13:07:38.489628
236	179	56	1	2640	shipped	2026-03-15 02:50:32.489636
237	117	79	4	4200	pending	2025-11-05 12:08:49.489644
238	4	91	2	2156	shipped	2025-04-19 09:46:00.489651
239	133	93	3	13152	delivered	2026-01-17 22:47:44.489659
240	198	4	3	3201	delivered	2025-02-23 20:38:58.489667
241	183	74	1	2254	pending	2025-08-01 19:24:08.489673
242	146	22	1	4192	delivered	2026-01-23 01:07:25.489679
243	59	95	5	5220	pending	2026-03-22 09:41:29.489686
244	99	20	4	12324	shipped	2024-12-23 08:20:40.489694
245	83	32	4	7756	cancelled	2024-12-30 10:36:14.489702
246	96	16	1	4782	pending	2026-01-12 02:04:58.489709
247	18	60	1	3384	delivered	2025-03-13 00:36:26.489718
248	3	48	5	19205	shipped	2025-11-14 15:06:12.489726
249	119	48	5	10435	cancelled	2025-03-14 03:09:34.489734
250	39	1	5	10540	cancelled	2026-04-01 02:22:09.489742
251	1	98	1	2844	cancelled	2025-02-02 10:10:12.48975
252	136	31	1	1780	cancelled	2025-08-05 08:46:46.489758
253	12	30	3	2586	cancelled	2025-04-19 22:26:44.489766
254	25	65	1	4857	shipped	2025-05-21 21:51:54.489774
255	112	85	5	3050	shipped	2025-12-13 00:39:37.489783
256	180	95	3	9957	delivered	2025-11-01 19:39:17.489791
257	35	100	1	1760	pending	2026-01-24 06:46:03.489799
258	105	16	4	10688	delivered	2024-12-06 03:28:12.489807
259	31	12	4	9080	shipped	2025-02-23 12:36:39.489817
260	56	42	5	2150	shipped	2026-02-25 11:41:09.489827
261	13	87	4	17224	delivered	2025-12-01 04:55:06.489834
262	192	71	4	18616	shipped	2026-02-23 19:49:40.489841
263	4	8	2	2188	shipped	2026-02-06 03:04:06.489849
264	150	76	3	2364	delivered	2024-12-30 07:55:27.489857
265	33	12	2	7464	delivered	2026-02-10 08:27:28.489865
266	111	93	2	9602	cancelled	2025-08-02 09:31:48.489873
267	91	28	4	6060	shipped	2025-11-24 01:27:35.489881
268	158	80	2	766	shipped	2025-05-17 00:25:05.489888
269	16	12	5	20120	delivered	2025-09-29 05:30:19.489896
270	162	70	5	10705	pending	2025-09-29 11:34:01.489905
271	89	73	5	20350	delivered	2025-09-27 01:45:30.489913
272	57	4	3	14973	delivered	2026-03-14 18:23:09.489922
273	41	13	5	10030	shipped	2025-05-12 02:38:57.489931
274	148	50	1	1897	delivered	2024-12-21 04:45:16.489939
275	189	90	5	13525	delivered	2024-12-31 15:54:46.489947
276	145	19	3	14250	shipped	2025-02-08 18:22:12.489955
277	10	12	2	8234	pending	2025-12-14 14:42:30.489964
278	1	43	5	20075	shipped	2025-02-25 05:34:46.489972
279	16	3	2	5500	shipped	2025-06-16 10:58:22.48998
280	94	10	1	4411	delivered	2025-04-17 12:30:54.489989
281	78	42	1	2857	shipped	2024-11-30 04:10:04.489997
282	45	91	4	10796	delivered	2025-12-19 12:18:39.490005
283	79	94	2	6398	delivered	2026-02-07 04:10:31.490013
284	198	73	5	16535	pending	2026-01-09 14:35:33.490022
285	164	73	5	9545	pending	2024-12-19 18:47:10.49003
286	89	41	1	2049	shipped	2025-05-23 07:03:46.490038
287	3	34	3	11274	shipped	2025-12-06 11:52:09.490047
288	185	1	3	2955	pending	2025-09-27 19:10:05.490055
289	127	49	2	6982	delivered	2025-07-07 21:49:38.490064
290	167	98	4	19340	shipped	2026-01-19 19:51:40.490072
291	6	41	1	2515	delivered	2024-12-12 06:52:10.49008
292	42	94	2	6350	pending	2025-07-07 07:34:53.490088
293	181	4	5	20270	cancelled	2024-12-16 13:45:53.490097
294	14	13	4	5544	delivered	2025-12-29 03:29:47.490104
295	68	85	5	22620	delivered	2025-11-12 02:50:28.490111
296	141	63	4	19132	shipped	2026-03-16 22:56:04.490118
297	170	81	1	2512	cancelled	2026-01-01 06:55:18.490126
298	21	61	2	4980	pending	2025-11-06 21:26:00.490135
299	165	70	3	2538	cancelled	2026-01-08 22:00:07.490142
300	115	6	3	4884	delivered	2025-08-30 19:40:17.490149
301	16	20	3	14166	pending	2026-02-28 12:33:40.490157
302	194	76	5	17455	shipped	2025-07-04 08:03:07.490165
303	138	88	5	17645	cancelled	2025-06-24 02:26:12.490172
304	183	5	1	3334	shipped	2026-02-10 19:45:21.490188
305	33	6	2	3356	cancelled	2026-03-03 12:29:19.490195
306	67	41	2	9948	pending	2026-02-27 21:21:06.490201
307	71	67	5	13855	cancelled	2024-12-30 09:05:47.490208
308	134	54	5	24565	pending	2025-09-13 05:46:55.490216
309	195	13	5	24365	pending	2025-06-29 06:06:13.490224
310	106	34	5	14580	cancelled	2025-05-12 18:19:53.490234
311	45	36	4	1624	cancelled	2026-01-29 14:17:48.490241
312	102	43	4	1668	shipped	2026-03-18 10:25:33.490247
313	6	44	3	9453	delivered	2025-11-05 01:03:00.490254
314	35	39	1	1967	cancelled	2025-03-12 23:38:45.490261
315	49	57	4	3324	shipped	2024-12-31 20:09:00.490269
316	15	66	5	15815	shipped	2026-03-11 00:10:59.490278
317	200	68	4	4844	pending	2026-01-15 02:59:38.490286
318	64	5	2	1144	cancelled	2026-03-18 22:11:19.490296
319	119	65	3	9351	cancelled	2025-05-23 06:13:30.490303
320	126	77	2	6302	cancelled	2026-01-12 18:18:56.490311
321	42	34	3	8760	pending	2025-11-19 09:32:28.49032
322	200	28	2	9574	shipped	2025-05-17 02:13:18.490327
323	132	3	3	10362	pending	2025-08-14 05:15:20.490335
324	58	33	5	845	delivered	2025-04-13 11:15:14.490342
325	90	59	4	12736	delivered	2025-12-22 19:36:48.490349
326	150	14	5	16765	pending	2025-07-25 12:02:38.490355
327	166	77	3	14097	delivered	2025-11-11 12:50:01.490362
328	71	82	1	2854	delivered	2025-01-27 01:39:50.490368
329	39	67	3	4929	shipped	2025-01-08 08:04:37.490374
330	170	41	5	17050	shipped	2025-04-09 09:15:00.490382
331	108	52	3	6675	cancelled	2025-04-01 08:18:46.49039
332	88	93	5	8275	shipped	2025-04-26 16:15:41.490398
333	130	39	4	12144	shipped	2025-02-06 11:59:56.490421
334	25	61	2	5012	shipped	2025-03-30 01:09:40.490429
335	175	43	5	7995	pending	2025-12-20 22:41:44.490438
336	85	48	3	10632	delivered	2025-06-18 00:26:37.490446
337	14	82	1	3954	pending	2025-08-15 03:24:24.490455
338	77	53	4	17760	pending	2025-01-23 05:48:19.490464
339	146	59	3	10356	shipped	2025-11-02 11:44:42.490473
340	86	81	1	4094	shipped	2025-11-03 13:53:31.49048
341	54	98	4	9360	shipped	2025-06-22 04:24:41.490487
342	158	56	1	1160	cancelled	2025-09-18 20:26:07.490495
343	137	26	1	409	delivered	2024-12-13 08:59:11.490503
344	5	87	5	8305	pending	2025-05-27 10:41:17.49051
345	34	14	3	7968	cancelled	2025-07-29 15:37:21.490517
346	77	38	1	474	cancelled	2025-04-05 17:17:58.490525
347	176	18	3	10956	delivered	2025-01-06 18:33:43.490533
348	104	3	2	2900	shipped	2025-12-19 10:48:18.490541
349	130	22	1	4930	pending	2025-10-07 11:14:41.490548
350	164	33	1	3173	pending	2025-06-13 08:14:25.490556
351	177	15	1	495	cancelled	2025-08-28 21:48:56.490563
352	180	20	3	11958	shipped	2025-04-22 12:16:31.490572
353	170	13	3	10641	delivered	2025-05-29 14:12:23.490579
354	131	93	4	3836	pending	2025-11-20 06:06:25.490587
355	156	26	4	6908	delivered	2025-02-11 17:44:09.490594
356	42	6	4	10076	cancelled	2025-01-02 03:11:32.490602
357	61	1	4	11232	pending	2025-05-05 06:58:24.490612
358	39	12	5	20735	pending	2025-04-07 10:49:34.490619
359	117	38	3	5979	delivered	2025-08-19 08:49:39.490627
360	75	47	2	846	delivered	2025-09-06 10:49:25.490636
361	36	85	1	179	shipped	2025-10-26 21:59:03.490644
362	188	12	5	11485	delivered	2025-02-19 23:45:24.490651
363	117	35	4	13512	cancelled	2025-04-24 18:05:05.490658
364	34	90	2	2052	pending	2024-12-17 04:50:05.490665
365	146	87	5	20270	cancelled	2026-01-10 14:31:42.490672
366	176	94	3	1008	shipped	2025-08-08 18:48:35.49068
367	12	9	4	14840	delivered	2025-05-12 23:55:46.490688
368	186	73	5	24115	shipped	2024-11-28 12:01:10.490696
369	177	90	5	21925	pending	2025-09-03 12:10:16.490704
370	170	87	4	11728	cancelled	2026-01-26 15:58:52.490712
371	165	21	1	195	cancelled	2025-01-31 18:01:21.490719
372	83	31	1	4127	delivered	2024-12-03 01:52:59.490726
373	165	49	2	9218	cancelled	2025-02-19 02:51:02.490733
374	115	12	4	19176	cancelled	2025-08-27 23:49:00.49074
375	104	53	1	940	pending	2025-07-01 16:55:39.490746
376	131	72	1	2595	shipped	2025-05-12 12:27:10.490755
377	58	59	3	1632	delivered	2025-06-30 14:18:01.490762
378	30	13	3	11421	shipped	2026-04-11 23:33:38.490769
379	134	48	3	13758	pending	2026-03-21 04:25:23.490776
380	66	79	4	3904	shipped	2026-01-07 05:56:37.490783
381	118	25	4	7464	delivered	2026-02-16 20:53:32.49079
382	198	58	5	5545	cancelled	2025-05-10 15:24:23.490795
383	136	95	4	540	pending	2025-07-03 20:02:54.4908
384	200	23	4	17056	shipped	2025-04-04 05:50:07.490804
385	130	50	5	13680	cancelled	2025-06-05 11:08:16.490808
386	88	38	3	10077	cancelled	2025-02-25 05:48:05.490813
387	77	90	5	21480	delivered	2025-04-13 09:56:56.490817
388	54	80	2	3490	delivered	2025-04-26 21:57:48.490821
389	129	70	2	3112	delivered	2025-04-15 06:08:09.490826
390	150	74	5	20175	cancelled	2025-05-02 09:58:38.490834
391	109	2	5	12210	pending	2026-03-31 21:47:28.490839
392	69	97	1	1737	shipped	2025-11-17 12:40:22.490843
393	53	97	1	2517	pending	2025-10-11 19:49:52.490848
394	191	83	5	9685	cancelled	2025-12-12 17:05:41.490852
395	98	50	3	1452	cancelled	2024-12-09 12:35:56.490857
396	191	33	1	206	shipped	2025-05-30 19:03:17.490862
397	140	95	3	14760	shipped	2025-03-11 10:44:13.490867
398	175	10	4	6212	shipped	2024-12-07 04:08:59.490876
399	11	55	1	3190	delivered	2025-07-03 01:48:21.490882
400	2	43	5	10945	cancelled	2025-04-15 05:54:22.490889
401	14	100	3	14967	delivered	2025-08-04 15:21:09.490896
402	135	29	1	2703	shipped	2025-07-21 07:05:59.490905
403	140	69	2	7014	cancelled	2026-02-24 22:41:35.49091
404	85	47	2	5636	delivered	2025-12-22 14:23:01.490914
405	30	86	5	860	delivered	2025-08-28 01:58:50.490919
406	11	88	5	10485	delivered	2025-09-30 06:32:15.490923
407	7	67	5	12080	delivered	2025-07-23 17:28:00.490927
408	167	25	1	2528	delivered	2025-07-24 07:50:21.490932
409	2	81	5	22340	pending	2025-12-26 12:15:42.490936
410	27	27	2	7150	cancelled	2025-05-17 07:08:48.490941
411	118	92	2	588	delivered	2026-03-25 07:52:28.490945
412	143	10	2	4326	shipped	2025-01-02 01:30:07.490949
413	111	41	4	13652	pending	2025-09-25 12:48:57.490955
414	194	96	1	618	pending	2025-04-20 07:33:32.490962
415	75	88	5	4845	delivered	2025-06-07 07:37:43.490971
416	102	85	4	12896	pending	2025-08-14 04:22:17.490979
417	140	38	2	6606	shipped	2025-11-11 11:59:33.490983
418	142	72	3	573	shipped	2026-02-09 08:55:55.490988
419	138	71	5	16640	pending	2025-11-08 03:08:44.490992
420	106	83	3	5502	shipped	2026-01-21 04:41:52.490997
421	30	24	3	5073	pending	2025-02-01 16:26:50.491002
422	75	86	5	3495	pending	2025-12-06 06:43:45.491006
423	85	46	5	20455	shipped	2025-05-04 13:41:25.491011
424	50	41	3	2013	cancelled	2025-08-25 23:16:49.491015
425	40	73	3	14655	delivered	2025-02-23 23:29:21.49102
426	64	29	1	2665	cancelled	2025-11-22 22:47:48.491024
427	119	58	3	12093	delivered	2025-03-13 00:24:56.491028
428	166	78	1	1539	pending	2025-02-07 01:01:39.491033
429	51	34	2	9024	pending	2025-04-06 06:59:30.491037
430	149	75	5	1775	cancelled	2025-03-15 15:42:33.491042
431	67	70	1	4618	cancelled	2025-05-14 05:33:06.491046
432	188	38	2	9860	shipped	2025-08-18 17:24:26.49105
433	129	2	4	12320	shipped	2025-02-02 14:13:21.491055
434	115	21	5	6245	shipped	2025-06-27 15:13:36.491059
435	92	6	2	8120	shipped	2025-03-19 18:42:27.491064
436	60	6	3	9378	shipped	2025-07-21 22:32:01.491069
437	11	84	4	1920	delivered	2026-02-19 11:22:51.491073
438	149	70	3	6771	shipped	2025-10-02 13:32:08.491077
439	133	33	5	3685	cancelled	2024-12-01 02:23:06.491082
440	125	62	3	8778	pending	2025-07-31 05:28:21.491087
441	132	83	2	1462	delivered	2025-12-26 05:45:21.491092
442	170	30	3	3207	cancelled	2025-02-21 23:10:24.491096
443	123	27	4	16088	shipped	2025-05-16 20:55:16.4911
444	147	76	1	1147	shipped	2026-02-03 13:24:29.491106
445	15	22	5	6515	delivered	2024-12-27 04:23:06.491111
446	164	3	5	23585	delivered	2024-12-15 07:43:03.491115
447	124	22	5	19805	shipped	2025-02-11 20:18:22.491119
448	160	85	5	7945	delivered	2026-01-17 10:13:10.491124
449	152	9	4	19944	shipped	2025-10-01 21:48:25.491128
450	134	65	1	1757	cancelled	2025-02-14 05:18:25.491133
451	158	77	2	7996	pending	2025-01-18 16:23:43.491137
452	124	85	1	863	shipped	2025-01-06 14:21:39.491141
453	134	54	1	3634	delivered	2025-01-21 08:11:58.491146
454	124	99	4	7916	cancelled	2025-10-15 15:04:44.491151
455	109	18	5	4500	delivered	2025-08-12 01:57:37.491155
456	154	70	1	2420	cancelled	2025-12-03 03:55:46.49116
457	134	16	1	4834	pending	2025-10-02 13:42:47.491164
458	93	14	3	10347	shipped	2025-09-06 13:19:15.491168
459	109	73	3	13473	delivered	2025-06-04 01:13:06.491173
460	142	72	2	6970	cancelled	2026-01-11 22:20:56.491177
461	79	74	4	8712	delivered	2025-03-12 11:30:44.491181
462	192	30	2	2150	cancelled	2025-03-08 11:46:25.491187
463	103	44	2	8528	pending	2026-01-20 21:16:31.491191
464	121	77	1	1290	cancelled	2026-02-27 07:40:17.491195
465	156	5	3	2265	cancelled	2024-12-22 21:16:50.4912
466	183	77	5	12230	pending	2024-12-15 04:16:00.491204
467	52	85	4	748	delivered	2026-01-04 08:05:53.491208
468	179	30	5	21625	shipped	2025-05-03 08:33:16.491212
469	23	36	1	1389	cancelled	2025-10-14 12:31:06.491217
470	133	2	5	8700	pending	2024-12-29 07:21:13.491221
471	90	45	5	24375	delivered	2025-12-18 14:44:02.491225
472	2	34	4	19236	shipped	2025-09-16 17:49:56.49123
473	76	44	1	4221	pending	2025-02-25 17:39:35.491234
474	65	89	5	24045	cancelled	2024-12-04 21:20:01.491239
475	199	59	2	5764	cancelled	2025-01-08 15:01:30.491244
476	67	9	4	4208	cancelled	2025-05-24 02:12:47.491248
477	106	46	2	5372	pending	2025-04-20 01:41:13.491252
478	173	96	1	3368	delivered	2026-03-05 15:57:20.491256
479	91	28	4	10684	delivered	2026-01-09 10:12:32.49126
480	189	26	2	8374	shipped	2025-04-02 02:01:15.491265
481	52	32	2	3954	delivered	2026-01-24 06:48:33.491269
482	158	1	1	4135	pending	2025-02-02 18:32:52.491274
483	148	36	3	12399	cancelled	2026-01-09 17:39:06.491278
484	33	7	2	9648	cancelled	2025-08-11 16:53:59.491283
485	176	100	3	9975	shipped	2025-08-22 06:11:58.491291
486	177	2	4	10740	pending	2025-05-03 03:31:54.491298
487	93	79	1	2765	delivered	2026-01-07 16:40:16.491304
488	157	44	3	11883	delivered	2026-01-08 18:29:18.491309
489	94	52	4	12596	delivered	2025-08-26 04:20:23.491313
490	26	93	5	9860	delivered	2025-02-26 02:21:04.491317
491	38	95	4	6824	shipped	2025-08-14 09:45:05.491322
492	162	67	4	4804	delivered	2025-03-06 18:37:15.491327
493	13	51	5	23755	pending	2025-04-25 04:53:18.491332
494	162	13	3	12009	cancelled	2025-03-27 23:40:08.491336
495	143	33	3	14070	delivered	2026-04-02 20:49:09.491341
496	148	74	5	8645	shipped	2025-03-10 00:34:11.491345
497	199	95	5	20465	cancelled	2025-01-13 07:31:52.49135
498	162	19	3	11697	shipped	2025-05-20 23:29:51.491354
499	104	10	5	23910	pending	2026-01-20 23:42:11.491358
500	182	35	3	7458	cancelled	2025-11-25 19:06:36.491362
501	134	58	3	14724	cancelled	2026-01-18 04:02:30.491366
502	170	33	2	4044	pending	2025-12-27 04:31:25.491371
503	122	71	1	622	pending	2026-03-30 21:22:43.491375
504	68	80	1	951	shipped	2026-02-28 12:56:35.491379
505	59	32	4	10536	delivered	2025-08-29 13:48:23.491383
506	8	5	5	7485	delivered	2025-01-27 23:01:01.491387
507	70	71	4	18112	cancelled	2026-02-02 11:22:20.491392
508	117	81	5	24975	cancelled	2025-07-18 13:15:57.491397
509	124	70	3	8832	shipped	2025-02-25 07:28:12.491401
510	67	20	3	10428	delivered	2026-04-08 09:22:39.491406
511	74	61	2	5834	pending	2025-04-25 18:08:01.49141
512	197	56	3	522	delivered	2025-06-12 02:06:31.491415
513	49	53	5	15800	cancelled	2025-09-23 02:45:46.49142
514	57	34	4	12796	pending	2025-09-08 13:40:58.491425
515	73	84	5	11635	delivered	2025-09-14 03:02:27.491429
516	75	15	2	2438	cancelled	2025-05-31 19:38:47.491433
517	49	42	5	20650	pending	2026-01-26 08:22:30.491437
518	73	35	2	1874	shipped	2025-04-11 19:10:31.491442
519	39	2	2	1676	cancelled	2025-12-22 23:30:12.491446
520	119	90	4	12568	pending	2025-10-26 07:02:43.49145
521	69	100	2	1118	cancelled	2026-03-07 16:26:20.491454
522	98	2	2	4296	pending	2024-11-30 11:41:07.491459
523	189	5	4	8496	shipped	2025-08-20 10:07:25.491463
524	122	50	5	9035	delivered	2024-12-19 23:45:51.491467
525	134	16	1	4602	delivered	2025-08-09 13:37:19.491471
526	171	28	3	1578	pending	2025-12-13 13:29:11.491477
527	71	75	1	1471	pending	2025-09-23 02:56:29.491481
528	177	77	5	19965	shipped	2025-10-05 07:41:21.491485
529	176	80	4	3392	delivered	2024-12-22 13:53:28.491489
530	180	69	3	4080	pending	2026-02-07 18:42:11.491494
531	113	94	5	14725	shipped	2026-04-02 11:32:09.491498
532	11	63	2	4306	cancelled	2025-07-01 00:21:47.491503
533	146	24	4	6616	delivered	2025-10-29 10:27:14.491507
534	42	9	5	23210	shipped	2025-08-26 00:04:15.491512
535	117	1	5	15535	cancelled	2025-04-03 04:00:30.491516
536	199	80	5	15410	shipped	2025-10-30 10:51:49.49152
537	49	68	5	16370	cancelled	2025-03-16 16:46:52.491525
538	105	83	3	8226	delivered	2026-02-16 06:22:49.491529
539	34	23	1	458	pending	2025-12-31 06:25:19.491533
540	147	83	1	360	cancelled	2025-05-11 18:22:52.491537
541	13	47	5	10980	shipped	2025-06-06 11:52:31.491541
542	21	60	2	8250	pending	2025-10-10 16:08:35.491548
543	182	8	4	12492	delivered	2025-07-17 08:10:27.491554
544	56	67	3	2214	pending	2026-02-20 10:41:57.49156
545	50	68	4	6608	shipped	2025-06-25 13:44:56.491566
546	192	14	5	17505	delivered	2025-05-02 19:11:49.491573
547	43	24	4	3808	cancelled	2025-07-28 23:14:21.491578
548	91	41	5	18645	delivered	2025-02-04 22:29:43.491585
549	156	31	4	10996	shipped	2025-10-02 15:56:44.491591
550	116	58	3	9147	cancelled	2026-04-12 10:54:13.491597
551	133	18	5	1165	delivered	2026-04-10 00:42:18.491603
552	198	89	3	831	delivered	2024-12-28 16:23:56.491616
553	40	13	5	23910	pending	2025-08-20 22:47:23.491622
554	150	32	3	9321	shipped	2025-12-03 00:50:55.491628
555	56	94	4	19044	pending	2025-04-07 23:06:01.491634
556	177	90	2	8198	pending	2025-06-12 13:37:29.49164
557	21	100	5	16125	pending	2024-12-27 23:33:35.491645
558	31	99	4	14048	shipped	2025-03-26 13:01:53.491651
559	14	40	1	3233	pending	2025-10-31 16:20:22.491657
560	179	29	3	12645	shipped	2026-03-18 12:10:06.491663
561	148	65	4	19900	pending	2025-12-20 20:37:41.491669
562	34	44	4	5248	pending	2025-08-12 15:09:28.491675
563	68	11	5	16850	cancelled	2025-07-30 20:06:47.491682
564	124	72	2	2408	shipped	2025-08-06 21:14:55.491689
565	158	95	2	9394	shipped	2025-12-10 07:38:42.491696
566	176	74	4	10996	pending	2026-02-14 12:30:04.491704
567	49	42	3	8859	delivered	2025-06-12 13:54:42.491709
568	90	79	3	4458	cancelled	2025-05-29 05:28:29.491716
569	176	48	2	3470	shipped	2025-03-21 10:02:26.491724
570	63	80	1	546	shipped	2025-01-24 00:56:10.491732
571	116	61	1	2599	pending	2025-10-26 03:08:57.49174
572	140	67	2	3538	delivered	2025-07-06 18:16:45.491752
573	97	75	2	500	pending	2025-12-04 04:53:13.491761
574	14	60	2	4644	pending	2026-03-09 21:14:14.49177
575	5	38	3	2949	cancelled	2025-12-15 21:23:46.491778
576	125	77	1	2684	pending	2026-01-08 03:24:02.491787
577	11	32	5	1380	delivered	2025-10-24 18:30:44.491797
578	89	88	2	500	delivered	2025-10-13 13:37:16.491805
579	16	81	5	11795	delivered	2025-01-18 20:59:39.491813
580	72	29	1	4646	shipped	2025-10-20 21:14:23.491856
581	134	87	1	3231	shipped	2025-09-12 02:20:22.491881
582	155	43	4	10636	cancelled	2025-07-10 05:42:50.491895
583	139	88	2	9718	shipped	2025-01-27 05:36:47.491904
584	111	99	5	6035	shipped	2025-05-12 14:58:21.491913
585	143	69	3	1965	pending	2026-01-08 23:02:35.491921
586	196	41	2	682	cancelled	2024-12-06 20:37:03.491929
587	200	25	3	4032	pending	2026-02-05 04:54:43.491937
588	156	73	5	11430	shipped	2025-06-12 02:41:48.491945
589	21	89	1	3043	cancelled	2026-02-03 17:01:53.491953
590	48	50	4	12652	cancelled	2025-08-14 05:46:19.491961
591	105	98	2	728	pending	2024-12-26 01:30:17.491969
592	17	23	2	3550	cancelled	2025-01-24 14:24:47.491977
593	64	55	3	11544	cancelled	2025-03-12 08:17:44.491984
594	101	79	4	10652	pending	2025-07-21 06:28:02.492021
595	133	69	1	2112	cancelled	2025-04-02 08:21:07.492033
596	49	38	5	2515	cancelled	2025-09-22 00:06:39.492042
597	43	55	3	11637	delivered	2025-06-04 08:11:58.492051
598	166	58	2	7794	pending	2025-04-08 17:49:20.492059
599	35	51	5	22880	cancelled	2025-10-29 19:55:20.492067
600	183	26	4	19740	cancelled	2026-02-26 01:35:47.492075
601	24	15	2	2224	cancelled	2025-05-23 22:50:58.492084
602	157	21	4	17164	cancelled	2025-07-05 21:53:42.492115
603	145	85	2	5690	shipped	2026-01-20 05:44:42.492123
604	79	40	1	3537	cancelled	2025-11-16 13:45:24.492131
605	1	80	2	3522	delivered	2026-04-06 19:24:37.492139
606	2	78	4	18208	cancelled	2025-12-13 03:18:49.49218
607	105	57	4	15268	pending	2025-06-09 14:56:16.492216
608	159	81	5	11890	shipped	2026-03-19 04:47:28.492308
609	38	5	3	1200	delivered	2025-10-26 07:53:25.49232
610	42	87	4	6240	delivered	2025-06-04 12:11:47.492328
611	144	23	5	23940	cancelled	2025-03-25 15:32:32.492335
612	197	39	1	862	delivered	2025-10-06 21:04:27.492342
613	17	38	4	18436	cancelled	2026-02-04 06:11:36.492349
614	135	53	3	8388	shipped	2025-04-22 03:17:28.492356
615	187	81	1	4780	pending	2025-08-08 10:11:53.492364
616	156	41	3	10794	delivered	2025-07-17 15:17:09.492373
617	128	67	2	9418	cancelled	2025-08-04 03:59:52.49238
618	50	1	2	4958	pending	2026-03-31 19:15:41.492388
619	158	54	1	1798	cancelled	2026-03-20 23:33:56.492395
620	164	26	2	384	delivered	2025-12-04 07:37:12.492402
621	83	99	5	23025	pending	2026-02-13 12:35:10.492409
622	158	4	4	19040	shipped	2026-01-03 23:03:10.492418
623	10	83	4	15948	shipped	2025-08-10 05:16:02.492424
624	119	53	5	14225	pending	2025-02-09 17:36:55.492431
625	138	3	3	13944	shipped	2025-06-21 12:34:40.492438
626	39	36	3	1926	pending	2025-10-21 21:15:57.492446
627	156	50	2	9554	shipped	2025-06-13 06:00:41.492453
628	182	5	3	8028	delivered	2025-09-14 07:24:35.49246
629	116	39	2	6288	shipped	2025-07-19 00:45:24.492466
630	200	26	3	1218	pending	2025-08-28 17:54:40.492478
631	40	25	4	16784	delivered	2024-12-26 18:09:36.492486
632	199	42	5	13210	shipped	2025-03-16 06:03:58.492493
633	186	5	2	3560	cancelled	2025-09-26 11:00:58.4925
634	80	6	1	133	pending	2025-10-24 19:00:29.492507
635	197	85	1	4364	delivered	2026-04-01 15:08:12.493037
636	52	25	2	5456	delivered	2025-11-22 16:35:42.493052
637	70	20	4	4252	shipped	2025-11-24 06:55:52.493059
638	27	27	5	21555	delivered	2025-07-05 23:39:22.493065
639	63	22	3	14406	pending	2025-11-04 13:59:10.493071
640	13	17	5	18670	pending	2025-08-14 12:53:25.493078
641	23	55	4	2160	cancelled	2026-01-11 11:17:34.493084
642	158	46	5	18760	delivered	2025-10-25 03:10:43.493091
643	194	98	5	3715	cancelled	2025-06-27 05:50:39.493097
644	117	40	4	3584	cancelled	2025-08-16 02:42:22.493103
645	94	51	5	11065	shipped	2025-04-19 12:34:41.493109
646	125	4	3	11439	pending	2025-08-13 06:34:01.493115
647	73	99	4	5996	delivered	2025-06-07 15:47:59.493121
648	183	14	1	3423	delivered	2025-07-02 13:51:41.493127
649	119	52	3	13392	cancelled	2025-12-11 14:40:56.493138
650	99	9	2	8102	delivered	2025-12-27 11:19:04.493144
651	88	70	4	18984	shipped	2026-01-14 12:14:27.49315
652	30	76	5	20430	cancelled	2025-10-28 16:49:39.493158
653	79	52	4	6172	pending	2025-06-11 06:12:39.493166
654	84	64	5	16020	pending	2026-02-26 03:04:23.493173
655	194	19	5	505	shipped	2025-08-24 16:38:07.493181
656	115	26	5	24170	shipped	2025-04-29 23:36:55.493188
657	184	45	3	10983	pending	2025-06-19 09:16:59.493193
658	76	8	4	4576	delivered	2025-01-06 16:53:31.493198
659	29	37	5	15210	pending	2025-12-13 20:11:54.493203
660	183	49	4	10824	cancelled	2025-09-29 20:22:18.493208
661	36	25	2	7980	cancelled	2025-02-05 22:03:05.493212
662	172	17	2	4926	shipped	2026-04-08 07:15:30.493217
663	169	56	2	8174	shipped	2026-03-01 05:14:40.493222
664	179	78	4	15340	cancelled	2025-05-29 04:26:59.493226
665	116	50	4	18488	delivered	2025-12-19 04:28:53.493231
666	128	94	1	4834	shipped	2025-04-13 17:39:05.493236
667	94	5	5	24105	pending	2025-06-26 18:11:08.49324
668	124	89	1	4853	pending	2026-01-30 10:09:58.493246
669	133	11	3	11724	pending	2025-12-08 18:15:44.493252
670	149	40	1	4517	pending	2025-01-05 23:21:42.493257
671	117	66	1	3940	cancelled	2025-06-23 10:35:05.493262
672	75	22	3	7539	pending	2025-04-22 14:09:12.493267
673	16	81	5	11165	cancelled	2025-06-21 04:20:28.493271
674	74	63	3	969	pending	2026-02-07 17:51:37.493277
675	34	79	3	6492	delivered	2025-11-24 01:55:44.493282
676	152	95	1	1530	shipped	2025-05-10 19:32:40.493287
677	180	31	2	4480	cancelled	2026-01-10 17:01:29.493291
678	38	77	3	2373	shipped	2025-02-08 18:08:05.493296
679	170	57	4	8196	shipped	2025-12-26 15:09:38.493301
680	165	34	3	1635	pending	2026-03-18 04:27:06.493305
681	122	96	4	10272	shipped	2025-09-30 12:11:07.49331
682	38	68	4	9004	cancelled	2026-04-06 23:56:40.493315
683	174	41	4	12916	pending	2026-02-22 16:16:09.493319
684	86	35	4	9332	delivered	2025-02-27 06:39:50.493324
685	119	99	5	16520	shipped	2025-04-02 12:18:42.493329
686	87	87	2	8718	shipped	2025-11-03 16:55:48.493334
687	4	53	1	656	pending	2025-07-19 06:13:03.493338
688	186	37	3	5691	delivered	2026-01-05 08:54:52.493344
689	153	85	1	565	shipped	2024-12-12 14:16:24.493349
690	155	17	1	807	cancelled	2025-05-11 13:19:40.493354
691	179	24	2	2016	delivered	2025-11-13 19:13:32.493358
692	71	99	1	3814	cancelled	2025-04-23 12:06:42.493363
693	42	100	3	6624	pending	2025-11-23 08:32:07.493367
694	67	34	3	1776	shipped	2025-08-31 07:24:32.493372
695	46	83	2	6632	cancelled	2026-02-17 05:21:42.493377
696	158	83	4	7556	pending	2024-12-31 19:11:15.493381
697	19	10	1	385	delivered	2025-03-11 19:54:34.493386
698	168	82	4	5276	pending	2024-12-22 08:14:07.493391
699	180	43	3	4023	cancelled	2025-06-23 09:23:46.493395
700	112	52	4	16064	pending	2025-07-11 02:56:07.4934
701	146	69	4	4368	delivered	2025-10-24 12:37:06.493405
702	94	69	1	842	delivered	2026-03-02 19:07:42.49341
703	46	71	3	5289	pending	2024-12-03 21:14:19.493418
704	28	81	3	9885	delivered	2025-08-07 06:59:51.493425
705	36	5	4	6608	shipped	2026-03-31 10:19:16.493432
706	17	70	4	13136	delivered	2025-07-31 16:02:40.493436
707	10	44	4	936	pending	2025-10-22 10:54:06.493441
708	168	86	1	1834	cancelled	2024-12-17 12:00:36.493449
709	190	75	5	6600	shipped	2024-12-26 07:53:44.493457
710	168	3	2	8210	cancelled	2025-01-03 14:54:16.493465
711	45	81	2	434	pending	2025-01-05 00:03:41.493472
712	157	22	1	3837	pending	2025-02-19 06:49:00.493479
713	17	26	5	9530	cancelled	2025-10-22 10:13:06.493486
714	176	74	3	3267	shipped	2025-10-31 03:08:29.493494
715	86	9	5	7600	pending	2025-11-24 05:08:05.493502
716	142	22	2	6260	cancelled	2025-12-09 15:54:23.493509
717	200	21	1	3181	pending	2025-01-17 18:51:31.493516
718	23	91	1	1569	delivered	2025-09-11 11:04:41.493522
719	53	19	4	4556	delivered	2025-07-19 19:30:16.49353
720	153	24	2	816	cancelled	2025-06-04 07:15:39.493538
721	108	1	3	8847	shipped	2026-01-05 06:23:25.493545
722	195	70	5	15320	shipped	2025-08-18 13:14:18.493551
723	50	15	3	1602	shipped	2025-04-27 18:25:20.493555
724	14	83	2	906	delivered	2025-11-19 03:29:15.49356
725	12	14	3	11436	pending	2024-12-25 16:45:21.493565
726	132	15	1	4073	pending	2025-01-10 02:10:03.49357
727	84	54	5	24245	shipped	2025-03-26 11:59:11.493576
728	84	30	2	2004	pending	2025-12-12 10:29:36.49358
729	57	10	2	6352	cancelled	2025-06-17 18:52:35.493585
730	56	79	4	5148	cancelled	2026-01-11 21:33:23.493589
731	162	46	4	6760	delivered	2025-12-30 23:48:29.493594
732	72	18	5	2940	pending	2025-01-31 19:27:05.493599
733	57	38	2	5828	shipped	2025-03-04 13:16:34.493603
734	142	30	2	9670	pending	2025-09-14 17:24:36.493608
735	122	60	2	9892	delivered	2026-04-05 10:28:44.493613
736	84	56	2	4260	shipped	2025-01-11 15:46:33.493617
737	107	6	5	705	pending	2025-08-15 10:06:59.493622
738	136	51	1	3587	cancelled	2025-02-22 11:04:25.493627
739	62	11	4	16628	pending	2025-04-23 10:30:18.493634
740	76	31	2	6072	pending	2026-04-04 18:14:12.49364
741	147	96	2	7724	pending	2024-11-29 19:26:42.493647
742	48	48	2	6840	cancelled	2025-04-17 13:55:36.493653
743	177	43	1	3252	pending	2025-11-12 20:08:14.49366
744	148	27	5	22715	pending	2025-05-30 23:08:32.493668
745	173	47	1	4316	pending	2026-02-15 21:33:02.493675
746	94	47	5	2170	shipped	2025-05-16 16:11:27.493683
747	36	43	5	8885	shipped	2025-07-11 06:15:01.493691
748	193	96	5	9090	shipped	2025-10-30 21:59:14.493699
749	71	7	5	17820	pending	2025-10-04 22:28:00.493705
750	32	61	5	22070	delivered	2025-08-24 14:32:40.493712
751	118	12	1	1642	pending	2025-09-25 04:38:27.49372
752	71	15	1	1449	shipped	2025-08-02 05:01:18.493728
753	76	54	5	1425	shipped	2025-08-13 22:30:03.493735
754	49	9	1	2488	pending	2025-01-22 02:02:58.493743
755	149	44	3	10416	delivered	2025-08-07 15:13:47.493751
756	114	59	5	22965	delivered	2025-06-27 04:58:41.49376
757	67	30	3	4518	cancelled	2025-10-05 00:06:37.493768
758	91	37	1	1315	cancelled	2024-12-10 04:16:32.493775
759	74	24	2	8970	shipped	2025-02-07 11:11:34.493784
760	61	15	2	2840	pending	2025-11-01 15:48:03.493792
761	48	27	3	9384	pending	2025-05-07 23:34:22.4938
762	139	21	3	11319	delivered	2026-02-10 09:30:32.49381
763	118	41	4	5160	shipped	2026-04-10 10:21:59.49382
764	122	38	3	7563	shipped	2025-02-27 15:09:33.493829
765	177	15	4	11496	cancelled	2025-01-08 08:47:48.493837
766	79	4	5	5285	cancelled	2025-06-01 02:28:09.493846
767	15	78	1	2773	shipped	2025-06-18 17:41:41.493855
768	6	11	3	5109	cancelled	2025-05-01 12:50:59.493863
769	126	41	4	6768	pending	2025-01-02 12:33:06.493871
770	95	50	2	7206	delivered	2026-04-07 00:34:09.493879
771	144	12	3	11250	shipped	2025-04-05 19:09:05.493889
772	42	94	4	9856	cancelled	2025-04-04 20:47:38.493898
773	23	19	5	24990	shipped	2025-11-08 18:00:58.493907
774	152	97	3	1923	cancelled	2026-02-27 09:29:51.493916
775	45	72	3	10485	cancelled	2025-04-14 15:07:33.493924
776	48	49	2	3464	delivered	2025-07-03 18:53:39.493932
777	78	64	3	14682	cancelled	2025-12-20 09:06:31.493941
778	77	82	2	4502	cancelled	2026-02-08 13:13:34.49395
779	46	63	3	10551	shipped	2026-03-30 06:08:14.493959
780	154	96	4	2584	delivered	2025-06-19 18:20:04.493968
781	178	16	3	11997	delivered	2025-07-24 10:20:30.493976
782	149	8	3	4302	shipped	2025-10-31 18:59:47.493984
783	42	7	2	6054	delivered	2025-10-10 20:15:33.493993
784	75	38	3	1497	pending	2025-07-24 03:06:51.494002
785	154	97	2	1748	shipped	2025-07-08 23:01:11.494011
786	176	90	3	6969	delivered	2026-02-22 16:19:09.494022
787	36	67	2	410	delivered	2025-10-04 18:30:10.494032
788	56	20	2	1878	shipped	2025-02-12 03:05:34.494041
789	137	92	5	22030	pending	2025-09-11 18:58:27.494051
790	5	62	1	1175	delivered	2025-11-04 11:33:23.494059
791	134	98	4	19980	delivered	2026-01-14 11:37:30.494067
792	33	89	1	1921	shipped	2025-04-26 02:37:23.494075
793	21	55	2	2332	pending	2026-03-05 09:07:01.494083
794	51	14	4	1792	pending	2025-03-02 12:23:54.494091
795	31	33	1	3942	pending	2026-03-11 00:14:31.494098
796	155	27	1	1114	shipped	2026-01-08 12:34:30.494106
797	192	36	1	1292	delivered	2025-10-15 04:01:59.494114
798	130	73	5	10405	pending	2026-02-21 15:08:31.494125
799	184	25	5	9385	delivered	2026-01-15 16:55:45.494138
800	130	91	1	1853	cancelled	2025-10-07 11:19:20.494147
801	47	46	4	3916	cancelled	2025-09-08 03:24:17.494154
802	195	41	4	4096	pending	2025-08-18 06:23:23.494162
803	181	37	4	12236	pending	2026-03-01 23:25:24.494169
804	117	77	4	9692	delivered	2025-04-26 19:41:56.494177
805	110	25	4	9920	pending	2025-01-09 18:13:08.494187
806	173	63	2	408	pending	2025-09-22 19:22:49.494196
807	37	51	1	1076	cancelled	2025-04-22 15:49:44.494204
808	94	26	2	1260	delivered	2025-12-31 14:02:06.494212
809	109	93	1	2007	cancelled	2025-11-21 11:06:54.494219
810	194	83	5	11680	cancelled	2025-10-12 18:13:53.494226
811	131	36	4	16276	shipped	2025-03-15 19:50:24.494233
812	128	30	3	12324	shipped	2026-03-29 06:09:28.494242
813	174	4	1	4180	shipped	2025-09-29 14:13:11.494249
814	160	80	2	5160	pending	2025-03-20 07:13:43.494257
815	120	26	5	20660	delivered	2025-05-09 18:24:59.494265
816	88	70	3	13629	pending	2024-12-12 08:28:35.494273
817	116	41	1	3242	cancelled	2025-08-29 19:54:29.494285
818	169	100	2	9320	delivered	2025-01-15 11:46:00.494294
819	80	92	4	4804	cancelled	2025-08-07 06:19:48.494301
820	176	70	4	18544	cancelled	2025-08-12 16:02:21.49431
821	101	34	5	2780	cancelled	2025-06-14 21:16:48.494319
822	83	8	3	7290	pending	2025-06-15 08:47:38.494328
823	190	75	3	8871	pending	2025-03-17 13:35:07.494337
824	89	46	1	3607	cancelled	2025-10-16 08:14:16.494347
825	166	40	2	4044	pending	2025-01-01 11:51:36.494355
826	87	22	3	3111	pending	2025-07-11 23:54:02.494364
827	132	54	4	19012	delivered	2026-04-02 11:25:54.494374
828	97	74	1	2692	cancelled	2025-10-29 15:49:40.494381
829	177	87	4	3676	shipped	2025-10-22 18:23:40.494388
830	158	39	3	4395	delivered	2024-12-02 20:44:00.494396
831	55	37	1	4489	delivered	2026-03-20 00:20:06.494404
832	184	75	2	1706	pending	2025-06-13 23:39:27.494409
833	122	55	5	22250	shipped	2025-10-18 07:14:39.494414
834	77	56	3	12702	delivered	2025-12-31 20:31:15.494419
835	117	86	5	21605	shipped	2025-01-17 09:15:46.494423
836	148	64	5	8140	shipped	2025-05-09 10:27:14.494428
837	145	94	5	18265	pending	2025-07-20 03:33:02.494434
838	39	96	2	4138	delivered	2025-02-04 20:30:11.494438
839	106	35	1	1767	delivered	2025-05-18 04:39:48.494443
840	104	31	5	10170	pending	2026-01-27 03:55:16.494448
841	125	72	3	11706	cancelled	2025-09-08 12:59:29.494453
842	70	18	2	2810	pending	2025-12-02 01:13:56.494457
843	185	63	2	890	pending	2026-03-16 07:35:53.494462
844	105	47	3	1860	pending	2025-09-21 10:03:23.494468
845	147	95	2	2032	pending	2025-07-19 12:02:54.494474
846	128	12	5	10810	shipped	2025-06-10 06:06:40.49448
847	150	95	3	8391	cancelled	2025-02-24 10:09:16.494485
848	37	14	4	7540	shipped	2025-12-25 01:28:05.494491
849	15	63	3	14787	delivered	2025-04-20 06:35:57.494496
850	175	32	4	15960	delivered	2025-01-18 05:33:01.494501
851	6	83	3	7872	pending	2025-02-06 10:13:40.494506
852	65	71	1	2063	cancelled	2025-11-05 13:12:08.494511
853	61	57	1	4481	cancelled	2026-04-08 20:56:33.494516
854	24	97	3	7692	shipped	2025-11-12 03:00:35.494521
855	162	41	2	7390	cancelled	2025-03-05 08:38:36.494526
856	121	95	1	4127	cancelled	2024-12-24 23:11:04.494531
857	179	34	1	1413	pending	2025-10-14 20:17:45.494535
858	117	89	5	13880	pending	2025-03-19 08:14:50.49454
859	165	18	2	7464	pending	2025-09-20 03:16:12.494545
860	22	15	3	14451	shipped	2025-12-06 17:10:42.49455
861	176	53	2	9932	delivered	2025-08-24 18:00:44.494555
862	45	88	2	4470	delivered	2025-02-28 00:44:26.494561
863	47	51	4	12444	cancelled	2024-12-15 15:42:30.494566
864	166	79	1	4675	shipped	2025-01-04 07:27:19.494572
865	13	52	3	4446	cancelled	2025-06-10 01:47:26.494577
866	146	16	3	4479	pending	2025-04-10 17:28:42.494582
867	31	29	4	16592	shipped	2026-01-06 01:37:44.494586
868	34	56	4	12916	shipped	2025-06-10 03:04:13.494591
869	47	53	2	7052	shipped	2026-03-30 00:40:16.494596
870	64	48	5	18970	cancelled	2026-03-01 09:26:23.494601
871	176	28	3	10068	cancelled	2025-04-15 20:08:53.494605
872	25	72	3	2094	pending	2026-03-17 22:57:16.49461
873	156	86	4	12008	pending	2026-04-11 01:23:52.494615
874	102	86	4	10312	delivered	2026-02-04 16:53:54.494632
875	44	65	2	4464	cancelled	2024-12-22 23:00:02.494638
876	82	91	2	1668	cancelled	2026-01-31 01:49:11.494643
877	128	36	1	1147	delivered	2024-12-24 20:37:34.494648
878	133	41	3	6780	cancelled	2025-01-11 04:35:44.494653
879	143	85	4	5356	cancelled	2026-03-17 03:47:28.494658
880	10	61	2	3200	delivered	2026-01-19 11:27:04.494662
881	11	57	1	4154	delivered	2025-04-14 16:25:02.494667
882	185	19	4	4084	pending	2025-10-17 07:42:36.494672
883	44	96	3	4737	delivered	2025-06-28 12:19:18.494678
884	135	99	5	665	shipped	2025-09-12 07:40:42.494683
885	85	4	4	3488	delivered	2025-04-29 12:49:06.494688
886	28	42	3	14808	shipped	2026-03-30 07:26:38.494693
887	161	35	4	15276	pending	2025-10-27 08:14:52.494698
888	188	94	4	11044	shipped	2025-12-26 08:04:50.494703
889	15	96	3	8241	pending	2025-07-06 14:32:26.494708
890	46	31	4	8760	cancelled	2026-02-27 09:02:18.494714
891	200	52	2	6564	delivered	2025-05-16 13:47:24.49472
892	111	95	3	12363	delivered	2025-01-05 12:18:23.494729
893	95	66	3	2661	shipped	2025-08-05 19:00:07.494738
894	145	77	4	9196	cancelled	2026-02-25 20:05:08.494745
895	112	81	5	8130	cancelled	2026-02-25 08:24:10.494753
896	166	88	4	7744	shipped	2024-12-22 18:22:51.494762
897	75	60	5	3935	cancelled	2026-03-03 18:37:22.49477
898	64	67	2	5120	cancelled	2025-11-12 15:52:56.494779
899	132	14	1	469	cancelled	2025-09-14 06:26:49.494789
900	91	33	5	10875	pending	2025-03-15 17:55:24.494797
901	47	51	4	6280	pending	2026-03-01 19:59:46.494805
902	151	93	3	8013	cancelled	2025-03-21 12:27:52.49481
903	48	28	3	8688	shipped	2026-03-03 10:18:15.494816
904	137	3	1	3653	pending	2025-09-23 06:56:21.494821
905	178	52	4	15476	cancelled	2025-11-08 14:03:52.494826
906	78	12	3	10005	shipped	2026-02-03 09:44:24.494831
907	7	27	1	1641	cancelled	2025-05-16 05:15:16.494837
908	49	12	4	18048	delivered	2025-03-14 19:47:01.494843
909	30	22	4	1112	shipped	2025-03-30 11:28:00.49485
910	116	75	4	1040	shipped	2025-12-31 00:19:38.494858
911	86	2	4	2068	pending	2025-05-25 11:29:05.494867
912	153	94	4	19360	delivered	2026-03-25 18:31:00.494875
913	186	79	5	24705	cancelled	2025-12-15 11:52:58.494883
914	148	41	1	3557	pending	2025-11-26 13:29:35.494891
915	127	80	4	4228	delivered	2025-08-26 11:29:30.494901
916	186	25	2	4918	cancelled	2025-10-18 19:41:59.494907
917	176	44	2	9828	cancelled	2026-02-05 00:09:46.494915
918	173	84	4	14056	delivered	2025-03-01 18:04:37.494922
919	73	89	2	3594	pending	2025-05-06 18:48:20.494931
920	156	63	2	2760	pending	2025-03-02 20:25:12.49494
921	143	7	2	3630	pending	2025-10-12 01:33:48.494948
922	129	5	2	3062	pending	2025-10-22 20:48:52.494959
923	144	29	2	2176	cancelled	2025-12-01 23:06:09.494967
924	69	20	1	4663	pending	2025-04-17 07:57:03.495004
925	28	79	4	4032	pending	2025-02-15 16:53:59.495018
926	162	16	1	1468	shipped	2025-01-01 22:45:45.495027
927	196	65	3	11148	cancelled	2025-04-03 06:46:50.495037
928	36	16	3	8523	shipped	2025-08-31 20:06:42.495046
929	122	44	1	2109	delivered	2025-07-29 04:51:14.495054
930	93	81	3	10497	shipped	2026-01-25 17:29:41.495063
931	110	53	2	2460	cancelled	2025-01-08 19:01:58.495071
932	114	19	3	1029	pending	2025-04-10 17:52:26.495079
933	103	99	3	8034	shipped	2025-09-03 08:30:43.495086
934	148	8	1	1336	delivered	2025-09-10 20:59:48.495094
935	185	96	5	12965	delivered	2025-01-02 22:55:39.495102
936	157	19	3	13269	cancelled	2025-08-27 13:42:35.495109
937	179	45	5	18610	cancelled	2025-03-12 03:00:12.495117
938	138	43	1	402	cancelled	2025-04-06 10:08:35.495124
939	139	37	2	8726	shipped	2026-02-24 17:21:12.495131
940	194	82	5	14455	shipped	2026-04-02 08:59:41.49514
941	67	31	5	24765	delivered	2025-04-06 20:24:24.495148
942	67	81	1	3155	delivered	2026-02-09 08:07:50.495162
943	77	74	1	3776	pending	2025-08-23 23:40:40.495171
944	183	81	5	23665	shipped	2025-10-16 00:37:49.49518
945	183	49	5	6230	shipped	2026-02-18 23:22:54.495187
946	117	13	2	6118	shipped	2025-04-13 20:03:05.495195
947	16	55	1	855	shipped	2025-08-13 03:28:27.495203
948	104	76	3	13233	cancelled	2025-01-22 01:19:00.495212
949	177	63	4	14820	cancelled	2025-02-16 04:46:59.495221
950	183	59	2	8142	shipped	2024-12-03 11:23:36.495232
951	178	28	5	5335	cancelled	2025-08-14 08:09:21.495239
952	31	78	5	15625	cancelled	2026-02-16 06:32:55.495246
953	134	20	3	1287	pending	2025-10-05 00:33:12.495253
954	8	19	3	12240	shipped	2025-03-07 15:30:28.495261
955	56	24	3	7266	cancelled	2026-04-12 06:21:09.49527
956	107	62	1	466	delivered	2025-06-27 18:59:10.495279
957	185	78	4	15972	shipped	2025-03-19 05:23:51.495287
958	171	58	4	15140	shipped	2025-01-24 10:36:26.495295
959	100	30	5	17275	cancelled	2025-10-21 16:53:49.495303
960	166	12	4	9488	shipped	2025-04-16 09:19:51.495312
961	166	16	3	14088	pending	2026-01-04 14:21:55.495325
962	134	25	1	4771	cancelled	2025-07-30 09:48:49.495332
963	5	36	5	7860	shipped	2025-12-08 11:02:35.49534
964	22	69	5	18695	delivered	2025-09-19 15:54:00.495348
965	112	24	1	2884	cancelled	2026-03-31 17:36:07.495356
966	30	13	3	2535	shipped	2025-11-18 05:45:15.495365
967	79	53	1	1363	shipped	2026-03-13 14:36:20.495374
968	77	50	1	579	pending	2025-11-01 05:29:34.495383
969	97	16	3	6636	pending	2025-12-31 02:07:53.495391
970	127	66	5	10185	cancelled	2024-12-13 06:39:28.495399
971	142	53	3	11721	pending	2025-08-09 09:29:51.495406
972	69	71	2	504	pending	2025-12-07 16:14:41.495413
973	146	53	2	5190	cancelled	2026-03-01 13:24:18.495418
974	139	22	2	6316	shipped	2025-07-11 19:57:56.495425
975	1	60	4	1768	delivered	2025-05-14 04:56:28.49543
976	154	33	4	9352	cancelled	2025-10-15 13:42:54.495436
977	12	21	5	12020	pending	2025-11-11 07:30:47.495441
978	186	72	1	1244	delivered	2025-01-18 20:42:52.495449
979	175	44	5	13535	delivered	2025-03-23 11:28:14.495458
980	88	27	2	5468	cancelled	2024-12-07 14:35:30.495466
981	156	61	2	232	pending	2025-01-07 09:13:20.495475
982	179	91	4	18612	cancelled	2025-03-18 21:22:26.495484
983	8	86	1	4512	cancelled	2025-05-04 06:33:39.495491
984	100	23	4	12128	pending	2026-02-08 19:32:32.495499
985	3	29	2	7482	pending	2025-03-21 01:12:33.495507
986	24	79	3	5004	delivered	2025-02-23 11:42:17.495515
987	10	36	4	12292	cancelled	2025-01-04 11:10:53.495524
988	51	82	2	316	cancelled	2026-02-16 01:19:59.495532
989	142	25	4	5984	shipped	2026-03-10 15:47:44.49554
990	67	73	1	1143	shipped	2025-01-16 17:09:41.495545
991	174	3	3	5013	delivered	2025-04-29 16:00:02.49555
992	165	87	1	3598	pending	2025-01-30 23:28:37.495555
993	32	88	4	9376	cancelled	2025-08-02 22:22:43.49556
994	13	36	1	1939	cancelled	2025-07-14 19:36:31.495565
995	86	11	4	6776	pending	2025-04-01 02:12:04.49557
996	51	22	1	2147	delivered	2025-11-05 07:15:51.495575
997	123	56	1	328	pending	2025-06-13 12:57:10.49558
998	28	61	3	6372	shipped	2024-12-08 23:03:28.495585
999	61	10	3	13071	cancelled	2025-03-18 06:16:03.49559
1000	22	8	5	5610	pending	2025-10-01 22:59:37.495596
\.


--
-- TOC entry 5828 (class 0 OID 42952)
-- Dependencies: 316
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, order_id, payment_method, payment_status, paid_amount, paid_at) FROM stdin;
1	711	UPI	success	1115	2024-12-28 19:53:12.503594
2	626	Wallet	success	1768	2025-05-02 08:21:28.503626
3	302	Wallet	failed	1670	2025-05-31 20:41:36.503635
4	614	UPI	failed	6390	2025-08-18 19:59:52.503642
5	635	UPI	failed	525	2025-08-23 17:34:54.50365
6	198	UPI	success	301	2025-06-12 11:51:54.503657
7	809	Card	pending	2164	2025-05-21 17:40:09.503665
8	432	Wallet	pending	7384	2026-01-08 02:47:40.503673
9	46	UPI	success	5206	2025-06-17 20:23:50.50368
10	773	NetBanking	failed	9662	2025-01-14 16:07:22.503686
11	151	Wallet	failed	9984	2025-10-20 00:33:31.503693
12	531	Card	success	3989	2025-07-27 16:02:28.5037
13	433	NetBanking	success	3382	2025-05-21 03:06:27.503707
14	350	Card	pending	7894	2025-04-22 11:26:53.503716
15	710	NetBanking	pending	9374	2024-12-05 23:17:12.503802
16	429	NetBanking	success	1817	2025-08-24 08:25:17.503811
17	943	UPI	pending	3754	2025-04-24 02:26:52.503819
18	219	Card	failed	5531	2025-02-23 10:32:18.503827
19	410	Card	success	6044	2026-04-08 07:34:30.503834
20	569	UPI	success	4860	2025-08-31 03:15:54.50384
21	935	NetBanking	success	586	2026-01-02 03:38:20.503847
22	225	NetBanking	pending	2955	2025-10-21 16:41:20.503853
23	201	UPI	success	4389	2025-01-02 06:54:38.50386
24	694	Card	failed	1918	2025-10-22 03:37:02.503867
25	246	NetBanking	failed	2907	2024-12-17 17:04:52.503884
26	903	Wallet	pending	1171	2026-02-12 04:59:32.503891
27	134	Card	success	8825	2025-10-01 11:33:11.503897
28	614	Wallet	pending	4106	2024-12-28 08:07:52.503903
29	602	Card	pending	4919	2025-03-05 05:36:16.503909
30	55	NetBanking	success	8427	2024-12-03 15:00:00.503928
31	215	UPI	failed	1162	2026-01-17 17:31:43.503946
32	904	NetBanking	failed	8601	2025-08-19 04:35:46.503954
33	383	Wallet	pending	8206	2025-08-14 01:19:06.503962
34	654	UPI	success	3696	2025-01-10 03:27:36.503969
35	241	Wallet	success	5113	2025-09-07 21:20:21.503975
36	958	NetBanking	failed	9120	2026-03-01 05:08:26.503982
37	303	Wallet	pending	5860	2025-12-16 15:54:02.503989
38	525	NetBanking	failed	7491	2025-08-16 20:30:08.503995
39	824	Wallet	failed	4573	2025-09-30 09:45:03.504001
40	240	NetBanking	pending	1343	2025-10-12 07:37:38.504008
41	514	UPI	failed	3831	2026-02-22 06:52:08.504015
42	40	Card	failed	3321	2025-05-02 23:40:12.504046
43	764	NetBanking	success	9996	2026-02-01 11:08:57.504054
44	935	NetBanking	success	5006	2025-11-19 22:06:06.504061
45	969	Wallet	pending	294	2025-08-14 13:23:43.504069
46	975	Card	failed	3828	2025-12-17 10:09:18.504076
47	486	Card	pending	9717	2025-03-06 16:08:02.504084
48	740	Wallet	failed	1506	2025-11-04 03:28:42.504091
49	965	Wallet	success	7287	2025-08-25 16:55:08.504099
50	143	Card	failed	258	2025-07-31 12:03:09.504107
51	348	Card	failed	7074	2025-04-26 21:07:42.504114
52	708	NetBanking	failed	9716	2026-04-01 15:06:29.504122
53	945	Card	success	5510	2025-06-26 13:04:53.504131
54	936	Wallet	failed	3445	2024-12-13 21:51:57.504139
55	396	Card	failed	1879	2025-10-26 15:27:51.504146
56	917	NetBanking	success	2908	2026-02-18 12:21:20.504154
57	33	Wallet	success	3158	2026-01-02 06:58:07.504162
58	291	Card	success	4869	2025-05-10 17:52:02.50417
59	59	NetBanking	pending	280	2026-01-15 23:00:33.504178
60	421	Wallet	success	1914	2026-02-05 16:30:01.504186
61	761	UPI	failed	3482	2026-02-06 03:37:04.504195
62	838	Wallet	success	9991	2025-06-23 00:19:19.504203
63	515	Wallet	failed	3404	2026-04-10 05:28:27.504211
64	845	Wallet	pending	4144	2025-07-17 22:57:55.504219
65	901	Wallet	failed	7680	2025-06-23 08:09:26.504228
66	295	Wallet	failed	4973	2025-09-24 14:03:40.504241
67	871	Card	failed	4181	2026-01-11 14:10:04.50425
68	469	Wallet	pending	3105	2025-04-20 15:50:06.50426
69	716	UPI	success	2687	2025-11-23 13:22:13.504269
70	683	UPI	pending	3659	2025-01-02 18:29:43.504277
71	567	UPI	failed	1353	2025-03-23 06:23:42.504286
72	799	NetBanking	failed	7488	2026-01-19 01:42:59.504294
73	46	Wallet	success	1299	2025-05-20 11:12:44.504302
74	473	Wallet	failed	6642	2025-01-30 03:31:29.50431
75	11	NetBanking	success	2336	2025-10-27 12:09:02.504319
76	497	Wallet	success	1452	2025-07-06 12:40:46.504327
77	973	Wallet	success	7813	2025-02-17 01:03:21.504334
78	175	UPI	pending	1746	2026-01-13 00:48:57.504343
79	760	Wallet	success	1371	2025-05-05 09:13:14.504351
80	158	Wallet	failed	3015	2025-12-23 11:53:34.504359
81	692	Card	failed	882	2025-02-08 13:04:58.504368
82	657	UPI	failed	5151	2025-08-29 08:18:31.504377
83	50	Wallet	success	4191	2025-10-04 02:44:26.504385
84	17	Wallet	success	338	2025-10-23 03:12:49.504394
85	65	Card	success	2850	2025-04-08 04:54:05.504402
86	525	UPI	failed	5386	2025-06-29 13:43:52.504411
87	213	Wallet	failed	2079	2025-12-16 03:50:09.50442
88	332	Card	success	6688	2025-05-13 23:56:07.504428
89	218	Wallet	success	1181	2025-05-12 01:14:52.504437
90	378	UPI	success	3680	2025-09-15 00:06:53.504445
91	512	UPI	pending	8884	2025-03-03 15:46:15.504454
92	983	UPI	pending	5414	2025-05-24 11:31:48.504461
93	947	Card	failed	2972	2025-05-22 11:35:37.504468
94	683	Wallet	success	5590	2026-04-03 13:57:54.504478
95	460	Wallet	pending	3908	2025-07-29 15:11:31.504486
96	239	UPI	pending	2132	2025-11-06 02:09:04.504494
97	776	Card	pending	1400	2026-03-14 05:33:00.504502
98	304	Card	success	6256	2025-12-29 13:54:16.50451
99	946	Wallet	pending	5485	2026-02-04 01:35:50.504518
100	806	UPI	pending	6897	2025-05-17 00:08:30.504527
101	235	NetBanking	failed	4069	2025-12-28 16:52:33.504534
102	940	Card	pending	3744	2025-06-05 21:23:11.504541
103	188	Wallet	pending	199	2026-03-10 18:52:19.504549
104	54	Card	success	2157	2026-02-26 04:18:56.504556
105	852	Card	success	8413	2026-03-03 20:10:02.504562
106	319	Card	pending	3336	2025-12-08 20:44:53.504568
107	255	NetBanking	failed	9544	2025-08-26 13:44:14.504575
108	884	Wallet	success	5991	2025-09-21 21:46:01.504582
109	452	Wallet	pending	7201	2025-03-20 05:03:41.504589
110	494	UPI	failed	7102	2025-01-31 07:07:33.504598
111	944	NetBanking	pending	8901	2026-01-24 16:10:20.504606
112	264	Wallet	failed	5111	2025-08-24 00:31:56.504613
113	621	Wallet	success	5559	2026-02-02 11:26:19.504619
114	159	Card	success	310	2025-01-26 17:09:45.504625
115	384	Wallet	failed	6912	2024-12-17 21:09:08.504633
116	394	Wallet	failed	9738	2026-03-07 20:00:29.504641
117	944	UPI	failed	9366	2026-01-20 03:08:04.50465
118	981	NetBanking	pending	5811	2025-07-26 11:24:51.504657
119	706	NetBanking	pending	1045	2025-05-14 20:57:04.504664
120	754	Card	success	7927	2026-03-26 22:15:46.504672
121	693	UPI	pending	2522	2025-11-30 14:26:48.50468
122	151	NetBanking	success	9965	2025-06-20 12:03:21.504686
123	13	UPI	success	6397	2025-09-21 11:18:34.504693
124	83	Card	failed	2816	2025-02-12 20:39:47.504699
125	310	Wallet	pending	5145	2025-04-02 20:07:35.504707
126	947	UPI	success	9481	2025-03-11 22:04:22.504717
127	276	Card	pending	6620	2025-04-21 00:56:21.504732
128	836	Wallet	success	1687	2026-03-08 11:29:58.504742
129	427	NetBanking	pending	7160	2026-01-16 04:33:20.504753
130	721	Card	success	8070	2026-01-09 17:49:03.504764
131	581	Card	success	3392	2026-03-13 10:44:40.504777
132	778	Card	failed	6797	2025-08-30 12:57:52.504791
133	112	Card	success	4902	2026-02-28 21:49:14.504802
134	66	NetBanking	success	9695	2025-12-13 18:24:48.504813
135	779	UPI	success	1100	2025-11-28 09:13:54.504871
136	809	UPI	success	3558	2025-07-20 09:31:53.50489
137	533	NetBanking	failed	7853	2025-03-21 23:18:04.504898
138	345	NetBanking	pending	5720	2025-11-03 02:32:49.504906
139	409	Wallet	pending	1037	2024-11-29 22:01:10.504913
140	826	UPI	success	7586	2025-01-22 11:30:45.504921
141	856	Card	success	9961	2026-02-09 17:38:47.504928
142	770	Card	failed	7504	2025-05-31 12:13:36.504936
143	487	Wallet	pending	3179	2026-04-11 13:04:11.504942
144	18	NetBanking	success	5433	2025-04-30 19:41:53.504949
145	497	Wallet	pending	1433	2025-10-16 19:56:32.504956
146	488	UPI	pending	6405	2025-11-13 14:43:46.504963
147	147	UPI	success	8258	2025-03-02 07:36:38.50497
148	690	Wallet	success	7411	2024-12-11 06:25:49.504977
149	554	Card	success	3567	2026-01-15 12:12:26.504983
150	109	Wallet	pending	578	2026-01-20 22:59:07.504993
151	785	NetBanking	success	4320	2025-05-07 17:58:49.504999
152	127	Card	pending	8160	2026-02-25 11:34:36.505007
153	230	UPI	pending	5723	2025-10-01 11:08:44.505014
154	743	Wallet	pending	9306	2024-12-04 20:05:17.50502
155	229	NetBanking	success	4867	2026-02-28 06:51:10.505027
156	759	Card	pending	2002	2025-06-23 22:47:37.505034
157	321	Wallet	pending	127	2025-11-05 08:18:57.505041
158	195	Wallet	failed	5337	2025-03-14 22:04:48.505048
159	957	Card	pending	9956	2025-06-15 02:50:06.505059
160	10	Wallet	failed	2470	2025-02-20 00:03:17.50507
161	512	Wallet	success	9954	2025-11-19 05:08:49.505082
162	870	UPI	pending	5345	2025-11-05 17:12:24.505093
163	281	Wallet	pending	3634	2025-08-03 00:11:07.505104
164	61	NetBanking	success	3550	2025-02-02 09:56:40.505116
165	231	UPI	success	8087	2025-04-05 21:36:39.505129
166	676	Card	success	9077	2025-09-24 23:28:48.50514
167	485	NetBanking	failed	6507	2026-03-07 17:10:13.505155
168	290	Card	pending	9078	2025-09-24 06:48:11.505165
169	771	UPI	pending	5081	2025-08-21 13:45:55.505177
170	141	Wallet	pending	8004	2025-11-15 05:43:18.50519
171	824	Card	pending	249	2025-10-09 10:01:55.505201
172	105	Card	failed	7097	2025-05-01 03:57:28.505215
173	99	NetBanking	failed	3043	2024-12-16 08:48:59.505227
174	666	NetBanking	pending	7207	2024-12-03 05:15:45.505239
175	414	Card	success	2046	2025-12-10 21:25:12.505248
176	705	Card	pending	6250	2025-03-11 11:05:49.505254
177	675	UPI	failed	6360	2025-11-23 13:15:03.505262
178	377	UPI	success	2010	2026-03-02 06:24:50.505268
179	685	Card	success	9714	2025-06-23 15:26:14.505275
180	711	UPI	pending	3067	2025-09-28 18:14:47.505281
181	445	NetBanking	pending	2151	2026-02-21 23:51:46.505287
182	931	Card	failed	423	2025-09-23 16:03:57.505294
183	803	Wallet	success	8601	2025-02-08 15:21:46.5053
184	839	UPI	success	2022	2026-01-10 14:12:20.505306
185	6	Wallet	failed	2115	2026-03-24 05:20:18.505314
186	669	Card	success	9315	2025-12-03 08:51:24.505321
187	519	NetBanking	failed	9019	2026-01-15 20:14:31.505331
188	255	NetBanking	success	8610	2025-01-05 00:13:57.505342
189	456	Card	pending	8135	2025-04-22 23:22:33.505354
190	361	Card	pending	1722	2025-05-09 08:41:29.505364
191	193	Card	failed	3626	2024-12-09 05:17:56.505371
192	222	NetBanking	failed	2205	2025-04-04 14:29:27.505378
193	564	NetBanking	failed	6355	2025-05-16 04:31:02.505384
194	86	NetBanking	pending	7068	2024-12-17 11:46:57.50539
195	209	UPI	pending	4513	2025-05-23 11:15:19.505397
196	732	NetBanking	pending	8479	2025-06-08 04:29:39.505403
197	158	NetBanking	failed	6308	2026-03-30 14:41:27.50541
198	277	UPI	pending	1902	2025-04-27 16:30:27.505416
199	338	UPI	failed	5564	2025-03-11 01:46:36.505423
200	818	Card	failed	261	2026-02-21 21:42:07.505429
201	975	UPI	success	2979	2025-07-17 10:00:12.505436
202	603	Wallet	success	8766	2025-10-16 11:19:36.505445
203	289	NetBanking	pending	1723	2025-01-09 08:46:11.505451
204	970	Wallet	success	5755	2025-02-24 10:12:41.505458
205	545	Wallet	failed	9804	2026-02-07 01:55:48.505464
206	526	Card	pending	2170	2026-01-29 21:19:44.505471
207	274	UPI	pending	6164	2025-04-16 02:12:53.505478
208	429	Wallet	success	7291	2025-10-13 19:24:13.505484
209	283	Wallet	pending	3848	2025-11-07 13:02:26.505491
210	971	NetBanking	failed	5223	2025-02-05 07:16:26.505498
211	79	Card	success	2805	2025-06-23 08:50:44.505505
212	293	Wallet	success	7046	2025-05-01 16:56:45.505511
213	140	Wallet	failed	8537	2025-04-27 11:59:57.505518
214	715	UPI	failed	327	2025-06-02 02:57:38.505524
215	764	UPI	pending	7062	2025-04-18 16:09:09.505531
216	251	UPI	pending	7450	2024-12-06 04:12:32.505538
217	904	Card	success	1330	2025-10-08 05:24:09.505544
218	976	UPI	failed	8218	2025-10-01 04:33:24.505551
219	347	Card	pending	2031	2025-11-16 00:26:13.505558
220	272	Card	success	9419	2025-09-24 02:57:12.505564
221	952	UPI	failed	8099	2026-03-14 22:55:52.505571
222	472	NetBanking	failed	5898	2026-02-18 09:33:35.505577
223	740	Card	failed	5908	2026-04-09 06:29:00.505584
224	203	UPI	pending	8526	2025-01-08 05:30:24.505591
225	936	Wallet	success	2649	2025-03-15 12:40:17.505597
226	482	Wallet	failed	5003	2025-10-08 19:59:20.505604
227	550	NetBanking	success	7285	2025-05-11 19:46:23.50561
228	363	Wallet	success	5985	2025-01-15 11:44:24.505617
229	195	NetBanking	success	2290	2025-09-22 20:09:10.505623
230	923	UPI	success	3360	2024-12-13 18:14:14.50563
231	122	Wallet	failed	9113	2025-08-02 12:11:23.505636
232	333	Wallet	pending	6470	2026-02-05 06:49:41.505643
233	22	Card	success	5738	2025-07-31 09:06:48.505649
234	243	UPI	pending	5705	2025-09-05 14:09:31.505656
235	445	Wallet	failed	4723	2025-08-08 07:08:04.505662
236	254	Card	pending	8476	2026-01-08 02:38:42.505669
237	118	NetBanking	pending	4152	2025-05-06 20:44:01.505675
238	724	UPI	pending	8330	2025-06-05 04:43:37.505682
239	606	Card	success	2073	2026-02-04 21:54:14.505691
240	197	Card	failed	389	2025-06-02 03:50:36.505696
241	53	Wallet	failed	8701	2025-11-07 11:16:17.505701
242	228	NetBanking	failed	7951	2026-03-12 17:28:50.505705
243	53	NetBanking	success	4511	2025-10-09 01:33:46.505709
244	429	Card	failed	879	2026-01-10 08:56:28.505714
245	677	NetBanking	success	4774	2025-08-15 00:57:53.505718
246	104	Wallet	success	4233	2024-12-13 18:33:10.505723
247	312	UPI	success	323	2025-04-28 16:06:36.505728
248	134	NetBanking	failed	6020	2025-03-28 15:22:53.505732
249	381	Card	pending	4621	2025-12-26 15:32:26.505736
250	909	UPI	success	9960	2026-02-11 08:18:33.505741
251	906	Card	success	7403	2024-12-26 06:51:57.505745
252	634	NetBanking	failed	7869	2025-03-20 03:21:45.505749
253	158	UPI	success	3240	2025-09-10 16:11:15.505753
254	913	NetBanking	failed	7447	2025-05-25 11:48:33.505757
255	447	UPI	failed	6964	2025-07-18 17:06:30.505761
256	171	NetBanking	pending	2212	2025-11-16 08:20:28.505765
257	814	Card	pending	6612	2025-08-02 12:21:36.50577
258	526	UPI	success	7272	2025-03-24 17:31:56.505774
259	799	Wallet	failed	4548	2025-12-29 04:56:21.505778
260	586	Card	pending	245	2025-01-17 17:26:59.505783
261	725	NetBanking	failed	3709	2025-11-12 11:38:56.505787
262	122	Card	success	847	2025-07-14 02:38:29.505791
263	655	Card	failed	2278	2025-11-26 08:15:16.505795
264	844	Card	pending	2003	2026-04-12 13:33:51.5058
265	620	NetBanking	failed	1463	2024-12-14 10:59:56.505805
266	271	Card	failed	4931	2025-10-29 08:15:39.505809
267	11	NetBanking	success	4682	2026-01-13 01:54:57.505813
268	674	UPI	pending	6358	2024-12-14 13:39:36.505818
269	642	Card	failed	3714	2025-10-29 01:42:54.505823
270	645	Wallet	success	7408	2025-12-15 10:10:04.505832
271	378	Card	failed	1635	2025-08-03 04:27:20.505837
272	836	Card	success	9433	2025-08-04 10:44:50.505841
273	289	UPI	failed	2769	2025-01-15 04:04:06.505845
274	704	Card	success	2451	2026-03-07 20:41:02.50585
275	931	Wallet	success	8730	2026-02-01 10:07:40.505854
276	13	UPI	failed	6391	2026-04-03 06:04:31.505858
277	782	UPI	success	4168	2025-03-15 07:39:22.505863
278	962	UPI	success	1842	2025-07-09 10:04:10.505867
279	874	UPI	success	2381	2025-08-10 14:59:03.505872
280	836	Card	failed	5535	2025-08-11 05:41:28.505876
281	557	NetBanking	pending	9006	2026-02-09 09:04:29.50588
282	106	NetBanking	success	8481	2025-01-14 20:47:31.505884
283	935	Card	success	3813	2025-09-06 21:47:09.505889
284	672	NetBanking	success	6403	2025-04-26 11:03:34.505893
285	116	Wallet	success	1904	2025-12-20 06:38:09.505898
286	79	NetBanking	success	6006	2024-12-27 06:59:29.505902
287	620	Card	success	7122	2025-07-15 23:18:20.505906
288	696	Wallet	success	5040	2025-05-29 00:33:35.505911
289	107	NetBanking	failed	6147	2024-12-22 01:04:33.505915
290	729	UPI	success	2535	2025-03-10 13:47:11.50592
291	152	Wallet	failed	7938	2025-02-20 07:48:55.505924
292	438	NetBanking	success	1581	2025-10-30 05:44:42.505928
293	395	NetBanking	failed	8197	2025-09-07 18:12:05.505933
294	617	NetBanking	success	4128	2025-09-28 20:21:00.505937
295	552	Wallet	pending	8885	2025-02-17 02:32:26.505941
296	595	Wallet	pending	9567	2025-03-11 11:04:44.505946
297	225	UPI	success	6026	2026-04-12 03:02:30.50595
298	372	Wallet	success	1904	2026-03-13 22:32:37.505955
299	870	Card	failed	7643	2026-01-29 15:56:33.505959
300	432	Card	success	3779	2026-03-15 10:48:24.505964
301	986	Card	failed	531	2025-04-21 20:33:28.505968
302	719	UPI	pending	9629	2026-03-06 18:02:53.505972
303	892	Card	success	2506	2025-10-08 05:51:16.505976
304	79	UPI	pending	6923	2026-01-27 04:25:44.505981
305	144	NetBanking	failed	6842	2025-04-08 23:27:41.505985
306	661	UPI	failed	1922	2026-01-24 07:59:50.505989
307	33	Card	pending	2727	2026-04-07 21:03:04.505993
308	697	Wallet	pending	4327	2024-12-28 15:24:12.505998
309	727	Card	failed	2669	2025-11-25 07:23:07.506002
310	974	Card	pending	3571	2025-09-19 14:53:17.506007
311	402	Card	pending	9263	2025-06-08 07:03:47.506011
312	480	Wallet	failed	6737	2025-02-13 21:46:28.506015
313	823	NetBanking	pending	7050	2026-01-04 01:50:25.50602
314	80	NetBanking	pending	5596	2026-03-30 02:38:21.506024
315	555	UPI	success	3571	2025-06-12 09:07:33.506028
316	317	Card	pending	3405	2025-05-22 08:41:14.506032
317	88	UPI	pending	8026	2026-03-21 08:36:26.506037
318	967	NetBanking	success	5943	2025-03-25 00:30:59.506041
319	200	NetBanking	failed	5930	2024-12-01 05:11:48.506046
320	100	NetBanking	failed	8350	2026-02-20 17:04:42.506051
321	154	UPI	pending	6360	2025-08-11 15:00:37.506055
322	39	NetBanking	success	2582	2025-04-28 19:50:35.506059
323	641	UPI	pending	3894	2025-01-16 03:04:48.506064
324	670	Card	pending	2738	2024-12-05 17:22:45.506068
325	624	NetBanking	failed	2249	2025-10-22 00:32:52.506072
326	877	Wallet	success	6450	2025-12-12 03:16:53.506077
327	77	Card	pending	8251	2026-02-23 09:46:42.506081
328	892	NetBanking	pending	1528	2025-08-01 06:27:11.506086
329	174	NetBanking	success	1216	2025-11-20 15:33:09.50609
330	92	UPI	success	7648	2025-12-01 18:39:43.506095
331	898	Wallet	pending	2401	2024-12-18 06:20:00.5061
332	41	NetBanking	failed	6668	2025-09-15 13:57:48.506104
333	133	Wallet	failed	8496	2025-02-04 14:36:08.506109
334	86	Wallet	pending	7474	2025-11-29 12:53:52.506113
335	660	UPI	pending	4111	2025-04-19 16:56:22.506118
336	874	UPI	failed	6257	2026-01-21 15:30:37.506122
337	75	Card	failed	7673	2025-05-06 07:34:02.506129
338	480	Wallet	success	1506	2026-01-10 10:49:33.506133
339	983	Wallet	failed	3368	2025-09-19 23:52:11.506137
340	351	Wallet	success	7902	2026-02-14 01:27:29.506141
341	559	Card	failed	2484	2025-05-21 03:35:55.506146
342	33	Wallet	success	6022	2025-03-04 20:26:18.50615
343	56	Card	success	7029	2025-11-26 01:16:20.506155
344	86	Card	success	4587	2025-09-18 07:36:36.506159
345	730	Wallet	failed	8697	2025-12-24 11:59:15.506163
346	189	UPI	success	7121	2025-10-20 00:46:19.50617
347	358	Wallet	failed	7890	2025-07-12 11:06:21.506176
348	989	Wallet	failed	9444	2025-09-26 09:20:41.506183
349	916	Card	success	9577	2025-06-02 05:35:49.506189
350	844	NetBanking	success	2565	2025-01-08 18:57:22.506193
351	512	NetBanking	success	6758	2025-11-29 17:10:31.506198
352	462	Card	pending	7461	2025-05-20 15:50:29.506203
353	224	Card	failed	9047	2025-03-13 04:18:07.506207
354	222	NetBanking	success	3231	2024-12-01 12:20:31.506212
355	380	NetBanking	success	5047	2025-01-09 00:23:39.506217
356	889	UPI	pending	8277	2025-05-15 19:30:05.506221
357	361	NetBanking	pending	7077	2025-07-19 23:48:32.506226
358	181	Wallet	failed	6213	2026-01-12 16:18:21.506232
359	556	Wallet	failed	4769	2025-02-04 12:11:48.50624
360	448	NetBanking	pending	1725	2026-02-28 06:50:50.506248
361	17	Wallet	success	8233	2025-03-25 13:56:57.506256
362	103	Wallet	pending	9622	2025-02-25 08:14:13.506264
363	873	Wallet	success	3751	2025-03-11 19:21:07.506271
364	118	Card	failed	2138	2025-10-15 19:29:33.50628
365	841	Wallet	success	6238	2025-03-09 02:24:13.506288
366	275	NetBanking	failed	6894	2025-05-04 02:55:34.506295
367	931	Wallet	success	354	2026-03-31 05:06:08.506303
368	861	NetBanking	failed	2892	2024-12-07 15:29:16.50631
369	570	Wallet	success	6544	2025-02-13 08:04:32.506319
370	592	Wallet	success	6496	2024-11-28 10:45:06.506326
371	926	NetBanking	pending	2695	2025-09-02 02:49:46.506334
372	821	Card	pending	2039	2025-05-24 15:06:06.506341
373	864	NetBanking	pending	2705	2024-12-13 23:43:26.506348
374	96	UPI	failed	289	2025-05-26 15:47:30.506356
375	633	UPI	pending	6365	2026-03-31 10:10:23.506363
376	465	NetBanking	success	4027	2025-05-14 02:37:19.50637
377	549	Card	pending	6294	2025-03-15 01:14:28.506377
378	282	UPI	success	479	2025-05-21 15:01:25.506385
379	114	Wallet	pending	2110	2026-02-18 05:38:15.506391
380	917	Card	success	1367	2025-08-02 21:57:38.506398
381	213	Wallet	success	8145	2025-03-02 09:30:27.506405
382	499	UPI	success	6979	2025-10-02 23:15:33.506412
383	462	Card	success	4994	2026-04-08 04:13:55.50642
384	647	UPI	success	5716	2025-10-17 18:16:53.506429
385	560	UPI	success	8648	2025-03-30 00:57:24.506436
386	198	UPI	pending	477	2025-07-21 17:08:22.506443
387	222	NetBanking	success	3654	2026-03-28 23:48:17.506451
388	86	Card	failed	4583	2025-08-10 03:51:09.506458
389	726	NetBanking	failed	8223	2025-09-01 17:30:32.506466
390	198	NetBanking	success	3342	2025-04-26 11:39:06.506474
391	106	NetBanking	success	3472	2024-12-10 10:25:04.506482
392	905	Wallet	failed	9870	2025-03-27 01:04:11.506508
393	638	UPI	pending	6375	2025-09-06 03:20:09.506519
394	383	UPI	failed	2840	2025-01-13 08:24:15.506527
395	601	Wallet	failed	9994	2025-02-13 13:23:09.506534
396	408	UPI	success	3047	2025-02-22 23:28:41.50654
397	191	NetBanking	success	1290	2025-12-23 12:33:08.506545
398	149	NetBanking	success	257	2025-10-31 11:55:46.50655
399	337	Card	failed	9397	2025-03-01 22:59:17.506554
400	576	UPI	failed	4746	2025-06-09 03:23:18.506559
401	106	NetBanking	pending	1325	2025-06-23 13:29:48.506563
402	775	Wallet	failed	5344	2026-01-02 03:52:40.50657
403	506	Wallet	success	4596	2025-09-10 06:49:03.506575
404	176	NetBanking	pending	6372	2025-12-12 15:55:13.506579
405	19	UPI	failed	4759	2026-02-04 21:53:34.506584
406	547	UPI	failed	366	2026-03-08 18:49:38.506588
407	822	Wallet	pending	5031	2025-11-23 23:08:09.506593
408	410	UPI	pending	5231	2025-08-03 14:53:06.506597
409	306	Wallet	failed	2089	2025-02-05 22:17:25.506602
410	30	Card	success	270	2026-02-01 06:35:36.506615
411	705	Wallet	success	2888	2026-02-27 03:09:34.50662
412	832	NetBanking	pending	180	2024-12-20 11:01:28.506625
413	266	UPI	success	886	2024-12-15 00:52:15.506629
414	338	Wallet	failed	2890	2024-12-26 05:19:02.506634
415	123	Card	failed	2524	2025-03-23 14:59:37.506638
416	990	Wallet	pending	7420	2025-05-06 06:22:58.506642
417	247	Wallet	pending	8129	2024-11-30 01:35:42.506647
418	749	Wallet	success	1604	2025-11-29 00:11:26.506651
419	362	Card	pending	3473	2025-04-23 07:52:00.506656
420	62	Card	success	3641	2025-08-16 21:44:00.50666
421	108	NetBanking	success	9775	2025-03-19 17:23:37.506665
422	321	NetBanking	pending	7538	2025-05-13 05:01:59.50667
423	109	Card	success	6057	2025-09-27 19:00:52.506674
424	526	Card	failed	3179	2026-03-09 01:29:21.506679
425	703	NetBanking	pending	1772	2026-01-27 19:00:25.506683
426	763	UPI	success	371	2025-01-10 19:45:14.506687
427	30	Wallet	pending	8798	2025-08-24 22:40:24.506692
428	950	UPI	failed	7169	2025-12-26 05:30:59.506696
429	442	NetBanking	success	7330	2025-11-24 22:50:28.5067
430	665	Wallet	pending	7023	2026-01-04 00:44:06.506704
431	181	NetBanking	pending	8187	2025-07-21 20:49:48.506709
432	52	Card	success	3697	2026-02-14 07:59:29.506713
433	590	NetBanking	success	1178	2025-07-15 06:39:17.506717
434	904	Wallet	failed	6537	2026-02-21 02:09:39.506722
435	901	NetBanking	failed	3470	2026-01-16 03:33:51.506726
436	295	NetBanking	pending	150	2026-02-24 04:23:33.50673
437	718	Wallet	pending	5102	2025-01-31 11:41:21.506735
438	323	UPI	success	3169	2025-10-24 19:47:31.50674
439	683	Wallet	failed	5573	2026-04-03 04:39:35.506744
440	79	Card	pending	259	2025-06-12 22:25:54.506749
441	2	Wallet	success	7842	2026-02-16 08:04:30.506754
442	581	NetBanking	success	8706	2025-07-30 04:08:22.506758
443	794	UPI	success	5090	2025-02-25 10:35:03.506763
444	503	NetBanking	pending	4316	2025-05-08 18:40:08.506767
445	470	UPI	failed	5033	2025-04-14 22:58:58.506771
446	794	Wallet	success	4522	2025-04-26 17:09:51.506776
447	22	Card	failed	3708	2025-05-11 05:34:00.50678
448	32	Card	pending	7156	2025-10-11 03:09:26.506785
449	199	Wallet	pending	1868	2024-12-05 00:59:51.506789
450	696	Wallet	pending	2966	2025-11-28 12:33:35.506794
451	340	Wallet	pending	6936	2024-12-16 01:37:19.506798
452	43	NetBanking	pending	2114	2025-09-03 19:19:41.506803
453	812	NetBanking	failed	1905	2024-12-03 09:24:32.506807
454	702	Card	failed	2561	2025-07-20 00:16:56.506812
455	681	Card	failed	8076	2025-11-17 07:05:13.506817
456	16	Wallet	success	3660	2025-11-19 15:49:28.506825
457	501	NetBanking	success	7150	2025-10-14 12:03:31.506836
458	52	NetBanking	success	5837	2025-01-19 00:05:37.506843
459	515	Card	success	4534	2026-01-29 10:44:04.50685
460	600	UPI	failed	3685	2026-03-27 17:57:09.506861
461	255	Wallet	failed	6639	2024-12-04 05:59:15.506866
462	943	NetBanking	pending	5191	2026-01-14 15:28:48.50687
463	897	NetBanking	pending	2380	2025-04-29 03:40:23.506875
464	427	Card	failed	5097	2026-03-01 00:19:32.506879
465	644	Wallet	pending	3104	2025-10-02 20:50:23.506883
466	540	Wallet	pending	5232	2025-07-29 12:11:09.506887
467	480	NetBanking	failed	7743	2025-09-09 20:27:30.506892
468	935	UPI	failed	1548	2025-03-23 05:16:33.506896
469	310	Card	pending	8491	2025-10-04 05:16:57.5069
470	922	NetBanking	success	6533	2026-02-07 21:14:31.506905
471	474	Wallet	success	1487	2026-03-16 01:02:50.506909
472	110	NetBanking	pending	1695	2025-02-17 00:20:01.506913
473	708	NetBanking	success	2089	2025-03-29 15:12:59.506918
474	758	UPI	pending	3459	2025-07-23 05:20:44.506923
475	991	Wallet	success	3762	2025-01-09 12:15:37.506927
476	159	NetBanking	pending	5193	2025-04-10 09:05:00.506931
477	639	Card	success	1200	2026-04-13 05:17:35.506935
478	124	UPI	success	3447	2026-02-18 18:54:38.50694
479	518	Wallet	failed	1011	2024-12-25 06:37:06.506944
480	496	Card	success	9057	2025-11-30 14:13:03.506949
481	880	UPI	failed	2496	2025-05-23 09:45:22.506953
482	839	Card	success	8480	2025-03-29 11:22:19.506957
483	488	Wallet	failed	4842	2025-05-07 06:19:00.506962
484	377	NetBanking	failed	6421	2025-04-21 06:27:05.506966
485	834	Wallet	success	558	2025-11-18 19:48:55.50697
486	399	UPI	pending	5060	2026-03-26 13:14:34.506974
487	673	Wallet	success	5911	2024-12-07 05:26:35.506979
488	741	Wallet	failed	249	2026-01-21 22:23:37.506983
489	882	Card	failed	8702	2025-09-25 17:52:20.506987
490	672	Card	failed	9326	2025-10-21 19:10:37.506992
491	806	Card	failed	5063	2024-12-26 21:51:33.506996
492	860	Wallet	failed	7829	2025-06-06 12:44:55.507001
493	726	NetBanking	success	5409	2025-06-15 15:33:54.507005
494	633	Wallet	success	836	2026-03-28 10:46:17.507009
495	99	UPI	failed	7905	2025-10-30 02:06:40.507014
496	940	Card	success	2950	2025-04-05 21:08:05.507018
497	945	UPI	success	4203	2026-02-14 08:01:44.507023
498	75	Wallet	failed	582	2024-12-27 04:36:25.507027
499	716	Wallet	failed	2282	2025-05-21 15:21:19.507032
500	201	NetBanking	failed	7268	2025-05-01 00:42:19.507036
501	760	Card	failed	8759	2025-02-23 03:50:54.50704
502	25	UPI	success	644	2025-02-23 04:59:31.507045
503	369	Wallet	pending	9055	2025-01-26 07:35:20.507049
504	699	Wallet	success	3499	2025-06-24 18:24:09.507054
505	366	Card	success	7290	2025-09-06 13:31:36.507059
506	73	UPI	success	8574	2025-11-12 06:49:00.507063
507	237	UPI	pending	8956	2025-10-26 09:41:39.507072
508	964	NetBanking	failed	6496	2025-04-17 22:51:36.507077
509	893	Card	failed	1325	2025-07-13 15:40:37.507081
510	531	NetBanking	failed	1028	2025-07-07 10:59:24.507085
511	597	Wallet	failed	591	2026-03-27 23:30:15.50709
512	206	NetBanking	success	2382	2025-12-29 16:03:45.507095
513	338	UPI	success	8186	2026-03-06 14:58:52.507099
514	720	UPI	failed	1259	2024-12-12 20:17:44.507104
515	628	UPI	pending	7944	2024-12-15 05:38:45.507108
516	43	UPI	success	8236	2025-07-28 02:15:09.507112
517	442	Wallet	failed	3831	2026-04-03 08:54:42.507117
518	801	Card	pending	6315	2025-04-28 12:09:30.507121
519	566	Wallet	success	6442	2025-03-16 21:12:23.507125
520	441	Wallet	pending	2357	2026-02-12 19:48:34.50713
521	631	NetBanking	failed	3272	2025-10-19 19:58:28.507134
522	244	Card	success	9743	2026-04-08 02:29:44.507139
523	771	UPI	success	4194	2025-02-21 08:52:28.507143
524	130	Wallet	success	4730	2026-03-21 23:33:53.507148
525	671	Card	failed	2225	2025-06-06 21:25:49.507152
526	126	UPI	success	4199	2024-12-18 16:43:00.507157
527	723	NetBanking	success	7366	2025-04-13 00:32:42.507161
528	565	NetBanking	pending	4101	2025-07-18 01:35:47.507166
529	555	UPI	success	5779	2025-01-06 20:10:52.50717
530	498	NetBanking	success	3435	2025-01-02 05:02:58.507175
531	237	NetBanking	pending	9159	2025-12-27 06:32:45.507179
532	836	Card	success	3951	2025-04-20 19:14:43.507183
533	465	UPI	success	8274	2025-02-09 08:39:14.507187
534	603	Wallet	failed	1484	2026-03-14 01:01:52.507191
535	394	Wallet	success	6368	2025-09-28 19:54:17.507196
536	211	Wallet	success	7162	2025-07-15 08:14:12.5072
537	33	NetBanking	success	5608	2024-12-27 01:04:43.507204
538	606	Card	success	5686	2025-04-06 14:28:36.507208
539	438	UPI	success	9165	2025-09-26 09:56:48.507212
540	295	Wallet	failed	9481	2025-04-09 15:06:58.507216
541	267	Card	failed	7756	2025-03-28 02:47:33.50722
542	16	NetBanking	pending	4595	2026-03-01 02:06:57.507226
543	303	NetBanking	pending	6565	2026-03-24 14:39:08.507231
544	276	NetBanking	pending	302	2026-02-09 00:19:49.507235
545	329	NetBanking	success	7371	2025-08-20 09:28:31.507239
546	478	UPI	failed	7967	2025-05-21 16:43:05.507243
547	60	UPI	failed	9134	2025-11-04 07:28:20.507247
548	265	NetBanking	failed	8208	2026-02-07 02:16:20.507251
549	151	UPI	success	1975	2025-05-13 08:44:48.507256
550	519	Wallet	pending	5299	2026-03-22 16:11:17.507259
551	63	NetBanking	failed	364	2025-04-30 22:21:46.507264
552	46	Card	failed	1888	2026-03-04 17:28:24.507268
553	524	UPI	success	3443	2025-10-28 15:32:38.507273
554	843	Wallet	success	7087	2025-01-20 00:47:30.507277
555	335	NetBanking	failed	6786	2025-01-08 13:33:01.507281
556	966	NetBanking	pending	610	2026-01-20 22:54:13.507285
557	953	Card	pending	518	2026-02-17 14:42:40.507289
558	321	NetBanking	success	6306	2025-02-11 15:53:49.507293
559	744	Card	failed	1385	2024-12-10 06:57:17.507298
560	579	Wallet	pending	2086	2025-02-03 17:05:28.507302
561	622	Wallet	pending	8692	2025-07-20 19:36:14.507306
562	200	NetBanking	success	5485	2025-12-09 22:42:02.50731
563	323	UPI	pending	4049	2025-08-28 10:00:05.507314
564	371	UPI	failed	9282	2025-07-29 06:58:08.507318
565	670	Wallet	pending	3874	2025-08-26 20:41:55.507322
566	848	Card	pending	4113	2025-03-11 20:12:54.507326
567	682	Card	pending	4364	2025-03-02 00:35:11.50733
568	121	UPI	failed	6998	2025-07-29 05:20:00.507334
569	648	Card	success	7539	2026-04-06 04:49:05.507339
570	270	Wallet	pending	1754	2026-02-08 08:03:04.507343
571	25	Card	success	2268	2025-07-23 16:58:07.507348
572	926	Wallet	failed	2188	2025-09-19 11:21:16.507352
573	730	NetBanking	success	5618	2025-01-08 23:18:53.507356
574	632	UPI	pending	841	2026-03-06 09:58:09.50736
575	973	Wallet	failed	7468	2025-03-29 20:37:43.507366
576	489	Card	pending	3105	2025-04-07 14:57:39.50737
577	960	UPI	success	227	2025-06-13 15:32:48.507375
578	665	Wallet	failed	5350	2025-09-01 04:23:45.507379
579	603	NetBanking	success	3905	2025-11-11 18:35:28.507384
580	578	Wallet	failed	5388	2025-09-28 23:08:20.507388
581	977	Card	success	3551	2025-09-04 17:38:55.507393
582	901	NetBanking	success	5790	2025-11-19 04:49:13.507398
583	281	Wallet	failed	3764	2025-01-15 04:37:33.507402
584	266	UPI	success	4665	2026-01-31 06:42:56.507406
585	859	Card	success	9904	2025-01-06 07:58:57.507411
586	551	Card	success	8101	2025-02-11 09:33:18.507415
587	289	Wallet	pending	7388	2025-07-21 05:03:02.50742
588	303	UPI	pending	2065	2025-08-28 20:25:15.507424
589	89	Card	failed	2008	2024-12-03 22:05:26.507429
590	763	Card	pending	1318	2025-10-28 04:24:10.507433
591	283	Wallet	pending	8502	2025-05-04 07:10:47.507437
592	323	UPI	failed	1745	2024-12-21 11:05:58.507444
593	326	Card	pending	683	2024-12-13 13:16:31.50745
594	252	Card	pending	6263	2025-01-22 02:13:19.507458
595	272	Wallet	success	8038	2025-02-21 04:10:00.507465
596	290	Card	success	1553	2024-12-12 17:01:45.507473
597	768	Card	success	7215	2026-03-09 18:20:52.50748
598	214	Card	success	6951	2025-04-26 01:17:07.507487
599	647	Card	pending	5813	2025-08-08 17:14:20.507495
600	899	NetBanking	success	4886	2025-05-05 18:24:41.507501
601	646	Wallet	pending	5951	2025-07-08 18:38:25.507508
602	225	UPI	failed	6974	2024-12-02 19:36:16.507514
603	679	Wallet	success	2986	2025-08-18 23:14:24.50752
604	356	Wallet	pending	2198	2025-03-12 18:02:40.507527
605	885	Wallet	pending	6850	2025-04-27 02:55:13.507534
606	275	Card	failed	1096	2025-06-29 23:39:48.50754
607	326	Wallet	failed	7340	2025-09-07 21:39:33.507547
608	56	NetBanking	failed	3687	2025-10-21 13:04:29.507553
609	316	Wallet	failed	3725	2025-06-24 04:22:18.507559
610	799	UPI	pending	5501	2026-02-05 14:22:30.507567
611	974	UPI	failed	1578	2025-03-09 11:34:33.507574
612	362	UPI	pending	906	2025-07-22 03:32:57.507582
613	204	Card	pending	6580	2025-01-27 11:42:13.507589
614	821	Card	failed	5531	2025-09-14 03:20:45.507597
615	255	UPI	success	428	2025-03-22 17:49:59.507605
616	408	Wallet	success	2671	2025-11-20 00:55:17.507611
617	647	Card	success	4563	2025-03-26 06:03:41.507615
618	387	Wallet	success	4523	2025-01-27 07:52:27.50762
619	517	Wallet	success	341	2025-03-28 16:17:33.507624
620	156	UPI	pending	9736	2025-03-03 21:43:38.507629
621	621	NetBanking	failed	7065	2025-07-24 10:55:12.507633
622	281	Wallet	success	1733	2025-11-28 13:20:01.507638
623	386	NetBanking	failed	1624	2025-12-20 20:21:14.507643
624	495	NetBanking	pending	8836	2025-07-28 02:32:30.507647
625	509	Wallet	failed	9055	2025-04-13 06:28:17.507652
626	592	UPI	failed	3902	2025-08-27 22:25:55.507657
627	112	NetBanking	failed	2455	2025-02-22 13:51:25.507664
628	575	Card	success	8125	2025-06-14 02:51:22.507672
629	413	Wallet	pending	9383	2025-03-20 02:52:42.507681
630	506	NetBanking	failed	5202	2025-03-29 23:03:22.507688
631	38	NetBanking	pending	9362	2025-06-10 20:01:31.507693
632	275	Card	pending	8107	2025-07-07 18:35:50.507698
633	242	NetBanking	failed	8013	2025-07-23 16:01:44.507705
634	751	UPI	success	7074	2025-04-20 07:32:23.507712
635	776	UPI	success	8618	2025-03-26 06:46:19.507719
636	449	UPI	success	7049	2025-08-03 04:15:40.507727
637	538	Wallet	success	9063	2025-09-10 21:56:13.507733
638	121	Wallet	failed	4541	2025-07-19 23:16:35.507741
639	381	Card	success	4854	2025-07-19 12:42:40.507748
640	629	NetBanking	pending	4216	2025-08-14 19:42:32.507756
641	339	Card	success	8691	2025-04-11 18:56:11.507762
642	427	Card	success	7808	2026-03-10 09:36:47.50777
643	193	Card	pending	1637	2025-07-11 19:35:25.507777
644	63	Wallet	pending	2663	2026-03-09 22:15:56.507785
645	905	Card	failed	331	2024-12-24 03:39:13.507792
646	841	Wallet	pending	5109	2025-10-06 14:07:06.5078
647	957	NetBanking	pending	8964	2025-05-19 12:44:27.507807
648	607	Card	success	3646	2025-11-21 04:39:55.507812
649	105	Card	pending	9722	2025-05-17 21:34:55.507817
650	791	NetBanking	pending	7856	2025-12-27 04:55:41.507823
651	238	Card	success	2500	2026-01-30 04:25:36.507831
652	1	NetBanking	success	955	2026-02-01 17:05:03.507838
653	436	Wallet	failed	5057	2025-07-31 06:40:56.507843
654	403	Wallet	failed	7873	2025-10-14 00:02:58.507848
655	325	UPI	pending	3604	2024-12-10 04:15:38.507852
656	285	Card	failed	9283	2025-08-29 18:11:41.507857
657	257	UPI	pending	7233	2025-05-14 22:45:30.507861
658	887	NetBanking	failed	5768	2025-04-05 20:42:52.507865
659	574	Card	failed	6230	2026-01-11 10:56:19.50787
660	453	NetBanking	pending	3293	2026-04-10 15:37:10.507874
661	97	NetBanking	failed	8337	2024-12-28 09:18:14.507878
662	35	NetBanking	pending	7943	2025-09-22 08:11:46.507883
663	260	NetBanking	pending	1037	2024-12-01 15:04:30.507887
664	884	Wallet	pending	7546	2025-08-05 04:25:44.507891
665	896	UPI	success	6154	2026-03-29 13:58:46.507896
666	157	Card	success	1456	2025-09-11 06:53:03.5079
667	653	UPI	failed	1697	2025-01-28 16:38:37.507904
668	199	UPI	failed	5285	2025-01-08 11:45:34.507909
669	601	NetBanking	pending	332	2024-12-17 12:31:05.507914
670	858	UPI	success	3261	2025-02-14 17:46:45.507918
671	274	UPI	success	7364	2026-03-22 01:18:19.507922
672	706	Wallet	success	152	2025-11-05 01:21:09.507927
673	121	NetBanking	failed	9408	2025-02-08 11:50:55.507931
674	953	Wallet	success	2004	2024-12-29 07:44:45.507939
675	89	Card	failed	9785	2025-05-28 09:07:21.507946
676	808	UPI	success	6236	2025-08-21 06:59:45.507954
677	966	Card	failed	3230	2025-03-26 10:48:12.507963
678	55	Wallet	pending	4803	2026-01-12 01:47:55.507971
679	324	Wallet	success	3184	2025-11-25 03:45:13.507979
680	266	Wallet	failed	1614	2025-08-05 22:19:08.507987
681	358	Wallet	pending	2893	2026-03-25 15:32:22.507995
682	551	Card	pending	7208	2025-10-17 13:04:48.508028
683	816	NetBanking	success	5706	2025-04-19 17:20:38.508052
684	761	NetBanking	success	8509	2025-03-14 03:40:18.508063
685	479	NetBanking	success	1989	2025-07-22 12:16:20.508072
686	487	Card	failed	9714	2025-10-29 22:20:07.50808
687	675	UPI	failed	1813	2025-05-25 22:00:34.508089
688	9	Card	failed	7890	2025-10-23 23:14:34.508097
689	103	Card	failed	5118	2026-01-19 19:22:20.508106
690	771	UPI	failed	7578	2025-06-13 15:12:04.508114
691	749	Wallet	failed	4090	2025-12-04 10:32:53.508122
692	346	Wallet	pending	6672	2025-11-11 07:56:35.50813
693	240	UPI	failed	7077	2025-03-13 01:20:06.508138
694	608	UPI	success	8491	2026-01-17 23:59:53.508145
695	989	Card	pending	2386	2026-02-05 12:34:41.508179
696	983	UPI	success	5167	2025-03-04 05:05:09.508184
697	470	Wallet	success	7646	2026-04-12 12:47:19.508192
698	905	Card	failed	5138	2026-03-03 04:40:37.508199
699	209	Wallet	success	4109	2026-01-24 12:20:37.508206
700	795	NetBanking	success	7920	2026-01-21 22:50:01.508213
701	564	Wallet	pending	3581	2024-12-31 18:14:07.50822
702	852	Wallet	pending	4077	2025-03-19 06:32:23.508227
703	326	Card	failed	5459	2025-01-09 00:03:48.508231
704	748	Wallet	pending	6552	2025-07-14 07:34:00.508236
705	686	UPI	success	3018	2025-03-16 02:33:08.50824
706	349	UPI	pending	9916	2025-03-24 20:58:27.508245
707	662	Card	success	8291	2026-01-07 08:43:12.508249
708	446	UPI	failed	6392	2025-05-14 04:29:22.508254
709	292	NetBanking	failed	7975	2026-03-27 01:30:20.508261
710	168	Wallet	pending	8576	2025-02-10 06:26:40.508268
711	85	NetBanking	pending	1761	2025-05-12 21:04:40.508275
712	13	Card	failed	2209	2025-06-22 17:31:48.508283
713	466	UPI	failed	6681	2025-09-09 08:37:04.50829
714	265	UPI	pending	7477	2025-07-29 22:07:01.508298
715	730	NetBanking	pending	6077	2026-02-15 04:28:57.508305
716	778	Wallet	pending	1410	2026-01-27 09:34:32.508312
717	725	NetBanking	success	8536	2025-02-20 14:09:36.508316
718	466	Wallet	success	7714	2025-11-20 08:48:36.50832
719	502	Wallet	failed	920	2025-01-12 14:13:08.508325
720	259	Wallet	failed	4952	2025-03-17 09:22:14.508329
721	184	NetBanking	failed	6933	2026-04-04 19:36:12.508333
722	652	UPI	pending	1929	2025-10-12 10:53:57.508338
723	757	Wallet	success	2971	2026-02-28 16:50:23.508342
724	745	Card	pending	8184	2025-09-05 01:34:02.508347
725	706	Card	pending	8677	2025-06-25 19:54:27.508354
726	335	NetBanking	success	2504	2025-06-05 10:15:40.508362
727	904	UPI	failed	8498	2025-04-07 07:34:32.508369
728	653	NetBanking	failed	6665	2026-04-02 04:09:15.508374
729	739	UPI	failed	2007	2025-03-03 03:20:15.508379
730	311	Card	pending	900	2025-10-03 15:26:18.508383
731	779	Wallet	failed	3142	2025-11-22 17:14:29.508388
732	620	Wallet	success	4768	2025-11-25 09:30:18.508392
733	20	Wallet	pending	2226	2025-11-24 01:26:53.508396
734	810	NetBanking	success	3726	2025-12-19 09:11:11.5084
735	227	UPI	pending	4815	2025-04-05 11:17:39.508404
736	472	Wallet	pending	9852	2025-10-26 16:32:01.508409
737	953	UPI	failed	5680	2025-10-31 22:04:03.508413
738	156	Wallet	pending	8275	2025-12-26 16:12:21.508417
739	690	Wallet	failed	6701	2026-03-27 12:01:55.508422
740	991	UPI	pending	8071	2025-06-29 22:51:18.508426
741	766	NetBanking	failed	4881	2025-03-24 23:27:48.50843
742	479	UPI	success	9683	2026-01-17 14:33:55.508434
743	442	Wallet	success	4751	2025-07-02 10:25:16.508439
744	385	Card	failed	2123	2026-02-22 21:43:18.508443
745	114	NetBanking	success	2706	2025-03-16 10:30:56.508448
746	419	NetBanking	success	6951	2025-01-06 14:39:11.508452
747	789	NetBanking	pending	1830	2025-05-07 12:15:43.508456
748	652	NetBanking	pending	8875	2025-07-14 21:41:37.508461
749	414	Wallet	failed	4790	2025-02-14 19:45:32.508465
750	895	Card	failed	4825	2026-04-11 16:03:10.508469
751	782	Wallet	pending	2922	2025-04-29 06:31:54.508473
752	669	Wallet	failed	6822	2026-01-06 13:54:52.508478
753	230	Card	pending	8347	2026-03-02 14:19:45.508482
754	419	UPI	failed	4195	2026-01-17 15:16:01.508487
755	701	UPI	failed	472	2025-03-28 13:59:41.508491
756	670	Wallet	pending	8477	2025-01-26 03:01:33.508495
757	166	Wallet	failed	4020	2026-01-13 17:56:46.508499
758	944	Card	failed	2273	2025-11-14 06:59:30.508503
759	212	Wallet	failed	4114	2025-04-27 14:28:16.508507
760	816	Card	failed	8295	2025-05-20 06:04:53.508512
761	858	NetBanking	success	4111	2025-08-19 10:52:31.508516
762	767	UPI	pending	6757	2025-01-24 17:25:36.508522
763	395	UPI	failed	4360	2025-01-15 11:22:24.508526
764	733	UPI	failed	7977	2025-02-13 10:53:13.50853
765	832	Wallet	pending	753	2025-10-08 21:10:32.508535
766	524	Wallet	failed	2132	2026-02-19 05:02:15.508539
767	777	UPI	pending	2868	2025-10-07 20:14:10.508543
768	146	Card	failed	3542	2025-11-29 06:34:50.508547
769	711	UPI	failed	8153	2025-03-24 02:08:15.508552
770	351	NetBanking	pending	7385	2025-10-25 19:12:15.508556
771	582	NetBanking	pending	685	2025-03-20 05:46:58.50856
772	296	UPI	success	6176	2025-06-28 22:11:13.508564
773	315	Card	pending	5092	2025-08-12 11:27:48.508569
774	302	Card	pending	2206	2026-01-27 14:37:37.508573
775	394	NetBanking	pending	3834	2026-03-30 03:19:12.508577
776	152	UPI	failed	6066	2025-04-08 17:08:36.508584
777	530	Wallet	failed	2891	2024-12-01 22:15:22.50859
778	602	NetBanking	pending	6233	2025-10-01 18:15:21.508597
779	892	Wallet	success	8029	2025-01-08 21:55:49.508605
780	970	UPI	failed	3783	2025-11-06 03:42:22.508611
781	285	UPI	pending	3326	2025-10-12 18:26:55.508633
782	935	UPI	pending	8687	2025-01-09 02:09:19.508639
783	373	UPI	failed	1719	2024-12-11 23:24:27.508646
784	278	UPI	success	7417	2025-06-26 17:41:16.508662
785	263	Card	pending	4115	2025-12-17 11:11:02.508679
786	182	UPI	pending	4454	2025-07-05 01:50:44.508686
787	195	UPI	success	8661	2025-11-09 08:43:17.508693
788	250	Wallet	failed	1710	2025-07-13 08:35:41.5087
789	650	UPI	success	7936	2026-02-12 19:51:01.508708
790	203	UPI	pending	9756	2025-12-23 14:25:12.508714
791	583	UPI	pending	7141	2025-01-28 06:09:35.508718
792	454	Card	pending	7575	2026-04-13 01:08:05.508723
793	616	NetBanking	failed	2992	2025-10-26 17:25:59.508728
794	291	NetBanking	failed	8819	2025-12-06 23:38:48.508732
795	575	NetBanking	pending	7309	2026-02-15 04:25:31.508736
796	327	Wallet	failed	2772	2026-01-12 07:08:04.508741
797	690	NetBanking	success	7361	2025-10-19 13:12:57.508746
798	843	Card	success	1881	2025-03-19 02:43:12.508751
799	514	NetBanking	failed	8790	2025-08-15 06:13:12.508756
800	950	Card	pending	2632	2025-10-30 04:43:42.50876
801	406	Card	success	2674	2025-10-28 17:25:50.508764
802	610	Wallet	pending	4513	2025-12-17 01:25:32.508769
803	877	NetBanking	failed	2475	2025-11-07 23:10:09.508773
804	850	NetBanking	failed	5146	2025-09-07 15:30:43.508777
805	428	UPI	failed	1006	2024-12-03 20:33:50.508782
806	825	Card	failed	4592	2026-04-03 11:44:18.508787
807	678	NetBanking	failed	6219	2026-03-31 23:28:41.508792
808	392	NetBanking	pending	9274	2025-03-31 03:05:18.508796
809	633	Wallet	failed	1850	2026-03-06 02:46:11.508801
810	741	Wallet	pending	9814	2025-08-16 08:06:49.508805
811	400	Wallet	success	4689	2025-06-06 15:32:28.50881
812	104	UPI	pending	5714	2025-11-22 16:33:03.508815
813	946	NetBanking	success	7830	2026-02-03 10:52:11.508819
814	794	Wallet	success	2564	2025-06-16 00:20:19.508824
815	576	UPI	failed	4117	2025-10-27 15:21:43.508828
816	677	NetBanking	pending	8800	2025-02-19 00:12:30.508832
817	144	UPI	pending	5243	2024-12-08 21:58:42.508837
818	457	Card	success	5363	2025-08-17 02:27:08.508841
819	342	Card	pending	4343	2025-12-03 14:08:32.508845
820	24	Card	success	6830	2025-09-06 21:05:00.50885
821	818	UPI	pending	1087	2024-12-31 17:33:30.508854
822	580	Wallet	success	8361	2025-01-20 23:05:57.508858
823	504	NetBanking	pending	5568	2025-05-24 07:09:27.508863
824	579	UPI	pending	1940	2025-07-15 04:04:59.508867
825	867	UPI	pending	7775	2025-06-04 13:43:43.508872
826	75	Wallet	failed	7730	2025-08-24 10:46:50.508877
827	339	UPI	success	9524	2025-10-21 19:22:42.508881
828	710	Wallet	success	6677	2025-06-23 00:55:52.508886
829	849	Wallet	success	239	2025-12-18 23:29:22.50889
830	266	Card	pending	5451	2025-07-14 19:14:49.508895
831	206	NetBanking	pending	9551	2026-01-25 03:07:22.508899
832	212	NetBanking	success	1753	2026-03-30 16:17:37.508903
833	41	Card	pending	5810	2024-12-11 07:35:36.508908
834	323	Card	pending	3521	2025-12-31 00:46:04.508912
835	278	Card	success	5921	2026-03-31 04:59:34.508917
836	968	Wallet	success	6245	2026-03-30 19:00:44.508921
837	875	Card	failed	906	2025-08-27 19:31:19.508925
838	211	Wallet	pending	2142	2026-02-25 04:23:33.50893
839	593	UPI	success	3534	2026-02-10 18:08:53.508934
840	367	NetBanking	failed	3229	2025-12-27 07:04:59.508938
841	369	Wallet	failed	8435	2026-02-14 19:55:31.508943
842	390	Wallet	failed	1739	2025-10-13 22:36:38.508947
843	67	Wallet	pending	5026	2025-12-16 11:50:50.508952
844	660	Wallet	failed	359	2024-12-12 01:09:50.508956
845	919	NetBanking	success	2405	2025-02-04 02:44:55.50896
846	10	Card	pending	2651	2026-01-31 11:25:43.508965
847	40	UPI	pending	3537	2025-01-24 10:14:13.508969
848	381	Wallet	success	6968	2026-01-15 03:56:58.508973
849	989	Card	pending	3075	2025-10-09 06:06:21.508978
850	31	Wallet	success	5114	2025-09-18 13:32:33.508982
851	862	NetBanking	pending	5360	2026-03-30 09:35:30.508986
852	911	Wallet	success	2464	2024-12-31 20:53:57.508991
853	387	Card	success	1740	2026-04-05 21:59:17.508995
854	95	Wallet	success	1941	2024-12-03 18:27:05.508999
855	877	Wallet	success	9983	2025-02-22 13:56:12.509004
856	488	Wallet	failed	2200	2025-10-29 12:22:08.509008
857	980	UPI	failed	8174	2025-03-25 15:44:23.509013
858	225	Card	success	3795	2025-05-11 07:09:25.509017
859	735	Wallet	failed	1824	2025-12-07 02:40:20.509022
860	748	NetBanking	failed	7671	2025-05-05 15:22:58.509027
861	592	NetBanking	success	5473	2025-09-08 22:14:22.509031
862	594	UPI	pending	6408	2025-05-25 08:06:19.509035
863	187	UPI	success	658	2025-02-10 02:46:06.50904
864	331	UPI	pending	7977	2025-08-08 22:43:51.509044
865	891	Wallet	failed	3619	2025-08-23 14:39:57.509048
866	451	UPI	pending	4676	2025-05-12 16:57:10.509052
867	346	Card	failed	5686	2025-02-23 18:06:56.509056
868	468	UPI	pending	5709	2025-03-18 17:40:27.50906
869	801	NetBanking	failed	516	2024-12-05 16:48:25.509064
870	233	Wallet	success	2070	2025-07-05 11:38:23.509068
871	895	NetBanking	failed	7514	2025-09-01 16:50:36.509072
872	996	Card	failed	8470	2026-01-04 05:02:48.509076
873	228	UPI	success	5898	2025-07-17 14:07:22.50908
874	577	UPI	pending	6041	2025-07-11 02:11:58.509084
875	171	NetBanking	success	1740	2025-04-30 04:15:51.509088
876	880	Card	pending	2591	2025-07-10 14:28:37.509092
877	208	NetBanking	success	6667	2025-11-12 20:58:58.509096
878	996	Wallet	failed	7767	2025-10-31 05:10:12.5091
879	1	UPI	failed	9205	2025-05-06 00:42:32.509104
880	752	UPI	success	6823	2026-02-01 05:25:39.509109
881	165	Card	failed	2712	2025-05-17 20:30:54.509113
882	199	Card	failed	1255	2025-12-19 01:47:34.509117
883	412	UPI	pending	9699	2024-12-15 12:47:18.509121
884	455	Card	pending	4613	2025-03-19 23:55:51.509125
885	121	NetBanking	pending	1781	2025-03-13 13:18:01.509129
886	238	Wallet	failed	2145	2025-07-09 10:17:02.509133
887	158	UPI	pending	5693	2025-01-20 01:54:07.509137
888	859	NetBanking	success	7743	2025-09-06 15:45:35.509141
889	727	Wallet	failed	3780	2025-07-20 06:50:45.509145
890	618	NetBanking	success	8202	2025-02-08 11:29:05.509149
891	59	UPI	failed	4619	2025-01-05 01:15:59.509154
892	337	Wallet	pending	4216	2025-10-13 07:56:25.509158
893	731	Wallet	success	9697	2025-08-03 02:19:04.509162
894	682	NetBanking	success	8093	2025-06-29 14:02:55.509166
895	385	Wallet	success	9957	2026-02-16 15:02:41.50917
896	659	UPI	pending	1655	2026-02-12 02:32:54.509174
897	689	Wallet	failed	753	2025-10-17 13:06:03.509178
898	873	Wallet	pending	8664	2026-03-24 21:03:40.509183
899	644	Wallet	pending	520	2025-12-23 15:45:30.509187
900	646	NetBanking	success	4888	2024-12-27 20:05:30.50919
901	747	Wallet	failed	5975	2025-02-17 12:34:09.509194
902	997	Card	failed	7407	2025-03-08 08:36:02.509198
903	716	NetBanking	success	3530	2025-07-01 16:15:11.509203
904	759	Wallet	failed	2918	2025-02-04 18:02:26.509207
905	342	NetBanking	pending	8918	2025-03-31 02:35:38.509211
906	314	UPI	pending	1581	2025-05-20 21:35:52.509215
907	510	Card	failed	3412	2025-11-28 11:25:09.509219
908	346	Wallet	failed	2708	2024-12-08 04:36:30.509223
909	115	Card	pending	5187	2025-01-02 17:11:50.50923
910	574	NetBanking	pending	8918	2026-01-11 21:16:47.509236
911	78	Card	success	1583	2025-04-13 13:57:35.509242
912	680	Wallet	failed	2488	2025-04-11 23:22:09.509249
913	407	Card	failed	1797	2025-02-04 10:03:35.509255
914	909	NetBanking	pending	9440	2024-12-02 07:36:17.509262
915	454	UPI	success	9078	2026-01-23 12:39:30.509266
916	507	Card	pending	3687	2025-12-09 02:27:50.509271
917	832	Card	success	303	2025-11-13 02:54:37.509275
918	627	Wallet	failed	6891	2025-07-02 16:20:19.509279
919	423	Card	pending	9617	2025-09-20 13:19:35.509284
920	924	Wallet	pending	4384	2025-04-16 22:04:40.509288
921	270	Wallet	failed	6072	2025-01-08 02:35:57.509294
922	366	UPI	pending	2303	2025-10-30 11:40:41.509301
923	552	Card	success	8414	2025-04-15 18:22:11.509309
924	108	Card	pending	5807	2025-04-10 11:14:56.509317
925	841	Card	failed	4509	2025-06-23 08:26:52.509324
926	449	Wallet	pending	7246	2026-03-11 04:54:56.50933
927	460	UPI	failed	7909	2025-01-23 11:47:27.509338
928	699	NetBanking	success	4623	2025-06-26 00:58:45.509344
929	29	Wallet	failed	2284	2025-09-23 03:14:03.509352
930	318	NetBanking	failed	3910	2025-06-25 17:30:22.50936
931	785	NetBanking	success	967	2025-04-13 22:19:24.509367
932	794	UPI	pending	1142	2025-07-15 20:10:21.509375
933	751	Card	success	9955	2025-03-13 04:03:20.509382
934	31	Wallet	pending	2057	2025-10-26 07:50:06.509389
935	588	Wallet	failed	6347	2025-04-21 18:47:37.509397
936	352	Card	success	5198	2025-10-14 04:11:04.509404
937	901	NetBanking	failed	1586	2026-01-09 01:31:19.509411
938	233	NetBanking	pending	1436	2025-10-21 19:08:25.509418
939	537	NetBanking	success	1097	2025-07-02 08:13:08.509424
940	98	Card	success	8769	2026-04-07 09:36:07.509432
941	314	UPI	pending	9330	2025-10-04 07:45:19.509438
942	652	Wallet	success	8868	2025-12-22 22:49:36.509446
943	700	Card	pending	6230	2025-06-24 03:59:03.509454
944	724	Card	pending	2538	2025-02-20 19:54:52.509461
945	40	UPI	failed	4874	2026-02-16 22:13:20.50947
946	605	Card	success	8253	2026-01-04 14:46:52.509478
947	943	NetBanking	failed	9078	2025-02-11 21:06:03.509484
948	967	UPI	pending	9184	2026-03-10 23:41:08.509491
949	145	Card	failed	3185	2025-03-02 21:54:09.509497
950	61	Wallet	pending	9785	2026-02-21 17:50:49.50951
951	671	NetBanking	pending	9324	2025-06-22 11:21:58.509523
952	404	Card	failed	5348	2026-02-02 19:08:19.509536
953	300	Wallet	failed	7229	2025-10-02 07:25:30.509542
954	504	UPI	failed	9295	2025-08-08 14:32:12.509549
955	510	NetBanking	pending	1003	2025-07-17 08:44:26.509556
956	315	Card	pending	5238	2025-03-31 08:22:30.509563
957	49	NetBanking	failed	3184	2025-10-14 16:52:39.509569
958	846	Wallet	pending	8429	2025-07-19 04:24:08.509577
959	698	UPI	success	1716	2025-08-22 03:59:17.509584
960	730	NetBanking	success	3435	2025-08-03 03:19:51.509592
961	628	UPI	success	6350	2025-12-28 11:48:32.509603
962	298	UPI	success	5519	2026-01-12 21:04:17.50961
963	381	Wallet	success	2654	2026-01-30 14:40:52.509618
964	685	NetBanking	failed	9447	2025-04-14 13:37:18.509625
965	963	NetBanking	failed	267	2025-09-12 20:32:14.509632
966	863	Card	failed	4252	2025-06-10 09:15:47.50964
967	405	UPI	pending	7458	2026-02-06 12:12:17.509647
968	73	UPI	success	2703	2025-01-06 18:52:20.509651
969	550	NetBanking	success	4302	2024-12-09 12:10:32.509656
970	712	Wallet	failed	8886	2025-11-18 00:01:55.50966
971	268	UPI	success	6570	2025-02-16 03:50:56.509666
972	867	Wallet	success	2182	2025-07-22 08:26:01.509673
973	112	UPI	success	723	2025-02-10 21:45:26.50968
974	781	UPI	success	7242	2025-06-01 22:27:44.509688
975	147	Wallet	pending	772	2025-05-08 17:07:19.509694
976	787	Card	pending	5308	2026-03-21 15:56:22.509699
977	350	NetBanking	success	5836	2025-08-20 02:58:50.509704
978	58	Wallet	failed	2608	2024-12-15 00:24:27.509708
979	231	Card	pending	3284	2025-10-23 12:10:03.509712
980	26	Wallet	success	4126	2025-06-08 17:37:56.509717
981	165	Card	pending	5302	2026-03-15 06:13:27.509723
982	420	UPI	pending	2883	2025-04-07 23:33:29.509727
983	147	UPI	pending	3928	2026-04-09 21:55:55.509732
984	60	Wallet	pending	2060	2025-01-30 02:07:51.509736
985	37	UPI	success	7905	2024-12-19 15:15:07.509741
986	290	Wallet	failed	3993	2025-04-28 18:17:15.509745
987	354	Wallet	failed	2609	2025-08-23 16:00:08.50975
988	230	Card	failed	2956	2024-12-05 21:39:35.509755
989	165	NetBanking	pending	443	2025-09-04 00:47:29.509759
990	471	Wallet	pending	8971	2025-02-01 02:31:23.509765
991	861	NetBanking	success	6748	2025-09-09 20:26:45.509772
992	464	Wallet	failed	7694	2025-10-08 23:35:49.50978
993	409	Card	pending	8782	2025-12-29 02:42:46.509805
994	196	Card	pending	6054	2025-01-07 19:20:36.509821
995	783	Wallet	failed	5128	2025-12-24 21:47:01.509853
996	112	Wallet	failed	6852	2026-03-18 03:43:10.509863
997	565	Card	pending	6396	2024-12-19 17:29:20.509871
998	966	Wallet	success	3482	2025-09-27 15:14:20.509878
999	280	Card	pending	6684	2025-06-23 03:47:05.509886
1000	325	Wallet	success	2239	2025-03-18 18:35:52.509895
\.


--
-- TOC entry 5826 (class 0 OID 42936)
-- Dependencies: 314
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category, price, stock_quantity) FROM stdin;
1	Product 1	Accessory	3444	59
2	Product 2	Phone	471	19
3	Product 3	Accessory	4135	59
4	Product 4	Laptop	2023	275
5	Product 5	Phone	3283	232
6	Product 6	Accessory	4525	214
7	Product 7	Monitor	1365	212
8	Product 8	Laptop	4108	208
9	Product 9	Accessory	368	189
10	Product 10	Phone	3732	227
11	Product 11	Phone	3071	50
12	Product 12	Accessory	4560	183
13	Product 13	Laptop	3361	141
14	Product 14	Phone	1100	232
15	Product 15	Laptop	1837	10
16	Product 16	Laptop	2832	124
17	Product 17	Phone	4725	105
18	Product 18	Laptop	4640	106
19	Product 19	Monitor	1869	119
20	Product 20	Accessory	1308	1
21	Product 21	Accessory	1285	66
22	Product 22	Monitor	2153	89
23	Product 23	Laptop	311	67
24	Product 24	Laptop	3034	121
25	Product 25	Monitor	2752	8
26	Product 26	Phone	2273	26
27	Product 27	Phone	3548	269
28	Product 28	Laptop	620	243
29	Product 29	Tablet	3065	262
30	Product 30	Monitor	993	231
31	Product 31	Monitor	1914	22
32	Product 32	Monitor	2570	234
33	Product 33	Laptop	598	245
34	Product 34	Tablet	3592	55
35	Product 35	Tablet	3733	37
36	Product 36	Laptop	2738	75
37	Product 37	Laptop	1133	140
38	Product 38	Monitor	4895	280
39	Product 39	Accessory	3220	271
40	Product 40	Accessory	3816	258
41	Product 41	Monitor	3624	50
42	Product 42	Laptop	4616	110
43	Product 43	Tablet	3799	116
44	Product 44	Tablet	2876	232
45	Product 45	Tablet	3507	48
46	Product 46	Accessory	3596	160
47	Product 47	Accessory	3166	78
48	Product 48	Tablet	649	46
49	Product 49	Laptop	863	221
50	Product 50	Laptop	3152	66
51	Product 51	Monitor	591	300
52	Product 52	Monitor	4701	168
53	Product 53	Laptop	3465	181
54	Product 54	Tablet	521	147
55	Product 55	Monitor	2659	180
56	Product 56	Laptop	4834	259
57	Product 57	Phone	1367	246
58	Product 58	Phone	986	179
59	Product 59	Monitor	3111	58
60	Product 60	Accessory	4803	115
61	Product 61	Tablet	4695	285
62	Product 62	Laptop	2290	14
63	Product 63	Phone	2338	158
64	Product 64	Accessory	2975	3
65	Product 65	Phone	1273	289
66	Product 66	Tablet	670	72
67	Product 67	Laptop	851	271
68	Product 68	Phone	3181	214
69	Product 69	Tablet	2892	80
70	Product 70	Accessory	2652	166
71	Product 71	Monitor	4984	43
72	Product 72	Laptop	1374	80
73	Product 73	Monitor	507	41
74	Product 74	Accessory	3729	217
75	Product 75	Tablet	3721	212
76	Product 76	Accessory	1865	262
77	Product 77	Laptop	2927	220
78	Product 78	Laptop	2420	249
79	Product 79	Monitor	2626	23
80	Product 80	Phone	3337	28
81	Product 81	Laptop	1774	154
82	Product 82	Phone	1224	130
83	Product 83	Accessory	2787	61
84	Product 84	Laptop	4174	220
85	Product 85	Phone	1158	194
86	Product 86	Monitor	1985	256
87	Product 87	Monitor	3001	36
88	Product 88	Tablet	446	223
89	Product 89	Laptop	3866	39
90	Product 90	Accessory	4816	219
91	Product 91	Monitor	3413	213
92	Product 92	Accessory	1043	207
93	Product 93	Laptop	2760	87
94	Product 94	Monitor	3869	185
95	Product 95	Laptop	3677	54
96	Product 96	Phone	3669	205
97	Product 97	Monitor	744	202
98	Product 98	Accessory	2881	113
99	Product 99	Accessory	1477	39
100	Product 100	Monitor	1034	271
\.


--
-- TOC entry 5832 (class 0 OID 42969)
-- Dependencies: 320
-- Data for Name: query_stats_raw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.query_stats_raw (id, captured_at, query_text, calls, total_exec_ms, mean_exec_ms, rows_processed) FROM stdin;
\.


--
-- TOC entry 5838 (class 0 OID 42999)
-- Dependencies: 326
-- Data for Name: rca_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rca_reports (id, incident_id, root_cause, recommendation, created_at) FROM stdin;
1	1	Database is handling more active sessions than expected.	Check connection pooling, long-running sessions, and application connection usage.	2026-04-13 10:53:24.595922
2	2	API requests are taking longer than expected, likely due to slow database work or heavy request load.	Check slow queries, reduce request load, and review API/database timing correlation.	2026-04-13 10:53:24.598684
3	1	Issue: High Active Connections. Root cause: Database is handling more active sessions than expected.. Proof: Latest metrics show active_connections=17 and idle_connections=7.	Check connection pooling, long-running sessions, and application connection usage.	2026-04-13 15:10:16.897713
4	2	Issue: High API Latency. Root cause: API requests are taking longer than expected, likely due to slow database work or heavy request load.. Proof: Latest API log shows route=/api/customers, latency_ms=1080, db_time_ms=41.	Check slow queries, reduce request load, and review API/database timing correlation.	2026-04-13 15:10:16.949531
5	3	Issue: High Active Connections. Root cause: Database is handling more active sessions than expected.. Proof: Latest metrics show active_connections=17 and idle_connections=7.	Check connection pooling, long-running sessions, and application connection usage.	2026-04-13 15:10:16.950642
6	4	Issue: High API Latency. Root cause: API requests are taking longer than expected, likely due to slow database work or heavy request load.. Proof: Latest API log shows route=/api/customers, latency_ms=1080, db_time_ms=41.	Check slow queries, reduce request load, and review API/database timing correlation.	2026-04-13 15:10:16.951479
7	5	Issue: High Active Connections. Root cause: Database is handling more active sessions than expected.. Proof: Latest metrics show active_connections=17 and idle_connections=7.	Check connection pooling, long-running sessions, and application connection usage.	2026-04-13 15:10:16.952252
8	6	Issue: High API Latency. Root cause: API requests are taking longer than expected, likely due to slow database work or heavy request load.. Proof: Latest API log shows route=/api/customers, latency_ms=1080, db_time_ms=41.	Check slow queries, reduce request load, and review API/database timing correlation.	2026-04-13 15:10:16.953372
9	7	Issue: Slow Queries Detected. Root cause: One or more SQL queries are taking longer than the allowed threshold.. Proof: Latest slow query evidence: mean_exec_ms=3.8204, query=SELECT o.order_id, o.total_amount, p.product_name\nFROM orders o\nJOIN products p ON o.product_id = p.product_id\nWHERE o.t.	Review execution plan, add indexes where needed, and optimize expensive query patterns.	2026-04-13 15:10:16.967821
\.


--
-- TOC entry 5842 (class 0 OID 43019)
-- Dependencies: 330
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (id, suggestion, severity, created_at) FROM stdin;
1	Check connection pooling and close long-running idle sessions.	high	2026-04-13 13:59:37.243871
2	Review slow queries, add indexes where needed, and reduce expensive request paths.	medium	2026-04-13 13:59:37.251844
3	Check connection pooling and close long-running idle sessions.	high	2026-04-13 15:18:28.529245
4	Check blocking session activity and transaction duration.	medium	2026-04-13 15:18:28.537058
5	Rewrite query paths used by slow API endpoints.	medium	2026-04-13 15:18:28.537296
6	Reduce SELECT * usage and fetch only required columns.	medium	2026-04-13 15:18:28.537419
7	Create index on frequently filtered columns used by slow endpoints.	high	2026-04-13 15:18:28.537508
8	Check connection pooling and close long-running idle sessions.	high	2026-04-13 15:18:28.537593
9	Check blocking session activity and transaction duration.	medium	2026-04-13 15:18:28.53767
10	Rewrite query paths used by slow API endpoints.	medium	2026-04-13 15:18:28.537745
11	Reduce SELECT * usage and fetch only required columns.	medium	2026-04-13 15:18:28.537819
12	Create index on frequently filtered columns used by slow endpoints.	high	2026-04-13 15:18:28.537893
13	Check connection pooling and close long-running idle sessions.	high	2026-04-13 15:18:28.537967
14	Check blocking session activity and transaction duration.	medium	2026-04-13 15:18:28.538047
15	Rewrite query paths used by slow API endpoints.	medium	2026-04-13 15:18:28.53812
16	Reduce SELECT * usage and fetch only required columns.	medium	2026-04-13 15:18:28.538192
17	Create index on frequently filtered columns used by slow endpoints.	high	2026-04-13 15:18:28.538264
18	Create index on columns used in WHERE, JOIN, or ORDER BY clauses.	high	2026-04-13 15:18:28.549257
19	Run ANALYZE and review table statistics for better query planning.	medium	2026-04-13 15:18:28.54949
20	Rewrite query to reduce heavy sorting and return only needed rows.	medium	2026-04-13 15:18:28.549604
21	Reduce SELECT * usage and fetch only required columns.	medium	2026-04-13 15:18:28.549689
\.


--
-- TOC entry 5824 (class 0 OID 42920)
-- Dependencies: 312
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, full_name, email, city, created_at) FROM stdin;
1	User 1	user1@test.com	Chennai	2026-02-15 09:09:14.476671
2	User 2	user2@test.com	Pune	2025-12-20 05:09:25.477202
3	User 3	user3@test.com	Chennai	2025-07-08 07:19:04.477214
4	User 4	user4@test.com	Mumbai	2026-03-29 07:43:17.477222
5	User 5	user5@test.com	Hyderabad	2025-06-09 09:21:19.477226
6	User 6	user6@test.com	Chennai	2025-05-15 11:22:05.477231
7	User 7	user7@test.com	Pune	2025-08-26 15:38:40.477242
8	User 8	user8@test.com	Mumbai	2026-01-21 11:29:10.477249
9	User 9	user9@test.com	Delhi	2026-01-24 03:08:10.477257
10	User 10	user10@test.com	Mumbai	2026-02-24 21:50:09.477263
11	User 11	user11@test.com	Delhi	2025-06-08 01:05:29.477267
12	User 12	user12@test.com	Chennai	2025-08-20 16:48:32.477271
13	User 13	user13@test.com	Bengaluru	2026-03-03 16:37:38.477275
14	User 14	user14@test.com	Chennai	2025-05-31 22:20:19.477278
15	User 15	user15@test.com	Chennai	2026-03-09 08:14:17.477282
16	User 16	user16@test.com	Delhi	2026-03-04 02:01:25.477286
17	User 17	user17@test.com	Bengaluru	2025-11-21 19:15:38.477289
18	User 18	user18@test.com	Delhi	2026-01-19 22:34:18.477293
19	User 19	user19@test.com	Chennai	2025-11-27 10:56:48.477296
20	User 20	user20@test.com	Chennai	2026-03-07 14:16:21.4773
21	User 21	user21@test.com	Hyderabad	2025-12-09 04:27:07.477303
22	User 22	user22@test.com	Delhi	2025-05-20 11:21:17.477307
23	User 23	user23@test.com	Chennai	2025-10-29 08:41:39.477311
24	User 24	user24@test.com	Mumbai	2025-11-02 21:39:27.477314
25	User 25	user25@test.com	Pune	2025-06-26 11:36:18.477318
26	User 26	user26@test.com	Chennai	2025-07-31 20:59:33.477322
27	User 27	user27@test.com	Chennai	2025-08-22 05:40:23.477325
28	User 28	user28@test.com	Pune	2025-06-29 16:39:44.477329
29	User 29	user29@test.com	Hyderabad	2025-09-05 15:31:08.477332
30	User 30	user30@test.com	Pune	2026-02-01 17:25:26.477336
31	User 31	user31@test.com	Mumbai	2026-02-16 05:16:21.477339
32	User 32	user32@test.com	Chennai	2025-09-08 14:52:07.477346
33	User 33	user33@test.com	Bengaluru	2025-06-11 19:23:15.477351
34	User 34	user34@test.com	Hyderabad	2026-04-07 12:10:24.477358
35	User 35	user35@test.com	Chennai	2025-07-13 01:06:50.477362
36	User 36	user36@test.com	Delhi	2026-02-15 00:29:21.477369
37	User 37	user37@test.com	Bengaluru	2026-04-11 09:59:45.477374
38	User 38	user38@test.com	Delhi	2025-07-31 04:23:33.477379
39	User 39	user39@test.com	Mumbai	2025-05-28 00:02:51.477385
40	User 40	user40@test.com	Hyderabad	2025-06-06 03:47:08.477391
41	User 41	user41@test.com	Pune	2025-07-10 16:58:31.477397
42	User 42	user42@test.com	Hyderabad	2025-10-29 18:55:24.477403
43	User 43	user43@test.com	Delhi	2025-11-07 02:53:16.477409
44	User 44	user44@test.com	Hyderabad	2026-03-04 07:10:00.477413
45	User 45	user45@test.com	Mumbai	2025-07-15 05:47:49.477417
46	User 46	user46@test.com	Bengaluru	2025-07-06 04:39:58.477421
47	User 47	user47@test.com	Hyderabad	2025-09-09 02:56:57.477425
48	User 48	user48@test.com	Chennai	2025-04-25 03:11:12.477428
49	User 49	user49@test.com	Bengaluru	2025-05-04 13:33:03.477432
50	User 50	user50@test.com	Hyderabad	2025-08-25 06:41:17.477435
51	User 51	user51@test.com	Mumbai	2025-10-22 09:18:56.477439
52	User 52	user52@test.com	Pune	2025-06-16 02:56:27.477444
53	User 53	user53@test.com	Chennai	2025-05-25 08:42:27.477448
54	User 54	user54@test.com	Mumbai	2025-10-26 07:24:16.477452
55	User 55	user55@test.com	Delhi	2025-05-05 18:42:57.477456
56	User 56	user56@test.com	Pune	2025-06-24 15:26:16.477459
57	User 57	user57@test.com	Bengaluru	2025-09-17 03:50:25.477463
58	User 58	user58@test.com	Chennai	2025-09-04 22:29:05.477467
59	User 59	user59@test.com	Bengaluru	2026-03-16 12:14:50.47747
60	User 60	user60@test.com	Mumbai	2026-03-12 21:10:10.477474
61	User 61	user61@test.com	Mumbai	2025-12-07 03:43:57.477477
62	User 62	user62@test.com	Bengaluru	2026-01-31 20:45:14.477481
63	User 63	user63@test.com	Bengaluru	2025-12-07 07:27:40.477485
64	User 64	user64@test.com	Hyderabad	2026-02-22 08:14:57.477488
65	User 65	user65@test.com	Mumbai	2026-02-25 02:46:05.477493
66	User 66	user66@test.com	Bengaluru	2025-08-10 03:01:06.477499
67	User 67	user67@test.com	Mumbai	2026-01-18 21:56:07.477503
68	User 68	user68@test.com	Delhi	2025-08-24 00:28:47.477506
69	User 69	user69@test.com	Chennai	2025-07-02 12:11:00.47751
70	User 70	user70@test.com	Pune	2026-01-06 00:43:28.477513
71	User 71	user71@test.com	Hyderabad	2025-07-10 08:09:11.477517
72	User 72	user72@test.com	Mumbai	2026-03-18 15:25:59.477521
73	User 73	user73@test.com	Hyderabad	2026-01-23 08:24:26.477524
74	User 74	user74@test.com	Pune	2026-03-08 14:51:48.477528
75	User 75	user75@test.com	Pune	2025-09-19 05:59:55.477531
76	User 76	user76@test.com	Pune	2025-06-20 14:53:52.477535
77	User 77	user77@test.com	Mumbai	2025-09-10 12:18:55.477538
78	User 78	user78@test.com	Hyderabad	2025-11-03 01:42:49.477544
79	User 79	user79@test.com	Chennai	2025-11-04 02:40:06.477547
80	User 80	user80@test.com	Pune	2025-05-04 13:37:02.477551
81	User 81	user81@test.com	Delhi	2026-03-07 09:26:52.477554
82	User 82	user82@test.com	Hyderabad	2026-02-21 07:22:18.477558
83	User 83	user83@test.com	Hyderabad	2025-11-29 04:57:09.477565
84	User 84	user84@test.com	Mumbai	2025-12-08 22:38:21.477572
85	User 85	user85@test.com	Bengaluru	2025-07-08 11:36:52.477578
86	User 86	user86@test.com	Chennai	2025-07-17 09:13:39.477585
87	User 87	user87@test.com	Hyderabad	2025-11-10 12:49:35.477588
88	User 88	user88@test.com	Pune	2025-11-29 06:00:25.477592
89	User 89	user89@test.com	Chennai	2025-07-04 05:39:13.477595
90	User 90	user90@test.com	Hyderabad	2025-12-26 11:35:18.477599
91	User 91	user91@test.com	Chennai	2025-05-24 01:24:00.477603
92	User 92	user92@test.com	Delhi	2026-03-18 07:16:04.477606
93	User 93	user93@test.com	Delhi	2026-03-22 09:34:42.47761
94	User 94	user94@test.com	Pune	2025-05-22 01:45:44.477614
95	User 95	user95@test.com	Bengaluru	2025-07-04 11:28:56.477618
96	User 96	user96@test.com	Mumbai	2026-02-15 06:59:47.477621
97	User 97	user97@test.com	Pune	2025-07-08 08:03:08.477626
98	User 98	user98@test.com	Hyderabad	2025-07-05 05:29:23.477631
99	User 99	user99@test.com	Mumbai	2025-11-06 21:58:32.477634
100	User 100	user100@test.com	Mumbai	2025-10-12 03:13:16.477638
\.


--
-- TOC entry 5864 (class 0 OID 0)
-- Dependencies: 267
-- Name: chunk_column_stats_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_column_stats_id_seq', 1, false);


--
-- TOC entry 5865 (class 0 OID 0)
-- Dependencies: 266
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- TOC entry 5866 (class 0 OID 0)
-- Dependencies: 263
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 7, true);


--
-- TOC entry 5867 (class 0 OID 0)
-- Dependencies: 288
-- Name: continuous_agg_migrate_plan_step_step_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.continuous_agg_migrate_plan_step_step_id_seq', 1, false);


--
-- TOC entry 5868 (class 0 OID 0)
-- Dependencies: 259
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 4, true);


--
-- TOC entry 5869 (class 0 OID 0)
-- Dependencies: 261
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 7, true);


--
-- TOC entry 5870 (class 0 OID 0)
-- Dependencies: 255
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 4, true);


--
-- TOC entry 5871 (class 0 OID 0)
-- Dependencies: 269
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: postgres
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- TOC entry 5872 (class 0 OID 0)
-- Dependencies: 327
-- Name: api_request_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_request_logs_id_seq', 1000, true);


--
-- TOC entry 5873 (class 0 OID 0)
-- Dependencies: 317
-- Name: db_metrics_raw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.db_metrics_raw_id_seq', 2, true);


--
-- TOC entry 5874 (class 0 OID 0)
-- Dependencies: 323
-- Name: incident_evidence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_evidence_id_seq', 4, true);


--
-- TOC entry 5875 (class 0 OID 0)
-- Dependencies: 321
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incidents_id_seq', 7, true);


--
-- TOC entry 5876 (class 0 OID 0)
-- Dependencies: 319
-- Name: query_stats_raw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.query_stats_raw_id_seq', 12, true);


--
-- TOC entry 5877 (class 0 OID 0)
-- Dependencies: 325
-- Name: rca_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rca_reports_id_seq', 9, true);


--
-- TOC entry 5878 (class 0 OID 0)
-- Dependencies: 329
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recommendations_id_seq', 21, true);


--
-- TOC entry 5615 (class 2606 OID 42935)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 5632 (class 2606 OID 42997)
-- Name: incident_evidence incident_evidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_evidence
    ADD CONSTRAINT incident_evidence_pkey PRIMARY KEY (id);


--
-- TOC entry 5629 (class 2606 OID 42987)
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- TOC entry 5619 (class 2606 OID 42951)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 5621 (class 2606 OID 42959)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 5617 (class 2606 OID 42943)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5634 (class 2606 OID 43007)
-- Name: rca_reports rca_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rca_reports
    ADD CONSTRAINT rca_reports_pkey PRIMARY KEY (id);


--
-- TOC entry 5639 (class 2606 OID 43027)
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- TOC entry 5613 (class 2606 OID 42927)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5640 (class 1259 OID 43093)
-- Name: _hyper_2_1_chunk_db_metrics_raw_captured_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_2_1_chunk_db_metrics_raw_captured_at_idx ON _timescaledb_internal._hyper_2_1_chunk USING btree (captured_at DESC);


--
-- TOC entry 5641 (class 1259 OID 43175)
-- Name: _hyper_2_1_chunk_idx_db_metrics_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_2_1_chunk_idx_db_metrics_time ON _timescaledb_internal._hyper_2_1_chunk USING btree (captured_at);


--
-- TOC entry 5642 (class 1259 OID 43177)
-- Name: _hyper_3_2_chunk_idx_query_stats_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_3_2_chunk_idx_query_stats_time ON _timescaledb_internal._hyper_3_2_chunk USING btree (captured_at);


--
-- TOC entry 5643 (class 1259 OID 43107)
-- Name: _hyper_3_2_chunk_query_stats_raw_captured_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_3_2_chunk_query_stats_raw_captured_at_idx ON _timescaledb_internal._hyper_3_2_chunk USING btree (captured_at DESC);


--
-- TOC entry 5644 (class 1259 OID 43123)
-- Name: _hyper_4_3_chunk_api_request_logs_requested_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_3_chunk_api_request_logs_requested_at_idx ON _timescaledb_internal._hyper_4_3_chunk USING btree (requested_at DESC);


--
-- TOC entry 5645 (class 1259 OID 43179)
-- Name: _hyper_4_3_chunk_idx_api_logs_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_3_chunk_idx_api_logs_time ON _timescaledb_internal._hyper_4_3_chunk USING btree (requested_at);


--
-- TOC entry 5646 (class 1259 OID 43187)
-- Name: _hyper_4_3_chunk_idx_api_logs_trace_id; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_3_chunk_idx_api_logs_trace_id ON _timescaledb_internal._hyper_4_3_chunk USING btree (trace_id);


--
-- TOC entry 5647 (class 1259 OID 43133)
-- Name: _hyper_4_4_chunk_api_request_logs_requested_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_4_chunk_api_request_logs_requested_at_idx ON _timescaledb_internal._hyper_4_4_chunk USING btree (requested_at DESC);


--
-- TOC entry 5648 (class 1259 OID 43180)
-- Name: _hyper_4_4_chunk_idx_api_logs_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_4_chunk_idx_api_logs_time ON _timescaledb_internal._hyper_4_4_chunk USING btree (requested_at);


--
-- TOC entry 5649 (class 1259 OID 43188)
-- Name: _hyper_4_4_chunk_idx_api_logs_trace_id; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_4_chunk_idx_api_logs_trace_id ON _timescaledb_internal._hyper_4_4_chunk USING btree (trace_id);


--
-- TOC entry 5650 (class 1259 OID 43143)
-- Name: _hyper_4_5_chunk_api_request_logs_requested_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_5_chunk_api_request_logs_requested_at_idx ON _timescaledb_internal._hyper_4_5_chunk USING btree (requested_at DESC);


--
-- TOC entry 5651 (class 1259 OID 43181)
-- Name: _hyper_4_5_chunk_idx_api_logs_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_5_chunk_idx_api_logs_time ON _timescaledb_internal._hyper_4_5_chunk USING btree (requested_at);


--
-- TOC entry 5652 (class 1259 OID 43189)
-- Name: _hyper_4_5_chunk_idx_api_logs_trace_id; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_5_chunk_idx_api_logs_trace_id ON _timescaledb_internal._hyper_4_5_chunk USING btree (trace_id);


--
-- TOC entry 5653 (class 1259 OID 43153)
-- Name: _hyper_4_6_chunk_api_request_logs_requested_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_6_chunk_api_request_logs_requested_at_idx ON _timescaledb_internal._hyper_4_6_chunk USING btree (requested_at DESC);


--
-- TOC entry 5654 (class 1259 OID 43182)
-- Name: _hyper_4_6_chunk_idx_api_logs_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_6_chunk_idx_api_logs_time ON _timescaledb_internal._hyper_4_6_chunk USING btree (requested_at);


--
-- TOC entry 5655 (class 1259 OID 43190)
-- Name: _hyper_4_6_chunk_idx_api_logs_trace_id; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_6_chunk_idx_api_logs_trace_id ON _timescaledb_internal._hyper_4_6_chunk USING btree (trace_id);


--
-- TOC entry 5656 (class 1259 OID 43163)
-- Name: _hyper_4_7_chunk_api_request_logs_requested_at_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_7_chunk_api_request_logs_requested_at_idx ON _timescaledb_internal._hyper_4_7_chunk USING btree (requested_at DESC);


--
-- TOC entry 5657 (class 1259 OID 43183)
-- Name: _hyper_4_7_chunk_idx_api_logs_time; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_7_chunk_idx_api_logs_time ON _timescaledb_internal._hyper_4_7_chunk USING btree (requested_at);


--
-- TOC entry 5658 (class 1259 OID 43191)
-- Name: _hyper_4_7_chunk_idx_api_logs_trace_id; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_4_7_chunk_idx_api_logs_trace_id ON _timescaledb_internal._hyper_4_7_chunk USING btree (trace_id);


--
-- TOC entry 5635 (class 1259 OID 43113)
-- Name: api_request_logs_requested_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_request_logs_requested_at_idx ON public.api_request_logs USING btree (requested_at DESC);


--
-- TOC entry 5622 (class 1259 OID 43085)
-- Name: db_metrics_raw_captured_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX db_metrics_raw_captured_at_idx ON public.db_metrics_raw USING btree (captured_at DESC);


--
-- TOC entry 5636 (class 1259 OID 43178)
-- Name: idx_api_logs_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_logs_time ON public.api_request_logs USING btree (requested_at);


--
-- TOC entry 5637 (class 1259 OID 43186)
-- Name: idx_api_logs_trace_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_api_logs_trace_id ON public.api_request_logs USING btree (trace_id);


--
-- TOC entry 5623 (class 1259 OID 43174)
-- Name: idx_db_metrics_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_db_metrics_time ON public.db_metrics_raw USING btree (captured_at);


--
-- TOC entry 5630 (class 1259 OID 43192)
-- Name: idx_incident_evidence_incident_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incident_evidence_incident_id ON public.incident_evidence USING btree (incident_id);


--
-- TOC entry 5626 (class 1259 OID 43184)
-- Name: idx_incidents_severity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incidents_severity ON public.incidents USING btree (severity);


--
-- TOC entry 5627 (class 1259 OID 43185)
-- Name: idx_incidents_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_incidents_status ON public.incidents USING btree (status);


--
-- TOC entry 5624 (class 1259 OID 43176)
-- Name: idx_query_stats_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_query_stats_time ON public.query_stats_raw USING btree (captured_at);


--
-- TOC entry 5625 (class 1259 OID 43097)
-- Name: query_stats_raw_captured_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX query_stats_raw_captured_at_idx ON public.query_stats_raw USING btree (captured_at DESC);


-- Completed on 2026-04-25 15:14:50

--
-- PostgreSQL database dump complete
--

\unrestrict J8senP1EBM5wmRqmYYWehp14FeqCshdLbZk6SXhbgApWMzP8DM7fKNrbe8Ur03H

