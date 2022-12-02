--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_student; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.accounts_student (
    id integer NOT NULL,
    studying_year integer NOT NULL,
    program_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_student OWNER TO tqotyysltnsfmk;

--
-- Name: accounts_student_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.accounts_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_student_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: accounts_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.accounts_student_id_seq OWNED BY public.accounts_student.id;


--
-- Name: accounts_studentsubjects; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.accounts_studentsubjects (
    id integer NOT NULL,
    points_accomplished double precision NOT NULL,
    points_total double precision NOT NULL,
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    academic_year integer NOT NULL,
    semester character varying(1),
    active boolean NOT NULL
);


ALTER TABLE public.accounts_studentsubjects OWNER TO tqotyysltnsfmk;

--
-- Name: accounts_studentsubjects_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.accounts_studentsubjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_studentsubjects_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: accounts_studentsubjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.accounts_studentsubjects_id_seq OWNED BY public.accounts_studentsubjects.id;


--
-- Name: activities_class_globalclassactivity; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.activities_class_globalclassactivity (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    location character varying(128) NOT NULL,
    type integer NOT NULL,
    details text,
    due_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    subject_id integer NOT NULL,
    attended boolean NOT NULL,
    "group" character varying(2),
    active boolean NOT NULL
);


ALTER TABLE public.activities_class_globalclassactivity OWNER TO tqotyysltnsfmk;

--
-- Name: activities_class_globalclassactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.activities_class_globalclassactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_class_globalclassactivity_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: activities_class_globalclassactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.activities_class_globalclassactivity_id_seq OWNED BY public.activities_class_globalclassactivity.id;


--
-- Name: activities_class_studentclassactivity; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.activities_class_studentclassactivity (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    location character varying(128) NOT NULL,
    type integer NOT NULL,
    details text,
    due_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    global_activity_id integer,
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    attended boolean NOT NULL,
    "group" character varying(2),
    active boolean NOT NULL
);


ALTER TABLE public.activities_class_studentclassactivity OWNER TO tqotyysltnsfmk;

--
-- Name: activities_class_studentclassactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.activities_class_studentclassactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_class_studentclassactivity_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: activities_class_studentclassactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.activities_class_studentclassactivity_id_seq OWNED BY public.activities_class_studentclassactivity.id;


--
-- Name: activities_score_globalscoreactivity; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.activities_score_globalscoreactivity (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    location character varying(128) NOT NULL,
    type integer NOT NULL,
    details text,
    points_accomplished double precision NOT NULL,
    points_total double precision NOT NULL,
    due_date date,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    subject_id integer NOT NULL,
    completed boolean,
    "group" character varying(2),
    active boolean NOT NULL
);


ALTER TABLE public.activities_score_globalscoreactivity OWNER TO tqotyysltnsfmk;

--
-- Name: activities_score_globalscoreactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.activities_score_globalscoreactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_score_globalscoreactivity_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: activities_score_globalscoreactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.activities_score_globalscoreactivity_id_seq OWNED BY public.activities_score_globalscoreactivity.id;


--
-- Name: activities_score_studentscoreactivity; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.activities_score_studentscoreactivity (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    location character varying(128) NOT NULL,
    type integer NOT NULL,
    details text,
    points_accomplished double precision NOT NULL,
    points_total double precision NOT NULL,
    due_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    global_activity_id integer,
    student_id integer NOT NULL,
    subject_id integer NOT NULL,
    completed boolean,
    "group" character varying(2),
    active boolean NOT NULL
);


ALTER TABLE public.activities_score_studentscoreactivity OWNER TO tqotyysltnsfmk;

--
-- Name: activities_score_studentscoreactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.activities_score_studentscoreactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_score_studentscoreactivity_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: activities_score_studentscoreactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.activities_score_studentscoreactivity_id_seq OWNED BY public.activities_score_studentscoreactivity.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tqotyysltnsfmk;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tqotyysltnsfmk;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tqotyysltnsfmk;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: departments_department; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.departments_department (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(8) NOT NULL,
    address character varying(254) NOT NULL,
    email character varying(254) NOT NULL,
    contact character varying(16) NOT NULL,
    web character varying(254) NOT NULL,
    university_id integer NOT NULL
);


ALTER TABLE public.departments_department OWNER TO tqotyysltnsfmk;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_department_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments_department.id;


--
-- Name: departments_program; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.departments_program (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    type character varying(50) NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.departments_program OWNER TO tqotyysltnsfmk;

--
-- Name: departments_program_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.departments_program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_program_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: departments_program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.departments_program_id_seq OWNED BY public.departments_program.id;


--
-- Name: departments_university; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.departments_university (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(8) NOT NULL,
    address text NOT NULL,
    email character varying(254) NOT NULL,
    contact character varying(16) NOT NULL
);


ALTER TABLE public.departments_university OWNER TO tqotyysltnsfmk;

--
-- Name: departments_university_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.departments_university_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_university_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: departments_university_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.departments_university_id_seq OWNED BY public.departments_university.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO tqotyysltnsfmk;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tqotyysltnsfmk;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tqotyysltnsfmk;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tqotyysltnsfmk;

--
-- Name: subjects_subject; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.subjects_subject (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    ects integer NOT NULL,
    professor character varying(128),
    assistant character varying(128),
    code character varying(14) NOT NULL,
    csv_file character varying(254),
    dinp_link character varying(254),
    predavanja_dan character varying(64),
    predavanja_trajanje interval NOT NULL,
    predavanja_vrijeme time without time zone,
    vjezbe_dan character varying(64),
    vjezbe_trajanje interval NOT NULL,
    vjezbe_vrijeme time without time zone,
    description text NOT NULL
);


ALTER TABLE public.subjects_subject OWNER TO tqotyysltnsfmk;

--
-- Name: subjects_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.subjects_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_subject_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: subjects_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.subjects_subject_id_seq OWNED BY public.subjects_subject.id;


--
-- Name: subjects_subjectprograms; Type: TABLE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE TABLE public.subjects_subjectprograms (
    id integer NOT NULL,
    optional boolean NOT NULL,
    program_id integer NOT NULL,
    subject_id integer NOT NULL,
    academic_year integer NOT NULL,
    semester character varying(1),
    active boolean NOT NULL
);


ALTER TABLE public.subjects_subjectprograms OWNER TO tqotyysltnsfmk;

--
-- Name: subjects_subjectprograms_id_seq; Type: SEQUENCE; Schema: public; Owner: tqotyysltnsfmk
--

CREATE SEQUENCE public.subjects_subjectprograms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_subjectprograms_id_seq OWNER TO tqotyysltnsfmk;

--
-- Name: subjects_subjectprograms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tqotyysltnsfmk
--

ALTER SEQUENCE public.subjects_subjectprograms_id_seq OWNED BY public.subjects_subjectprograms.id;


--
-- Name: accounts_student id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_student ALTER COLUMN id SET DEFAULT nextval('public.accounts_student_id_seq'::regclass);


--
-- Name: accounts_studentsubjects id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_studentsubjects ALTER COLUMN id SET DEFAULT nextval('public.accounts_studentsubjects_id_seq'::regclass);


--
-- Name: activities_class_globalclassactivity id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_globalclassactivity ALTER COLUMN id SET DEFAULT nextval('public.activities_class_globalclassactivity_id_seq'::regclass);


--
-- Name: activities_class_studentclassactivity id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_studentclassactivity ALTER COLUMN id SET DEFAULT nextval('public.activities_class_studentclassactivity_id_seq'::regclass);


--
-- Name: activities_score_globalscoreactivity id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_globalscoreactivity ALTER COLUMN id SET DEFAULT nextval('public.activities_score_globalscoreactivity_id_seq'::regclass);


--
-- Name: activities_score_studentscoreactivity id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_studentscoreactivity ALTER COLUMN id SET DEFAULT nextval('public.activities_score_studentscoreactivity_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: departments_department id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_department ALTER COLUMN id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: departments_program id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_program ALTER COLUMN id SET DEFAULT nextval('public.departments_program_id_seq'::regclass);


--
-- Name: departments_university id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_university ALTER COLUMN id SET DEFAULT nextval('public.departments_university_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: subjects_subject id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subject ALTER COLUMN id SET DEFAULT nextval('public.subjects_subject_id_seq'::regclass);


--
-- Name: subjects_subjectprograms id; Type: DEFAULT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subjectprograms ALTER COLUMN id SET DEFAULT nextval('public.subjects_subjectprograms_id_seq'::regclass);


--
-- Data for Name: accounts_student; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.accounts_student (id, studying_year, program_id, user_id) FROM stdin;
2	2	13	3
4	1	13	5
6	1	14	7
7	1	13	8
8	2	13	9
9	3	11	11
10	3	11	12
11	2	13	13
12	2	131	14
13	3	17	15
14	1	13	16
15	2	14	17
16	2	14	18
17	1	11	19
18	1	11	20
19	1	13	21
20	1	13	22
21	1	13	23
22	1	14	24
23	1	13	25
24	2	14	26
25	1	13	27
26	1	13	28
27	1	14	29
28	1	14	30
29	2	13	31
\.


--
-- Data for Name: accounts_studentsubjects; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.accounts_studentsubjects (id, points_accomplished, points_total, student_id, subject_id, academic_year, semester, active) FROM stdin;
487	53	61	2	1	2021	1	f
488	78.25	90	2	2	2021	1	f
591	0	0	2	22	2021	3	t
592	0	0	2	19	2021	3	t
96	66.13	80	2	4	2020	2	f
95	49.03	100	2	3	2020	2	f
113	0	99.99	4	10	2020	2	f
489	70.62	100	2	3	2021	1	f
490	66.13	80	2	4	2021	1	f
322	0	100	14	12	2020	2	f
312	0	100	11	3	2020	1	f
491	0	61	4	1	2021	1	t
492	0	90	4	2	2021	1	t
493	0	100	4	3	2021	1	t
103	0	90	4	18	2020	3	f
494	0	80	4	4	2021	1	t
495	15	120	6	5	2021	1	t
496	6	100	6	2	2021	1	t
497	0	100	6	3	2021	1	t
498	0	100	6	6	2021	1	t
313	0	80	11	4	2020	1	f
134	0	61	7	1	2020	1	f
482	0	100	28	14	2020	2	f
483	0	0	28	27	2020	2	f
484	0	100	28	23	2020	2	f
485	0	100	28	24	2020	2	f
486	0	0	28	26	2020	2	f
314	0	100	11	12	2020	2	f
137	0	90	7	2	2020	1	f
142	0	100	7	12	2020	2	f
132	0	80	7	20	2020	3	f
318	0	100	14	9	2020	2	f
130	0	90	7	18	2020	3	f
135	0	100	7	3	2020	1	f
136	0	80	7	4	2020	1	f
94	53	61	2	1	2020	2	f
138	0	0	7	27	2020	4	f
131	0	40	7	19	2020	3	f
133	0	0	7	26	2020	4	f
147	0	61	8	1	2020	1	f
150	0	90	8	2	2020	1	f
108	0	100	4	3	2020	1	f
109	0	80	4	4	2020	1	f
139	0	100	7	9	2020	2	f
145	0	80	8	20	2020	3	f
158	0	100	9	37	2020	1	f
141	0	100	7	11	2020	2	f
111	0	0	4	27	2020	4	f
143	0	90	8	18	2020	3	f
174	0	100	9	53	2020	5	f
165	0	100	9	44	2020	3	f
157	0	100	9	36	2020	1	f
149	0	80	8	4	2020	1	f
166	0	100	9	45	2020	3	f
267	0	80	26	4	2020	1	f
164	0	100	9	43	2020	3	f
320	0	100	14	11	2020	2	f
107	0	61	4	1	2020	1	f
97	43.25	90	2	2	2020	2	f
104	0	40	4	19	2020	3	f
167	0	100	9	46	2020	3	f
170	0	100	9	49	2020	5	f
161	0	100	9	40	2020	1	f
162	0	0	9	41	2020	1	f
171	0	100	9	50	2020	5	f
169	0	100	9	48	2020	3	f
156	0	100	9	35	2020	1	f
163	0	100	9	42	2020	3	f
588	0	0	2	20	2021	3	t
159	0	100	9	38	2020	1	f
589	0	0	2	18	2021	3	t
172	0	100	9	51	2020	5	f
590	0	0	2	24	2021	3	t
173	0	100	9	52	2020	5	f
160	0	100	9	39	2020	1	f
499	0	61	7	1	2021	1	t
500	0	90	7	2	2021	1	t
501	0	100	7	3	2021	1	t
502	0	80	7	4	2021	1	t
503	0	80	8	20	2021	3	t
504	0	90	8	18	2021	3	t
505	0	50	8	24	2021	3	t
506	0	100	9	49	2021	5	t
507	0	100	9	50	2021	5	t
508	0	100	9	51	2021	5	t
509	0	100	9	52	2021	5	t
510	0	100	9	53	2021	5	t
511	0	100	10	49	2021	5	t
512	0	100	10	50	2021	5	t
513	0	100	10	51	2021	5	t
514	0	100	10	52	2021	5	t
515	0	100	10	53	2021	5	t
516	0	80	11	20	2021	3	t
517	0	90	11	18	2021	3	t
518	0	50	11	24	2021	3	t
519	0	61	14	1	2021	1	t
520	0	90	14	2	2021	1	t
521	0	100	14	3	2021	1	t
522	0	80	14	4	2021	1	t
523	0	80	15	20	2021	3	t
524	0	100	15	21	2021	3	t
525	0	90	15	18	2021	3	t
526	0	100	15	23	2021	3	t
527	0	50	15	24	2021	3	t
528	29	80	16	20	2021	3	t
529	0	100	16	21	2021	3	t
530	0	90	16	18	2021	3	t
531	19	100	16	23	2021	3	t
532	0	50	16	24	2021	3	t
533	0	100	17	40	2021	1	t
534	0	100	17	35	2021	1	t
535	0	100	17	38	2021	1	t
536	0	100	17	39	2021	1	t
537	0	100	17	37	2021	1	t
538	0	100	17	36	2021	1	t
539	0	0	17	41	2021	1	t
540	0	100	18	40	2021	1	t
541	0	100	18	35	2021	1	t
542	0	100	18	38	2021	1	t
543	0	100	18	39	2021	1	t
544	0	100	18	37	2021	1	t
545	0	100	18	36	2021	1	t
546	0	0	18	41	2021	1	t
547	0	61	19	1	2021	1	t
548	0	90	19	2	2021	1	t
549	0	100	19	3	2021	1	t
550	0	80	19	4	2021	1	t
551	0	61	20	1	2021	1	t
552	0	90	20	2	2021	1	t
553	0	100	20	3	2021	1	t
554	0	80	20	4	2021	1	t
555	0	61	21	1	2021	1	t
556	0	90	21	2	2021	1	t
557	0	100	21	3	2021	1	t
558	0	80	21	4	2021	1	t
559	0	100	22	5	2021	1	t
560	0	90	22	2	2021	1	t
561	0	100	22	3	2021	1	t
562	0	100	22	6	2021	1	t
563	0	61	23	1	2021	1	t
564	0	90	23	2	2021	1	t
565	0	100	23	3	2021	1	t
566	0	80	23	4	2021	1	t
567	0	80	24	20	2021	3	t
568	0	100	24	21	2021	3	t
569	0	90	24	18	2021	3	t
570	0	100	24	23	2021	3	t
571	0	50	24	24	2021	3	t
572	0	61	25	1	2021	1	t
573	0	90	25	2	2021	1	t
574	0	100	25	3	2021	1	t
575	0	80	25	4	2021	1	t
576	0	61	26	1	2021	1	t
577	0	90	26	2	2021	1	t
578	0	100	26	3	2021	1	t
579	0	80	26	4	2021	1	t
580	0	100	27	5	2021	1	t
581	0	90	27	2	2021	1	t
582	0	100	27	3	2021	1	t
583	0	100	27	6	2021	1	t
584	0	100	28	5	2021	1	t
585	0	90	28	2	2021	1	t
586	0	100	28	3	2021	1	t
587	0	100	28	6	2021	1	t
168	0	100	9	47	2020	3	f
114	0	100	4	11	2020	2	f
323	0	99.99	14	10	2020	2	f
120	6	100	6	2	2020	1	f
198	0	80	11	20	2020	3	f
311	0	100	11	11	2020	2	f
196	0	90	11	18	2020	3	f
189	0	100	10	49	2020	5	f
190	0	100	10	50	2020	5	f
175	0	100	10	35	2020	1	f
191	0	100	10	51	2020	5	f
192	0	100	10	52	2020	5	f
193	0	100	10	53	2020	5	f
315	0	99.99	11	10	2020	2	f
316	0	0	11	27	2020	4	f
197	0	40	11	19	2020	3	f
317	0	0	11	26	2020	4	f
200	0	61	14	1	2020	1	f
201	0	90	14	2	2020	1	f
319	0	80	14	20	2020	3	f
321	0	90	14	18	2020	3	f
202	0	100	14	3	2020	1	f
203	0	80	14	4	2020	1	f
123	0	100	6	3	2020	1	f
112	0	100	4	9	2020	2	f
324	0	0	14	27	2020	4	f
325	0	40	14	19	2020	3	f
326	0	0	14	26	2020	4	f
106	0	0	4	26	2020	4	f
327	0	100	15	5	2020	1	f
328	0	90	15	2	2020	1	f
329	0	100	15	9	2020	2	f
204	0	80	15	20	2020	3	f
205	0	100	15	21	2020	3	f
330	0	100	15	13	2020	2	f
331	0	100	15	3	2020	1	f
332	0	100	15	6	2020	1	f
333	0	99.99	15	10	2020	2	f
334	0	100	15	14	2020	2	f
335	0	0	15	27	2020	4	f
206	0	100	15	23	2020	3	f
207	0	100	15	24	2020	3	f
336	0	0	15	26	2020	4	f
208	29	80	16	20	2020	3	f
211	0	100	16	24	2020	3	f
264	0	61	26	1	2020	1	f
265	0	90	26	2	2020	1	f
266	0	100	26	3	2020	1	f
209	0	100	16	21	2020	3	f
353	0	100	17	51	2020	5	f
210	19	100	16	23	2020	3	f
121	15	120	6	5	2020	1	f
356	0	100	17	44	2020	3	f
212	0	100	17	35	2020	1	f
221	0	100	18	37	2020	1	f
226	0	61	19	1	2020	1	f
228	0	100	19	3	2020	1	f
220	0	100	18	36	2020	1	f
225	0	0	18	41	2020	1	f
229	0	80	19	4	2020	1	f
230	0	61	20	1	2020	1	f
231	0	90	20	2	2020	1	f
232	0	100	20	3	2020	1	f
234	0	61	21	1	2020	1	f
235	0	90	21	2	2020	1	f
236	0	100	21	3	2020	1	f
237	0	80	21	4	2020	1	f
241	0	100	22	5	2020	1	f
239	0	90	22	2	2020	1	f
240	0	100	22	3	2020	1	f
238	0	100	21	7	2020	\N	f
243	0	61	23	1	2020	1	f
244	0	90	23	2	2020	1	f
242	0	100	22	6	2020	1	f
245	0	100	23	3	2020	1	f
246	0	80	23	4	2020	1	f
247	0	80	24	20	2020	3	f
248	0	100	24	21	2020	3	f
249	0	100	24	23	2020	3	f
250	0	100	24	24	2020	3	f
251	0	61	25	1	2020	1	f
252	0	90	25	2	2020	1	f
253	0	100	25	3	2020	1	f
254	0	80	25	4	2020	1	f
280	0	100	6	13	2020	2	f
281	0	99.99	6	10	2020	2	f
282	0	100	6	14	2020	2	f
277	0	100	6	9	2020	2	f
262	0	100	8	5	2020	\N	f
227	0	90	19	2	2020	1	f
278	0	80	6	20	2020	3	f
233	0	80	20	4	2020	1	f
279	0	100	6	21	2020	3	f
283	0	0	6	27	2020	4	f
284	0	100	6	23	2020	3	f
285	0	100	6	24	2020	3	f
286	0	0	6	26	2020	4	f
287	0	100	8	9	2020	2	f
288	0	100	8	11	2020	2	f
289	0	100	8	3	2020	1	f
290	0	100	8	12	2020	2	f
291	0	99.99	8	10	2020	2	f
292	0	0	8	27	2020	4	f
293	0	40	8	19	2020	3	f
308	0	61	11	1	2020	1	f
309	0	90	11	2	2020	1	f
310	0	100	11	9	2020	2	f
337	0	100	16	5	2020	1	f
338	0	90	16	2	2020	1	f
339	0	100	16	9	2020	2	f
340	0	100	16	13	2020	2	f
341	0	100	16	3	2020	1	f
342	0	100	16	6	2020	1	f
343	0	99.99	16	10	2020	2	f
295	0	100	10	43	2020	3	f
296	0	100	10	46	2020	3	f
297	0	100	10	40	2020	1	f
298	0	100	10	48	2020	3	f
299	0	100	10	42	2020	3	f
300	0	100	10	38	2020	1	f
301	0	100	10	39	2020	1	f
302	0	100	10	37	2020	1	f
303	0	100	10	44	2020	3	f
304	0	100	10	36	2020	1	f
305	0	100	10	45	2020	3	f
306	0	0	10	41	2020	1	f
307	0	100	10	47	2020	3	f
344	0	100	16	14	2020	2	f
345	0	0	16	27	2020	4	f
346	0	0	16	26	2020	4	f
347	0	100	17	43	2020	3	f
348	0	100	17	46	2020	3	f
349	0	100	17	49	2020	5	f
217	0	100	17	40	2020	1	f
350	0	100	17	50	2020	5	f
351	0	100	17	48	2020	3	f
352	0	100	17	42	2020	3	f
215	0	100	17	38	2020	1	f
354	0	100	17	52	2020	5	f
216	0	100	17	39	2020	1	f
214	0	100	17	37	2020	1	f
355	0	100	17	53	2020	5	f
213	0	100	17	36	2020	1	f
357	0	100	17	45	2020	3	f
218	0	0	17	41	2020	1	f
358	0	100	17	47	2020	3	f
359	0	100	18	43	2020	3	f
360	0	100	18	46	2020	3	f
361	0	100	18	49	2020	5	f
224	0	100	18	40	2020	1	f
219	0	100	18	35	2020	1	f
222	0	100	18	38	2020	1	f
223	0	100	18	39	2020	1	f
432	0	99.99	25	10	2020	2	f
395	0	0	21	27	2020	4	f
396	0	40	21	19	2020	3	f
397	0	0	21	26	2020	4	f
436	0	100	26	9	2020	2	f
399	0	80	22	20	2020	3	f
400	0	100	22	21	2020	3	f
463	0	100	27	21	2020	2	f
464	0	100	27	13	2020	2	f
404	0	0	22	27	2020	4	f
405	0	100	22	23	2020	3	f
406	0	100	22	24	2020	3	f
454	0	99.99	2	10	2020	2	f
414	0	0	23	27	2020	4	f
415	0	40	23	19	2020	3	f
416	0	0	23	26	2020	4	f
417	0	100	24	5	2020	1	f
418	0	90	24	2	2020	1	f
419	0	100	24	9	2020	2	f
420	0	100	24	13	2020	2	f
421	0	100	24	3	2020	1	f
422	0	100	24	6	2020	1	f
423	0	99.99	24	10	2020	2	f
424	0	100	24	14	2020	2	f
425	0	0	24	27	2020	4	f
426	0	0	24	26	2020	4	f
140	0	99.99	7	10	2020	2	f
371	0	100	19	9	2020	2	f
433	0	0	25	27	2020	4	f
434	0	40	25	19	2020	3	f
373	0	100	19	11	2020	2	f
437	0	80	26	20	2020	3	f
375	0	100	19	12	2020	2	f
439	0	90	26	18	2020	3	f
376	0	99.99	19	10	2020	2	f
380	0	100	20	9	2020	2	f
442	0	0	26	27	2020	4	f
443	0	40	26	19	2020	3	f
444	0	0	26	26	2020	4	f
393	0	100	21	12	2020	2	f
448	50.5	100	2	6	2020	2	f
382	0	100	20	11	2020	2	f
394	0	99.99	21	10	2020	2	f
462	0	80	27	20	2020	2	f
466	0	100	27	6	2020	2	f
468	0	100	27	14	2020	2	f
470	0	100	27	23	2020	2	f
471	0	100	27	24	2020	2	f
459	0	100	27	5	2020	2	f
467	0	99.99	27	10	2020	2	f
431	0	100	25	12	2020	2	f
435	0	0	25	26	2020	4	f
473	0	100	28	5	2020	2	f
474	0	90	28	2	2020	2	f
475	0	100	28	9	2020	2	f
476	0	80	28	20	2020	2	f
477	0	100	28	21	2020	2	f
478	0	100	28	13	2020	2	f
479	0	100	28	3	2020	2	f
480	0	100	28	6	2020	2	f
481	0	99.99	28	10	2020	2	f
122	0	100	6	6	2020	1	f
110	0	90	4	2	2020	1	f
199	0	100	11	25	2020	\N	f
115	0	100	4	12	2020	2	f
105	0	80	4	20	2020	3	f
398	0	100	22	9	2020	2	f
401	0	100	22	13	2020	2	f
402	0	99.99	22	10	2020	2	f
403	0	100	22	14	2020	2	f
294	0	0	8	26	2020	4	f
408	0	100	23	9	2020	2	f
372	0	80	19	20	2020	3	f
362	0	100	18	50	2020	5	f
363	0	100	18	48	2020	3	f
364	0	100	18	42	2020	3	f
365	0	100	18	51	2020	5	f
366	0	100	18	52	2020	5	f
367	0	100	18	53	2020	5	f
368	0	100	18	44	2020	3	f
369	0	100	18	45	2020	3	f
370	0	100	18	47	2020	3	f
410	0	100	23	11	2020	2	f
374	0	90	19	18	2020	3	f
438	0	100	26	11	2020	2	f
440	0	100	26	12	2020	2	f
377	0	0	19	27	2020	4	f
378	0	40	19	19	2020	3	f
379	0	0	19	26	2020	4	f
441	0	99.99	26	10	2020	2	f
381	0	80	20	20	2020	3	f
383	0	90	20	18	2020	3	f
460	0	90	27	2	2020	2	f
465	0	100	27	3	2020	2	f
386	0	0	20	27	2020	4	f
387	0	40	20	19	2020	3	f
388	0	0	20	26	2020	4	f
390	0	80	21	20	2020	3	f
449	0	100	2	9	2020	2	f
407	0	0	22	26	2020	4	f
451	0	100	2	11	2020	2	f
409	0	80	23	20	2020	3	f
453	0	100	2	12	2020	2	f
411	0	90	23	18	2020	3	f
384	0	100	20	12	2020	2	f
428	0	80	25	20	2020	3	f
385	0	99.99	20	10	2020	2	f
430	0	90	25	18	2020	3	f
392	0	90	21	18	2020	3	f
412	0	100	23	12	2020	2	f
458	0	100	2	14	2020	2	f
461	0	100	27	9	2020	2	f
413	0	99.99	23	10	2020	2	f
389	0	100	21	9	2020	2	f
391	0	100	21	11	2020	2	f
427	0	100	25	9	2020	2	f
429	0	100	25	11	2020	2	f
593	0	0	29	1	2021	3	t
594	0	0	29	2	2021	3	t
595	0	0	29	9	2021	3	t
596	0	100	29	20	2021	3	t
597	0	0	29	11	2021	3	t
598	0	95	29	18	2021	3	t
599	0	0	29	3	2021	3	t
600	0	0	29	4	2021	3	t
601	0	0	29	12	2021	3	t
602	0	0	29	10	2021	3	t
603	0	0	29	27	2021	3	t
604	0	100	29	24	2021	3	t
605	0	0	29	26	2021	3	t
\.


--
-- Data for Name: activities_class_globalclassactivity; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.activities_class_globalclassactivity (id, name, location, type, details, due_date, start_time, end_time, subject_id, attended, "group", active) FROM stdin;
3249	Predavanja	357	0	Uvod u kolegij.\nZnanstveno istraživanje i pisanje znanstvenog članka i postera.	2021-10-06	10:00:00	11:30:00	20	f	\N	t
3250	Vježbe	357	1	Uvod u kolegij.\nZnanstveno istraživanje i pisanje znanstvenog članka i postera.	2021-10-06	12:00:00	13:30:00	20	f	\N	t
3251	Predavanja	online	0	Razvoj informacijske tehnologije.\n1. Rasprava na forumu – početak	2021-10-13	10:00:00	11:30:00	20	f	\N	t
3252	Vježbe	online	1	Razvoj informacijske tehnologije.\n1. Rasprava na forumu – početak	2021-10-13	12:00:00	13:30:00	20	f	\N	t
3253	Predavanja	online	0	Privatnost i nadziranje.\n2. Rasprava na forumu – početak	2021-10-20	10:00:00	11:30:00	20	f	\N	t
3254	Vježbe	online	1	Privatnost i nadziranje.\n2. Rasprava na forumu – početak	2021-10-20	12:00:00	13:30:00	20	f	\N	t
3255	Predavanja	online	0	Društvene mreže i masovni mediji.\n3. Rasprava na forumu – početak	2021-10-27	10:00:00	11:30:00	20	f	\N	t
3256	Vježbe	online	1	Društvene mreže i masovni mediji.\n3. Rasprava na forumu – početak	2021-10-27	12:00:00	13:30:00	20	f	\N	t
3257	Predavanja	online	0	Otvoreni kod. Otvoreni svijet\n4. Rasprava na forumu – početak	2021-11-03	10:00:00	11:30:00	20	f	\N	t
3258	Vježbe	online	1	Otvoreni kod. Otvoreni svijet\n4. Rasprava na forumu – početak	2021-11-03	12:00:00	13:30:00	20	f	\N	t
3259	Predavanja	online	0	IKT i obrazovanje. IKT, poslovi i tržište rada. IKT i ekonomija.\n5. Rasprava na forumu – početak	2021-11-10	10:00:00	11:30:00	20	f	\N	t
3260	Vježbe	online	1	IKT i obrazovanje. IKT, poslovi i tržište rada. IKT i ekonomija.\n5. Rasprava na forumu – početak	2021-11-10	12:00:00	13:30:00	20	f	\N	t
3261	Predavanja	online	0	IKT i kultura. IKT i demokracija.\n6. Rasprava na forumu – početak	2021-11-17	10:00:00	11:30:00	20	f	\N	t
3262	Vježbe	online	1	IKT i kultura. IKT i demokracija.\n6. Rasprava na forumu – početak	2021-11-17	12:00:00	13:30:00	20	f	\N	t
3263	Predavanja	357	0	Izazovi, perspective, trendovi i budućnost.\nKraj svih rasprava na forumu.	2021-11-24	10:00:00	11:30:00	20	f	\N	t
3264	Vježbe	357	1	Izazovi, perspective, trendovi i budućnost.\nKraj svih rasprava na forumu.	2021-11-24	12:00:00	13:30:00	20	f	\N	t
3265	Predavanja	357	0	Startup. Inovacije. Ideja i tržište.\nLean startup metoda. Startup Canvas. Business Model Canvas. Lean Canvas.	2021-12-01	10:00:00	11:30:00	20	f	\N	t
3266	Vježbe	357	1	Startup. Inovacije. Ideja i tržište.\nLean startup metoda. Startup Canvas. Business Model Canvas. Lean Canvas.	2021-12-01	12:00:00	13:30:00	20	f	\N	t
3267	Predavanja	357	0	Startup kapital i financiranje. Startup pitch. Monetizacija poslovne ideje i proizvoda.\nStartup financijski plan.	2021-12-08	10:00:00	11:30:00	20	f	\N	t
3268	Vježbe	357	1	Startup kapital i financiranje. Startup pitch. Monetizacija poslovne ideje i proizvoda.\nStartup financijski plan.	2021-12-08	12:00:00	13:30:00	20	f	\N	t
3269	Predavanja	357	0	Upravljanje startup-om, održavanje i razvoj.\nStartup poslovni plan.	2021-12-15	10:00:00	11:30:00	20	f	\N	t
3270	Vježbe	357	1	Upravljanje startup-om, održavanje i razvoj.\nStartup poslovni plan.	2021-12-15	12:00:00	13:30:00	20	f	\N	t
3271	Predavanja	357	0	Priprema startup prijave/nacrta  - konzultacije	2021-12-22	10:00:00	11:30:00	20	f	\N	t
3272	Vježbe	357	1	Priprema startup prijave/nacrta  - konzultacije	2021-12-22	12:00:00	13:30:00	20	f	\N	t
3273	Predavanja	357	0	Priprema startup prijave/nacrta  - konzultacije	2022-01-12	10:00:00	11:30:00	20	f	\N	t
3274	Vježbe	357	1	Priprema startup prijave/nacrta  - konzultacije	2022-01-12	10:00:00	11:30:00	20	f	\N	t
3275	Predavanja	357	0	Predaja i prezentacija startup prijave/nacrta	2022-01-19	10:00:00	11:30:00	20	f	\N	t
3276	Vježbe	357	1	Predaja i prezentacija startup prijave/nacrta	2022-01-19	10:00:00	11:30:00	20	f	\N	t
3277	Predavanja	357	0	Izrada seminarskog (završnog) rada - konzultacije	2022-01-26	10:00:00	11:30:00	20	f	\N	t
3278	Vježbe	357	1	Izrada seminarskog (završnog) rada - konzultacije	2022-01-26	10:00:00	11:30:00	20	f	\N	t
3279	Vježbe	O-357	1	Uvod – pravila igre	2021-10-04	10:00:00	11:30:00	18	f	\N	t
3280	Predavanja	O-357	0	Uvod – pravila igre	2021-10-04	10:00:00	11:30:00	18	f	\N	t
3281	Vježbe	O-350	1	Osnove teorije igara – simultane igre	2021-10-11	08:30:00	10:30:00	18	f	\N	t
3282	Predavanja	O-357	0	Osnove menadžmenta	2021-10-11	10:00:00	11:30:00	18	f	\N	t
3283	Vježbe	O-350	1	Osnove teorije igara – sekvencijalne igre	2021-10-18	08:30:00	10:30:00	18	f	\N	t
3284	Predavanja	O-357	0	Teorije menadžmenta	2021-10-18	10:00:00	11:30:00	18	f	\N	t
3285	Vježbe	O-350	1	Zadaća iz teorije igara	2021-10-25	08:30:00	10:30:00	18	f	\N	t
3286	Predavanja	O-357	0	Strateški menadžment	2021-10-25	10:00:00	11:30:00	18	f	\N	t
3287	Vježbe	O-350	1	Strateški plan	2021-11-08	08:30:00	10:30:00	18	f	\N	t
3288	Predavanja	O-357	0	Krizni menadžment i upravljanje ljudskim potencijalima	2021-11-08	10:00:00	11:30:00	18	f	\N	t
3289	Vježbe	O-357	1	KOLOKVIJ	2021-11-15	10:00:00	11:30:00	18	f	\N	t
3290	Vježbe	O-350	1	ERP sustavi – Upravljanje artiklima i proces naručivanja robe	2021-11-22	08:30:00	10:30:00	18	f	\N	t
3291	Predavanja	online	0	Uvod u ERP sustave	2021-11-22	08:30:00	10:30:00	18	f	\N	t
3292	Vježbe	O-350	1	ERP sustavi – Kreiranje ulaznih faktura te plaćanje faktura dobavljaču	2021-11-29	08:30:00	10:30:00	18	f	\N	t
3293	Predavanja	online	0	Implementacija ERP sustava	2021-11-29	08:30:00	10:30:00	18	f	\N	t
3294	Vježbe	O-350	1	ERP sustavi – Upravljanje financijama	2021-12-06	08:30:00	10:30:00	18	f	\N	t
3295	Predavanja	online	0	Metodike implementacije ERP sustava	2021-12-06	08:30:00	10:30:00	18	f	\N	t
3296	Vježbe	O-350	1	Rad u virtualnom poduzeću	2021-12-13	08:30:00	10:30:00	18	f	\N	t
3297	Predavanja	online	0	Uvod u upravljanje odnosima s klijentima	2021-12-13	08:30:00	10:30:00	18	f	\N	t
3298	Vježbe	O-350	1	Procjena CRM elemenata	2021-12-20	08:30:00	10:30:00	18	f	\N	t
3299	Predavanja	online	0	Informacijski sustav CRM-a	2021-12-20	08:30:00	10:30:00	18	f	\N	t
3300	Vježbe	O-350	1	Alati za upravljanje odnosima s klijentima	2022-01-10	08:30:00	10:30:00	18	f	\N	t
3301	Predavanja	online	0	Primjeri korištenja CRM-a u praksi	2022-01-10	08:30:00	10:30:00	18	f	\N	t
3302	Vježbe	O-350	1	Prezentacija virtualnog poduzeća	2022-01-17	08:30:00	10:30:00	18	f	\N	t
3303	Predavanja	O-357	0	Prezentacija virtualnog poduzeća	2022-01-17	10:00:00	11:30:00	18	f	\N	t
3304	Vježbe	O-350	1	Evaluacija kolegija	2022-01-24	08:30:00	10:30:00	18	f	\N	t
3305	Predavanja	O-357	0	Konzultacije za završni ispit	2022-01-24	10:00:00	11:30:00	18	f	\N	t
3306	Predavanja	359	0	Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Uvod.	2021-10-08	08:15:00	09:45:00	22	f	\N	t
3307	Vježbe	359	1	Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Uvod.	2021-10-08	10:00:00	11:30:00	22	f	\N	t
3308	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-10-15	08:15:00	09:45:00	22	f	\N	t
3309	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-10-15	10:00:00	11:30:00	22	f	\N	t
3310	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-10-22	08:15:00	09:45:00	22	f	\N	t
3311	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-10-22	10:00:00	11:30:00	22	f	\N	t
3312	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-10-29	08:15:00	09:45:00	22	f	\N	t
3313	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-10-29	10:00:00	11:30:00	22	f	\N	t
3314	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-11-05	08:15:00	09:45:00	22	f	\N	t
3315	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-11-05	10:00:00	11:30:00	22	f	\N	t
3316	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-11-12	08:15:00	09:45:00	22	f	\N	t
3317	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-11-12	10:00:00	11:30:00	22	f	\N	t
3318	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-11-19	08:15:00	09:45:00	22	f	\N	t
3319	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-11-19	10:00:00	11:30:00	22	f	\N	t
3320	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-11-26	08:15:00	09:45:00	22	f	\N	t
3321	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-11-26	10:00:00	11:30:00	22	f	\N	t
3322	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-12-03	08:15:00	09:45:00	22	f	\N	t
3323	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-12-03	10:00:00	11:30:00	22	f	\N	t
3324	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-12-10	08:15:00	09:45:00	22	f	\N	t
3325	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-12-10	10:00:00	11:30:00	22	f	\N	t
3326	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-12-17	08:15:00	09:45:00	22	f	\N	t
3327	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-12-17	10:00:00	11:30:00	22	f	\N	t
3328	Predavanja	online: nadoknada za 24.12.	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-12-18	08:15:00	09:45:00	22	f	\N	t
3329	Vježbe	online: nadoknada za 24.12.	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-12-18	10:00:00	11:30:00	22	f	\N	t
3330	Predavanja	359	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2022-01-14	08:15:00	09:45:00	22	f	\N	t
3331	Vježbe	359	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2022-01-14	10:00:00	11:30:00	22	f	\N	t
3332	Predavanja	359	0	Prezentacije projekata	2022-01-21	08:15:00	09:45:00	22	f	\N	t
3333	Vježbe	359	1	Prezentacije projekata	2022-01-21	10:00:00	11:30:00	22	f	\N	t
3334	Predavanja	359	0	Prezentacije projekata (nadoknada termina)	2022-01-28	08:15:00	09:45:00	22	f	\N	t
3335	Vježbe	359	1	Prezentacije projekata  (nadoknada termina)	2022-01-28	10:00:00	11:30:00	22	f	\N	t
3336	Predavanja	online	0	Uvod	2021-10-05	14:00:00	15:30:00	19	f	\N	t
3337	Predavanja	online	0	Metodologija razvoja IS	2021-10-05	16:00:00	17:30:00	19	f	\N	t
3338	Predavanja	365	0	Specifičnosti IT projekata	2021-10-12	14:00:00	15:30:00	19	f	\N	t
3339	Predavanja	365	0	Životni ciklus projekta	2021-10-12	16:00:00	17:30:00	19	f	\N	t
3340	Predavanja	365	0	Definiranje projekta	2021-10-19	14:00:00	15:30:00	19	f	\N	t
3341	Vježbe	365	1	Uvod u alat Project Libre	2021-10-19	16:00:00	17:30:00	19	f	\N	t
3342	Predavanja	365	0	Planiranje projekta	2021-10-26	14:00:00	15:30:00	19	f	\N	t
3343	Vježbe	365	1	Project Libre – kreiranje projekta 1/2	2021-10-26	16:00:00	17:30:00	19	f	\N	t
3344	Predavanja	365	0	Izvođenje projekta	2021-11-02	14:00:00	15:30:00	19	f	\N	t
3345	Vježbe	365	1	Project Libre – kreiranje projekta 2/2	2021-11-02	16:00:00	17:30:00	19	f	\N	t
3346	Predavanja	365	0	Evaluacija projekta	2021-11-09	14:00:00	15:30:00	19	f	\N	t
3347	Vježbe	365	1	Project Libre zadatak za bodove	2021-11-09	16:00:00	17:30:00	19	f	\N	t
3348	Predavanja	365	0	Evaluacija projekta	2021-11-16	14:00:00	15:30:00	19	f	\N	t
3349	Vježbe	365	1	Plan komunikacije + zadatak za bodove	2021-11-16	16:00:00	17:30:00	19	f	\N	t
3350	Predavanja	365	0	Vođenje i upravljanje projekta	2021-11-23	14:00:00	15:30:00	19	f	\N	t
3351	Vježbe	365	1	Git /Github + zadatak za bodove	2021-11-23	16:00:00	17:30:00	19	f	\N	t
3352	Predavanja	365	0	Timski rad	2021-11-30	14:00:00	15:30:00	19	f	\N	t
3353	Vježbe	365	1	Timski rad	2021-11-30	16:00:00	17:30:00	19	f	\N	t
3354	Predavanja	365	0	Upravljanje rizicima	2021-12-07	14:00:00	15:30:00	19	f	\N	t
3355	Vježbe	365	1	Upravljanje rizicima + zadatak za bodove Predaja projektnog zadatka	2021-12-07	16:00:00	17:30:00	19	f	\N	t
3356	Predavanja	365	0	Agilni PM i agilne metode	2021-12-14	14:00:00	15:30:00	19	f	\N	t
2209	Predavanja	028	0	1. Kolokvij	2020-11-25	10:00:00	12:00:00	50	f	\N	f
3357	Vježbe	365	1	Metode planiranja /Kanban + zadatak za bodove	2021-12-14	16:00:00	17:30:00	19	f	\N	t
3358	Predavanja	365	0	Motivacijske tehnike.	2021-12-21	14:00:00	15:30:00	19	f	\N	t
3359	Vježbe	365	1	Kreativne metode	2021-12-21	16:00:00	17:30:00	19	f	\N	t
3360	Predavanja	365	0	Poslovni model aplikacije	2021-01-11	14:00:00	15:30:00	19	f	\N	t
3361	Vježbe	365	1	Poslovni model aplikacije + zadatak za bodove\nPredaja projektnog seminara	2021-01-11	16:00:00	17:30:00	19	f	\N	t
3362	Predavanja	365	0	Upravljanje promjenama i kvalitetom	2021-01-18	14:00:00	15:30:00	19	f	\N	t
3363	Vježbe	365	1	Predstavljanje seminara	2021-01-18	16:00:00	17:30:00	19	f	\N	t
3364	Vježbe	365	1	Predstavljanje seminara - Nadoknada	2021-01-25	14:00:00	15:30:00	19	f	\N	t
3365	Vježbe	365	1	Predstavljanje seminara - Nadoknada	2021-01-25	16:00:00	17:30:00	19	f	\N	t
3366	Predavanja	365	0	Uvodno predavanje. Uvodna razmatranja. Motivacija.\nDefinicije i osnovni pojmovi. Perspektive upravljanja\nznanjem.	2021-10-05	08:15:00	09:45:00	24	f	\N	t
3367	Vježbe	365	1	Perspektive upravljanja znanjem,\nIT perspektiva.	2021-10-05	10:00:00	11:30:00	24	f	\N	t
3368	Predavanja	365	0	Definicija pojma znanje. Oblici znanja. Pretvorbe znanja.	2021-10-12	08:15:00	09:45:00	24	f	\N	t
3369	Vježbe	365	1	Pregled primjera pretvorbe znanja.	2021-10-12	10:00:00	11:30:00	24	f	\N	t
3370	Predavanja	online	0	Komponente upravljanja znanjem - rješenja i realizacija. Tehnologije upravljanja znanjem.	2021-10-19	08:15:00	09:45:00	24	f	\N	t
3371	Vježbe	online	1	Pregled tehnologija i alata za upravljanje znanjem. 1. DZ	2021-10-19	10:00:00	11:30:00	24	f	\N	t
3372	Predavanja	online	0	Sustavi za upravljanje znanjem. Mehanizmi i tehnologije za upravljanje znanjem.	2021-10-26	08:15:00	09:45:00	24	f	\N	t
3373	Vježbe	online	1	Seminarski rad. Upute.	2021-10-26	10:00:00	11:30:00	24	f	\N	t
3374	Predavanja	365	0	1. kolokvij iz teorije	2021-11-02	08:15:00	09:45:00	24	f	\N	t
3375	Vježbe	365	1	Primjeri projekata upravljanja znanjem	2021-11-02	10:00:00	11:30:00	24	f	\N	t
3376	Predavanja	365	0	Analiza (društvenih) mreža. Uvod. Globalna i lokalna analiza mreže.	2021-11-09	08:15:00	09:45:00	24	f	\N	t
3377	Vježbe	365	1	Predstavljanje alata za vizualizaciju i rad s mrežama: NetworkX\nFunkcije za izračunavanje mjera mreže.	2021-11-09	10:00:00	11:30:00	24	f	\N	t
3378	Predavanja	365	0	Mjere centralnosti.\nUloga mjera centralnosti u detektiranju širenja utjecaja.	2021-11-16	08:15:00	09:45:00	24	f	\N	t
3379	Vježbe	365	1	Analiza kompleksnih mreža primjenom funkcija iz paketa NetworkX\n2. DZ	2021-11-16	10:00:00	11:30:00	24	f	\N	t
3380	Predavanja	365	0	Pregled algoritama za detektiranje zajednica. Primjena algoritama za detektiranje zajednica u domeni upravljanja znanjem.\nAnaliza topologije mreže primjenom motifa i graphleta.	2021-11-23	08:15:00	09:45:00	24	f	\N	t
3381	Vježbe	365	1	Primjena alata Gephi: vizualizacija i analiza mreža.	2021-11-23	10:00:00	11:30:00	24	f	\N	t
3382	Predavanja	online	0	Predviđanje budućih poveznica u mreži.\nModeli mreža i praćenje rasta mreža.	2021-11-30	08:15:00	09:45:00	24	f	\N	t
3383	Vježbe	365	1	Zadavanje projektnih zadataka	2021-11-30	10:00:00	11:30:00	24	f	\N	t
3384	Predavanja	365	0	Projektni zadaci – Konzultacije	2021-12-07	08:15:00	09:45:00	24	f	\N	t
3385	Vježbe	365	1	Projektni zadaci – Konzultacije	2021-12-07	10:00:00	11:30:00	24	f	\N	t
3386	Predavanja	365	0	2. kolokvij iz teorijskog dijela	2021-12-14	08:15:00	09:45:00	24	f	\N	t
3387	Vježbe	online	1	Projektni zadaci - Konzultacije	2021-12-14	10:00:00	11:30:00	24	f	\N	t
3388	Predavanja	365	0	Prezentacije projektnih zadataka	2021-12-21	08:15:00	09:45:00	24	f	\N	t
3389	Vježbe	365	1	Semantičke tehnologije Definiranje pojma semantička sličnost	2021-12-21	10:00:00	11:30:00	24	f	\N	t
3390	Predavanja	365	0	Semantičke tehnologije. Predstavljanje znanja na webu	2021-01-11	08:15:00	09:45:00	24	f	\N	t
3391	Vježbe	365	1	Semantičke tehnologije. Predstavljanje znanja na webu	2021-01-11	10:00:00	11:30:00	24	f	\N	t
3392	Predavanja	365	0	Postupci određivanja semantičke sličnosti	2021-01-18	08:15:00	09:45:00	24	f	\N	t
3393	Vježbe	365	1	Uvod u ontologije. Inženjering ontologija.	2021-01-18	08:15:00	09:45:00	24	f	\N	t
3394	Predavanja	365	0	Primjena eksternih izvora znanja u mjerenju semantičke sličnosti.	2021-01-25	10:00:00	11:30:00	24	f	\N	t
3395	Vježbe	365	1	Ponavljanje i priprema za završni ispit	2021-01-25	08:15:00	09:45:00	24	f	\N	t
3396	Predavanja	365	0	Poslovni model aplikacije	2022-01-11	14:00:00	15:30:00	19	f	\N	t
3397	Vježbe	365	1	Poslovni model aplikacije + zadatak za bodove\nPredaja projektnog seminara	2022-01-11	16:00:00	17:30:00	19	f	\N	t
3398	Predavanja	365	0	Upravljanje promjenama i kvalitetom	2022-01-18	14:00:00	15:30:00	19	f	\N	t
3399	Vježbe	365	1	Predstavljanje seminara	2022-01-18	16:00:00	17:30:00	19	f	\N	t
3400	Vježbe	365	1	Predstavljanje seminara - Nadoknada	2022-01-25	14:00:00	15:30:00	19	f	\N	t
3401	Vježbe	365	1	Predstavljanje seminara - Nadoknada	2022-01-25	16:00:00	17:30:00	19	f	\N	t
2018	Predavanja	online	0	Izrada Android aplikacije. Case study.	2020-12-16	12:15:00	14:00:00	6	f	\N	f
2019	Vježbe	O-366	1	Android UI Design ( Graphics, View, Widgets)	2020-12-17	14:15:00	15:45:00	6	f	\N	f
2020	Predavanja	online	0	Android UI Design (Graphics, View, Widgets)	2020-12-23	12:15:00	14:00:00	6	f	\N	f
2021	Vježbe	O-366	1	Korištenje senzora, mapa, lokacije	2021-01-07	14:15:00	15:45:00	6	f	\N	f
2022	Predavanja	online	0	Korištenje senzora, mapa, lokacije	2021-01-13	12:15:00	14:00:00	6	f	\N	f
2023	Vježbe	online	1	Distribucija Android aplikacije	2021-01-14	14:15:00	15:45:00	6	f	\N	f
2024	Predavanja	O-S32	0	Projektni zadatak, Izrada Java (mobilne) aplikacije	2021-01-20	12:15:00	14:00:00	6	f	\N	f
2025	Vježbe	O-366	1	Izrada Android aplikacije	2021-01-21	14:15:00	15:45:00	6	f	\N	f
2026	Predavanja	O-S32	0	Analiza projekata	2021-01-27	12:15:00	14:00:00	6	f	\N	f
2027	Predavanja	O-365	0	Uvod u predmet. Uvod u e-učenje	2020-10-05	08:30:00	10:00:00	7	f	\N	f
2028	Predavanja i vježbe	online	2	Mješovito učenje	2020-10-12	08:30:00	10:00:00	7	f	\N	f
2029	Predavanja i vježbe	online	2	Učenje na daljinu	2020-10-19	08:30:00	10:00:00	7	f	\N	f
2030	Predavanja i vježbe	online	2	MOOCPočetak wiki analize online tečaja	2020-10-26	08:30:00	10:00:00	7	f	\N	f
2031	Predavanja i vježbe	online	2	Primjena IKT za obrazovanje 1. dio	2020-11-09	08:30:00	10:00:00	7	f	\N	f
2032	Predavanja i vježbe	online	2	Primjena IKT za obrazovanje 2. dio	2020-11-16	08:30:00	10:00:00	7	f	\N	f
2033	Predavanja i vježbe	online	2	Pedagoški i psihološki aspekti e-obrazovanja	2020-11-30	08:30:00	10:00:00	7	f	\N	f
2034	Predavanja i vježbe	online	2	Vrednovanje u e-okruženju	2020-12-07	08:30:00	10:00:00	7	f	\N	f
2035	Predavanja i vježbe	online	2	Izrada e-tečaja prema ADDIE metodologiji	2020-12-21	08:30:00	10:00:00	7	f	\N	f
2036	Predavanja i vježbe	online	2	Moodle LMS Početak izrade e-tečaja	2021-01-11	08:30:00	10:00:00	7	f	\N	f
2037	Predavanja i vježbe	online	2	Nastavak izrade e-tečaja	2021-01-18	08:30:00	10:00:00	7	f	\N	f
2038	Predavanja i vježbe	online	2	Završetak izrade e-tečaja	2021-01-25	08:30:00	10:00:00	7	f	\N	f
2039	Predavanja	O-358	0	Uvod u ekonomiku i poduzetništvo	2020-10-06	14:15:00	16:00:00	8	f	\N	f
2040	Vježbe	O-359	1	Aktivnosti osnivanja poduzeća (formiranje grupa i rad po grupama)	2020-10-06	16:15:00	18:00:00	8	f	\N	f
2041	Predavanja	O-360	0	Poduzetništvo	2020-10-13	14:15:00	16:00:00	8	f	\N	f
2042	Vježbe	O-361	1	Aktivnosti osnivanja poduzeća(po grupama)	2020-10-13	16:15:00	18:00:00	8	f	\N	f
2043	Predavanja	online	0	Poduzetništvo i poduzetnik	2020-10-20	14:15:00	16:00:00	8	f	\N	f
2044	Vježbe	online	1	Aktivnosti osnivanja poduzeća(po grupama)	2020-10-20	16:15:00	18:00:00	8	f	\N	f
2045	Predavanja	O-358	0	Temeljne institucije za razvoj poduzetništva	2020-10-27	14:15:00	16:00:00	8	f	\N	f
2046	Vježbe	O-358	1	Aktivnosti osnivanja poduzeća (po grupama)	2020-10-27	16:15:00	18:00:00	8	f	\N	f
2047	Predavanja	online	0	Inovativnost i poduzetništvo	2020-11-03	14:15:00	16:00:00	8	f	\N	f
2048	Vježbe	online	1	Aktivnosti osnivanja poduzeća (po grupama)	2020-11-03	16:15:00	18:00:00	8	f	\N	f
2049	Predavanja	O-358	0	Upravljanje u poduzeću.	2020-11-10	14:15:00	16:00:00	8	f	\N	f
2050	Vježbe	O-358	1	Aktivnosti osnivanja poduzeća(po grupama)	2020-11-10	16:15:00	18:00:00	8	f	\N	f
2051	Vježbe	O-358	1	Aktivnosti osnivanja poduzeća(po grupama)	2020-11-17	16:15:00	18:00:00	8	f	\N	f
2052	Predavanja	online	0	Poduzetničke mogućnosti	2020-11-24	14:15:00	16:00:00	8	f	\N	f
2053	Predavanja	O-358	0	Poduzetničke mogućnosti	2020-12-01	14:15:00	16:00:00	8	f	\N	f
2054	Vježbe	O-358	1	Aktivnosti osnivanja obrta(po grupama)	2020-12-01	16:15:00	18:00:00	8	f	\N	f
2055	Predavanja	online	0	Poslovanje malog poduzeća	2020-12-08	14:15:00	16:00:00	8	f	\N	f
2056	Vježbe	online	1	Aktivnosti osnivanja obrta(po grupama)	2020-12-08	16:15:00	18:00:00	8	f	\N	f
2057	Predavanja	O-358	0	Poslovanje malog poduzeća	2020-12-15	14:15:00	16:00:00	8	f	\N	f
2058	Vježbe	O-358	1	Aktivnosti osnivanja obrta (po grupama)	2020-12-15	16:15:00	18:00:00	8	f	\N	f
2059	Predavanja	online	0	Poslovanje malog poduzeća	2020-12-22	14:15:00	16:00:00	8	f	\N	f
2060	Vježbe	online	1	Zatvaranje malog poduzeća	2020-12-22	16:15:00	18:00:00	8	f	\N	f
2061	Vježbe	O-358	1	Zatvaranje obrta. Predaja seminara o osnovanom obrtu.	2021-01-12	16:15:00	18:00:00	8	f	\N	f
2062	Predavanja	online	0	Projekti u poduzeću.	2021-01-19	14:15:00	16:00:00	8	f	\N	f
2063	Vježbe	online	1	Prezentacija seminarskih radova (po grupama)	2021-01-19	16:15:00	18:00:00	8	f	\N	f
2064	Predavanja	O-358	0	Projekti u poduzeću II.	2021-01-26	14:15:00	16:00:00	8	f	\N	f
2065	Vježbe	O-358	1	Prezentacija seminarskih radova (po grupama)	2021-01-26	16:15:00	18:00:00	8	f	\N	f
2066	Predavanja	028	0	Uvod - pravila igre	2020-10-05	08:00:00	10:00:00	46	f	\N	f
2067	Vježbe	028	1	Uvod - pravila igre	2020-10-05	08:00:00	10:00:00	46	f	\N	f
2068	Predavanja	online	0	Uvod u baze podataka / osnovni pojmovi	2020-10-12	08:00:00	10:00:00	46	f	\N	f
2069	Vježbe	350	1	Uvod u SQL (+ tjedna samoprovjera)	2020-10-15	08:00:00	14:00:00	46	f	\N	f
2070	Predavanja	online	0	Vrste podataka i pohrane	2020-10-19	08:00:00	10:00:00	46	f	\N	f
2071	Vježbe	online	1	Ograničenja i uloge (+ tjedna samoprovjera)	2020-10-22	08:00:00	14:00:00	46	f	\N	f
2072	Predavanja	028	0	Relacijski model podataka	2020-10-26	08:00:00	10:00:00	46	f	\N	f
2073	Vježbe	350	1	Upiti nad jednom tablicom (+ tjedna samoprovjera)	2020-10-29	08:00:00	14:00:00	46	f	\N	f
2074	Predavanja	online	0	Relacijska algebra- 1. dio	2020-11-02	08:00:00	10:00:00	46	f	\N	f
2075	Vježbe	350	1	Upiti nad jednom tablicom  - funkcije (+ tjedna samoprovjera)	2020-11-05	08:00:00	14:00:00	46	f	\N	f
2076	Predavanja	online	0	Relacijska algebra- 2. dio	2020-11-09	08:00:00	10:00:00	46	f	\N	f
2077	Vježbe	350	1	Konzultacije za SQL	2020-11-12	08:00:00	14:00:00	46	f	\N	f
2078	Predavanja	online	0	TEORIJSKA SAMOPROVJERA	2020-11-16	08:00:00	10:00:00	46	f	\N	f
2079	Vježbe	350	1	Složeni upiti - dinamička zamjena rezultata (podupiti) (+ tjedna samoprovjera)	2020-11-19	08:00:00	14:00:00	46	f	\N	f
2080	Predavanja	028	0	Metoda entiteti-veze	2020-11-23	08:00:00	10:00:00	46	f	\N	f
2081	Vježbe	350	1	Složeni upiti - join (+ tjedna samoprovjera)	2020-11-26	08:00:00	14:00:00	46	f	\N	f
2082	Vježbe	online	1	Struktura tipa stabla - SQL*Plus (+ tjedna samoprovjera)	2020-12-03	08:00:00	14:00:00	46	f	\N	f
2083	Vježbe	online	1	Formiranje izvješća (+ tjedna samoprovjera)	2020-12-10	08:00:00	14:00:00	46	f	\N	f
2084	Predavanja	028	0	Normalizacija - 1. dio	2020-12-14	08:00:00	10:00:00	46	f	\N	f
2085	Vježbe	online	1	Programsko rješenje temeljeno na relacijskoj bazi podataka	2020-12-17	08:00:00	14:00:00	46	f	\N	f
2086	Predavanja	online	0	Normalizacija - 2. dio	2020-12-21	08:00:00	10:00:00	46	f	\N	f
2087	Vježbe		1		2020-12-24	08:00:00	13:30:00	46	f	\N	f
2088	Predavanja		0		2021-01-04	08:30:00	10:00:00	46	f	\N	f
2089	Vježbe	350	1	Konzultacije za praktični rad	2021-01-07	08:00:00	14:00:00	46	f	\N	f
2090	Predavanja	online	0	Osnove fizičke organizacije BP	2021-01-11	08:00:00	10:00:00	46	f	\N	f
2091	Vježbe	350	1	Konzultacije za praktični rad	2021-01-14	08:00:00	14:00:00	46	f	\N	f
2092	Predavanja	028	0	Konzultacije za završni ispit	2021-01-18	08:00:00	10:00:00	46	f	\N	f
2093	Vježbe	online	1	Predaja praktičnog rada	2021-01-21	08:00:00	14:00:00	46	f	\N	f
2094	Predavanja	028	0	Konzultacije za završni ispit	2021-01-25	08:00:00	10:00:00	46	f	\N	f
2095	Vježbe	350	1	Uvid u praktični rad	2021-01-28	08:00:00	14:00:00	46	f	\N	f
2096	Predavanja	O-028	0	Uvodno predavanje	2020-10-05	00:00:00	23:59:00	47	f	\N	f
2097	Vježbe	O-366	1	Uvod u Clarion, izrada modela, kreiranje rječnika	2020-10-06	00:00:00	23:59:00	47	f	\N	f
2098	Predavanja	O-028	0	Osnovni pojmovi u programskom inženjerstvu	2020-10-12	00:00:00	23:59:00	47	f	\N	f
2099	Vježbe	O-366	1	Izrada rječnika	2020-10-13	00:00:00	23:59:00	47	f	\N	f
2100	Predavanja	Online	0	Kriteriji za procjenu kvalitete softvera	2020-10-19	00:00:00	23:59:00	47	f	\N	f
2101	Vježbe	O-366	1	Izrada aplikacije, Browse i Form	2020-10-20	00:00:00	23:59:00	47	f	\N	f
2102	Predavanja	O-028	0	Modeli softverskog procesa	2020-10-26	00:00:00	23:59:00	47	f	\N	f
2103	Vježbe	O-366	1	Izrada aplikacije, Browse i Form	2020-10-27	00:00:00	23:59:00	47	f	\N	f
2104	Predavanja	O-028	0	Modeli softverskog procesa	2020-11-02	00:00:00	23:59:00	47	f	\N	f
2105	Vježbe	O-366	1	Izrada izvještaja	2020-11-03	00:00:00	23:59:00	47	f	\N	f
2106	Predavanja	Online	0	Kviz za samoprovjeru	2020-11-09	00:00:00	23:59:00	47	f	\N	f
2107	Vježbe	O-366	1	Programski kod u Clarionu (unos podatka, ispis)	2020-11-10	00:00:00	23:59:00	47	f	\N	f
2296	Vježbe	366	1	DRUGI KOLOKVIJ	2021-01-26	10:15:00	11:45:00	52	f	G2	f
2108	Predavanja	Online	0	Analiza i definicija	2020-11-16	00:00:00	23:59:00	47	f	\N	f
2109	Vježbe	O-366	1	Programski kod u Clarionu (IF, Loop)	2020-11-17	00:00:00	23:59:00	47	f	\N	f
2110	Predavanja	Online	0	Dizajn softvera	2020-11-23	00:00:00	23:59:00	47	f	\N	f
2111	Vježbe	O-366	1	Programski kod u Clarionu (Niz, matrice)	2020-11-24	00:00:00	23:59:00	47	f	\N	f
2112	Predavanja	Online	0	Implementacija	2020-11-30	00:00:00	23:59:00	47	f	\N	f
2113	Vježbe	O-366	1	Programski kod u Clarionu (CASE OF, hide, unhide, enable, disable, group)	2020-12-01	00:00:00	23:59:00	47	f	\N	f
2114	Predavanja	Online	0	Implementacija	2020-12-07	00:00:00	23:59:00	47	f	\N	f
2115	Vježbe	O-366	1	Programski kod u Clarionu (Stringovi i zadaci sa stringovima)	2020-12-08	00:00:00	23:59:00	47	f	\N	f
2116	Predavanja	Online	0	Testiranje softvera. Funkcionalno testiranje softvera	2020-12-14	00:00:00	23:59:00	47	f	\N	f
2117	Vježbe	O-366	1	Projektni zadatak	2020-12-15	00:00:00	23:59:00	47	f	\N	f
2118	Predavanja	Online	0	Strukturno testiranje softvera	2020-12-21	00:00:00	23:59:00	47	f	\N	f
2119	Vježbe	Online	1	Izrada projekta.	2020-12-22	00:00:00	23:59:00	47	f	\N	f
2120	Predavanja	Online	0	Kviz za samoprovjeru	2021-01-11	00:00:00	23:59:00	47	f	\N	f
2121	Vježbe	Online	1	Izrada projekta.	2021-01-12	00:00:00	23:59:00	47	f	\N	f
2122	Predavanja	O-028	0	Održavanje softvera	2021-01-18	00:00:00	23:59:00	47	f	\N	f
2123	Vježbe	O-366	1	Izrada projekta. Prezentacije projekata	2021-01-19	00:00:00	23:59:00	47	f	\N	f
2124	Predavanja	O-028	0	Analiza studentskih rezultata, konzultacije za završni ispit	2021-01-25	00:00:00	23:59:00	47	f	\N	f
2125	Vježbe	O-366	1	Prezentacije projekata	2021-01-26	00:00:00	23:59:00	47	f	\N	f
2126	Predavanja	O-028	0	Uvod u kolegij. Osnovna načela prebrojavanja.	2020-10-08	14:15:00	15:45:00	48	f	\N	f
2127	Vježbe	O-028	1	Ponavljanje.	2020-10-08	16:15:00	17:45:00	48	f	\N	f
2128	Predavanja	O-028	0	Permutacije skupova.	2020-10-15	14:15:00	15:45:00	48	f	\N	f
2129	Vježbe	O-028	1	Osnovna načela prebrojavanja. Permutacije skupova.	2020-10-15	16:15:00	17:45:00	48	f	\N	f
2130	Predavanja	O-028	0	Kombinacije skupova. Binomni koeficijent.	2020-10-22	14:15:00	15:45:00	48	f	\N	f
2131	Vježbe	O-028	1	Permutacije skupova. Kombinacije skupova.	2020-10-22	16:15:00	17:45:00	48	f	\N	f
2132	Predavanja	O-028	0	Binomni koeficijent.	2020-10-29	14:15:00	15:45:00	48	f	\N	f
2133	Vježbe	O-028	1	Kombinacije skupova.	2020-10-29	16:15:00	17:45:00	48	f	\N	f
2134	Predavanja	O-028	0	Formula uključivanja- isključivanja. Totalna zbrka.	2020-11-05	14:15:00	15:45:00	48	f	\N	f
2135	Vježbe	O-028	1	Kombinacije skupova. Binomni koeficijent.	2020-11-05	16:15:00	17:45:00	48	f	\N	f
2136	Predavanja	O-028	0	Dirichletovo načelo.	2020-11-12	14:15:00	15:45:00	48	f	\N	f
2137	Vježbe	O-028	1	Formula uključivanja- isključivanja.Totalna zbrka.	2020-11-12	16:15:00	17:45:00	48	f	\N	f
2138	Predavanja	O-028	0	Permutacije multiskupova. Kombinacije multiskupova.	2020-11-19	14:15:00	15:45:00	48	f	\N	f
2139	Vježbe	O-028	1	1. kolokvij	2020-11-19	16:15:00	17:45:00	48	f	\N	f
2140	Predavanja	O-028	0	Kombinacije multiskupova. Multinomni koeficijent.	2020-11-26	14:15:00	15:45:00	48	f	\N	f
2141	Vježbe	O-028	1	Dirichletovo načelo.	2020-11-26	16:15:00	17:45:00	48	f	\N	f
2142	Predavanja	O-028	0	Rekurzije.	2020-12-03	14:15:00	15:45:00	48	f	\N	f
2143	Vježbe	O-028	1	Permutacije multiskupova. Kombinacije multiskupova.	2020-12-03	16:15:00	17:45:00	48	f	\N	f
2144	Predavanja	O-028	0	Rekurzije.	2020-12-10	14:15:00	15:45:00	48	f	\N	f
2145	Vježbe	O-028	1	Kombinacije multiskupova. Multinomni koeficijent.	2020-12-10	16:15:00	17:45:00	48	f	\N	f
2146	Predavanja	O-028	0	Funkcije izvodnice.	2020-12-17	14:15:00	15:45:00	48	f	\N	f
2147	Vježbe	O-028	1	Rekurzivne relacije.	2020-12-17	16:15:00	17:45:00	48	f	\N	f
2148	Predavanja	O-028	0	Ramseyev teorem	2021-01-07	14:15:00	15:45:00	48	f	\N	f
2149	Vježbe	O-028	1	Rekurzivne relacije. Funkcije izvodnice.	2021-01-07	16:15:00	17:45:00	48	f	\N	f
2150	Predavanja	O-028	0	Ramseyev teorem	2021-01-14	14:15:00	15:45:00	48	f	\N	f
2151	Vježbe	O-028	1	Funkcije izvodnice.	2021-01-14	16:15:00	17:45:00	48	f	\N	f
2152	Predavanja	O-028	0	Incidencijske strukture.	2021-01-21	14:15:00	15:45:00	48	f	\N	f
2153	Vježbe	O-028	1	2. kolokvij	2021-01-21	16:15:00	17:45:00	48	f	\N	f
2154	Predavanja	O-028	0	Popravne aktivnosti	2021-01-28	14:15:00	15:45:00	48	f	\N	f
2155	Vježbe	O-028	1	Ramseyev teorem	2021-01-28	16:15:00	17:45:00	48	f	\N	f
2156	Predavanja	S-32	0	Uvod u kolegij, integrirano razvojno okruženje, softverski razvojni okvir	2020-10-06	12:15:00	13:45:00	49	f		f
2157	Vježbe	Online	1	Postavljanje alata za razvoj aplikacija (IDE). Postavljanje razvojnog okruženja za razvoj frontend dijela aplikacije	2020-10-12	12:15:00	15:45:00	49	f		f
2158	Predavanja	S-32	0	Osnovi koncepti: klijent- poslužitelj model, višeslojna arhitektura na webu, web poslužitelj, cloud servisi	2020-10-13	12:15:00	13:45:00	49	f		f
2159	Vježbe	O-366	1	Postavljanje razvojnog okruženja u oblaku - baza podataka, web servis	2020-10-19	12:15:00	13:45:00	49	f	G1	f
2160	Vježbe	O-366	1	Postavljanje razvojnog okruženja u oblaku - baza podataka, web servis	2020-10-19	14:15:00	15:45:00	49	f	G2	f
2161	Predavanja	Online	0	REST API poslužitelj, poslužitelj baze podataka, poslužitelj za pohranu datoteka	2020-10-20	12:15:00	13:45:00	49	f		f
2162	Vježbe	O-366	1	Pohrana podataka i postavljanje web aplikacije (Hosting)	2020-10-26	12:15:00	13:45:00	49	f	G1	f
2163	Vježbe	O-366	1	Pohrana podataka i postavljanje web aplikacije (Hosting)	2020-10-26	14:15:00	15:45:00	49	f	G2	f
2164	Predavanja	Online	0	Sustavi za upravljanje verzijama	2020-10-27	12:15:00	13:45:00	49	f		f
2165	Vježbe	Online	1	Sustavi za upravljanje verzijama	2020-11-02	12:15:00	15:45:00	49	f		f
2166	Predavanja	S-32	0	Projektni zadatak 1	2020-11-03	12:15:00	13:45:00	49	f		f
2167	Vježbe	O-366	1	Projektni zadatak 1	2020-11-09	12:15:00	13:45:00	49	f	G1	f
2168	Vježbe	O-366	1	Projektni zadatak 1	2020-11-09	14:15:00	15:45:00	49	f	G2	f
2169	Predavanja	Online	0	Osnovni HTML elementi i atributi. Osnovni dijelovi CSS-a. Osnovni stilovi. Definiranje CSS stilova unutar elementa, dokumenta i u vanjskim datotekama.	2020-11-10	12:15:00	13:45:00	49	f		f
2170	Vježbe	O-366	1	Osnovni HTML elementi i atributi. Osnovni dijelovi CSS-a. Osnovni stilovi. Definiranje CSS stilova unutar elementa, dokumenta i u vanjskim datotekama.	2020-11-16	12:15:00	13:45:00	49	f	G1	f
2171	Vježbe	O-366	1	Osnovni HTML elementi i atributi. Osnovni dijelovi CSS-a. Osnovni stilovi. Definiranje CSS stilova unutar elementa, dokumenta i u vanjskim datotekama.	2020-11-16	14:15:00	15:45:00	49	f	G2	f
2172	Predavanja	Online	0	Događaji i JavaScript na Document Object Modelu HTML dokumenta. Osnovni koncepti JavaScripta (varijable, algoritamske strukture, funkcije, objekti, komponente).	2020-11-17	12:15:00	13:45:00	49	f		f
2173	Vježbe	O-366	1	Događaji i JavaScript na Document Object Modelu HTML dokumenta. Osnovni koncepti JavaScripta (varijable, algoritamske strukture, funkcije, objekti, komponente).	2020-11-23	12:15:00	13:45:00	49	f	G1	f
2174	Vježbe	O-366	1	Događaji i JavaScript na Document Object Modelu HTML dokumenta. Osnovni koncepti JavaScripta (varijable, algoritamske strukture, funkcije, objekti, komponente).	2020-11-23	14:15:00	15:45:00	49	f	G2	f
2175	Predavanja	Online	0	Osnovni koncepti razvojnog okvira Quasar. Izrada komponenti u Single File Components “.vue” dokumentu. Podjela na dijelove: Template, Script i Style.	2020-11-24	12:15:00	13:45:00	49	f		f
2176	Vježbe	O-366	1	Osnovni koncepti razvojnog okvira Quasar. Izrada komponenti u Single File Components “.vue” dokumentu. Podjela na dijelove: Template, Script i Style.	2020-11-30	12:15:00	13:45:00	49	f	G1	f
2177	Vježbe	O-366	1	Osnovni koncepti razvojnog okvira Quasar. Izrada komponenti u Single File Components “.vue” dokumentu. Podjela na dijelove: Template, Script i Style.	2020-11-30	14:15:00	15:45:00	49	f	G2	f
2178	Predavanja	Online	0	Korištenje grafičkih komponenti. Slaganje grafičkih komponenti. Uključivanje vanjskih paketa, slika i ikona.	2020-12-01	12:15:00	13:45:00	49	f		f
2179	Vježbe	O-366	1	Korištenje grafičkih komponenti. Slaganje grafičkih komponenti. Uključivanje vanjskih paketa, slika i ikona.	2020-12-07	12:15:00	13:45:00	49	f	G1	f
2180	Vježbe	O-366	1	Korištenje grafičkih komponenti. Slaganje grafičkih komponenti. Uključivanje vanjskih paketa, slika i ikona.	2020-12-07	14:15:00	15:45:00	49	f	G2	f
2181	Predavanja	S-32	0	Projektni zadatak 2	2020-12-08	12:15:00	13:45:00	49	f		f
2182	Vježbe	O-366	1	Kolokvij	2020-12-14	12:15:00	13:45:00	49	f	G1	f
2183	Vježbe	O-366	1	Kolokvij	2020-12-14	14:15:00	15:45:00	49	f	G2	f
2184	Predavanja	Online	0	Izrada aplikativne logike u Script dijelu Single File Components “.vue” i u JavaScript komponentama.	2020-12-15	12:15:00	13:45:00	49	f		f
2185	Vježbe	O-366	1	Izrada aplikativne logike u Script dijelu Single File Components “.vue” i u JavaScript komponentama.	2020-12-21	12:15:00	13:45:00	49	f	G1	f
2186	Vježbe	O-366	1	Izrada aplikativne logike u Script dijelu Single File Components “.vue” i u JavaScript komponentama.	2020-12-21	14:15:00	15:45:00	49	f	G2	f
2187	Predavanja	Online	0	Povezivanje podataka - data binding.	2020-12-22	12:15:00	13:45:00	49	f		f
2188	Vježbe	O-366	1	Povezivanje podataka - data binding.	2021-01-11	12:15:00	13:45:00	49	f	G1	f
2189	Vježbe	O-366	1	Povezivanje podataka - data binding.	2021-01-11	14:15:00	15:45:00	49	f	G2	f
2190	Predavanja	S-32	0	Projektni zadatak 3	2021-01-12	12:15:00	13:45:00	49	f		f
2191	Vježbe	O-366	1	Obrana seminara	2021-01-18	12:15:00	13:45:00	49	f	G1	f
2192	Vježbe	O-366	1	Obrana seminara	2021-01-18	14:15:00	15:45:00	49	f	G2	f
2193	Predavanja	S-32	0	Obrana seminara	2021-01-19	12:15:00	13:45:00	49	f		f
2194	Predavanja	S-32	0	Zaključna razmatranja, evaluacija kolegija	2021-01-26	12:15:00	13:45:00	49	f		f
2195	Predavanja	028	0	Uvod , opće informacije, Automati: DKA, NKA	2020-10-07	10:00:00	12:00:00	50	f	\N	f
2196	Predavanja	028	0	Automati NKA, pretvaranje NKA-DKA, minimizacija	2020-10-07	12:00:00	14:00:00	50	f	\N	f
2197	Predavanja	028	0	Automati: e-NKA, pretvaranje e-NKA-NKA	2020-10-14	10:00:00	12:00:00	50	f	\N	f
2198	Vježbe	028	1	Automati: Automati: DKA, NKA, pretvaranje NKA-DKA, minimizacija (rok 1DZ 21.10.2020.)	2020-10-14	12:00:00	14:00:00	50	f	\N	f
2199	Predavanja	028	0	Moore, Mealy, pretvaranje	2020-10-21	10:00:00	12:00:00	50	f	\N	f
2200	Vježbe	028	1	Automati: e-NKA, pretvaranje e-NKA-NKA	2020-10-21	12:00:00	14:00:00	50	f	\N	f
2201	Predavanja	028	0	Regularni izrazi, pretvaranje u e-NKA	2020-10-28	10:00:00	12:00:00	50	f	\N	f
2202	Vježbe	028	1	Moore, Mealy, pretvaranje, Regularni izrazi	2020-10-28	12:00:00	14:00:00	50	f	\N	f
2203	Predavanja	online	0	Regularne definicije, svojstvo napuhavanja	2020-11-04	10:00:00	11:30:00	50	f	\N	f
2204	Vježbe	028	1	Regularni izrazi, pretvaranje u e-NKA	2020-11-04	12:00:00	14:00:00	50	f	\N	f
2205	Predavanja	028	0	Gramatike, pojednostavljenje gramatika	2020-11-11	10:00:00	12:00:00	50	f	\N	f
2206	Vježbe	028	1	Svojstvo napuhavanja,  Gramatike, pojednostavljenje gramatika (rok 2DZ 18.11.2020.)	2020-11-11	12:00:00	14:00:00	50	f	\N	f
2207	Predavanja	online	0	CNO, GNO; Parseri	2020-11-20	13:00:00	15:00:00	50	f	\N	f
2208	Vježbe	online	1	CNO, GNO, Parseri	2020-11-20	15:00:00	17:00:00	50	f	\N	f
2210	Predavanja	028	0	Potisni automat	2020-12-02	10:00:00	12:00:00	50	f	\N	f
2211	Vježbe	028	1	Potisni automat	2020-12-02	12:00:00	14:00:00	50	f	\N	f
2212	Predavanja	028	0	Kontekstno neovisni jezici	2020-12-09	10:00:00	12:00:00	50	f	\N	f
2213	Vježbe	028	1	Potisni automati 2 (rok 3DZ 16.12.2020.)	2020-12-09	12:00:00	14:00:00	50	f	\N	f
2214	Predavanja	028	0	Turingov stroj, NLP	2020-12-16	10:00:00	12:00:00	50	f	\N	f
2215	Vježbe	028	1	Kontekstno neovisni jezici	2020-12-16	12:00:00	14:00:00	50	f	\N	f
2216	Predavanja	028	0	Turingov stroj 2	2020-12-23	10:00:00	12:00:00	50	f	\N	f
2217	Vježbe	028	1	Turingov stroj (rok 4DZ 20.01.2021.)	2020-12-23	12:00:00	14:00:00	50	f	\N	f
2218	Predavanja	028	0	Rekurzivno prebrojivi jezici, Chomskyeva hijerarhija jezika	2021-01-13	10:00:00	12:00:00	50	f	\N	f
2219	Vježbe	028	1	Rekurzivno prebrojivi jezici	2021-01-13	12:00:00	14:00:00	50	f	\N	f
2220	Predavanja	028	0	2. Kolokvij	2021-01-20	10:00:00	12:00:00	50	f	\N	f
2221	Predavanja	028	0	Prostorna i vremenska složenost	2021-01-27	10:00:00	12:00:00	50	f	\N	f
2222	Vježbe	028	1	Složenost	2021-01-27	12:00:00	14:00:00	50	f	\N	f
2223	Predavanja	S32	0	Uvodno predavanje	2020-10-09	10:00:00	11:30:00	51	f	\N	f
2224	Vježbe	S32	1	Prezentacija projekta	2020-10-09	10:30:00	12:00:00	51	f	\N	f
2225	Predavanja	S32	0	Osnovni koncepti	2020-10-16	10:00:00	11:30:00	51	f	\N	f
2226	Vježbe	S32	1	Osnovni koncepti	2020-10-16	10:30:00	12:00:00	51	f	\N	f
2227	Predavanja	Online	0	Korisnički zahtjevi	2020-10-23	10:00:00	11:30:00	51	f	\N	f
2228	Vježbe	Online	1	Dokumentiranje korisničkih zahtjeva	2020-10-23	10:30:00	12:00:00	51	f	\N	f
2229	Predavanja	Online	0	Uloga korisnika u razvoju sustava. Komunikacijski proces	2020-10-30	10:00:00	11:30:00	51	f	\N	f
2230	Vježbe	Online	1	Uloga korisnika u razvoju sustava. Komunikacijski proces	2020-10-30	10:30:00	12:00:00	51	f	\N	f
2231	Predavanja	S32	0	Projektni zadatak 1	2020-11-06	10:00:00	11:30:00	51	f	\N	f
2232	Vježbe	S32	1	Projektni zadatak 1	2020-11-06	10:30:00	12:00:00	51	f	\N	f
2233	Predavanja	S32	0	Analiza projektnog zadatka 1	2020-11-13	10:00:00	11:30:00	51	f	\N	f
2234	Vježbe	S32	1	Analiza projektnog zadatka 1	2020-11-13	10:30:00	12:00:00	51	f	\N	f
2235	Predavanja	Online	0	Izrada modela sustava	2020-11-20	10:00:00	11:30:00	51	f	\N	f
2236	Vježbe	Online	1	Izrada modela sustava	2020-11-20	10:30:00	12:00:00	51	f	\N	f
2237	Predavanja	S32	0	Projektni zadatak 2	2020-11-27	10:00:00	11:30:00	51	f	\N	f
2238	Vježbe	S32	1	Projektni zadatak 2	2020-11-27	10:30:00	12:00:00	51	f	\N	f
2239	Predavanja	S32	0	Analiza projektnog zadatka 2	2020-12-04	10:00:00	11:30:00	51	f	\N	f
2240	Vježbe	S32	1	Analiza projektnog zadatka 2	2020-12-04	10:30:00	12:00:00	51	f	\N	f
2241	Predavanja	Online	0	Primjeri, modeliranje	2020-12-11	10:00:00	11:30:00	51	f	\N	f
2242	Vježbe	Online	1	Primjeri, modeliranje	2020-12-11	10:30:00	12:00:00	51	f	\N	f
2243	Predavanja	S32	0	Izrada modela sustava	2020-12-18	10:00:00	11:30:00	51	f	\N	f
2244	Vježbe	S32	1	Izrada modela sustava	2020-12-18	10:30:00	12:00:00	51	f	\N	f
2245	Predavanja	S32	0	Projektni zadatak 3	2021-01-08	10:00:00	11:30:00	51	f	\N	f
2246	Vježbe	S32	1	Projektni zadatak 3	2021-01-08	10:30:00	12:00:00	51	f	\N	f
2247	Predavanja	S32	0	Analiza projektnog zadatka 3	2021-01-15	10:00:00	11:30:00	51	f	\N	f
2248	Vježbe	S32	1	Analiza projektnog zadatka 3	2021-01-15	10:30:00	12:00:00	51	f	\N	f
2249	Predavanja	Online	0	Validacija	2021-01-22	10:00:00	11:30:00	51	f	\N	f
2250	Vježbe	Online	1	Validacija	2021-01-22	10:30:00	12:00:00	51	f	\N	f
2251	Predavanja	Online	0	Validacija	2021-01-29	10:00:00	11:30:00	51	f	\N	f
2252	Vježbe	Online	1	Validacija	2021-01-29	10:30:00	12:00:00	51	f	\N	f
2253	Vježbe	366	1	Uvod u Python	2020-10-06	08:15:00	09:45:00	52	f	G1	f
2254	Vježbe	366	1	Uvod u Python	2020-10-06	10:15:00	11:45:00	52	f	G2	f
2255	Predavanja	S32	0	Uvod u Python	2020-10-06	14:15:00	15:45:00	52	f		f
2256	Vježbe	Online (Merlin/Jitsi)	1	Greške	2020-10-13	08:15:00	09:45:00	52	f	G1	f
2257	Vježbe	Online (Merlin/Jitsi)	1	Greške	2020-10-13	10:15:00	11:45:00	52	f	G2	f
2258	Predavanja	Online (Merlin/Jitsi)	0	Greške	2020-10-13	14:15:00	15:45:00	52	f		f
2259	Vježbe	366	1	Aproksimacija funkcije	2020-10-20	08:15:00	09:45:00	52	f	G1	f
2260	Vježbe	366	1	Aproksimacija funkcije	2020-10-20	10:15:00	11:45:00	52	f	G2	f
2261	Predavanja	S32	0	Aproksimacija funkcije	2020-10-20	14:15:00	15:45:00	52	f		f
2262	Vježbe	366	1	Lagrangeov polinom	2020-10-27	08:15:00	09:45:00	52	f	G1	f
2263	Vježbe	366	1	Lagrangeov polinom	2020-10-27	10:15:00	11:45:00	52	f	G2	f
2264	Predavanja	S32	0	Lagrangeov polinom	2020-10-27	14:15:00	15:45:00	52	f		f
2265	Vježbe	366	1	Newtonov polinom	2020-11-03	08:15:00	09:45:00	52	f	G1	f
2266	Vježbe	366	1	Newtonov polinom	2020-11-03	10:15:00	11:45:00	52	f	G2	f
2267	Predavanja	S32	0	Newtonov polinom	2020-11-03	14:15:00	15:45:00	52	f		f
2268	Vježbe	Online (Merlin/Jitsi)	1	Splajn	2020-11-10	08:15:00	09:45:00	52	f	G1	f
2269	Vježbe	Online (Merlin/Jitsi)	1	Splajn	2020-11-10	10:15:00	11:45:00	52	f	G2	f
2270	Predavanja	Online (Merlin/Jitsi)	0	Splajn	2020-11-10	14:15:00	15:45:00	52	f		f
2271	Vježbe	366	1	Regresija  +  domaća zadaća	2020-11-17	08:15:00	09:45:00	52	f	G1	f
2272	Vježbe	366	1	Regresija  +  domaća zadaća	2020-11-17	10:15:00	11:45:00	52	f	G2	f
2273	Predavanja	S32	0	Regresija + TEST	2020-11-17	14:15:00	15:45:00	52	f		f
2274	Vježbe	366	1	PRVI KOLOKVIJ	2020-11-24	08:15:00	09:45:00	52	f	G1	f
2275	Vježbe	366	1	PRVI KOLOKVIJ	2020-11-24	10:15:00	11:45:00	52	f	G2	f
2276	Predavanja	S32	0	PRVI KOLOKVIJ	2020-11-24	14:15:00	15:45:00	52	f		f
2277	Vježbe	366	1	Nelinearne jednadžbe. Bisekcija	2020-12-01	08:15:00	09:45:00	52	f	G1	f
2278	Vježbe	366	1	Nelinearne jednadžbe. Bisekcija	2020-12-01	10:15:00	11:45:00	52	f	G2	f
2279	Predavanja	S32	0	Nelinearne jednadžbe. Bisekcija	2020-12-01	14:15:00	15:45:00	52	f		f
2280	Vježbe	366	1	Newtonova metoda. Metoda sekante	2020-12-08	08:15:00	09:45:00	52	f	G1	f
2281	Vježbe	366	1	Newtonova metoda. Metoda sekante	2020-12-08	10:15:00	11:45:00	52	f	G2	f
2282	Predavanja	S32	0	Newtonova metoda. Metoda sekante	2020-12-08	14:15:00	15:45:00	52	f		f
2283	Vježbe	366	1	Numerička integracija. Simpsonova i trapezna formula	2020-12-15	08:15:00	09:45:00	52	f	G1	f
2284	Vježbe	366	1	Numerička integracija. Simpsonova i trapezna formula	2020-12-15	10:15:00	11:45:00	52	f	G2	f
2285	Predavanja	S32	0	Numerička integracija. Simpsonova i trapezna formula	2020-12-15	14:15:00	15:45:00	52	f		f
2286	Vježbe	Online (Merlin/Jitsi)	1	Newton-Cotesove formule	2020-12-22	08:15:00	09:45:00	52	f	G1	f
2287	Vježbe	Online (Merlin/Jitsi)	1	Newton-Cotesove formule	2020-12-22	10:15:00	11:45:00	52	f	G2	f
2288	Predavanja	Online (Merlin/Jitsi)	0	Newton-Cotesove formule	2020-12-22	14:15:00	15:45:00	52	f		f
2289	Vježbe	Online (Merlin/Jitsi)	1	ODJ	2021-01-12	08:15:00	09:45:00	52	f	G1	f
2290	Vježbe	Online (Merlin/Jitsi)	1	ODJ	2021-01-12	10:15:00	11:45:00	52	f	G2	f
2291	Predavanja	Online (Merlin/Jitsi)	0	ODJ	2021-01-12	14:15:00	15:45:00	52	f		f
2292	Vježbe	366	1	ODJ sustavi + domaća zadaća	2021-01-19	08:15:00	09:45:00	52	f	G1	f
2293	Vježbe	366	1	ODJ sustavi + domaća zadaća	2021-01-19	10:15:00	11:45:00	52	f	G2	f
2294	Predavanja	S32	0	ODJ sustavi + TEST	2021-01-19	14:15:00	15:45:00	52	f		f
2295	Vježbe	366	1	DRUGI KOLOKVIJ	2021-01-26	08:15:00	09:45:00	52	f	G1	f
2297	Predavanja	S32	0	DRUGI KOLOKVIJ	2021-01-26	14:15:00	15:45:00	52	f		f
2298	Vježbe	366	1	Popravne aktivnosti	2021-01-29	18:00:00	20:00:00	52	f		f
2299	Predavanja	online	0	Obveze pri vježbama,  Definiranje potrebnog predznanja, Software	2020-10-05	12:15:00	14:00:00	53	f		f
2300	Predavanja	S32	0	Uvod u predmet,  Objektni pristup	2020-10-08	12:15:00	14:00:00	53	f		f
2301	Vježbe	350	1	Objektni pristup,  Klase, Privatni atributi i metode, Poziv klase	2019-10-12	12:00:00	13:30:00	53	f	G1	f
2302	Vježbe	350	1	Objektni pristup,  Klase, Privatni atributi i metode, Poziv klase	2019-10-12	13:45:00	15:15:00	53	f	G2	f
2303	Predavanja	S32/online	0	Klase, Privatni atributi i metode, Poziv klase	2020-10-15	12:15:00	14:00:00	53	f		f
2304	Vježbe	350	1	Konstruktori, Destruktori, Preopterećivanje	2020-10-19	12:00:00	13:30:00	53	f	G1	f
2305	Vježbe	350	1	Konstruktori, Destruktori, Preopterećivanje	2020-10-19	13:45:00	15:15:00	53	f	G2	f
2306	Predavanja	S32/online	0	Konstruktori, Destruktori, Preopterećivanje	2020-10-22	12:00:00	13:30:00	53	f		f
2307	Vježbe	350	1	Niz klasa, Dinamička def. klasa, This, Složene klase.	2019-10-26	12:00:00	13:30:00	53	f	G1	f
2308	Vježbe	350	1	Niz klasa, Dinamička def. klasa, This, Složene klase.	2019-10-26	13:45:00	15:15:00	53	f	G2	f
2309	Predavanja	S32/online	0	Niz klasa, Dinamička def. klasa, This, Složene klase.	2020-10-29	12:15:00	14:00:00	53	f		f
2310	Vježbe	350/online	1	Predlošci i vektori, Copy konstruktor, Ref. na klasu	2020-11-02	12:00:00	15:30:00	53	f	G1	f
2311	Vježbe	350/online	1	Predlošci i vektori, Copy konstruktor, Ref. na klasu	2020-11-02	12:00:00	15:30:00	53	f	G2	f
2312	Predavanja	S32/online	0	Predlošci i vektori, Copy konstruktor, Ref. na klasu	2020-11-05	12:15:00	14:00:00	53	f		f
2313	Vježbe	350	1	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2020-11-09	12:00:00	13:30:00	53	f	G1	f
2314	Vježbe	350	1	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2020-11-09	13:45:00	15:15:00	53	f	G2	f
2315	Predavanja	S32/online	0	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2020-11-12	12:15:00	14:00:00	53	f		f
2316	Vježbe	350	1	Apstraktne klase, Polimorfizam, Virtualne klase	2020-11-16	12:00:00	13:30:00	53	f	G1	f
2317	Vježbe	350	1	Apstraktne klase, Polimorfizam, Virtualne klase	2020-11-16	13:45:00	15:15:00	53	f	G2	f
2318	Predavanja	S32/online	0	Apstraktne klase, Polimorfizam, Virtualne klase	2020-11-19	12:00:00	13:30:00	53	f		f
2319	Predavanja	350	0	Kolokvij	2020-11-23	12:00:00	13:30:00	53	f	G1	f
2320	Predavanja	350	0	Kolokvij	2020-11-23	13:45:00	15:15:00	53	f	G2	f
2321	Predavanja	S32/online	0	STL kontejneri. STL iteratori i algoritm	2020-11-26	12:15:00	14:00:00	53	f		f
2322	Vježbe	350/online	1	STL kontejneri. STL iteratori i algoritm	2020-11-30	12:00:00	15:30:00	53	f	G1	f
2323	Vježbe	350/online	1	STL kontejneri. STL iteratori i algoritm	2020-11-30	12:00:00	15:30:00	53	f	G2	f
2324	Predavanja	online	0	Case study	2020-12-03	12:15:00	14:00:00	53	f	G1	f
2325	Predavanja	350	0	Kviz	2020-12-07	12:00:00	13:30:00	53	f	G2	f
2326	Predavanja	350	0	Kviz	2020-12-07	13:45:00	15:15:00	53	f		f
2327	Predavanja	S32/online	0	Podešavanje performansa aplikacije. Upravljanje memorijom i pokazivači.	2020-12-10	12:15:00	14:00:00	53	f		f
2328	Vježbe	350	1	Unity - alat za izradu igara	2020-12-14	12:00:00	13:30:00	53	f	G1	f
2329	Vježbe	350	1	Unity - alat za izradu igara	2020-12-14	13:45:00	15:15:00	53	f	G2	f
2330	Predavanja	S32/online	0	Računalne igre.	2020-12-17	12:00:00	13:30:00	53	f		f
2331	Vježbe	350	1	Unity - stvaranje environment-a igre	2020-12-21	12:00:00	13:30:00	53	f	G1	f
2332	Vježbe	350	1	Unity - stvaranje environment-a igre	2020-12-21	13:45:00	15:15:00	53	f	G2	f
2333	Predavanja	S32/online	0	Razvoj računalnih igara.  Dizajn.	2021-01-07	12:15:00	14:00:00	53	f		f
2334	Vježbe	350	1	Primjena C# u Unity-ju. Input - kretanje lika	2021-01-11	12:00:00	13:30:00	53	f	G1	f
2335	Vježbe	350	1	Primjena C# u Unity-ju. Input - kretanje lika	2021-01-11	13:45:00	15:15:00	53	f	G2	f
2336	Predavanja	S32/online	0	Razvoj računalnih igara. Unity engine	2021-01-14	12:15:00	14:00:00	53	f		f
2337	Vježbe	350	1	Primjena mehanika igre	2021-01-18	12:00:00	13:30:00	53	f	G1	f
2338	Vježbe	350	1	Primjena mehanika igre	2021-01-18	13:45:00	15:15:00	53	f	G2	f
2339	Predavanja	S32/online	0	Praktikum, Definiranje projektnih zadataka	2021-01-21	12:15:00	14:00:00	53	f		f
2340	Vježbe	350/online	1	Uključivanje zvuka. GUI. Build igre	2021-01-25	12:00:00	15:30:00	53	f		f
2341	Predavanja	online	0	Predstavljanje i analiza projektnih zadataka	2021-01-28	12:00:00	13:30:00	53	f		f
2342	Predavanja	365	0	Uvod. Programski jezici i programske paradigme. Deklarativna i imperativna paradigma.	2020-10-07	08:15:00	09:45:00	54	f	\N	f
2343	Vježbe	365	1	Usporedba deklarativne i imperativne programske paradigme	2020-10-12	10:15:00	11:45:00	54	f	\N	f
2344	Predavanja	365	0	Uvod u funkcijske jezike. Funkcija. Funkcijsko programiranje. Kratki pregled povijesnog razvoja funkcijskih jezika. Primjeri programa	2020-10-14	08:15:00	09:45:00	54	f	\N	f
2345	Vježbe	365	1	Uvod u Haskell. Prevoditelji i interpreteri HUGS i GHC. Biblioteka. Prelude. Sintaksa i konvencije. Pisanje skripti u Haskelu. Primjeri programa. Vježba 1 - predaja riješenih zadataka	2020-10-19	10:15:00	11:45:00	54	f	\N	f
2346	Predavanja	online	0	Tipovi i klase podataka u Haskellu. Liste List comprehensions; Rekurzivne funkcije	2020-10-21	08:15:00	09:45:00	54	f	\N	f
2347	Vježbe	365	1	Tipovi podataka u Haskellu Liste. Definiranje funkcija. Uvjetni izrazi. Čuvari. Uzorci. Lambda izrazi. Vježba 2 - predaja riješenih zadataka	2020-10-26	10:15:00	11:45:00	54	f	\N	f
2348	Predavanja	365	0	Funkcije višeg reda.	2020-10-28	08:15:00	09:45:00	54	f	\N	f
2349	Vježbe	365	1	List comprehensions; Rekurzivne funkcije Vježba 3 - predaja riješenih zadataka	2020-11-02	10:15:00	11:45:00	54	f	\N	f
2350	Predavanja	365	0	1. Kolokvij - teorija	2020-11-04	08:15:00	09:45:00	54	f	\N	f
2351	Vježbe	365	1	Funkcije višeg reda.- zadaci. Vježba 4 - predaja riješenih zadataka	2020-11-09	10:15:00	11:45:00	54	f	\N	f
2352	Predavanja	online	0	Pregled primjene funkcijskog stila programiranja u drugim programskim jezicima.	2020-11-11	08:15:00	09:45:00	54	f	\N	f
2353	Vježbe	online	1	Funkcije višeg reda.- složeniji zadaci Vježba 5 - predaja riješenih zadataka	2020-11-16	10:15:00	11:45:00	54	f	\N	f
2354	Predavanja	online	0	Primjeri drugih funkcijskih jezika - usporedbe. Seminarski rad.	2020-11-18	08:15:00	09:45:00	54	f	\N	f
2355	Vježbe	online	1	Pisanje interaktivnih programa Vježba 6 - predaja riješenih zadataka	2020-11-23	10:15:00	11:45:00	54	f	\N	f
2356	Predavanja	online	0	Lambda račun. Teorija izračunljivosti.	2020-11-25	08:15:00	09:45:00	54	f	\N	f
2357	Vježbe	online	1	Rješavanje složenijih problemskih zadataka.	2020-11-30	10:15:00	11:45:00	54	f	\N	f
2358	Predavanja	online	0	Zadavanje projektnih zadataka	2020-12-02	08:15:00	09:45:00	54	f	\N	f
2359	Vježbe	online	1	Rad na projektnom zadatku	2020-12-07	10:15:00	11:45:00	54	f	\N	f
2360	Predavanja	365	0	2. Kolokvij - teorija	2020-12-09	08:15:00	09:45:00	54	f	\N	f
2361	Vježbe	online	1	Rad na projektnom zadatku	2020-12-14	10:15:00	11:45:00	54	f	\N	f
2362	Predavanja	online	0	Rad na projektnom zadatku	2020-12-16	08:15:00	09:45:00	54	f	\N	f
2363	Vježbe	365	1	1. Kolokvij - zadaci	2020-12-21	10:15:00	11:45:00	54	f	\N	f
2364	Predavanja	365	0	Prezentacije projektnih zadaka	2020-12-23	08:15:00	09:45:00	54	f	\N	f
2365	Vježbe	365	1	Prezentacije projektnih zadaka	2021-01-11	10:15:00	11:45:00	54	f	\N	f
2366	Predavanja	365	0	Uvod u logičko programiranje Predikatna logika. Osnovni elementi jezika. Sintaksa i semantika jezika Prolog. Definicije činjenica, pravila i upita: Pojam klauzule, hornova klauzula	2021-01-13	08:15:00	09:45:00	54	f	\N	f
2367	Vježbe	365	1	Uvod u Prolog. Pisanje prvog programa u Prologu. Termi u prologu. Klauzule, predikati, varijable Zapis činjenica, pravila i upita. Vježba 7 - predaja riješenih zadataka	2021-01-18	10:15:00	11:45:00	54	f	\N	f
2368	Predavanja	365	0	Postupak unifikacije. Supstitucija. Operatori i aritmetika u Prologu. Rekurzija.	2021-01-20	08:15:00	09:45:00	54	f	\N	f
2369	Vježbe	online	1	Ugrađeni predikati Aritmetičke i logičke operacije. Operator jednakosti. Liste Definiranje rekurzivnih pravila. Vježba 8 - predaja riješenih zadataka	2021-01-25	10:15:00	11:45:00	54	f	\N	f
2370	Predavanja	365	0	Pojam logičke posljedice. Zadovoljavanje cilja (pronalaženje odgovora na upite), unifikacija, rezolucija u Prologu. Ulančavanje unatrag (backtracking). Redoslijed klauzula.	2021-01-27	08:15:00	09:45:00	54	f	\N	f
2371	Predavanja	O-358	0	Uvodno predavanje.	2020-10-08	10:15:00	11:45:00	1	f	\N	f
2372	Vježbe	O-359	1	Uvod u vješbe kolegija.	2020-10-08	12:15:00	13:45:00	1	f	\N	f
2373	Predavanja	O-358	0	Osnovni pojmovi elektroničkog gospodarstva.	2020-10-15	10:15:00	11:45:00	1	f	\N	f
2374	Vježbe	online	1	Living Labs pristup IKT inovacijama i razvoju.	2020-10-15	12:15:00	13:45:00	1	f	\N	f
2375	Predavanja	O-358	0	E-tršište.	2020-10-22	10:15:00	11:45:00	1	f	\N	f
2376	Vježbe	online	1	Analiza odabranog primjera Living Lab-a.	2020-10-22	12:15:00	13:45:00	1	f	\N	f
2377	Predavanja	O-358	0	Poslovni modeli.	2020-10-29	10:15:00	11:45:00	1	f	\N	f
2378	Vježbe	online	1	Osnove pristupa design thinking.	2020-10-29	12:15:00	13:45:00	1	f	\N	f
2379	Predavanja	O-358	0	Ponašanje potrošača.	2020-11-05	10:15:00	11:45:00	1	f	\N	f
2380	Vježbe	O-359	1	Metode pristupa design thinking (1).	2020-11-05	12:15:00	13:45:00	1	f	\N	f
2381	Predavanja	O-358	0	Provjere znanja.	2020-11-12	10:15:00	11:45:00	1	f	\N	f
2382	Vježbe	O-359	1	Metode pristupa design thinking (2).	2020-11-12	12:15:00	13:45:00	1	f	\N	f
2383	Predavanja	O-358	0	Internet maloprodaja.	2020-11-19	10:15:00	11:45:00	1	f	\N	f
2384	Vježbe	O-359	1	Rad na projektnom zadatku.	2020-11-19	12:15:00	13:45:00	1	f	\N	f
2385	Predavanja	O-358	0	Online zajednice.	2020-11-26	10:15:00	11:45:00	1	f	\N	f
2386	Vježbe	online	1	Rad na projektnom zadatku.	2020-11-26	12:15:00	13:45:00	1	f	\N	f
2387	Predavanja	O-358	0	B2B poslovanje.	2020-12-03	10:15:00	11:45:00	1	f	\N	f
2388	Vježbe	online	1	Rad na projektnom zadatku.	2020-12-03	12:15:00	13:45:00	1	f	\N	f
2389	Predavanja	O-358	0	e-Uprava.	2020-12-10	10:15:00	11:45:00	1	f	\N	f
2390	Vježbe	online	1	Rad na projektnom zadatku.	2020-12-10	12:15:00	13:45:00	1	f	\N	f
2391	Predavanja	O-358	0	e-Učenje.	2020-12-17	10:15:00	11:45:00	1	f	\N	f
2392	Vježbe	online	1	Rad na projektnom zadatku.	2020-12-17	12:15:00	13:45:00	1	f	\N	f
2393	Predavanja	O-358	0	Sigurnosne tehnologije.	2021-01-07	10:15:00	11:45:00	1	f	\N	f
2394	Vježbe	online	1	Rad na projektnom zadatku.	2021-01-07	12:15:00	13:45:00	1	f	\N	f
2395	Predavanja	O-358	0	Plaćanje.	2021-01-14	10:15:00	11:45:00	1	f	\N	f
2396	Vježbe	online	1	Rad na projektnom zadatku.	2021-01-14	12:15:00	13:45:00	1	f	\N	f
2397	Predavanja	O-358	0	Pravni, etički i društveni utjecaji.	2021-01-21	10:15:00	11:45:00	1	f	\N	f
2398	Vježbe	O-359	1	Prezentacija projektnog zadatka.	2021-01-21	12:15:00	13:45:00	1	f	\N	f
2399	Predavanja	O-358	0	Provjere znanja.	2021-01-28	10:15:00	11:45:00	1	f	\N	f
2400	Vježbe	O-359	1	Prezentacija projektnog zadatka.	2021-01-28	12:15:00	13:45:00	1	f	\N	f
2401	Vježbe	O-357	1	Uvod - pravila igre	2020-10-05	10:00:00	11:30:00	18	f	\N	f
2402	Predavanja	O-357	0	Uvod - pravila igre	2020-10-05	10:00:00	11:30:00	18	f	\N	f
2403	Vježbe	online	1	Osnove teorije igara - simultane igre	2020-10-12	08:00:00	09:30:00	18	f	\N	f
2404	Predavanja	online	0	Osnove menadžmenta	2020-10-12	10:00:00	11:30:00	18	f	\N	f
2405	Vježbe	online	1	Osnove teorije igara - sekvencijalne igre + zadaća	2020-10-19	08:00:00	09:30:00	18	f	\N	f
2406	Predavanja	online	0	Teorije menadžmenta	2020-10-19	10:00:00	11:30:00	18	f	\N	f
2407	Vježbe	O-350	1	Strateški plan - promišljanje i planiranje	2020-10-26	08:00:00	09:30:00	18	f	\N	f
2408	Predavanja	online	0	Menadžersko planiranje (strateški menadžment)	2020-10-26	10:00:00	11:30:00	18	f	\N	f
2409	Vježbe	O-350	1	Izrada strateškog plana (1. faza) - konzultacije	2020-11-02	08:00:00	09:30:00	18	f	\N	f
2410	Predavanja	online	0	Menadžersko odlučivanje	2020-11-02	10:00:00	11:30:00	18	f	\N	f
2411	Vježbe	O-350	1	Izrada strateškog plana (1. faza) - konzultacije	2020-11-09	08:00:00	09:30:00	18	f	\N	f
2412	Predavanja	online	0	Organizacijski menadžment	2020-11-09	10:00:00	11:30:00	18	f	\N	f
2413	Predavanja	online	0	Kadrovski menadžment	2020-11-16	10:00:00	11:30:00	18	f	\N	f
2414	Vježbe	O-350	1	Izrada strateškog plana (2. faza) - konzultacije	2020-11-23	08:00:00	09:30:00	18	f	\N	f
2415	Vježbe	O-350	1	Izrada strateškog plana (2. faza) - konzultacije	2020-11-30	08:00:00	09:30:00	18	f	\N	f
2416	Predavanja	online	0	Projektni menadžment i softver za upravljanje projektima	2020-11-30	10:00:00	11:30:00	18	f	\N	f
2417	Predavanja	online	0	Spašavanje projekata i upravljanje neusklađenostima i kriznim situacijama	2020-12-07	10:00:00	11:30:00	18	f	\N	f
2418	Vježbe	online	1	Alati za poslovno izvještavanje	2020-12-14	08:00:00	09:30:00	18	f	\N	f
2419	Predavanja	online	0	Virtualna organizacija i poslovanje te sustavi kvalitete	2020-12-14	10:00:00	11:30:00	18	f	\N	f
2420	Vježbe	O-350	1	Analiza alata - konzultacije	2020-12-21	08:00:00	09:30:00	18	f	\N	f
2421	Predavanja	online	0	Upravljanje vremenom	2020-12-21	10:00:00	11:30:00	18	f	\N	f
2422	Vježbe	O-350	1	Analiza alata - konzultacije	2021-01-11	08:00:00	09:30:00	18	f	\N	f
2423	Predavanja	O-357	0	Analiza alata - konzultacije	2021-01-11	10:00:00	11:30:00	18	f	\N	f
2424	Predavanja	O-357	0	Konzultacije za završni ispit	2021-01-18	10:00:00	11:30:00	18	f	\N	f
2425	Vježbe	O-357	1	Evaluacija kolegija	2021-01-25	10:00:00	11:30:00	18	f	\N	f
2426	Predavanja	O-357	0	Evaluacija kolegija	2021-01-25	10:00:00	11:30:00	18	f	\N	f
2427	Predavanja	O-357	0	Uvod	2020-10-08	12:00:00	13:30:00	19	f	\N	f
2428	Predavanja	O-357	0	Metodologija razvoja IS	2020-10-08	12:00:00	13:30:00	19	f	\N	f
2429	Predavanja	O-357/online	0	Specifičnosti IT projekata	2020-10-15	12:00:00	13:30:00	19	f	\N	f
2430	Predavanja	O-357/online	0	Životni ciklus projekta	2020-10-15	12:00:00	13:30:00	19	f	\N	f
2431	Predavanja	O-357/online	0	Definiranje projekta	2020-10-22	12:00:00	13:30:00	19	f	\N	f
2432	Vježbe	O-365	1	MS Project / Project Libre	2020-10-22	14:00:00	16:00:00	19	f	\N	f
2433	Predavanja	O-357/online	0	Planiranje projekta	2020-10-29	12:00:00	13:30:00	19	f	\N	f
2434	Vježbe	O-365	1	MS Project / Project Libre	2020-10-29	14:00:00	16:00:00	19	f	\N	f
2435	Predavanja	O-357/online	0	Izvođenje projekta	2020-11-05	12:00:00	13:30:00	19	f	\N	f
2436	Vježbe	O-365	1	MS Project / Project Libre	2020-11-05	14:00:00	16:00:00	19	f	\N	f
2437	Predavanja	O-357/online	0	Evaluacija projekta	2020-11-12	12:00:00	13:30:00	19	f	\N	f
2438	Vježbe	O-365	1	MS Project / Project Libre	2020-11-12	14:00:00	16:00:00	19	f	\N	f
2439	Predavanja	O-357/online	0	Evaluacija projekta	2020-11-19	12:00:00	13:30:00	19	f	\N	f
2440	Vježbe	O-365	1	Plan komunikacije	2020-11-19	14:00:00	16:00:00	19	f	\N	f
2441	Predavanja	O-357/online	0	Vođenje i upravljanje projekta	2020-11-26	12:00:00	13:30:00	19	f	\N	f
2442	Vježbe	O-365	1	Git /Github	2020-11-26	14:00:00	16:00:00	19	f	\N	f
2443	Predavanja	O-357/online	0	Timski rad	2020-12-03	12:00:00	13:30:00	19	f	\N	f
2444	Predavanja	O-357/online	0	Upravljanje rizicima	2020-12-10	12:00:00	13:30:00	19	f	\N	f
2445	Vježbe	O-365	1	Metode mrežnog planiranja 1	2020-12-10	14:00:00	16:00:00	19	f	\N	f
2446	Predavanja	O-357/online	0	Upravljanje promjenama	2020-12-17	12:00:00	13:30:00	19	f	\N	f
2447	Vježbe	O-365	1	Metode mrežnog planiranja 2	2020-12-17	14:00:00	16:00:00	19	f	\N	f
2448	Predavanja	O-357/online	0	Motivacijske tehnike.	2021-01-07	12:00:00	13:30:00	19	f	\N	f
2449	Vježbe	O-365	1	Metode planiranja /Kanban	2021-01-07	14:00:00	16:00:00	19	f	\N	f
2450	Predavanja	O-357/online	0	Osiguranje kvalitete. Dokumentiranje	2021-01-14	12:00:00	13:30:00	19	f	\N	f
2451	Vježbe	O-365	1	Kreativne metode	2021-01-14	14:00:00	16:00:00	19	f	\N	f
2452	Predavanja	O-357/online	0	Analiza slučaja iz prakse.	2021-01-21	12:00:00	13:30:00	19	f	\N	f
2453	Vježbe	online	1	Predstavljanje seminara - Nadoknada	2021-01-28	14:00:00	15:30:00	19	f	\N	f
2454	Predavanja	O-357	0	Uvod u kolegij. Znanstveno istraživanje i pisanje znanstvenog članka/postera	2020-10-07	10:00:00	11:30:00	20	f	\N	f
2455	Vježbe	O-357	1	Uvod u kolegij. Znanstveno istraživanje i pisanje znanstvenog članka/postera	2020-10-07	12:00:00	13:30:00	20	f	\N	f
2904	Vježbe	366	1	Teorijski kolokvij	2020-12-10	12:15:00	13:45:00	44	f	G2	f
1867	Vježbe	O-366	1	Postavljanje okoline za razvoj programa na platformi ROCm (CUDA). Standardi C++11, C++14 i C++17. Formatiranje znakovnih nizova bibliotekom{fmt}	2020-10-05	10:15:00	11:45:00	55	f	\N	f
1868	Predavanja	O-358	0	Uvod. Pojam i osnovne ideje računanja na grafičkim procesorima	2020-10-07	08:15:00	09:45:00	55	f	\N	f
1869	Vježbe	O-366	1	Arhitektura platforme ROCm (CUDA). Prevođenje i pokretanje gotovih programa otvorenog koda. Mjerenje performansi	2020-10-12	10:15:00	11:45:00	55	f	\N	f
1870	Predavanja	O-358	0	Povijest razvoja grafike i računanja na grafičkim procesorima	2020-10-14	08:15:00	09:45:00	55	f	\N	f
1871	Vježbe	O-366	1	Osnove rada s grafičkim procesorom: biblioteka rocPRIM (ugrađene funkcije CUDA-e)	2020-10-19	10:15:00	11:45:00	55	f	\N	f
1872	Predavanja	O-358	0	Paralelizam zasnovan na podacima. Struktura programa. Množenje matrica	2020-10-21	08:15:00	09:45:00	55	f	\N	f
1873	Vježbe	online	1	Generiranje slučajnih brojeva: C++11 biblioteka random i biblioteka rocRAND	2020-10-26	10:15:00	11:45:00	55	f	\N	f
1874	Predavanja	online	0	Memorije uređaja i prijenos podataka. Zrna i višenitni rad	2020-10-28	08:15:00	09:45:00	55	f	\N	f
1875	Vježbe	online	1	Dokumentiranje programskog koda alatom Doxygen. Dokumentiranje programa alatom MkDocs	2020-11-02	10:15:00	11:45:00	55	f	\N	f
1876	Predavanja	online	0	Indeksi blokova i niti. Redanje izvođenja zrna	2020-11-04	08:15:00	09:45:00	55	f	\N	f
1877	Vježbe	online	1	1. kontrolna zadaća	2020-11-09	10:15:00	11:45:00	55	f	\N	f
1878	Predavanja	online	0	Tipovi memorija. Tehnike za smanjenje korištenja globalne memorije. Memorija kao ograničavajući faktor kod paralelizacije	2020-11-11	08:15:00	09:45:00	55	f	\N	f
1879	Vježbe	online	1	Operacije na vektorima i matricama: aplikacijska programska sučelja BLAS i LAPACK. C++ biblioteka Eigen	2020-11-16	10:15:00	11:45:00	55	f	\N	f
1880	Vježbe	online	1	Operacije na vektorima i matricama: biblioteka rocBLAS (cuBLAS)	2020-11-23	10:15:00	11:45:00	55	f	\N	f
1881	Predavanja	online	0	Tehnike za poboljšanje performansi. Dinamičko particioniranje resursa. Pretpreuzimanje podataka. Granularnosti niti	2020-11-25	08:15:00	09:45:00	55	f	\N	f
1882	Predavanja	online	0	Objavljene ponuđene teme projekata	2020-11-30	10:15:00	11:45:00	55	f	\N	f
1883	Vježbe	online	1	Rješavanje sustava linearnih jednadžbi: biblioteka rocSOLVER (cuSOLVER)	2020-11-30	10:15:00	11:45:00	55	f	\N	f
1884	Predavanja	online	0	1. kolokvij	2020-12-02	08:15:00	09:45:00	55	f	\N	f
1885	Vježbe	online	1	Rijetke matrice: biblioteke rocSPARSE i rocALUTION (cuSPARSE)	2020-12-07	10:15:00	11:45:00	55	f	\N	f
1886	Predavanja	online	0	Problemi računanja s pomičnim zarezom: preciznost i zaokruživanje brojeva	2020-12-09	08:15:00	09:45:00	55	f	\N	f
1887	Predavanja	online	0	Rok za odabir teme projekta	2020-12-14	10:15:00	11:45:00	55	f	\N	f
1888	Vježbe	online	1	Brza Fourierova transformacija: rocFFT (cuFFT)	2020-12-14	10:15:00	11:45:00	55	f	\N	f
1889	Predavanja	online	0	Studijski slučajevi: obrada slika magnetske rezonance te vizualizacija i analiza molekula	2020-12-16	08:15:00	09:45:00	55	f	\N	f
1890	Vježbe	online	1	2. kontrolna zadaća	2020-12-21	10:15:00	11:45:00	55	f	\N	f
1891	Predavanja	online	0	Paralelno programiranje i računsko razmišljanje	2020-12-23	08:15:00	09:45:00	55	f	\N	f
1892	Vježbe	online	1	Prevođenje OpenCL C koda u LLVM-ovu srednju reprezentaciju	2021-01-11	10:15:00	11:45:00	55	f	\N	f
1893	Predavanja	online	0	Programiranje aplikacija za heterogena superračunala	2021-01-13	08:15:00	09:45:00	55	f	\N	f
1894	Vježbe	online	1	Prevođenje LLVM-ove srednje reprezentacije u strojni kod za mikroarhitekture GCN i RDNA	2021-01-18	10:15:00	11:45:00	55	f	\N	f
1895	Predavanja	online	0	Pogled u budućnost: evolucija heterogenih arhitektura i programskih okruženja	2021-01-20	08:15:00	09:45:00	55	f	\N	f
1896	Vježbe	online	1	LLVM-ovi analitički i transformacijski prolazi kod prevođenja koda	2021-01-25	10:15:00	11:45:00	55	f	\N	f
1897	Predavanja	online	0	2. kolokvij	2021-01-27	08:15:00	09:45:00	55	f	\N	f
1898	Predavanja	online	0	Rok za predaju projekta	2021-02-01	10:15:00	11:45:00	55	f	\N	f
1899	Predavanja i vježbe	O-S32	2	Opće informacije. Uvod u predmet.	2020-10-07	10:15:00	12:00:00	2	f	\N	f
1900	Predavanja	O-S32	0	Inteligentni sustavi, definicije, povijest, područja	2020-10-14	10:15:00	12:00:00	2	f	\N	f
1901	Vježbe	O-366	1	Alati za strojno učenje: Matlab, TensorFlow, Python xy (scikit, mlpy), R, Colab	2020-10-14	08:30:00	10:00:00	2	f	\N	f
1902	Predavanja	O-S32	0	Područja primjene umjetne inteligencije	2020-10-21	10:15:00	12:00:00	2	f	\N	f
1903	Vježbe	O-366	1	Biblioteke, rad s funkcijama, učitavanje podataka	2020-10-21	08:30:00	10:00:00	2	f	\N	f
1904	Predavanja	O-S32	0	Uvod u strojno učenje.	2020-10-28	10:15:00	12:00:00	2	f	\N	f
1905	Vježbe	O-366	1	Priprema podataka za strojno učenje	2020-10-28	08:30:00	10:00:00	2	f	\N	f
1906	Predavanja	O-S32	0	Grupiranje. Algoritmi k-srednjih vrijednosti, EM algoritam, hijerarhijsko grupiranje	2020-11-04	10:15:00	12:00:00	2	f	\N	f
1907	Vježbe	O-366	1	Grupiranje	2020-11-04	08:30:00	10:00:00	2	f	\N	f
1908	Predavanja	online	0	Regresija. Linearna regresija. Kvadratna regresija.	2020-11-11	10:15:00	12:00:00	2	f	\N	f
1909	Vježbe	O-366	1	Linearna i kvadratna regresija. Evaluacija i analiza modela regresije.	2020-11-11	08:30:00	10:00:00	2	f	\N	f
1910	Predavanja	online	0	Klasifikacija. Analiza i priprema podataka za izvođenje eksperimenta. Izlučivanje značajki.Ne parametarske metode, k-NN	2020-11-25	10:15:00	12:00:00	2	f	\N	f
1911	Predavanja	online	0	Logistička regresija. Naivni Bayesov klasifikator. Stroj s potpornim vektorima (SVM)	2020-12-02	10:15:00	12:00:00	2	f	\N	f
1912	Vježbe	O-366	1	Korištenje metoda klasifikacije. Evaluacija i analiza modela klasifikacije.	2020-12-02	08:30:00	10:00:00	2	f	\N	f
1913	Predavanja	O-S32	0	Neuronske mreže. Jednoslojni i višeslojni perceptron. Duboke neuronske mreže: CNN	2020-12-09	10:15:00	12:00:00	2	f	\N	f
1914	Vježbe	online	1	Korištenje metoda klasifikacije. Evaluacija i analiza modela klasifikacije.	2020-12-09	08:30:00	10:00:00	2	f	\N	f
1915	Predavanja	online	0	Faze provedbe eksperimenta. Učenje modela. Evaluacija, analiza i unaprjeđenje modela	2020-12-16	10:15:00	12:00:00	2	f	\N	f
1916	Vježbe	O-366	1	Neuronske mreže i duboke neuronske mreže	2020-12-16	08:30:00	10:00:00	2	f	\N	f
1917	Predavanja	online	0	Duboke neuronske mreže: Case Study	2020-12-23	10:15:00	12:00:00	2	f	\N	f
2456	Predavanja	online	0	Informacijsko društvo: tehno-ekonomija, javni govor i informiranost. Razvoj informacijske tehnologije. 1. rasprava na forumu - početak u forumu	2020-10-14	10:00:00	11:30:00	20	f	\N	f
2457	Predavanja	online	0	Razvoj računala i Interneta. Elementi i strukturne osobine računalnih komunikacijskih sustava. Glavne usluge računalnih komunikacijskih sustava.	2020-10-20	10:00:00	11:30:00	20	f	\N	f
2458	Vježbe	online	1	Razvoj računala i Interneta. Elementi i strukturne osobine računalnih komunikacijskih sustava. Glavne usluge računalnih komunikacijskih sustava.	2020-10-20	12:00:00	13:30:00	20	f	\N	f
2459	Predavanja	online	0	Elementi i strukturne osobine bežičnih komunikacijskih sustava. Sustavi i generacije mobilne telefonije. Utjecaji ICT na obrazovanje, rad i društvena kretanja. 1. rasprava na forumu - kraj u forumu	2020-10-28	10:00:00	11:30:00	20	f	\N	f
2460	Predavanja	online	0	Virtualna stvarnost i virtualne zajednice, privatnost i nadziranje. Civilno društvo, tehno- ekonomski razvoj i društvene polarizacije. 2. rasprava na forumu - početak u forumu	2020-11-04	10:00:00	11:30:00	20	f	\N	f
2461	Predavanja	online	0	Društvo znanja, globalne suradnje i konfrontacija: Wikipedija, blogovi. Umrežavanje i samo- komunikacije: YouTube, Facebook, MySpace, Twitter.	2020-11-11	10:00:00	11:30:00	20	f	\N	f
2462	Vježbe	online	1	Društvo znanja, globalne suradnje i konfrontacija: Wikipedija, blogovi. Umrežavanje i samo- komunikacije: YouTube, Facebook, MySpace, Twitter.	2020-11-11	12:00:00	13:30:00	20	f	\N	f
2463	Predavanja	online	0	Otvorenost izvora i globalna suradnja: softver otvorenog izvora. Web 2.0 i 3.0, multimedija, znanost o podacima. Infozabava: metode medijskog oblikovanja javnog mnijenja.	2020-11-25	10:00:00	11:30:00	20	f	\N	f
2464	Vježbe	online	1	Otvorenost izvora i globalna suradnja: softver otvorenog izvora. Web 2.0 i 3.0, multimedija, znanost o podacima. Infozabava: metode medijskog oblikovanja javnog mnijenja.	2020-11-25	12:00:00	13:30:00	20	f	\N	f
2465	Predavanja	online	0	Nove tehnološke mogućnosti i novi oblici propagande i cenzure. Tehnološki razvoj i značajke suvremenog života: izazovi i perspektive. 2. rasprava na forumu - kraj u forumu	2020-12-02	10:00:00	11:30:00	20	f	\N	f
2466	Predavanja	O-357	0	Priprema kritičkog osvrta - konzultacije	2020-12-09	10:00:00	11:30:00	20	f	\N	f
2467	Vježbe	O-357	1	Priprema kritičkog osvrta - konzultacije	2020-12-09	12:00:00	13:30:00	20	f	\N	f
2468	Predavanja	O-357	0	Priprema kritičkog osvrta - konzultacije	2020-12-16	10:00:00	11:30:00	20	f	\N	f
2469	Vježbe	O-357	1	Priprema kritičkog osvrta - konzultacije	2020-12-16	12:00:00	13:30:00	20	f	\N	f
2470	Predavanja	O-357	0	Priprema kritičkog osvrta - konzultacije	2020-12-23	10:00:00	11:30:00	20	f	\N	f
2471	Vježbe	O-357	1	Priprema kritičkog osvrta - konzultacije	2020-12-23	12:00:00	13:30:00	20	f	\N	f
2472	Predavanja	online	0	Kritički osvrt	2021-01-13	10:00:00	11:30:00	20	f	\N	f
2473	Predavanja	O-357	0	Izrada seminarskog (završnog) rada - konzultacije	2021-01-20	10:00:00	11:30:00	20	f	\N	f
2474	Vježbe	O-357	1	Izrada seminarskog (završnog) rada - konzultacije	2021-01-20	12:00:00	13:30:00	20	f	\N	f
2475	Predavanja	O-357	0	Izrada seminarskog (završnog) rada - konzultacije	2021-01-27	10:00:00	11:30:00	20	f	\N	f
2476	Vježbe	online	1	Uvod u vježbe	2020-10-08	08:30:00	10:00:00	21	f	\N	f
2477	Predavanja	O-357	0	Uvod, organizacija kolegija	2020-10-08	10:00:00	12:00:00	21	f	\N	f
2478	Vježbe	O-366	1	Uvod u Matlab	2020-10-15	08:30:00	10:00:00	21	f	\N	f
2479	Predavanja	O-357	0	Postupci digitalne obrade signala govora	2020-10-15	10:00:00	12:00:00	21	f	\N	f
2480	Vježbe	O-366	1	Obrada signala govora / Matlab	2020-10-22	08:30:00	10:00:00	21	f	\N	f
2481	Predavanja	O-357	0	Postupci digitalne obrade slike	2020-10-22	10:00:00	12:00:00	21	f	\N	f
2482	Vježbe	O-366	1	Matlab, Image Processing Toolbox	2020-10-29	08:30:00	10:00:00	21	f	\N	f
2483	Predavanja	O-357	0	Akustičko modeliranje govora	2020-10-29	10:00:00	12:00:00	21	f	\N	f
2484	Vježbe	O-366	1	Matlab, Signal Processing Toolbox	2020-11-05	08:30:00	10:00:00	21	f	\N	f
2485	Predavanja	O-357	0	Računalni vid	2020-11-05	10:00:00	12:00:00	21	f	\N	f
2486	Vježbe	O-366	1	Matlab,Image Processing Toolbox	2020-11-12	08:30:00	10:00:00	21	f	\N	f
2487	Predavanja	O-357	0	Jezično modeliranje govora	2020-11-12	10:00:00	12:00:00	21	f	\N	f
2488	Vježbe	online	1	Snimanje i priprema signala	2020-11-19	08:30:00	10:00:00	21	f	\N	f
2489	Predavanja	O-357	0	Postupci raščlanjivanja (segmentacije) govora	2020-11-19	10:00:00	12:00:00	21	f	\N	f
2490	Vježbe	O-366	1	Matlab/Octave	2020-11-26	08:30:00	10:00:00	21	f	\N	f
2491	Predavanja	O-357	0	Postupci izlučivanja značajki slike	2020-11-26	10:00:00	12:00:00	21	f	\N	f
2492	Vježbe	online	1	Matlab/Octave. Prezentacije tema projekata	2020-12-03	08:30:00	10:00:00	21	f	\N	f
2493	Predavanja	online	0	Morfološke značajke slike	2020-12-03	10:00:00	12:00:00	21	f	\N	f
2494	Vježbe	O-366	1	Matlab/Octave	2020-12-10	08:30:00	10:00:00	21	f	\N	f
2495	Predavanja	online	0	Postupci raspoznavanja govora	2020-12-10	10:00:00	12:00:00	21	f	\N	f
2496	Vježbe	O-366	1	Postupci raspoznavanja govora	2020-12-17	08:30:00	10:00:00	21	f	\N	f
2497	Predavanja	online	0	Sustavi za govorni dijalog	2020-12-17	10:00:00	12:00:00	21	f	\N	f
2498	Vježbe	O-366	1	Matlab/Octave	2020-01-07	08:30:00	10:00:00	21	f	\N	f
2499	Predavanja	online	0	Postupci obrade slikovnih uzoraka	2021-01-07	10:00:00	12:00:00	21	f	\N	f
2500	Vježbe	O-366	1	Obrada slikovnih uzoraka	2021-01-14	08:30:00	10:00:00	21	f	\N	f
2501	Predavanja	357/Online	0	Aktivni vid	2021-01-14	10:00:00	12:00:00	21	f	\N	f
2502	Vježbe	online	1	Matlab/Octave	2021-01-21	08:30:00	10:00:00	21	f	\N	f
2503	Predavanja	online	0	Seminarski radovi	2021-01-21	08:30:00	10:00:00	21	f	\N	f
2504	Vježbe	online	1	Seminarski radovi	2021-01-28	10:00:00	11:30:00	21	f	\N	f
2505	Predavanja	online	0	Seminarski radovi	2021-01-28	08:30:00	10:00:00	21	f	\N	f
2506	Predavanja	online	0	Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Uvod.	2020-10-09	08:15:00	09:45:00	22	f	\N	f
3211	Vježbe	O-366	1	Responzivni web I	2021-05-13	15:45:00	17:15:00	38	f	G2	f
1918	Predavanja	online	0	Područja primjene inteligentnih sustava (biometrija, raspoznavanje uzoraka, računalni vid)	2021-01-13	10:15:00	12:00:00	2	f	\N	f
1919	Vježbe	O-366	1	Primjene strojnog i dubokog učenja u praksi	2021-01-13	08:30:00	10:00:00	2	f	\N	f
1920	Predavanja	online	0	Područja primjene inteligentnih sustava (robotika, NLP, ES,… )	2021-01-20	10:15:00	12:00:00	2	f	\N	f
1921	Vježbe	O-366	1	Primjene strojnog i dubokog učenja u praksi	2021-01-20	08:30:00	10:00:00	2	f	\N	f
1922	Predavanja	online	0	Područja primjene inteligentnih sustava (meko računarstvo, prirodom inspirirani algoritmi, pretraživanja prostora A*, BFS, DFS)	2021-01-27	10:15:00	12:00:00	2	f	\N	f
1923	Vježbe	online	1	Primjene strojnog i dubokog učenja u praksi	2021-01-27	08:30:00	10:00:00	2	f	\N	f
1924	Predavanja	O-350	0	Uvod u kolegij.Pojam i razvoj operacijskih istraživanja. Bitna obilježja operacijskih istraživanja.Uvod u linearno programiranje.	2020-10-06	10:15:00	11:45:00	3	f	\N	f
1925	Vježbe	online	1	Pojam i razvoj operacijskih istraživanja. Bitna obilježja operacijskih istraživanja.	2020-10-06	10:15:00	11:45:00	3	f	\N	f
1926	Predavanja	online	0	Uvod u linearno programiranje.	2020-10-13	08:30:00	10:00:00	3	f	\N	f
3046	Vježbe	online	1	Filtri	2021-04-06	10:00:00	11:30:00	13	f	\N	f
1927	Vježbe	online	1	Postavljanje matematičkog modela problema linearnoga programiranja.	2020-10-13	10:15:00	11:45:00	3	f	\N	f
1928	Predavanja	S32	0	Grafička metoda rješavanja problema linearnog programiranja.	2020-10-20	08:30:00	10:00:00	3	f	\N	f
1929	Vježbe	O-350	1	Rješavanje problemskih zadataka: grafičkametoda.	2020-10-20	10:15:00	11:45:00	3	f	\N	f
1930	Predavanja	S32	0	Rješavanje problema linearnog programiranja pomoću simpleks metode: nalaženje maksimuma.	2020-10-27	08:30:00	10:00:00	3	f	\N	f
1931	Vježbe	O-350	1	Rješavanje problemskih zadataka alatom LPSolve.	2020-10-27	10:15:00	11:45:00	3	f	\N	f
1932	Predavanja	S32	0	Rješavanje problema linearnog programiranjapomoću simpleks metode: nalaženje minimuma i alternativnih rješenja.	2020-11-03	08:30:00	10:00:00	3	f	\N	f
1933	Vježbe	O-350	1	Rješavanje problemskih zadataka alatom LPSolve i priprema za 1. kolokvij (DZ).	2020-11-03	10:15:00	11:45:00	3	f	\N	f
1934	Predavanja	S32	0	Modeliranje složenijih problema LP.	2020-11-17	08:30:00	10:00:00	3	f	\N	f
1935	Vježbe	O-350	1	Rješavanje problemskih zadataka: izrada složenijih modela problema LP.	2020-11-17	10:15:00	11:45:00	3	f	\N	f
1936	Predavanja	S32	0	Degeneracija.	2020-11-24	08:30:00	10:00:00	3	f	\N	f
1937	Vježbe	O-350	1	Rješavanje problemskih zadataka.	2020-11-24	10:15:00	11:45:00	3	f	\N	f
1938	Predavanja	online	0	Dualnost. Ekonomska interpretacija duala. Vrste dualnih rješenja.	2020-12-01	08:30:00	10:00:00	3	f	\N	f
1939	Vježbe	online	1	Rješavanje problemskih zadataka: dualnost.	2020-12-01	10:15:00	11:45:00	3	f	\N	f
1940	Predavanja	S32	0	Analiza osjetljivosti.	2020-12-08	08:30:00	10:00:00	3	f	\N	f
1941	Vježbe	O-350	1	Rješavanje problemskih zadataka: analiza osjetljivosti.	2020-12-08	10:15:00	11:45:00	3	f	\N	f
1942	Predavanja	online	0	Primjena i interpretacija rezultata analizeosjetljivosti.	2020-12-15	08:30:00	10:00:00	3	f	\N	f
1943	Vježbe	online	1	Priprema za 2. kolokvij (DZ).	2020-12-15	10:15:00	11:45:00	3	f	\N	f
1944	Predavanja	S32	0	Uvod u transportni problem. Metode za postavljanje početnog rješenja. Metode za testiranje rješenja i pronalaženje optimalnogrješenja.	2020-12-15	08:30:00	10:00:00	3	f	\N	f
1945	Vježbe	O-350	1	Rješavanje problemskih zadataka: transportni problemi.	2020-12-15	10:15:00	11:45:00	3	f	\N	f
1946	Predavanja	S32	0	Degeneracija kod transportnog problema. Posebni slučajevi transportnih problema.	2020-12-22	08:30:00	10:00:00	3	f	\N	f
1947	Predavanja	online	0	Metode za nalaženje maksimalne vrijednosti funkcije cilja kod transportnog problema.	2021-01-12	08:30:00	10:00:00	3	f	\N	f
1948	Predavanja	O-S32	0	Uvodni sat: Opće informacije.	2020-10-09	10:00:00	11:30:00	4	f	\N	f
1949	Vježbe	online	1	Uvodni sat: CASE alati, postavljanje razvojnog okruženja	2020-10-09	10:15:00	11:45:00	4	f	\N	f
1950	Predavanja	online	0	Inženjering zahtjeva	2020-10-16	10:15:00	11:45:00	4	f	\N	f
1951	Vježbe	online	1	Osnovni koncepti za opis razvoja softvera - klasifikacija i područja primjene	2020-10-16	10:15:00	11:45:00	4	f	\N	f
1952	Predavanja	O-S32	0	Upravljanje i organizacija tima	2020-10-23	10:00:00	11:30:00	4	f	\N	f
1953	Vježbe	online	1	Specifikacija zahtjeva	2020-10-23	10:15:00	11:45:00	4	f	\N	f
1954	Predavanja	O-S32	0	Procjena troškova	2020-10-30	10:00:00	11:30:00	4	f	\N	f
1955	Vježbe	online	1	Projektiranje zadanog sustava	2020-10-30	10:15:00	11:45:00	4	f	\N	f
1956	Predavanja	online	0	Planiranje i kontrola projekta	2020-11-06	10:15:00	11:45:00	4	f	\N	f
1957	Vježbe	online	1	Implementacija	2020-11-06	10:15:00	11:45:00	4	f	\N	f
1958	Predavanja	O-S32	0	Studentski projekt - prezentacija ideje	2020-11-13	10:00:00	11:30:00	4	f	\N	f
1959	Predavanja	online	0	Softverski alati. Upravljanje konfiguracijama. Alati za kontrolu verzija. Timski rad na softveru.	2020-11-20	10:15:00	11:45:00	4	f	\N	f
1960	Vježbe	online	1	Alat za kontrolu verzija	2020-11-20	10:15:00	11:45:00	4	f	\N	f
1961	Vježbe	online	1	Studentski projekt - projektni sastanak	2020-11-27	10:15:00	11:45:00	4	f	\N	f
1962	Predavanja	online	0	Dizajn interakcije i korisničkog sučelja	2020-12-04	10:15:00	11:45:00	4	f	\N	f
1963	Vježbe	online	1	Implementacija	2020-12-04	10:15:00	11:45:00	4	f	\N	f
1964	Vježbe	online	1	Studentski projekt - projektni sastanak	2020-12-11	10:15:00	11:45:00	4	f	\N	f
1965	Predavanja	online	0	Etički kodeks softverskih inženjera	2020-12-18	10:15:00	11:45:00	4	f	\N	f
1966	Vježbe	online	1	Implementacija	2020-12-18	10:15:00	11:45:00	4	f	\N	f
1967	Predavanja	online	0	Održavanje softvera	2021-01-08	10:15:00	11:45:00	4	f	\N	f
1968	Vježbe	online	1	Testiranje	2021-01-08	10:15:00	11:45:00	4	f	\N	f
1969	Vježbe	online	1	Studentski projekt - projektni sastanak	2021-01-15	10:15:00	11:45:00	4	f	\N	f
1970	Predavanja	online	0	Budućnost softverskog inženjerstva.	2021-01-22	10:15:00	11:45:00	4	f	\N	f
1971	Predavanja	O-S32	0	Analiza studentskog projekta	2021-01-29	10:15:00	11:45:00	4	f	\N	f
1972	Vježbe	online	1	Analiza studentskog projekta	2021-01-29	10:15:00	11:45:00	4	f	\N	f
1973	Predavanja	O-358	0	Distribuirani sustavi: definicija, softverski i hardverski koncepti	2020-10-06	12:15:00	13:45:00	5	f	\N	f
2507	Vježbe	online	1	Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Uvod.	2020-10-09	10:00:00	11:30:00	22	f	\N	f
2508	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-10-16	08:15:00	09:45:00	22	f	\N	f
2509	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-10-16	10:00:00	11:30:00	22	f	\N	f
2510	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-10-23	08:15:00	09:45:00	22	f	\N	f
2511	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-10-23	10:00:00	11:30:00	22	f	\N	f
2512	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-10-30	08:15:00	09:45:00	22	f	\N	f
2513	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-10-30	10:00:00	11:30:00	22	f	\N	f
2514	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-11-06	08:15:00	09:45:00	22	f	\N	f
2515	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-11-06	10:00:00	11:30:00	22	f	\N	f
2516	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-11-13	08:15:00	09:45:00	22	f	\N	f
2517	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-11-13	10:00:00	11:30:00	22	f	\N	f
2518	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-11-20	08:15:00	09:45:00	22	f	\N	f
2519	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-11-20	10:00:00	11:30:00	22	f	\N	f
2520	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-11-27	08:15:00	09:45:00	22	f	\N	f
2521	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-11-27	10:00:00	11:30:00	22	f	\N	f
2522	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-12-04	08:15:00	09:45:00	22	f	\N	f
2581	Vježbe	online	1	DTP ponavljanje	2020-10-16	14:15:00	15:45:00	25	f	\N	f
2523	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-12-04	10:00:00	11:30:00	22	f	\N	f
2524	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-12-11	08:15:00	09:45:00	22	f	\N	f
2525	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-12-11	10:00:00	11:30:00	22	f	\N	f
2526	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2020-12-18	08:15:00	09:45:00	22	f	\N	f
2527	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2020-12-18	10:00:00	11:30:00	22	f	\N	f
2528	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-01-08	08:15:00	09:45:00	22	f	\N	f
2529	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-01-08	10:00:00	11:30:00	22	f	\N	f
2530	Predavanja	online	0	Napredni postupci dubinske analize podataka, seminarski radovi studenata na zadane teme (P);	2021-01-15	08:15:00	09:45:00	22	f	\N	f
2531	Vježbe	online	1	Upoznavanje naprednih metoda dubinske analize podataka, izvođenje eksperimenata, priprema za projekt (V)	2021-01-15	10:00:00	11:30:00	22	f	\N	f
2532	Vježbe	online	1	Prezentacije projekata	2021-01-22	10:00:00	11:30:00	22	f	\N	f
2533	Predavanja	online	0	Prezentacije projekata (nadoknada termina)	2021-01-29	08:15:00	09:45:00	22	f	\N	f
2534	Vježbe	online	1	Prezentacije projekata (nadoknada termina)	2021-01-29	10:00:00	11:30:00	22	f	\N	f
2535	Predavanja i vježbe	O-365	2	Osnovni pojmovi upravljanja računalnim i mrežnim sustavima. Izrada i održavanje vlastite dokumentacije korištenjem formata reStructuredText i alata Sphinx. Osnove korištenja operacijskih sustava sličnih Unixu	2020-10-05	14:15:00	17:45:00	23	f	\N	f
2536	Predavanja i vježbe	online	2	Početak izrade 1. eseja	2020-10-05	12:15:00	13:45:00	23	f	\N	f
2537	Predavanja i vježbe	O-365	2	Virtualizacija korištenjem KVM-a. Instalacija operacijskih sustava Ubuntu Desktop i Ubuntu Server u virtualnom okruženju. Upravljanje paketima. Instalacija sigurnosnih zakrpi i drugih nadogradnji operacijskih sustava. Automatizacija instalacije alatom Ansible	2020-10-12	14:15:00	17:45:00	23	f	\N	f
2538	Predavanja i vježbe	O-365	2	Upravljanje korisnicima i grupama. Upravljanje uslugama: pokretanje i zaustavljanje poslužiteljskih procesa i drugih daemona. Pisanje vlastitih usluga. Logging: praćenje događaja operacijskog sustava. Automatizacija zadaća operacijskog sustava	2020-10-19	14:15:00	17:45:00	23	f	\N	f
2539	Predavanja i vježbe	O-365	2	Particioniranje alatima fdisk i parted. Datotečni sustav i upravitelj volumenima ZFS. Sinkronizacija sigurnosnih pohrana podataka alatom rsync. Povratak izgubljenih podataka alatima testdisk i photorec	2020-10-26	14:15:00	17:45:00	23	f	\N	f
2540	Predavanja i vježbe	O-365	2	Å ifriranje alatom OpenSSL. Sigurna ljuska i udaljeni rad alatom OpenSSH	2020-11-02	14:15:00	17:45:00	23	f	\N	f
2541	Predavanja i vježbe	online	2	Početak izrade 2. eseja	2020-11-02	12:15:00	13:45:00	23	f	\N	f
2542	Predavanja i vježbe	O-365	2	Virtualna privatna mreža alatom OpenVPN. Anonimne mreže Tor i I2P	2020-11-09	14:15:00	17:45:00	23	f	\N	f
2897	Vježbe	366	1	Dijagram aktivnosti i dijagram stanja	2020-11-26	10:15:00	11:45:00	44	f	G1	f
2898	Vježbe	366	1	Dijagram aktivnosti i dijagram stanja	2020-11-26	12:15:00	13:45:00	44	f	G2	f
2899	Predavanja	028/Online	0	Modeliranje interakcije objekata: dijagram slijeda i dijagram komunikacije	2020-12-01	08:15:00	09:45:00	44	f		f
2900	Vježbe	366	1	Dijagram slijeda i dijagram komunikacije	2020-12-03	10:15:00	11:45:00	44	f	G1	f
2901	Vježbe	366	1	Dijagram slijeda i dijagram komunikacije	2020-12-03	12:15:00	13:45:00	44	f	G2	f
2902	Predavanja	028/Online	0	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2020-12-08	08:15:00	09:45:00	44	f		f
2543	Predavanja i vježbe	O-365	2	Konfiguracija web poslužitelja nginx i korištenje interpretera PHP- a pomoću PHP-FPM-a. Konfiguracija sustava za upravljanje bazom podataka MariaDB. Instalacija i konfiguracija web aplikacija Dokuwiki i Wordpress na poslužitelju nginx. SSL/TLS certifikati autoriteta Let's Encrypt	2020-11-16	14:15:00	17:45:00	23	f	\N	f
2544	Predavanja i vježbe	O-365	2	Konfiguracija balansiranja opterećnja u nginxu. Posluživanje Node.js web aplikacija korištenjem proxya	2020-11-23	14:15:00	17:45:00	23	f	\N	f
2545	Predavanja i vježbe	O-365	2	Konfiguracija poslužiteljskih Java aplikacija za audiovizualne konferencije Jitsi Meet i Big Blue Button	2020-11-30	14:15:00	17:45:00	23	f	\N	f
2546	Predavanja i vježbe	online	2	Prevođenje programa u izvršni oblik, API i ABI kompatibilnost. Nabavka i instalacija programa u obliku izvornog koda i binarnom obliku	2020-12-07	14:15:00	17:45:00	23	f	\N	f
2547	Predavanja i vježbe	online	2	Upravljački programi hardvera u jezgri i korisničkom prostoru. Prevođenje i instalacija dodatnih modula jezgre	2020-12-14	14:15:00	17:45:00	23	f	\N	f
2548	Predavanja i vježbe	online	2	Pokretanje i prilagodba aplikacija u kontejnerima alatom Docker. Orkestracija kontejnera alatom Kubernetesr	2020-12-21	14:15:00	17:45:00	23	f	\N	f
3176	Vježbe	365	1	Big data alat 2	2021-05-26	10:00:00	11:30:00	14	f	\N	f
2549	Predavanja i vježbe	online	2	Prilagodba slika poslužitelja u oblaku alatom Packer. Stvaranje oblaka alatom Terraform	2021-01-11	14:15:00	17:45:00	23	f	\N	f
2550	Predavanja i vježbe	online	2	Orkestracija radnog opterećenja alatom Nomad	2021-01-18	14:15:00	17:45:00	23	f	\N	f
2551	Predavanja i vježbe	O-365	2	Postavljanje poslužitelja u ormar. Proces pokretanja poslužitelja i instalacija operacijskog sustava. Kabliranje i povezivanje poslužitelja na mrežu	2021-01-25	14:15:00	17:45:00	23	f	\N	f
2573	Predavanja	O-365	0	Semantičke tehnologije. Predstavljanje znanja na webu	2021-01-12	08:15:00	09:45:00	24	f	\N	f
2574	Vježbe	online	1	Semantičke tehnologije. Predstavljanje znanja na webu	2021-01-12	10:00:00	11:30:00	24	f	\N	f
2575	Predavanja	online	0	Postupci određivanja semantičke sličnosti	2021-01-19	08:15:00	09:45:00	24	f	\N	f
2576	Vježbe	O-365	1	Uvod u ontologije. Inženjering ontologija.	2021-01-19	08:15:00	09:45:00	24	f	\N	f
2577	Predavanja	O-365	0	Primjena eksternih izvora znanja u mjerenju semantičke sličnosti.	2021-01-26	10:00:00	11:30:00	24	f	\N	f
2578	Predavanja	O-358	0	Uvodno predavanje	2020-10-09	12:15:00	13:45:00	25	f	\N	f
2579	Predavanja	O-358	0	Uvod u kolegij i obaveze studenata	2020-10-09	14:15:00	15:45:00	25	f	\N	f
2580	Predavanja	online	0	Uvod u dizajn arhitekture softvera	2020-10-16	12:15:00	13:45:00	25	f	\N	f
2582	Predavanja	online	0	Strukturna karta	2020-10-23	12:15:00	13:45:00	25	f	\N	f
2583	Vježbe	online	1	DEV ponavljanje	2020-10-23	14:15:00	15:45:00	25	f	\N	f
2584	Predavanja	online	0	Strukturna karta. Izrada strukturne karte	2020-10-30	12:15:00	13:45:00	25	f	\N	f
2585	Vježbe	online	1	Strukturna karta. Izrada strukturne karte	2020-10-30	14:15:00	15:45:00	25	f	\N	f
2586	Predavanja	online	0	Koncepti strukture APP	2020-11-06	12:15:00	13:45:00	25	f	\N	f
2587	Vježbe	online	1	Koncepti strukture APP	2020-11-06	14:15:00	15:45:00	25	f	\N	f
2588	Predavanja	online	0	Metoda APP	2020-11-13	12:15:00	13:45:00	25	f	\N	f
2589	Predavanja	online	0	Metoda APP	2020-11-13	14:15:00	15:45:00	25	f	\N	f
2590	Predavanja	online	0	Metoda APP	2020-11-20	12:15:00	13:45:00	25	f	\N	f
2591	Predavanja	online	0	Primjeri arhitekture programskog proizvoda	2020-11-20	14:15:00	15:45:00	25	f	\N	f
2592	Predavanja	online	0	Projektiranje dijagrama arhitekture programskog proizvoda	2020-11-27	12:15:00	13:45:00	25	f	\N	f
2593	Vježbe	online	1	Projektiranje dijagrama arhitekture programskog proizvoda	2020-11-27	14:15:00	15:45:00	25	f	\N	f
2594	Vježbe	online	1	Projektiranje dijagrama arhitekture programskog proizvoda	2020-12-04	12:15:00	13:45:00	25	f	\N	f
2595	Predavanja	online	0	ERP Sustavi	2020-12-04	14:15:00	15:45:00	25	f	\N	f
2596	Vježbe	online	1	Prezentacija ERP sustava	2020-12-11	12:15:00	13:45:00	25	f	\N	f
2597	Predavanja	online	0	Komponente ERP-a	2020-12-11	14:15:00	15:45:00	25	f	\N	f
2598	Predavanja	online	0	ERP sustavi	2020-12-18	12:15:00	13:45:00	25	f	\N	f
2599	Predavanja	online	0	Faze životnog ciklusa ERP-a	2020-12-18	14:15:00	15:45:00	25	f	\N	f
2600	Vježbe	online	1	Praktičan rad - APP	2021-01-08	12:15:00	13:45:00	25	f	\N	f
2601	Vježbe	online	1	Praktičan rad - APP	2021-01-08	14:15:00	15:45:00	25	f	\N	f
2602	Vježbe	O-359	1	Praktičan rad - APP	2021-01-15	14:15:00	15:45:00	25	f	\N	f
2603	Vježbe	O-361	1	Analiza studentskih radova	2021-01-22	14:15:00	15:45:00	25	f	\N	f
2604	Vježbe	O-362	1	Analiza studentskih rezultata	2021-01-29	12:15:00	13:45:00	25	f	\N	f
2605	Vježbe	O-363	1	Analiza studentskih rezultata	2021-01-29	14:15:00	15:45:00	25	f	\N	f
2606	Vježbe	S32	1	Uvod u kolegij. O strukturi matematike. Definicije, aksiomi i teoremi.	2020-10-05	10:15:00	11:45:00	35	f	G1	f
2607	Vježbe	S32	1	Uvod u kolegij. O strukturi matematike. Definicije, aksiomi iteoremi.	2020-10-05	12:15:00	13:45:00	35	f	G2	f
2608	Predavanja	S32	0	Osnove matematičke logike.	2020-10-05	14:15:00	15:45:00	35	f		f
2609	Vježbe	S32	1	Ispitivanje istinitosti složenih sudova.	2020-10-12	10:15:00	11:45:00	35	f	G1	f
2610	Vježbe	S32	1	Ispitivanje istinitosti složenih sudova.	2020-10-12	12:15:00	13:45:00	35	f	G2	f
2611	Predavanja	S32	0	Skupovi.	2020-10-12	14:15:00	15:45:00	35	f		f
2612	Vježbe	S32	1	Operacije sa skupovima.	2020-10-19	10:15:00	11:45:00	35	f	G1	f
2613	Vježbe	S32	1	Operacije sa skupovima.	2020-10-19	12:15:00	13:45:00	35	f	G2	f
2614	Predavanja	S32	0	Kartezijev produkt skupova.	2020-10-19	14:15:00	15:45:00	35	f		f
2615	Vježbe	S32	1	Partitivni skup. Particija skupa. Kartezijev produkt skupova.	2020-10-26	10:15:00	11:45:00	35	f	G1	f
2616	Vježbe	S32	1	Partitivni skup. Particija skupa. Kartezijev produkt skupova.	2020-10-26	12:15:00	13:45:00	35	f	G2	f
2617	Predavanja	S32	0	Relacije. Binarne relacije.	2020-10-26	14:15:00	15:45:00	35	f		f
2618	Vježbe	S32	1	Ispitivanje i analiza svojstva binarnih relacija.	2020-11-02	10:15:00	11:45:00	35	f	G1	f
2619	Vježbe	S32	1	Ispitivanje i analiza svojstva binarnih relacija.	2020-11-02	12:15:00	13:45:00	35	f	G2	f
2620	Predavanja	S32	0	Funkcije.	2020-11-02	14:15:00	15:45:00	35	f		f
2621	Vježbe	S32	1	Ispitivanje surjektivnosti, injektivnosti i bijektivnosti funkcija.	2020-11-09	10:15:00	11:45:00	35	f	G1	f
2622	Vježbe	S32	1	Ispitivanje surjektivnosti, injektivnosti i bijektivnosti funkcija.	2020-11-09	12:15:00	13:45:00	35	f	G2	f
2623	Predavanja	S32	0	1. test - Kompozicija funkcija. Inverzne funkcije.	2020-11-09	14:15:00	15:45:00	35	f		f
2624	Vježbe	S32	1	Određivanje domene složenih funkcija i njihovih odgovarajućih inverznih funkcija.	2020-11-16	10:15:00	11:45:00	35	f	G1	f
2625	Vježbe	S32	1	Određivanje domene složenih funkcija i njihovih odgovarajućih inverznih funkcija.	2020-11-16	12:15:00	13:45:00	35	f	G2	f
2626	Predavanja	S32	0	Ekvipotentni skupovi. Konačni I beskonačni skupovi. Kardinalnost.	2020-11-16	14:15:00	15:45:00	35	f		f
2627	Vježbe	S32	1	Prirodni brojevi. Matematička indukcija.	2020-11-23	10:15:00	11:45:00	35	f	G1	f
2628	Vježbe	S32	1	Prirodni brojevi. Matematička indukcija.	2020-11-23	12:15:00	13:45:00	35	f	G2	f
2629	Predavanja	S32	0	1. kolokvij	2020-11-23	14:15:00	15:45:00	35	f		f
2630	Vježbe	S32	1	Matrice. Računske operacije s matricama.	2020-11-30	10:15:00	11:45:00	35	f	G1	f
2631	Vježbe	S32	1	Matrice. Računske operacije s matricama.	2020-11-30	12:15:00	13:45:00	35	f	G2	f
2632	Predavanja	S32	0	Determinante. Svojstva determinanti.	2020-11-30	14:15:00	15:45:00	35	f		f
2633	Vježbe	S32	1	Razvoj determinante po retku/stupcu.	2020-12-07	10:15:00	11:45:00	35	f	G1	f
2634	Vježbe	S32	1	Razvoj determinante po retku/stupcu.	2020-12-07	12:15:00	13:45:00	35	f	G2	f
2635	Predavanja	S32	0	Sarusovo pravilo.	2020-12-07	14:15:00	15:45:00	35	f		f
2636	Vježbe	S32	1	Izračunavanje inverza matrice.	2020-12-14	10:15:00	11:45:00	35	f	G1	f
2637	Vježbe	S32	1	Izračunavanje inverza matrice.	2020-12-14	12:15:00	13:45:00	35	f	G2	f
2638	Predavanja	S32	0	Matrične jednadžbe.	2020-12-14	14:15:00	15:45:00	35	f		f
2639	Vježbe	S32	1	Definicija i izračunavanje ranga matrice.	2020-12-21	10:15:00	11:45:00	35	f	G1	f
2640	Vježbe	S32	1	Definicija i izračunavanje ranga matrice.	2020-12-21	12:15:00	13:45:00	35	f	G2	f
2641	Predavanja	S32	0	2.  test - Sustav linearnih jednadžbi. Egzistencija rješenja.	2020-12-21	14:15:00	15:45:00	35	f		f
2642	Vježbe	S32	1	Rješavanje sustava linearnih jednadžbi Gaussovom metodom.	2020-01-11	10:15:00	11:45:00	35	f	G1	f
2643	Vježbe	S32	1	Rješavanje sustava linearnih jednadžbi Gaussovom metodom.	2020-01-11	12:15:00	13:45:00	35	f	G2	f
2644	Predavanja	S32	0	Sustavi linearnih nejednadžbi.	2020-01-11	14:15:00	15:45:00	35	f		f
2645	Vježbe	S32	1	Rješavanje sustava linearnih nejednadžbi.	2020-01-18	10:15:00	11:45:00	35	f	G1	f
2646	Vježbe	S32	1	Rješavanje sustava linearnih nejednadžbi.	2020-01-18	12:15:00	13:45:00	35	f	G2	f
2647	Predavanja	S32	0	2. kolokvij	2020-01-18	14:15:00	15:45:00	35	f		f
2648	Vježbe	S32	1	Rješavanje problemskih zadataka.	2020-01-25	10:15:00	11:45:00	35	f	G1	f
2649	Vježbe	S32	1	Rješavanje problemskih zadataka.	2020-01-25	12:15:00	13:45:00	35	f	G2	f
2650	Predavanja	S32	0	Popravni kolokvij	2020-01-25	14:15:00	15:45:00	35	f		f
2651	Predavanja	Online	0	Uvod. Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Osnove C++-a (varijable i dodjela, ulaz i izlaz, tipovi podataka i izrazi).	2020-10-07	08:15:00	10:00:00	36	f	\N	f
2652	Vježbe	O-366	1	Uvod. Predstavljanje, detaljno upoznavanje studenata s bodovima i obvezama. Upoznavanje sa sustavom Merlin. Upoznavanje s okruženjem za razvoj programa.	2020-10-09	12:15:00	16:00:00	36	f	\N	f
2653	Predavanja	O-28	0	Kontrola tijeka izvođenja programa: logički izrazi, naredba if-else.	2020-10-14	08:15:00	10:00:00	36	f	\N	f
2654	Vježbe	O-366	1	Dijagram tijeka i pseudokod. Tipovi podataka, ulaz, izlaz i varijable.	2020-10-16	12:15:00	16:00:00	36	f	\N	f
2655	Predavanja	Online	0	Jednostavnija uporaba petlji: while, do-while	2020-10-21	08:15:00	10:00:00	36	f	\N	f
2656	Vježbe	O-366	1	Logički izrazi. Grananje.	2020-10-23	12:15:00	16:00:00	36	f	\N	f
2903	Vježbe	366	1	Teorijski kolokvij	2020-12-10	10:15:00	11:45:00	44	f	G1	f
2657	Predavanja	O-28	0	Višestruko grananje u programu (ugniježđena if naredba, naredba switch).	2020-10-28	08:15:00	10:00:00	36	f	\N	f
2658	Predavanja	O-366	0	Višestruko grananje u programu.	2020-10-30	12:15:00	16:00:00	36	f	\N	f
2659	Predavanja	Online	0	Složenija uporaba petlji: while, do-while, for.	2020-11-04	08:15:00	10:00:00	36	f	\N	f
2660	Vježbe	O-366	1	Priprema za kolokvij	2020-11-06	12:15:00	16:00:00	36	f	\N	f
2661	Predavanja	O-28	0	Oblikovanje petlji (izlaz iz petlje, ugniježđene petlje, traženje greške u petlji).	2020-11-11	08:15:00	10:00:00	36	f	\N	f
2662	Vježbe	O-366	1	Kolokvij	2020-11-13	12:15:00	16:00:00	36	f	\N	f
2663	Predavanja	Online	0	Polje (array), Strukture. Niz (string). - online nadoknada od 18.11. -	2020-11-21	08:15:00	10:00:00	36	f	\N	f
2664	Vježbe	O-366	1	Petlje. Ugniježđivanje petlji.	2020-11-20	12:15:00	16:00:00	36	f	\N	f
2665	Predavanja	O-28	0	Funkcije: Funkcije koje vraćaju vrijednost, Pretvorba tipa.	2020-11-25	08:15:00	10:00:00	36	f	\N	f
2666	Vježbe	O-366	1	Polja i nizovi. Dvodimenzionalna polja. Strukture.	2020-11-27	12:15:00	16:00:00	36	f	\N	f
2667	Predavanja	Online	0	Priprema za kviz	2020-12-02	08:15:00	10:00:00	36	f	\N	f
2668	Vježbe	O-366	1	Prvi kviz	2020-12-04	12:15:00	16:00:00	36	f	\N	f
2669	Predavanja	O-28	0	Funkcije koje definira programer, proceduralna apstrakcija, lokalne varijable.	2020-12-09	08:15:00	10:00:00	36	f	\N	f
2670	Vježbe	Online	1	1. Laboratorijska vježba (online)	2020-12-11	12:15:00	16:00:00	36	f	\N	f
2671	Predavanja	O-28	0	Funkcije tipa void, prosljeđivanje vrijednosti referencom	2020-12-16	08:15:00	10:00:00	36	f	\N	f
2672	Vježbe	O-366	1	Funkcije koje vraćaju vrijednost. Testiranje funkcija, tehnike traženja grešaka.	2020-12-18	12:15:00	16:00:00	36	f	\N	f
2673	Predavanja	O-28	0	Polja u funkciji. Testiranje funkcija, tehnike traženja grešaka. Nadjačavanje funkcija.	2020-12-23	08:15:00	10:00:00	36	f	\N	f
2674	Vježbe	O-366	1	Funkcije tipa void, prosljeđivanje vrijednosti referencom.	2021-01-08	12:15:00	16:00:00	36	f	\N	f
2675	Predavanja	O-28	0	Datoteke	2021-01-13	08:15:00	10:00:00	36	f	\N	f
2676	Vježbe	Online	1	2. Laboratorijska vježba (online) (Rad sa datotekama)	2021-01-15	12:15:00	16:00:00	36	f	\N	f
2677	Predavanja	Online	0	Priprema za kviz	2021-01-20	08:15:00	10:00:00	36	f	\N	f
2678	Vježbe	O-366	1	Drugi kviz	2021-01-22	12:15:00	16:00:00	36	f	\N	f
2679	Predavanja	O-28	0	Nema predavanja (odrađeno 22.1.)	2021-01-27	08:15:00	10:00:00	36	f	\N	f
2680	Vježbe	O-366	1	Nadoknada	2021-01-29	12:15:00	16:00:00	36	f	\N	f
2681	Predavanja	O-028	0	Uvod u kolegij. Uvod u informatiku.	2020-10-06	12:00:00	13:00:00	37	f	\N	f
2682	Vježbe	O-366	1	Uvod u vježbe. Pregled alata za online izvođenje nastave.	2020-10-09	08:00:00	10:00:00	37	f	\N	f
2683	Predavanja	O-028	0	Povijesni pregled I. (općenito).	2020-10-13	08:00:00	10:00:00	37	f	\N	f
2684	Vježbe	O-366	1	Napredno oblikovanje teksta.	2020-10-16	08:00:00	10:00:00	37	f	\N	f
2685	Predavanja	O-028	0	Povijesni pregled II. (naglasak na operacijske sustave).	2020-10-20	08:00:00	10:00:00	37	f	\N	f
2686	Vježbe	O-366	1	Priprema sadržaja za prezentiranje. (1. DZ)	2020-10-23	08:00:00	10:00:00	37	f	\N	f
2687	Predavanja	O-028	0	Građa računala. (2. DZ - upute)	2020-10-27	08:00:00	10:00:00	37	f	\N	f
2688	Vježbe	O-366	1	Tablični kalkulatori I.	2020-10-30	08:00:00	10:00:00	37	f	\N	f
2689	Predavanja	online	0	Zapis brojeva u računalima.	2020-11-03	08:00:00	10:01:00	37	f	\N	f
2690	Vježbe	O-366	1	Tablični kalkulatori II. (3. DZ - upute)	2020-11-06	08:00:00	10:02:00	37	f	\N	f
2691	Predavanja	O-028	0	Uvod u teorijske osnove računarstva.	2020-11-10	08:00:00	10:04:00	37	f	\N	f
2692	Vježbe	online	1	Zapis brojeva u računalima.	2020-11-13	08:00:00	10:05:00	37	f	\N	f
2693	Predavanja	O-028/online	0	Konačni automati i regularni izrazi.	2020-11-17	08:00:00	10:06:00	37	f	\N	f
2694	Vježbe	online	1	Osnove automata i regularnih izraza.	2020-11-20	08:00:00	10:07:00	37	f	\N	f
2695	Predavanja	O-028	0	Pregled programskih jezika.	2020-11-24	08:00:00	10:08:00	37	f	\N	f
2696	Vježbe	O-366	1	KOLOKVIJ	2020-11-27	08:00:00	10:09:00	37	f	\N	f
2697	Predavanja	O-028	0	Python I.	2020-12-01	08:00:00	10:00:00	37	f	\N	f
2698	Vježbe	O-366	1	Uvod u Python. Sučelje, pisanje programa, osnovni tipovi i neke pripadne im funkcije. Standardni ulaz i izlaz. Grananje I ponavljanje naredbi.	2020-12-04	08:00:00	10:00:00	37	f	\N	f
2699	Predavanja	O-028	0	Python II.	2020-12-08	08:00:00	10:00:00	37	f	\N	f
2700	Vježbe	O-366	1	Regularni izrazi. I/O datoteke.	2020-12-11	08:00:00	10:00:00	37	f	\N	f
2701	Predavanja	O-028	0	Python III.	2020-12-15	08:00:00	10:00:00	37	f	\N	f
2702	Vježbe	O-366	1	Zbirke podataka u Pythonu.	2020-12-18	08:00:00	10:00:00	37	f	\N	f
2703	Predavanja	O-028	0	Python IV.	2020-12-22	08:00:00	10:00:00	37	f	\N	f
2704	Vježbe	O-366	1	Paket pandas i statistics.	2021-01-08	08:00:00	10:00:00	37	f	\N	f
2705	Predavanja	O-028	0	Licenciranje programske opreme.	2021-01-12	08:00:00	10:00:00	37	f	\N	f
2706	Vježbe	O-366	1	Paket matplotlib: vizualizacija, grafikoni i histogrami.	2021-01-15	08:00:00	10:00:00	37	f	\N	f
2707	Predavanja	O-028	0	Trendovi i smjerovi razvoja informacijsko-komunikacijske tehnologije.	2021-01-19	08:00:00	10:00:00	37	f	\N	f
2708	Vježbe	O-366	1	Izrada seminarskog rada.	2021-01-22	08:00:00	10:00:00	37	f	\N	f
2709	Predavanja	O-028	0	Predstavljanje projektnog zadatka.	2021-01-26	08:00:00	10:00:00	37	f	\N	f
2710	Vježbe	O-366	1	Predstavljane i analiza projektnog zadatka.	2021-01-29	08:00:00	10:00:00	37	f	\N	f
2711	Vježbe	O-366	1	Uvod u vježbe	2020-10-07	10:15:00	15:30:00	38	f	\N	f
2712	Predavanja	O-028	0	Uvod u predmet. Osnove multimedije	2020-10-07	14:15:00	15:45:00	38	f	\N	f
2713	Vježbe	O-366	1	HTML - osnovni elementi	2020-10-14	10:15:00	15:30:00	38	f	\N	f
2714	Predavanja	online	0	Uvod u WWW, HTML, CSS (1. dio)	2020-10-14	14:15:00	15:45:00	38	f	\N	f
2715	Vježbe	online	1	CSS - uređenje HTML elemenata (1. dio)	2020-10-21	10:15:00	13:45:00	38	f	\N	f
2716	Predavanja	online	0	Uvod u WWW, HTML, CSS (2. dio)	2020-10-21	14:15:00	15:45:00	38	f	\N	f
2717	Vježbe	O-366	1	CSS - uređenje HTML elemenata (2. dio)	2020-10-28	10:15:00	15:30:00	38	f	\N	f
2718	Predavanja	O-028	0	Grafika (1.dio)	2020-10-28	14:15:00	15:45:00	38	f	\N	f
2719	Vježbe	O-366	1	Obrada slike (1.dio)	2020-11-04	10:15:00	15:30:00	38	f	\N	f
2720	Predavanja	online	0	Grafika (2.dio)	2020-11-04	14:15:00	15:45:00	38	f	\N	f
2721	Vježbe	online	1	Obrada slike (2.dio)	2020-11-11	10:15:00	13:45:00	38	f	\N	f
2722	Predavanja	online	0	Zvuk, Animacija, Video	2020-11-11	14:15:00	15:45:00	38	f	\N	f
2723	Vježbe	online	1	Vektorsko crtanje	2020-11-25	10:15:00	13:45:00	38	f	\N	f
2724	Predavanja	O-028	0	Tekst, tipografija	2020-11-26	14:15:00	15:45:00	38	f	\N	f
2725	Vježbe	O-366	1	Obrada videa	2020-12-02	10:15:00	15:30:00	38	f	\N	f
2726	Predavanja	O-028	0	Osnove web dizajna	2020-12-02	14:15:00	15:45:00	38	f	\N	f
2727	Vježbe	online	1	Uključivanje multimedije na web	2020-12-09	10:15:00	13:45:00	38	f	\N	f
2728	Predavanja	O-028	0	Responzivni web dizajn (RWD)	2020-12-09	14:15:00	15:45:00	38	f	\N	f
2729	Vježbe	O-366	1	1. kolokvij	2020-12-16	10:15:00	15:30:00	38	f	\N	f
2730	Predavanja	O-028	0	Dizajniranje weba za poslovanje	2020-12-16	14:15:00	15:45:00	38	f	\N	f
2731	Vježbe	O-366	1	Izrada skice layouta weba	2020-12-23	10:15:00	15:30:00	38	f	\N	f
2732	Predavanja	online	0	Izrada wiki analize web sjediša	2020-12-23	14:15:00	15:45:00	38	f	\N	f
2733	Vježbe	O-366	1	Izrada responzivnog web sjedišta (1. dio)	2021-01-13	10:15:00	15:30:00	38	f	\N	f
2734	Predavanja	online	0	Izrada wiki analize web sjedišta	2021-01-13	14:15:00	15:45:00	38	f	\N	f
2735	Vježbe	online	1	Izrada responzivnog web sjedišta (2. dio)	2021-01-20	10:15:00	13:45:00	38	f	\N	f
2736	Predavanja	online	0	Izrada wiki analize web sjedišta	2021-01-20	14:15:00	15:45:00	38	f	\N	f
2737	Vježbe	online	1	Dovršavanje i objava web sjedišta na web serveru	2021-01-27	10:15:00	13:45:00	38	f	\N	f
2738	Predavanja	O-028	0	Upute za izradu web sjedišta	2021-01-27	14:15:00	15:45:00	38	f	\N	f
2739	Predavanja	028	0	Uvodno o ekonomiji i problematici ekonomskih istraživanja	2020-10-06	16:15:00	18:00:00	39	f	\N	f
2740	Vježbe	S32	1	Uvodno upoznavanje sa slučajevima za izučavanje - seminarskim temama te formiranje grupa i raspodjela tema	2020-10-05	16:15:00	18:01:00	39	f	\N	f
2741	Predavanja	028	0	Temelji i razvoj ekonomske znanosti i teorije, te povijesni prikaz međuodnosa ekonomije i društava	2020-10-13	16:15:00	18:02:00	39	f	\N	f
2742	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-10-12	16:15:00	18:03:00	39	f	\N	f
2743	Predavanja	Online	0	Osnovne ekonomske zakonitosti	2020-10-20	16:15:00	18:04:00	39	f	\N	f
2744	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-10-19	16:15:00	18:05:00	39	f	\N	f
2745	Predavanja	028	0	Mikro i makro ekonomija	2020-10-27	16:15:00	18:06:00	39	f	\N	f
2746	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-10-26	16:15:00	18:07:00	39	f	\N	f
2747	Predavanja	Online	0	Odnos gospodarstva i države, te osnove političke ekonomije	2020-11-03	16:15:00	18:08:00	39	f	\N	f
2748	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-11-02	16:15:00	18:09:00	39	f	\N	f
2749	Predavanja	028	0	Zakonitosti ponude i potražnje	2020-11-10	16:15:00	18:10:00	39	f	\N	f
2750	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-11-09	16:15:00	18:11:00	39	f	\N	f
2751	Predavanja	028	0	Pisanje I. kolokvija	2020-11-17	16:15:00	18:12:00	39	f	\N	f
2752	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-11-16	16:15:00	18:13:00	39	f	\N	f
2753	Predavanja	Online	0	Poduzeće kao temeljni gospodarski subjekt. Nadnice i tržište rada	2020-11-24	16:15:00	18:14:00	39	f	\N	f
2754	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-11-23	16:15:00	18:15:00	39	f	\N	f
2755	Predavanja	028	0	Potrošnja i investicije	2020-12-01	16:15:00	18:16:00	39	f	\N	f
2756	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-11-30	16:15:00	18:17:00	39	f	\N	f
2757	Predavanja	Online	0	Osnove agregatne ponude i potražnje	2020-12-08	16:15:00	18:18:00	39	f	\N	f
2758	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-12-07	16:15:00	18:19:00	39	f	\N	f
2759	Predavanja	028	0	Novac i osnove poslovnog bankarstva	2020-12-15	16:15:00	18:20:00	39	f	\N	f
2760	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-12-14	16:15:00	18:21:00	39	f	\N	f
2761	Predavanja	Online	0	Ekonomski fenomeni	2020-12-22	16:15:00	18:22:00	39	f	\N	f
2762	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2020-12-21	16:15:00	18:23:00	39	f	\N	f
2763	Predavanja	028	0	Pisanje II. kolokvija	2021-01-12	16:15:00	18:24:00	39	f	\N	f
2764	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2021-01-11	16:15:00	18:25:00	39	f	\N	f
2765	Predavanja	Online	0	Strateško i operativno planiranje te poslovni planovi	2021-01-19	16:15:00	18:26:00	39	f	\N	f
2766	Vježbe	Online	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2021-01-18	16:15:00	18:27:00	39	f	\N	f
2767	Predavanja	028	0	Menadžment, strateško planiranje i upravljanje razvojem usluga	2021-01-26	16:15:00	18:28:00	39	f	\N	f
2768	Vježbe	S32	1	Prezentacija, analiza i diskusija zadane teme po grupama ili individualno	2021-01-25	16:15:00	18:29:00	39	f	\N	f
2769	Predavanja	O-028	0	Introduction to the course. Computer Architecture (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Simple and Present Continuous)	2020-10-06	14:15:00	15:45:00	40	f		f
2770	Vježbe	S-32	1	Introduction to the course. Computer Architecture (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Simple and Present Continuous)	2020-10-09	12:15:00	13:45:00	40	f	G1	f
2771	Vježbe	S-32	1	Introduction to the course. Computer Architecture (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Simple and Present Continuous)	2020-10-09	14:15:00	15:45:00	40	f	G2	f
2772	Predavanja	O-028	0	Computer Applications (vocabulary acquistion, disussion, listening and reading comprehension, writing, Past Simple and Past Continuous) Odabir teme prezentacije.	2020-10-13	14:15:00	15:45:00	40	f		f
2773	Vježbe	S-32	1	Computer Applications (vocabulary acquistion, disussion, listening and reading comprehension, writing, Past Simple and Past Continuous) Odabir teme prezentacije.	2020-10-16	12:15:00	13:45:00	40	f	G1	f
2774	Vježbe	S-32	1	Computer Applications (vocabulary acquistion, disussion, listening and reading comprehension, writing, Past Simple and Past Continuous) Odabir teme prezentacije.	2020-10-16	14:15:00	15:45:00	40	f	G2	f
2775	Predavanja	online	0	Applications Programs (vocabulary acquistion, disussion, listening and reading comprehension, writing, Articles)	2020-10-20	14:15:00	15:45:00	40	f		f
2776	Predavanja	online	0	Academic reading, writing and presenting Odabir teme eseja.	2020-10-27	12:15:00	13:45:00	40	f	G1	f
2777	Predavanja	online	0	Academic reading, writing and presenting Odabir teme eseja.	2020-10-27	14:15:00	15:45:00	40	f	G2	f
2778	Vježbe	S-32	1	Academic reading, writing and presenting Odabir teme eseja.	2020-10-30	12:15:00	13:45:00	40	f	G1	f
2779	Vježbe	S-32	1	Academic reading, writing and presenting Odabir teme eseja.	2020-10-30	14:15:00	15:45:00	40	f	G2	f
2780	Predavanja	O-028	0	Operating Systems. (vocabulary acquistion, disussion, listening and reading comprehension, writing, Conditionals)	2020-11-03	14:15:00	15:45:00	40	f		f
2781	Predavanja	O-028	0	Networks. (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2020-11-10	14:15:00	15:45:00	40	f		f
2782	Vježbe	online	1	Networks. (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2020-11-13	12:15:00	15:45:00	40	f		f
2783	Predavanja	O-028	0	People in Computing. (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2020-11-17	14:15:00	15:45:00	40	f		f
2784	Vježbe	online	1	People in Computing. (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2020-11-20	12:15:00	15:45:00	40	f		f
2785	Predavanja	online	0	Computer Users. (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Perfect and Past Simple)	2020-11-24	14:15:00	15:45:00	40	f		f
2786	Vježbe	S-32	1	Computer Users. (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Perfect and Past Simple)	2020-11-27	12:15:00	13:45:00	40	f	G1	f
2787	Vježbe	S-32	1	Computer Users. (vocabulary acquistion, disussion, listening and reading comprehension, writing, Present Perfect and Past Simple)	2020-11-27	14:15:00	15:45:00	40	f	G2	f
2788	Vježbe	S-32	1	Kolokvij	2020-12-04	12:15:00	13:45:00	40	f	G1	f
2789	Vježbe	S-32	1	Kolokvij	2020-12-04	14:15:00	15:45:00	40	f	G2	f
2790	Predavanja	online	0	The World Wide Web	2020-12-08	14:15:00	15:45:00	40	f		f
2791	Vježbe	S-32	1	(vocabulary acquistion, disussion, listening and reading comprehension, writing, Future tenses) Obvezna predaja eseja.	2020-12-11	12:15:00	13:45:00	40	f	G1	f
2792	Vježbe	S-32	1	(vocabulary acquistion, disussion, listening and reading comprehension, writing, Future tenses) Obvezna predaja eseja.	2020-12-11	14:15:00	15:45:00	40	f	G2	f
2793	Predavanja	O-028	0	Websites (vocabulary acquistion, disussion, listening and reading comprehension, writing, The Passive)	2020-12-15	14:15:00	15:45:00	40	f		f
2794	Vježbe	online	1	Websites (vocabulary acquistion, disussion, listening and reading comprehension, writing, The Passive)	2020-12-18	12:15:00	15:45:00	40	f		f
2795	Predavanja	online	0	Communications Systems (vocabulary acquistion, disussion, listening and reading comprehension, writing, Reported Speech)	2020-12-22	14:15:00	15:45:00	40	f		f
2796	Vježbe	online	1	Communications Systems (vocabulary acquistion, disussion, listening and reading comprehension, writing, Reported Speech)	2021-01-08	12:15:00	15:45:00	40	f		f
2859	Predavanja	O-028	0	Preporuke i konvencije	2020-11-20	10:15:00	11:45:00	43	f	\N	f
2797	Predavanja	O-028	0	Computing Support (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2021-01-12	14:15:00	15:45:00	40	f		f
2798	Vježbe	S-32	1	Computing Support (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2021-01-15	12:15:00	13:45:00	40	f	G1	f
2799	Vježbe	S-32	1	Computing Support (vocabulary acquistion, disussion, listening and reading comprehension, writing, grammar revision)	2021-01-15	14:15:00	15:45:00	40	f	G2	f
2800	Vježbe	online	1	Revision	2021-01-22	12:15:00	15:45:00	40	f		f
2801	Predavanja	O-028	0	Zaključna razmatranja, evaluacija kolegija	2021-01-26	14:15:00	15:45:00	40	f	G1	f
2802	Vježbe	S-32	1	Popravni kolokvij	2021-01-29	12:15:00	13:45:00	40	f	G2	f
2803	Vježbe	S-32	1	Popravni kolokvij	2021-01-29	14:15:00	15:45:00	40	f		f
2804	Predavanja	O-028	0	Uvod u kolegij. Pojam derivacije funkcije jedne realne varijable.	2020-10-05	10:15:00	11:45:00	42	f		f
2805	Vježbe	O-028	1	Derivacije funkcije jedne realne varijable. Pravila deriviranja	2020-10-05	14:15:00	15:45:00	42	f	G1	f
2806	Vježbe	O-028	1	Derivacije funkcije jedne realne varijable. Pravila deriviranja	2020-10-05	16:15:00	17:45:00	42	f	G2	f
2807	Predavanja	O-028	0	Pravila deriviranja. Derivacije višeg reda.	2020-10-12	10:15:00	11:45:00	42	f		f
2808	Vježbe	O-028	1	Pravila deriviranja. Derivacije višeg reda.	2020-10-12	14:15:00	15:45:00	42	f	G1	f
2809	Vježbe	O-028	1	Pravila deriviranja. Derivacije višeg reda.	2020-10-12	16:15:00	17:45:00	42	f	G2	f
2810	Predavanja	O-028	0	Deriviranje parametarski zadane funkcije. L'Hospitalovo pravilo.	2020-10-19	10:15:00	11:45:00	42	f		f
2811	Vježbe	O-028	1	Deriviranje parametarski zadane funkcije. L'Hospitalovo pravilo.	2020-10-19	14:15:00	15:45:00	42	f	G1	f
2812	Vježbe	O-028	1	Deriviranje parametarski zadane funkcije. L'Hospitalovo pravilo.	2020-10-19	16:15:00	17:45:00	42	f	G2	f
2813	Predavanja	O-028	0	Osnovni teoremi diferencijalnog računa.	2020-10-26	10:15:00	11:45:00	42	f		f
2814	Vježbe	O-028	1	Diferencijalni račun.	2020-10-26	14:15:00	15:45:00	42	f	G1	f
2815	Vježbe	O-028	1	Diferencijalni račun.	2020-10-26	16:15:00	17:45:00	42	f	G2	f
2816	Predavanja	O-028	0	Crtanje grafa funkcije.	2020-11-02	10:15:00	11:45:00	42	f		f
2817	Vježbe	O-028	1	Crtanje grafa funkcije.	2020-11-02	14:15:00	15:45:00	42	f	G1	f
2818	Vježbe	O-028	1	Crtanje grafa funkcije.	2020-11-02	16:15:00	17:45:00	42	f	G2	f
2819	Predavanja	O-028	0	Crtanje grafa funkcije.	2020-11-09	10:15:00	11:45:00	42	f		f
2820	Vježbe	O-028	1	Crtanje grafa funkcije.	2020-11-09	14:15:00	15:45:00	42	f	G1	f
2821	Vježbe	O-028	1	Crtanje grafa funkcije.	2020-11-09	16:15:00	17:45:00	42	f	G2	f
2822	Predavanja	O-028	0	Primitivna funkcija i neodređeni integral.	2020-11-16	10:15:00	11:45:00	42	f		f
2823	Vježbe	O-028	1	1. kolokvij	2020-11-16	14:15:00	15:45:00	42	f	G1	f
2824	Vježbe	O-028	1	1. kolokvij	2020-11-16	16:15:00	17:45:00	42	f	G2	f
2825	Vježbe	O-028	1	Primitivna funkcija i neodređeni integral.	2020-11-23	14:15:00	15:45:00	42	f	G1	f
2826	Vježbe	O-028	1	Primitivna funkcija i neodređeni integral.	2020-11-23	16:15:00	17:45:00	42	f	G2	f
2827	Predavanja	O-028	0	Određeni integral. Računanje određenog integrala.	2020-11-30	10:15:00	11:45:00	42	f		f
2828	Vježbe	O-028	1	Osnovne metode integracije. Određeni integral. Računanje određenog integrala.	2020-11-30	14:15:00	15:45:00	42	f	G1	f
2829	Vježbe	O-028	1	Osnovne metode integracije. Određeni integral. Računanje određenog integrala.	2020-11-30	16:15:00	17:45:00	42	f	G2	f
2830	Predavanja	O-028	0	Primjena integrala na računanje površina i volumena.	2020-12-07	10:15:00	11:45:00	42	f		f
2831	Vježbe	O-028	1	Primjena integrala na računanje površina i volumena.	2020-12-07	14:15:00	15:45:00	42	f	G1	f
2832	Vježbe	O-028	1	Primjena integrala na računanje površina i volumena.	2020-12-07	16:15:00	17:45:00	42	f	G2	f
2833	Predavanja	O-028	0	Pojam derivacije funkcije više varijabli.	2020-12-14	10:15:00	11:45:00	42	f		f
2834	Vježbe	O-028	1	Derivacije funkcije više varijabli.	2020-12-14	14:15:00	15:45:00	42	f	G1	f
2835	Vježbe	O-028	1	Derivacije funkcije više varijabli.	2020-12-14	16:15:00	17:45:00	42	f	G2	f
2836	Predavanja	O-028	0	Diferencijal i parcijalne derivacije.	2020-12-21	10:15:00	11:45:00	42	f		f
2837	Vježbe	O-028	1	Diferencijal i parcijalne derivacije. Gradijent	2020-12-21	14:15:00	15:45:00	42	f	G1	f
2838	Vježbe	O-028	1	Diferencijal i parcijalne derivacije. Gradijent	2020-12-21	16:15:00	17:45:00	42	f	G2	f
2839	Predavanja	O-028	0	Gradijent. Tangencijalna ravnina.	2021-01-11	10:15:00	11:45:00	42	f		f
2840	Vježbe	O-028	1	Tangencijalna ravnina. Lokalni i uvjetni ekstremi.	2021-01-11	14:15:00	15:45:00	42	f	G1	f
2841	Vježbe	O-028	1	Tangencijalna ravnina. Lokalni i uvjetni ekstremi.	2021-01-11	16:15:00	17:45:00	42	f	G2	f
2842	Predavanja	O-028	0	Lokalni i uvjetni ekstremi.	2021-01-18	10:15:00	11:45:00	42	f		f
2843	Vježbe	O-028	1	2. kolokvij	2021-01-18	14:15:00	15:45:00	42	f	G1	f
2844	Vježbe	O-028	1	2. kolokvij	2021-01-18	16:15:00	17:45:00	42	f	G2	f
2845	Vježbe	online	1	Vježbe na računalu	2021-01-25	14:15:00	15:45:00	42	f	G1	f
2846	Vježbe	online	1	Vježbe na računalu	2021-01-25	16:15:00	17:45:00	42	f	G2	f
2847	Predavanja	O-028	0	Uvod u kolegij, osnovni koncepti	2020-10-09	10:15:00	11:45:00	43	f	\N	f
2848	Vježbe	O-028	1	Uvod u kolegij, osnovni koncepti	2020-10-09	12:15:00	13:45:00	43	f	\N	f
2849	Predavanja	O-028	0	Sustavni pristup, metoda SAS	2020-10-16	10:15:00	11:45:00	43	f	\N	f
2850	Vježbe	O-028	1	Osnovni koncepti - primjeri	2020-10-16	12:15:00	13:45:00	43	f	\N	f
2851	Predavanja	Online	0	Dekompozicija	2020-10-23	10:15:00	11:45:00	43	f	\N	f
2852	Vježbe	O-028	1	Dekompozicija - primjeri	2020-10-23	12:15:00	13:45:00	43	f	\N	f
2853	Predavanja	Online	0	DTP	2020-10-30	10:15:00	11:45:00	43	f	\N	f
2854	Vježbe	O-028	1	Primjeri DTP	2020-10-30	12:15:00	13:45:00	43	f	\N	f
2855	Predavanja	Online	0	Samoprovjera	2020-11-06	10:15:00	11:45:00	43	f	\N	f
2856	Vježbe	Online	1	Primjeri DTP	2020-11-06	12:15:00	13:45:00	43	f	\N	f
2857	Predavanja	O-028	0	Balans	2020-11-13	10:15:00	11:45:00	43	f	\N	f
2858	Vježbe	O-028	1	Balans, crtanje DTP	2020-11-13	12:15:00	13:45:00	43	f	\N	f
2860	Vježbe	O-028	1	UML, BPMN, primjeri	2020-11-20	12:15:00	13:45:00	43	f	\N	f
2861	Predavanja	Online	0	Samoprovjera	2020-11-27	10:15:00	11:45:00	43	f	\N	f
2862	Vježbe	O-028	1	Projektni zadatak	2020-11-27	12:15:00	13:45:00	43	f	\N	f
2863	Predavanja	O-028	0	Ograničenja	2020-12-04	10:15:00	11:45:00	43	f	\N	f
2864	Vježbe	O-028	1	Ograničenja	2020-12-04	12:15:00	13:45:00	43	f	\N	f
2865	Predavanja	Online	0	Proces modeliranja procesa	2020-12-11	10:15:00	11:45:00	43	f	\N	f
2866	Vježbe	O-028	1	Projektni zadatak - prikaz rješenja i rezultata	2020-12-11	12:15:00	13:45:00	43	f	\N	f
2867	Predavanja	Online	0	Samoprovjera	2020-12-18	10:15:00	11:45:00	43	f	\N	f
2868	Vježbe	O-028	1	Projektni zadatak	2020-12-18	12:15:00	13:45:00	43	f	\N	f
2869	Predavanja	O-028	0	Ponavljanje	2021-01-08	10:15:00	11:45:00	43	f	\N	f
2870	Vježbe	O-028	1	Projektni zadatak - prikaz rješenja i rezultata	2021-01-08	12:15:00	13:45:00	43	f	\N	f
2871	Predavanja	Online	0	Reinženjering poslovnih procesa	2021-01-15	10:15:00	11:45:00	43	f	\N	f
2872	Vježbe	O-028	1	Kolokvij	2021-01-15	12:15:00	13:45:00	43	f	\N	f
2873	Predavanja	O-028	0	Priprema za završni ispit - ponavljanje, konzultacije	2021-01-22	10:15:00	11:45:00	43	f	\N	f
2874	Vježbe	O-028	1	Priprema za završni - ponavljanje, konzultacije	2021-01-22	12:15:00	13:45:00	43	f	\N	f
2875	Predavanja	O-028	0	Analiza studentskih rezultata	2021-01-29	10:15:00	11:45:00	43	f	\N	f
2876	Vježbe	O-028	1	Popravni kolokvij	2021-01-29	10:15:00	11:45:00	43	f	\N	f
2877	Predavanja	28	0	Uvod u predmet, objektni pristup	2020-10-06	08:15:00	09:45:00	44	f		f
2878	Vježbe	Online	1	Obveze pri vježbama, definiranje potrebnog predznanja, software	2020-10-08	10:15:00	13:45:00	44	f		f
2879	Predavanja	28	0	Klase, privatni atributi i metode, poziv klase	2020-10-13	08:15:00	09:45:00	44	f		f
2880	Vježbe	366	1	Objektni pristup, klase, privatni atributi i metode, poziv klase	2020-10-15	10:15:00	11:45:00	44	f	G1	f
2881	Vježbe	366	1	Objektni pristup, klase, privatni atributi i metode, poziv klase	2020-10-15	12:15:00	13:45:00	44	f	G2	f
2882	Predavanja	28	0	Konstruktori, destruktori, preopterećivanje	2020-10-20	08:15:00	09:45:00	44	f		f
2883	Vježbe	366	1	Konstruktori, destruktori, preopterećivanje	2020-10-22	10:15:00	11:45:00	44	f	G1	f
2884	Vježbe	366	1	Konstruktori, destruktori, preopterećivanje	2020-10-22	12:15:00	13:45:00	44	f	G2	f
2885	Predavanja	28	0	OOM, UML	2020-10-27	08:15:00	09:45:00	44	f		f
2886	Vježbe	366/Online	1	Alat za modeliranje, projekti, dijagrami	2020-10-29	10:15:00	11:45:00	44	f		f
2887	Predavanja	28	0	Dijagram klasa, dijagram objekata	2020-11-03	08:15:00	09:45:00	44	f		f
2888	Vježbe	366	1	Dijagram klasa, dijagram objekata	2020-11-05	10:15:00	11:45:00	44	f	G1	f
2889	Vježbe	366	1	Dijagram klasa, dijagram objekata	2020-11-05	12:15:00	13:45:00	44	f	G2	f
2890	Predavanja	028/Online	0	Niz klasa, dinamička def. klasa, this, složene klase.	2020-11-10	08:15:00	09:45:00	44	f		f
2891	Vježbe	366	1	Niz klasa, dinamička def. klasa, this, složene klase.	2020-11-12	10:15:00	11:45:00	44	f	G1	f
2892	Vježbe	366	1	Niz klasa, dinamička def. klasa, this, složene klase.	2020-11-12	12:15:00	13:45:00	44	f	G2	f
2893	Predavanja	028/Online	0	Predlošci i vektori, copy konstruktor, ref. Na klasu	2020-11-17	08:15:00	09:45:00	44	f		f
2894	Vježbe	366	1	Predlošci i vektori, copy konstruktor, ref. na klasu	2020-11-19	10:15:00	11:45:00	44	f	G1	f
2895	Vježbe	366	1	Predlošci i vektori, copy konstruktor, ref. na klasu	2020-11-19	12:15:00	13:45:00	44	f	G2	f
2896	Predavanja	028/Online	0	Dijagram aktivnosti i dijagram stanja	2020-11-24	08:15:00	09:45:00	44	f		f
1974	Vježbe	O-366	1	Postavljanje okoline za razvoj softvera. Modularizacija, dokumentiranje, testiranje i mjerenje vremena izvođenja programskog koda	2020-10-08	16:15:00	17:45:00	5	f	\N	f
1975	Predavanja	O-358	0	Klijent-server modeli	2020-10-13	12:15:00	13:45:00	5	f	\N	f
1976	Vježbe	O-366	1	Python moduli numpy i scripy	2020-10-15	16:15:00	17:45:00	5	f	\N	f
1977	Predavanja	online	0	Komunikacija u distribuiranim sustavima: OSI model, ATM model, klijent-server model	2020-10-20	12:15:00	13:45:00	5	f	\N	f
1978	Vježbe	O-366	1	Python modul mpi4py: komunikacija točka-do-točke	2020-10-22	16:15:00	17:45:00	5	f	\N	f
1979	Predavanja	online	0	Komunikacija u distribuiranim sustavima: poziv procedure na daljinu, objekti, komunikacija porukama	2020-10-27	12:15:00	13:45:00	5	f	\N	f
1980	Vježbe	O-366	1	Primjene komunikacije točka-do- točke	2020-10-29	16:15:00	17:45:00	5	f	\N	f
1981	Predavanja	online	0	Sinkronizacija: sinkronizacija sata, algoritmi za odabir	2020-11-03	12:15:00	13:45:00	5	f	\N	f
1982	Vježbe	O-366	1	Python modul mpi4py: kolektivna komunikacija	2020-11-05	16:15:00	17:45:00	5	f	\N	f
1983	Predavanja	online	0	Sinkronizacija: mutual exclusion, distribuirane transakcije	2020-11-10	12:15:00	13:45:00	5	f	\N	f
1984	Vježbe	O-366	1	Primjene kolektivne komunikacije	2020-11-12	16:15:00	17:45:00	5	f	\N	f
1985	Predavanja	online	0	Procesi: izvođenje na klijentu i serveru	2020-11-17	12:15:00	13:45:00	5	f	\N	f
1986	Vježbe	O-366	1	Python modul mpi4py: komunikatori i grupe, dinamičko upravljanje procesima, jednostrana komunikacija, paralelni ulaz/izlaz i upravljanje okolinom	2020-11-19	16:15:00	17:45:00	5	f	\N	f
1987	Vježbe	O-366	1	Distribuirani sustav za upravljanje verzijama Git	2020-11-26	16:15:00	17:45:00	5	f	\N	f
1988	Predavanja	online	0	Procesi: migracija koda, softverski agenti	2020-12-01	12:15:00	13:45:00	5	f	\N	f
1989	Predavanja	online	0	Konzistentnost i replike: distribuirani protokoli, protokoli, konzistentnosti	2020-12-08	12:15:00	13:45:00	5	f	\N	f
1990	Vježbe	online	1	Objava ponuđenih tema projekata	2020-12-10	16:15:00	17:45:00	5	f	\N	f
1991	Vježbe	O-366	1	Python modul zmq: osnove asinkrone komunikacije	2020-12-10	16:15:00	17:45:00	5	f	\N	f
1992	Predavanja	online	0	Oporavak u slučaju grešaka: pouzdanost klijent-server, komunikacije, pouzdanost, komunikacije u grupi, oporavak	2020-12-15	12:15:00	13:45:00	5	f	\N	f
1993	Vježbe	O-366	1	Python modul zmq: utičnice i uzorci poručivanja	2020-12-17	16:15:00	17:45:00	5	f	\N	f
1994	Predavanja	online	0	Sigurnost: sigurnosni kanali, kontrola pristupa, upravljanje sigurnošću	2020-12-22	12:15:00	13:45:00	5	f	\N	f
2985	Vježbe	359	1	Modeli logističkih sustava	2021-03-25	11:45:00	13:15:00	16	f	\N	f
1995	Vježbe	O-366	1	Python modul zmq: složeniji uzorci poručivanja tipa zahtjev-odgovor	2021-01-07	16:15:00	17:45:00	5	f	\N	f
1996	Predavanja	online	0	Primjeri izvođenja algoritama na distribuiranim sustavima	2021-01-12	12:15:00	13:45:00	5	f	\N	f
1997	Vježbe	O-366	1	Python modul zmq: pouzdani uzorci poručivanja tipa zahtjev- odgovor	2021-01-14	16:15:00	17:45:00	5	f	\N	f
1998	Predavanja	online	0	Primjeri izvođenja algoritama na distribuiranim sustavima	2021-01-19	12:15:00	13:45:00	5	f	\N	f
1999	Vježbe	O-366	1	Izvođenje distribuiranih programa na superračunalu	2021-01-28	16:15:00	17:45:00	5	f	\N	f
2000	Predavanja	O-S32	0	Opće informacije, Obveze studenata, Software. Temeljni elementi jezika. Usporedba Java i C++. Java aplikacije.	2020-10-07	12:15:00	14:00:00	6	f	\N	f
2001	Vježbe	online	1	Rad u Java IDE, Izrada Java projekata, Usporedba Java i C++	2020-10-08	14:15:00	15:45:00	6	f	\N	f
2002	Predavanja	O-S32	0	Definiranje i uporaba klasa, Objekti, Konstruktori, Apstraktne klase, Nasljeđivanje. Iznimke i obrada iznimaka	2020-10-14	12:15:00	14:00:00	6	f	\N	f
2003	Vježbe	O-366	1	Definiranje i uporaba klasa, Objekti, Konstruktori, Apstraktne klase, Nasljeđivanje. Iznimke	2020-10-15	14:15:00	15:45:00	6	f	\N	f
2004	Predavanja	O-S32	0	Bibiloteke klasa. Paketi java.lang, java.util, java.io, java.text (Math, Arrays, Scanner, String, Vector)	2020-10-21	12:15:00	14:00:00	6	f	\N	f
2005	Vježbe	O-366	1	Bibiloteke klasa. Paketi java.lang, java.util, java.io, java.text (Math, Arrays, Scanner, String, Vector)	2020-10-22	14:15:00	15:45:00	6	f	\N	f
2006	Predavanja	O-366	0	Java Forme, Grafička sučelja, Likovi, Stilizirani tekst. Dodavanje slika i zvuka. Programske niti.	2020-10-28	12:15:00	14:00:00	6	f	\N	f
2007	Vježbe	O-366	1	Java Forme, Grafička sučelja, Likovi, Stilizirani tekst. Dodavanje slika i zvuka. Programske niti. Animacija	2020-10-29	14:15:00	15:45:00	6	f	\N	f
2008	Predavanja	online	0	Korisnička sučelja, Tekstualna polja, Izbornici, Liste. Swing komponente.	2020-11-04	12:15:00	14:00:00	6	f	\N	f
2009	Vježbe	online	1	Korisnička sučelja, Tekstualna polja, Izbornici, Liste. Swing komponente.	2020-11-05	14:15:00	15:45:00	6	f	\N	f
2010	Predavanja	O-S32	0	Događaji i upravljanje događajima na korisničkom sučelju	2020-11-11	12:15:00	14:00:00	6	f	\N	f
2011	Vježbe	O-366	1	Događaji i upravljanje događajima na korisničkom sučelju	2020-11-12	14:15:00	15:45:00	6	f	\N	f
2012	Predavanja	online	0	Veza Java - SQL	2020-11-25	12:15:00	13:45:00	6	f	\N	f
2013	Vježbe	O-366	1	Veza Java - SQL	2020-11-26	14:15:00	15:45:00	6	f	\N	f
2014	Predavanja	online	0	Model-View-Controller obrasci dizajna, Projektni zadaci	2020-12-02	12:15:00	14:00:00	6	f	\N	f
2015	Vježbe	online	1	AndroidStudio i uvod u mobilne aplikacije	2020-12-03	14:15:00	15:45:00	6	f	\N	f
2016	Predavanja	online	0	Uvod u mobilne aplikacije (Activities, Intents, Events)	2020-12-09	12:15:00	14:00:00	6	f	\N	f
2017	Vježbe	O-366	1	Izrada Android aplikacije (Activities, Intents, Events)	2020-12-10	14:15:00	15:45:00	6	f	\N	f
2905	Predavanja	028/Online	0	Apstraktne klase, polimorfizam, virtualne klase	2020-12-15	08:15:00	09:45:00	44	f		f
2906	Vježbe	366	1	Praktični kolokvij	2020-12-17	10:15:00	11:45:00	44	f	G1	f
2907	Vježbe	366	1	Praktični kolokvij	2020-12-17	12:15:00	13:45:00	44	f	G2	f
2908	Predavanja	028/Online	0	Predlošci funkcija i klasa. Preopterećivanje operatora.	2020-12-22	08:15:00	09:45:00	44	f		f
2909	Predavanja	028/Online	0	STL kontejneri. STL iteratori i STL algorithm	2021-01-12	08:15:00	09:45:00	44	f		f
2910	Vježbe	366	1	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2021-01-14	10:15:00	11:45:00	44	f	G1	f
2911	Vježbe	366	1	Nasljeđivanje, nadjačavanje i višestruko nasljeđivanje.	2021-01-14	12:15:00	13:45:00	44	f	G2	f
2912	Predavanja	Online	0	Praktikum, definiranje projektnih zadataka	2021-01-19	08:15:00	09:45:00	44	f		f
2913	Vježbe	366	1	Apstraktne klase, polimorfizam, virtualne klase; STL	2021-01-21	10:15:00	11:45:00	44	f	G1	f
2914	Vježbe	366	1	Apstraktne klase, polimorfizam, virtualne klase; STL	2021-01-21	12:15:00	13:45:00	44	f	G2	f
2915	Predavanja	Online	0	Predstavljanje i analiza projektnih zadataka	2021-01-26	08:15:00	09:45:00	44	f		f
2916	Vježbe	366	1	Predlošci funkcija i klasa. Preopterećivanje operatora.	2021-01-28	10:15:00	11:45:00	44	f	G1	f
2917	Vježbe	366	1	Predlošci funkcija i klasa. Preopterećivanje operatora.	2021-01-28	12:15:00	13:45:00	44	f	G2	f
2918	Predavanja	O-028	0	Uvodne informacije o kolegiju. Osnovni pojmovi računalnih mreža i interneta. Rub i jezgra mreže.	2020-10-06	10:15:00	11:45:00	45	f	\N	f
2919	Vježbe	O-350	1	Priprema radne okoline za vježbe na računalima studenata	2020-10-09	14:15:00	17:45:00	45	f	\N	f
2920	Predavanja	O-028	0	Osnovna svojstva mreža. Povijest razvoja umrežavanja računala i interneta.	2020-10-13	10:15:00	11:45:00	45	f	\N	f
2921	Vježbe	O-350	1	Instalacija softvera za vježbe na računalima studenata	2020-10-16	14:15:00	17:45:00	45	f	\N	f
2922	Predavanja	O-028	0	Aplikacijski sloj. Web. Elektronička pošta.	2020-10-20	10:15:00	11:45:00	45	f	\N	f
2923	Vježbe	O-350	1	Auditorna vježba 1: Analiza računalnih mreža (IMUNES/CORE)	2020-10-23	14:15:00	17:45:00	45	f	\N	f
2924	Predavanja	O-028	0	Sustav imena domena. Peer-to- peer aplikacije. Programiranje mrežnih aplikacija.	2020-10-27	10:15:00	11:45:00	45	f	\N	f
2925	Vježbe	online	1	Laboratorijska vježba 1: Snimanje i pregledavanje mrežnog prometa (Wireshark)	2020-10-30	14:15:00	17:45:00	45	f	\N	f
2926	Predavanja	O-028	0	Transportni sloj. Multipleksiranje i demultipleksiranje. Prijenos podataka bez uspostave veze.	2020-11-03	10:15:00	11:45:00	45	f	\N	f
2927	Vježbe	online	1	Laboratorijska vježba 2: Komunikacija HTTP klijenta i poslužitelja (cURL, PHP)	2020-11-06	14:15:00	17:45:00	45	f	\N	f
2928	Predavanja	O-028	0	Pouzdani prijenos podataka. Prijenos podataka s uspostavom veze. Upravljanje zagušenjem.	2020-10-10	10:15:00	11:45:00	45	f	\N	f
2929	Vježbe	online	1	Laboratorijska vježba 3: Konfiguracija HTTP poslužitelja (Apache)	2020-11-13	14:15:00	17:45:00	45	f	\N	f
2930	Predavanja	O-028	0	Mrežni sloj. Virtualni krug i datagram.	2020-11-17	10:15:00	11:45:00	45	f	\N	f
2931	Vježbe	online	1	Laboratorijska vježba 4: Programiranje mrežnih aplikacija (Python)	2020-11-20	14:15:00	17:45:00	45	f	\N	f
2932	Predavanja	O-028	0	Usmjerivač. Prosljeđivanje paketa i adresiranje na internetu.	2020-11-24	10:15:00	11:45:00	45	f	\N	f
3045	Predavanja	online	0	Filtri	2021-04-06	08:15:00	09:45:00	13	f	\N	f
2933	Vježbe	O-350	1	Auditorna vježba 2: Analiza TCP- ovih algoritama za upravljanje zagušenjem (ns-3)	2020-11-27	14:15:00	17:45:00	45	f	\N	f
2934	Predavanja	O-359	0	Online test na Merlinu	2020-12-01	10:15:00	11:45:00	45	f	\N	f
2935	Vježbe	online	1	Laboratorijska vježba 5: Konfiguracija svojstava i adresiranje podmreža (IMUNES/CORE)	2020-12-04	14:15:00	17:45:00	45	f	\N	f
2936	Predavanja	O-028	0	Unutardomensko usmjeravanje. Broadcast i multicast.	2020-12-08	10:15:00	11:45:00	45	f	\N	f
2937	Vježbe	online	1	Laboratorijska vježba 6: Prevođenje mrežnih adresa i filtriranje paketa vatrozidom na mrežnom sloju (IMUNES/CORE)	2020-12-11	14:15:00	17:45:00	45	f	\N	f
2938	Predavanja	O-028	0	Međudomensko usmjeravanje. Softverski definirano umrežavanje.	2020-12-15	10:15:00	11:45:00	45	f	\N	f
2939	Vježbe	online	1	Laboratorijska vježba 7: Usmjeravanje (IMUNES/CORE)	2020-12-18	14:15:00	17:45:00	45	f	\N	f
2940	Predavanja	O-028	0	Sloj veze podataka. Raspoznavanje i ispravak pogrešaka. Veze i protokoli višestrukog pristupa.	2020-12-22	10:15:00	11:45:00	45	f	\N	f
2941	Vježbe	online	1	Laboratorijska vježba 8: Dinamička dodjela mrežnih adresa (IMUNES/CORE)	2020-01-08	14:15:00	17:45:00	45	f	\N	f
2942	Predavanja	O-028	0	Preklopnici i lokalne mreže. Mreže podatkovnih centara.	2020-01-12	10:15:00	11:45:00	45	f	\N	f
2943	Vježbe	online	1	Laboratorijska vježba 9: Premošćenje i filtriranje okvira vatrozidom na veznom sloju (IMUNES/CORE)	2020-01-15	14:15:00	17:45:00	45	f	\N	f
2944	Predavanja	O-028	0	Bežične i mobilne mreže. Bežične veze. Bežične lokalne mreže.	2020-01-19	10:15:00	11:45:00	45	f	\N	f
2945	Vježbe	online	1	Laboratorijska vježba 10: Mobilnost čvorova u bežičnim mrežama (IMUNES/CORE)	2020-01-22	14:15:00	17:45:00	45	f	\N	f
2946	Predavanja	O-028	0	Pristup internetu putem mobilne mreže. Mobilnost.	2020-01-26	10:15:00	11:45:00	45	f	\N	f
2947	Vježbe	O-350	1	Nadoknada laboratorijske vježbe	2020-01-29	14:15:00	17:45:00	45	f	\N	f
2948	Predavanja	online	0	Uvod, upoznavanje studenata s bodovima i obvezama	2021-03-05	08:15:00	09:45:00	9	f	\N	f
2949	Vježbe	366	1	Uvod, upoznavanje studenata s bodovima i obvezama	2021-03-05	10:00:00	11:30:00	9	f	\N	f
2950	Predavanja	366	0	Arhitektura sustava temeljenih na znanju i sustavi temeljeni na pravilima, lab u alatu R	2021-03-12	08:15:00	09:45:00	9	f	\N	f
2951	Vježbe	366	1	Arhitektura sustava temeljenih na znanju i sustavi temeljeni na pravilima, lab u alatu R	2021-03-12	10:00:00	11:30:00	9	f	\N	f
2952	Predavanja	online	0	Dubinska analiza podataka i strojno učenje, lab u alatu R, lab u alatu R. Zadana 1. zadaća.	2021-03-19	08:15:00	09:45:00	9	f	\N	f
2953	Vježbe	366	1	Dubinska analiza podataka i strojno učenje, lab u alatu R, lab u alatu R. Zadana 1. zadaća.	2021-03-19	10:00:00	11:30:00	9	f	\N	f
2954	Predavanja	366	0	Linearni modeli, lab u alatu R	2021-03-26	08:15:00	09:45:00	9	f	\N	f
2955	Vježbe	366	1	Linearni modeli, lab u alatu R	2021-03-26	10:00:00	11:30:00	9	f	\N	f
2956	Predavanja	online	0	Napredni postupci klasifikacije:\nLogistička regresija, LDA; lab u alatu\nR. Zadana 2. zadaća.	2021-04-09	08:15:00	09:45:00	9	f	\N	f
2957	Vježbe	366	1	Napredni postupci klasifikacije:\nLogistička regresija, LDA; lab u alatu\nR. Zadana 2. zadaća.	2021-04-09	10:00:00	11:30:00	9	f	\N	f
2958	Predavanja	366	0	Napredni postupci klasifikacije: QDA, KNN; lab u alatu R	2021-04-16	08:15:00	09:45:00	9	f	\N	f
2959	Vježbe	366	1	Napredni postupci klasifikacije: QDA, KNN; lab u alatu R	2021-04-16	10:00:00	11:30:00	9	f	\N	f
2960	Predavanja	online	0	Postupci vrednovanja modela:\nunakrsno vrednovanje, LOOV, Bootstrap, lab u alatu R	2021-04-23	08:15:00	09:45:00	9	f	\N	f
2961	Vježbe	366	1	Postupci vrednovanja modela:\nunakrsno vrednovanje, LOOV, Bootstrap, lab u alatu R	2021-04-23	10:00:00	11:30:00	9	f	\N	f
2962	Predavanja	366	0	Vježba	2021-04-30	08:15:00	09:45:00	9	f	\N	f
2963	Vježbe	366	1	Vježba	2021-04-30	10:00:00	11:30:00	9	f	\N	f
2964	Predavanja	online	0	Selekcija modela i regularizacija; Postupci odabira podskupa podataka\ni smanjivanja dimenzija: Odabir najboljeg podskupa; lab u alatu R	2021-05-07	08:15:00	09:45:00	9	f	\N	f
2965	Vježbe	366	1	Selekcija modela i regularizacija; Postupci odabira podskupa podataka i smanjivanja dimenzija: Odabir\nnajboljeg podskupa; lab u alatu R	2021-05-07	10:00:00	11:30:00	9	f	\N	f
2966	Predavanja	366	0	1. kolokvij	2021-05-14	08:15:00	09:45:00	9	f	\N	f
2967	Vježbe	366	1	1. kolokvij	2021-05-14	10:00:00	11:30:00	9	f	\N	f
2968	Predavanja	366	0	Postupci temeljeni na stablima:\nBagging i slučajne šume; lab u alatu\nR. Zadana 3. zadaća.	2021-05-21	08:15:00	09:45:00	9	f	\N	f
2969	Vježbe	366	1	Postupci temeljeni na stablima:\nBagging i slučajne šume; lab u alatu\nR. Zadana 3. zadaća.	2021-05-21	10:00:00	11:30:00	9	f	\N	f
2970	Predavanja	online	0	Postupci temeljeni na stablima: Boosting; lab u alatu R	2021-05-28	08:15:00	09:45:00	9	f	\N	f
2971	Vježbe	366	1	Postupci temeljeni na stablima: Boosting; lab u alatu R	2021-05-28	10:00:00	11:30:00	9	f	\N	f
2972	Predavanja	366	0	Analiza glavnih komponenti (PCA), Postupci grupiranja, lab u alatu R.\nZadana 4. zadaća.	2021-06-04	08:15:00	09:45:00	9	f	\N	f
2973	Vježbe	366	1	Analiza glavnih komponenti (PCA), Postupci grupiranja, lab u alatu R.\nZadana 4. zadaća.	2021-06-04	10:00:00	11:30:00	9	f	\N	f
2974	Predavanja	366	0	Obrane projekata	2021-06-11	08:15:00	09:45:00	9	f	\N	f
2975	Vježbe	366	1	2. kolokvij	2021-06-11	10:00:00	11:30:00	9	f	\N	f
2976	Predavanja	366	0	Nadoknada kolokvija.	2021-06-18	08:15:00	09:45:00	9	f	\N	f
2977	Vježbe	366	1	Nadoknada kolokvija.	2021-06-18	10:00:00	11:30:00	9	f	\N	f
2978	Predavanja	359	0	Uvodno o predavanje o logistici. Evolucija Integralnog logističkog pristupa. Logistika u 1990 tih, logistika u 2000 godini	2021-03-04	10:00:00	11:30:00	16	f	\N	f
2979	Vježbe	359	1	Modeli logističkih sustava	2021-03-04	11:45:00	13:15:00	16	f	\N	f
2980	Predavanja	359	0	Sustavi distribucije robe i usluga. Logistika. Logističko planiranje	2021-03-11	10:00:00	11:30:00	16	f	\N	f
2981	Vježbe	359	1	Modeli logističkih sustava	2021-03-11	11:45:00	13:15:00	16	f	\N	f
2982	Predavanja	359	0	Strateško logističko planiranje: Logističke strategije, Upravljanje\nMarketing, Logistička strategija i struktura	2021-03-18	10:00:00	11:30:00	16	f	\N	f
2983	Vježbe	359	1	Modeli logističkih sustava	2021-03-18	11:45:00	13:15:00	16	f	\N	f
2984	Predavanja	359	0	Upravljanje    Kvaliteta  i  učinkovitost    u logistici TQM principi u Logistici	2021-03-25	10:00:00	11:30:00	16	f	\N	f
2986	Predavanja	359	0	Sustavi distribucije robe i usluga. Kanali distribucije.	2021-04-01	10:00:00	11:30:00	16	f	\N	f
2987	Vježbe	359	1	Modeli logističkih sustava	2021-04-01	11:45:00	13:15:00	16	f	\N	f
2988	Predavanja	359	0	Analiza    pojedinih    prometnih    grana. Općenito  o  prometu.  Cestovni  promet.\nŽeljeznički   promet.   Pomorski   promet. Zračni promet.  Transport u proizvodnji	2021-04-08	10:00:00	11:30:00	16	f	\N	f
2989	Vježbe	359	1	Kolokvij 1	2021-04-08	11:45:00	13:15:00	16	f	\N	f
2990	Predavanja	359	0	Troškovi prijevoza.  Logistički troškovi. Produktivnost, učinkovitost	2021-04-15	10:00:00	11:30:00	16	f	\N	f
2991	Vježbe	359	1	Modeli logističkih sustava	2021-04-15	11:45:00	13:15:00	16	f	\N	f
2992	Predavanja	359	0	Transakcijski troškovi	2021-04-22	10:00:00	11:30:00	16	f	\N	f
2993	Vježbe	359	1	Modeli logističkih sustava	2021-04-22	11:45:00	13:15:00	16	f	\N	f
2994	Predavanja	359	0	Mjerenje  izvedbe logističkih postupaka Integriranje logističkih strategija u financijske planove	2021-04-29	10:00:00	11:30:00	16	f	\N	f
2995	Vježbe	359	1	Modeli logističkih sustava	2021-04-29	11:45:00	13:15:00	16	f	\N	f
2996	Predavanja	359	0	Just in time sustav upravljanja zalihama, planiranje u JIT okružju	2021-05-06	10:00:00	11:30:00	16	f	\N	f
2997	Vježbe	359	1	Modeli logističkih sustava	2021-05-06	11:45:00	13:15:00	16	f	\N	f
3060	Vježbe	online	1	Rad na projektnom zadatku	2021-05-25	10:00:00	11:30:00	13	f	\N	f
2998	Predavanja	359	0	Prijevoz; Evaluacija prijevoznih tehnologija, svjetski trendo\nUloga novih informacijskih tehnologija na upravljanje prijevoznim sustavom	2021-05-13	10:00:00	11:30:00	16	f	\N	f
2999	Vježbe	359	1	Modeli logističkih sustava	2021-05-13	11:45:00	13:15:00	16	f	\N	f
3000	Predavanja	359	0	Integracija nabave i prijevoznog sustava Logistika ugovaranja	2021-05-20	10:00:00	11:30:00	16	f	\N	f
3001	Vježbe	359	1	Modeli logističkih sustava	2021-05-20	11:45:00	13:15:00	16	f	\N	f
3002	Predavanja	359	0	Skladištenje, Projektiranje sustava skladištenja, Skladišne tehnologije, Izbor lokacije  skladišta, Informacijski sustav\nskladišta	2021-05-27	10:00:00	11:30:00	16	f	\N	f
3003	Vježbe	359	1	Modeli logističkih sustava	2021-05-27	11:45:00	13:15:00	16	f	\N	f
3004	Predavanja	359	0	Međunarodna    logistika,    Međunarodno okružje, Upravljanje uvozom i izvozom	2021-06-10	10:00:00	11:30:00	16	f	\N	f
3005	Vježbe	359	1	Kolokvij 2	2021-06-10	11:45:00	13:15:00	16	f	\N	f
3006	Predavanja	O-365	0	Uvod u kolegij.	2021-03-02	12:00:00	13:30:00	11	f	\N	f
3007	Vježbe	O-365	1	Uvod u vježbe kolegija. Instalacija programske podrške.	2021-03-02	13:45:00	15:15:00	11	f	\N	f
3008	Predavanja	O-365	0	Multimedijski i hipermedijski sustavi.	2021-03-09	12:00:00	13:30:00	11	f	\N	f
3009	Vježbe	O-365	1	Priprema za rad s alatom Blender. Osnovni rad s predmetima scene.	2021-03-09	13:45:00	15:15:00	11	f	\N	f
3010	Predavanja	O-365	0	Uvod u računalnu grafiku.	2021-03-16	12:00:00	13:30:00	11	f	\N	f
3011	Vježbe	O-365	1	Alati za uređivanje predmeta scene.	2021-03-16	13:45:00	15:15:00	11	f	\N	f
3012	Predavanja	O-365	0	Virtualna okruženja.	2021-03-23	12:00:00	13:30:00	11	f	\N	f
3013	Vježbe	O-365	1	Rad s modifikatorima (1).	2021-03-23	13:45:00	15:15:00	11	f	\N	f
3014	Predavanja	online	0	Online diskusija (1).	2021-03-30	00:00:00	23:59:00	11	f	\N	f
3015	Vježbe	O-365	1	Rad s modifikatorima (2).	2021-03-30	13:45:00	15:15:00	11	f	\N	f
3016	Predavanja	O-365	0	Rad s virtualnom scenom ž modeliranje predmeta.	2021-04-06	12:00:00	13:30:00	11	f	\N	f
3017	Vježbe	O-365	1	Rad s 3D tekstom. Upravljanje scenom.	2021-04-06	13:45:00	15:15:00	11	f	\N	f
3018	Predavanja	online	0	Online diskusija (2).	2021-04-13	00:00:00	23:59:00	11	f	\N	f
3019	Vježbe	O-365	1	Materijali i bojanje površine predmeta scene.	2021-04-13	13:45:00	15:15:00	11	f	\N	f
3020	Predavanja	O-365	0	Računalna animacija.	2021-04-20	12:00:00	13:30:00	11	f	\N	f
3021	Vježbe	O-365	1	Osnove animacije (1).	2021-04-20	13:45:00	15:15:00	11	f	\N	f
3022	Predavanja	O-365	0	Metoda praćenja zrake.	2021-04-27	12:00:00	13:30:00	11	f	\N	f
3023	Vježbe	O-365	1	Osnove animacije (2).	2021-04-27	13:45:00	15:15:00	11	f	\N	f
3024	Predavanja	O-365	0	Iscrtavanje virtualne scene i grafički protočni sustav.	2021-05-04	12:00:00	13:30:00	11	f	\N	f
3025	Vježbe	O-365	1	Priprema za izradu projekta i uključivanje 3D grafike u web sjedište.	2021-05-04	13:45:00	15:15:00	11	f	\N	f
3026	Predavanja	online	0	Primjena virtualnih okruženja u poslovne i edukativne svrhe.	2021-05-11	00:00:00	23:59:00	11	f	\N	f
3027	Vježbe	O-365	1	Priprema za izradu projekta i izrada projektne dokumentacije.	2021-05-11	13:45:00	15:15:00	11	f	\N	f
3028	Predavanja	online	0	Online diskusija (3).	2021-05-18	00:00:00	23:59:00	11	f	\N	f
3029	Vježbe	online	1	Izrada projekta.	2021-05-18	00:00:00	23:59:00	11	f	\N	f
3030	Predavanja	O-365	0	Provjera znanja.	2021-05-25	12:00:00	13:30:00	11	f	\N	f
3031	Vježbe	online	1	Izrada projekta.	2021-05-25	00:00:00	23:59:00	11	f	\N	f
3032	Predavanja	online	0	Izrada projekta.	2021-06-01	00:00:00	23:59:00	11	f	\N	f
3033	Vježbe		1		2021-06-01	00:00:00	23:59:00	11	f	\N	f
3034	Predavanja	O-365	0	Prezentacija projekta.	2021-06-08	12:00:00	15:15:00	11	f	\N	f
3035	Predavanja	365	0	Uvodni sat, obveze studenata	2021-03-02	08:15:00	09:45:00	13	f	\N	f
3036	Vježbe	365	1	Google colab, biblioteke za obradu govora i slika	2021-03-02	10:00:00	11:30:00	13	f	\N	f
3037	Predavanja	365	0	Signali	2021-03-09	08:15:00	09:45:00	13	f	\N	f
3038	Vježbe	365	1	Signali	2021-03-09	10:00:00	11:30:00	13	f	\N	f
3039	Predavanja	365	0	Govorni signal	2021-03-15	08:15:00	09:45:00	13	f	\N	f
3040	Vježbe	365	1	Značajke govornog signala u vremenskoj domeni, Zadavanje 1. grupe eksperimentalnih zadataka	2021-03-15	10:00:00	11:30:00	13	f	\N	f
3041	Predavanja	online	0	Spektralne značajke signala govora Predstavljanje tema projekata	2021-03-23	08:15:00	09:45:00	13	f	\N	f
3042	Vježbe	online	1	Spektralne značajke signala govora, Analiza 1. grupe eksperimentalnih zadataka	2021-03-23	10:00:00	11:30:00	13	f	\N	f
3043	Predavanja	online	0	Kepstar i osnovna frekvencija govora	2021-03-30	08:15:00	09:45:00	13	f	\N	f
3044	Vježbe	online	1	Kepstar i osnovna frekvencija govora	2021-03-30	10:00:00	11:30:00	13	f	\N	f
3047	Predavanja	365	0	Signali slike i primjena obrade slike	2021-04-13	08:15:00	09:45:00	13	f	\N	f
3048	Vježbe	365	1	Signali slike i primjena obrade slike	2021-04-13	10:00:00	11:30:00	13	f	\N	f
3049	Predavanja	365	0	Operacije na pikselima i histogram	2021-04-20	08:15:00	09:45:00	13	f	\N	f
3050	Vježbe	365	1	Operacije na pikselima i histogram	2021-04-20	10:00:00	11:30:00	13	f	\N	f
3051	Predavanja	365	0	Transformacije slike i filtri	2021-04-27	08:15:00	09:45:00	13	f	\N	f
3052	Vježbe	365	1	Transformacije slike i filtri	2021-04-27	10:00:00	11:30:00	13	f	\N	f
3053	Predavanja	365	0	Obrada slike u boji i morfološke operacije	2021-05-04	08:15:00	09:45:00	13	f	\N	f
3054	Vježbe	365	1	Obrada slike u boji	2021-05-04	10:00:00	11:30:00	13	f	\N	f
3055	Predavanja	365	0	Detekcija rubova na slici	2021-05-11	08:15:00	09:45:00	13	f	\N	f
3056	Vježbe	365	1	Morfološke operacije	2021-05-11	10:00:00	11:30:00	13	f	\N	f
3057	Predavanja	365	0	Detekcija interesnih točaka slike	2021-05-18	08:15:00	09:45:00	13	f	\N	f
3058	Vježbe	365	1	Detekcija rubova i interesnih točaka. Zadavanje 2. grupe eksperimentalnih zadataka	2021-05-18	10:00:00	11:30:00	13	f	\N	f
3059	Predavanja	online	0	Segmentacija slike	2021-05-25	08:15:00	09:45:00	13	f	\N	f
3061	Predavanja	online	0	Algoritmi za segmentaciju slike	2021-06-01	08:15:00	09:45:00	13	f	\N	f
3062	Vježbe	online	1	Analiza 2. grupe eksperimentalnih zadataka	2021-06-01	10:00:00	11:30:00	13	f	\N	f
3063	Predavanja	online	0	Predstavljanje projekata	2021-06-08	08:15:00	09:45:00	13	f	\N	f
3064	Vježbe	online	1	Predstavljanje projekata	2021-06-08	10:00:00	11:30:00	13	f	\N	f
3065	Predavanja	350	0	Uvod, opće informacije, pregled pojmova	2021-03-04	10:00:00	11:30:00	17	f	\N	f
3066	Vježbe	350	1	Web scraping	2021-03-04	11:45:00	13:15:00	17	f	\N	f
3067	Predavanja	350	0	Jezični resursi, korpusi, rječnici, leksikoni.	2021-03-11	10:00:00	11:30:00	17	f	\N	f
3068	Predavanja	350	0	Word-net, korpusi, alati za korpuse	2021-03-11	10:00:00	11:30:00	17	f	\N	f
3069	Predavanja	350	0	Morfološki analizatori. Obilježivači vrsta riječi. Lematizatori	2021-03-18	10:00:00	11:30:00	17	f	\N	f
3070	Vježbe	350	1	NLTK 1 - Uvod	2021-03-18	11:45:00	13:15:00	17	f	\N	f
3071	Predavanja	350	0	Statistički jezični modeli. N-gramski modeli. Perpleksnost	2021-03-25	10:00:00	11:30:00	17	f	\N	f
3072	Vježbe	350	1	NLTK 2 – Rad s korpusima	2021-03-25	11:45:00	13:15:00	17	f	\N	f
3073	Predavanja	350	0	Parsiranje. Prepoznavanje značenja.	2021-04-01	10:00:00	11:30:00	17	f	\N	f
3074	Vježbe	350	1	NLTK 5 – Automatsko dodjeljivanje POS oznaka	2021-04-01	11:45:00	13:15:00	17	f	\N	f
3075	Predavanja	350	0	Pretraživanje dokumenata. Strukture indeksiranja dokumenata	2021-04-08	10:00:00	11:30:00	17	f	\N	f
3076	Vježbe	350	1	NLTK 4 – Stvaranje kategoriziranih korpusa	2021-04-08	11:45:00	13:15:00	17	f	\N	f
3077	Predavanja	350	0	Vektorski prostor. Klasifikacija dokumenata.	2021-04-15	10:00:00	11:30:00	17	f	\N	f
3078	Vježbe	350	1	NLTK 3 – Klasifikacija tekstova	2021-04-15	11:45:00	13:15:00	17	f	\N	f
3079	Predavanja i vježbe	350	2	Rok za prijavu teme za seminar	2021-04-17	23:00:00	23:59:00	17	f	\N	f
3080	Predavanja i vježbe	350	2	Kolokvij 22.4.	2021-04-22	10:00:00	13:15:00	17	f	\N	f
3081	Predavanja	350	0	Otkrivanje stavova i mišljenja iz teksta	2021-04-29	10:00:00	11:30:00	17	f	\N	f
3082	Vježbe	350	1	NLTK 6 – Pretraživanje i dohvaćanje informacija	2021-04-29	11:45:00	13:15:00	17	f	\N	f
3083	Predavanja	350	0	Text Mining - Dubinska analiza teksta	2021-05-06	10:00:00	11:30:00	17	f	\N	f
3084	Vježbe	350	1	Text mining 1	2021-05-06	11:45:00	13:15:00	17	f	\N	f
3085	Predavanja	350	0	Strojno učenje, klasifikatori	2021-05-13	10:00:00	11:30:00	17	f	\N	f
3086	Vježbe	350	1	Text mining 2	2021-05-13	11:45:00	13:15:00	17	f	\N	f
3087	Predavanja	350	0	Duboko učenje za tekst	2021-05-20	10:00:00	11:30:00	17	f	\N	f
3088	Vježbe	350	1	Deep/Text mining 1	2021-05-20	11:45:00	13:15:00	17	f	\N	f
3089	Vježbe	350	1	Deep/Text mining 2	2021-05-27	11:45:00	13:15:00	17	f	\N	f
3090	Vježbe	350	1	Deep/Text mining 3	2021-05-27	11:45:00	13:15:00	17	f	\N	f
3091	Predavanja	online	0	Diskurs. Dijalog.	2021-06-03	10:00:00	11:30:00	17	f	\N	f
3092	Vježbe	online	1	Deep/Text mining 4	2021-06-03	11:45:00	13:15:00	17	f	\N	f
3093	Predavanja	350	0	Seminari	2021-06-10	10:00:00	11:30:00	17	f	\N	f
3094	Vježbe	350	1	Seminari	2021-06-10	11:45:00	13:15:00	17	f	\N	f
3095	Predavanja	O-365	0	Uvod (pravila igre)	2021-03-03	12:00:00	13:30:00	12	f	\N	f
3096	Vježbe	O-365	1	Pisanje znanstvenog članka	2021-03-03	13:45:00	15:15:00	12	f	\N	f
3097	Predavanja	online	0	Pregled tema za znanstveni članak	2021-03-10	12:00:00	13:30:00	12	f	\N	f
3098	Vježbe	online	1	SQL ponavljanje – inicijalna samoprovjera	2021-03-10	13:45:00	15:15:00	12	f	\N	f
3099	Predavanja	online	0	ERP sustavi	2021-03-17	12:00:00	13:30:00	12	f	\N	f
3100	Vježbe	online	1	Osnove PL/SQL jezika– sintaksa i petlje	2021-03-17	13:45:00	15:15:00	12	f	\N	f
3101	Predavanja	O-365	0	Skladišta podataka – 1. dio (uvod)	2021-03-24	12:00:00	13:30:00	12	f	\N	f
3102	Vježbe	online	1	PL/SQL jezik – kursori, iznimke i procedure	2021-03-24	12:00:00	13:30:00	12	f	\N	f
3103	Predavanja	O-365	0	Skladišta podataka – 2. dio (BI)	2021-03-31	12:00:00	13:30:00	12	f	\N	f
3104	Vježbe	online	1	PL/SQL jezik – funkcije, paketi	2021-03-31	13:45:00	15:15:00	12	f	\N	f
3105	Predavanja	online	0	1. teorijska samoprovjera – ERP sustavi  + Skladišta podataka (uvod+BI)	2021-04-07	12:00:00	13:30:00	12	f	\N	f
3106	Vježbe	online	1	PL/SQL ponavljanje	2021-04-07	13:45:00	15:15:00	12	f	\N	f
3107	Predavanja	O-365	0	Skladišta podataka – 3. dio (dimenzijsko modeliranje)	2021-04-14	12:00:00	13:30:00	12	f	\N	f
3108	Vježbe	online	1	PL/SQL samoprovjera	2021-04-14	13:45:00	15:15:00	12	f	\N	f
3109	Predavanja	O-365	0	Skladišta podataka – 4. dio (ETL procesi)	2021-04-21	12:00:00	13:30:00	12	f	\N	f
3110	Vježbe	O-365	1	DW – arhitektura, idef1x, analiza izvora i zahtjeva (WIP i BEAM)	2021-04-21	13:45:00	15:15:00	12	f	\N	f
3111	Predavanja	O-365	0	OLAP alati i analiza poslovnih podataka	2021-04-28	12:00:00	13:30:00	12	f	\N	f
3177	Predavanja	365	0	Big data alat 3 (Map reduce)	2021-06-02	08:15:00	09:45:00	14	f	\N	f
3112	Vježbe	O-365	1	DW – logički model za Data Mart (dimenzionalni model)	2021-04-28	13:45:00	15:15:00	12	f	\N	f
3113	Predavanja	online	0	2. teorijska samoprovjera – Skladišta podataka (DM+ETL) + OLAP	2021-05-05	12:00:00	13:30:00	12	f	\N	f
3114	Vježbe	O-365	1	DW – logički model za EDW (data vault)	2021-05-05	13:45:00	15:15:00	12	f	\N	f
3115	Predavanja	online	0	Rok za prijavu teme završnog ispita	2021-05-12	12:00:00	13:30:00	12	f	\N	f
3116	Vježbe	O-365	1	Izrada praktičnog rada - konzultacije	2021-05-12	13:45:00	15:15:00	12	f	\N	f
3117	Predavanja	O-365	0	Izrada seminarskog rada - konzultacije	2021-05-19	12:00:00	13:30:00	12	f	\N	f
3118	Vježbe	O-365	1	Izrada praktičnog rada - konzultacije	2021-05-19	13:45:00	15:15:00	12	f	\N	f
3119	Predavanja	O-365	0	Izrada seminarskog rada - konzultacije	2021-05-26	12:00:00	13:30:00	12	f	\N	f
3120	Vježbe	O-365	1	Izrada praktičnog rada - konzultacije	2021-05-26	13:45:00	15:15:00	12	f	\N	f
3121	Predavanja	O-365	0	Izrada seminarskog rada - konzultacije	2021-06-02	12:00:00	13:30:00	12	f	\N	f
3122	Vježbe	O-365	1	Izrada praktičnog rada - konzultacije	2021-06-02	13:45:00	15:15:00	12	f	\N	f
3123	Predavanja	O-365	0	Izrada seminarskog rada - konzultacije	2021-06-09	12:00:00	13:30:00	12	f	\N	f
3124	Vježbe	online	1	Predaja praktičnog rada	2021-06-09	13:45:00	15:15:00	12	f	\N	f
3125	Predavanja i vježbe	O-366	2	Uvod u kolegij.	2021-03-01	09:00:00	10:30:00	10	f	\N	f
3126	Predavanja	online	0	Osnovni pojmovi SPIS-a.	2021-03-08	08:15:00	09:45:00	10	f	\N	f
3127	Vježbe	online	1	Zašto tvrtke počinju sa strateškim planiranjem?	2021-03-08	10:00:00	11:30:00	10	f	\N	f
3128	Predavanja	online	0	Menadžment i ulaganje u IT/IS.	2021-03-15	08:15:00	09:45:00	10	f	\N	f
3129	Vježbe	online	1	Kratka provjera 1.	2021-03-15	10:00:00	11:30:00	10	f	\N	f
3130	Predavanja	O-366	0	Svrha SPIS-a.	2021-03-22	08:15:00	09:45:00	10	f	\N	f
3131	Vježbe	O-366	1	Vrste organizacijskih struktura.	2021-03-22	10:00:00	11:30:00	10	f	\N	f
3132	Predavanja	online	0	Proces planiranja SPIS-a.	2021-03-29	08:15:00	09:45:00	10	f	\N	f
3133	Vježbe	online	1	Kratka provjera 2.	2021-03-29	10:00:00	11:30:00	10	f	\N	f
3134	Predavanja	online	0	Faza vizije tijekom izrade strateškog plana IS.	2021-04-12	08:15:00	09:45:00	10	f	\N	f
3135	Vježbe	online	1	Faza vizije tijekom izrade strateškog plana IS.	2021-04-12	10:00:00	11:30:00	10	f	\N	f
3136	Predavanja	O-366	0	Kolokvij 1.	2021-04-19	09:00:00	10:30:00	10	f	\N	f
3137	Vježbe	O-366	1	Faza analize tijekom izrade strateškog plana IS	2021-04-19	10:00:00	11:30:00	10	f	\N	f
3138	Predavanja	O-366	0	Faza usmjerenja tijekom izrade strateškog plana IS.	2021-04-26	08:15:00	09:45:00	10	f	\N	f
3139	Vježbe	O-366	1	Ocjenska vježba 1: Vizija, Misija i SWOT analiza.	2021-04-26	10:00:00	11:30:00	10	f	\N	f
3140	Predavanja	online	0	Faza preporuke tijekom izrade strateškog plana IS.	2021-05-03	08:15:00	09:45:00	10	f	\N	f
3141	Vježbe	O-366	1	Konzultativna nastava – upute za rad na seminaru.	2021-05-03	10:00:00	11:30:00	10	f	\N	f
3142	Predavanja	online	0	Prezentacija plana izvršnom menadžmentu.	2021-05-10	08:15:00	09:45:00	10	f	\N	f
3143	Vježbe	O-366	1	Ocjenska vježba 2: Određivanje prioriteta.	2021-05-10	10:00:00	11:30:00	10	f	\N	f
3144	Predavanja	online	0	SPIS metodika.	2021-05-17	08:15:00	09:45:00	10	f	\N	f
3145	Vježbe	online	1	Kratka provjera 3.	2021-05-17	10:00:00	11:30:00	10	f	\N	f
3146	Predavanja	O-366	0	Konzultativna nastava – rad na seminaru.	2021-05-24	08:15:00	09:45:00	10	f	\N	f
3147	Vježbe	O-366	1	Kolokvij 2.	2021-05-24	09:00:00	10:30:00	10	f	\N	f
3148	Predavanja	O-366	0	Konzultativna nastava – rad na seminaru.	2021-05-31	08:15:00	09:45:00	10	f	\N	f
3149	Vježbe	O-366	1	Konzultativna nastava – rad na seminaru.	2021-05-31	10:00:00	11:30:00	10	f	\N	f
3150	Predavanja	O-366	0	Konzultativna nastava – rad na seminaru.	2021-06-07	08:15:00	09:45:00	10	f	\N	f
3151	Vježbe	O-366	1	Konzultativna nastava – rad na seminaru.	2021-06-07	10:00:00	11:30:00	10	f	\N	f
3152	Predavanja	365	0	Opće informacije. Uvod. MIS. Odlučivanje Višeparametarsko odlučivanje	2021-03-03	08:15:00	09:45:00	14	f	\N	f
3153	Vježbe	365	1	Višeparametarsko odlučivanje	2021-03-03	10:00:00	11:30:00	14	f	\N	f
3154	Predavanja	365	0	Skladišta podataka	2021-03-10	08:15:00	09:45:00	14	f	\N	f
3155	Predavanja	365	0	Skladišta: Metodologija, Faze izgradnje	2021-03-10	08:15:00	09:45:00	14	f	\N	f
3156	Predavanja	365	0	Dimenzijsko modeliranje	2021-03-17	08:15:00	09:45:00	14	f	\N	f
3157	Predavanja	365	0	Dimenzijsko modeliranje (zadaci)	2021-03-17	08:15:00	09:45:00	14	f	\N	f
3158	Vježbe	365	1	Dimenzijsko modeliranje 2 – wrkshp	2021-03-24	10:00:00	11:30:00	14	f	\N	f
3159	Predavanja	365	0	Performanse skladišta podataka	2021-03-24	08:15:00	09:45:00	14	f	\N	f
3160	Vježbe	365	1	prezentacije 2DZ	2021-03-31	10:00:00	11:30:00	14	f	\N	f
3161	Predavanja	365	0	Ekstrakcija, transformacija i punjenje	2021-03-31	08:15:00	09:45:00	14	f	\N	f
3162	Vježbe	365	1	Terradata University network- Microstrategy Tutorial 1	2021-04-07	10:00:00	11:30:00	14	f	\N	f
3163	Vježbe	365	1	Microstrategy Tutorial 2 Kontrolne ploče (Dashboards)- Microstrategy	2021-04-07	10:00:00	11:30:00	14	f	\N	f
3164	Predavanja	365	0	Ekstrakcija, transformacija i punjenje	2021-04-14	08:15:00	09:45:00	14	f	\N	f
3165	Vježbe	365	1	ETL alat Talend 1	2021-04-14	10:00:00	11:30:00	14	f	\N	f
3166	Vježbe	365	1	ETL alat Talend 2	2021-04-21	10:00:00	11:30:00	14	f	\N	f
3167	Vježbe	365	1	Tableau	2021-04-21	10:00:00	11:30:00	14	f	\N	f
3168	Predavanja i vježbe	online	2	Rok za prijavu seminara 21.4.	2021-04-21	00:00:00	23:59:00	14	f	\N	f
3169	Vježbe	365	1	Kolokvij	2021-04-28	10:00:00	11:30:00	14	f	\N	f
3170	Vježbe	365	1	Industrijska radionica @iOLAP	2021-05-05	10:00:00	11:30:00	14	f	\N	f
3171	Predavanja	365	0	Big data 1 – koncepti i pregled alata	2021-05-12	08:15:00	09:45:00	14	f	\N	f
3172	Predavanja	365	0	Big data 2 – algoritmi i tehnologija	2021-05-12	08:15:00	09:45:00	14	f	\N	f
3173	Predavanja	365	0	Big data 3 – tijekovi podataka	2021-05-19	08:15:00	09:45:00	14	f	\N	f
3174	Vježbe	365	1	Big data alat 1	2021-05-19	10:00:00	11:30:00	14	f	\N	f
3175	Predavanja	365	0	Big data 4 – primjene i NoSQL	2021-05-26	08:15:00	09:45:00	14	f	\N	f
3178	Vježbe	365	1	Big data alat 3	2021-06-02	10:00:00	11:30:00	14	f	\N	f
3179	Predavanja i vježbe	365	2	Seminari	2021-06-09	08:15:00	11:30:00	14	f	\N	f
3180	Predavanja	online	0	Uvod u predmet, uvodni pojmovi multimedije	2021-03-03	12:00:00	13:30:00	38	f		f
3181	Vježbe	O-366	1	Uvod u vježbe	2021-03-04	14:00:00	15:30:00	38	f	G1	f
3182	Vježbe	O-366	1	Uvod u vježbe	2021-03-04	15:45:00	17:15:00	38	f	G2	f
3183	Predavanja	online	0	Grafika 1	2021-03-10	12:00:00	13:30:00	38	f		f
3184	Vježbe	O-366	1	Rasterska grafika I	2021-03-11	14:00:00	15:30:00	38	f	G1	f
3185	Vježbe	O-366	1	Rasterska grafika I	2021-03-11	15:45:00	17:15:00	38	f	G2	f
3186	Predavanja	online	0	Grafika 2	2021-03-17	12:00:00	13:30:00	38	f		f
3187	Vježbe	O-366	1	Rasterska grafika II	2021-03-18	14:00:00	15:30:00	38	f	G1	f
3188	Vježbe	O-366	1	Rasterska grafika II	2021-03-18	15:45:00	17:15:00	38	f	G2	f
3189	Predavanja	online	0	WWW,  HTML, CSS 1	2021-03-24	12:00:00	13:30:00	38	f		f
3190	Vježbe	O-366	1	Vektorska grafika I	2021-03-25	14:00:00	15:30:00	38	f	G1	f
3191	Vježbe	O-366	1	Vektorska grafika I	2021-03-25	15:45:00	17:15:00	38	f	G2	f
3192	Predavanja	online	0	WWW,  HTML, CSS 2	2021-03-31	12:00:00	13:30:00	38	f		f
3193	Vježbe	O-366	1	Vektorska grafika II	2021-04-01	14:00:00	15:30:00	38	f	G1	f
3194	Vježbe	O-366	1	Vektorska grafika II	2021-04-01	15:45:00	17:15:00	38	f	G2	f
3195	Predavanja	online	0	Tekst	2021-04-07	12:00:00	13:30:00	38	f		f
3196	Vježbe	O-366	1	Ponavljanje	2021-04-08	14:00:00	15:30:00	38	f	G1	f
3197	Vježbe	O-366	1	Ponavljanje	2021-04-08	15:45:00	17:15:00	38	f	G2	f
3198	Predavanja	online	0	Animacija	2021-04-14	12:00:00	13:30:00	38	f		f
3199	Vježbe	O-366	1	1. kolokvij – teorija (Merlin provjera) i praktični dio	2021-04-15	14:00:00	15:30:00	38	f		f
3200	Predavanja	online	0	Video	2021-04-21	12:00:00	13:30:00	38	f		f
3201	Vježbe	O-366	1	Obrada videa	2021-04-22	14:00:00	15:30:00	38	f	G1	f
3202	Vježbe	O-366	1	Obrada videa	2021-04-22	15:45:00	17:15:00	38	f	G2	f
3203	Predavanja	online	0	Zvuk	2021-04-28	12:00:00	13:30:00	38	f		f
3204	Vježbe	O-366	1	Obrada zvuka	2021-04-29	14:00:00	15:30:00	38	f	G1	f
3205	Vježbe	O-366	1	Obrada zvuka	2021-04-29	15:45:00	17:15:00	38	f	G2	f
3206	Predavanja	online	0	Web dizajn	2021-05-05	12:00:00	13:30:00	38	f		f
3207	Vježbe	O-366	1	HTML i CSS	2021-05-06	14:00:00	15:30:00	38	f	G1	f
3208	Vježbe	O-366	1	HTML i CSS	2021-05-06	15:45:00	17:15:00	38	f	G2	f
3209	Predavanja	online	0	Responzivni web dizajn	2021-05-12	12:00:00	13:30:00	38	f		f
3210	Vježbe	O-366	1	Responzivni web I	2021-05-13	14:00:00	15:30:00	38	f	G1	f
3212	Predavanja	online	0	Dizajniranje weba za poslovanje	2021-05-19	12:00:00	13:30:00	38	f		f
3213	Vježbe	O-366	1	Responzivni web II	2021-05-20	14:00:00	15:30:00	38	f	G1	f
3214	Vježbe	O-366	1	Responzivni web II	2021-05-20	15:45:00	17:15:00	38	f	G2	f
3215	Predavanja	online	0	Izrada analize web sjedišta	2021-05-26	12:00:00	13:30:00	38	f		f
3216	Vježbe	O-366	1	Dovršavanje i objava web sjedišta na web serveru	2021-05-27	14:00:00	15:30:00	38	f	G1	f
3217	Vježbe	O-366	1	Dovršavanje i objava web sjedišta na web serveru	2021-05-27	15:45:00	17:15:00	38	f	G2	f
3218	Predavanja	online	0	Izrada analize web sjedišta	2021-06-02	12:00:00	13:30:00	38	f		f
3219	Predavanja	online	0	Razvoj multimedijskih projekata	2021-06-09	12:00:00	13:30:00	38	f		f
3220	Vježbe	O-366	1	2. kolokvij – teorija (Merlin provjera) i praktični dio	2021-06-10	15:45:00	17:15:00	38	f		f
3221	Predavanja i vježbe	O - S32	2	Uvodno predavanje i vježbe	2021-03-02	08:15:00	09:45:00	47	f	\N	f
3222	Predavanja	O - S32	0	Osnovni pojmovi u programskom inženjerstvu	2021-03-09	08:15:00	09:45:00	47	f	\N	f
3223	Vježbe	O - 366	1	Uvod u logiku programiranja	2021-03-09	10:15:00	13:30:00	47	f	\N	f
3224	Predavanja	Online	0	Kriteriji za procjenu kvalitete softvera	2021-03-16	08:15:00	09:45:00	47	f	\N	f
3225	Vježbe	Online	1	Logika programiranja – zadaci	2021-03-16	10:15:00	13:30:00	47	f	\N	f
3226	Predavanja	Online	0	Modeli softverskog procesa	2021-03-23	08:15:00	09:45:00	47	f	\N	f
3227	Vježbe	Online	1	Logika programiranja – zadaci	2021-03-23	10:15:00	13:30:00	47	f	\N	f
3228	Predavanja	Online	0	Modeli softverskog procesa	2021-03-30	08:15:00	09:45:00	47	f	\N	f
3229	Vježbe	Online	1	Uvod u Clarion; Programski kod u Clarionu (unos podatka, ispis)	2021-03-30	10:15:00	13:30:00	47	f	\N	f
3230	Predavanja	Online	0	Analiza i definicija	2021-04-06	08:15:00	09:45:00	47	f	\N	f
3231	Vježbe	Online	1	Programski kod u Clarionu (IF)	2021-04-06	10:15:00	13:30:00	47	f	\N	f
3232	Predavanja	O-S32	0	Kolokvij - teorija	2021-04-13	08:15:00	09:45:00	47	f	\N	f
3233	Vježbe	Online	1	Programski kod u Clarionu (LOOP, niz – 1.dio )	2021-04-13	10:15:00	13:30:00	47	f	\N	f
3234	Predavanja	Online	0	Analiza i definicija	2021-04-20	08:15:00	09:45:00	47	f	\N	f
3235	Vježbe	Online	1	Programski kod u Clarionu (Niz – 2. dio, matrice)	2021-04-20	10:15:00	13:30:00	47	f	\N	f
3236	Predavanja	Online	0	Dizajn softvera	2021-04-27	08:15:00	09:45:00	47	f	\N	f
3237	Vježbe	Online	1	Programski kod u Clarionu (CASE OF, hide, unhide, enable, disable, group)	2021-04-27	10:15:00	13:30:00	47	f	\N	f
3238	Predavanja	Online	0	Implementacija	2021-05-04	08:15:00	09:45:00	47	f	\N	f
3239	Vježbe	Online	1	Programski kod u Clarionu (Stringovi i zadaci sa stringovima)	2021-05-04	10:15:00	13:30:00	47	f	\N	f
3240	Predavanja	Online	0	Testiranje softvera.	2021-05-11	08:15:00	09:45:00	47	f	\N	f
3241	Vježbe	Online	1	Programski kod u Clarionu (Ponavljanje)	2021-05-11	10:15:00	13:30:00	47	f	\N	f
3242	Predavanja	Online	0	Funkcionalno testiranje softvera	2021-05-18	08:15:00	09:45:00	47	f	\N	f
3243	Vježbe	Online	1	Konzultacije za kolokvij	2021-05-18	10:15:00	13:30:00	47	f	\N	f
3244	Predavanja	Online	0	Strukturno testiranje softvera	2021-05-25	08:15:00	09:45:00	47	f	\N	f
3245	Vježbe	O-366	1	Kolokvij (Clarion)	2021-05-25	10:15:00	13:30:00	47	f	\N	f
3246	Predavanja	Online	0	Održavanje softvera	2021-06-01	08:15:00	09:45:00	47	f	\N	f
3247	Vježbe	O-366	1	Projektni zadatak	2021-06-01	10:15:00	13:30:00	47	f	\N	f
3248	Predavanja	Online	0	Analiza studentskih rezultata, konzultacije za završni ispit	2021-06-08	08:15:00	09:45:00	47	f	\N	f
\.


--
-- Data for Name: activities_class_studentclassactivity; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.activities_class_studentclassactivity (id, name, location, type, details, due_date, start_time, end_time, global_activity_id, student_id, subject_id, attended, "group", active) FROM stdin;
12	Predavanja i vježbe	O-366	2	Uvod u kolegij.	2021-03-01	09:00:00	10:30:00	3125	2	10	f	\N	f
13	Vježbe	online	1	Strateški plan	2021-11-08	08:30:00	10:30:00	3287	2	18	f	\N	t
14	Predavanja	online	0	Krizni menadžment i upravljanje ljudskim potencijalima	2021-11-08	10:00:00	11:30:00	3288	2	18	f	\N	t
15	Vježbe	365	1	Planiranje projekta	2021-10-26	14:00:00	15:30:00	3342	2	19	f	\N	t
16	Predavanja	online	0	Evaluacija projekta	2021-11-09	14:00:00	15:30:00	3346	2	19	f	\N	t
17	Vježbe	online	1	Project Libre zadatak za bodove	2021-11-09	16:00:00	17:30:00	3347	2	19	f	\N	t
\.


--
-- Data for Name: activities_score_globalscoreactivity; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.activities_score_globalscoreactivity (id, name, location, type, details, points_accomplished, points_total, due_date, start_time, end_time, subject_id, completed, "group", active) FROM stdin;
1093	Rasprava	357	7	Rasprave na forumu	0	20	2021-11-24	10:00:00	11:30:00	20	\N	\N	t
1094	Projekt	357	8	Predaja i prezentacija startup prijave/nacrta	0	30	2022-01-19	10:00:00	11:30:00	20	\N	\N	t
1095	Završni ispit	357	1	Završni ispit	0	50	2022-02-09	00:00:00	23:59:00	20	\N	\N	t
1096	Kolokvij	O-357	0	KOLOKVIJ	0	20	2021-11-15	10:00:00	11:30:00	18	\N	\N	t
1097	Projekt	O-357	8	Prezentacija virtualnog poduzeća	0	40	2022-01-17	08:30:00	11:30:00	18	\N	\N	t
1099	Završni ispit	O-357	1	Završni ispit	0	30	2022-02-02	00:00:00	23:59:00	18	\N	\N	t
1103	Završni ispit	359	1	Završni ispit	0	30	2022-02-11	00:00:00	23:59:00	22	\N	\N	t
1112	Domaća zadaća	online	4	Pregled tehnologija i alata za upravljanje znanjem. 1. DZ	0	5	2021-10-19	10:00:00	11:30:00	24	\N	\N	t
1113	Seminar	online	2	Seminarski rad	0	10	2021-11-02	08:15:00	09:45:00	24	\N	\N	t
1114	Kolokvij	365	0	1. kolokvij iz teorije	0	10	2021-11-02	08:15:00	09:45:00	24	\N	\N	t
1115	Domaća zadaća	365	4	Analiza kompleksnih mreža primjenom funkcija iz paketa NetworkX\n2. DZ	0	5	2021-11-16	10:00:00	11:30:00	24	\N	\N	t
1116	Kolokvij	365	0	2. kolokvij iz teorijskog dijela	0	10	2021-12-14	08:15:00	09:45:00	24	\N	\N	t
1118	Završni ispit		1	Završni ispit	0	30	2022-02-09	10:00:00	11:30:00	24	\N	\N	t
1119	Seminar	365	2	Predaja projektnog seminara	0	30	2022-01-11	16:00:00	17:30:00	19	\N	\N	t
1120	Projekt	365	8	Predstavljanje seminara	0	10	2022-01-18	16:00:00	17:30:00	19	\N	\N	t
1121	Završni ispit	365	1	Završni ispit	0	30	2022-02-08	10:00:00	11:30:00	19	\N	\N	t
1122	Rasprava	online	7	Rasprave na forumu	0	5	0001-01-01	08:30:00	10:00:00	18	\N	\N	t
1123	Aktivnost	online	11	Aktivnost	0	5	0001-01-01	16:00:00	17:30:00	22	\N	\N	t
1124	Domaća zadaća	online	4	Praktični rad (vježbe)	0	30	0001-01-01	16:00:00	17:30:00	22	\N	\N	t
1125	Seminar	online	2	Seminarski rad (teorija)	0	35	0001-01-01	16:00:00	17:30:00	22	\N	\N	t
1126	Domaća zadaća	365	4	1. Zadatak za bodove	0	5	0001-01-01	16:00:00	17:30:00	19	\N	\N	t
1127	Domaća zadaća	365	4	2. Zadatak za bodove	0	5	0001-01-01	16:00:00	17:30:00	19	\N	\N	t
1128	Domaća zadaća	365	4	3. Zadatak za bodove	0	5	0001-01-01	16:00:00	17:30:00	19	\N	\N	t
1129	Domaća zadaća	365	4	4. Zadatak za bodove	0	5	0001-01-01	16:00:00	17:30:00	19	\N	\N	t
1130	Rasprava	online	7	Recenzija ostalih projektnih planova	0	10	0001-01-01	16:00:00	17:30:00	19	\N	\N	t
1131	Projekt	365	8	Projektni zadaci	0	30	0001-01-01	10:00:00	11:30:00	24	\N	\N	t
\.


--
-- Data for Name: activities_score_studentscoreactivity; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.activities_score_studentscoreactivity (id, name, location, type, details, points_accomplished, points_total, due_date, start_time, end_time, global_activity_id, student_id, subject_id, completed, "group", active) FROM stdin;
196	Zadaća iz teorije igara	O-350	4	Zadaća iz teorije igara	5	5	2021-10-25	08:30:00	22:00:00	\N	2	18	t	\N	t
192	Domaća zadaća	365	4	1. Zadatak za bodove	5	5	2021-11-02	14:00:00	17:30:00	1126	2	19	t	\N	t
199	Domaća zadaća	365	4	2. Zadatak za bodove	2	2	2021-11-02	16:00:00	17:30:00	1127	2	19	t	\N	t
201	Domaća zadaća	online	4	Pregled tehnologija i alata za upravljanje znanjem. 1. DZ	4.5	5	2021-10-19	10:00:00	11:30:00	1112	2	24	t	\N	t
197	Seminar	online	2	Seminarski rad (teorija)	35	35	2021-11-12	16:00:00	17:30:00	1125	2	22	t	\N	t
202	Domaća zadaća	365	4	4. Zadatak za bodove	3	3	2021-11-15	16:00:00	17:30:00	1129	2	19	t	\N	t
203	Kolokvij	O-357	0	KOLOKVIJ	19	20	2021-11-15	10:00:00	11:30:00	1096	2	18	t	\N	t
189	Rasprava	357	7	Rasprave na forumu	5	5	2021-10-24	10:00:00	11:30:00	1093	2	20	t	\N	t
193	Rasprava na forumu	online	7	2. rasprava	5	5	2021-10-31	00:00:00	23:59:00	\N	2	20	t	\N	t
194	Rasprava na forumu	online	7	3. rasprava	5	5	2021-11-07	00:00:00	23:59:00	\N	2	20	t	\N	t
195	Rasprava na forumu	online	7	4. rasprava	1	5	2021-11-14	00:00:00	23:59:00	\N	2	20	t	\N	t
204	Domaća zadaća	365	4	4. Zadatak za bodove	4	4	2021-11-25	16:00:00	17:30:00	1128	2	19	t	\N	t
205	DZ5	online	4	Dz5	4	4	2021-12-01	16:00:00	17:30:00	1130	2	19	t	\N	t
198	Praktični rad	online	8	Praktični rad (vježbe)	30	30	2021-12-03	10:00:00	11:30:00	1124	2	22	t	\N	t
208	Kolokvij	365	0	1. kolokvij iz teorije	8	10	2021-11-02	08:15:00	09:45:00	1114	2	24	t	\N	t
209	DZ 6	online	4		2	2	2021-12-15	09:00:00	10:00:00	\N	2	19	t	\N	t
206	Kolokvij	365	0	2. kolokvij iz teorijskog dijela	7.5	10	2021-12-21	08:15:00	09:45:00	1116	2	24	t	\N	t
200	Seminar	online	2	Seminarski rad	8	10	2021-12-01	08:15:00	09:45:00	1113	2	24	t	\N	t
210	Projekt	357	8	Predaja i prezentacija startup prijave/nacrta	27	30	2022-01-19	10:00:00	11:30:00	1094	2	20	t	\N	t
211	Seminar	365	2	Predaja projektnog seminara	26.5	30	2022-01-11	16:00:00	17:30:00	1119	2	19	t	\N	t
220	Završni ispit	365	1	Završni ispit	22.57	30	2022-02-22	10:00:00	11:30:00	1121	2	19	t	\N	t
212	Prezentacija	365	3	Predstavljanje seminara	9	10	2022-01-18	16:00:00	17:30:00	1120	2	19	t	\N	t
213	Recenzija	online	3	Recenzija	9	10	2022-01-18	16:00:00	17:30:00	\N	2	19	t	\N	t
215	Projekt	O-357	8	Prezentacija virtualnog poduzeća	25	40	2022-01-17	08:30:00	11:30:00	1097	2	18	t	\N	t
217	Domaća zadaća	365	4	Analiza kompleksnih mreža primjenom funkcija iz paketa NetworkX\r\n2. DZ	7	7	2022-01-16	10:00:00	11:30:00	1115	2	24	t	\N	t
191	Rasprava	online	7	Rasprave na forumu	3	5	2021-10-24	08:30:00	10:00:00	1122	2	18	t	\N	t
207	Projekt	365	8	Projektni zadaci	27	28	2021-12-19	10:00:00	11:30:00	1131	2	24	t	\N	t
216	Završni ispit	O-357	1	Završni ispit je pisani ispit koji sadrži gradivo s predavanja i vježbi obrađeno nakon teorijskog kolokvija. Završni ispit nosi udio od maksimalno 30 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno riješenih zadataka).	26	30	2022-02-02	00:00:00	23:59:00	1099	2	18	t	\N	t
218	Aktivnost	online	11	Aktivnost - dolasci na predavanja	2.25	3	2022-01-24	08:00:00	09:00:00	\N	2	24	t	\N	t
219	Završni ispit	online	1	Završni ispit	25.75	30	2022-02-09	10:00:00	11:30:00	1118	2	24	t	\N	t
221	Završni ispit	357	1	Završni ispit	0	50	2022-03-27	00:00:00	23:59:00	1095	2	20	f	\N	t
214	Aktivnost	online	11	Aktivnost	1	5	2022-01-21	16:00:00	17:30:00	1123	2	22	t	\N	t
222	Završni ispit	359	1	Završni ispit	25	30	2022-02-25	00:00:00	23:59:00	1103	2	22	t	\N	t
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Student	7	add_student
26	Can change Student	7	change_student
27	Can delete Student	7	delete_student
28	Can view Student	7	view_student
29	Can add Student - Kolegiji	8	add_studentsubjects
30	Can change Student - Kolegiji	8	change_studentsubjects
31	Can delete Student - Kolegiji	8	delete_studentsubjects
32	Can view Student - Kolegiji	8	view_studentsubjects
33	Can add Odjel	9	add_department
34	Can change Odjel	9	change_department
35	Can delete Odjel	9	delete_department
36	Can view Odjel	9	view_department
37	Can add Sveučilište	10	add_university
38	Can change Sveučilište	10	change_university
39	Can delete Sveučilište	10	delete_university
40	Can view Sveučilište	10	view_university
41	Can add Studij	11	add_program
42	Can change Studij	11	change_program
43	Can delete Studij	11	delete_program
44	Can view Studij	11	view_program
45	Can add Kolegij	12	add_subject
46	Can change Kolegij	12	change_subject
47	Can delete Kolegij	12	delete_subject
48	Can view Kolegij	12	view_subject
49	Can add Programi po kolegiju	13	add_subjectprograms
50	Can change Programi po kolegiju	13	change_subjectprograms
51	Can delete Programi po kolegiju	13	delete_subjectprograms
52	Can view Programi po kolegiju	13	view_subjectprograms
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
16	pbkdf2_sha256$216000$QQQ7rPAokmxN$DBi7hVM8REEaqH/rygR6AWhmvDHTysHwmgw2AV2W1H4=	2021-02-04 18:27:36.849133+00	f	Ines	Ines	Mržljak	ines1208mrzljak@gmail.com	f	t	2021-02-04 18:27:36.601936+00
17	pbkdf2_sha256$216000$s6f1K5k6454C$2pLJhXRRrDVfQmqUJ9JdbjCIr4VcEDbtl+wOud5h/JI=	2021-02-04 18:29:52.963227+00	f	atoic	Andrea	Toic	andrea.toic@hotmail.com	f	t	2021-02-04 18:29:52.769204+00
18	pbkdf2_sha256$216000$my6UDTYWDnzg$C02WbM1lm8rEqJQkA5vkTDga7lOj4TfCcu406LmKGJY=	2021-02-04 18:44:26.707825+00	f	Jmakaj	Jasmin	Makaj	jasmin.makaj@gmail.com	f	t	2021-02-04 18:44:26.532181+00
11	pbkdf2_sha256$216000$MgnjpXobCCwP$JPfMLiqW7TRkT1XeqL8qQpxldiO0PHB0nRMPuTmaAJ8=	2021-01-30 14:45:15.406087+00	f	bane	Ivan	Banovic	ibanovic@outlook.com	f	t	2021-01-30 14:45:15.139949+00
19	pbkdf2_sha256$216000$KE3rkcKQ6T2J$g5HIdnFIcWl6WdiLivtduGmuc1bGjLn5PdWy4f1OePQ=	2021-02-04 18:49:07.528927+00	f	Damjan	Damjan	Kraljić	damjan.kraljic01@gmail.com	f	t	2021-02-04 18:49:07.354379+00
20	pbkdf2_sha256$216000$T8919hUfd5Gz$1NDOBXHXI+QrRbcOR4Avsmkz0X8f/c3Jod74E32deuQ=	2021-02-04 19:03:59.877238+00	f	Kaker	Anonimni	Kaker	kaker@gmail.com	f	t	2021-02-04 19:03:59.704795+00
21	pbkdf2_sha256$216000$Ne4sNZEeGUHF$HAvECjcLhVcXV3ADMqLZrP589ZDkivX/Tw0XDu39+X8=	2021-02-04 19:14:36.721926+00	f	AnamariaM	Anamaria	Marjanović	anamaria.marjanovi6@gmail.com	f	t	2021-02-04 19:14:36.533808+00
22	pbkdf2_sha256$216000$JeIopV25pIz1$GOqBw8NGkTnmBmKHizHjem4a+oxF0XLl2+2wOJAzRvY=	2021-02-04 20:08:57.128687+00	f	tmargan	Tino	Margan	tinomargan@gmail.com	f	t	2021-02-04 20:08:56.949466+00
23	pbkdf2_sha256$216000$EWD4iWALa7jx$sVE4jhA/yHeoV8TglC1gEb1vACDxCbPDIo3nP2nvHdQ=	2021-02-04 20:38:31.047647+00	f	Marti	Martina	Ilijanic	martina.ilijanic@gmail.com	f	t	2021-02-04 20:38:30.873005+00
24	pbkdf2_sha256$216000$XxKDK7v2Zrwz$opKhMYpcPmnianIsJoLhBDt/PbcY1EdNkPDKGwvTqfk=	2021-02-04 22:39:30.060523+00	f	anano	Ana	Novokmet	ana.novokmet@hotmail.com	f	t	2021-02-04 22:39:29.851979+00
8	pbkdf2_sha256$216000$Wo6cMfmDS10J$7keu/22OpWC3G5boElfO4R7cZk1K3YsjH11tS8X3v54=	2021-02-05 16:38:44.214544+00	f	dejvi96	David	Janeš	davidjanes2@hotmail.com	f	t	2021-01-20 14:37:15.910016+00
14	pbkdf2_sha256$216000$013fj1x6v5EX$fBuFI4SrOOkdajSiM6w/j9mg0kXXYwzV2kDdPNSUHB4=	2021-01-31 19:19:09.316107+00	f	pluka	Luka	Paladin	paladin.luka@gmail.com	f	t	2021-01-31 19:19:09.126823+00
29	pbkdf2_sha256$216000$uVJvvJeRe7VR$TpALUg39JtITEbpcZZSBliTa9E+TAKDOA2rFPNelVcM=	2021-03-02 18:14:56.283463+00	f	iks	Test	Diplomski - Iks	iks@uniri.hr	f	t	2021-03-02 18:14:56.098827+00
26	pbkdf2_sha256$216000$dENUhzAYpqY6$pCFlUhoANXX8BnJUC7eRktfKGSts5niGhZjJslja3pE=	2021-02-05 19:51:13.024978+00	f	LordBayron	Dorian	Beli	dorian.beli69@gmail.com	f	t	2021-02-05 19:51:12.798864+00
12	pbkdf2_sha256$216000$0Fi97179JRlX$PDLkKjNuMsQfAFWub18dqnaAIcqTfdTSyHc2wOo3yBQ=	2021-03-03 20:40:04.14685+00	f	pperic	Pero	Perić	pperic@pero.com	f	t	2021-01-31 11:21:40.839391+00
13	pbkdf2_sha256$216000$BrvX7FUPxWDk$0UQshnzXEszI1QjkqE5N704gFf+aUx2ttaC+s5Ltt58=	2021-02-02 18:59:58.70044+00	f	flakoseljac	Filip	Lakoseljac	lakoseljac.filip@gmail.com	f	t	2021-01-31 19:10:13.593769+00
15	pbkdf2_sha256$216000$SexG3OxdeVzf$28gxI3kN7zek7U2CkzZd0lWBJyhgteVnpQ/ADmjKQBA=	2021-02-03 19:02:39.450992+00	f	Nkuhar	Nikolina	Kuhar	Nikolina.kuhar@student.uniri.hr	f	t	2021-02-03 19:02:39.120915+00
27	pbkdf2_sha256$216000$IkxdcklueSMy$yo2jgP3SIcPENB369j0mfzeD0WRrM5hBSgy690/HPrE=	2021-02-10 12:16:48.393555+00	f	Katarinab	Katarina	Brkljača	katarina.brkljaca10@gmail.com	f	t	2021-02-10 12:16:48.186576+00
5	pbkdf2_sha256$216000$aMHe8v2Odlt4$AHnWemBsus1300EMnywwLTIE0a1bDkVSa2f05WzI/oU=	2021-01-20 14:38:12+00	f	tp	Toni	Percan	toni.percan@gmail.com	t	t	2021-01-11 17:32:39+00
25	pbkdf2_sha256$216000$6VIJKxY9jC5q$Bq6z4nLI8BNG2RSnoM2k1h1tIixbuPylJ43RTfMzHrg=	2021-02-05 16:37:59+00	f	karlo.mmolnar4@gmail.com	Karlo	Molnar	karlo.mmolnar4@gmail.com	t	t	2021-02-05 16:37:58+00
30	pbkdf2_sha256$216000$TOGg2MQt9VDB$dhzn8xZ5yAdI2ti1MHPewmFzCYRqscU0F7NS+k0klv4=	2021-04-05 06:57:47.436249+00	f	petarmix5@gmail.com	Petar	Mikić	petarmix5@gmail.com	f	t	2021-04-05 06:57:47.207793+00
9	pbkdf2_sha256$216000$zAsOTAbrIVKL$0F+WQSS8Q6rZwsZflTq3Kp1MpnN4FYidenVthP0x8rw=	2021-02-03 19:08:14+00	t	ViceT	Vice	Tomaš	vicenco.tomas2@gmail.com	t	t	2021-01-26 08:17:03+00
7	pbkdf2_sha256$216000$1CcvyI3D9cti$hY9NTW6//5Wo3G6VHW/6Ys4KcNaeS6P/+Xq4wD0M5ps=	2021-02-17 19:19:06.825727+00	f	aanic	ana	anic	ana.anic@gmail.com	f	t	2021-01-11 17:37:43.431975+00
28	pbkdf2_sha256$216000$dn0Bf5t2uzuZ$yp/diGiJ1mzrHg11YS5k/QUHFTx+MEHX/4XuKCWYRRo=	2021-02-19 16:36:22.665219+00	f	Ljel	Luka	Jelenkovic	l.jel@gmail.com	f	t	2021-02-19 16:36:22.449112+00
31	pbkdf2_sha256$216000$u8RpiWtYdsn1$3w2zlCCL3Bpo/9R+vyw6kLxqHxyNOo2gXKGs6nx7fpY=	2022-01-09 19:26:12.15768+00	f	pperic@uniri.hr	Pero	Perić	pero@peric.com	f	t	2022-01-09 19:26:11.993281+00
3	pbkdf2_sha256$216000$GNy5dQPOfRVh$7NH23gp9s2kZWo8j6SpEs/T1C7vWzvfui4IKUNOfdAg=	2022-12-02 08:05:58.763832+00	t	andhrelja	Andrea	Hrelja	andhrelja@hotmail.com	t	t	2020-12-24 16:56:34+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: departments_department; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.departments_department (id, name, code, address, email, contact, web, university_id) FROM stdin;
1	Odjel za biotehnologiju	BIOTECH	Ul. Radmile Matejčić 2, 51000, Rijeka	ured@biotech.uniri.hr	+385 51 584 550	https://biotech.uniri.hr	1
2	Odjel za fiziku	PHY	Ul. Radmile Matejčić 2, 51000, Rijeka	ured@phy.uniri.hr	+385 51 584 600	https://phy.uniri.hr	1
4	Odjel za matematiku	MATH	Ul. Radmile Matejčić 2, 51000, Rijeka	math@math.uniri.hr	+385 51 584 650	https://math.uniri.hr	1
5	Akademija primijenjenih umjetnosti	APURI	Ulica Slavka Krautzeka 83, 51000, Rijeka	pravna@apuri.uniri.hr	+385 51 228 881	https://apuri.hr	1
6	Ekonomski fakultet	EFRI	Ivana Filipovića 4, 51000, Rijeka	efri@efri.hr	+385 51 355 111	https://efri.uniri.hr	1
7	Fakultet dentalne medicine	FDMRI	Krešimirova 40/42, 51000, Rijeka	dekanat@fdmri.uniri.hr	+385 51 345 631	https://fdmri.uniri.hr	1
8	Fakultet za menadžment u turizmu i ugostiteljstvu	FTHM	Krešimirova 40/42, 51000, Rijeka	dekanat@fthm.hr	+385 51 294 700	https://fthm.uniri.hr	1
9	Fakultet zdravstvenih studija	FZSRI	Ul. Viktora cara Emina 5, 51000, Rijeka	dekanatfzsri@uniri.hr	+385 51 688 266	https://fzsri.uniri.hr	1
10	Filozofski fakultet	FFRI	Sveučilišna Avenija 4, 51000, Rijeka	pmatic@ffri.hr	+385 51 265 600	https://ffri.uniri.hr	1
11	Građevinski fakultet	GRADRI	Ul. Radmile Matejčić 3, 51000, Rijeka	info@gradri.uniri.hr	+385 51 265 900	https://gradri.uniri.hr	1
12	Medicinski fakultet	MEDRI	Ul. Braće Branchetta 20/1, 51000, Rijeka	dekanat_medri@uniri.hr	+385 51 651 111	https://medri.uniri.hr	1
13	Pravni fakultet	PRAVRI	Hahlić 6, 51000, Rijeka	dekanat@pravri.hr	+385 51 359 500	https://pravri.uniri.hr	1
14	Pomorski fakultet	PFRI	Studentska ul. 2, 51000, Rijeka	dekanat@pfri.hr	+385 51 338 411	https://pfri.uniri.hr	1
15	Tehnički fakultet	RITEH	Vukovarska ul. 58, 51000, Rijeka	dekanat@riteh.hr	+385 51 651 444	https://riteh.uniri.hr	1
16	Učiteljski fakultet	UFRI	Sveučilišna Avenija 6, 51000, Rijeka	dekanat@ufri.hr	+385 51 265 800	https://ufri.uniri.hr	1
17	Sveučilište u Rijeci	UNI	Trg braće Mažuranića 10, 51000, Rijeka	ured@uniri.hr	+385 51 406 500	https://uniri.hr	1
3	Odjel za informatiku	INF	I see what you did there :D	ured@inf.uniri.hr	+385 51 584 700	https://inf.uniri.hr	1
\.


--
-- Data for Name: departments_program; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.departments_program (id, name, type, department_id) FROM stdin;
1	Biotehnologija i istraživanje lijekova	preddiplomski	1
2	Istraživanje i razvoj lijekova	diplomski	1
3	Biotehnologija u medicini	diplomski	1
4	Medicinska kemija	diplomski	1
5	Fizika	preddiplomski	2
6	Fizika	diplomski	2
7	Fizika i matematika (nastavnički smjer)	diplomski	2
8	Fizika i informatika (nastavnički smjer)	diplomski	2
9	Fizika i filozofija (nastavnički smjer)	diplomski	2
10	Inženjerstvo i fizika materijala	diplomski	2
11	Jednopredmetna informatika	preddiplomski	3
13	Informatika (modul: Poslovna informatika)	diplomski	3
14	Informatika (modul: Informacijski i komunikacijski sustavi)	diplomski	3
15	Informatika (nastavnički smjer)	diplomski	3
17	Matematika	preddiplomski	4
18	Matematika i informatika (nastavnički smjer)	diplomski	4
19	Diskretna matematika i primjene	diplomski	4
20	Diskretna matematika i primjene (na engleskom jeziku)	diplomski	4
21	Likovna pedagogija	preddiplomski	5
22	Primijenjena umjetnost	preddiplomski	5
23	Gluma i mediji	preddiplomski	5
24	Likovna pedagogija	diplomski	5
25	Primijenjena umjetnost	diplomski	5
26	Medijske umjetnosti i prakse	diplomski	5
27	Vizualne komunikacije i grafički dizajn	diplomski	5
28	Gluma i mediji	diplomski	5
29	Ekonomija	preddiplomski	6
30	Poslovna ekonomija	preddiplomski	6
31	Ekonomija	diplomski	6
32	Poslovna ekonomija	diplomski	6
33	Poslovna ekonomija, smjer Poduzetništvo – online studij	diplomski	6
34	Dentalna medicina	preddiplomski	7
35	Dentalna higijena	preddiplomski	7
36	Dental medicine in English	preddiplomski	7
37	Fizioterapija	diplomski	7
38	Sestrinstvo – Promicanje i zaštita mentalnog zdravlja	diplomski	7
39	Sestrinstvo – Menadžment u sestrinstvu	diplomski	7
40	Medicinsko laboratorijska dijagnostika	diplomski	7
41	Klinički nutricionizam	diplomski	7
42	Primaljstvo	diplomski	7
43	Poslovna ekonomija u turizmu i ugostiteljstvu (Opatija i Zabok)	preddiplomski	8
44	Menadžment održivog razvoja	preddiplomski	8
45	Marketing u turizmu	diplomski	8
46	Menadžment u turizmu	diplomski	8
47	Menadžment u hotelijerstvu	diplomski	8
48	Održivi razvoj turizma	diplomski	8
49	Turizam (združeni studij)	diplomski	8
50	Sestrinstvo	preddiplomski	9
51	Fizioterapija	preddiplomski	9
52	Radiološka tehnologija	preddiplomski	9
53	Primaljstvo	preddiplomski	9
54	Jednopredmetni studij – Hrvatski jezik i književnost	preddiplomski	10
55	Jednopredmetni studij – Psihologija	preddiplomski	10
56	Jednopredmetni studij – Pedagogija	preddiplomski	10
57	Jednopredmetni studij – Kulturlogija	preddiplomski	10
58	Dvopredmetni studij s Hrvatski jezik i književnost	preddiplomski	10
59	Dvopredmetni studij s Engleski jezik i književnost	preddiplomski	10
60	Dvopredmetni studij s Njemački jezik i književnost	preddiplomski	10
61	Dvopredmetni studij s Talijanski jezik i književnost	preddiplomski	10
62	Dvopredmetni studij s Filozofija	preddiplomski	10
63	Dvopredmetni studij s Povijest	preddiplomski	10
64	Dvopredmetni studij s Povijest umjetnosti	preddiplomski	10
65	Dvopredmetni studij s Pedagogija	preddiplomski	10
66	Jednopredmetni studij s Hrvatski jezik i književnost smjer nastavnički, kroatistički	diplomski	10
67	Jednopredmetni studij s Psihologija	diplomski	10
68	Jednopredmetni studij s Pedagogija	diplomski	10
69	Jednopredmetni studij s Kulturologija	diplomski	10
70	Jednopredmetni studij s Talijanski jezik i knjževnost	diplomski	10
71	Dvopredmetni studij s Hrvatski jezik i književnost	diplomski	10
72	Dvopredmetni studij s Engleski jezik i književnost	diplomski	10
73	Dvopredmetni studij s Njemački jezik i književnost	diplomski	10
74	Dvopredmetni studij s Filozofija	diplomski	10
75	Dvopredmetni studij s Povijest	diplomski	10
76	Dvopredmetni studij s Povijest umjetnosti	diplomski	10
77	Dvopredmetni studij s Pedagogija	diplomski	10
78	Dvopredmetni – Prevoditeljski studij	diplomski	10
79	Dvopredmetni – Povijest i interpretacija baštine	diplomski	10
80	Građevinarstvo	preddiplomski	11
81	Građevinarstvo (stručni)	preddiplomski	11
82	Dvopredmetni studij s Engleski jezik i književnost	preddiplomski	11
83	Dvopredmetni studij s Njemački jezik i književnost	preddiplomski	11
84	Dvopredmetni studij s Talijanski jezik i književnost	preddiplomski	11
85	Dvopredmetni studij s Filozofija	preddiplomski	11
86	Dvopredmetni studij s Povijest	preddiplomski	11
87	Dvopredmetni studij s Povijest umjetnosti	preddiplomski	11
88	Dvopredmetni studij s Pedagogija	preddiplomski	11
89	Građevinarstvo	diplomski	11
90	Građevinarstvo (specijalistički diplomski stručni studij)	diplomski	11
91	Jednopredmetni studij s Hrvatski jezik i književnost smjer nastavnički, kroatistički	diplomski	11
92	Jednopredmetni studij s Psihologija	diplomski	11
93	Jednopredmetni studij s Pedagogija	diplomski	11
94	Jednopredmetni studij s Kulturologija	diplomski	11
95	Jednopredmetni studij  Talijanski jezik i knjževnost	diplomski	11
96	Dvopredmetni studij s Hrvatski jezik i književnost	diplomski	11
97	Dvopredmetni studij s Engleski jezik i književnost	diplomski	11
98	Dvopredmetni studij s Njemački jezik i književnost	diplomski	11
99	Dvopredmetni studij s Filozofija	diplomski	11
100	Dvopredmetni studij s Povijest	diplomski	11
101	Dvopredmetni studij s Povijest umjetnosti	diplomski	11
102	Dvopredmetni studij s  Pedagogija	diplomski	11
103	Dvopredmetni – Prevoditeljski studij	diplomski	11
104	Dvopredmetni – Povijest i interpretacija diplomskine	diplomski	11
105	Medicina	preddiplomski	12
106	Medicina na engleskom jeziku	preddiplomski	12
107	Dentalna medicina	preddiplomski	12
108	Dentalna medicina na engleskom jeziku	preddiplomski	12
109	Sanitarno inžinjerstvo	preddiplomski	12
110	Dentalna higijena	preddiplomski	12
111	Sanitarno inžinjerstvo	diplomski	12
112	Pravo	preddiplomski	13
113	Upravni studij	preddiplomski	13
114	Javna uprava	diplomski	13
115	Tehnologija i organizacija prometa	preddiplomski	14
116	Logistika i menadžment u pomorstvu i prometu	preddiplomski	14
117	Nautika i tehnologija pomorskog prometa	preddiplomski	14
118	Brodostrojarstvo	preddiplomski	14
119	Elektroničke i informatičke tehnologije u pomorstvu	preddiplomski	14
120	Tehnologija i organizacija prometa	diplomski	14
121	Logistika i menadžment u pomorstvu i prometu 	diplomski	14
122	Nautika i tehnologija pomorskog prometa 	diplomski	14
123	Brodostrojarstvo i tehnologija pomorskog prometa 	diplomski	14
124	Elektroničke i informatičke tehnologije u pomorstvu 	diplomski	14
125	Strojarstvo	preddiplomski	15
126	Brodogradnja	preddiplomski	15
127	Elektrotehnika	preddiplomski	15
128	Računarstvo	preddiplomski	15
129	Strojarstvo	diplomski	15
130	Brodogradnja	diplomski	15
131	Elektrotehnika	diplomski	15
132	Računarstvo	diplomski	15
133	Učiteljski studij	preddiplomski	16
134	Rani i predškolski odgoj	preddiplomski	16
135	Rani i predškolski odgoj i obrazovanje	diplomski	16
136	Politehnika	preddiplomski	17
137	Politehnika i informatika (nastavnički smjer)	diplomski	17
\.


--
-- Data for Name: departments_university; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.departments_university (id, name, code, address, email, contact) FROM stdin;
1	Sveučilište u Rijeci	UNIRI	Trg braće Mažuranića 10, 51000, Rijeka	ured@uniri.hr	+385 51 406 500
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
5	2021-01-30 19:30:01.057955+00	9	ViceT	2	[{"changed": {"fields": ["password"]}}]	4	3
6	2021-01-31 11:21:26.814172+00	6	pperic	3		4	3
7	2021-01-31 14:29:21.018577+00	10	andreahrelja	3		4	3
8	2021-02-11 13:02:13.6392+00	5	tp	2	[{"changed": {"fields": ["Staff status"]}}]	4	3
9	2021-02-11 13:02:17.889238+00	25	karlo.mmolnar4@gmail.com	2	[{"changed": {"fields": ["Staff status"]}}]	4	3
10	2021-02-17 18:18:23.326418+00	9	ViceT	2	[{"changed": {"fields": ["Superuser status"]}}]	4	3
11	2021-02-17 18:18:42.923032+00	1	admin	3		4	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	accounts	student
8	accounts	studentsubjects
9	departments	department
10	departments	university
11	departments	program
12	subjects	subject
13	subjects	subjectprograms
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	departments	0001_initial	2020-12-24 16:40:58.304029+00
2	subjects	0001_initial	2020-12-24 16:40:58.99079+00
3	subjects	0002_auto_20201223_2356	2020-12-24 16:41:00.268043+00
4	contenttypes	0001_initial	2020-12-24 16:41:00.696102+00
5	auth	0001_initial	2020-12-24 16:41:01.449668+00
6	accounts	0001_initial	2020-12-24 16:41:03.505954+00
7	accounts	0002_auto_20201224_0157	2020-12-24 16:41:04.52216+00
8	activities_class	0001_initial	2020-12-24 16:41:04.993277+00
9	activities_score	0001_initial	2020-12-24 16:41:06.067781+00
10	activities_score	0002_auto_20201213_2318	2020-12-24 16:41:07.252546+00
11	activities_score	0003_auto_20201217_1831	2020-12-24 16:41:07.568933+00
12	activities_score	0004_auto_20201223_2212	2020-12-24 16:41:07.871892+00
13	admin	0001_initial	2020-12-24 16:41:08.254221+00
14	admin	0002_logentry_remove_auto_add	2020-12-24 16:41:08.855935+00
15	admin	0003_logentry_add_action_flag_choices	2020-12-24 16:41:09.142889+00
16	contenttypes	0002_remove_content_type_name	2020-12-24 16:41:09.653269+00
17	auth	0002_alter_permission_name_max_length	2020-12-24 16:41:10.069807+00
18	auth	0003_alter_user_email_max_length	2020-12-24 16:41:10.48279+00
19	auth	0004_alter_user_username_opts	2020-12-24 16:41:10.772348+00
20	auth	0005_alter_user_last_login_null	2020-12-24 16:41:11.134068+00
21	auth	0006_require_contenttypes_0002	2020-12-24 16:41:11.411184+00
22	auth	0007_alter_validators_add_error_messages	2020-12-24 16:41:11.723891+00
23	auth	0008_alter_user_username_max_length	2020-12-24 16:41:12.08691+00
24	auth	0009_alter_user_last_name_max_length	2020-12-24 16:41:12.447085+00
25	auth	0010_alter_group_name_max_length	2020-12-24 16:41:12.822897+00
26	auth	0011_update_proxy_permissions	2020-12-24 16:41:13.176779+00
27	auth	0012_alter_user_first_name_max_length	2020-12-24 16:41:13.63579+00
28	sessions	0001_initial	2020-12-24 16:41:14.046024+00
29	activities_class	0002_studentclassactivity_attended	2020-12-28 21:07:44.923204+00
30	activities_class	0003_globalclassactivity_attended	2020-12-28 21:07:45.32818+00
31	activities_score	0005_auto_20210113_1951	2021-01-13 18:51:57.121521+00
32	subjects	0003_auto_20210103_2324	2021-01-13 18:51:57.531366+00
33	activities_score	0006_auto_20210117_1514	2021-01-17 14:14:21.42356+00
34	activities_class	0004_auto_20210117_1702	2021-01-17 17:25:25.065746+00
35	activities_score	0007_auto_20210117_1702	2021-01-17 17:25:25.504822+00
36	accounts	0003_studentsubjects_semester	2021-02-19 18:46:20.571532+00
37	departments	0002_auto_20210130_1849	2021-02-19 18:46:20.989884+00
38	subjects	0004_auto_20210219_1946	2021-02-19 18:46:21.654517+00
39	activities_score	0008_auto_20210301_1821	2021-03-01 19:23:59.748014+00
40	subjects	0005_auto_20210301_1821	2021-03-01 19:24:00.317692+00
41	subjects	0006_auto_20210301_2023	2021-03-01 19:24:00.61944+00
42	activities_class	0005_auto_20210303_2144	2021-03-03 20:44:58.978372+00
43	activities_score	0009_auto_20210303_2144	2021-03-03 20:44:59.343867+00
44	subjects	0007_subject_description	2021-10-04 17:53:29.475087+00
45	accounts	0004_studentsubjects_active	2021-10-21 19:10:37.311581+00
46	activities_class	0006_auto_20211021_2158	2021-10-21 19:59:01.600731+00
47	activities_score	0010_auto_20211021_2158	2021-10-21 19:59:02.301364+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cbdaludd5hqezi7qruo4laht24kgn2t6	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lAcRK:JRl_3Ha23kvQeZmBmy6vnD6qYZMhR_t9VeC0FQhOWAk	2021-02-26 17:41:10.569913+00
wyw0ntfonc6dn5cnwhg59rxgcudm0z7f	.eJxdjMEOgjAQRP-lZ9LsboFGj979hma7XQQVSFo4GOO_CwkXPc6bN_M2LJx0HCS8lLM5ExBUpuioZdEtG2cqE3hd-rAWzWFIG8M_GFkeOu1NuvN0m63M05KHaHfFHm2x1znp83K4Pwc9l35bS6ctEjhhJqhPHrBTIo2oCCDec9OCMBI6BGTHHrVJO6gbHyk68_kCYtBCtg:1l6dYS:Mt7wK2H3EOamgGgBe7eO3x4_o-8qXzLZ4vhauinRDyU	2021-02-15 18:04:04.092367+00
5lu7jjp7z0qkitrqxa976tgmus7yto2b	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1l4hQx:vmLg_Y8HiiSIJUENaEgFD4-t_cYYgGfqEIV4BeUDxkw	2021-02-10 09:48:19.407721+00
e833270vgcqop711367jw3pt7ypavqy6	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lCh25:0Hsg6m15TpXwhQuopYJ3McI057C3ayGfylLEGvQ3q3A	2021-03-04 10:59:41.976299+00
mw2owwgavle5uxdwf97udhkfthavlip8	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1l70l6:XBpfrNT92E8amFPSOIq9hWeEiLw0t1jb05cR-QscNXY	2021-02-16 18:50:40.579701+00
txwxqlopum6i0n4cyuq4bclk07wd40hf	.eJxVjDsOgzAQRO-yNbIW2_iTMn3OYC32OpAEkDAUUZS7x5FoKKZ582Y-UHjisvEKF2ihAYqUeBpjeDNVJlFiA4H2bQh74TWMqYoKTqyn-OT5X6QHzfdFxGXe1rEXf0UcbRG3JfHrering4HKUNfoZecyGosmkbSWPWbFsZWqd74GHWXtEVFrHaVm20lU5Iwz2aZOM3x_CAtBuQ:1kuIF2:t7ubBxCNWgXrCiLEWmVzN1esFHmwow0vE6vL3nsdkOg	2021-01-12 16:53:00.117189+00
e0q8inii6cfg8kfa6wo4gqzozs4g9pk2	.eJxVjDkOgzAURO_iGlleMOCU6XMG69t_HMgCEoYiinL3gERDOW_ezFdQIsZ7SOEDmsXFKKMqUfBGWbBloUUlAq1LH9aCOQy8MXdmkdIT417wg8b7JNM0LvMQ5a7Ioy3yNjFe18M9HfRU-m3to4o216oxNXmV4XPqmJRmctFZBUSndSb4xNx1ALxukUxrWwvTOCN-f13NQ8E:1l1TFp:FLuJolUpXeyKwQowdMq1exBPvAXoYoFrbSl3XPXHyLw	2021-02-01 12:03:29.359999+00
rp0r82io1dhtzt995ibvx9in0se78ooz	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lDCbG:39WNiBhh1xuwSgaX_md-ZNNnq8evNZHgb4Q8Bw_wUTA	2021-03-05 20:42:06.408087+00
ikszpmn5932prpix7349vvezhlrxluxb	.eJxVjDsOgzAQRO_iGlmLf8SU6XMGy95dB_IBCUMRRbl7jESRlDNv3rxFiNs6hK3wEkYSvVAgmt8yRbzztBO6xek6S5yndRmT3CfyoEVeZuLH-dj-HQyxDNXO2UHrgKzxCjufO4MaLCPElo3WVjOwyz5lY0kZnS2dHFUB2WtrTaqnESPxc8Tw4riIXoGCRhR-clm5ZtGKzxedSkLU:1l7kKo:zavDvV6PjHMjpVMkIdiO5MaOMkdZa2sToA2OlliRXzk	2021-02-18 19:30:34.708792+00
2kap74dmll619dvtko64gt5pjff4vhop	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1kzlR6:6lfSi90d8yuHSa74Y43B7QxzqiH8vgL6fIrwRgBrFus	2021-01-27 19:04:04.56084+00
tef8drp16om8k7rp6p0ga0s2z0nkvdsf	.eJxdjMEOgjAQRP-lZ9LsboFGj979hma7XQQVSFo4GOO_CwkXPc6bN_M2LJx0HCS8lLM5ExBUpuioZdEtG2cqE3hd-rAWzWFIG8M_GFkeOu1NuvN0m63M05KHaHfFHm2x1znp83K4Pwc9l35bS6ctEjhhJqhPHrBTIo2oCCDec9OCMBI6BGTHHrVJO6gbHyk68_kCYtBCtg:1l710u:2UgwM5uOJVwCH1kVcxiU5gPVrxAAlK3PoUOIgMLwmu4	2021-02-16 19:07:00.681745+00
5t23cumo0qn4kp3775ej0c99n7c1sm3e	.eJxVjMEOgjAQRP9lz4SUUlrg6N1vaHa3W0EFEgoHY_x3S8JBj_PezLzB474Nfk-y-jFADwaKX0bID5kPEe4435aSl3lbRyqPSnnaVF6XIM_L2f07GDANed0SR9LOCGuOxrGzKjScQZS6cpZ0q8haMtFS3WmkihrXqdo5ppajknyKjEGmkf1LcIVeK60KSDJJ2iRn0PD5ArG2Q2U:1kyyym:sKfYIgAZePS3baCCQttHXVqgjz2v4dX4H7Jc2Wh6oz8	2021-01-25 15:19:36.906125+00
xqgif4egl2res88ee26ox251qig2019h	.eJxVjMEOgjAQRP9lz6TZlrIWj979hmbbLoIKTSgcjPHfhYQLx3nzZr7AkZOMQ_Qf4RmuBg1WUGSUssiWwUAFntel92uR2Q9pY3RmgeNLpr1IT54eWcU8LfMQ1K6ooy3qnpO8b4d7Oui59NvaiWs6JM1IBnVn2mC505fWWkYWciZYSm3NgWwgEofSCGqNqY4xaYvw-wMorEKJ:1kzlqu:zyydUeufU415DYVVvgcJH4w073X6XsYSRPSG1lAQbaE	2021-01-27 19:30:44.300347+00
itsb5u40q49g5xsvvzgvf7evrqh4dxoi	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1l5Qd5:4JWgKYF6QkQkWWJBhoKcenTL6vys0Fq9Y-A4mm4t2yk	2021-02-12 10:03:51.864643+00
9yd14ontjgvo1c8iswxh8pgb4fzkgcef	.eJxVjDsOwjAQRO_iGlmL_6ak5wzW2l7jALKlOKkQdyeRUkAxzbw382YB16WGddAcpswuTLLTbxcxPantID-w3TtPvS3zFPmu8IMOfuuZXtfD_TuoOOq2Bi-0K2AsmIzCWvJQJKWzkNH5LeCwKA8ASqkkFFktQKIzzhSbtSL2-QKyPzaN:1l9q1P:jJOGTQUnn6vVpOyT5WUMQ7Yc9J3V5IiodSX2RXPBCyw	2021-02-24 13:59:11.359036+00
fakc05eeun6fypdpjpzqywf40ha9c4fi	.eJxVjDkOgzAURO_iGlleMOCU6XMG69t_HMgCEoYiinL3gERDOW_ezFdQIsZ7SOEDmsXFKKMqUfBGWbBloUUlAq1LH9aCOQy8MXdmkdIT417wg8b7JNM0LvMQ5a7Ioy3yNjFe18M9HfRU-m3to4o216oxNXmV4XPqmJRmctFZBUSndSb4xNx1ALxukUxrWwvTOCN-f13NQ8E:1l6Bpe:njmv6GX_onOYWGtjdyVfT3gk7_I2mME44sxYAOSm6eY	2021-02-14 12:27:58.440291+00
1ihaktcnz97alf2tottflnteaea48ecm	.eJxVjDsOgzAQRO-yNbLWH4xNmT5nsNb2EkgCSBiKKMrdAxJFUs7Mm_eGQNvah63wEoYMLTiofrtI6cHTMeQ7TbdZpHlalyGKAxHnWsR1zvy8nOyfoKfS72-DUjayk7Hx5Dl6XXNna6tiNORQO1N7dGgcSXRNpMialEKnNaqUnLW7lBJlHocUXkwLtAoVVlB45LLynkHC5wtBCEHW:1l2Ek8:SB5gyoCQvz8oKpuHl1zduPt3AE3R3YF8NO4dNmNemM8	2021-02-03 14:45:56.652502+00
ks96nhvicnciawlqau2umxemit29kr3j	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1l2ElH:zrBDoTErSP0rNe4L3J1kVXyq9HFR2Lb-0cv-lLWMIdU	2021-02-03 14:47:07.085355+00
pzusfu8i2hynppbxh721vqdffzvxvleo	.eJxVjMEOgjAQRP9lz6Sh7UopR-9-Q7PdroIKTSgcjPHfhYSDHmfmzXtDoHXpw1pkDkOCDrSD6reMxA-Z9iXdabplxXla5iGqHVHHWtQlJ3meD_ZP0FPptzc67egqyAlZajKu1dxI1L6hiOTReR3RtHRqtUPbREnOJ0FrOaKIxU1KTEnGgcNLaIbO1KauoMgoZZEtg4XPF815Q2w:1l7niq:iNA6YVkhHJV88NXoBFaB3R5IBT64gb398hahaYWLzNE	2021-02-18 23:07:36.861305+00
g2mo1c60y0e86h4ytk89qfcicnsybiz4	.eJxVjDsOgzAQRO-yNbIW_zCU6XMGa1kvgSSAhKGIotw9IFEk5cy8eW-ItK193LIscUjQQOmg-C1b4odMx5LuNN1mxfO0LkOrDkSda1bXOcnzcrJ_gp5yv78FTTCc0AfjxHvbVaG2nZBh71pPJnDJVbBGO40eO-sceRSD2kuwZY27lJiSjAPHl9ACjUaNBWQZJa-yZ3Dw-QJvGEHs:1l7NR3:QKPAoOC1yJ0u9HePSdt_Xqvt32u4fvwAkQa2-gI23UE	2021-02-17 19:03:29.087931+00
ukvfa3rgy3gz3dovf74bffl89htndprs	.eJxVjsEOwiAQRP-Fc0O6YKH06N1vIAu72KptE2gPxvjvStKDXufNTN5LeNy30e-Fs59IDAKMaH7DgPHOSyV0w-W6yrguW56CrBV50CIvK_HjfHT_DkYs43fdG7A92EgK2TlN8RRs4MSANgTsbArGJCRQxioD4Cja1IEG3WuNLlUrjEg8T9E_GbMYVKvaRhSeuWycq7p4fwDYckNw:1l7jNO:o6iCQfuvbVrG9-uU522xmS4aBgaxcz8Pf-yjpBbbghQ	2021-02-18 18:29:10.937149+00
opkau77ljqh3fycx50muc2uh12nbuf2n	.eJxVjL0OgzAQg9_lZhSRnwPC2L3PgC65o9AWkAgMVdV3b5AY2s32Z_sNHe3b0O1J1m5kaEFrKH7DQPEh80H4TvNtUXGZt3UM6qiokyZ1XViel7P7dzBQGvLasbVkPEZvsccsK8MepSEiG7Vww3XwyCjWae1Qh5pL13hTGt1XlT9OKRLLNMbuJbRCm1FZQJJJ0ibZA8LnC5p9QqY:1l5rWF:tkcMq4sXf2bBLkJsxmqKbZYZjdxYSj62GqWmalADkvo	2021-02-13 14:46:35.013845+00
gtxdbnti0yrf7tgegamahdcu83k13f1r	.eJxVjLEOgzAQQ__lZhQllwANY3e-IbpLjkJbQCIwVFX_vSAxtIsl-9l-Q6Bt7cOWZQlDggYQofgNmeJDpoOkO023WcV5WpeB1VFRJ82qnZM8r2f376Cn3B_r5C6VsQbJedexj7v6kk1Vd3UXEesyGfS61Gys8xqtdozaeLKcPArtpxQpyTjE8BJaoEGNuoAso-RVdg8GPl92HkI0:1l8Oq9:LxW-9Ie7JTVMxoQNHPQ-K-5OkohKJVlUY6LT34orjg4	2021-02-20 14:45:37.85446+00
ekqh6w1wznycz45wtpg2fhxq52tpeohq	.eJxVjsEOwiAQRP-Fc0MQyhZ69O43kGXZ2qptE2gPxvjvStKDXue9mcxLBNy3MeyFc5iS6MXJi-Y3jEh3XipJN1yuq6R12fIUZVXkQYu8rIkf58P9GxixjN-2Yd96BeSNIev14MjG2DFgpDR4AqeU6VxHyqGNYFmnFgAceayRrq-QMPE8UXgyZtFrpVUjCs9cNs71unh_ALnZQyU:1l7jhn:6O9ocubt96-AWTa78YZrbimYGCJ1DSL6QLVstb3FjAY	2021-02-18 18:50:15.970908+00
hyasrrlpmmnw0vulcmoo7ge36w8bh8ca	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1meZZa:FTlds8ob9nsYzjRnYrDGtpLX460RVRu7Qz5qpMI8LrM	2021-11-07 09:13:46.32413+00
ju141ctbnz1s8bstam5bghc7ko5imow1	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lAgfm:k0tibWGGmZnZzaWZuwfmKa_oQXV6Lzy1LjGYgQWwhxk	2021-02-26 22:12:22.805596+00
w44h2z6gnrmygw1giyi8oqs75hmgqxce	.eJxVjDsOgzAQRO-yNbJsgz9Qps8ZrLV3HUgCSBiKKMrdAxJFUs7Mm_eGgNvah63wEgaCDrSB6reMmB48HQvdcbrNIs3TugxRHIg41yKuM_HzcrJ_gh5Lv7-jlkZ6R-hbKzOlzFmSdVk1Wmdra0we2-TIq2iYVatMdoac1VbZBl29SzEh8Tik8GJcoNNSywoKj1xW3jMo-HwBwGpDFQ:1lCfPX:YO5PLVjydVCprCt7Hrdi2UbTT6hqTthNWcwWgW6Bjcc	2021-03-04 09:15:47.650149+00
eyspemhwlvmyddgft6bzbjvpl87a0ckw	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lMEJM:bMd7CY_4R-9vL6VFrHr7a1ulJT7nHNIiDZ0viyxpsmc	2021-03-30 18:20:56.406373+00
727r7t9dni44rc1vja9we9krz7l3kn6y	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lMREJ:K9p6gTWXFn433XQgRP1jvwyXhlvvOZQ3h8uC4uOZ67U	2021-03-31 08:08:35.062428+00
rjxwaydoswa9330lnf4zgmrh2pkjaq6q	.eJxVjrEOgzAMRP_FM4pMICEwdu83RMY2hbaARGCoqv57QWJox7t7d7o3RNrWPm5JlzgINGADZL9mS_zQ6UjkTtNtNjxP6zK05kDMmSZznUWfl5P9G-gp9XvbY611GRwz-tJTsKohdJ33aB2jqIjXolYbtAgFI2PryFddcGSlwvx4RUyi48DxpbRAY9FiBklHTavuGnL4fAG1EkMc:1lD8ln:Srzl8aljuJScYcCqHvOwVjcJP0CGv_BufF_9B_7PJ6M	2021-03-05 16:36:43.799418+00
dd8vpaln9jyo2g7yljysvr50t0wneags	.eJxVjDsOgzAQRO-yNbJg8Zcyfc5gre0lkASQbCiiKHcPSBRJOTNv3hs8bevgt8LZjwk6QAnVbxkoPng-lnSn-baIuMxrHoM4EHGuRVyXxM_Lyf4JBirD_iZlyZmQNCVyUTVsTGrZUo8KtbYyIil2jtAYF2TPwSFJG4KWVrV9HXcpRUo8jdG_mDJ0WGNdQeGJy8p7hgY-X-X4Q64:1l7nJl:t54nZjF41V38LI0jMLSfTxApk8Rj8hRa0-nNbCqiGdk	2021-02-18 22:41:41.296704+00
f4odxsrdi5gidutg6j15utx0dxksyjm0	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lEFjt:OCD3DuKTdEUGKOPWmI5l2FO3mqobgonYBEmixrNeVn4	2021-03-08 18:15:21.335826+00
itef15ghije55er3be8c87jzr98o5pmn	.eJxVjDsOgzAQRO_iGlnrD2adMn3OgHbtJZAPSBiKKMrdAxIN5bx5M19FibK8h9R-hGZ1sWChUkXeUhbZsjKqUi2tS9-uReZ2yBvDM2NKTxn3Ij9ovE86TeMyD6x3RR9t0bcpy-t6uKeDnkq_rT0Y05jOcBMpCkdXSxfqYJk9ITj0dQQEj2QAGyYWR9YCOgc2JQxB_f4ZLEHW:1l84Bq:TUlW-p5udR8AZZ3Eat7lWnvQwOe4PQD0UVTxbyq6pRM	2021-02-19 16:42:38.718817+00
h83o0ermaijtq68cm9o5g3s471yiuhdq	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lRXXH:0TyjJ29OkdTFzVvJjgGvqzBA9kAo87H6irXrralsjac	2021-04-14 09:53:15.644997+00
shocs8mumf5uog1z4ifj9cv72vcdx3qb	.eJxVjDsOgzAQRO-yNbKw-dimTJ8zWLvrdSAJIGEooih3D0gUSTkzb94bAm5rH7YsSxgidGBaKH5LQn7IdCzxjtNtVjxP6zKQOhB1rlld5yjPy8n-CXrM_f5GMrrC6DhJ7RxXQh5NatgSova-aYjFka2pjq315KnVzoh1OiUqK8e7FBmjjAOHl-ACnSlNWUCWUfIqe4YKPl8Qw0Q3:1l878d:uw9S3IILbleoKRsCqc0ikezz2p9ykotNFCFUBLzVM7s	2021-02-19 19:51:31.639043+00
vy0frsvlbw4j6kcrka3gmvlxcse7is7h	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lRfko:KSTwLZQlP948xpku8CjjPvdjQdY1_XZqYncWok8bxM0	2021-04-14 18:39:46.264719+00
tnw9qc5hwwtd254hut7rb1k3e2npuhnc	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKA0IjCE5eNqxetaESgfRvCXngNY6qZOmc9xSfPf5AeNN8XGZd5W8de_ivyoEXelsSv69E9HQxUhroGj53LYCyYRGgte8iKY4uqd74KHGXtAUBrHVGz7RAUOeNMtqnTLL4_DKNBuQ:1lBlZO:7OcZs2fUqR9ut57u75rQpmA8S-I8Kn01OYFMhvTjWiM	2021-03-01 21:38:14.899907+00
x5qjgbzyc7jewplolbur958on6lum8mg	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lSTnC:fjlB4Q49T31zfO3KtaQUK91St7cHizchcQ0aNqHIwiY	2021-04-17 00:05:34.179216+00
93sl3u8cl91655a8cqkowixrhzb8lqsf	.eJxVjs0OgjAQhN-lZ9L0z0I5evcZmu3uIqhA0sLBGN9dm3DQ63wzX-YlIuzbGPfCOU4kemGCaH7DBHjnpRK6wXJdJa7Llqcka0UetMjLSvw4H90_wQhlrGuLQwIy3hAlb1GjJd8FFYaOIXh7aq0ydmi1I2avgVtAD1axM85p9l8pIBDPE8YnQxa9UUY1ovDMZeNcr4v3B-pGQ5E:1lH9YE:M6dUQ_GN1uDZciM-UwnS1kknhbFieMFFV2ANsBYzAgo	2021-03-16 18:15:18.797317+00
1r3yw7ahnyf81cwutklox97so40ps6ro	.eJxVjDsOgzAQRO-yNbJsrwOGMn3OYK3t3UA-IGEooih3D0gUSTkzb94bAq1LH9bCcxgydIAaqt8yUrrzuC_5RuN1Umkal3mIakfUsRZ1mTI_zgf7J-ip9Nvbo9SxNYLRGK91NNbrJJ6dSC2NSZidbxJFT4Q1ihFxDh2efLYtWs2blBJlfg4pvJhm6Ky2uoLCTy4LbxksfL6u60L_:1lTJM8:iU8GwB01uoksovJQPIGeLjJ2exD9GoTZOtWaV7wRnMg	2021-04-19 07:09:04.260679+00
titatb9qo3zkv02swwi3nq3ikwceorze	.eJxVjDEOgzAQBP_iGlnnE7ZxyvR5g3XYd4EkgIShQFH-HpBoKHd2dr-KEmUe-hQ3plndEBAqVXjgsvCelVOVirQuXVwLz7HPOzN4hS2lN49Hk180PiedpnGZ-1Yfij7boh9T5s_9dC8HHZVuXwc2YhtpfLbJoHfMTmzwBh2CiAlga2yyBSvekyEC9JIIpG4pQMqofn9eeUMK:1lHYIA:wc0rpzzg70qXKGWRPAg2olngzV8jLRb4lQkQRD8_bMw	2021-03-17 20:40:22.513893+00
o9gltb2z6rak7tjzu44jsb8vz5vdu4ep	.eJxVjL0OgzAQg98lM4pCLj-kY_c-Q3S5HIW2gERgqKq-e1OJhcGD_dn-CCTMPI0U34yruGilVSMKT1w2rl4Y0YiI-zbEvfAax1yzcM4S0pPnP8gPnO-LpGXe1jHJf0UetMjbkvl1PbqngwHLUNetASCG0HeQGACBUXN2nfaWfN85z8FYCuC88inYYJRrrQYIVQBOi-8PK6JBcQ:1lIWQ1:2F9X3-TGNEnJNxTbwlOw3e9_LCRiCyygtWr_QZ7iEk4	2021-03-20 12:52:29.014991+00
5bi429egy62s2q3yxyrsx9fr85ru2vlk	.eJxVjDsOgzAQRO_iGlmbtfEnZfqcwVrsdSAJIGEooih3j5FoKKZ582a-ovDIZeVFXAWKRlCkxOMQw4epMgSERgTa1j5shZcwpCoqcWIdxRdPe5GeND1mGedpXYZO7oo82iLvc-L37XBPBz2Vvq7BY-syGAsmEVrLHrLieEHVOV8DjrL2AKC1jqjZtgiKnHEm29RqFr8_CM1Bug:1lZheO:NPpQtfeovhy4IFBAY92PzU7JGaKZLG-tq-WM_oyXQi0	2021-05-06 22:18:20.873987+00
mfm3pd4rpstdoq7qqivddnyhq9wwqfk9	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lj70w:9Yop6P8KsrGxXRBsFV7bQ21n79eD2vnaZUFvh4OsT6o	2021-06-01 21:12:30.594094+00
tlwf9h669rsaosc3ivjv12p9p1uef9wj	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1mIBYm:k8DKHOf9KTKnPF9be7awycNp3WlFNERaxFbCNf89nK4	2021-09-06 15:08:24.279129+00
5urq8cv8976hxvkajzki771wx13b1i8h	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1mdpL2:rC6un2DLCW2VhT-CUPo7D47vP0osiwK9RB8FDQEKLfs	2021-11-05 07:51:40.248696+00
0s7ader1zrkzxxmx8n3i092e7ib6k6bt	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1metc8:ImtPBfLZECzDBdpJW5txgk8VUYloib00gib87NQsvdQ	2021-11-08 06:37:44.212078+00
5rmsk05cu5o85w3pt22d15h6deicyqwa	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1lw7ZA:iXL7PWDTGajse95oTWfAM34FXMphm6Hav4UYwVme4Y8	2021-07-07 18:25:36.966777+00
ychvczagiepd0k4aqbtmpk9jladeycg4	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1m0iFu:2F8-xWVD3Rs55fcwoH8uDWhzCKs-TT85bD4Wujo32vY	2021-07-20 10:24:42.943764+00
edy7pbl0cd6uhuqz13fojpp75n0ipd56	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1mLBqB:zEnfaGEsOORcaTgCmUyUVjqfXhiY5u7Z6jVCHQPbhA0	2021-09-14 22:02:47.896372+00
ugjkj75vn2v0okah2ddaru4u50unx4io	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1mgLJC:q9xtRAyE8xaGFniYfHHZfGGqxCZn8Kvjm2P8NrnVdPI	2021-11-12 06:24:10.909347+00
s6n6p1szus4uwwj5jrhagfh7y7hxo36j	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1mhvKt:elkUMdC3gsX4lv5XqFz1QGHqxODaM88fxl5_tJneNL4	2021-11-16 15:04:27.143365+00
hd218z88h2e4nirqi06z5c7eu82ck49p	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1mSe2E:pTtYwugYmLsLpHBc4Evek43LN4iQ7RKyGKHZXA597Yk	2021-10-05 11:34:02.220869+00
ypctegaaniq361enmac0sj78n1icn414	.eJxVjL0OgzAQg98lM4qul5Cfjt37DNGRXAptAYnAUFV99waJhcGD_dn-CoqUeBxi-DAt4oqA0IjCI5eVqxcoGhFoW_uwFV7CkGqmzllH8cXTDtKTpscs4zyty9DJvSIPWuR9Tvy-Hd3TQU-lr2vw2LoMxoJJhNayh6w4XlB1zleBo6w9AGitI2q2LYIiZ5zJNrWaxe8PDVBBug:1mRUKA:7pteW4fyHgIZ0RhUl3KJQJgcN_rUb-EufTKlCm-bmL8	2021-10-02 06:59:46.994584+00
ojmdmtqe35pm2c82ekydxude46cjwwz3	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1my8CE:zYxYHf5x7P1BDlQH3nzHJQw50qO_96CULZ33z5p1LZE	2021-12-31 08:02:30.836366+00
5foqtn96vimd23uzfj15ffoubczzwvd5	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1n9FCN:pgYhDUhUMg7lxjqPK1Pq9gZdV3LEmrsFo6Lz8A2_XzI	2022-01-30 23:44:35.509214+00
qoh5v2em9qenulazzopb1m0wlnx1botq	.eJxljL0OgzAQg98lM4qOS8hPx-48Q3Qkl0JbQCIwVFXfvSCxVB082J_tt6BIicchhhfTIi4IWFei8Mhl5d0LJSoRaFv7sBVewpD-s47ig6cDpDtNt1nGeVqXoZNHRZ60yHZO_Lye3Z-Dnkq_r8Fj4zIYCyYRWssesuJYo-qc3wWOsvYAoLWOqNk2CIqccSbb1GgWny8OuEG8:1nM49Z:T8K9f25IYiHMzvI19zGZV7dwvyb9yX6wfpg4169O5_k	2022-03-07 08:34:41.169798+00
6lj4ltsvji1c8xhe8mprbribs4pnhibo	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKAbSMKT1w2rl5o0YhA-zaEvfAaxlQzdc56ik-e_yA9aL4vMi7zto69_FfkQYu8LYlf16N7OhioDHUNHjuXwVgwidBa9pAVxxZV73wVOMraA4DWOqJm2yEocsaZbFOnWXx_D2VBvQ:1nQtYM:IUJBJGWWMiCy_4DvzQJTQE45ElEY62rcgOsH0S1nLO4	2022-03-20 16:16:14.473347+00
24fdomab2s3fvsy23f9oymgmwa26y22p	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKAbSMKT1w2rl5o0YhA-zaEvfAaxlQzdc56ik-e_yA9aL4vMi7zto69_FfkQYu8LYlf16N7OhioDHUNHjuXwVgwidBa9pAVxxZV73wVOMraA4DWOqJm2yEocsaZbFOnWXx_D2VBvQ:1nXOWN:9COSr5hlRb5tWrKoREe4fCWi-wyMrM8pR5QgXLnx2V8	2022-04-07 14:33:03.675111+00
iys3buzo3w32vueyou6j1iqktl2ffam1	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKAbSMKT1w2rl5o0YhA-zaEvfAaxlQzdc56ik-e_yA9aL4vMi7zto69_FfkQYu8LYlf16N7OhioDHUNHjuXwVgwidBa9pAVxxZV73wVOMraA4DWOqJm2yEocsaZbFOnWXx_D2VBvQ:1ngsUE:Pc9ODw8MAQolf_hPTeK_bz5PTG7hsxyyTBV7Bw86_EE	2022-05-03 18:22:02.793151+00
8zm062ikwdki9lxycbtfa27hpnyifcho	.eJxVjL0OgzAQg98lM4qOS8hPx-59huhILoW2gERgqKq-e1OJhcGD_dn-CIqUeBpjeDOt4oKAbSMKT1w2rl5o0YhA-zaEvfAaxlQzdc56ik-e_yA9aL4vMi7zto69_FfkQYu8LYlf16N7OhioDHUNHjuXwVgwidBa9pAVxxZV73wVOMraA4DWOqJm2yEocsaZbFOnWXx_D2VBvQ:1oV9pS:lWzgKnIyO4G0Iq3GxXo36Zql_B33Qm0N1ZGJXRGVdts	2022-09-19 10:59:46.277682+00
zdqk1oap097eydbff0w7t1oo7zv04skz	.eJxljL0OwjAQg98lcxUdlzQ_jOw8Q3RNLrRAWylpB4R4d1qpC2LwYH-234IiJR6HGF5MRZwREBtReeS68OaFEo0ItC59WCuXMKT_rKP44GkH6U7TbZZxnpYydHKvyINWeZ0TPy9H9-egp9pva_DYugzGgkmE1rKHrDieUHXObwJHWXsA0FpH1GxbBEXOOJNtajWLzxcPc0G9:1p113Y:deQgITeSrwevgFARLeRAYdjailNYQPFmyNZEAhEcQL8	2022-12-16 08:06:00.791404+00
\.


--
-- Data for Name: subjects_subject; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.subjects_subject (id, name, ects, professor, assistant, code, csv_file, dinp_link, predavanja_dan, predavanja_trajanje, predavanja_vrijeme, vjezbe_dan, vjezbe_trajanje, vjezbe_vrijeme, description) FROM stdin;
19	Upravljanje informatičkim projektima	6	dr. sc. Sanda Martinčić-Ipšić	Kristijan Stančin	UIP	dinps/inf/13/csv/DINP_UIP_2021_2022.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_UIP.pdf	utorkom	01:30:00	14:00:00	utorkom	01:30:00	16:00:00	<h2>Obveze i vrednovanje studenata</h2>\n<ol>\n<li>Prisutnost na nastavi</li>\n    <p>\n        Pohađanje nastave je obavezno, i vodi se evidencija pohađanja za svakoga studenta. Predavanja i vježbe se izvode u blokovima od 2 sata prema tablici u nastavku. Osim prisustvovanja klasičnoj nastavi na    predavanjima    i    vježbama    studenti    su    dužni    koristiti    sustav    za    učenje    Merlin (https://moodle.srce.hr/).\n    </p>\n<li>Samostalne vježbe na računalu</li>\n    <p>\n        Tijekom semestra studenti će izrađivati samostalne zadatke vezane uz sadržaj vježbi, na kojima je moguće prikupiti do 20 bodova. Za navedene zadatke nema praga prolaznosti.\n    </p>\n<li>Samostalni zadaci</li>\n    <p>\n        Tijekom  semestra  studenti  će  izrađivati  projektni  elaborat  i  plan  (projektni  seminarski  rad)  te  ga prezentirati  prema  rokovima  u  kalendaru  izvođenja.  Također  studenti  će  recenzirati  dodijeljen seminarski rad. Seminarskim radom moguće je sakupiti do 30, prezentacijom do 10, a recenzijom do 10 bodova. Za navedenu aktivnost nema praga prolaznosti.\n    </p>\n<li>Završni ispit</li>\n    <p>\n        Kontinuiranim radom tijekom semestra na prethodno opisani način studenti mogu ostvariti najviše 70 ocjenskih  bodova,  a  da  bi  mogli  pristupiti  završnom  ispitu  moraju  ostvarili  50%  i  više  bodova (minimalno 35).\n        Studenti koji su skupili najmanje 35 ocjenskih bodova, mogu pristupiti završnom ispitu.\n    </p>\n    <p>\n        Završni ispit nosi udio od maksimalno 30 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno riješenih zadataka).\n        Ako je završni ispit prolazan, skupljeni bodovi pribrojat će se prethodnima i prema ukupnom rezultatu formirati  pripadajuća  ocjena. U  suprotnom,  student ima pravo  pristupa  završnom  ispitu još  2  puta (ukupno do 3 puta).\n    </p>\n</ol>\n\n<h3>Konačna ocjena</h3>\n<p>Donosi se na osnovu zbroja svih bodova prikupljenih tijekom izvođenja nastave prema sljedećoj skali: </p>\n<p>\nA – 90% - 100%                           (ekvivalent: izvrstan 5)\nB – 75% - 89,9%                          (ekvivalent: vrlo dobar 4)\nC – 60% - 74,9%                          (ekvivalent: dobar 3)\nD – 50% - 59,9%                          (ekvivalent: dovoljan 2)\nF –  0% - 49,9%                          (ekvivalent: nedovoljan 1)\n</p>\n<h3>Ispitni rokovi</h3>\n<p><b>Redoviti:</b>\n8.2.2022. u 10:00\n22.2.2022. u 10:00\n<p>\n<p><b>Izvanredni:</b>\n8.3.2022. u 10:00\n13.9.2022. u 10:00\n</p>
35	Matematika 1	6	doc. dr. sc. Milena Sošić	doc. dr. sc. Milena Sošić	MAT1	dinps/inf/11/csv/DINP_2020_2021_MAT1.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/1_godina/DINP_2020_2021_MAT1.pdf	ponedjeljkom	01:30:00	14:15:00	ponedjeljkom	03:30:00	10:15:00	
22	Otkrivanje znanja u podacima	6	dr. sc. Maja Matetić	mag. educ. math. et inf. Dejan Ljubobratović	OZUP	dinps/inf/13/csv/DINP_OZUP_2021_2022.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_OZUP_2020_2021.pdf	utorkom	01:30:00	14:00:00	utorkom	01:30:00	16:00:00	
3	Operacijska istraživanja 1	6	doc. dr. sc. Martina Holenko Dlab	doc. dr. sc. Martina Holenko Dlab	OPI1	dinps/inf/15/csv/DINP_OPI1_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_OPI1_2020_2021.pdf	četvrtkom	01:20:00	14:30:00	ponedjeljkom	01:40:00	16:30:00	
21	Komunikacija čovjek stroj	6	dr. sc. Ivo Ipšić	doc. dr. sc. Miran Pobar	KCS	dinps/inf/15/csv/DINP_KCS_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_KCS_2020_2021.pdf	ponedjeljkom	01:30:00	14:15:00	utorkom/2	03:45:00	16:15:00	
4	Programsko inženjerstvo	6	izv. prof. dr. sc. Sanja Čandrlić	doc. dr. sc. Martina Ašenbrener Katić	PI	dinps/inf/13/csv/DINP_PI_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_PI_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
1	Elektroničko gospodarstvo	6	dr. sc. Dragan Čišić	doc. dr. sc. Vanja Slavuj	EG	dinps/inf/15/csv/DINP_EG_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_EG_2020_2021.pdf	petkom	01:30:00	10:15:00	petkom	01:30:00	10:15:00	
24	Upravljanje znanjem	6	dr. sc. Ana Meštrović	dr. sc. Slobodan Beliga	UPZ	dinps/inf/13/csv/DINP_UPZ_2021_2022.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_UPZ_2020_2021.pdf	utorkom	01:30:00	08:15:00	utorkom	01:30:00	10:00:00	<h2>Obveze i vrednovanje studenata</h2>\n<ol>\n<li>Pohađanje nastave</li>\n    <p>\n        Predavanja se izvode u bloku od 2 sata prema rasporedu u nastavku. Vježbe se izvode na računalima u bloku od 2 sata prema rasporedu u nastavku. Dio nastave izvodit će se online.\n        Studenti su dužni koristiti sustav za učenje Merlin (https://moodle.srce.hr/).\n    </p>\n<li>Zadaća</li>\n    <p>\n        Studenti dobivaju 2 jednostavnija zadatka koji uključuju ponavljanje gradiva s vježbi i pripremu za novo gradivo. Zadaci nose svaki po 5 bodova.\n        Aktivnost nema praga prolaska.\n    </p>\n<li>Seminarski rad</li>\n    <p>\n        Seminarski rad podrazumijeva  istraživanje  određene  teme u okviru  domene  upravljanja  znanjem  te izrada seminarskog rada na tu temu. Seminar se piše kao domaća zadaća te se predaje (uploada) u sustav za učenje i prezentira nastavniku te ostalim studentima na satu. Kriterij vrednovanja će studenti dobiti uz upute za izradu seminara. Vrednovati će se relevantnost sadržaja zadanoj temi uz originalnost ideja koje je student prezentirao u seminaru. Najveći broj bodova za seminarski rad je 10 bodova. Studenti za koje se utvrdi da su u radu koristili veće dijelove doslovno kopiranog teksta dobit će 0 bodova.\n        Aktivnost nema praga prolaska.\n    </p>\n<li>Kontinuirana provjera znanja (predavanja - teorijski dio)</li>\n    <p>\n        Tijekom  semestra  pišu se  dva  kolokvija  iz teorije.  Prvi kolokvij  iz teorije  (10 bodova) je provjera teorijskog znanja  iz  područja  upravljanja  znanjem  i  obuhvaća  uvod  u  upravljanje  znanjem,  tehnologije  upravljanja znanjem i tehnologije prikupljanja, analize podataka i ekstrakcije znanja iz podataka. Drugi kolokvij iz teorije (10 bodova) obuhvaća znanje iz područja analize društvenih mreža.\n        Aktivnost nema praga prolaska.\n    </p>\n<li>Projektni zadaci</li>\n    <p>\n        Tijekom semestra studenti će dobiti 2 projektna zadatka za samostalno rješavanje i/ili rješavanje u projektnim timovima. Projektni zadaci nose svaki po 15 bodova.\n        Aktivnost nema praga prolaska.\n    </p>\n<li>Završni ispit</li>\n    <p>\n        Završni ispit sastoji se od praktičnog dijela (20 bodova) i testa iz teorije (10 bodova). Aktivnost ima prag od 50% iz oba dijela.\n    </p>\n</ol>\n<h3>Ocjena iz kolegija Završni ispit</h3>\n<p>\nKontinuiranim radom tijekom semestra na prethodno opisani način studenti mogu ostvariti najviše 70 ocjenskih bodova, a da bi mogli pristupiti završnom ispitu moraju ostvarili 50% i više bodova (minimalno 35).\nStudenti koji su skupili najmanje 35 ocjenskih bodova, mogu pristupiti završnom ispitu.\n</p>\nZavršni ispit nosi udio od maksimalno 30 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno riješenih zadataka).\nUkoliko je završni ispit prolazan, skupljeni bodovi će se pribrojati prethodnima i prema ukupnom rezultatu formirati će se pripadajuća ocjena. U suprotnom, student ima pravo pristupa završnom ispitu još 2 puta (ukupno do 3 puta).\n</p>\n\n<h3>Konačna ocjena</h3>\n<p>Donosi se na osnovu zbroja svih bodova prikupljenih tijekom izvođenja nastave prema sljedećoj skali: </p>\n<p>\nA – 90% - 100%                           (ekvivalent: izvrstan 5)\nB – 75% - 89,9%                          (ekvivalent: vrlo dobar 4)\nC – 60% - 74,9%                          (ekvivalent: dobar 3)\nD – 50% - 59,9%                          (ekvivalent: dovoljan 2)\nF –  0% - 49,9%                          (ekvivalent: nedovoljan 1)\n</p>\n<h3>Ispitni rokovi</h3>\n<p><b>Redoviti:</b>\n9.2.2022.\n23.2.2022.\n<p>\n<p><b>Izvanredni:</b>\n9.3.2022.\n7.9.2022.\n</p>
7	Osnove e-obrazovanja	6	dr. sc. Nataša Hoić-Božić	dr. sc. Nataša Hoić-Božić	OeO	dinps/inf/13/csv/DINP_OeO_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_OeO_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
15	Operacijska istraživanja 2	6	doc. dr. sc. Martina Holenko Dlab	doc. dr. sc. Martina Holenko Dlab	OPI2	dinps/inf/13/csv/DINP_OPI2_2019_2020.csv	\N	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
16	Logistika	6	dr. sc. Dragan Čišić	dr. sc. Dragan Čišić	LOG	dinps/inf/13/csv/DINP_LOG_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_Logistika_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
23	Upravljanje mrežnim sustavima	6	dr. sc. Vedran Miletić	dr. sc. Vedran Miletić	UMS	dinps/inf/13/csv/DINP_UMS_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_UMS_2020_2021.pdf	petkom	01:30:00	08:15:00	petkom	01:30:00	10:00:00	
6	Objektni programski jezici	6	dr. sc. Marina Ivašić-Kos	Ivona Franković	OPJ	dinps/inf/15/csv/DINP_OPJ_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_OPJ_2020_2021.pdf	utorkom	01:30:00	14:00:00	utorkom	01:30:00	16:00:00	
8	Ekonomika poslovanja	6	dr. sc. Borna Debelić	Gordana Bugarinović	EP	dinps/inf/13/csv/DINP_EP_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_Ekonomika_poslovanja_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
12	Skladišta podataka	6	prof. dr. sc. Patrizia Poščić	doc. dr. sc. Danijela Jakšić	SP	dinps/inf/13/csv/DINP_SP_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_SP_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
14	Sustavi za podršku odlučivanju	6	dr. sc. Sanda Martinčić-Ipšić	Karlo Babić	SPO	dinps/inf/13/csv/DINP_SPO_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_SPO_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
5	Distribuirani sustavi	6	dr. sc. Božidar Kovačić	v. pred. dr. sc. Vedran Miletić	DS	dinps/inf/15/csv/DINP_DS_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_DS_2020_2021.pdf	petkom	01:30:00	10:15:00	petkom	01:30:00	10:15:00	
18	Menadžment i upravljanje	6	dr. sc. Patrizia Poščić	mag. inf. Kristian Stančin	MIU	dinps/inf/13/csv/DINP_MIU_2021_2022.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/MIU_DINP_2020_2021.pdf	ponedjeljkom	01:30:00	10:00:00	ponedjeljkom	01:30:00	08:30:00	<h2>Obveze i vrednovanje studenata</h2>\n<p>Na  svakoj  aktivnosti  (osim  kolokvija)  student  mora  ostvariti  najmanje  50%  bodova  (od  ukupnih  ocjenskih bodova za tu aktivnost).</p>\n<ol>\n<li>Pohađanje nastave</li>\n    <p>\n        Predavanja i vježbe izvode se u hibridnom obliku – u bloku od po 2 sata prema rasporedu (studenti su obavezni pratiti obavijesti na Merlin stranici kolegija, vezano uz datume kada će se nastava odvijati fizički u učionici) te online (preko Merlin stranice kolegija).\n    </p>\n<li>Zadaća</li>\n    <p>\n        Tijekom  semestra  studenti  će  u  paru  riješiti  zadane  zadatke  iz  područja  teorije  igara  te  riješene  zadatke postaviti na Merlin. Vrednovat će se točnost zadatka te postupak dolaženja do rezultata. Na taj način studenti će moći skupiti maksimalno 5 bodova.\n    </p>\n<li>Projektni zadatak – virtualno poduzeće</li>\n    <p>\n        Tijekom  semestra  studenti  će  rješavati  zadane  projektne  zadatke  u  ERP  i  CRM  sustavu  te  prezentirati poslovanje  svakog  odjela  i  financijski  rezultat  virtualnog  poduzeća.  Na  taj  način  studenti  će  moći  skupiti maksimalno 40 bodova.\n    </p>\n<li>Rasprave na forumu</li>\n    <p>\n        Tijekom  semestra  od studenata se očekuje učestalo  praćenje te aktivno i  samostalno sudjelovanje u svim objavljenim raspravama na forumu na Merlinu (5-7 rasprava). Vrednovat će se način i kvaliteta obrade zadane\n    </p>\n<li>Kontinuirana provjera znanja</li>\n    <p>\n        Tijekom  semestra  pisat  će  se  jedna  kontrolna  zadaće  (kolokvij)  koje  će  uključivati  teoretska  pitanja  iz predavanja, na kojoj će student moći skupiti maksimalno 20 bodova.\n    </p>\n<li>Završni ispit</li>\n    <p>\n        Završni ispit je pisani ispit koji sadrži gradivo s predavanja i vježbi obrađeno nakon teorijskog kolokvija. Završni ispit  nosi  udio  od  maksimalno  30  ocjenskih  bodova,  a  smatra  se  položenim  samo  ako  na  njemu  student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno riješenih zadataka).\n    </p>\n</ol>\n<h3>Ocjena iz kolegija Završni ispit</h3>\n<p>Kontinuiranim radom tijekom semestra na prethodno opisani način studenti mogu ostvariti najviše 70 ocjenskih bodova, a da bi mogli pristupiti završnom ispitu moraju ostvarili 50% i više bodova (najmanje 35 bodova) i zadovoljiti postavljene pragove na aktivnostima.\n   Studenti  koji  su  skupili  najmanje  35  ocjenskih  bodova  i  zadovoljili  postavljene  pragove,  mogu  pristupiti završnom ispitu.\n</p>\n<p>Završni ispit nosi udio od najviše 30 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno riješenog ispita).\n   Ako je završni ispit prolazan, skupljeni bodovi će se pribrojati prethodnima i prema ukupnom rezultatu formirati će se pripadajuća ocjena. U suprotnom, student ima pravo pristupa završnom ispitu još 2 puta (ukupno do 3 puta).\n</p>\n\n<h3>Konačna ocjena</h3>\n<p>Donosi se na osnovu zbroja svih bodova prikupljenih tijekom izvođenja nastave prema sljedećoj skali: </p>\n<p>\nA – 90% - 100%                           (ekvivalent: izvrstan 5)\nB – 75% - 89,9%                          (ekvivalent: vrlo dobar 4)\nC – 60% - 74,9%                          (ekvivalent: dobar 3)\nD – 50% - 59,9%                          (ekvivalent: dovoljan 2)\nF –  0% - 49,9%                          (ekvivalent: nedovoljan 1)\n</p>\n<h3>Ispitni rokovi</h3>\n<p><b>Redoviti:</b>\n2.2.2022.\n16.2.2022.\n<p>\n<p><b>Izvanredni:</b>\n23.3.2022.\n6.9.2022.\n</p>\n
25	Informacijski sustav organizacije	6	dr. sc. Mile Pavlić	izv. prof. dr. sc. Sanja Čandrlić	ISO	dinps/inf/13/csv/DINP_ISO_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_ISO_2020_2021.pdf	utorkom	01:30:00	08:15:00	utorkom	01:30:00	10:00:00	
26	Diplomski rad	24			Završni		\N	utorkom	01:30:00	08:15:00	utorkom	01:30:00	10:00:00	
27	Stručna praksa	6	dr. sc. Nataša Hoić-Božić	dr. sc. Nataša Hoić-Božić	StrucnaPraksa	dinps/inf/13/csv/DINP_StrucnaPraksa_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_strucna_praksa_2020_2021.pdf	utorkom	01:30:00	08:15:00	utorkom	01:30:00	10:00:00	
28	Edukacijska psihologija 1	5	dr. sc. Rosanda Pahljina-Reinić	Martina Bažon 	EP1	dinps/inf/15/csv/Edukacijska_psihologija_1_20_21.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/Edukacijska_psihologija_1_20_21.pdf	četvrtkom	01:20:00	14:30:00	ponedjeljkom	01:40:00	16:30:00	
20	Informacijska tehnologija i društvo	6	dr. cs. Danijela Jakšić	doc. dr. sc. Danijela Jakšić	ITID	dinps/inf/13/csv/DINP_ITID_2021_2022.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/2_godina/DINP_ITID_2020_2021.pdf	srijedom	01:30:00	10:00:00	srijedom	01:30:00	12:00:00	<h2>Obveze i vrednovanje studenata</h2>\n                    <ol>\n                        <li>Pohađanje nastave</li>\n                            <p>Predavanja i vježbe izvode se u hibridnom (klasičnom+online) obliku.\n                            Studenti  su  obavezni  redovito  koristiti  sustav  za  učenje  Merlin  (https://moodle.srce.hr/),  Merlin  stranicu kolegija te pratiti sve obavijesti i detaljni raspored nastave na kolegiju.</p>\n                        <li>Rasprave na forumu</li>\n                            <p>Tijekom  semestra  od studenata se  očekuje učestalo  praćenje te aktivno i  samostalno sudjelovanje u svim objavljenim raspravama na forumu na Merlinu (6 rasprava). Vrednovat će se način i kvaliteta obrade zadane teme  rasprave,  kao  i  broj  objavljivanja  (postova)  na  svaku  raspravu.  Na  taj  način  studenti  će  moći  skupiti najviše 20 bodova. Studenti moraju ostvariti najmanje 50% ukupnih bodova ove ocjenske aktivnosti (10 bodova od ukupno 20), kako bi ostvarili pravo izlaska na završni ispit.</p>\n                        <li>Startup prijava/nacrt</li>\n                            <p>Tijekom semestra studenti će u timu (nastavnik će tijekom nastave definirati broj članova tima) izraditi nacrt za prijavu  željenog  startup-a  (poslovni  plan  za  startup),  na  temelju  dobivenih  uputa,  nastavnih  materijala  i definiranih zadataka. Vrednovat će se način i kvaliteta izrade startup plana te njegovo izlaganje za svakog člana tima, prema definiranim kriterijima. Na taj način studenti će moći skupiti  najviše 30 bodova. Studenti moraju ostvariti najmanje 50% ukupnih bodova ove ocjenske aktivnosti (15 bodova od ukupno 30), kako bi ostvarili pravo izlaska na završni ispit.</p>\n                        <li>Završni ispit (seminarski rad)</li>\n                            <p>Završni ispit predstavlja izradu i obranu seminarskog rada.\n                            Svaki  student  samostalno  će  obraditi  jednu  odabranu  temu  iz  područja  kolegija  te  je  izložiti  kroz  poster prezentaciju.  Seminarski  rad  pisat  će  se  u  formi  znanstvenog  članka,  na  temelju  provedenog  pregleda literature ili anketnog istraživanja. Vrednovat će se način i kvaliteta obrade zadane teme te usvojeno znanje i razumijevanje teme i terminologije, prema definiranim kriterijima.\n                            Završni ispit nosi udio od najviše 50 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh. Studenti moraju ostvariti najmanje 50% ukupnih bodova iz seminarskog\n                            rada (15 bodova od ukupno 30 za znanstveni članak i 10 bodova od ukupno 20 za poster prezentaciju, što u zbroju čini 25 bodova od ukupnih 50), kako bi ostvarili pravo na upis ocjene.\n                            </p>\n                    </ol>\n                    <h3>Ocjena iz kolegija Završni ispit</h3>\n                    <p>Kontinuiranim radom tijekom semestra na prethodno opisani način studenti mogu ostvariti najviše 50 ocjenskih bodova, a da bi mogli pristupiti završnom ispitu moraju ostvarili 50% i više bodova (najmanje 25 bodova) te zadovoljiti sve prethodno definirane bodovne pragove na nastavnim aktivnostima.\n                    Studenti koji su skupili najmanje 25 ocjenskih bodova te su postigli sve prethodno definirane bodovne pragove na nastavnim aktivnostima, mogu pristupiti završnom ispitu.</p>\n                    <p>Završni ispit nosi udio od najviše 50 ocjenskih bodova, a smatra se položenim samo ako na njemu student postigne minimalno 50%-ni uspjeh (ispitni prag je 50% uspješno izrađenog i obranjenog seminarskog rada).\n                    Ako je završni ispit prolazan, skupljeni bodovi će se pribrojati prethodnima i prema ukupnom rezultatu formirati će se pripadajuća ocjena. U suprotnom, student ima pravo pristupa završnom ispitu još 2 puta (ukupno do 3 puta).</p>\n\n                    <h3>Konačna ocjena</h3>\n                    <p>Donosi se na osnovu zbroja svih bodova prikupljenih tijekom izvođenja nastave prema sljedećoj skali: </p>\n                    <p>\n                        A – 90% - 100%                           (ekvivalent: izvrstan 5)\n                        B – 75% - 89,9%                          (ekvivalent: vrlo dobar 4)\n                        C – 60% - 74,9%                          (ekvivalent: dobar 3)\n                        D – 50% - 59,9%                          (ekvivalent: dovoljan 2)\n                        F –   0% - 49,9%                          (ekvivalent: nedovoljan 1)\n                        Ispričnice za izostanak s nastave\t\t\t\t\t\t\n                        Ispričnicu za opravdani izostanak s nastave potrebno je predati profesoru najkasnije 7 dana nakon izostanka. U suprotnom izostanak se neće opravdati.\t\t\t\t\t\t\n                    </p>\n\n                    <h3>Ispitni rokovi</h3>\n                    <p><b>Redoviti:</b>\n                    9.2.2022.\n                    23.2.2022.\n                    <p>\n                    <p><b>Izvanredni:</b>\n                    29.3.2022.\n                    7.9.2022.\n                    </p>
2	Inteligentni sustavi 1	6	dr. sc. Marina Ivašić-Kos	Kristina Host	IS1	dinps/inf/15/csv/IS1_DINP_2020_2021_.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/IS1_DINP_2020_2021_.pdf	četvrtkom	01:20:00	14:30:00	ponedjeljkom	01:40:00	16:30:00	
29	Opća pedagogija	5	dr. sc. Sofija Vrcelj	Ines Begić	OPED	dinps/inf/15/csv/Opca_pedagogija__20_21.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/Opca_pedagogija__20_21.pdf	utorkom	01:30:00	12:40:00	srijedom	03:45:00	14:15:00	
30	Primjena hipermedije u obrazovanju 1	5	dr. sc. Nataša Hoić-Božić	dr. sc. Nataša Hoić-Božić	HMS1	dinps/inf/15/csv/DINP_HMS1_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/DINP_HMS1_2020_2021.pdf	ponedjeljkom	01:30:00	08:30:00	ponedjeljkom	01:30:00	08:30:00	
48	Kombinatorika (stari program)	5	dr. sc. Marija Maksimović	dr. sc. Marija Maksimović	KOMB	dinps/inf/11/csv/DINP_2020_2021_KOMB.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_KOMB.pdf	četvrtkom	01:30:00	14:15:00	četvrtkom	01:30:00	15:15:00	
31	Razvojna psihologija	5	dr. sc. Sanja Smojver-Ažić	dr.sc. Sanja Bradić, vanjski suradnik	RP	dinps/inf/15/csv/Razvojna_psihologija_20_21.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/Razvojna_psihologija_20_21.pdf	ponedjeljkom	01:30:00	14:15:00	četvrtkom/2	01:40:00	16:30:00	
32	Didaktika 2	4	dr. sc. Vesna Kovač	Petra Berlot	DID2	dinps/inf/15/csv/Didaktika_2_20_21.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/Didaktika_2_20_21.pdf	ponedjeljkom	01:30:00	14:15:00	utorkom/2	03:45:00	16:15:00	
33	Metodika nastave informatike 1	4	dr. sc. Nataša Hoić-Božić	doc. dr. sc. Martina Holenko Dlab	MNI1	dinps/inf/15/csv/DINP_MNI1_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/DINP_MNI1_2020_2021.pdf	ponedjeljkom	01:30:00	10:15:00	ponedjeljkom	01:30:00	10:15:00	
34	Osnove jezične kulture	3	dr. sc. Borana Morić-Mohorovičić	doc. dr. sc. Borana Morić-Mohorovičić	OJK	dinps/inf/15/csv/21.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/NM/OJK_20-21.pdf	petkom	01:30:00	10:15:00	petkom	01:30:00	10:15:00	
36	Programiranje 1	6	dr. sc. Maja Matetić	mag. educ. math. et inf. Dejan Ljubobratović	PROG1	dinps/inf/11/csv/DINP_2020_2021_PROG1.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/1_godina/DINP_2020_2021_PROG1.pdf	srijedom	01:30:00	08:15:00	petkom	03:30:00	12:15:00	
37	Osnove informatike	5	dr. sc. Sanda Martinčić-Ipšić	dr. sc. Slobodan Beliga	OI	dinps/inf/11/csv/DINP_2020_2021_OI.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/1_godina/DINP_2020_2021_OI.pdf	utorkom	01:30:00	12:00:00	petkom	03:30:00	08:00:00	
39	Osnove ekonomike za informatičare	5	dr. sc. Borna Debelić	Gordana Bugarinović	OE	dinps/inf/11/csv/DINP_2020_2021_OE.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/1_godina/DINP_2020_2021_OE.pdf	utorkom	01:30:00	16:15:00	ponedjeljkom	01:30:00	16:15:00	
40	Engleski za potrebe IT struke	4	doc. dr. sc. Lucia Načinović Prskalo	doc. dr. sc. Lucia Načinović Prskalo	ENG	dinps/inf/11/csv/DINP_2020_2021_ENG.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/1_godina/DINP_2020_2021_ENG_v3.pdf	utorkom	01:30:00	14:15:00	petkom	03:30:00	12:15:00	
41	Tjelesni 1	5	Sergio de Privitellio		TZK	dinps/404.csv	https://inf.uniri.hr/404	\N	01:30:00	\N	\N	01:30:00	\N	
42	Matematika 3	5	dr. sc. Marija Maksimović	Matea Zubović	MAT3	dinps/inf/11/csv/DINP_2020_2021_MAT3_v3.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_MAT3_v3.pdf	ponedjeljkom	01:30:00	10:15:00	ponedjeljkom	03:30:00	14:15:00	
43	Analiza poslovnih procesa	5	dr. sc. Mile Pavlić	Rebeka Lerga	APP	dinps/inf/11/csv/DINP_2020_2021_APP.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_APP.pdf	petkom	01:30:00	10:15:00	petkom	01:30:00	12:15:00	
44	Objektno programiranje	5	dr. sc. Marina Ivašić-Kos	doc. dr. sc. Miran Pobar	OP	dinps/inf/11/csv/DINP_2020_2021_OP.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_OP.pdf	utorkom	01:30:00	08:15:00	četvrtkom	03:30:00	10:15:00	
45	Računalne mreže	5	v.pred. dr. sc. Vedran Miletić	v.pred. dr. sc. Vedran Miletić	RM	dinps/inf/11/csv/DINP_2020_2021_RM.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_RM.pdf	utorkom	01:30:00	10:15:00	petkom	03:30:00	14:15:00	
46	Baze podataka	5	dr. sc. Patrizia Poščić	doc. dr. sc. Danijela Jakšić, mag. inf. Kristian Stančin	BP	dinps/inf/11/csv/DINP_2020_2021_BP.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/2_godina/DINP_2020_2021_BP.pdf	ponedjeljkom	01:30:00	08:30:00	četvrtkom	05:30:00	08:00:00	
47	Uvod u programsko inženjerstvo	5	izv. prof. dr. sc. Sanja Čandrlić	doc. dr. sc. Martina Ašenbrener Katić	UPI	dinps/inf/11/csv/DINP_2020_2021_UPI.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_UPI_2020_2021.pdf	ponedjeljkom	01:30:00	12:15:00	utorkom	03:30:00	12:15:00	
49	Dinamičke web aplikacije 1	5	doc. dr. sc. Lucia Načinović Prskalo	doc. dr. sc. Lucia Načinović Prskalo	DWA1	dinps/inf/11/csv/DINP_2020_2021_DWA1.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_DWA1_2020_2021-3.pdf	utorkom	01:30:00	12:15:00	ponedjeljkom	03:30:00	12:15:00	
50	Formalni jezici i jezični procesori 1	5	dr. sc. Sanda Martinčić-Ipšić	Karlo Babić	FJJP1	dinps/inf/11/csv/DINP_FJJP1_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_FJJP1_2020_2021.pdf	srijedom	01:30:00	10:00:00	srijedom	01:30:00	12:00:00	
51	Modeliranje procesa	5	dr. sc. Mile Pavlić	izv. prof. dr. sc. Sanja Čandrlić	MP	dinps/inf/11/csv/DINP_MP_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_MP_2020_2021.pdf	petkom	01:30:00	10:00:00	petkom	01:30:00	10:30:00	
52	Numerička matematika	5	doc. dr. sc. Sanda Bujačić Babić	doc. dr. sc. Sanda Bujačić Babić	NM	dinps/inf/11/csv/DINP_Numericka_matematika_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_Numericka_matematika_2020_2021.pdf	utorkom	01:30:00	08:15:00	utorkom	03:30:00	10:15:00	
54	Logičko programiranje	5	izv. prof. dr. sc. Ana Meštrović	izv. prof. dr. sc. Ana Meštrović	LPR	dinps/inf/11/csv/DINP_LPR_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_LPR_2020_2021.pdf	srijedom	01:30:00	08:15:00	ponedjeljkom	01:30:00	10:15:00	
55	Paralelno programiranje na heterogenim sustavima	5	izv. prof. dr. sc. Božidar Kovačić	v. pred. dr. sc. Vedran Miletić	PPHS	dinps/inf/11/csv/DINP_PPHS_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_PPHS_2020_2021.pdf	srijedom	01:30:00	08:15:00	srijedom	01:30:00	14:15:00	
9	Inteligentni sustavi 2	6	dr. sc. Maja Matetić	mag. educ. math. et inf. Dejan Ljubobratović	IS2	dinps/inf/13/csv/DINP_IS2_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_IS2_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
10	Strateško planiranje informacijskih sustava	6	izv. prof. dr. sc. Sanja Čandrlić	mag. inf. Kristian Stančin	SPIS	dinps/inf/13/csv/DINP_SPIS_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_SPIS_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
11	Multimedijski i hipermedijski sustavi	6	prof. dr. sc. Nataša Hoić-Božić	doc. dr. sc. Vanja Slavuj	MHS	dinps/inf/13/csv/DINP_MHS_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_MHS_2020_2021_v2.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
13	Osnove digitalne obrade govora i slika	6	doc. dr. sc. Miran Pobar	doc. dr. sc. Miran Pobar	ODOGS	dinps/inf/13/csv/DINP_ODOGS_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_ODOGS_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
17	Računalna analiza prirodnog jezika	6	dr. sc. Sanda Martinčić-Ipšić	Karlo Babić	RAPJ	dinps/inf/13/csv/DINP_RAPJ_2019_2020.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/diplomski/1_godina/DINP_RAPJ_2020_2021.pdf	petkom	01:30:00	12:15:00	petkom	01:30:00	14:15:00	
38	Multimedijski sustavi	5	dr. sc. Nataša Hoić-Božić	dr. sc. Slobodan Beliga	MMS	dinps/inf/11/csv/DINP_2020_2021_MMS.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_MMS_2020_2021.pdf	srijedom	01:30:00	14:15:00	srijedom	03:30:00	10:15:00	
53	Objektno orijentirano programiranje	5	dr. sc. Marina Ivašić-Kos	Ivona Franković	OOP	dinps/inf/11/csv/DINP_OOP_2020_2021.csv	https://inf.uniri.hr/images/nastava/izvedbeni/2020_2021/preddiplomski/3_godina/DINP_OOP_2020_2021.pdf	ponedjeljkom	01:30:00	12:00:00	četvrtkom	03:30:00	12:00:00	
\.


--
-- Data for Name: subjects_subjectprograms; Type: TABLE DATA; Schema: public; Owner: tqotyysltnsfmk
--

COPY public.subjects_subjectprograms (id, optional, program_id, subject_id, academic_year, semester, active) FROM stdin;
99	f	14	9	2019	2	f
100	f	14	10	2019	2	f
101	t	14	11	2019	2	f
102	t	14	12	2019	2	f
103	f	14	13	2019	2	f
104	f	14	14	2019	2	f
105	t	14	15	2019	2	f
106	t	14	16	2019	2	f
107	t	14	17	2019	2	f
111	f	14	21	2020	3	f
113	f	14	23	2020	3	f
126	f	13	9	2019	2	f
127	f	13	10	2019	2	f
128	f	13	11	2019	2	f
129	f	13	12	2019	2	f
130	t	13	13	2019	2	f
131	t	13	14	2019	2	f
132	t	13	15	2019	2	f
133	t	13	16	2019	2	f
134	t	13	17	2019	2	f
124	t	13	7	2020	1	f
125	t	13	8	2020	1	f
143	f	13	26	2020	4	f
144	f	13	27	2019	4	f
145	f	15	28	2020	1	f
146	f	15	2	2020	1	f
147	f	15	3	2020	1	f
148	f	15	29	2020	1	f
149	f	15	30	2020	1	f
150	f	15	31	2020	1	f
151	f	15	32	2020	3	f
169	f	11	44	2020	3	f
170	f	11	45	2020	3	f
171	f	11	46	2020	3	f
173	f	11	48	2020	3	f
174	f	11	49	2020	5	f
175	f	11	50	2020	5	f
176	f	11	51	2020	5	f
177	f	11	52	2020	5	f
93	f	14	3	2020	1	f
94	t	14	4	2020	1	f
95	f	14	5	2020	1	f
96	f	14	6	2020	1	f
178	f	11	53	2020	5	f
179	t	11	54	2020	5	f
180	t	11	55	2020	5	f
97	t	14	7	2020	1	f
98	t	14	8	2020	1	f
91	t	14	1	2020	1	f
92	f	14	2	2020	1	f
138	t	13	21	2020	3	f
140	t	13	23	2020	3	f
142	t	13	25	2020	3	f
135	f	13	18	2021	3	t
108	f	14	18	2021	3	t
137	f	13	20	2021	3	t
110	f	14	20	2021	3	t
139	t	13	22	2021	3	t
112	t	14	22	2021	3	t
141	f	13	24	2021	3	t
116	f	14	26	2020	4	f
117	f	14	27	2019	4	f
115	t	14	25	2020	3	f
152	f	15	21	2020	3	f
153	f	15	33	2020	3	f
154	f	15	34	2020	3	f
155	t	15	5	2020	3	f
156	t	15	1	2020	3	f
158	t	15	22	2020	3	f
159	t	15	6	2020	3	f
118	f	13	1	2020	1	f
167	f	11	42	2020	3	f
168	f	11	43	2020	3	f
172	f	11	47	2020	3	f
119	f	13	2	2020	1	f
120	f	13	3	2020	1	f
121	f	13	4	2020	1	f
122	t	13	5	2020	1	f
123	t	13	6	2020	1	f
114	f	14	24	2021	3	t
136	t	13	19	2021	3	t
109	t	14	19	2021	3	t
157	t	15	19	2021	3	t
160	f	11	35	2020	1	f
161	f	11	36	2020	1	f
162	f	11	37	2020	1	f
163	f	11	38	2020	1	f
164	f	11	39	2020	1	f
165	f	11	40	2020	1	f
166	f	11	41	2020	1	f
\.


--
-- Name: accounts_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.accounts_student_id_seq', 29, true);


--
-- Name: accounts_studentsubjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.accounts_studentsubjects_id_seq', 605, true);


--
-- Name: activities_class_globalclassactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.activities_class_globalclassactivity_id_seq', 3401, true);


--
-- Name: activities_class_studentclassactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.activities_class_studentclassactivity_id_seq', 17, true);


--
-- Name: activities_score_globalscoreactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.activities_score_globalscoreactivity_id_seq', 1131, true);


--
-- Name: activities_score_studentscoreactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.activities_score_studentscoreactivity_id_seq', 222, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 31, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 10, true);


--
-- Name: departments_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.departments_program_id_seq', 1, false);


--
-- Name: departments_university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.departments_university_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 11, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 47, true);


--
-- Name: subjects_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.subjects_subject_id_seq', 1, false);


--
-- Name: subjects_subjectprograms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tqotyysltnsfmk
--

SELECT pg_catalog.setval('public.subjects_subjectprograms_id_seq', 180, true);


--
-- Name: accounts_student accounts_student_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_student
    ADD CONSTRAINT accounts_student_pkey PRIMARY KEY (id);


--
-- Name: accounts_student accounts_student_user_id_key; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_student
    ADD CONSTRAINT accounts_student_user_id_key UNIQUE (user_id);


--
-- Name: accounts_studentsubjects accounts_studentsubjects_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_studentsubjects
    ADD CONSTRAINT accounts_studentsubjects_pkey PRIMARY KEY (id);


--
-- Name: accounts_studentsubjects accounts_studentsubjects_student_id_subject_id_ac_82ade270_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_studentsubjects
    ADD CONSTRAINT accounts_studentsubjects_student_id_subject_id_ac_82ade270_uniq UNIQUE (student_id, subject_id, academic_year);


--
-- Name: activities_class_globalclassactivity activities_class_globalclassactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_globalclassactivity
    ADD CONSTRAINT activities_class_globalclassactivity_pkey PRIMARY KEY (id);


--
-- Name: activities_class_studentclassactivity activities_class_studentclassactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_studentclassactivity
    ADD CONSTRAINT activities_class_studentclassactivity_pkey PRIMARY KEY (id);


--
-- Name: activities_score_globalscoreactivity activities_score_globalscoreactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_globalscoreactivity
    ADD CONSTRAINT activities_score_globalscoreactivity_pkey PRIMARY KEY (id);


--
-- Name: activities_score_studentscoreactivity activities_score_studentscoreactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_studentscoreactivity
    ADD CONSTRAINT activities_score_studentscoreactivity_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: departments_department departments_department_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_department
    ADD CONSTRAINT departments_department_pkey PRIMARY KEY (id);


--
-- Name: departments_program departments_program_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_program
    ADD CONSTRAINT departments_program_pkey PRIMARY KEY (id);


--
-- Name: departments_university departments_university_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_university
    ADD CONSTRAINT departments_university_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: subjects_subject subjects_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subject
    ADD CONSTRAINT subjects_subject_pkey PRIMARY KEY (id);


--
-- Name: subjects_subjectprograms subjects_subjectprograms_pkey; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subjectprograms
    ADD CONSTRAINT subjects_subjectprograms_pkey PRIMARY KEY (id);


--
-- Name: subjects_subjectprograms subjects_subjectprograms_subject_id_program_id_ac_25e041a8_uniq; Type: CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subjectprograms
    ADD CONSTRAINT subjects_subjectprograms_subject_id_program_id_ac_25e041a8_uniq UNIQUE (subject_id, program_id, active);


--
-- Name: accounts_student_program_id_cbc959aa; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX accounts_student_program_id_cbc959aa ON public.accounts_student USING btree (program_id);


--
-- Name: accounts_studentsubjects_student_id_9d4aad18; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX accounts_studentsubjects_student_id_9d4aad18 ON public.accounts_studentsubjects USING btree (student_id);


--
-- Name: accounts_studentsubjects_subject_id_b650f83d; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX accounts_studentsubjects_subject_id_b650f83d ON public.accounts_studentsubjects USING btree (subject_id);


--
-- Name: activities_class_globalclassactivity_subject_id_1dc2fce8; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_class_globalclassactivity_subject_id_1dc2fce8 ON public.activities_class_globalclassactivity USING btree (subject_id);


--
-- Name: activities_class_studentcl_global_activity_id_9c5112a0; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_class_studentcl_global_activity_id_9c5112a0 ON public.activities_class_studentclassactivity USING btree (global_activity_id);


--
-- Name: activities_class_studentclassactivity_student_id_695a988e; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_class_studentclassactivity_student_id_695a988e ON public.activities_class_studentclassactivity USING btree (student_id);


--
-- Name: activities_class_studentclassactivity_subject_id_2a7b0737; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_class_studentclassactivity_subject_id_2a7b0737 ON public.activities_class_studentclassactivity USING btree (subject_id);


--
-- Name: activities_score_globalscoreactivity_subject_id_02a7aa18; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_score_globalscoreactivity_subject_id_02a7aa18 ON public.activities_score_globalscoreactivity USING btree (subject_id);


--
-- Name: activities_score_studentsc_global_activity_id_504e1c89; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_score_studentsc_global_activity_id_504e1c89 ON public.activities_score_studentscoreactivity USING btree (global_activity_id);


--
-- Name: activities_score_studentscoreactivity_student_id_43909bd9; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_score_studentscoreactivity_student_id_43909bd9 ON public.activities_score_studentscoreactivity USING btree (student_id);


--
-- Name: activities_score_studentscoreactivity_subject_id_1ed845af; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX activities_score_studentscoreactivity_subject_id_1ed845af ON public.activities_score_studentscoreactivity USING btree (subject_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: departments_department_university_id_6dff4915; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX departments_department_university_id_6dff4915 ON public.departments_department USING btree (university_id);


--
-- Name: departments_program_department_id_a020c817; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX departments_program_department_id_a020c817 ON public.departments_program USING btree (department_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: subjects_subjectprograms_program_id_dcd88854; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX subjects_subjectprograms_program_id_dcd88854 ON public.subjects_subjectprograms USING btree (program_id);


--
-- Name: subjects_subjectprograms_subject_id_4a36d6cd; Type: INDEX; Schema: public; Owner: tqotyysltnsfmk
--

CREATE INDEX subjects_subjectprograms_subject_id_4a36d6cd ON public.subjects_subjectprograms USING btree (subject_id);


--
-- Name: accounts_student accounts_student_program_id_cbc959aa_fk_departments_program_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_student
    ADD CONSTRAINT accounts_student_program_id_cbc959aa_fk_departments_program_id FOREIGN KEY (program_id) REFERENCES public.departments_program(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_student accounts_student_user_id_683c461a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_student
    ADD CONSTRAINT accounts_student_user_id_683c461a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_studentsubjects accounts_studentsubj_student_id_9d4aad18_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_studentsubjects
    ADD CONSTRAINT accounts_studentsubj_student_id_9d4aad18_fk_accounts_ FOREIGN KEY (student_id) REFERENCES public.accounts_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_studentsubjects accounts_studentsubj_subject_id_b650f83d_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.accounts_studentsubjects
    ADD CONSTRAINT accounts_studentsubj_subject_id_b650f83d_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_class_globalclassactivity activities_class_glo_subject_id_1dc2fce8_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_globalclassactivity
    ADD CONSTRAINT activities_class_glo_subject_id_1dc2fce8_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_class_studentclassactivity activities_class_stu_global_activity_id_9c5112a0_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_studentclassactivity
    ADD CONSTRAINT activities_class_stu_global_activity_id_9c5112a0_fk_activitie FOREIGN KEY (global_activity_id) REFERENCES public.activities_class_globalclassactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_class_studentclassactivity activities_class_stu_student_id_695a988e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_studentclassactivity
    ADD CONSTRAINT activities_class_stu_student_id_695a988e_fk_accounts_ FOREIGN KEY (student_id) REFERENCES public.accounts_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_class_studentclassactivity activities_class_stu_subject_id_2a7b0737_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_class_studentclassactivity
    ADD CONSTRAINT activities_class_stu_subject_id_2a7b0737_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_score_globalscoreactivity activities_score_glo_subject_id_02a7aa18_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_globalscoreactivity
    ADD CONSTRAINT activities_score_glo_subject_id_02a7aa18_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_score_studentscoreactivity activities_score_stu_global_activity_id_504e1c89_fk_activitie; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_studentscoreactivity
    ADD CONSTRAINT activities_score_stu_global_activity_id_504e1c89_fk_activitie FOREIGN KEY (global_activity_id) REFERENCES public.activities_score_globalscoreactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_score_studentscoreactivity activities_score_stu_student_id_43909bd9_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_studentscoreactivity
    ADD CONSTRAINT activities_score_stu_student_id_43909bd9_fk_accounts_ FOREIGN KEY (student_id) REFERENCES public.accounts_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: activities_score_studentscoreactivity activities_score_stu_subject_id_1ed845af_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.activities_score_studentscoreactivity
    ADD CONSTRAINT activities_score_stu_subject_id_1ed845af_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: departments_department departments_departme_university_id_6dff4915_fk_departmen; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_department
    ADD CONSTRAINT departments_departme_university_id_6dff4915_fk_departmen FOREIGN KEY (university_id) REFERENCES public.departments_university(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: departments_program departments_program_department_id_a020c817_fk_departmen; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.departments_program
    ADD CONSTRAINT departments_program_department_id_a020c817_fk_departmen FOREIGN KEY (department_id) REFERENCES public.departments_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subjects_subjectprograms subjects_subjectprog_program_id_dcd88854_fk_departmen; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subjectprograms
    ADD CONSTRAINT subjects_subjectprog_program_id_dcd88854_fk_departmen FOREIGN KEY (program_id) REFERENCES public.departments_program(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subjects_subjectprograms subjects_subjectprog_subject_id_4a36d6cd_fk_subjects_; Type: FK CONSTRAINT; Schema: public; Owner: tqotyysltnsfmk
--

ALTER TABLE ONLY public.subjects_subjectprograms
    ADD CONSTRAINT subjects_subjectprog_subject_id_4a36d6cd_fk_subjects_ FOREIGN KEY (subject_id) REFERENCES public.subjects_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA heroku_ext TO tqotyysltnsfmk WITH GRANT OPTION;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: tqotyysltnsfmk
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO tqotyysltnsfmk;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO tqotyysltnsfmk;


--
-- PostgreSQL database dump complete
--

