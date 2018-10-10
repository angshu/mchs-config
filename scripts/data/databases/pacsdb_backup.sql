--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: pacsdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pacsdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE pacsdb OWNER TO postgres;

\connect pacsdb

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
-- Name: ae; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ae (
    pk bigint NOT NULL,
    aet text NOT NULL,
    hostname text NOT NULL,
    port integer NOT NULL,
    cipher_suites text,
    pat_id_issuer text,
    acc_no_issuer text,
    user_id text,
    passwd text,
    fs_group_id text,
    ae_group text,
    ae_desc text,
    wado_url text,
    station_name text,
    institution text,
    department text,
    installed boolean NOT NULL,
    vendor_data bytea
);


ALTER TABLE public.ae OWNER TO postgres;

--
-- Name: ae_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ae_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ae_pk_seq OWNER TO postgres;

--
-- Name: ae_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ae_pk_seq OWNED BY ae.pk;


--
-- Name: code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE code (
    pk bigint NOT NULL,
    code_value text NOT NULL,
    code_designator text NOT NULL,
    code_version text,
    code_meaning text
);


ALTER TABLE public.code OWNER TO postgres;

--
-- Name: code_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE code_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.code_pk_seq OWNER TO postgres;

--
-- Name: code_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE code_pk_seq OWNED BY code.pk;


--
-- Name: content_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE content_item (
    pk bigint NOT NULL,
    instance_fk bigint,
    name_fk bigint,
    code_fk bigint,
    rel_type text,
    text_value text
);


ALTER TABLE public.content_item OWNER TO postgres;

--
-- Name: content_item_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE content_item_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_item_pk_seq OWNER TO postgres;

--
-- Name: content_item_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE content_item_pk_seq OWNED BY content_item.pk;


--
-- Name: device; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE device (
    pk bigint NOT NULL,
    station_name text NOT NULL,
    station_aet text NOT NULL,
    modality text NOT NULL
);


ALTER TABLE public.device OWNER TO postgres;

--
-- Name: device_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE device_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_pk_seq OWNER TO postgres;

--
-- Name: device_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE device_pk_seq OWNED BY device.pk;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    pk bigint NOT NULL,
    instance_fk bigint,
    filesystem_fk bigint,
    filepath text NOT NULL,
    file_tsuid text NOT NULL,
    file_md5 text,
    file_size bigint,
    file_status integer,
    md5_check_time timestamp without time zone,
    created_time timestamp without time zone
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE files_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_pk_seq OWNER TO postgres;

--
-- Name: files_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE files_pk_seq OWNED BY files.pk;


--
-- Name: filesystem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filesystem (
    pk bigint NOT NULL,
    next_fk bigint,
    dirpath text NOT NULL,
    fs_group_id text NOT NULL,
    retrieve_aet text NOT NULL,
    availability integer NOT NULL,
    fs_status integer NOT NULL,
    user_info text
);


ALTER TABLE public.filesystem OWNER TO postgres;

--
-- Name: filesystem_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filesystem_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filesystem_pk_seq OWNER TO postgres;

--
-- Name: filesystem_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filesystem_pk_seq OWNED BY filesystem.pk;


--
-- Name: gppps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gppps (
    pk bigint NOT NULL,
    patient_fk bigint,
    pps_iuid text NOT NULL,
    pps_start timestamp without time zone,
    pps_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    pps_attrs bytea
);


ALTER TABLE public.gppps OWNER TO postgres;

--
-- Name: gppps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gppps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gppps_pk_seq OWNER TO postgres;

--
-- Name: gppps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gppps_pk_seq OWNED BY gppps.pk;


--
-- Name: gpsps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gpsps (
    pk bigint NOT NULL,
    patient_fk bigint,
    code_fk bigint,
    gpsps_iuid text NOT NULL,
    gpsps_tuid text,
    start_datetime timestamp without time zone NOT NULL,
    end_datetime timestamp without time zone,
    gpsps_status integer,
    gpsps_prior integer,
    in_availability integer,
    item_attrs bytea
);


ALTER TABLE public.gpsps OWNER TO postgres;

--
-- Name: gpsps_perf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gpsps_perf (
    pk bigint NOT NULL,
    gpsps_fk bigint,
    code_fk bigint,
    human_perf_name text,
    hum_perf_fn_sx text,
    hum_perf_gn_sx text,
    hum_perf_i_name text,
    hum_perf_p_name text
);


ALTER TABLE public.gpsps_perf OWNER TO postgres;

--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gpsps_perf_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_perf_pk_seq OWNER TO postgres;

--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gpsps_perf_pk_seq OWNED BY gpsps_perf.pk;


--
-- Name: gpsps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gpsps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_pk_seq OWNER TO postgres;

--
-- Name: gpsps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gpsps_pk_seq OWNED BY gpsps.pk;


--
-- Name: gpsps_req; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gpsps_req (
    pk bigint NOT NULL,
    gpsps_fk bigint,
    req_proc_id text,
    accession_no text
);


ALTER TABLE public.gpsps_req OWNER TO postgres;

--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gpsps_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gpsps_req_pk_seq OWNER TO postgres;

--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gpsps_req_pk_seq OWNED BY gpsps_req.pk;


--
-- Name: hp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hp (
    pk bigint NOT NULL,
    user_fk bigint,
    hp_iuid text NOT NULL,
    hp_cuid text,
    hp_name text,
    hp_group text,
    hp_level integer,
    num_priors integer,
    num_screens integer,
    hp_attrs bytea
);


ALTER TABLE public.hp OWNER TO postgres;

--
-- Name: hp_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hp_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hp_pk_seq OWNER TO postgres;

--
-- Name: hp_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hp_pk_seq OWNED BY hp.pk;


--
-- Name: hpdef; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE hpdef (
    pk bigint NOT NULL,
    hp_fk bigint,
    modality text,
    laterality text
);


ALTER TABLE public.hpdef OWNER TO postgres;

--
-- Name: hpdef_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hpdef_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hpdef_pk_seq OWNER TO postgres;

--
-- Name: hpdef_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE hpdef_pk_seq OWNED BY hpdef.pk;


--
-- Name: instance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE instance (
    pk bigint NOT NULL,
    series_fk bigint,
    srcode_fk bigint,
    media_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL,
    inst_no text,
    content_datetime timestamp without time zone,
    sr_complete text,
    sr_verified text,
    inst_custom1 text,
    inst_custom2 text,
    inst_custom3 text,
    ext_retr_aet text,
    retrieve_aets text,
    availability integer NOT NULL,
    inst_status integer NOT NULL,
    all_attrs boolean NOT NULL,
    commitment boolean NOT NULL,
    archived boolean NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    inst_attrs bytea
);


ALTER TABLE public.instance OWNER TO postgres;

--
-- Name: instance_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instance_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instance_pk_seq OWNER TO postgres;

--
-- Name: instance_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instance_pk_seq OWNED BY instance.pk;


--
-- Name: issuer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE issuer (
    pk bigint NOT NULL,
    entity_id text,
    entity_uid text,
    entity_uid_type text
);


ALTER TABLE public.issuer OWNER TO postgres;

--
-- Name: issuer_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE issuer_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issuer_pk_seq OWNER TO postgres;

--
-- Name: issuer_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE issuer_pk_seq OWNED BY issuer.pk;


--
-- Name: jbm_counter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_counter (
    name character varying(255) NOT NULL,
    next_id bigint
);


ALTER TABLE public.jbm_counter OWNER TO postgres;

--
-- Name: jbm_dual; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_dual (
    dummy integer NOT NULL
);


ALTER TABLE public.jbm_dual OWNER TO postgres;

--
-- Name: jbm_id_cache; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_id_cache (
    node_id integer NOT NULL,
    cntr integer NOT NULL,
    jbm_id character varying(255)
);


ALTER TABLE public.jbm_id_cache OWNER TO postgres;

--
-- Name: jbm_msg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_msg (
    message_id bigint NOT NULL,
    reliable character(1),
    expiration bigint,
    "timestamp" bigint,
    priority smallint,
    type smallint,
    headers bytea,
    payload bytea
);


ALTER TABLE public.jbm_msg OWNER TO postgres;

--
-- Name: jbm_msg_ref; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_msg_ref (
    message_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    transaction_id bigint,
    state character(1),
    ord bigint,
    page_ord bigint,
    delivery_count integer,
    sched_delivery bigint
);


ALTER TABLE public.jbm_msg_ref OWNER TO postgres;

--
-- Name: jbm_postoffice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_postoffice (
    postoffice_name character varying(255) NOT NULL,
    node_id integer NOT NULL,
    queue_name character varying(255) NOT NULL,
    cond character varying(1023),
    selector character varying(1023),
    channel_id bigint,
    clustered character(1),
    all_nodes character(1)
);


ALTER TABLE public.jbm_postoffice OWNER TO postgres;

--
-- Name: jbm_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_role (
    role_id character varying(32) NOT NULL,
    user_id character varying(32) NOT NULL
);


ALTER TABLE public.jbm_role OWNER TO postgres;

--
-- Name: jbm_tx; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_tx (
    node_id integer,
    transaction_id bigint NOT NULL,
    branch_qual bytea,
    format_id integer,
    global_txid bytea
);


ALTER TABLE public.jbm_tx OWNER TO postgres;

--
-- Name: jbm_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jbm_user (
    user_id character varying(32) NOT NULL,
    passwd character varying(32) NOT NULL,
    clientid character varying(128)
);


ALTER TABLE public.jbm_user OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE media (
    pk bigint NOT NULL,
    fileset_iuid text NOT NULL,
    fileset_id text,
    media_rq_iuid text,
    media_status integer NOT NULL,
    media_status_info text,
    media_usage bigint NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_pk_seq OWNER TO postgres;

--
-- Name: media_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_pk_seq OWNED BY media.pk;


--
-- Name: mpps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mpps (
    pk bigint NOT NULL,
    patient_fk bigint,
    drcode_fk bigint,
    mpps_iuid text NOT NULL,
    pps_start timestamp without time zone,
    station_aet text,
    modality text,
    accession_no text,
    mpps_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    mpps_attrs bytea
);


ALTER TABLE public.mpps OWNER TO postgres;

--
-- Name: mpps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mpps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mpps_pk_seq OWNER TO postgres;

--
-- Name: mpps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mpps_pk_seq OWNED BY mpps.pk;


--
-- Name: mwl_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mwl_item (
    pk bigint NOT NULL,
    patient_fk bigint,
    sps_status integer,
    sps_id text,
    start_datetime timestamp without time zone NOT NULL,
    station_aet text NOT NULL,
    station_name text,
    modality text NOT NULL,
    perf_physician text,
    perf_phys_fn_sx text,
    perf_phys_gn_sx text,
    perf_phys_i_name text,
    perf_phys_p_name text,
    req_proc_id text NOT NULL,
    accession_no text,
    study_iuid text NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    item_attrs bytea
);


ALTER TABLE public.mwl_item OWNER TO postgres;

--
-- Name: mwl_item_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mwl_item_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mwl_item_pk_seq OWNER TO postgres;

--
-- Name: mwl_item_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mwl_item_pk_seq OWNED BY mwl_item.pk;


--
-- Name: other_pid; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE other_pid (
    pk bigint NOT NULL,
    pat_id text NOT NULL,
    pat_id_issuer text NOT NULL
);


ALTER TABLE public.other_pid OWNER TO postgres;

--
-- Name: other_pid_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE other_pid_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_pid_pk_seq OWNER TO postgres;

--
-- Name: other_pid_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE other_pid_pk_seq OWNED BY other_pid.pk;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE patient (
    pk bigint NOT NULL,
    merge_fk bigint,
    pat_id text,
    pat_id_issuer text,
    pat_name text,
    pat_fn_sx text,
    pat_gn_sx text,
    pat_i_name text,
    pat_p_name text,
    pat_birthdate text,
    pat_sex text,
    pat_custom1 text,
    pat_custom2 text,
    pat_custom3 text,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    pat_attrs bytea
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patient_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_pk_seq OWNER TO postgres;

--
-- Name: patient_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patient_pk_seq OWNED BY patient.pk;


--
-- Name: priv_file; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priv_file (
    pk bigint NOT NULL,
    instance_fk bigint,
    filesystem_fk bigint,
    filepath text NOT NULL,
    file_tsuid text NOT NULL,
    file_md5 text,
    file_size bigint,
    file_status integer
);


ALTER TABLE public.priv_file OWNER TO postgres;

--
-- Name: priv_file_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priv_file_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_file_pk_seq OWNER TO postgres;

--
-- Name: priv_file_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priv_file_pk_seq OWNED BY priv_file.pk;


--
-- Name: priv_instance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priv_instance (
    pk bigint NOT NULL,
    series_fk bigint,
    priv_type integer NOT NULL,
    sop_iuid text NOT NULL,
    created_time timestamp without time zone,
    inst_attrs bytea
);


ALTER TABLE public.priv_instance OWNER TO postgres;

--
-- Name: priv_instance_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priv_instance_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_instance_pk_seq OWNER TO postgres;

--
-- Name: priv_instance_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priv_instance_pk_seq OWNED BY priv_instance.pk;


--
-- Name: priv_patient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priv_patient (
    pk bigint NOT NULL,
    priv_type integer NOT NULL,
    pat_id text,
    pat_id_issuer text,
    pat_name text,
    pat_attrs bytea
);


ALTER TABLE public.priv_patient OWNER TO postgres;

--
-- Name: priv_patient_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priv_patient_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_patient_pk_seq OWNER TO postgres;

--
-- Name: priv_patient_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priv_patient_pk_seq OWNED BY priv_patient.pk;


--
-- Name: priv_series; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priv_series (
    pk bigint NOT NULL,
    study_fk bigint,
    priv_type integer NOT NULL,
    series_iuid text NOT NULL,
    src_aet text,
    series_attrs bytea
);


ALTER TABLE public.priv_series OWNER TO postgres;

--
-- Name: priv_series_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priv_series_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_series_pk_seq OWNER TO postgres;

--
-- Name: priv_series_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priv_series_pk_seq OWNED BY priv_series.pk;


--
-- Name: priv_study; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priv_study (
    pk bigint NOT NULL,
    patient_fk bigint,
    priv_type integer NOT NULL,
    study_iuid text NOT NULL,
    accession_no text,
    study_attrs bytea
);


ALTER TABLE public.priv_study OWNER TO postgres;

--
-- Name: priv_study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priv_study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priv_study_pk_seq OWNER TO postgres;

--
-- Name: priv_study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priv_study_pk_seq OWNED BY priv_study.pk;


--
-- Name: published_study; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE published_study (
    pk bigint NOT NULL,
    study_fk bigint,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    doc_uid text,
    docentry_uid text,
    repository_uid text,
    status integer NOT NULL
);


ALTER TABLE public.published_study OWNER TO postgres;

--
-- Name: published_study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE published_study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.published_study_pk_seq OWNER TO postgres;

--
-- Name: published_study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE published_study_pk_seq OWNED BY published_study.pk;


--
-- Name: rel_dev_proto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_dev_proto (
    device_fk bigint,
    prcode_fk bigint
);


ALTER TABLE public.rel_dev_proto OWNER TO postgres;

--
-- Name: rel_gpsps_appcode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_gpsps_appcode (
    gpsps_fk bigint,
    appcode_fk bigint
);


ALTER TABLE public.rel_gpsps_appcode OWNER TO postgres;

--
-- Name: rel_gpsps_devclass; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_gpsps_devclass (
    gpsps_fk bigint,
    devclass_fk bigint
);


ALTER TABLE public.rel_gpsps_devclass OWNER TO postgres;

--
-- Name: rel_gpsps_devloc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_gpsps_devloc (
    gpsps_fk bigint,
    devloc_fk bigint
);


ALTER TABLE public.rel_gpsps_devloc OWNER TO postgres;

--
-- Name: rel_gpsps_devname; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_gpsps_devname (
    gpsps_fk bigint,
    devname_fk bigint
);


ALTER TABLE public.rel_gpsps_devname OWNER TO postgres;

--
-- Name: rel_gpsps_gppps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_gpsps_gppps (
    gpsps_fk bigint,
    gppps_fk bigint
);


ALTER TABLE public.rel_gpsps_gppps OWNER TO postgres;

--
-- Name: rel_hpdef_proc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_hpdef_proc (
    hpdef_fk bigint,
    proc_fk bigint
);


ALTER TABLE public.rel_hpdef_proc OWNER TO postgres;

--
-- Name: rel_hpdef_reason; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_hpdef_reason (
    hpdef_fk bigint,
    reason_fk bigint
);


ALTER TABLE public.rel_hpdef_reason OWNER TO postgres;

--
-- Name: rel_hpdef_region; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_hpdef_region (
    hpdef_fk bigint,
    region_fk bigint
);


ALTER TABLE public.rel_hpdef_region OWNER TO postgres;

--
-- Name: rel_pat_other_pid; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_pat_other_pid (
    patient_fk bigint,
    other_pid_fk bigint
);


ALTER TABLE public.rel_pat_other_pid OWNER TO postgres;

--
-- Name: rel_study_pcode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_study_pcode (
    study_fk bigint,
    pcode_fk bigint
);


ALTER TABLE public.rel_study_pcode OWNER TO postgres;

--
-- Name: rel_ups_appcode; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_ups_appcode (
    ups_fk bigint,
    appcode_fk bigint
);


ALTER TABLE public.rel_ups_appcode OWNER TO postgres;

--
-- Name: rel_ups_devclass; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_ups_devclass (
    ups_fk bigint,
    devclass_fk bigint
);


ALTER TABLE public.rel_ups_devclass OWNER TO postgres;

--
-- Name: rel_ups_devloc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_ups_devloc (
    ups_fk bigint,
    devloc_fk bigint
);


ALTER TABLE public.rel_ups_devloc OWNER TO postgres;

--
-- Name: rel_ups_devname; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_ups_devname (
    ups_fk bigint,
    devname_fk bigint
);


ALTER TABLE public.rel_ups_devname OWNER TO postgres;

--
-- Name: rel_ups_performer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rel_ups_performer (
    ups_fk bigint,
    performer_fk bigint
);


ALTER TABLE public.rel_ups_performer OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    user_id text,
    roles text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: series; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE series (
    pk bigint NOT NULL,
    study_fk bigint,
    mpps_fk bigint,
    inst_code_fk bigint,
    series_iuid text NOT NULL,
    series_no text,
    modality text,
    body_part text,
    laterality text,
    series_desc text,
    institution text,
    station_name text,
    department text,
    perf_physician text,
    perf_phys_fn_sx text,
    perf_phys_gn_sx text,
    perf_phys_i_name text,
    perf_phys_p_name text,
    pps_start timestamp without time zone,
    pps_iuid text,
    series_custom1 text,
    series_custom2 text,
    series_custom3 text,
    num_instances integer NOT NULL,
    src_aet text,
    ext_retr_aet text,
    retrieve_aets text,
    fileset_iuid text,
    fileset_id text,
    availability integer NOT NULL,
    series_status integer NOT NULL,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    series_attrs bytea
);


ALTER TABLE public.series OWNER TO postgres;

--
-- Name: series_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE series_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_pk_seq OWNER TO postgres;

--
-- Name: series_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE series_pk_seq OWNED BY series.pk;


--
-- Name: series_req; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE series_req (
    pk bigint NOT NULL,
    series_fk bigint,
    accno_issuer_fk bigint,
    accession_no text,
    study_iuid text,
    req_proc_id text,
    sps_id text,
    req_service text,
    req_physician text,
    req_phys_fn_sx text,
    req_phys_gn_sx text,
    req_phys_i_name text,
    req_phys_p_name text
);


ALTER TABLE public.series_req OWNER TO postgres;

--
-- Name: series_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE series_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_req_pk_seq OWNER TO postgres;

--
-- Name: series_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE series_req_pk_seq OWNED BY series_req.pk;


--
-- Name: study; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE study (
    pk bigint NOT NULL,
    patient_fk bigint,
    accno_issuer_fk bigint,
    study_iuid text NOT NULL,
    study_id text,
    study_datetime timestamp without time zone,
    accession_no text,
    ref_physician text,
    ref_phys_fn_sx text,
    ref_phys_gn_sx text,
    ref_phys_i_name text,
    ref_phys_p_name text,
    study_desc text,
    study_custom1 text,
    study_custom2 text,
    study_custom3 text,
    study_status_id text,
    mods_in_study text,
    cuids_in_study text,
    num_series integer NOT NULL,
    num_instances integer NOT NULL,
    ext_retr_aet text,
    retrieve_aets text,
    fileset_iuid text,
    fileset_id text,
    availability integer NOT NULL,
    study_status integer NOT NULL,
    checked_time timestamp without time zone,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    study_attrs bytea
);


ALTER TABLE public.study OWNER TO postgres;

--
-- Name: study_on_fs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE study_on_fs (
    pk bigint NOT NULL,
    study_fk bigint,
    filesystem_fk bigint,
    access_time timestamp without time zone NOT NULL,
    mark_to_delete boolean NOT NULL
);


ALTER TABLE public.study_on_fs OWNER TO postgres;

--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE study_on_fs_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_on_fs_pk_seq OWNER TO postgres;

--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE study_on_fs_pk_seq OWNED BY study_on_fs.pk;


--
-- Name: study_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE study_permission (
    pk bigint NOT NULL,
    study_iuid text NOT NULL,
    action text NOT NULL,
    roles text NOT NULL
);


ALTER TABLE public.study_permission OWNER TO postgres;

--
-- Name: study_permission_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE study_permission_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_permission_pk_seq OWNER TO postgres;

--
-- Name: study_permission_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE study_permission_pk_seq OWNED BY study_permission.pk;


--
-- Name: study_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE study_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_pk_seq OWNER TO postgres;

--
-- Name: study_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE study_pk_seq OWNED BY study.pk;


--
-- Name: timers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE timers (
    timerid character varying(80) NOT NULL,
    targetid character varying(250) NOT NULL,
    initialdate timestamp without time zone NOT NULL,
    timerinterval bigint,
    instancepk bytea,
    info bytea
);


ALTER TABLE public.timers OWNER TO postgres;

--
-- Name: ups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups (
    pk bigint NOT NULL,
    patient_fk bigint,
    code_fk bigint,
    ups_iuid text NOT NULL,
    ups_tuid text,
    adm_id text,
    adm_id_issuer_id text,
    adm_id_issuer_uid text,
    ups_label text NOT NULL,
    uwl_label text NOT NULL,
    ups_start_time timestamp without time zone NOT NULL,
    ups_compl_time timestamp without time zone,
    ups_state integer,
    ups_prior integer,
    created_time timestamp without time zone,
    updated_time timestamp without time zone,
    ups_attrs bytea
);


ALTER TABLE public.ups OWNER TO postgres;

--
-- Name: ups_glob_subscr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups_glob_subscr (
    pk bigint NOT NULL,
    aet text NOT NULL,
    deletion_lock boolean NOT NULL
);


ALTER TABLE public.ups_glob_subscr OWNER TO postgres;

--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_glob_subscr_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_glob_subscr_pk_seq OWNER TO postgres;

--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_glob_subscr_pk_seq OWNED BY ups_glob_subscr.pk;


--
-- Name: ups_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_pk_seq OWNER TO postgres;

--
-- Name: ups_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_pk_seq OWNED BY ups.pk;


--
-- Name: ups_rel_ps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups_rel_ps (
    pk bigint NOT NULL,
    ups_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL
);


ALTER TABLE public.ups_rel_ps OWNER TO postgres;

--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_rel_ps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_rel_ps_pk_seq OWNER TO postgres;

--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_rel_ps_pk_seq OWNED BY ups_rel_ps.pk;


--
-- Name: ups_repl_ps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups_repl_ps (
    pk bigint NOT NULL,
    ups_fk bigint,
    sop_iuid text NOT NULL,
    sop_cuid text NOT NULL
);


ALTER TABLE public.ups_repl_ps OWNER TO postgres;

--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_repl_ps_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_repl_ps_pk_seq OWNER TO postgres;

--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_repl_ps_pk_seq OWNED BY ups_repl_ps.pk;


--
-- Name: ups_req; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups_req (
    pk bigint NOT NULL,
    ups_fk bigint,
    req_proc_id text,
    accession_no text,
    confidentiality text,
    req_service text
);


ALTER TABLE public.ups_req OWNER TO postgres;

--
-- Name: ups_req_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_req_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_req_pk_seq OWNER TO postgres;

--
-- Name: ups_req_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_req_pk_seq OWNED BY ups_req.pk;


--
-- Name: ups_subscr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ups_subscr (
    pk bigint NOT NULL,
    ups_fk bigint,
    aet text NOT NULL,
    deletion_lock boolean NOT NULL
);


ALTER TABLE public.ups_subscr OWNER TO postgres;

--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ups_subscr_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ups_subscr_pk_seq OWNER TO postgres;

--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ups_subscr_pk_seq OWNED BY ups_subscr.pk;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_id text NOT NULL,
    passwd text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: verify_observer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE verify_observer (
    pk bigint NOT NULL,
    instance_fk bigint,
    verify_datetime timestamp without time zone,
    observer_name text,
    observer_fn_sx text,
    observer_gn_sx text,
    observer_i_name text,
    observer_p_name text
);


ALTER TABLE public.verify_observer OWNER TO postgres;

--
-- Name: verify_observer_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE verify_observer_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verify_observer_pk_seq OWNER TO postgres;

--
-- Name: verify_observer_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE verify_observer_pk_seq OWNED BY verify_observer.pk;


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ae ALTER COLUMN pk SET DEFAULT nextval('ae_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY code ALTER COLUMN pk SET DEFAULT nextval('code_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content_item ALTER COLUMN pk SET DEFAULT nextval('content_item_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY device ALTER COLUMN pk SET DEFAULT nextval('device_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN pk SET DEFAULT nextval('files_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filesystem ALTER COLUMN pk SET DEFAULT nextval('filesystem_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gppps ALTER COLUMN pk SET DEFAULT nextval('gppps_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps ALTER COLUMN pk SET DEFAULT nextval('gpsps_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps_perf ALTER COLUMN pk SET DEFAULT nextval('gpsps_perf_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps_req ALTER COLUMN pk SET DEFAULT nextval('gpsps_req_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hp ALTER COLUMN pk SET DEFAULT nextval('hp_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hpdef ALTER COLUMN pk SET DEFAULT nextval('hpdef_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instance ALTER COLUMN pk SET DEFAULT nextval('instance_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY issuer ALTER COLUMN pk SET DEFAULT nextval('issuer_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media ALTER COLUMN pk SET DEFAULT nextval('media_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mpps ALTER COLUMN pk SET DEFAULT nextval('mpps_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mwl_item ALTER COLUMN pk SET DEFAULT nextval('mwl_item_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY other_pid ALTER COLUMN pk SET DEFAULT nextval('other_pid_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient ALTER COLUMN pk SET DEFAULT nextval('patient_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_file ALTER COLUMN pk SET DEFAULT nextval('priv_file_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_instance ALTER COLUMN pk SET DEFAULT nextval('priv_instance_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_patient ALTER COLUMN pk SET DEFAULT nextval('priv_patient_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_series ALTER COLUMN pk SET DEFAULT nextval('priv_series_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_study ALTER COLUMN pk SET DEFAULT nextval('priv_study_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY published_study ALTER COLUMN pk SET DEFAULT nextval('published_study_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series ALTER COLUMN pk SET DEFAULT nextval('series_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series_req ALTER COLUMN pk SET DEFAULT nextval('series_req_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study ALTER COLUMN pk SET DEFAULT nextval('study_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study_on_fs ALTER COLUMN pk SET DEFAULT nextval('study_on_fs_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study_permission ALTER COLUMN pk SET DEFAULT nextval('study_permission_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups ALTER COLUMN pk SET DEFAULT nextval('ups_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_glob_subscr ALTER COLUMN pk SET DEFAULT nextval('ups_glob_subscr_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_rel_ps ALTER COLUMN pk SET DEFAULT nextval('ups_rel_ps_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_repl_ps ALTER COLUMN pk SET DEFAULT nextval('ups_repl_ps_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_req ALTER COLUMN pk SET DEFAULT nextval('ups_req_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_subscr ALTER COLUMN pk SET DEFAULT nextval('ups_subscr_pk_seq'::regclass);


--
-- Name: pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY verify_observer ALTER COLUMN pk SET DEFAULT nextval('verify_observer_pk_seq'::regclass);


--
-- Data for Name: ae; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ae (pk, aet, hostname, port, cipher_suites, pat_id_issuer, acc_no_issuer, user_id, passwd, fs_group_id, ae_group, ae_desc, wado_url, station_name, institution, department, installed, vendor_data) FROM stdin;
1	DCM4CHEE	localhost	11112	\N	DCM4CHEE	\N	\N	\N	\N	\N	This dcm4chee archive instance	\N	\N	\N	\N	t	\N
2	CDRECORD	localhost	10104	\N	\N	\N	\N	\N	\N	\N	Media Creation Server (part of dcm4chee)	\N	\N	\N	\N	t	\N
\.


--
-- Name: ae_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ae_pk_seq', 2, true);


--
-- Data for Name: code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY code (pk, code_value, code_designator, code_version, code_meaning) FROM stdin;
\.


--
-- Name: code_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('code_pk_seq', 1, false);


--
-- Data for Name: content_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY content_item (pk, instance_fk, name_fk, code_fk, rel_type, text_value) FROM stdin;
\.


--
-- Name: content_item_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('content_item_pk_seq', 1, false);


--
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY device (pk, station_name, station_aet, modality) FROM stdin;
\.


--
-- Name: device_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('device_pk_seq', 1, false);


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY files (pk, instance_fk, filesystem_fk, filepath, file_tsuid, file_md5, file_size, file_status, md5_check_time, created_time) FROM stdin;
13	13	1	2017/6/7/16/43341867/469DB7EB/AC42F86C	1.2.840.10008.1.2.1	d676715a15f4f32256da97433849c74b	11627300	0	\N	2017-06-07 16:01:58.883
14	14	1	2017/6/7/16/43422FE8/7B83F32C/4087676D	1.2.840.10008.1.2.1	effb558b53bdeee830c54a7453030f3e	11627300	0	\N	2017-06-07 16:02:01.736
\.


--
-- Name: files_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('files_pk_seq', 14, true);


--
-- Data for Name: filesystem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY filesystem (pk, next_fk, dirpath, fs_group_id, retrieve_aet, availability, fs_status, user_info) FROM stdin;
1	\N	archive	ONLINE_STORAGE	DCM4CHEE	0	0	\N
\.


--
-- Name: filesystem_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filesystem_pk_seq', 1, true);


--
-- Data for Name: gppps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gppps (pk, patient_fk, pps_iuid, pps_start, pps_status, created_time, updated_time, pps_attrs) FROM stdin;
\.


--
-- Name: gppps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gppps_pk_seq', 1, false);


--
-- Data for Name: gpsps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gpsps (pk, patient_fk, code_fk, gpsps_iuid, gpsps_tuid, start_datetime, end_datetime, gpsps_status, gpsps_prior, in_availability, item_attrs) FROM stdin;
\.


--
-- Data for Name: gpsps_perf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gpsps_perf (pk, gpsps_fk, code_fk, human_perf_name, hum_perf_fn_sx, hum_perf_gn_sx, hum_perf_i_name, hum_perf_p_name) FROM stdin;
\.


--
-- Name: gpsps_perf_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gpsps_perf_pk_seq', 1, false);


--
-- Name: gpsps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gpsps_pk_seq', 1, false);


--
-- Data for Name: gpsps_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gpsps_req (pk, gpsps_fk, req_proc_id, accession_no) FROM stdin;
\.


--
-- Name: gpsps_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gpsps_req_pk_seq', 1, false);


--
-- Data for Name: hp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hp (pk, user_fk, hp_iuid, hp_cuid, hp_name, hp_group, hp_level, num_priors, num_screens, hp_attrs) FROM stdin;
\.


--
-- Name: hp_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hp_pk_seq', 1, false);


--
-- Data for Name: hpdef; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hpdef (pk, hp_fk, modality, laterality) FROM stdin;
\.


--
-- Name: hpdef_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hpdef_pk_seq', 1, false);


--
-- Data for Name: instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instance (pk, series_fk, srcode_fk, media_fk, sop_iuid, sop_cuid, inst_no, content_datetime, sr_complete, sr_verified, inst_custom1, inst_custom2, inst_custom3, ext_retr_aet, retrieve_aets, availability, inst_status, all_attrs, commitment, archived, created_time, updated_time, inst_attrs) FROM stdin;
13	13	\N	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.1.1.0.1.1	1.2.840.10008.5.1.4.1.1.1	1	2015-05-26 14:18:36	\N	\N	\N	\N	\N	\N	DCM4CHEE	0	0	f	f	f	2017-06-07 16:01:58.863	2017-06-07 16:03:51.456	\\x0800050043530a0049534f5f4952203130300800080043531000444552495645445c5052494d415259200800160055491a00312e322e3834302e31303030382e352e312e342e312e312e31000800180055493800312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e312e312e302e312e3100080022004441080032303135303532360800230044410800323031353035323608003200544d060031343138333608003300544d0600313431383336200013004953020031202800040043530c004d4f4e4f4348524f4d4531202800100055530200640a2800110055530200840828000001555302001000
14	14	\N	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.2.1.0.1.1	1.2.840.10008.5.1.4.1.1.1	1	2015-05-26 14:18:36	\N	\N	\N	\N	\N	\N	DCM4CHEE	0	0	f	f	f	2017-06-07 16:02:01.73	2017-06-07 16:03:51.489	\\x0800050043530a0049534f5f4952203130300800080043531000444552495645445c5052494d415259200800160055491a00312e322e3834302e31303030382e352e312e342e312e312e31000800180055493800312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e322e312e302e312e3100080022004441080032303135303532360800230044410800323031353035323608003200544d060031343138333608003300544d0600313431383336200013004953020031202800040043530c004d4f4e4f4348524f4d4531202800100055530200640a2800110055530200840828000001555302001000
\.


--
-- Name: instance_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instance_pk_seq', 14, true);


--
-- Data for Name: issuer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY issuer (pk, entity_id, entity_uid, entity_uid_type) FROM stdin;
\.


--
-- Name: issuer_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('issuer_pk_seq', 1, false);


--
-- Data for Name: jbm_counter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_counter (name, next_id) FROM stdin;
MESSAGE_ID	86016
CHANNEL_ID	230
\.


--
-- Data for Name: jbm_dual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_dual (dummy) FROM stdin;
1
\.


--
-- Data for Name: jbm_id_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_id_cache (node_id, cntr, jbm_id) FROM stdin;
\.


--
-- Data for Name: jbm_msg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_msg (message_id, reliable, expiration, "timestamp", priority, type, headers, payload) FROM stdin;
\.


--
-- Data for Name: jbm_msg_ref; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_msg_ref (message_id, channel_id, transaction_id, state, ord, page_ord, delivery_count, sched_delivery) FROM stdin;
\.


--
-- Data for Name: jbm_postoffice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_postoffice (postoffice_name, node_id, queue_name, cond, selector, channel_id, clustered, all_nodes) FROM stdin;
JMS post office	0	DLQ	queue.DLQ	\N	0	N	N
JMS post office	0	ExpiryQueue	queue.ExpiryQueue	\N	1	N	N
JMS post office	0	AttributesModificationScu	queue.AttributesModificationScu	\N	2	N	N
JMS post office	0	DeleteStudy	queue.DeleteStudy	\N	3	N	N
JMS post office	0	ExportManager	queue.ExportManager	\N	4	N	N
JMS post office	0	FileCopy	queue.FileCopy	\N	5	N	N
JMS post office	0	FileMove	queue.FileMove	\N	6	N	N
JMS post office	0	HL7Send	queue.HL7Send	\N	7	N	N
JMS post office	0	IANScu	queue.IANScu	\N	8	N	N
JMS post office	0	MCMScu	queue.MCMScu	\N	9	N	N
JMS post office	0	MoveScu	queue.MoveScu	\N	10	N	N
JMS post office	0	MPPSScu	queue.MPPSScu	\N	11	N	N
JMS post office	0	PPSExceptionMgt	queue.PPSExceptionMgt	\N	12	N	N
JMS post office	0	PPSScu	queue.PPSScu	\N	13	N	N
JMS post office	0	Prefetch	queue.Prefetch	\N	14	N	N
JMS post office	0	RejectionNoteStored	queue.RejectionNoteStored	\N	15	N	N
JMS post office	0	Sendmail	queue.Sendmail	\N	16	N	N
JMS post office	0	StgCmtScuScp	queue.StgCmtScuScp	\N	17	N	N
JMS post office	0	StudyMgtScu	queue.StudyMgtScu	\N	18	N	N
JMS post office	0	UpgradeToEnhancedMF	queue.UpgradeToEnhancedMF	\N	19	N	N
JMS post office	0	UPSScp	queue.UPSScp	\N	20	N	N
JMS post office	0	WadoPrefetch	queue.WadoPrefetch	\N	21	N	N
JMS post office	0	HL7SendV2	queue.HL7SendV2	\N	22	N	N
JMS post office	0	IANSCU_web	queue.IANSCU_web	\N	23	N	N
JMS post office	0	AttributesModification_web	queue.AttributesModification_web	\N	24	N	N
JMS post office	0	MoveScu_web	queue.MoveScu_web	\N	25	N	N
JMS post office	0	RejectionNoteSCU	queue.RejectionNoteSCU	\N	26	N	N
JMS post office	0	TCStoreScu	queue.TCStoreScu	\N	27	N	N
\.


--
-- Data for Name: jbm_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_role (role_id, user_id) FROM stdin;
subscriber	john
john	guest
noacc	nobody
j2ee	guest
durpublisher	dynsub
guest	guest
durpublisher	john
publisher	dynsub
publisher	john
\.


--
-- Data for Name: jbm_tx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_tx (node_id, transaction_id, branch_qual, format_id, global_txid) FROM stdin;
\.


--
-- Data for Name: jbm_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jbm_user (user_id, passwd, clientid) FROM stdin;
dynsub	dynsub	\N
nobody	nobody	\N
john	needle	DurableSubscriberExample
j2ee	j2ee	\N
guest	guest	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY media (pk, fileset_iuid, fileset_id, media_rq_iuid, media_status, media_status_info, media_usage, created_time, updated_time) FROM stdin;
\.


--
-- Name: media_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('media_pk_seq', 1, false);


--
-- Data for Name: mpps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mpps (pk, patient_fk, drcode_fk, mpps_iuid, pps_start, station_aet, modality, accession_no, mpps_status, created_time, updated_time, mpps_attrs) FROM stdin;
\.


--
-- Name: mpps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mpps_pk_seq', 1, false);


--
-- Data for Name: mwl_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mwl_item (pk, patient_fk, sps_status, sps_id, start_datetime, station_aet, station_name, modality, perf_physician, perf_phys_fn_sx, perf_phys_gn_sx, perf_phys_i_name, perf_phys_p_name, req_proc_id, accession_no, study_iuid, created_time, updated_time, item_attrs) FROM stdin;
\.


--
-- Name: mwl_item_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mwl_item_pk_seq', 1, false);


--
-- Data for Name: other_pid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY other_pid (pk, pat_id, pat_id_issuer) FROM stdin;
\.


--
-- Name: other_pid_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('other_pid_pk_seq', 1, false);


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patient (pk, merge_fk, pat_id, pat_id_issuer, pat_name, pat_fn_sx, pat_gn_sx, pat_i_name, pat_p_name, pat_birthdate, pat_sex, pat_custom1, pat_custom2, pat_custom3, created_time, updated_time, pat_attrs) FROM stdin;
13	\N	GAN203008	\N	GAN203008 NULL^^^^	G540	*	\N	\N	20000501	M	\N	\N	\N	2017-06-07 16:01:58.789	2017-06-07 16:01:58.788	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323033303038206e756c6c100020004c4f0a0047414e323033303038201000300044410800323030303035303110004000435302004d20100000404c540000
14	\N	GAN203010	\N	GAN203010 NULL^^^^	G540	*	\N	\N	20000501	M	\N	\N	\N	2017-06-07 16:02:01.719	2017-06-07 16:02:01.719	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323033303130206e756c6c100020004c4f0a0047414e323033303130201000300044410800323030303035303110004000435302004d20100000404c540000
\.


--
-- Name: patient_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patient_pk_seq', 14, true);


--
-- Data for Name: priv_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priv_file (pk, instance_fk, filesystem_fk, filepath, file_tsuid, file_md5, file_size, file_status) FROM stdin;
\.


--
-- Name: priv_file_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priv_file_pk_seq', 1, false);


--
-- Data for Name: priv_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priv_instance (pk, series_fk, priv_type, sop_iuid, created_time, inst_attrs) FROM stdin;
\.


--
-- Name: priv_instance_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priv_instance_pk_seq', 1, false);


--
-- Data for Name: priv_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priv_patient (pk, priv_type, pat_id, pat_id_issuer, pat_name, pat_attrs) FROM stdin;
50	1	GAN200061		GAN200061 NULL^^^^	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323030303631206e756c6c100020004c4f0a0047414e323030303631201000300044410800323030303035303110004000435302004d20100000404c540000
51	1	GAN200017		GAN200017 NULL^^^^	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323030303137206e756c6c100020004c4f0a0047414e323030303137201000300044410800323030303035303110004000435302004d20100000404c540000
52	1	GAN200019		GAN200019 NULL^^^^	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323030303139206e756c6c100020004c4f0a0047414e323030303139201000300044410800323030303035303110004000435302004d20100000404c540000
53	1	GAN203004		GAN203004 NULL^^^^	\\x0800050043530a0049534f5f49522031303010001000504e0e0047414e323033303034206e756c6c100020004c4f0a0047414e323033303034201000300044410800323030303035303110004000435302004d20100000404c540000
\.


--
-- Name: priv_patient_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priv_patient_pk_seq', 1, true);


--
-- Data for Name: priv_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priv_series (pk, study_fk, priv_type, series_iuid, src_aet, series_attrs) FROM stdin;
\.


--
-- Name: priv_series_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priv_series_pk_seq', 1, false);


--
-- Data for Name: priv_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priv_study (pk, patient_fk, priv_type, study_iuid, accession_no, study_attrs) FROM stdin;
\.


--
-- Name: priv_study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priv_study_pk_seq', 1, false);


--
-- Data for Name: published_study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY published_study (pk, study_fk, created_time, updated_time, doc_uid, docentry_uid, repository_uid, status) FROM stdin;
\.


--
-- Name: published_study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('published_study_pk_seq', 1, false);


--
-- Data for Name: rel_dev_proto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_dev_proto (device_fk, prcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_appcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_gpsps_appcode (gpsps_fk, appcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_gpsps_devclass (gpsps_fk, devclass_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_gpsps_devloc (gpsps_fk, devloc_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_devname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_gpsps_devname (gpsps_fk, devname_fk) FROM stdin;
\.


--
-- Data for Name: rel_gpsps_gppps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_gpsps_gppps (gpsps_fk, gppps_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_proc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_hpdef_proc (hpdef_fk, proc_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_reason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_hpdef_reason (hpdef_fk, reason_fk) FROM stdin;
\.


--
-- Data for Name: rel_hpdef_region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_hpdef_region (hpdef_fk, region_fk) FROM stdin;
\.


--
-- Data for Name: rel_pat_other_pid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_pat_other_pid (patient_fk, other_pid_fk) FROM stdin;
\.


--
-- Data for Name: rel_study_pcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_study_pcode (study_fk, pcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_appcode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_ups_appcode (ups_fk, appcode_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_ups_devclass (ups_fk, devclass_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devloc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_ups_devloc (ups_fk, devloc_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_devname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_ups_devname (ups_fk, devname_fk) FROM stdin;
\.


--
-- Data for Name: rel_ups_performer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rel_ups_performer (ups_fk, performer_fk) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (user_id, roles) FROM stdin;
admin	JBossAdmin
admin	WebAdmin
admin	WebUser
admin	McmUser
admin	AuditLogUser
admin	Doctor
user	WebUser
user	McmUser
user	Doctor
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY series (pk, study_fk, mpps_fk, inst_code_fk, series_iuid, series_no, modality, body_part, laterality, series_desc, institution, station_name, department, perf_physician, perf_phys_fn_sx, perf_phys_gn_sx, perf_phys_i_name, perf_phys_p_name, pps_start, pps_iuid, series_custom1, series_custom2, series_custom3, num_instances, src_aet, ext_retr_aet, retrieve_aets, fileset_iuid, fileset_id, availability, series_status, created_time, updated_time, series_attrs) FROM stdin;
13	13	\N	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.1.3.0.1	1	CR	CHEST	\N	\N	BAYALPATA HOSPITAL	IMAGESUITEWSD	\N	\N	*	*	\N	\N	\N	\N	\N	\N	\N	1	DCMSND	\N	DCM4CHEE	\N	\N	0	0	2017-06-07 16:01:58.845	2017-06-07 16:03:51.455	\\x0800050043530a0049534f5f4952203130300800210044410800323031353035323608003100544d060031343138333608006000435302004352080070004c4f12004361726573747265616d204865616c746820080080004c4f1200426179616c7061746120486f73706974616c0800101053480e00496d616765537569746557534420080090104c4f1a00496d61676520537569746520566974612043522053797374656d180015004353060043484553542020000e0055493600312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e312e332e302e310020001100495302003120
14	14	\N	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.2.3.0.1	1	CR	CHEST	\N	\N	BAYALPATA HOSPITAL	IMAGESUITEWSD	\N	\N	*	*	\N	\N	\N	\N	\N	\N	\N	1	DCMSND	\N	DCM4CHEE	\N	\N	0	0	2017-06-07 16:02:01.728	2017-06-07 16:03:51.488	\\x0800050043530a0049534f5f4952203130300800210044410800323031353035323608003100544d060031343138333608006000435302004352080070004c4f12004361726573747265616d204865616c746820080080004c4f1200426179616c7061746120486f73706974616c0800101053480e00496d616765537569746557534420080090104c4f1a00496d61676520537569746520566974612043522053797374656d180015004353060043484553542020000e0055493600312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e322e332e302e310020001100495302003120
\.


--
-- Name: series_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('series_pk_seq', 14, true);


--
-- Data for Name: series_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY series_req (pk, series_fk, accno_issuer_fk, accession_no, study_iuid, req_proc_id, sps_id, req_service, req_physician, req_phys_fn_sx, req_phys_gn_sx, req_phys_i_name, req_phys_p_name) FROM stdin;
\.


--
-- Name: series_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('series_req_pk_seq', 1, false);


--
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY study (pk, patient_fk, accno_issuer_fk, study_iuid, study_id, study_datetime, accession_no, ref_physician, ref_phys_fn_sx, ref_phys_gn_sx, ref_phys_i_name, ref_phys_p_name, study_desc, study_custom1, study_custom2, study_custom3, study_status_id, mods_in_study, cuids_in_study, num_series, num_instances, ext_retr_aet, retrieve_aets, fileset_iuid, fileset_id, availability, study_status, checked_time, created_time, updated_time, study_attrs) FROM stdin;
13	13	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.1.2.0	ce854e99-4647-48b1-9749-9b6112050544	2019-04-11 09:01:36	ORD-314	\N	*	*	\N	\N	\N	\N	\N	\N	\N	CR	1.2.840.10008.5.1.4.1.1.1	1	1	\N	DCM4CHEE	\N	\N	0	0	\N	2017-06-07 16:01:58.821	2017-06-07 16:01:58.992	\\x0800050043530a0049534f5f4952203130300800200044540e00323031373036303731303331353808003000544d0600313431383336080050004c4f08004f52442d3331342008009000504e0000080030104c4f000020000d0055493400312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e312e322e3000200010004c4f240063653835346539392d343634372d343862312d393734392d396236313132303530353434
14	14	\N	1.3.6.1.4.1.5962.99.1.2182.1817.1496831518034.2.2.0	1ec9a39f-2cf5-43c5-8dfb-f0f63e7e4ef5	2017-06-20 15:42:36	ORD-329	\N	*	*	\N	\N	\N	\N	\N	\N	\N	CR	1.2.840.10008.5.1.4.1.1.1	1	1	\N	DCM4CHEE	\N	\N	0	0	\N	2017-06-07 16:02:01.723	2017-06-07 16:02:01.819	\\x0800050043530a0049534f5f4952203130300800200044540e00323031373036303731303332303108003000544d0600313431383336080050004c4f08004f52442d3332392008009000504e0000080030104c4f000020000d0055493400312e332e362e312e342e312e353936322e39392e312e323138322e313831372e313439363833313531383033342e322e322e3000200010004c4f240031656339613339662d326366352d343363352d386466622d663066363365376534656635
\.


--
-- Data for Name: study_on_fs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY study_on_fs (pk, study_fk, filesystem_fk, access_time, mark_to_delete) FROM stdin;
14	14	1	2017-06-07 16:03:10.891	f
13	13	1	2017-06-07 16:03:13.203	f
\.


--
-- Name: study_on_fs_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('study_on_fs_pk_seq', 14, true);


--
-- Data for Name: study_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY study_permission (pk, study_iuid, action, roles) FROM stdin;
\.


--
-- Name: study_permission_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('study_permission_pk_seq', 1, false);


--
-- Name: study_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('study_pk_seq', 14, true);


--
-- Data for Name: timers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY timers (timerid, targetid, initialdate, timerinterval, instancepk, info) FROM stdin;
\.


--
-- Data for Name: ups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups (pk, patient_fk, code_fk, ups_iuid, ups_tuid, adm_id, adm_id_issuer_id, adm_id_issuer_uid, ups_label, uwl_label, ups_start_time, ups_compl_time, ups_state, ups_prior, created_time, updated_time, ups_attrs) FROM stdin;
\.


--
-- Data for Name: ups_glob_subscr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups_glob_subscr (pk, aet, deletion_lock) FROM stdin;
\.


--
-- Name: ups_glob_subscr_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_glob_subscr_pk_seq', 1, false);


--
-- Name: ups_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_pk_seq', 1, false);


--
-- Data for Name: ups_rel_ps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups_rel_ps (pk, ups_fk, sop_iuid, sop_cuid) FROM stdin;
\.


--
-- Name: ups_rel_ps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_rel_ps_pk_seq', 1, false);


--
-- Data for Name: ups_repl_ps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups_repl_ps (pk, ups_fk, sop_iuid, sop_cuid) FROM stdin;
\.


--
-- Name: ups_repl_ps_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_repl_ps_pk_seq', 1, false);


--
-- Data for Name: ups_req; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups_req (pk, ups_fk, req_proc_id, accession_no, confidentiality, req_service) FROM stdin;
\.


--
-- Name: ups_req_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_req_pk_seq', 1, false);


--
-- Data for Name: ups_subscr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ups_subscr (pk, ups_fk, aet, deletion_lock) FROM stdin;
\.


--
-- Name: ups_subscr_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ups_subscr_pk_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_id, passwd) FROM stdin;
admin	0DPiKuNIrrVmD8IUCuw1hQxNqZc=
user	Et6pb+wgWTVmq3VpLJlJWWgzrck=
\.


--
-- Data for Name: verify_observer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY verify_observer (pk, instance_fk, verify_datetime, observer_name, observer_fn_sx, observer_gn_sx, observer_i_name, observer_p_name) FROM stdin;
\.


--
-- Name: verify_observer_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('verify_observer_pk_seq', 1, false);


--
-- Name: ae_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ae
    ADD CONSTRAINT ae_pk PRIMARY KEY (pk);


--
-- Name: code_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY code
    ADD CONSTRAINT code_pk PRIMARY KEY (pk);


--
-- Name: content_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY content_item
    ADD CONSTRAINT content_item_pk PRIMARY KEY (pk);


--
-- Name: device_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY device
    ADD CONSTRAINT device_pk PRIMARY KEY (pk);


--
-- Name: files_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pk PRIMARY KEY (pk);


--
-- Name: filesystem_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filesystem
    ADD CONSTRAINT filesystem_pk PRIMARY KEY (pk);


--
-- Name: gppps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gppps
    ADD CONSTRAINT gppps_pk PRIMARY KEY (pk);


--
-- Name: gpsps_perf_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gpsps_perf
    ADD CONSTRAINT gpsps_perf_pk PRIMARY KEY (pk);


--
-- Name: gpsps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gpsps
    ADD CONSTRAINT gpsps_pk PRIMARY KEY (pk);


--
-- Name: gpsps_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gpsps_req
    ADD CONSTRAINT gpsps_req_pk PRIMARY KEY (pk);


--
-- Name: hp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hp
    ADD CONSTRAINT hp_pk PRIMARY KEY (pk);


--
-- Name: hpdef_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY hpdef
    ADD CONSTRAINT hpdef_pk PRIMARY KEY (pk);


--
-- Name: instance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY instance
    ADD CONSTRAINT instance_pk PRIMARY KEY (pk);


--
-- Name: issuer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY issuer
    ADD CONSTRAINT issuer_pk PRIMARY KEY (pk);


--
-- Name: jbm_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_counter
    ADD CONSTRAINT jbm_counter_pkey PRIMARY KEY (name);


--
-- Name: jbm_dual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_dual
    ADD CONSTRAINT jbm_dual_pkey PRIMARY KEY (dummy);


--
-- Name: jbm_id_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_id_cache
    ADD CONSTRAINT jbm_id_cache_pkey PRIMARY KEY (node_id, cntr);


--
-- Name: jbm_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_msg
    ADD CONSTRAINT jbm_msg_pkey PRIMARY KEY (message_id);


--
-- Name: jbm_msg_ref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_msg_ref
    ADD CONSTRAINT jbm_msg_ref_pkey PRIMARY KEY (message_id, channel_id);


--
-- Name: jbm_postoffice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_postoffice
    ADD CONSTRAINT jbm_postoffice_pkey PRIMARY KEY (postoffice_name, node_id, queue_name);


--
-- Name: jbm_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_role
    ADD CONSTRAINT jbm_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: jbm_tx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_tx
    ADD CONSTRAINT jbm_tx_pkey PRIMARY KEY (transaction_id);


--
-- Name: jbm_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jbm_user
    ADD CONSTRAINT jbm_user_pkey PRIMARY KEY (user_id);


--
-- Name: media_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pk PRIMARY KEY (pk);


--
-- Name: mpps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mpps
    ADD CONSTRAINT mpps_pk PRIMARY KEY (pk);


--
-- Name: mwl_item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mwl_item
    ADD CONSTRAINT mwl_item_pk PRIMARY KEY (pk);


--
-- Name: other_pid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY other_pid
    ADD CONSTRAINT other_pid_pk PRIMARY KEY (pk);


--
-- Name: patient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT patient_pk PRIMARY KEY (pk);


--
-- Name: priv_file_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priv_file
    ADD CONSTRAINT priv_file_pk PRIMARY KEY (pk);


--
-- Name: priv_instance_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priv_instance
    ADD CONSTRAINT priv_instance_pk PRIMARY KEY (pk);


--
-- Name: priv_patient_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priv_patient
    ADD CONSTRAINT priv_patient_pk PRIMARY KEY (pk);


--
-- Name: priv_series_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priv_series
    ADD CONSTRAINT priv_series_pk PRIMARY KEY (pk);


--
-- Name: priv_study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priv_study
    ADD CONSTRAINT priv_study_pk PRIMARY KEY (pk);


--
-- Name: published_study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY published_study
    ADD CONSTRAINT published_study_pk PRIMARY KEY (pk);


--
-- Name: series_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_pk PRIMARY KEY (pk);


--
-- Name: series_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY series_req
    ADD CONSTRAINT series_req_pk PRIMARY KEY (pk);


--
-- Name: study_on_fs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY study_on_fs
    ADD CONSTRAINT study_on_fs_pk PRIMARY KEY (pk);


--
-- Name: study_permission_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY study_permission
    ADD CONSTRAINT study_permission_pk PRIMARY KEY (pk);


--
-- Name: study_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY study
    ADD CONSTRAINT study_pk PRIMARY KEY (pk);


--
-- Name: timers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY timers
    ADD CONSTRAINT timers_pk PRIMARY KEY (timerid, targetid);


--
-- Name: ups_glob_subscr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups_glob_subscr
    ADD CONSTRAINT ups_glob_subscr_pk PRIMARY KEY (pk);


--
-- Name: ups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups
    ADD CONSTRAINT ups_pk PRIMARY KEY (pk);


--
-- Name: ups_rel_ps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups_rel_ps
    ADD CONSTRAINT ups_rel_ps_pk PRIMARY KEY (pk);


--
-- Name: ups_repl_ps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups_repl_ps
    ADD CONSTRAINT ups_repl_ps_pk PRIMARY KEY (pk);


--
-- Name: ups_req_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups_req
    ADD CONSTRAINT ups_req_pk PRIMARY KEY (pk);


--
-- Name: ups_subscr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ups_subscr
    ADD CONSTRAINT ups_subscr_pk PRIMARY KEY (pk);


--
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- Name: verify_observer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY verify_observer
    ADD CONSTRAINT verify_observer_pk PRIMARY KEY (pk);


--
-- Name: access_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX access_time ON study_on_fs USING btree (access_time);


--
-- Name: accession_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accession_no ON study USING btree (accession_no);


--
-- Name: accno_issuer_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accno_issuer_fk ON study USING btree (accno_issuer_fk);


--
-- Name: ae_group; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ae_group ON ae USING btree (ae_group);


--
-- Name: aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX aet ON ae USING btree (aet);


--
-- Name: appcode_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX appcode_gpsps_fk ON rel_gpsps_appcode USING btree (gpsps_fk);


--
-- Name: appcode_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX appcode_ups_fk ON rel_ups_appcode USING btree (ups_fk);


--
-- Name: body_part; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX body_part ON series USING btree (body_part);


--
-- Name: code_value; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX code_value ON code USING btree (code_value, code_designator, code_version);


--
-- Name: commitment; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX commitment ON instance USING btree (commitment);


--
-- Name: content_datetime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_datetime ON instance USING btree (content_datetime);


--
-- Name: content_item_code_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_item_code_fk ON content_item USING btree (code_fk);


--
-- Name: content_item_inst_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_item_inst_fk ON content_item USING btree (instance_fk);


--
-- Name: content_item_name_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_item_name_fk ON content_item USING btree (name_fk);


--
-- Name: content_item_rel_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_item_rel_type ON content_item USING btree (rel_type);


--
-- Name: content_item_text_value; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX content_item_text_value ON content_item USING btree (text_value);


--
-- Name: department; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX department ON series USING btree (department);


--
-- Name: dev_station_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX dev_station_name ON device USING btree (station_name);


--
-- Name: devclass_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devclass_gpsps_fk ON rel_gpsps_devclass USING btree (gpsps_fk);


--
-- Name: devclass_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devclass_ups_fk ON rel_ups_devclass USING btree (ups_fk);


--
-- Name: device_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX device_fk ON rel_dev_proto USING btree (device_fk);


--
-- Name: devloc_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devloc_gpsps_fk ON rel_gpsps_devloc USING btree (gpsps_fk);


--
-- Name: devloc_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devloc_ups_fk ON rel_ups_devloc USING btree (ups_fk);


--
-- Name: devname_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devname_gpsps_fk ON rel_gpsps_devname USING btree (gpsps_fk);


--
-- Name: devname_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX devname_ups_fk ON rel_ups_devname USING btree (ups_fk);


--
-- Name: entity_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX entity_id ON issuer USING btree (entity_id);


--
-- Name: entity_uid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX entity_uid ON issuer USING btree (entity_uid, entity_uid_type);


--
-- Name: ext_retr_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ext_retr_aet ON instance USING btree (ext_retr_aet);


--
-- Name: file_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX file_created ON files USING btree (created_time);


--
-- Name: file_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX file_status ON files USING btree (file_status);


--
-- Name: file_tsuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX file_tsuid ON files USING btree (file_tsuid);


--
-- Name: filepath; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filepath ON files USING btree (filepath);


--
-- Name: fileset_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX fileset_iuid ON media USING btree (fileset_iuid);


--
-- Name: filesystem_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX filesystem_fk ON files USING btree (filesystem_fk);


--
-- Name: fs_availability; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_availability ON filesystem USING btree (availability);


--
-- Name: fs_dirpath; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX fs_dirpath ON filesystem USING btree (dirpath);


--
-- Name: fs_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_group_id ON filesystem USING btree (fs_group_id);


--
-- Name: fs_next_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_next_fk ON filesystem USING btree (next_fk);


--
-- Name: fs_of_study; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_of_study ON study_on_fs USING btree (filesystem_fk);


--
-- Name: fs_retrieve_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_retrieve_aet ON filesystem USING btree (retrieve_aet);


--
-- Name: fs_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fs_status ON filesystem USING btree (fs_status);


--
-- Name: gppps_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gppps_gpsps_fk ON rel_gpsps_gppps USING btree (gpsps_fk);


--
-- Name: gppps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX gppps_iuid ON gppps USING btree (pps_iuid);


--
-- Name: gppps_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gppps_patient_fk ON gppps USING btree (patient_fk);


--
-- Name: gppps_pps_start; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gppps_pps_start ON gppps USING btree (pps_start);


--
-- Name: gpsps_appcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_appcode_fk ON rel_gpsps_appcode USING btree (appcode_fk);


--
-- Name: gpsps_code_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_code_fk ON gpsps USING btree (code_fk);


--
-- Name: gpsps_devclass_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_devclass_fk ON rel_gpsps_devclass USING btree (devclass_fk);


--
-- Name: gpsps_devloc_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_devloc_fk ON rel_gpsps_devloc USING btree (devloc_fk);


--
-- Name: gpsps_devname_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_devname_fk ON rel_gpsps_devname USING btree (devname_fk);


--
-- Name: gpsps_end_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_end_time ON gpsps USING btree (end_datetime);


--
-- Name: gpsps_gppps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_gppps_fk ON rel_gpsps_gppps USING btree (gppps_fk);


--
-- Name: gpsps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX gpsps_iuid ON gpsps USING btree (gpsps_iuid);


--
-- Name: gpsps_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_patient_fk ON gpsps USING btree (patient_fk);


--
-- Name: gpsps_perf_code_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_code_fk ON gpsps_perf USING btree (code_fk);


--
-- Name: gpsps_perf_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_fn_sx ON gpsps_perf USING btree (hum_perf_fn_sx);


--
-- Name: gpsps_perf_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_gn_sx ON gpsps_perf USING btree (hum_perf_gn_sx);


--
-- Name: gpsps_perf_i_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_i_name ON gpsps_perf USING btree (hum_perf_i_name);


--
-- Name: gpsps_perf_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_name ON gpsps_perf USING btree (human_perf_name);


--
-- Name: gpsps_perf_p_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_p_name ON gpsps_perf USING btree (hum_perf_p_name);


--
-- Name: gpsps_perf_sps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_perf_sps_fk ON gpsps_perf USING btree (gpsps_fk);


--
-- Name: gpsps_prior; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_prior ON gpsps USING btree (gpsps_prior);


--
-- Name: gpsps_req_acc_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_req_acc_no ON gpsps_req USING btree (accession_no);


--
-- Name: gpsps_req_gpsps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_req_gpsps_fk ON gpsps_req USING btree (gpsps_fk);


--
-- Name: gpsps_req_proc_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_req_proc_id ON gpsps_req USING btree (req_proc_id);


--
-- Name: gpsps_start_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_start_time ON gpsps USING btree (start_datetime);


--
-- Name: gpsps_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_status ON gpsps USING btree (gpsps_status);


--
-- Name: gpsps_tuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX gpsps_tuid ON gpsps USING btree (gpsps_tuid);


--
-- Name: hostname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hostname ON ae USING btree (hostname);


--
-- Name: hp_cuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hp_cuid ON hp USING btree (hp_cuid);


--
-- Name: hp_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hp_fk ON hpdef USING btree (hp_fk);


--
-- Name: hp_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX hp_iuid ON hp USING btree (hp_iuid);


--
-- Name: hp_level; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hp_level ON hp USING btree (hp_level);


--
-- Name: hp_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hp_name ON hp USING btree (hp_name);


--
-- Name: hp_user_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hp_user_fk ON hp USING btree (user_fk);


--
-- Name: hpdef_laterality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hpdef_laterality ON hpdef USING btree (laterality);


--
-- Name: hpdef_modality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hpdef_modality ON hpdef USING btree (modality);


--
-- Name: hpdef_proc_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hpdef_proc_fk ON rel_hpdef_proc USING btree (proc_fk);


--
-- Name: hpdef_reason_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hpdef_reason_fk ON rel_hpdef_reason USING btree (reason_fk);


--
-- Name: hpdef_region_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX hpdef_region_fk ON rel_hpdef_region USING btree (region_fk);


--
-- Name: i_study_on_fs; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX i_study_on_fs ON study_on_fs USING btree (study_fk, filesystem_fk);


--
-- Name: in_availability; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX in_availability ON gpsps USING btree (in_availability);


--
-- Name: inst_archived; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_archived ON instance USING btree (archived);


--
-- Name: inst_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_created ON instance USING btree (created_time);


--
-- Name: inst_custom1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_custom1 ON instance USING btree (inst_custom1);


--
-- Name: inst_custom2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_custom2 ON instance USING btree (inst_custom2);


--
-- Name: inst_custom3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_custom3 ON instance USING btree (inst_custom3);


--
-- Name: inst_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inst_no ON instance USING btree (inst_no);


--
-- Name: instance_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX instance_fk ON files USING btree (instance_fk);


--
-- Name: instance_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX instance_status ON instance USING btree (inst_status);


--
-- Name: institution; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX institution ON series USING btree (institution);


--
-- Name: jbm_msg_ref_tx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX jbm_msg_ref_tx ON jbm_msg_ref USING btree (transaction_id, state);


--
-- Name: laterality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX laterality ON series USING btree (laterality);


--
-- Name: mark_to_delete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mark_to_delete ON study_on_fs USING btree (mark_to_delete);


--
-- Name: md5_check_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX md5_check_time ON files USING btree (md5_check_time);


--
-- Name: media_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX media_fk ON instance USING btree (media_fk);


--
-- Name: media_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX media_status ON media USING btree (media_status);


--
-- Name: modality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX modality ON series USING btree (modality);


--
-- Name: mpps_accession_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_accession_no ON mpps USING btree (accession_no);


--
-- Name: mpps_drcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_drcode_fk ON mpps USING btree (drcode_fk);


--
-- Name: mpps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX mpps_iuid ON mpps USING btree (mpps_iuid);


--
-- Name: mpps_modality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_modality ON mpps USING btree (modality);


--
-- Name: mpps_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_patient_fk ON mpps USING btree (patient_fk);


--
-- Name: mpps_pps_start; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_pps_start ON mpps USING btree (pps_start);


--
-- Name: mpps_station_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mpps_station_aet ON mpps USING btree (station_aet);


--
-- Name: mwl_accession_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_accession_no ON mwl_item USING btree (accession_no);


--
-- Name: mwl_modality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_modality ON mwl_item USING btree (modality);


--
-- Name: mwl_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_patient_fk ON mwl_item USING btree (patient_fk);


--
-- Name: mwl_perf_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_perf_phys_fn_sx ON mwl_item USING btree (perf_phys_fn_sx);


--
-- Name: mwl_perf_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_perf_phys_gn_sx ON mwl_item USING btree (perf_phys_gn_sx);


--
-- Name: mwl_perf_phys_i_nm; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_perf_phys_i_nm ON mwl_item USING btree (perf_phys_i_name);


--
-- Name: mwl_perf_phys_p_nm; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_perf_phys_p_nm ON mwl_item USING btree (perf_phys_p_name);


--
-- Name: mwl_perf_physician; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_perf_physician ON mwl_item USING btree (perf_physician);


--
-- Name: mwl_req_proc_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_req_proc_id ON mwl_item USING btree (req_proc_id);


--
-- Name: mwl_sps_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX mwl_sps_id ON mwl_item USING btree (sps_id, req_proc_id);


--
-- Name: mwl_start_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_start_time ON mwl_item USING btree (start_datetime);


--
-- Name: mwl_station_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_station_aet ON mwl_item USING btree (station_aet);


--
-- Name: mwl_station_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_station_name ON mwl_item USING btree (station_name);


--
-- Name: mwl_study_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX mwl_study_iuid ON mwl_item USING btree (study_iuid);


--
-- Name: num_priors; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX num_priors ON hp USING btree (num_priors);


--
-- Name: num_screens; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX num_screens ON hp USING btree (num_screens);


--
-- Name: observer_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_fn_sx ON verify_observer USING btree (observer_fn_sx);


--
-- Name: observer_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_gn_sx ON verify_observer USING btree (observer_gn_sx);


--
-- Name: observer_i_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_i_name ON verify_observer USING btree (observer_i_name);


--
-- Name: observer_inst_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_inst_fk ON verify_observer USING btree (instance_fk);


--
-- Name: observer_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_name ON verify_observer USING btree (observer_name);


--
-- Name: observer_p_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX observer_p_name ON verify_observer USING btree (observer_p_name);


--
-- Name: other_pat_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX other_pat_id ON other_pid USING btree (pat_id, pat_id_issuer);


--
-- Name: other_pid_pat_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX other_pid_pat_fk ON rel_pat_other_pid USING btree (patient_fk);


--
-- Name: pat_birthdate; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_birthdate ON patient USING btree (pat_birthdate);


--
-- Name: pat_custom1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_custom1 ON patient USING btree (pat_custom1);


--
-- Name: pat_custom2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_custom2 ON patient USING btree (pat_custom2);


--
-- Name: pat_custom3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_custom3 ON patient USING btree (pat_custom3);


--
-- Name: pat_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_fn_sx ON patient USING btree (pat_fn_sx);


--
-- Name: pat_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_gn_sx ON patient USING btree (pat_gn_sx);


--
-- Name: pat_i_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_i_name ON patient USING btree (pat_i_name);


--
-- Name: pat_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_id ON patient USING btree (pat_id, pat_id_issuer);


--
-- Name: pat_merge_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_merge_fk ON patient USING btree (merge_fk);


--
-- Name: pat_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_name ON patient USING btree (pat_name);


--
-- Name: pat_other_pid_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_other_pid_fk ON rel_pat_other_pid USING btree (other_pid_fk);


--
-- Name: pat_p_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_p_name ON patient USING btree (pat_p_name);


--
-- Name: pat_sex; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pat_sex ON patient USING btree (pat_sex);


--
-- Name: patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX patient_fk ON study USING btree (patient_fk);


--
-- Name: pcode_study_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pcode_study_fk ON rel_study_pcode USING btree (study_fk);


--
-- Name: perf_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX perf_phys_fn_sx ON series USING btree (perf_phys_fn_sx);


--
-- Name: perf_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX perf_phys_gn_sx ON series USING btree (perf_phys_gn_sx);


--
-- Name: perf_phys_i_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX perf_phys_i_name ON series USING btree (perf_phys_i_name);


--
-- Name: perf_phys_p_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX perf_phys_p_name ON series USING btree (perf_phys_p_name);


--
-- Name: perf_physician; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX perf_physician ON series USING btree (perf_physician);


--
-- Name: performer_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX performer_ups_fk ON rel_ups_performer USING btree (ups_fk);


--
-- Name: prcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX prcode_fk ON rel_dev_proto USING btree (prcode_fk);


--
-- Name: priv_fs_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_fs_fk ON priv_file USING btree (filesystem_fk);


--
-- Name: priv_inst_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_inst_created ON priv_instance USING btree (created_time);


--
-- Name: priv_inst_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_inst_type ON priv_instance USING btree (priv_type);


--
-- Name: priv_instance_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_instance_fk ON priv_file USING btree (instance_fk);


--
-- Name: priv_pat_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_pat_id ON patient USING btree (pat_id, pat_id_issuer);


--
-- Name: priv_pat_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_pat_type ON priv_patient USING btree (priv_type);


--
-- Name: priv_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_patient_fk ON priv_study USING btree (patient_fk);


--
-- Name: priv_patient_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_patient_name ON priv_patient USING btree (pat_name);


--
-- Name: priv_ser_src_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_ser_src_aet ON priv_series USING btree (src_aet);


--
-- Name: priv_series_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_series_fk ON priv_instance USING btree (series_fk);


--
-- Name: priv_series_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_series_iuid ON priv_series USING btree (series_iuid);


--
-- Name: priv_series_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_series_type ON priv_series USING btree (priv_type);


--
-- Name: priv_sop_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_sop_iuid ON priv_instance USING btree (sop_iuid);


--
-- Name: priv_study_accs_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_study_accs_no ON priv_study USING btree (accession_no);


--
-- Name: priv_study_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_study_fk ON priv_series USING btree (study_fk);


--
-- Name: priv_study_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_study_iuid ON priv_study USING btree (study_iuid);


--
-- Name: priv_study_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX priv_study_type ON priv_study USING btree (priv_type);


--
-- Name: proc_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX proc_hpdef_fk ON rel_hpdef_proc USING btree (hpdef_fk);


--
-- Name: published_study_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX published_study_status ON published_study USING btree (status);


--
-- Name: reason_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reason_hpdef_fk ON rel_hpdef_reason USING btree (hpdef_fk);


--
-- Name: ref_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ref_phys_fn_sx ON study USING btree (ref_phys_fn_sx);


--
-- Name: ref_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ref_phys_gn_sx ON study USING btree (ref_phys_gn_sx);


--
-- Name: ref_phys_i_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ref_phys_i_name ON study USING btree (ref_phys_i_name);


--
-- Name: ref_phys_p_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ref_phys_p_name ON study USING btree (ref_phys_p_name);


--
-- Name: ref_physician; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ref_physician ON study USING btree (ref_physician);


--
-- Name: region_hpdef_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX region_hpdef_fk ON rel_hpdef_region USING btree (hpdef_fk);


--
-- Name: repository_uid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX repository_uid ON published_study USING btree (repository_uid);


--
-- Name: ser_req_phys; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_phys ON series_req USING btree (req_physician);


--
-- Name: ser_req_phys_fn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_phys_fn_sx ON series_req USING btree (req_phys_fn_sx);


--
-- Name: ser_req_phys_gn_sx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_phys_gn_sx ON series_req USING btree (req_phys_gn_sx);


--
-- Name: ser_req_phys_i; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_phys_i ON series_req USING btree (req_phys_i_name);


--
-- Name: ser_req_phys_p; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_phys_p ON series_req USING btree (req_phys_p_name);


--
-- Name: ser_req_proc_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_proc_id ON series_req USING btree (req_proc_id);


--
-- Name: ser_req_series_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_series_fk ON series_req USING btree (series_fk);


--
-- Name: ser_req_service; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_service ON series_req USING btree (req_service);


--
-- Name: ser_req_sps_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_sps_id ON series_req USING btree (sps_id);


--
-- Name: ser_req_study_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ser_req_study_iuid ON series_req USING btree (study_iuid);


--
-- Name: series_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_created ON series USING btree (created_time);


--
-- Name: series_custom1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_custom1 ON series USING btree (series_custom1);


--
-- Name: series_custom2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_custom2 ON series USING btree (series_custom2);


--
-- Name: series_custom3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_custom3 ON series USING btree (series_custom3);


--
-- Name: series_desc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_desc ON series USING btree (series_desc);


--
-- Name: series_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_fk ON instance USING btree (series_fk);


--
-- Name: series_inst_code_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_inst_code_fk ON series USING btree (inst_code_fk);


--
-- Name: series_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX series_iuid ON series USING btree (series_iuid);


--
-- Name: series_mpps_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_mpps_fk ON series USING btree (mpps_fk);


--
-- Name: series_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_no ON series USING btree (series_no);


--
-- Name: series_pps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_pps_iuid ON series USING btree (pps_iuid);


--
-- Name: series_pps_start; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_pps_start ON series USING btree (pps_start);


--
-- Name: series_src_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_src_aet ON series USING btree (src_aet);


--
-- Name: series_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_status ON series USING btree (series_status);


--
-- Name: series_updated; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX series_updated ON series USING btree (updated_time);


--
-- Name: sop_cuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sop_cuid ON instance USING btree (sop_cuid);


--
-- Name: sop_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX sop_iuid ON instance USING btree (sop_iuid);


--
-- Name: sps_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sps_status ON mwl_item USING btree (sps_status);


--
-- Name: sr_complete; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sr_complete ON instance USING btree (sr_complete);


--
-- Name: sr_verified; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sr_verified ON instance USING btree (sr_verified);


--
-- Name: srcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX srcode_fk ON instance USING btree (srcode_fk);


--
-- Name: station_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX station_name ON series USING btree (station_name);


--
-- Name: study_checked; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_checked ON study USING btree (checked_time);


--
-- Name: study_created; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_created ON study USING btree (created_time);


--
-- Name: study_custom1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_custom1 ON study USING btree (study_custom1);


--
-- Name: study_custom2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_custom2 ON study USING btree (study_custom2);


--
-- Name: study_custom3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_custom3 ON study USING btree (study_custom3);


--
-- Name: study_datetime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_datetime ON study USING btree (study_datetime);


--
-- Name: study_desc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_desc ON study USING btree (study_desc);


--
-- Name: study_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_fk ON series USING btree (study_fk);


--
-- Name: study_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_id ON study USING btree (study_id);


--
-- Name: study_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX study_iuid ON study USING btree (study_iuid);


--
-- Name: study_pcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_pcode_fk ON rel_study_pcode USING btree (pcode_fk);


--
-- Name: study_perm_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX study_perm_idx ON study_permission USING btree (study_iuid, action, roles);


--
-- Name: study_status; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_status ON study USING btree (study_status);


--
-- Name: study_status_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_status_id ON study USING btree (study_status_id);


--
-- Name: study_updated; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX study_updated ON study USING btree (updated_time);


--
-- Name: ups_adm_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_adm_id ON ups USING btree (adm_id);


--
-- Name: ups_adm_id_issuer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_adm_id_issuer_id ON ups USING btree (adm_id_issuer_id);


--
-- Name: ups_adm_id_issuer_uid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_adm_id_issuer_uid ON ups USING btree (adm_id_issuer_uid);


--
-- Name: ups_appcode_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_appcode_fk ON rel_ups_appcode USING btree (appcode_fk);


--
-- Name: ups_code_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_code_fk ON ups USING btree (code_fk);


--
-- Name: ups_compl_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_compl_time ON ups USING btree (ups_compl_time);


--
-- Name: ups_confidentiality; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_confidentiality ON ups_req USING btree (confidentiality);


--
-- Name: ups_deletion_lock; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_deletion_lock ON ups_subscr USING btree (deletion_lock);


--
-- Name: ups_devclass_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_devclass_fk ON rel_ups_devclass USING btree (devclass_fk);


--
-- Name: ups_devloc_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_devloc_fk ON rel_ups_devloc USING btree (devloc_fk);


--
-- Name: ups_devname_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_devname_fk ON rel_ups_devname USING btree (devname_fk);


--
-- Name: ups_glob_subscr_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ups_glob_subscr_aet ON ups_glob_subscr USING btree (aet);


--
-- Name: ups_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ups_iuid ON ups USING btree (ups_iuid);


--
-- Name: ups_label; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_label ON ups USING btree (ups_label);


--
-- Name: ups_patient_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_patient_fk ON ups USING btree (patient_fk);


--
-- Name: ups_performer_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_performer_fk ON rel_ups_performer USING btree (performer_fk);


--
-- Name: ups_prior; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_prior ON ups USING btree (ups_prior);


--
-- Name: ups_rel_ps_cuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_rel_ps_cuid ON ups_rel_ps USING btree (sop_cuid);


--
-- Name: ups_rel_ps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_rel_ps_iuid ON ups_rel_ps USING btree (sop_iuid);


--
-- Name: ups_rel_ps_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_rel_ps_ups_fk ON ups_rel_ps USING btree (ups_fk);


--
-- Name: ups_repl_ps_cuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_repl_ps_cuid ON ups_repl_ps USING btree (sop_cuid);


--
-- Name: ups_repl_ps_iuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_repl_ps_iuid ON ups_repl_ps USING btree (sop_iuid);


--
-- Name: ups_repl_ps_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_repl_ps_ups_fk ON ups_repl_ps USING btree (ups_fk);


--
-- Name: ups_req_acc_no; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_req_acc_no ON ups_req USING btree (accession_no);


--
-- Name: ups_req_proc_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_req_proc_id ON ups_req USING btree (req_proc_id);


--
-- Name: ups_req_service; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_req_service ON ups_req USING btree (req_service);


--
-- Name: ups_req_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_req_ups_fk ON ups_req USING btree (ups_fk);


--
-- Name: ups_start_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_start_time ON ups USING btree (ups_start_time);


--
-- Name: ups_state; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_state ON ups USING btree (ups_state);


--
-- Name: ups_subscr_aet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_subscr_aet ON ups_subscr USING btree (aet);


--
-- Name: ups_subscr_ups_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_subscr_ups_fk ON ups_subscr USING btree (ups_fk);


--
-- Name: ups_tuid; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_tuid ON ups USING btree (ups_tuid);


--
-- Name: ups_updated_time; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ups_updated_time ON ups USING btree (updated_time);


--
-- Name: user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX user_id ON roles USING btree (user_id);


--
-- Name: uwl_label; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX uwl_label ON ups USING btree (uwl_label);


--
-- Name: verify_datetime; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX verify_datetime ON verify_observer USING btree (verify_datetime);


--
-- Name: content_item_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content_item
    ADD CONSTRAINT content_item_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES code(pk);


--
-- Name: content_item_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content_item
    ADD CONSTRAINT content_item_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES instance(pk);


--
-- Name: content_item_name_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content_item
    ADD CONSTRAINT content_item_name_fk_fkey FOREIGN KEY (name_fk) REFERENCES code(pk);


--
-- Name: files_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES filesystem(pk);


--
-- Name: files_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES instance(pk);


--
-- Name: filesystem_next_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filesystem
    ADD CONSTRAINT filesystem_next_fk_fkey FOREIGN KEY (next_fk) REFERENCES filesystem(pk);


--
-- Name: gppps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gppps
    ADD CONSTRAINT gppps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: gpsps_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps
    ADD CONSTRAINT gpsps_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES code(pk);


--
-- Name: gpsps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps
    ADD CONSTRAINT gpsps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: gpsps_perf_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps_perf
    ADD CONSTRAINT gpsps_perf_code_fk_fkey FOREIGN KEY (code_fk) REFERENCES code(pk);


--
-- Name: gpsps_perf_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps_perf
    ADD CONSTRAINT gpsps_perf_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: gpsps_req_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gpsps_req
    ADD CONSTRAINT gpsps_req_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: hp_user_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hp
    ADD CONSTRAINT hp_user_fk_fkey FOREIGN KEY (user_fk) REFERENCES code(pk);


--
-- Name: hpdef_hp_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY hpdef
    ADD CONSTRAINT hpdef_hp_fk_fkey FOREIGN KEY (hp_fk) REFERENCES hp(pk);


--
-- Name: instance_media_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instance
    ADD CONSTRAINT instance_media_fk_fkey FOREIGN KEY (media_fk) REFERENCES media(pk);


--
-- Name: instance_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instance
    ADD CONSTRAINT instance_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES series(pk);


--
-- Name: instance_srcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instance
    ADD CONSTRAINT instance_srcode_fk_fkey FOREIGN KEY (srcode_fk) REFERENCES code(pk);


--
-- Name: mpps_drcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mpps
    ADD CONSTRAINT mpps_drcode_fk_fkey FOREIGN KEY (drcode_fk) REFERENCES code(pk);


--
-- Name: mpps_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mpps
    ADD CONSTRAINT mpps_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: mwl_item_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mwl_item
    ADD CONSTRAINT mwl_item_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: patient_merge_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patient
    ADD CONSTRAINT patient_merge_fk_fkey FOREIGN KEY (merge_fk) REFERENCES patient(pk);


--
-- Name: priv_file_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_file
    ADD CONSTRAINT priv_file_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES filesystem(pk);


--
-- Name: priv_file_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_file
    ADD CONSTRAINT priv_file_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES priv_instance(pk);


--
-- Name: priv_instance_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_instance
    ADD CONSTRAINT priv_instance_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES priv_series(pk);


--
-- Name: priv_series_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_series
    ADD CONSTRAINT priv_series_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES priv_study(pk);


--
-- Name: priv_study_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priv_study
    ADD CONSTRAINT priv_study_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES priv_patient(pk);


--
-- Name: published_study_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY published_study
    ADD CONSTRAINT published_study_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES study(pk);


--
-- Name: rel_dev_proto_device_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_dev_proto
    ADD CONSTRAINT rel_dev_proto_device_fk_fkey FOREIGN KEY (device_fk) REFERENCES device(pk);


--
-- Name: rel_dev_proto_prcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_dev_proto
    ADD CONSTRAINT rel_dev_proto_prcode_fk_fkey FOREIGN KEY (prcode_fk) REFERENCES code(pk);


--
-- Name: rel_gpsps_appcode_appcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_appcode
    ADD CONSTRAINT rel_gpsps_appcode_appcode_fk_fkey FOREIGN KEY (appcode_fk) REFERENCES code(pk);


--
-- Name: rel_gpsps_appcode_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_appcode
    ADD CONSTRAINT rel_gpsps_appcode_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: rel_gpsps_devclass_devclass_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devclass
    ADD CONSTRAINT rel_gpsps_devclass_devclass_fk_fkey FOREIGN KEY (devclass_fk) REFERENCES code(pk);


--
-- Name: rel_gpsps_devclass_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devclass
    ADD CONSTRAINT rel_gpsps_devclass_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: rel_gpsps_devloc_devloc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devloc
    ADD CONSTRAINT rel_gpsps_devloc_devloc_fk_fkey FOREIGN KEY (devloc_fk) REFERENCES code(pk);


--
-- Name: rel_gpsps_devloc_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devloc
    ADD CONSTRAINT rel_gpsps_devloc_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: rel_gpsps_devname_devname_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devname
    ADD CONSTRAINT rel_gpsps_devname_devname_fk_fkey FOREIGN KEY (devname_fk) REFERENCES code(pk);


--
-- Name: rel_gpsps_devname_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_devname
    ADD CONSTRAINT rel_gpsps_devname_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: rel_gpsps_gppps_gppps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_gppps
    ADD CONSTRAINT rel_gpsps_gppps_gppps_fk_fkey FOREIGN KEY (gppps_fk) REFERENCES gppps(pk);


--
-- Name: rel_gpsps_gppps_gpsps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_gpsps_gppps
    ADD CONSTRAINT rel_gpsps_gppps_gpsps_fk_fkey FOREIGN KEY (gpsps_fk) REFERENCES gpsps(pk);


--
-- Name: rel_hpdef_proc_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_proc
    ADD CONSTRAINT rel_hpdef_proc_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES hpdef(pk);


--
-- Name: rel_hpdef_proc_proc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_proc
    ADD CONSTRAINT rel_hpdef_proc_proc_fk_fkey FOREIGN KEY (proc_fk) REFERENCES code(pk);


--
-- Name: rel_hpdef_reason_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_reason
    ADD CONSTRAINT rel_hpdef_reason_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES hpdef(pk);


--
-- Name: rel_hpdef_reason_reason_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_reason
    ADD CONSTRAINT rel_hpdef_reason_reason_fk_fkey FOREIGN KEY (reason_fk) REFERENCES code(pk);


--
-- Name: rel_hpdef_region_hpdef_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_region
    ADD CONSTRAINT rel_hpdef_region_hpdef_fk_fkey FOREIGN KEY (hpdef_fk) REFERENCES hpdef(pk);


--
-- Name: rel_hpdef_region_region_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_hpdef_region
    ADD CONSTRAINT rel_hpdef_region_region_fk_fkey FOREIGN KEY (region_fk) REFERENCES code(pk);


--
-- Name: rel_pat_other_pid_other_pid_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_pat_other_pid
    ADD CONSTRAINT rel_pat_other_pid_other_pid_fk_fkey FOREIGN KEY (other_pid_fk) REFERENCES other_pid(pk);


--
-- Name: rel_pat_other_pid_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_pat_other_pid
    ADD CONSTRAINT rel_pat_other_pid_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: rel_study_pcode_pcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_study_pcode
    ADD CONSTRAINT rel_study_pcode_pcode_fk_fkey FOREIGN KEY (pcode_fk) REFERENCES code(pk);


--
-- Name: rel_study_pcode_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_study_pcode
    ADD CONSTRAINT rel_study_pcode_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES study(pk);


--
-- Name: rel_ups_appcode_appcode_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_appcode
    ADD CONSTRAINT rel_ups_appcode_appcode_fk_fkey FOREIGN KEY (appcode_fk) REFERENCES code(pk);


--
-- Name: rel_ups_appcode_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_appcode
    ADD CONSTRAINT rel_ups_appcode_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: rel_ups_devclass_devclass_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devclass
    ADD CONSTRAINT rel_ups_devclass_devclass_fk_fkey FOREIGN KEY (devclass_fk) REFERENCES code(pk);


--
-- Name: rel_ups_devclass_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devclass
    ADD CONSTRAINT rel_ups_devclass_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: rel_ups_devloc_devloc_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devloc
    ADD CONSTRAINT rel_ups_devloc_devloc_fk_fkey FOREIGN KEY (devloc_fk) REFERENCES code(pk);


--
-- Name: rel_ups_devloc_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devloc
    ADD CONSTRAINT rel_ups_devloc_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: rel_ups_devname_devname_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devname
    ADD CONSTRAINT rel_ups_devname_devname_fk_fkey FOREIGN KEY (devname_fk) REFERENCES code(pk);


--
-- Name: rel_ups_devname_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_devname
    ADD CONSTRAINT rel_ups_devname_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: rel_ups_performer_performer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_performer
    ADD CONSTRAINT rel_ups_performer_performer_fk_fkey FOREIGN KEY (performer_fk) REFERENCES code(pk);


--
-- Name: rel_ups_performer_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rel_ups_performer
    ADD CONSTRAINT rel_ups_performer_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: series_inst_code_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_inst_code_fk_fkey FOREIGN KEY (inst_code_fk) REFERENCES code(pk);


--
-- Name: series_mpps_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_mpps_fk_fkey FOREIGN KEY (mpps_fk) REFERENCES mpps(pk);


--
-- Name: series_req_accno_issuer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series_req
    ADD CONSTRAINT series_req_accno_issuer_fk_fkey FOREIGN KEY (accno_issuer_fk) REFERENCES issuer(pk);


--
-- Name: series_req_series_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series_req
    ADD CONSTRAINT series_req_series_fk_fkey FOREIGN KEY (series_fk) REFERENCES series(pk);


--
-- Name: series_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES study(pk);


--
-- Name: study_accno_issuer_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study
    ADD CONSTRAINT study_accno_issuer_fk_fkey FOREIGN KEY (accno_issuer_fk) REFERENCES issuer(pk);


--
-- Name: study_on_fs_filesystem_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study_on_fs
    ADD CONSTRAINT study_on_fs_filesystem_fk_fkey FOREIGN KEY (filesystem_fk) REFERENCES filesystem(pk);


--
-- Name: study_on_fs_study_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study_on_fs
    ADD CONSTRAINT study_on_fs_study_fk_fkey FOREIGN KEY (study_fk) REFERENCES study(pk);


--
-- Name: study_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY study
    ADD CONSTRAINT study_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: ups_patient_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups
    ADD CONSTRAINT ups_patient_fk_fkey FOREIGN KEY (patient_fk) REFERENCES patient(pk);


--
-- Name: ups_rel_ps_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_rel_ps
    ADD CONSTRAINT ups_rel_ps_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: ups_repl_ps_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_repl_ps
    ADD CONSTRAINT ups_repl_ps_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: ups_req_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_req
    ADD CONSTRAINT ups_req_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: ups_subscr_ups_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ups_subscr
    ADD CONSTRAINT ups_subscr_ups_fk_fkey FOREIGN KEY (ups_fk) REFERENCES ups(pk);


--
-- Name: verify_observer_instance_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY verify_observer
    ADD CONSTRAINT verify_observer_instance_fk_fkey FOREIGN KEY (instance_fk) REFERENCES instance(pk);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

