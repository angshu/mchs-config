--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: bahmni_pacs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bahmni_pacs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE bahmni_pacs OWNER TO postgres;

\connect bahmni_pacs

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255)
);


ALTER TABLE public.databasechangelog OWNER TO pacs;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO pacs;

--
-- Name: event_records_offset_marker; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE event_records_offset_marker (
    id integer NOT NULL,
    event_id integer,
    event_count integer,
    category character varying(255)
);


ALTER TABLE public.event_records_offset_marker OWNER TO pacs;

--
-- Name: event_records_offset_marker_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE event_records_offset_marker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_records_offset_marker_id_seq OWNER TO pacs;

--
-- Name: event_records_offset_marker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE event_records_offset_marker_id_seq OWNED BY event_records_offset_marker.id;


--
-- Name: failed_event_retry_log; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE failed_event_retry_log (
    id integer NOT NULL,
    feed_uri character varying(255),
    failed_at timestamp without time zone,
    error_message character varying(4000),
    event_id character varying(255),
    event_content character varying(4000),
    error_hash_code integer
);


ALTER TABLE public.failed_event_retry_log OWNER TO pacs;

--
-- Name: failed_event_retry_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE failed_event_retry_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_event_retry_log_id_seq OWNER TO pacs;

--
-- Name: failed_event_retry_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE failed_event_retry_log_id_seq OWNED BY failed_event_retry_log.id;


--
-- Name: failed_events; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE failed_events (
    id integer NOT NULL,
    feed_uri character varying(255),
    failed_at timestamp without time zone,
    error_message character varying(4000),
    event_id character varying(255),
    event_content character varying(4000),
    error_hash_code integer,
    title character varying(255),
    retries integer DEFAULT 0 NOT NULL,
    tags character varying(255)
);


ALTER TABLE public.failed_events OWNER TO pacs;

--
-- Name: failed_events_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE failed_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_events_id_seq OWNER TO pacs;

--
-- Name: failed_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE failed_events_id_seq OWNED BY failed_events.id;


--
-- Name: ht_modality; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE ht_modality (
    id integer NOT NULL,
    hib_sess_id character(36)
);


ALTER TABLE public.ht_modality OWNER TO pacs;

--
-- Name: ht_order_details; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE ht_order_details (
    id integer NOT NULL,
    hib_sess_id character(36)
);


ALTER TABLE public.ht_order_details OWNER TO pacs;

--
-- Name: ht_order_type; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE ht_order_type (
    id integer NOT NULL,
    hib_sess_id character(36)
);


ALTER TABLE public.ht_order_type OWNER TO pacs;

--
-- Name: ht_quartz_cron_scheduler; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE ht_quartz_cron_scheduler (
    id integer NOT NULL,
    hib_sess_id character(36)
);


ALTER TABLE public.ht_quartz_cron_scheduler OWNER TO pacs;

--
-- Name: ht_test_order; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE ht_test_order (
    id integer NOT NULL,
    hib_sess_id character(36)
);


ALTER TABLE public.ht_test_order OWNER TO pacs;

--
-- Name: markers; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE markers (
    feed_uri character varying(255) NOT NULL,
    last_read_entry_id character varying(255),
    feed_uri_for_last_read_entry character varying(255)
);


ALTER TABLE public.markers OWNER TO pacs;

--
-- Name: modality; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE modality (
    id integer NOT NULL,
    name character varying(25),
    description character varying(255),
    ip character varying(20) NOT NULL,
    port integer NOT NULL,
    timeout integer NOT NULL
);


ALTER TABLE public.modality OWNER TO pacs;

--
-- Name: modality_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE modality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modality_id_seq OWNER TO pacs;

--
-- Name: modality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE modality_id_seq OWNED BY modality.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE order_details (
    id integer NOT NULL,
    test_order_id integer NOT NULL,
    hl7_request character varying(65535) NOT NULL,
    hl7_response character varying(65535) NOT NULL
);


ALTER TABLE public.order_details OWNER TO pacs;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO pacs;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE order_details_id_seq OWNED BY order_details.id;


--
-- Name: order_type; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE order_type (
    id integer NOT NULL,
    name character varying(25),
    modality_id integer NOT NULL
);


ALTER TABLE public.order_type OWNER TO pacs;

--
-- Name: order_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE order_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_type_id_seq OWNER TO pacs;

--
-- Name: order_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE order_type_id_seq OWNED BY order_type.id;


--
-- Name: test_order; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE test_order (
    id integer NOT NULL,
    order_type_id integer NOT NULL,
    order_uuid character varying(255) NOT NULL,
    test_name character varying(255) NOT NULL,
    test_uuid character varying(255) NOT NULL,
    result character varying(255),
    creator character varying(255),
    date_created timestamp without time zone,
    modifier character varying(255),
    date_modified timestamp without time zone,
    order_number character varying(16),
    comment character varying(255)
);


ALTER TABLE public.test_order OWNER TO pacs;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO pacs;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE orders_id_seq OWNED BY test_order.id;


--
-- Name: quartz_cron_scheduler; Type: TABLE; Schema: public; Owner: pacs; Tablespace: 
--

CREATE TABLE quartz_cron_scheduler (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    enabled boolean DEFAULT true,
    cron_statement character varying(20) NOT NULL,
    start_delay integer
);


ALTER TABLE public.quartz_cron_scheduler OWNER TO pacs;

--
-- Name: quartz_cron_scheduler_id_seq; Type: SEQUENCE; Schema: public; Owner: pacs
--

CREATE SEQUENCE quartz_cron_scheduler_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quartz_cron_scheduler_id_seq OWNER TO pacs;

--
-- Name: quartz_cron_scheduler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pacs
--

ALTER SEQUENCE quartz_cron_scheduler_id_seq OWNED BY quartz_cron_scheduler.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY event_records_offset_marker ALTER COLUMN id SET DEFAULT nextval('event_records_offset_marker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY failed_event_retry_log ALTER COLUMN id SET DEFAULT nextval('failed_event_retry_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY failed_events ALTER COLUMN id SET DEFAULT nextval('failed_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY modality ALTER COLUMN id SET DEFAULT nextval('modality_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY order_details ALTER COLUMN id SET DEFAULT nextval('order_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY order_type ALTER COLUMN id SET DEFAULT nextval('order_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY quartz_cron_scheduler ALTER COLUMN id SET DEFAULT nextval('quartz_cron_scheduler_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY test_order ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels) FROM stdin;
100	ict4h	classpath:sql/db_migrations.xml	2017-01-16 06:22:29.18618	1	EXECUTED	7:875caadbed8000a629ff1723f75f3fb7	createTable (x2)		\N	3.4.0	setup	\N
101	ict4h	classpath:sql/db_migrations.xml	2017-01-16 06:22:29.241607	2	EXECUTED	7:edcdfcecc9a1644a7dc71bce929cc060	addColumn		\N	3.4.0	setup	\N
102-1	Jaswanth	classpath:sql/db_migrations.xml	2017-01-16 06:22:29.2659	3	EXECUTED	7:2bd7e3f0ba7a6970c9f4fffa5e9ea2da	addColumn		\N	3.4.0	\N	\N
102-2	Jaswanth	classpath:sql/db_migrations.xml	2017-01-16 06:22:29.325384	4	EXECUTED	7:c6308ab735c513c8c160acbadff9e984	createTable		\N	3.4.0	\N	\N
103	angshu, dubey	classpath:sql/db_migrations.xml	2017-01-16 06:22:29.336598	5	EXECUTED	7:76b8f7c317fadb65966cb1ad47a0318d	addColumn	Creating column tags for failed_events table. This is same as atom spec feed.entry.categories.	\N	3.4.0	setup	\N
103	ict4h	liquibase.xml	2017-01-16 06:22:29.349431	6	MARK_RAN	7:df74fcfe2ec61954d84671f8af8158e1	addColumn		\N	3.4.0	\N	\N
104	ict4h	liquibase.xml	2017-01-16 06:22:29.385365	7	EXECUTED	7:93cb05ccc7c9299ce3fee2c353d6a8fe	createTable		\N	3.4.0	\N	\N
105	ict4h	liquibase.xml	2017-01-16 06:22:29.388486	8	MARK_RAN	7:edcdfcecc9a1644a7dc71bce929cc060	addColumn		\N	3.4.0	\N	\N
PACS-201506250509	Sandeep, Hemanth	liquibase.xml	2017-01-16 06:22:29.41008	9	EXECUTED	7:484721c841790ba53e8959c7a6b6eff8	createTable	Creating quartz cron scheduler Table	\N	3.4.0	\N	\N
PACS-201506250516	Sandeep, Hemanth	liquibase.xml	2017-01-16 06:22:29.428401	10	EXECUTED	7:e526a47b2c90e819477423f332e7f305	createTable	Creating Modality Table	\N	3.4.0	\N	\N
PACS-201506260519	Sandeep, Hemanth	liquibase.xml	2017-01-16 06:22:29.447376	11	EXECUTED	7:2c48ba3cd10d7c82988e262b786b2cd4	createTable, addForeignKeyConstraint	Creating Order Type table	\N	3.4.0	\N	\N
PACS-201506260525	Sandeep, Hemanth	liquibase.xml	2017-01-16 06:22:29.468155	12	EXECUTED	7:1cd6c9de8baae2e978ffa0239094f8f2	createTable, addForeignKeyConstraint	Creating Orders table	\N	3.4.0	\N	\N
PACS-201507020914	Hemanth	liquibase.xml	2017-01-16 06:22:29.484764	13	EXECUTED	7:b06f14de9b74515ea6c988daa32a001c	sql	Adding schedulers for openmrs encounter	\N	3.4.0	\N	\N
PACS-201507061238	Sudhakar, Abishek	liquibase.xml	2017-01-16 06:22:29.491013	14	EXECUTED	7:7589f6f99c9d25377b4520740d3e80a4	renameTable		\N	3.4.0	\N	\N
PACS-201507091128	Sudhakar, Vikash	liquibase.xml	2017-01-16 06:22:29.501676	15	EXECUTED	7:4b0fc355460e011e94c64a8cb09ceb2a	renameTable		\N	3.4.0	\N	\N
PACS-201507151233	Preethi, Sandeep	liquibase.xml	2017-01-16 06:22:29.519871	16	EXECUTED	7:66a85a861b13721f7966b9d6376cdacb	addColumn		\N	3.4.0	\N	\N
PACS-201507220554	JP, Hemanth	liquibase.xml	2017-01-16 06:22:29.53861	17	EXECUTED	7:893a7cc7faa098f47c77d231e6517419	createTable, addForeignKeyConstraint	Creating order details table	\N	3.4.0	\N	\N
PACS-201507292000	Hemanth	liquibase.xml	2017-01-16 06:22:29.543404	18	EXECUTED	7:fd0d376c40cc918d5a839a4f431560a3	addColumn	Adding comment column to order table.	\N	3.4.0	\N	\N
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: event_records_offset_marker; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY event_records_offset_marker (id, event_id, event_count, category) FROM stdin;
\.


--
-- Name: event_records_offset_marker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('event_records_offset_marker_id_seq', 1, false);


--
-- Data for Name: failed_event_retry_log; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY failed_event_retry_log (id, feed_uri, failed_at, error_message, event_id, event_content, error_hash_code) FROM stdin;
\.


--
-- Name: failed_event_retry_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('failed_event_retry_log_id_seq', 46, true);


--
-- Data for Name: failed_events; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY failed_events (id, feed_uri, failed_at, error_message, event_id, event_content, error_hash_code, title, retries, tags) FROM stdin;
\.


--
-- Name: failed_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('failed_events_id_seq', 5, true);


--
-- Data for Name: ht_modality; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY ht_modality (id, hib_sess_id) FROM stdin;
\.


--
-- Data for Name: ht_order_details; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY ht_order_details (id, hib_sess_id) FROM stdin;
\.


--
-- Data for Name: ht_order_type; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY ht_order_type (id, hib_sess_id) FROM stdin;
\.


--
-- Data for Name: ht_quartz_cron_scheduler; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY ht_quartz_cron_scheduler (id, hib_sess_id) FROM stdin;
\.


--
-- Data for Name: ht_test_order; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY ht_test_order (id, hib_sess_id) FROM stdin;
\.


--
-- Data for Name: markers; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY markers (feed_uri, last_read_entry_id, feed_uri_for_last_read_entry) FROM stdin;
http://localhost:8050/openmrs/ws/atomfeed/encounter/recent	tag:atomfeed.ict4h.org:996be239-c37b-4527-a8b2-c1e2eb3c9b79	http://localhost:8050/openmrs/ws/atomfeed/encounter/5
\.


--
-- Data for Name: modality; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY modality (id, name, description, ip, port, timeout) FROM stdin;
1	DCM4CHEE	DCM4CHEE PACS	localhost	11112	3000
2	PACS	PACS INTEGRATION	localhost	8087	3000
\.


--
-- Name: modality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('modality_id_seq', 1, false);


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY order_details (id, test_order_id, hl7_request, hl7_response) FROM stdin;
13	13	MSH|^~\\&||BahmniEMR^BahmniEMR|||2017060716||ORM^O01|1496831517660314|P|2.5\rPID|||GAN203008||^GAN203008||19630505000000+0530|M\rORC|NW|ORD-314|ORD-314||||^^^^^ROUTINE|||^^BahmniEMR||c1c26908-3f10-11e4-adec-0800271c1b75^^Super Man\rOBR||||1234^chest ap|||||||||||||||||||||||||||||||||||^CHEST AP||||^Test,TB\r	MSH|^~\\&||BahmniEMR^BahmniEMR|||20170607103158||ORR^O02||P|2.5\rMSA|AA|1496831517660314\r
14	14	MSH|^~\\&||BahmniEMR^BahmniEMR|||2017060716||ORM^O01|1496831521104329|P|2.5\rPID|||GAN203010||^GAN203010||19870607000000+0530|F\rORC|NW|ORD-329|ORD-329||||^^^^^ROUTINE|||^^BahmniEMR||c1c26908-3f10-11e4-adec-0800271c1b75^^Super Man\rOBR||||1234^chest ap|||||||||||||||||||||||||||||||||||^CHEST PA||||^Test,Radiology\r	MSH|^~\\&||BahmniEMR^BahmniEMR|||20170607103201||ORR^O02||P|2.5\rMSA|AA|1496831521104329\r
\.


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('order_details_id_seq', 14, true);


--
-- Data for Name: order_type; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY order_type (id, name, modality_id) FROM stdin;
1	Radiology Order	2
\.


--
-- Name: order_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('order_type_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('orders_id_seq', 14, true);


--
-- Data for Name: quartz_cron_scheduler; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY quartz_cron_scheduler (id, name, enabled, cron_statement, start_delay) FROM stdin;
1	openMRSEncounterFeedJob	t	0/15 * * * * ?	0
2	openMRSEncounterFailedFeedJob	t	0/15 * * * * ?	0
\.


--
-- Name: quartz_cron_scheduler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pacs
--

SELECT pg_catalog.setval('quartz_cron_scheduler_id_seq', 2, true);


--
-- Data for Name: test_order; Type: TABLE DATA; Schema: public; Owner: pacs
--

COPY test_order (id, order_type_id, order_uuid, test_name, test_uuid, result, creator, date_created, modifier, date_modified, order_number, comment) FROM stdin;
13	1	2198c517-b307-4dcc-b8a9-0a6f7831130a	CHEST AP	c425d233-3f10-11e4-adec-0800271c1b75	\N	Super Man	2017-06-07 16:01:58.971	\N	\N	ORD-314	\N
14	1	90a8127d-2fbd-4ce1-8948-6437963c36cc	CHEST PA	c423e55e-3f10-11e4-adec-0800271c1b75	\N	Super Man	2017-06-07 16:02:01.767	\N	\N	ORD-329	\N
\.


--
-- Name: pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: pk_event_records_offset_marker; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY event_records_offset_marker
    ADD CONSTRAINT pk_event_records_offset_marker PRIMARY KEY (id);


--
-- Name: pk_failed_event_retry_log; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY failed_event_retry_log
    ADD CONSTRAINT pk_failed_event_retry_log PRIMARY KEY (id);


--
-- Name: pk_failed_events; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY failed_events
    ADD CONSTRAINT pk_failed_events PRIMARY KEY (id);


--
-- Name: pk_markers; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY markers
    ADD CONSTRAINT pk_markers PRIMARY KEY (feed_uri);


--
-- Name: pk_modality; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY modality
    ADD CONSTRAINT pk_modality PRIMARY KEY (id);


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (id);


--
-- Name: pk_order_type; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY order_type
    ADD CONSTRAINT pk_order_type PRIMARY KEY (id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY test_order
    ADD CONSTRAINT pk_orders PRIMARY KEY (id);


--
-- Name: pk_quartz_cron_scheduler; Type: CONSTRAINT; Schema: public; Owner: pacs; Tablespace: 
--

ALTER TABLE ONLY quartz_cron_scheduler
    ADD CONSTRAINT pk_quartz_cron_scheduler PRIMARY KEY (id);


--
-- Name: fk_od_test_order_id; Type: FK CONSTRAINT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_od_test_order_id FOREIGN KEY (test_order_id) REFERENCES test_order(id);


--
-- Name: fk_os_order_type; Type: FK CONSTRAINT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY test_order
    ADD CONSTRAINT fk_os_order_type FOREIGN KEY (order_type_id) REFERENCES order_type(id);


--
-- Name: fk_ot_modality; Type: FK CONSTRAINT; Schema: public; Owner: pacs
--

ALTER TABLE ONLY order_type
    ADD CONSTRAINT fk_ot_modality FOREIGN KEY (modality_id) REFERENCES modality(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: failed_event_retry_log; Type: ACL; Schema: public; Owner: pacs
--

REVOKE ALL ON TABLE failed_event_retry_log FROM PUBLIC;
REVOKE ALL ON TABLE failed_event_retry_log FROM pacs;
GRANT ALL ON TABLE failed_event_retry_log TO pacs;
GRANT SELECT,UPDATE ON TABLE failed_event_retry_log TO "atomfeed-console";


--
-- Name: failed_events; Type: ACL; Schema: public; Owner: pacs
--

REVOKE ALL ON TABLE failed_events FROM PUBLIC;
REVOKE ALL ON TABLE failed_events FROM pacs;
GRANT ALL ON TABLE failed_events TO pacs;
GRANT SELECT,UPDATE ON TABLE failed_events TO "atomfeed-console";


--
-- Name: markers; Type: ACL; Schema: public; Owner: pacs
--

REVOKE ALL ON TABLE markers FROM PUBLIC;
REVOKE ALL ON TABLE markers FROM pacs;
GRANT ALL ON TABLE markers TO pacs;
GRANT SELECT,UPDATE ON TABLE markers TO "atomfeed-console";


--
-- PostgreSQL database dump complete
--

